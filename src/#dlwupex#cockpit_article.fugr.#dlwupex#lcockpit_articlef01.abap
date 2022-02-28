*----------------------------------------------------------------------*
***INCLUDE /DLWUPEX/LCOCKPIT_ARTICLEF01.
*----------------------------------------------------------------------*

*& Form MATERIAL_PRE_READ_RT
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> HMARAKEY
*&      --> SUPPRESS_BUFFER_REFRESH
*&---------------------------------------------------------------------*
FORM material_pre_read_rt  TABLES   t_marakey STRUCTURE bdimarakey
                          USING    p_suppress_rfb LIKE sy-datar.

  DATA: ipre03   LIKE pre03 OCCURS 0 WITH HEADER LINE, "MATNR
        ipre03_s LIKE pre03 OCCURS 0 WITH HEADER LINE,
        ipre01   LIKE pre01 OCCURS 0 WITH HEADER LINE, "MATNR, WERKS
        ipre01_s LIKE pre01 OCCURS 0 WITH HEADER LINE,
        t_mara   LIKE mara  OCCURS 0 WITH HEADER LINE,
        h_mara   LIKE mara  OCCURS 0 WITH HEADER LINE, "Varianten zu SA
        t_marc   LIKE marc  OCCURS 0 WITH HEADER LINE.

  DATA kzrfb LIKE mtcom-kzrfb.
  DATA wambew LIKE mbew OCCURS 0.

  IF p_suppress_rfb IS INITIAL.
    kzrfb = 'X'.
  ELSE.
    CLEAR kzrfb.
  ENDIF.

  REFRESH ipre03[].
  LOOP AT t_marakey.
    ipre03-matnr = t_marakey-matnr.
    APPEND ipre03.
  ENDLOOP.
  ipre03_s[] = ipre03[].

* Prefetch MARA
  CALL FUNCTION 'MARA_ARRAY_READ'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
      mara_tab      = t_mara
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.

  LOOP AT t_mara WHERE attyp = attyp_samm.
*   Varianten-MARA's zum Sammelartikel in den Puffer einlesen
    CALL FUNCTION 'LESEN_VARIANTEN_ZU_SA'
      EXPORTING
        sammelartikel        = t_mara-matnr
        kzrfb                = space  "damit bisher gelesene
      TABLES                        "MARA's erhalten bleiben!
        varianten            = h_mara
      EXCEPTIONS
        enqueue_mode_changed = 1
        lock_on_material     = 2
        lock_system_error    = 3
        wrong_call           = 4
        not_found            = 5
        no_maw1_for_mara     = 6
        lock_on_marc         = 7
        lock_on_mbew         = 8
        error_message        = 9
        OTHERS               = 10.

    LOOP AT h_mara.
      ipre03_s-matnr = h_mara-matnr.
      APPEND ipre03_s.
    ENDLOOP.
*   ENDIF.
  ENDLOOP.

  SORT ipre03_s BY matnr.
* Evtl. wurden schon Varianten aufgrund der Selektionskriterien des
* direkten Sendens ermittelt -> doppelte Varianten herausfiltern
  DELETE ADJACENT DUPLICATES FROM ipre03_s COMPARING matnr.

* Prefetch MAW1
* Hier darf keine Segmentreduzierung geprüft werden, weil die MAW1-Sätze
* auf jeden Fall eingelesen werden müssen, um zu prüfen, ob es sich um
* einen Retailartikel handelt.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MAW1_ARRAY_READ'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.

* Alle Industriematerialien (d.h. es exist. kein MAW1) aus der
* Selektionsliste entfernen (ohne Meldung).
  LOOP AT t_marakey.
    CALL FUNCTION 'MAW1_SINGLE_READ'
      EXPORTING
        matnr         = t_marakey-matnr
*        IMPORTING
*       WMAW1         =
      EXCEPTIONS
        wrong_call    = 1
        not_found     = 2
        error_message = 3
        OTHERS        = 4.
    IF sy-subrc NE 0.
*     Kein MAW1-Satz vorhanden -> Industriematerial liegt vor
*     -> aus den Selektionslisten entfernen
      DELETE t_marakey.
      READ TABLE ipre03_s WITH KEY matnr = t_marakey-matnr.
      IF sy-subrc = 0.
        DELETE ipre03_s INDEX sy-tabix.
      ENDIF.
    ENDIF.
  ENDLOOP.

* Wenn keine Artikel mehr übrigbleiben wird das PRE_READ abgebrochen
  DESCRIBE TABLE t_marakey LINES sy-tfill.
  CHECK sy-tfill > 0.

* Note 1820980
  ipre03[] = ipre03_s[].

  GET BADI gr_badi_fiber_codes_idoc_proc.

  CALL BADI gr_badi_fiber_codes_idoc_proc->preread_textile_components
    EXPORTING
      iv_buffer_refresh = kzrfb
      it_matnr_keys     = ipre03[].

*  Fashion Tables => Pre-read data
  GET BADI go_badi_fsh_idoc_process.

  IF go_badi_fsh_idoc_process IS BOUND.
    CALL BADI go_badi_fsh_idoc_process->preread_fashion_data
      EXPORTING
        iv_buffer_refresh = kzrfb
        it_matnr_keys     = ipre03[].
  ENDIF.

* Prefetch MAKT
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MAKTM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MAKT_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Prefetch MARC
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MARCM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MARC_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
      marc_tab      = t_marc
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

  REFRESH ipre01.
  LOOP AT t_marc.
    ipre01-matnr = t_marc-matnr.
    ipre01-werks = t_marc-werks.
    APPEND ipre01.
  ENDLOOP.
  ipre01_s[] = ipre01[].

* Prefetch MFHM
* ????Wird noch nicht im Retail unterstützt; kein ARRAY-Read möglich
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           message_type = p_message_type
*           segment_type = c_segnam_e1mfhmm
*      IMPORTING
*           active       = active.
* IF active = c_true.
*   ..
* ENDIF.

* Prefetch MPGD
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MPGDM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre01[] = ipre01_s[].
  CALL FUNCTION 'MPGD_ARRAY_READ'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre01        = ipre01
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Prefetch MPOP, MPRW
* ???? Noch kein Array-Read möglich
  IF NOT kzrfb IS INITIAL.
    CALL FUNCTION 'MPOP_REFRESH'.
  ENDIF.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           message_type = p_message_type
*           segment_type = c_segnam_e1mpopm
*      IMPORTING
*           active       = active.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           message_type = p_message_type
*           segment_type = c_segnam_e1mprwm
*      IMPORTING
*           active       = hactive.
* IF active = c_true OR hactive = c_true.
*   ..
* ENDIF.

* Prefetch MVEG, MVEU
* ???? Noch kein Array-Read möglich
  IF NOT kzrfb IS INITIAL.
    CALL FUNCTION 'MVER_REFRESH'.
  ENDIF.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           message_type = p_message_type
*           segment_type = c_segnam_e1mvegm
*      IMPORTING
*           active       = active.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           message_type = p_message_type
*           segment_type = c_segnam_e1mveum
*      IMPORTING
*           active       = hactive.
* IF active = c_true OR hactive = c_true.
*   ..
* ENDIF.

* Prefetch MKAL
* ????Wird noch nicht im Retail unterstützt; kein ARRAY-Read möglich
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           message_type = p_message_type
*           segment_type = c_segnam_e1mkalm
*      IMPORTING
*           active       = active.
* IF active = c_true.
*   ..
* ENDIF.

* Prefetch MARD
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MARDM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre01[] = ipre01_s[].
  CALL FUNCTION 'MARD_ARRAY_GEN_READ_PLANTS'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre01        = ipre01
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Prefetch MARM
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MARMM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MARM_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Prefetch MAMT
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MAMTM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MAMT_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb                = kzrfb
    TABLES
      ipre03               = ipre03
    EXCEPTIONS
      enqueue_mode_changed = 1
      error_message        = 2
      OTHERS               = 3.
* ENDIF.

* Prefetch MEAN
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MEANM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MEAN_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Prefetch MLEA
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MLEAM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MLEA_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Prefetch MALG
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MALGM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
* JH/05.01.00/4.6C Entkopplung der MALG (Anfang)
* MALG-Daten werden nicht mehr über ARTMAS verteilt
* -> zu Testzwecken (z.B. RBDARTST) kann das Aufbauen der MALG
*    im ALE-Ausgang genutzt werden -> FLAG_TESTMODE setzen
*  IF NOT flag_testmode IS INITIAL.
* JH/05.01.00/4.6C Entkopplung der MALG (Ende)
    ipre03[] = ipre03_s[].
    CALL FUNCTION 'MALG_ARRAY_READ_MATNR_ALL'
      EXPORTING
        kzrfb         = kzrfb
      TABLES
        ipre03        = ipre03
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
*  ENDIF.       "JH/05.01.00/4.6C Entkopplung der MALG
* ENDIF.

* Prefetch MLAN
*????Array-read noch nicht möglich
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           message_type = p_message_type
*           segment_type = c_segnam_e1mlanm
*      IMPORTING
*           active       = active.
* IF active = c_true.
*   ..
* ENDIF.

* Prefetch MBEW
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MBEWM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MBEW_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
      mbew_tab      = wambew
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
  IF sy-subrc = 0.
    CALL FUNCTION 'MBEW_EXTEND'
      EXPORTING
        kzrfb    = kzrfb
        maxtz    = ' '
        xvper    = 'X'
        xvvpr    = 'X'
        xvjah    = 'X'
        xvvja    = 'X'
      TABLES
        mbew_tab = wambew.

  ENDIF.
* ENDIF.

* Prefetch MLGN
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MLGNM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MLGN_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
      lhme          = 'X'
    TABLES
      ipre03        = ipre03
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Prefetch MLGT
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MLGTM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MLGT_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Prefetch MVKE
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MVKEM
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'MVKE_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Prefetch WLK2
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = P_MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1WLK2M
*      IMPORTING
*           ACTIVE       = ACTIVE.
* IF ACTIVE = C_TRUE.
  ipre03[] = ipre03_s[].
  CALL FUNCTION 'WLK2_ARRAY_READ_MATNR_ALL'
    EXPORTING
      kzrfb         = kzrfb
    TABLES
      ipre03        = ipre03
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
* ENDIF.

* Langtexte ????
ENDFORM.
*}   INSERT

*{   INSERT         DS1K901359                                        2
*&---------------------------------------------------------------------*
*& Form KEY_TABELLEN_FUELLEN_REQ
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> HMARAKEY_MATNR
*&      --> SPACE
*&      --> P_
*&---------------------------------------------------------------------*
FORM key_tabellen_fuellen_req  USING    p_matnr      LIKE pre03-matnr
                                     p_var_mit_sa LIKE sy-marky
                                     p_bapiuse    LIKE sy-marky.

  IF p_var_mit_sa IS INITIAL.
* parallel >>>>>>>>>>>>>>>>
    IF suppress_progress_indicator = space.
* parallel <<<<<<<<<<<<<<<<

      output_counter = output_counter + 1.
      output_text =
      'IDOC für Material & (& von &) wird gerade erstellt'(001).
      REPLACE '&' WITH p_matnr INTO output_text.
      REPLACE '&' WITH output_counter INTO output_text.
      REPLACE '&' WITH output_total   INTO output_text.
      CONDENSE output_text.
      CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
        EXPORTING
          text = output_text.

* parallel >>>>>>>>>>>>>>>>
    ENDIF.
* parallel <<<<<<<<<<<<<<<<

    CLEAR   ihead_matnr.
    REFRESH tvar_tab.
    CLEAR   tvar_tab.
    REFRESH tmarakey.
    CLEAR   tmarakey.
    REFRESH tauspkey.
    CLEAR   tauspkey.
    REFRESH tmaw1key.
    CLEAR   tmaw1key.
    REFRESH tmaktkey.
    CLEAR   tmaktkey.
    REFRESH tmarckey.
    CLEAR   tmarckey.
    REFRESH tmardkey.
    CLEAR   tmardkey.
    REFRESH tmfhmkey.
    CLEAR   tmfhmkey.
    REFRESH tmpgdkey.
    CLEAR   tmpgdkey.
    REFRESH tmpopkey.
    CLEAR   tmpopkey.
    REFRESH tmprwkey.
    CLEAR   tmprwkey.
    REFRESH tmvegkey.
    CLEAR   tmvegkey.
    REFRESH tmveukey.
    CLEAR   tmveukey.
    REFRESH tmkalkey.
    CLEAR   tmkalkey.
    REFRESH tmarmkey.
    CLEAR   tmarmkey.
    REFRESH tmamtkey.
    CLEAR   tmamtkey.
    REFRESH tmeankey.
    CLEAR   tmeankey.
    REFRESH tmleakey.
    CLEAR   tmleakey.
    REFRESH tmalgkey.
    CLEAR   tmalgkey.
    REFRESH tmbewkey.
    CLEAR   tmbewkey.
    REFRESH tmlgnkey.
    CLEAR   tmlgnkey.
    REFRESH tmlgtkey.
    CLEAR   tmlgtkey.
    REFRESH tmvkekey.
    CLEAR   tmvkekey.
    REFRESH twlk2key.
    CLEAR   twlk2key.
    REFRESH tmlankey.
    CLEAR   tmlankey.
    REFRESH tstxhkey.
    CLEAR   tstxhkey.
  ENDIF.                               "P_VAR_MIT_SA IS INITIAL

  DATA: ignore_sap_read LIKE sy-batch.
  CLEAR ignore_sap_read.

* Objektinstanz erzeugen
  IF artmas_data IS INITIAL.
    CALL METHOD cl_exithandler=>get_instance
      EXPORTING
        exit_name        = 'ARTMAS_DATA_REDUCE'
      IMPORTING
        act_imp_existing = artmas_data_akt
      CHANGING
        instance         = artmas_data
      EXCEPTIONS
        OTHERS           = 9.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
  ENDIF.


*   IHEAD_MATNR belegen
  CALL FUNCTION 'MARA_SINGLE_READ'
    EXPORTING
      matnr         = p_matnr
    IMPORTING
      wmara         = mara
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
  IF sy-subrc = 0.
    IF p_var_mit_sa IS INITIAL.
*       Aufnahme des Artikels in IHEAD_MATNR, falls es sich nicht um
*       eine Variante mit zugeordnetem Sammelartikel handelt.
*       Varianten mit zugeordnetem Sammelartikel werden in TVAR_TAB
*       hinterlegt, um später leichter erkennen zu können, welche
*       Varianten mit dem Sammelartikel zusammen in ein IDOC gehören.
      ihead_matnr = mara-matnr.
    ENDIF.

*     TMARAKEY belegen
*       MARA ist bereits belegt
    tmarakey-msgfn = c_msgfn_r.
    tmarakey-mandt = mara-mandt.
    tmarakey-matnr = mara-matnr.
    APPEND tmarakey.

*   Note 1820980
    GET BADI gr_badi_fiber_codes_idoc_proc.

    CALL BADI gr_badi_fiber_codes_idoc_proc->generate_data_keys_from_buffer
      EXPORTING
        iv_matnr = p_matnr.

*    Fashion Tables  => Generate the keys
    GET BADI go_badi_fsh_idoc_process.

    IF go_badi_fsh_idoc_process IS BOUND.
      CALL BADI go_badi_fsh_idoc_process->generate_data_keys_from_buffer
        EXPORTING
          iv_matnr = p_matnr.
    ENDIF.

*     TAUSPKEY belegen
*     Beim direkten Senden wird aus Performancegründen angenommen, daß
*     der Artikel aus Sicht der Klassifizierung bewertet ist
*     -> TAUSPKEY immer füllen (im MASTERIDOC_CREATE_ARTMAS entscheidet
*        sich dann, ob wirklich Bewertungsdaten vorliegen)
    tauspkey-msgfn = c_msgfn_r.
    tauspkey-mandt = mara-mandt.
    tauspkey-matnr = mara-matnr.
    APPEND tauspkey.

*     TMAW1KEY belegen
    CALL FUNCTION 'MAW1_SINGLE_READ'
      EXPORTING
        matnr         = p_matnr
      IMPORTING
        wmaw1         = maw1
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    IF sy-subrc = 0.
      tmaw1key-msgfn = c_msgfn_r.
      tmaw1key-mandt = maw1-mandt.
      tmaw1key-matnr = maw1-matnr.
      APPEND tmaw1key.
    ENDIF.


*     TMAKTKEY belegen
    IF NOT p_bapiuse IS INITIAL.
      IF NOT artmas_data_akt IS INITIAL.
        CALL METHOD artmas_data->makt_read
          EXPORTING
            matnr           = p_matnr
          IMPORTING
            ignore_sap_read = ignore_sap_read.
      ENDIF.
    ENDIF.
    IF ignore_sap_read IS INITIAL.

      CALL FUNCTION 'MAKT_GENERIC_READ_WITH_MATNR'
        EXPORTING
          matnr         = p_matnr
        TABLES
          makt_tab      = t_makt
        EXCEPTIONS
          error_message = 1
          OTHERS        = 2.
      IF sy-subrc EQ 0.
        LOOP AT t_makt.
          tmaktkey-msgfn = c_msgfn_r.
          tmaktkey-mandt = t_makt-mandt.
          tmaktkey-matnr = t_makt-matnr.
          tmaktkey-spras = t_makt-spras.
          APPEND tmaktkey.
        ENDLOOP.
      ENDIF.
    ENDIF.
    CLEAR ignore_sap_read.


*     TMARCKEY belegen
    IF NOT p_bapiuse IS INITIAL.
      IF NOT artmas_data_akt IS INITIAL.
        CALL METHOD artmas_data->marc_read
          EXPORTING
            matnr           = p_matnr
          IMPORTING
            marc_tab        = t_marc[]
            ignore_sap_read = ignore_sap_read.
      ENDIF.
    ENDIF.
    IF ignore_sap_read IS INITIAL.
      CALL FUNCTION 'MARC_READ_WITH_MATNR'
        EXPORTING
          matnr         = p_matnr
        TABLES
          marc_tab      = t_marc
        EXCEPTIONS
          error_message = 1
          OTHERS        = 2.
    ELSE.                "Note 598078
      sy-subrc = 0.
    ENDIF.
    IF sy-subrc EQ 0.
      LOOP AT t_marc.
        tmarckey-msgfn = c_msgfn_r.
        tmarckey-mandt = t_marc-mandt.
        tmarckey-matnr = t_marc-matnr.
        tmarckey-werks = t_marc-werks.
        APPEND tmarckey.
      ENDLOOP.
    ENDIF.
    CLEAR ignore_sap_read.

*     TMARDKEY belegen
    LOOP AT t_marc.
      IF NOT p_bapiuse IS INITIAL.
        IF NOT artmas_data_akt IS INITIAL.
          CALL METHOD artmas_data->mard_read
            EXPORTING
              matnr           = t_marc-matnr
              werks           = t_marc-werks
            IMPORTING
              mard_tab        = t_mard[]
              ignore_sap_read = ignore_sap_read.
        ENDIF.
      ENDIF.
      IF ignore_sap_read IS INITIAL.

        CALL FUNCTION 'MARD_GENERIC_READ_MATNR_PLANT'
          EXPORTING
            matnr         = t_marc-matnr
            werks         = t_marc-werks
          TABLES
            mard_tab      = t_mard
          EXCEPTIONS
            wrong_call    = 1
            not_found     = 2
            error_message = 3
            OTHERS        = 4.
      ELSE.                "Note 598078
        sy-subrc = 0.
      ENDIF.
      IF sy-subrc EQ 0.
        LOOP AT t_mard.
          tmardkey-msgfn = c_msgfn_r.
          tmardkey-mandt = t_mard-mandt.
          tmardkey-matnr = t_mard-matnr.
          tmardkey-werks = t_mard-werks.
          tmardkey-lgort = t_mard-lgort.
          APPEND tmardkey.
        ENDLOOP.
      ENDIF.
      CLEAR ignore_sap_read.
    ENDLOOP.
*     ENDIF.

    LOOP AT t_marc.
*JH/10.03.98/4.0C/KPr147241 (Anfang)
* Hiermit wird sichergestellt, daß auch beim direkten Senden erkannt
* wird, wenn ein MPGD-Satz gelöscht wurde. Somit wird die Löschung auch
* im empfangenden System durchgeführt.
*         CALL FUNCTION 'MPGD_SINGLE_READ'
*              EXPORTING
*                   MATNR      = T_MARC-MATNR
*                   WERKS      = T_MARC-WERKS
*              IMPORTING
*                   WMPGD      = MPGD
*              EXCEPTIONS
*                   NOT_FOUND     = 1
*                   WRONG_CALL    = 2
*                   ERROR_MESSAGE = 3
*                   OTHERS        = 4.
*         IF SY-SUBRC = 0.
      IF t_marc-pstat CA 'D'.
*JH/10.03.98/4.0C/KPr147241 (Ende)
        tmpgdkey-msgfn = c_msgfn_r.
        tmpgdkey-mandt = sy-mandt.
*JH/10.03.98/4.0C/KPr147241 (Anfang)
*           TMPGDKEY-MATNR = MPGD-MATNR.
*           TMPGDKEY-WERKS = MPGD-WERKS.
        tmpgdkey-matnr = t_marc-matnr.
        tmpgdkey-werks = t_marc-werks.
*JH/10.03.98/4.0C/KPr147241 (Ende)
        APPEND tmpgdkey.
      ENDIF.
    ENDLOOP.
*     ENDIF.

*     TMPOPKEY und TMPRWKEY belegen
*     (über MARC, um ein performanteres Verhalten zu erreichen)
    LOOP AT t_marc.
      IF NOT p_bapiuse IS INITIAL.
        IF NOT artmas_data_akt IS INITIAL.
          CALL METHOD artmas_data->mpop_read
            EXPORTING
              matnr           = t_marc-matnr
              werks           = t_marc-werks
            IMPORTING
              ignore_sap_read = ignore_sap_read.
        ENDIF.
      ENDIF.
      IF ignore_sap_read IS INITIAL.

        CALL FUNCTION 'MPOP_SINGLE_READ'
          EXPORTING
            matnr         = t_marc-matnr
            werks         = t_marc-werks
          IMPORTING
            wmpop         = mpop
          TABLES
            prowf_tab     = thelp_prowfa
          EXCEPTIONS
            not_found     = 1
            wrong_call    = 2
            error_message = 3
            OTHERS        = 4.
        IF sy-subrc = 0.
          tmpopkey-msgfn = c_msgfn_r.
          tmpopkey-mandt = sy-mandt.
          tmpopkey-matnr = mpop-matnr.
          tmpopkey-werks = mpop-werks.
          APPEND tmpopkey.
          LOOP AT thelp_prowfa.
            tmprwkey-mandt = sy-mandt.
            tmprwkey-matnr = mpop-matnr.
            tmprwkey-werks = mpop-werks.
            tmprwkey-ertag = thelp_prowfa-ertag.
            tmprwkey-msgfn = c_msgfn_r.
            APPEND tmprwkey.
          ENDLOOP.                       "THELP_PROWFA
        ENDIF.
      ENDIF.
      CLEAR ignore_sap_read.
    ENDLOOP.                           "T_MARC


*     TMVEGKEY und TMVEUKEY belegen
    LOOP AT t_marc.
      IF NOT p_bapiuse IS INITIAL.
        IF NOT artmas_data_akt IS INITIAL.
          CALL METHOD artmas_data->mver_read
            EXPORTING
              matnr           = t_marc-matnr
              werks           = t_marc-werks
            IMPORTING
              ignore_sap_read = ignore_sap_read.
        ENDIF.
      ENDIF.
      IF ignore_sap_read IS INITIAL.

        CALL FUNCTION 'CONSUMPTION_READ_FOR_MM'
          EXPORTING
            matnr         = t_marc-matnr
            werks         = t_marc-werks
            perkz         = t_marc-perkz
            periv         = t_marc-periv
          TABLES
            ges_verb_tab  = thelp_gesv
            ung_verb_tab  = thelp_ungv
          EXCEPTIONS
            wrong_call    = 1
            not_found     = 2
            error_message = 3
            OTHERS        = 4.
        IF sy-subrc = 0.
          LOOP AT thelp_gesv.
            tmvegkey-mandt = sy-mandt.
            tmvegkey-matnr = t_marc-matnr.
            tmvegkey-werks = t_marc-werks.
            tmvegkey-ertag = thelp_gesv-ertag.
            tmvegkey-msgfn = c_msgfn_r.
            APPEND tmvegkey.
          ENDLOOP.                       "THELP_GESV

          LOOP AT thelp_ungv.
            tmveukey-mandt = sy-mandt.
            tmveukey-matnr = t_marc-matnr.
            tmveukey-werks = t_marc-werks.
            tmveukey-ertag = thelp_ungv-ertag.
            tmveukey-msgfn = c_msgfn_r.
            APPEND tmveukey.
          ENDLOOP.                       "THELP_UNGV
        ENDIF.
      ENDIF.
      CLEAR ignore_sap_read.
    ENDLOOP.                           "T_MARC


*     TMKALKEY belegen
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
*     CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*          EXPORTING
*               MESSAGE_TYPE = MESSAGE_TYPE
*               SEGMENT_TYPE = C_SEGNAM_E1MKALM
*          IMPORTING
*               ACTIVE       = ACTIVE.
*     IF ACTIVE = C_TRUE.
* ????MFHM-Daten im Retail noch nicht unterstützt
*       SELECT * FROM MKAL WHERE MATNR = P_MATNR.
*         TMKALKEY-MSGFN = C_MSGFN_R.
*         TMKALKEY-MANDT = SY-MANDT.
*         TMKALKEY-MATNR = MKAL-MATNR.
*         TMKALKEY-WERKS = MKAL-WERKS.
*         TMKALKEY-VERID = MKAL-VERID.
*         append TMKALKEY.
*       ENDSELECT.
*     ENDIF.

*     TMARMKEY belegen
    CALL FUNCTION 'MARM_GENERIC_READ_WITH_MATNR'
      EXPORTING
        matnr         = p_matnr
      TABLES
        marm_tab      = t_marm
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    IF sy-subrc EQ 0.
      LOOP AT t_marm.
        tmarmkey-msgfn = c_msgfn_r.
        tmarmkey-mandt = t_marm-mandt.
        tmarmkey-matnr = t_marm-matnr.
        tmarmkey-meinh = t_marm-meinh.
        APPEND tmarmkey.
      ENDLOOP.
    ENDIF.

*     TMAMTKEY belegen
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
*     CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*          EXPORTING
*               MESSAGE_TYPE = MESSAGE_TYPE
*               SEGMENT_TYPE = C_SEGNAM_E1MAMTM
*          IMPORTING
*               ACTIVE       = ACTIVE.
*     IF ACTIVE = C_TRUE.
    CALL FUNCTION 'MAMT_GENERIC_READ_WITH_MATNR'
      EXPORTING
        matnr         = p_matnr
      TABLES
        mamt_tab      = t_mamt
      EXCEPTIONS
        wrong_call    = 1
        not_found     = 2
        error_message = 3
        OTHERS        = 4.

    IF sy-subrc EQ 0.
      LOOP AT t_mamt.
        tmamtkey-msgfn = c_msgfn_r.
        tmamtkey-mandt = t_mamt-mandt.
        tmamtkey-matnr = t_mamt-matnr.
        tmamtkey-spras = t_mamt-spras.
        tmamtkey-meinh = t_mamt-meinh.
        tmamtkey-mtxid = t_mamt-mtxid.
        tmamtkey-lfdnr = t_mamt-lfdnr.
        APPEND tmamtkey.
      ENDLOOP.
    ENDIF.
*     ENDIF.

*     TMEANKEY belegen
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
*     CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*          EXPORTING
*               MESSAGE_TYPE = MESSAGE_TYPE
*               SEGMENT_TYPE = C_SEGNAM_E1MEANM
*          IMPORTING
*               ACTIVE       = ACTIVE.
*     IF ACTIVE = C_TRUE.
    CALL FUNCTION 'MEAN_GENERIC_READ_WITH_MATNR'
      EXPORTING
        matnr         = p_matnr
      TABLES
        mean_tab      = t_mean
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    IF sy-subrc EQ 0.
*         Zur Sicherheit sortieren, weil LFDNR durch EAN11 als Key
*         ersetzt wird
      SORT t_mean BY mandt matnr meinh ean11.
      LOOP AT t_mean.
        tmeankey-msgfn = c_msgfn_r.
        tmeankey-mandt = t_mean-mandt.
        tmeankey-matnr = t_mean-matnr.
        tmeankey-meinh = t_mean-meinh.
        tmeankey-ean11 = t_mean-ean11.
        APPEND tmeankey.
      ENDLOOP.
    ENDIF.
*     ENDIF.

*     TMLEAKEY belegen
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
*     CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*          EXPORTING
*               MESSAGE_TYPE = MESSAGE_TYPE
*               SEGMENT_TYPE = C_SEGNAM_E1MLEAM
*          IMPORTING
*               ACTIVE       = ACTIVE.
*     IF ACTIVE = C_TRUE.
    CALL FUNCTION 'MLEA_GENERIC_READ_WITH_MATNR'
      EXPORTING
        matnr         = p_matnr
      TABLES
        mlea_tab      = t_mlea
      EXCEPTIONS
        wrong_call    = 1
        not_found     = 2
        error_message = 3
        OTHERS        = 4.

    IF sy-subrc EQ 0.
*         Zur Sicherheit sortieren, weil LFDNR durch EAN11 als Key
*         ersetzt wird
      SORT t_mlea BY mandt matnr meinh lifnr ean11.
      LOOP AT t_mlea.
        tmleakey-msgfn = c_msgfn_r.
        tmleakey-mandt = t_mlea-mandt.
        tmleakey-matnr = t_mlea-matnr.
        tmleakey-meinh = t_mlea-meinh.
        tmleakey-lifnr = t_mlea-lifnr.
        tmleakey-ean11 = t_mlea-ean11.
        APPEND tmleakey.
      ENDLOOP.
    ENDIF.
*     ENDIF.

*     TMALGKEY belegen
* ????Segmentred. für BAPI's wird zu 4.0A noch nicht vom ALE unterst.
*     CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*          EXPORTING
*               MESSAGE_TYPE = MESSAGE_TYPE
*               SEGMENT_TYPE = C_SEGNAM_E1MALGM
*          IMPORTING
*               ACTIVE       = ACTIVE.
*     IF ACTIVE = C_TRUE.
* JH/05.01.00/4.6C Entkopplung der MALG (Anfang)
* MALG-Daten werden nicht mehr über ARTMAS verteilt
* -> zu Testzwecken (z.B. RBDARTST) kann das Aufbauen der MALG
*    im ALE-Ausgang genutzt werden -> FLAG_TESTMODE setzen
*    IF NOT flag_testmode IS INITIAL.
* JH/05.01.00/4.6C Entkopplung der MALG (Ende)
      CALL FUNCTION 'MALG_GENERIC_READ_WITH_MATNR'
        EXPORTING
          matnr         = p_matnr
        TABLES
          malg_tab      = t_malg
        EXCEPTIONS
          wrong_call    = 1
          not_found     = 2
          error_message = 3
          OTHERS        = 4.

      IF sy-subrc EQ 0.
        LOOP AT t_malg.
          tmalgkey-msgfn = c_msgfn_r.
          tmalgkey-mandt = t_malg-mandt.
          tmalgkey-matnr = t_malg-matnr.
          tmalgkey-meinh = t_malg-meinh.
          tmalgkey-laygr = t_malg-laygr.
          tmalgkey-lmnum = t_malg-lmnum. "JH/4.6C
          APPEND tmalgkey.
        ENDLOOP.
      ENDIF.
*    ENDIF.       "JH/05.01.00/4.6C Entkopplung der MALG
*     ENDIF.

*     TMBEWKEY belegen
    IF NOT p_bapiuse IS INITIAL.
      IF NOT artmas_data_akt IS INITIAL.
        CALL METHOD artmas_data->mbew_read
          EXPORTING
            matnr           = p_matnr
          IMPORTING
            mbew_tab        = t_mbew[]
            ignore_sap_read = ignore_sap_read.
      ENDIF.
    ENDIF.
    IF ignore_sap_read IS INITIAL.

      CALL FUNCTION 'MBEW_READ_WITH_MATNR'
        EXPORTING
          matnr         = p_matnr
        TABLES
          mbew_tab      = t_mbew
        EXCEPTIONS
          error_message = 1
          OTHERS        = 2.
    ENDIF.
    IF NOT t_mbew[] IS INITIAL.
      CALL FUNCTION 'MBEW_EXTEND'
        EXPORTING
          kzrfb    = ' '
          maxtz    = ' '
          xvper    = 'X'
          xvvpr    = 'X'
          xvjah    = 'X'
          xvvja    = 'X'
        TABLES
          mbew_tab = t_mbew.

      LOOP AT t_mbew.
        tmbewkey-msgfn = c_msgfn_r.
        tmbewkey-mandt = t_mbew-mandt.
        tmbewkey-matnr = t_mbew-matnr.
        tmbewkey-bwkey = t_mbew-bwkey.
        tmbewkey-bwtar = t_mbew-bwtar.
        APPEND tmbewkey.
      ENDLOOP.
    ENDIF.
    CLEAR ignore_sap_read.

*     TMLGNKEY belegen
    IF NOT p_bapiuse IS INITIAL.
      IF NOT artmas_data_akt IS INITIAL.
        CALL METHOD artmas_data->mlgn_read
          EXPORTING
            matnr           = p_matnr
          IMPORTING
            ignore_sap_read = ignore_sap_read.
      ENDIF.
    ENDIF.
    IF ignore_sap_read IS INITIAL.

      CALL FUNCTION 'MLGN_READ_WITH_MATNR_AKT_DB'
        EXPORTING
          matnr         = p_matnr
          lhme          = 'X'
        TABLES
          mlgn_akt_tab  = t_mlgn
        EXCEPTIONS
          error_message = 1
          OTHERS        = 2.
      IF sy-subrc EQ 0.
        LOOP AT t_mlgn.
          tmlgnkey-msgfn = c_msgfn_r.
          tmlgnkey-mandt = t_mlgn-mandt.
          tmlgnkey-matnr = t_mlgn-matnr.
          tmlgnkey-lgnum = t_mlgn-lgnum.
          APPEND tmlgnkey.
        ENDLOOP.
      ENDIF.
    ENDIF.
    CLEAR ignore_sap_read.

*     TMLGTKEY belegen
    IF NOT p_bapiuse IS INITIAL.
      IF NOT artmas_data_akt IS INITIAL.
        CALL METHOD artmas_data->mlgt_read
          EXPORTING
            matnr           = p_matnr
          IMPORTING
            ignore_sap_read = ignore_sap_read.
      ENDIF.
    ENDIF.
    IF ignore_sap_read IS INITIAL.

      REFRESH hpre03.
      hpre03-matnr = p_matnr.
      APPEND hpre03.
      CALL FUNCTION 'MLGT_ARRAY_READ_MAT_ALL_BUFFER'
        TABLES
          ipre03   = hpre03
          mlgt_tab = t_mlgt.
      LOOP AT t_mlgt.
        tmlgtkey-msgfn = c_msgfn_r.
        tmlgtkey-mandt = t_mlgt-mandt.
        tmlgtkey-matnr = t_mlgt-matnr.
        tmlgtkey-lgnum = t_mlgt-lgnum.
        tmlgtkey-lgtyp = t_mlgt-lgtyp.
        APPEND tmlgtkey.
      ENDLOOP.
    ENDIF.
    CLEAR ignore_sap_read.

*     TMVKEKEY belegen
    IF NOT p_bapiuse IS INITIAL.
      IF NOT artmas_data_akt IS INITIAL.
        CALL METHOD artmas_data->mvke_read
          EXPORTING
            matnr           = p_matnr
          IMPORTING
            ignore_sap_read = ignore_sap_read.
      ENDIF.
    ENDIF.
    IF ignore_sap_read IS INITIAL.

      CALL FUNCTION 'MVKE_READ_WITH_MATNR'
        EXPORTING
          matnr         = p_matnr
        TABLES
          mvke_tab      = t_mvke
        EXCEPTIONS
          error_message = 1
          OTHERS        = 2.
      IF sy-subrc EQ 0.
        LOOP AT t_mvke.
          tmvkekey-msgfn = c_msgfn_r.
          tmvkekey-mandt = t_mvke-mandt.
          tmvkekey-matnr = t_mvke-matnr.
          tmvkekey-vkorg = t_mvke-vkorg.
          tmvkekey-vtweg = t_mvke-vtweg.
          APPEND tmvkekey.
        ENDLOOP.
      ENDIF.
    ENDIF.
    CLEAR ignore_sap_read.

*     TWLK2KEY belegen
    IF NOT p_bapiuse IS INITIAL.
      IF NOT artmas_data_akt IS INITIAL.
        CALL METHOD artmas_data->wlk2_read
          EXPORTING
            matnr           = p_matnr
          IMPORTING
            ignore_sap_read = ignore_sap_read.
      ENDIF.
    ENDIF.
    IF ignore_sap_read IS INITIAL.

      CALL FUNCTION 'WLK2_READ_WITH_MATNR'
        EXPORTING
          matnr         = p_matnr
        TABLES
          wlk2_tab      = t_wlk2
        EXCEPTIONS
          error_message = 1
          OTHERS        = 2.
      IF sy-subrc EQ 0.
        LOOP AT t_wlk2.
          twlk2key-msgfn = c_msgfn_r.
          twlk2key-mandt = t_wlk2-mandt.
          twlk2key-matnr = t_wlk2-matnr.
          twlk2key-vkorg = t_wlk2-vkorg.
          twlk2key-vtweg = t_wlk2-vtweg.
          twlk2key-werks = t_wlk2-werks.
          APPEND twlk2key.
        ENDLOOP.
      ENDIF.
    ENDIF.
    CLEAR ignore_sap_read.

*     TMLANKEY belegen
    IF NOT p_bapiuse IS INITIAL.
      IF NOT artmas_data_akt IS INITIAL.
        CALL METHOD artmas_data->mlan_read
          EXPORTING
            matnr           = p_matnr
          IMPORTING
            ignore_sap_read = ignore_sap_read.
      ENDIF.
    ENDIF.
    IF ignore_sap_read IS INITIAL.

      REFRESH t_mlan.
      SELECT * FROM mlan INTO TABLE t_mlan
                         WHERE matnr = p_matnr.
      LOOP AT t_mlan.
        tmlankey-msgfn = c_msgfn_r.
        tmlankey-mandt = t_mlan-mandt.
        tmlankey-matnr = t_mlan-matnr.
        tmlankey-aland = t_mlan-aland.
        APPEND tmlankey.
      ENDLOOP.
    ENDIF.
    CLEAR ignore_sap_read.

*     TSTXHKEY belegen
    IF NOT p_bapiuse IS INITIAL.
      IF NOT artmas_data_akt IS INITIAL.
        CALL METHOD artmas_data->longtexts_read
          EXPORTING
            matnr           = p_matnr
          IMPORTING
            ignore_sap_read = ignore_sap_read.
      ENDIF.
    ENDIF.
    IF ignore_sap_read IS INITIAL.

      DESCRIBE FIELD p_matnr LENGTH laenge_matnr IN CHARACTER MODE.

*       TSTXHKEY belegen für das Objekt MATERIAL
*       (mandantenspezifische Langtexte)
      CLEAR itextheader.
      itextheader-tdname = p_matnr.
*       itextheader-tdname+laenge_matnr(1) = '*'. note 200390
      itextheader-tdid = '*'.
      itextheader-tdspras = '*'.
      itextheader-tdobject = 'MATERIAL'.

      CALL FUNCTION 'SELECT_TEXT'
        EXPORTING
          client                  = sy-mandt
          id                      = itextheader-tdid
          language                = itextheader-tdspras
          name                    = itextheader-tdname
          object                  = itextheader-tdobject
        IMPORTING
          entries                 = anz_entries
        TABLES
          selections              = ttextselections
        EXCEPTIONS
          wrong_access_to_archive = 01.

      IF sy-subrc = 0 AND anz_entries > 0.
        LOOP AT ttextselections.
          tstxhkey-msgfn    = c_msgfn_r.
          tstxhkey-mandt    = sy-mandt.
          tstxhkey-tdobject = ttextselections-tdobject.
          tstxhkey-tdname   = ttextselections-tdname.
          tstxhkey-tdid     = ttextselections-tdid.
          tstxhkey-tdspras  = ttextselections-tdspras.
          APPEND tstxhkey.
        ENDLOOP.
      ENDIF.

*       TSTXHKEY belegen für das Objekt MVKE (Verkaufstext)
      CLEAR itextheader.
      itextheader-tdname = p_matnr.
      itextheader-tdname+laenge_matnr(1) = '*'.
      itextheader-tdid = '*'.
      itextheader-tdspras = '*'.
      itextheader-tdobject = 'MVKE'.

      CALL FUNCTION 'SELECT_TEXT'
        EXPORTING
          client                  = sy-mandt
          id                      = itextheader-tdid
          language                = itextheader-tdspras
          name                    = itextheader-tdname
          object                  = itextheader-tdobject
        IMPORTING
          entries                 = anz_entries
        TABLES
          selections              = ttextselections
        EXCEPTIONS
          wrong_access_to_archive = 01.

      IF sy-subrc = 0 AND anz_entries > 0.
        LOOP AT ttextselections.
          tstxhkey-msgfn    = c_msgfn_r.
          tstxhkey-mandt    = sy-mandt.
          tstxhkey-tdobject = ttextselections-tdobject.
          tstxhkey-tdname   = ttextselections-tdname.
          tstxhkey-tdid     = ttextselections-tdid.
          tstxhkey-tdspras  = ttextselections-tdspras.
          APPEND tstxhkey.
        ENDLOOP.
      ENDIF.

*       TSTXHKEY belegen für das Objekt MDTXT (Materialnotiz)
      CLEAR itextheader.
      itextheader-tdname = p_matnr.
      itextheader-tdname+laenge_matnr(1) = '*'.
      itextheader-tdid = '*'.
      itextheader-tdspras = '*'.
      itextheader-tdobject = 'MDTXT'.

      CALL FUNCTION 'SELECT_TEXT'
        EXPORTING
          client                  = sy-mandt
          id                      = itextheader-tdid
          language                = itextheader-tdspras
          name                    = itextheader-tdname
          object                  = itextheader-tdobject
        IMPORTING
          entries                 = anz_entries
        TABLES
          selections              = ttextselections
        EXCEPTIONS
          wrong_access_to_archive = 01.

      IF sy-subrc = 0 AND anz_entries > 0.
        LOOP AT ttextselections.
          tstxhkey-msgfn    = c_msgfn_r.
          tstxhkey-mandt    = sy-mandt.
          tstxhkey-tdobject = ttextselections-tdobject.
          tstxhkey-tdname   = ttextselections-tdname.
          tstxhkey-tdid     = ttextselections-tdid.
          tstxhkey-tdspras  = ttextselections-tdspras.
          APPEND tstxhkey.
        ENDLOOP.
      ENDIF.
    ENDIF.
    CLEAR ignore_sap_read.

  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form KEY_TABELLEN_UEBERGEBEN_REQ
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM key_tabellen_uebergeben_req .
  DATA lt_communication_documents TYPE STANDARD TABLE OF swotobjid. "note 2562064
* Note 359562
  SORT tvar_tab BY matnr.
  SORT tmarakey BY matnr.
  SORT tauspkey BY matnr.
  SORT tmaw1key BY matnr.
  SORT tmaktkey BY matnr spras.
  SORT tmarckey BY matnr werks.
  SORT tmardkey BY matnr werks lgort.
  SORT tmarmkey BY matnr meinh.
  SORT tmamtkey BY matnr spras meinh mtxid lfdnr.
  SORT tmeankey BY matnr meinh ean11.
  SORT tmleakey BY matnr meinh lifnr ean11.
  SORT tmalgkey BY matnr meinh laygr.
  SORT tmvkekey BY matnr vkorg vtweg.
  SORT twlk2key BY matnr vkorg vtweg werks.
  SORT tmlankey BY matnr aland.
  SORT tmbewkey BY matnr bwkey bwtar.
  SORT tmlgnkey BY matnr lgnum.
  SORT tmlgtkey BY matnr lgnum lgtyp.
  SORT tstxhkey BY tdobject tdname tdid tdspras.
  SORT tmfhmkey BY matnr werks.
  SORT tmpgdkey BY matnr werks.
  SORT tmpopkey BY matnr werks.
  SORT tmprwkey BY matnr werks ertag.
  SORT tmvegkey BY matnr werks ertag.
  SORT tmveukey BY matnr werks ertag.
  SORT tmkalkey BY matnr werks verid.

* Wenn Testmodus vorliegt, dann Daten ins Memory stellen anstatt ein
* IDOC zu erzeugen.
* ACHTUNG: das funktioniert nur für einen Artikel pro Aufruf
*  IF flag_testmode = c_true.
*    EXPORT
*      ihead_matnr
*      tvar_tab
*      tmarakey
*      tauspkey
*      tmaw1key
*      tmaktkey
*      tmarckey
*      tmardkey
*      tmarmkey
*      tmamtkey
*      tmeankey
*      tmleakey
*      tmalgkey
*      tmvkekey
*      twlk2key
*      tmlankey
*      tmbewkey
*      tmlgnkey
*      tmlgtkey
*      tstxhkey
*      tmfhmkey
*      tmpgdkey
*      tmpopkey
*      tmprwkey
*      tmvegkey
*      tmveukey
*      tmkalkey
*    TO MEMORY
*    ID 'MGVDATA'.
*    EXIT.
*  ENDIF.

  CALL FUNCTION '/DLWUPEX/FILL_MATERIAL_DATA'
    EXPORTING
      head_matnr              = ihead_matnr
      message_type            = message_type
*     FLAG_TESTMODE           = ' '
      dxwb_call               = dxwb_call    "JH/29.04.99/4.6A
    IMPORTING
      created_comm_idocs      = created_comm_idocs
    TABLES
      var_tab                 = tvar_tab
      marakey                 = tmarakey
      auspkey                 = tauspkey
      maw1key                 = tmaw1key
      maktkey                 = tmaktkey
      marckey                 = tmarckey
      mardkey                 = tmardkey
      marmkey                 = tmarmkey
      mamtkey                 = tmamtkey
      meankey                 = tmeankey
      mleakey                 = tmleakey
      malgkey                 = tmalgkey
      mvkekey                 = tmvkekey
      wlk2key                 = twlk2key
      mlankey                 = tmlankey
      mbewkey                 = tmbewkey
      mlgnkey                 = tmlgnkey
      mlgtkey                 = tmlgtkey
      stxhkey                 = tstxhkey
      mfhmkey                 = tmfhmkey
      mpgdkey                 = tmpgdkey
      mpopkey                 = tmpopkey
      mprwkey                 = tmprwkey
      mvegkey                 = tmvegkey
      mveukey                 = tmveukey
      mkalkey                 = tmkalkey
      communication_documents = lt_communication_documents "note 2562064
    EXCEPTIONS
      OTHERS                  = 1.

  created_c_idocs = created_c_idocs + created_comm_idocs.
  created_m_idocs = created_m_idocs + 1.
  done_since_commit = done_since_commit + 1.
  APPEND LINES OF lt_communication_documents TO tcommunication_documents. "note 2562046

  IF done_since_commit >= c_idocs_before_commit.
    done_since_commit = 0.
    COMMIT WORK.
    CALL FUNCTION 'DEQUEUE_ALL'.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form INIT_ANKREUZLEISTE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM init_ankreuzleiste .
  DATA: len_ankreuz TYPE i,
        len_bapistr TYPE i,
        hindex      LIKE sy-index.

  CLEAR ankreuzleiste.
  DESCRIBE FIELD ankreuzleiste LENGTH len_ankreuz IN CHARACTER MODE.

  DO len_ankreuz TIMES.
    hindex = sy-index - 1.
    ankreuzleiste+hindex(1) = 'X'.
  ENDDO.

* Sicherheitscheck, daß die Länge von ANKREUZLEISTE noch ausreichend
* ist, so daß auch alle Felder mit einem 'X' versehen werden können
* -> Test über BAPI-Struktur BAPIE1MARCRT, weil diese mit Abstand
*    die meisten Felder enthält
  DESCRIBE FIELD tplantdatax LENGTH len_bapistr IN CHARACTER MODE.
  IF len_bapistr > len_ankreuz.
*   Harter Abbruch!
    MESSAGE a536(mg).
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form DATEN_ZU_KEYS_LESEN
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> HEAD_MATNR
*&      --> SPACE
*&---------------------------------------------------------------------*
FORM daten_zu_keys_lesen  USING    p_head_matnr LIKE mara-matnr
                               p_var_mit_sa LIKE sy-marky.

  DATA: hsubrc   LIKE sy-subrc.
  DATA: hwerks   LIKE marc-werks.
  DATA: hmprwkey LIKE bdimprwkey.
  DATA: hmvegkey LIKE bdimvegkey.
  DATA: hmveukey LIKE bdimveukey.
  DATA: wambew LIKE mbew OCCURS 1.
  DATA: htabix   LIKE sy-tabix.      "Note 556406

  DATA: wrkst_len TYPE i.     "JH/23.03.99/4.6A

* Note 1820980
  DATA lt_textile_comp TYPE if_fiber_codes_idoc_process=>t_bapitextlcomps.
  DATA lt_textile_fibr TYPE if_fiber_codes_idoc_process=>t_bapitextlfibrs.

*  Fashion Tables
  DATA lt_sgt_marm     TYPE t_bapisgtmarm.
  DATA lt_sgt_mvke     TYPE t_bapisgtmvke.
  DATA lt_sgt_madka    TYPE t_bapisgtmadka.
  DATA lt_seasons      TYPE t_bapifshseasons.
  DATA lt_sgt_mlgn     TYPE t_bapisgtmlgn.
  DATA lt_sgt_mlgt     TYPE t_bapisgtmlgt.
*SDIMP change start I069729
  DATA lt_sgt_mrpgn    TYPE t_bapisgtmrpgn.
  DATA lt_sgt_mrp      TYPE t_bapisgtmrp.
*SDIMP change end I069729

  IF p_var_mit_sa IS INITIAL.
*   Refresh der int. Tabellen, wenn keine Variante mit zugeordnetem
*   Sammelartikel im Zugriff ist
    CLEAR    set_mprof.
    CLEAR    iheaddata.
    CLEAR    tclientdata.
    REFRESH  tclientdata.
    CLEAR    tclientdatax.
    REFRESH  tclientdatax.
    CLEAR    taddnlclientdata.
    REFRESH  taddnlclientdata.
    CLEAR    taddnlclientdatax.
    REFRESH  taddnlclientdatax.
    CLEAR    tmaterialdescription.
    REFRESH  tmaterialdescription.
*#  CLEAR    TMATERIALDESCRIPTIONX.
*#  REFRESH  TMATERIALDESCRIPTIONX.
    CLEAR    tplantdata.
    REFRESH  tplantdata.
    CLEAR    tplantdatax.
    REFRESH  tplantdatax.
    CLEAR    tforecastparameters.
    REFRESH  tforecastparameters.
    CLEAR    tforecastparametersx.
    REFRESH  tforecastparametersx.
    CLEAR    tforecastvalues.
    REFRESH  tforecastvalues.
*#  CLEAR    TFORECASTVALUESX.
*#  REFRESH  TFORECASTVALUESX.
    CLEAR    ttotalconsumption.
    REFRESH  ttotalconsumption.
*#  CLEAR    TTOTALCONSUMPTIONX.
*#  REFRESH  TTOTALCONSUMPTIONX.
    CLEAR    tunplndconsumption.
    REFRESH  tunplndconsumption.
*#  CLEAR    TUNPLNDCONSUMPTIONX.
*#  REFRESH  TUNPLNDCONSUMPTIONX.
    CLEAR    tplanningdata.
    REFRESH  tplanningdata.
    CLEAR    tplanningdatax.
    REFRESH  tplanningdatax.
    CLEAR    tstoragelocationdata.
    REFRESH  tstoragelocationdata.
    CLEAR    tstoragelocationdatax.
    REFRESH  tstoragelocationdatax.
    CLEAR    tunitsofmeasure.
    REFRESH  tunitsofmeasure.
    CLEAR    tunitsofmeasurex.
    REFRESH  tunitsofmeasurex.
    CLEAR    tunitofmeasuretexts.
    REFRESH  tunitofmeasuretexts.
*#  CLEAR    TUNITOFMEASURETEXTSX.
*#  REFRESH  TUNITOFMEASURETEXTSX.
    CLEAR    tinternationalartnos.
    REFRESH  tinternationalartnos.
*#  CLEAR    TINTERNATIONALARTNOSX.
*#  REFRESH  TINTERNATIONALARTNOSX.
    CLEAR    tvendorean.
    REFRESH  tvendorean.
*#  CLEAR    TVENDOREANX.
*#  REFRESH  TVENDOREANX.
    CLEAR    tlayoutmoduleassgmt.
    REFRESH  tlayoutmoduleassgmt.
    CLEAR    tlayoutmoduleassgmtx.  "JH/4.0C
    REFRESH  tlayoutmoduleassgmtx.  "JH/4.0C
    CLEAR    ttaxclassifications.
    REFRESH  ttaxclassifications.
*#  CLEAR    TTAXCLASSIFICATIONSX.
*#  REFRESH  TTAXCLASSIFICATIONSX.
    CLEAR    tvaluationdata.
    REFRESH  tvaluationdata.
    CLEAR    tvaluationdatax.
    REFRESH  tvaluationdatax.
    CLEAR    twarehousenumberdata.
    REFRESH  twarehousenumberdata.
    CLEAR    twarehousenumberdatax.
    REFRESH  twarehousenumberdatax.
    CLEAR    tstoragetypedata.
    REFRESH  tstoragetypedata.
    CLEAR    tstoragetypedatax.
    REFRESH  tstoragetypedatax.
    CLEAR    tsalesdata.
    REFRESH  tsalesdata.
    CLEAR    tsalesdatax.
    REFRESH  tsalesdatax.
    CLEAR    tposdata.
    REFRESH  tposdata.
    CLEAR    tposdatax.
    REFRESH  tposdatax.
    CLEAR    tmateriallongtext.
    REFRESH  tmateriallongtext.
*#  CLEAR    TMATERIALLONGTEXTX.
*#  REFRESH  TMATERIALLONGTEXTX.
    CLEAR    tcharacteristicvalue.
    REFRESH  tcharacteristicvalue.
    CLEAR    tcharacteristicvaluex.
    REFRESH  tcharacteristicvaluex.
    CLEAR    tvariantskeys.
    REFRESH  tvariantskeys.
    CLEAR    tplantkeys.
    REFRESH  tplantkeys.
    CLEAR    tstoragelocationkeys.
    REFRESH  tstoragelocationkeys.
    CLEAR    tdistrchainkeys.
    REFRESH  tdistrchainkeys.
    CLEAR    twarehousenokeys.
    REFRESH  twarehousenokeys.
    CLEAR    tstoragetypekeys.
    REFRESH  tstoragetypekeys.
    CLEAR    tvaluationtypekeys.
    REFRESH  tvaluationtypekeys.
*   JH/22.04.98/4.0C Strukturen f. Userexit (Anfang)
    CLEAR    tclientext.
    REFRESH  tclientext.
    CLEAR    tclientextx.
    REFRESH  tclientextx.
    CLEAR    tplantext.
    REFRESH  tplantext.
    CLEAR    tplantextx.
    REFRESH  tplantextx.
    CLEAR    tstoragelocationext.
    REFRESH  tstoragelocationext.
    CLEAR    tstoragelocationextx.
    REFRESH  tstoragelocationextx.
    CLEAR    tvaluationext.
    REFRESH  tvaluationext.
    CLEAR    tvaluationextx.
    REFRESH  tvaluationextx.
    CLEAR    twarehousenumberext.
    REFRESH  twarehousenumberext.
    CLEAR    twarehousenumberextx.
    REFRESH  twarehousenumberextx.
    CLEAR    tstoragetypeext.
    REFRESH  tstoragetypeext.
    CLEAR    tstoragetypeextx.
    REFRESH  tstoragetypeextx.
    CLEAR    tsalesext.
    REFRESH  tsalesext.
    CLEAR    tsalesextx.
    REFRESH  tsalesextx.
    CLEAR    tposext.
    REFRESH  tposext.
    CLEAR    tposextx.
    REFRESH  tposextx.
*   JH/22.04.98/4.0C Strukturen f. Userexit (Ende)
*   REFRESH  TMATERIAL.
    REFRESH  tmatl_type.
    REFRESH  tmatl_group.
    REFRESH  tmatl_cat.
    REFRESH  tplant.
    REFRESH  tval_area.
    REFRESH  tlangu.
*   Note 1820980
    CLEAR   gt_textile_comp.
    REFRESH gt_textile_comp.
    CLEAR   gt_textile_fibr.
    REFRESH gt_textile_fibr.

*    Fashion Tables
    CLEAR   gt_sgt_mvke.
    REFRESH gt_sgt_mvke.
    CLEAR   gt_sgt_marm.
    REFRESH gt_sgt_marm.
    CLEAR   gt_sgt_madka.
    REFRESH gt_sgt_madka.
    CLEAR   gt_seasons.
    REFRESH gt_seasons.
    CLEAR   gt_sgt_mlgn.
    REFRESH gt_sgt_mlgn.
    CLEAR   gt_sgt_mlgt.
    REFRESH gt_sgt_mlgt.
    CLEAR   gt_sgt_mrpgn.
    REFRESH gt_sgt_mrpgn.
*SDIMP change start I069729
    CLEAR   gt_sgt_mrp.
    REFRESH gt_sgt_mrp.
*SDIMP change end I069729
  ENDIF.

* MARA-Daten
  CLEAR mara.
* MARA-Daten immer lesen (wegen Belegung von IHEADDATA) auch wenn kein
* MARAKEY vorliegt
  CALL FUNCTION 'MARA_SINGLE_READ'
    EXPORTING
      matnr         = p_head_matnr
    IMPORTING
      wmara         = mara
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
  IF sy-subrc = 0.
    READ TABLE marakey WITH KEY mandt = sy-mandt
                                matnr = p_head_matnr
                       BINARY SEARCH.
    IF sy-subrc = 0.
      CLEAR tclientdata.
      CALL FUNCTION 'MAP2E_MARA_TO_BAPIE1MARART'
        EXPORTING
          mara         = mara
        CHANGING
          bapie1marart = tclientdata
        EXCEPTIONS
          OTHERS       = 0.

*JH/23.03.99/4.6A (Anfang)
* Sonderlogik wg. Verlängerung der Domäne WRKST von 14 auf 48 Stellen
* -> ab 4.6A wird MARA-WRKST im Feld CLIENTDATA-BASIC_MATL_NEW
*    hinterlegt und wenn es nicht länger als 14 Stellen ist auch im
*    alten Feld CLIENTDATA-BASIC_MATL
      wrkst_len = strlen( mara-wrkst ).
      IF wrkst_len <= 14.
        tclientdata-basic_matl = mara-wrkst.
      ENDIF.
*JH/23.03.99/4.6A (Ende)

      tclientdata-function = marakey-msgfn.

** start_EoP_adaptation
** Read back internal guideline note 1998910 before starting delivering a correction
      IF NOT cl_vs_switch_check=>cmd_vmd_cvp_ilm_sfw_01( ) IS INITIAL.
        INCLUDE erp_cvp_mm_i3_c_trx0020 IF FOUND.
      ENDIF.
** end_EoP_adaptation

      APPEND tclientdata.

*     Ankreuzleiste belegen
      CLEAR tclientdatax.
*     Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tclientdatax = ankreuzleiste.                         "#EC ENHOK
*     Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tclientdatax-function = tclientdata-function.
      tclientdatax-material_long = tclientdata-material_long.  "MFLE
      tclientdatax-material = tclientdata-material.
      CLEAR tclientdatax-material_external.                    "DIMP activation
      CLEAR tclientdatax-material_guid.                        "DIMP activation
      CLEAR tclientdatax-material_version.                     "DIMP activation
      APPEND tclientdatax.

*   .....Reduce fields for the segment    ????
*   CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*        EXPORTING
*             MESSAGE_TYPE = MESSAGE_TYPE
*             SEGMENT_TYPE = C_SEGNAM_E1MARAM
*             SEGMENT_DATA = T_IDOC_DATA-SDATA
*        IMPORTING
*             SEGMENT_DATA = T_IDOC_DATA-SDATA.
*   APPEND T_IDOC_DATA.

*   JH/22.04.98/4.0C (Anfang)
*   Userexit zur Übergabe von kundeneigenen Feldern
      CALL CUSTOMER-FUNCTION '003'
        EXPORTING
          message_type   = message_type
          parameter_name = c_parnam_clientext
          f_mara         = mara
        TABLES
          t_clientext    = tclientext
          t_clientextx   = tclientextx.
*   JH/22.04.98/4.0C (Ende)

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = tclientdata-material_long.
        APPEND tmaterial.
      ENDIF.
    ENDIF.

*   AUSP-Daten
    READ TABLE auspkey WITH KEY mandt = sy-mandt
                                matnr = p_head_matnr
                       BINARY SEARCH.
    IF sy-subrc = 0.
      IF p_var_mit_sa IS INITIAL.
*       Bewertungsdaten zum Einzelartikel/Sammelartikel/Variante ohne
*       zugeordneten Sammelartikel lesen
*       (Bewertungsdaten der Varianten mit zugeordnetem Sammelartikel
*       werden vorher schon mit einem ARRAY-Zugriff ermittelt)
        PERFORM art_bewertung_lesen CHANGING mara.
      ENDIF.

*     TCHARACTERISTICVALUE u. TCHARACTERISTICVALUEX belegen
      PERFORM bewertung_uebernehmen USING auspkey mara.

      IF cl_check_mm4x_genart_new=>check_setget_parameter( ) = abap_false.
        IF mara-attyp = attyp_samm.                        "note 367970
*         Merkmalseinschränkung für die informativen Merkmale des
*         Sammelartikels in TCHARACTERISTICVALUE hinterlegen
          PERFORM einschraenkung_uebernehmen USING auspkey mara.
        ENDIF.
      ENDIF.

      IF NOT p_var_mit_sa IS INITIAL.
*       Bei Varianten auch die VAR-Keytabelle füllen
        CLEAR ivarky.
        ivarky-matnr = mara-satnr.
        ivarky-vatnr = p_head_matnr.

        CLEAR tvariantskeys.
        CALL FUNCTION 'MAP2E_SVARKY_TO_BAPIE1VARKEY'
          EXPORTING
            svarky       = ivarky
          CHANGING
            bapie1varkey = tvariantskeys
          EXCEPTIONS
            OTHERS       = 0.
        tvariantskeys-function = c_msgfn_r.
        APPEND tvariantskeys.
      ENDIF.
    ENDIF.
  ENDIF.

* Wenn kein MARA-Satz auf der DB gefunden wurde, kann man abbrechen!
  CHECK NOT mara IS INITIAL.

* Note 1820980
  GET BADI gr_badi_fiber_codes_idoc_proc.

  CALL BADI gr_badi_fiber_codes_idoc_proc->fill_textile_components_data
    EXPORTING
      iv_matnr        = p_head_matnr
    IMPORTING
      et_textile_comp = lt_textile_comp
      et_textile_fibr = lt_textile_fibr.
  APPEND LINES OF lt_textile_comp TO gt_textile_comp.
  APPEND LINES OF lt_textile_fibr TO gt_textile_fibr.

  IF  NOT filtobj_relev-material IS INITIAL
  AND ( lt_textile_comp IS NOT INITIAL OR
        lt_textile_fibr IS NOT INITIAL    ).
    tmaterial = p_head_matnr.
    APPEND tmaterial.
  ENDIF.

*    Fetch Fashion Tables.
  GET BADI go_badi_fsh_idoc_process.

  IF go_badi_fsh_idoc_process IS BOUND.
    CALL BADI go_badi_fsh_idoc_process->fill_fashion_data
      EXPORTING
        iv_matnr          = p_head_matnr
      CHANGING
        ct_bapisgtmarm    = lt_sgt_marm
        ct_bapisgtmvke    = lt_sgt_mvke
        ct_bapisgtmadka   = lt_sgt_madka
        ct_bapifshseasons = lt_seasons
        ct_bapisgtmlgn    = lt_sgt_mlgn
        ct_bapisgtmlgt    = lt_sgt_mlgt
*SDIMP change start I069729
        ct_bapisgtmrpgn   = lt_sgt_mrpgn
        ct_bapisgtmrp     = lt_sgt_mrp.
*SDIMP change end I069729

    IF lt_sgt_marm IS NOT INITIAL.
      APPEND LINES OF lt_sgt_marm  TO gt_sgt_marm.
    ENDIF.
    IF lt_sgt_mvke IS NOT INITIAL.
      APPEND LINES OF lt_sgt_mvke  TO gt_sgt_mvke.
    ENDIF.
    IF lt_sgt_madka IS NOT INITIAL.
      APPEND LINES OF lt_sgt_madka TO gt_sgt_madka.
    ENDIF.
    IF lt_seasons IS NOT INITIAL.
      APPEND LINES OF lt_seasons   TO gt_seasons.
    ENDIF.
    IF lt_sgt_mlgn IS NOT INITIAL.
      APPEND LINES OF lt_sgt_mlgn  TO gt_sgt_mlgn.
    ENDIF.
    IF lt_sgt_mlgt IS NOT INITIAL.
      APPEND LINES OF lt_sgt_mlgt  TO gt_sgt_mlgt.
    ENDIF.
*SDIMP change start I069729
    IF lt_sgt_mrpgn IS NOT INITIAL.
      APPEND LINES OF lt_sgt_mrpgn TO gt_sgt_mrpgn.
    ENDIF.
    IF lt_sgt_mrp   IS NOT INITIAL.
      APPEND LINES OF lt_sgt_mrp   TO gt_sgt_mrp.
    ENDIF.
*SDIMP change end I069729
  ENDIF.

* MAW1-Daten
  CLEAR maw1.
* MAW1-Daten immer lesen (wegen Belegung von IHEADDATA) auch wenn kein
* MAW1KEY vorliegt
  CALL FUNCTION 'MAW1_SINGLE_READ'
    EXPORTING
      matnr         = p_head_matnr
    IMPORTING
      wmaw1         = maw1
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
  IF sy-subrc = 0.
    READ TABLE maw1key WITH KEY mandt = sy-mandt
                                matnr = p_head_matnr
                       BINARY SEARCH.
    IF sy-subrc = 0.
      CLEAR taddnlclientdata.
      CALL FUNCTION 'MAP2E_MAW1_TO_BAPIE1MAW1RT'
        EXPORTING
          maw1         = maw1
        CHANGING
          bapie1maw1rt = taddnlclientdata
        EXCEPTIONS
          OTHERS       = 0.

      taddnlclientdata-function = maw1key-msgfn.
      APPEND taddnlclientdata.

*     Ankreuzleiste belegen
      CLEAR taddnlclientdatax.
*     Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      taddnlclientdatax = ankreuzleiste.
*     Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      taddnlclientdatax-function = taddnlclientdata-function.
      taddnlclientdatax-material_long = taddnlclientdata-material_long.    "MFLE
      taddnlclientdatax-material = taddnlclientdata-material.
      CLEAR taddnlclientdatax-material_external.                           "DIMP activation
      CLEAR taddnlclientdatax-material_guid.                               "DIMP activation
      CLEAR taddnlclientdatax-material_version.                            "DIMP activation
      APPEND taddnlclientdatax.

*   .....Reduce fields for the segment    ????
*   CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*        EXPORTING
*             MESSAGE_TYPE = MESSAGE_TYPE
*             SEGMENT_TYPE = C_SEGNAM_E1MAw1M
*             SEGMENT_DATA = T_IDOC_DATA-SDATA
*        IMPORTING
*             SEGMENT_DATA = T_IDOC_DATA-SDATA.
*   APPEND T_IDOC_DATA.

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = taddnlclientdata-material_long.
        APPEND tmaterial.
      ENDIF.
    ENDIF.
  ENDIF.

  IF p_var_mit_sa IS INITIAL.
*   Kopfdaten belegen (nicht bei Variante mit zugeordnetem Sammelart.)
*   Muß nach dem Belegen der Bewertungsdaten (AUSP) erfolgen, weil
*   erst dann SET_MPROF gesetzt ist
*   MARA und MAW1 sind bereits belegt
    IF  ( NOT maw1 IS INITIAL )
    AND ( NOT mara IS INITIAL ).
      iheaddata-material_long = mara-matnr.
      iheaddata-matl_type   = mara-mtart.
      iheaddata-matl_group  = mara-matkl.
      iheaddata-matl_cat    = mara-attyp.
      iheaddata-config_class_name = gv_config_class.
      iheaddata-config_class_type = gv_config_klart.
      IF NOT set_mprof IS INITIAL.
        iheaddata-char_prof = wg_class.
      ENDIF.
      IF maw1-wpsta CA rt_status_g.
        iheaddata-basic_view = 'X'.
      ENDIF.
      IF maw1-wpsta CA rt_status_l.
        iheaddata-list_view = 'X'.
      ENDIF.
      IF maw1-wpsta CA rt_status_v.
        iheaddata-sales_view = 'X'.
      ENDIF.
      IF maw1-wpsta CA rt_status_z.
        iheaddata-logdc_view = 'X'.
      ENDIF.
      IF maw1-wpsta CA rt_status_f.
        iheaddata-logst_view = 'X'.
      ENDIF.
      IF maw1-wpsta CA rt_status_p.
        iheaddata-pos_view = 'X'.
      ENDIF.

*       Filterwerte festhalten
      IF NOT filtobj_relev-matl_type IS INITIAL.
        tmatl_type = iheaddata-matl_type.
        APPEND tmatl_type.
      ENDIF.
      IF NOT filtobj_relev-matl_group IS INITIAL.
        tmatl_group = iheaddata-matl_group.
        APPEND tmatl_group.
      ENDIF.
      IF NOT filtobj_relev-matl_cat IS INITIAL.
        tmatl_cat = iheaddata-matl_cat.
        APPEND tmatl_cat.
      ENDIF.
    ENDIF.
  ENDIF.

* MAKT-Daten
  LOOP AT maktkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MAKT_SINGLE_READ'
      EXPORTING
        matnr         = maktkey-matnr
        spras         = maktkey-spras
      IMPORTING
        wmakt         = makt
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    hsubrc = sy-subrc.
    IF sy-subrc NE 0.
*     Kurztext wurde gelöscht -> nur Keys belegen
      CLEAR makt.
      MOVE-CORRESPONDING maktkey TO makt.
*     Sicherstellen, daß Löschcode in MSGFN steht (denn abhängig von
*     der Verarbeitungsreihenfolge kann in MAKTKEY-MSGFN auch ein
*     anderer Code stehen, wenn z.B. ein Kurztext angelegt und
*     kurz darauf gelöscht wurde)
      maktkey-msgfn = c_msgfn_d.
    ELSE.
*     Sicherstellen, daß kein Löschcode in MSGFN steht (denn abhängig
*     von der Verarbeitungsreihenfolge kann in MAKTKEY-MSGFN auch ein
*     Löschcode stehen, wenn z.B. ein Kurztext gelöscht und kurz
*     darauf wieder angelegt wurde)
      maktkey-msgfn = c_msgfn_r.
    ENDIF.

    CLEAR tmaterialdescription.
    CALL FUNCTION 'MAP2E_MAKT_TO_BAPIE1MAKTRT'
      EXPORTING
        makt         = makt
      CHANGING
        bapie1maktrt = tmaterialdescription
      EXCEPTIONS
        OTHERS       = 0.

    tmaterialdescription-function = maktkey-msgfn.
    APPEND tmaterialdescription.

*   Anmerkung: Keine Ankreuzleiste unterstützt
*   -> Coding dazu auskommentiert! (siehe '*#')
*#  IF HSUBRC = 0.
*     Ankreuzleiste belegen, falls keine Löschung vorliegt
*#    CLEAR TMATERIALDESCRIPTIONX.
*     Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
*#    TMATERIALDESCRIPTIONX = ANKREUZLEISTE.
*     Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*#    TMATERIALDESCRIPTIONX-FUNCTION  = TMATERIALDESCRIPTION-FUNCTION.
*#    TMATERIALDESCRIPTIONX-MATERIAL  = TMATERIALDESCRIPTION-MATERIAL.
*#    TMATERIALDESCRIPTIONX-LANGU     = TMATERIALDESCRIPTION-LANGU.
*#    TMATERIALDESCRIPTIONX-LANGU_ISO = TMATERIALDESCRIPTION-LANGU_ISO.
*#    APPEND TMATERIALDESCRIPTIONX.
*#  ENDIF.
*     .....Reduce fields for the segment
*     CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*          EXPORTING
*               MESSAGE_TYPE = MESSAGE_TYPE
*               SEGMENT_TYPE = C_SEGNAM_E1MAKTM
*               SEGMENT_DATA = T_IDOC_DATA-SDATA
*          IMPORTING
*               SEGMENT_DATA = T_IDOC_DATA-SDATA.
*     APPEND T_IDOC_DATA.

*   Filterwerte festhalten
*   Note 595027
    IF NOT filtobj_relev-material IS INITIAL.
      tmaterial = tmaterialdescription-material_long.
      APPEND tmaterial.
    ENDIF.
    IF NOT filtobj_relev-langu IS INITIAL.
      tlangu = tmaterialdescription-langu.
      APPEND tlangu.
    ENDIF.
  ENDLOOP.                             "MAKTKEY

* MARC-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MARCM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT marckey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MARC_SINGLE_READ'
      EXPORTING
        matnr         = marckey-matnr
        werks         = marckey-werks
      IMPORTING
        wmarc         = marc
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    IF sy-subrc = 0.
      CALL FUNCTION 'T001W_SINGLE_READ'
        EXPORTING
          t001w_werks = marc-werks
        IMPORTING
          wt001w      = it001w
        EXCEPTIONS
          not_found   = 1
          OTHERS      = 2.

      IF sy-subrc = 0.
        CALL FUNCTION 'T001K_SINGLE_READ'
          EXPORTING
            bwkey      = it001w-bwkey
          IMPORTING
            wt001k     = it001k
          EXCEPTIONS
            not_found  = 1
            wrong_call = 2
            OTHERS     = 3.

        IF sy-subrc = 0.
          CALL FUNCTION 'T001_SINGLE_READ'
            EXPORTING
              bukrs      = it001k-bukrs
            IMPORTING
              wt001      = it001
            EXCEPTIONS
              not_found  = 1
              wrong_call = 2
              OTHERS     = 3.

        ENDIF.
      ENDIF.

      CLEAR tplantdata.
      CALL FUNCTION 'MAP2E_MARC_TO_BAPIE1MARCRT'
        EXPORTING
          marc         = marc
          currency     = it001-waers
        CHANGING
          bapie1marcrt = tplantdata
        EXCEPTIONS
          OTHERS       = 0.

* JH/17.04.98/4.0C (Anfang)
* Sonderlogik, da Domäne von MARC-PRENO von PRENO auf PRENN geändert
* wurde (eigentlich eine inkompatible Änderung!)
* -> ab 4.0C wird MARC-PRENO im Feld PLANTDATA-EX_CERT_NO_NEW
*    hinterlegt und falls der Wert rein numerisch ist auch im
*    alten Feld PLANTDATA-EX_CERT_NO
      IF tplantdata-ex_cert_no_new CO '0123456789'.
        tplantdata-ex_cert_no = tplantdata-ex_cert_no_new.
      ENDIF.
* JH/17.04.98/4.0C (Ende)

      tplantdata-function = marckey-msgfn.
      APPEND tplantdata.

*       Ankreuzleiste belegen
      CLEAR tplantdatax.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tplantdatax = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tplantdatax-function  = tplantdata-function.
      tplantdatax-material_long  = tplantdata-material_long.   "MFLE
      tplantdatax-material  = tplantdata-material.
      tplantdatax-plant     = tplantdata-plant.
      CLEAR tplantdatax-material_external.                     "DIMP activation
      CLEAR tplantdatax-material_guid.                         "DIMP activation
      CLEAR tplantdatax-material_version.                      "DIMP activation
      APPEND tplantdatax.
*       .....Reduce fields for the segment
*       CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*            EXPORTING
*                 MESSAGE_TYPE = MESSAGE_TYPE
*                 SEGMENT_TYPE = C_SEGNAM_E1MARCM
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA
*            IMPORTING
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA.
*       APPEND T_IDOC_DATA.

*     JH/22.04.98/4.0C (Anfang)
*     Userexit zur Übergabe von kundeneigenen Feldern
      CALL CUSTOMER-FUNCTION '003'
*     CALL FUNCTION 'EXIT_SAPLMV01_003'  "???? zum Testzwecke
        EXPORTING
          message_type   = message_type
          parameter_name = c_parnam_plantext
          f_marc         = marc
        TABLES
          t_plantext     = tplantext
          t_plantextx    = tplantextx.
*     JH/22.04.98/4.0C (Ende)

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = tplantdata-material_long.
        APPEND tmaterial.
      ENDIF.
      IF NOT filtobj_relev-plant IS INITIAL.
        tplant = tplantdata-plant.
        APPEND tplant.
      ENDIF.
    ENDIF.
  ENDLOOP.
* ENDIF.

* MARD-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MARDM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT mardkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MARD_SINGLE_READ'
      EXPORTING
        matnr         = mardkey-matnr
        werks         = mardkey-werks
        lgort         = mardkey-lgort
      IMPORTING
        wmard         = mard
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    IF sy-subrc = 0.
      CLEAR tstoragelocationdata.
      CALL FUNCTION 'MAP2E_MARD_TO_BAPIE1MARDRT'
        EXPORTING
          mard         = mard
        CHANGING
          bapie1mardrt = tstoragelocationdata
        EXCEPTIONS
          OTHERS       = 0.

      tstoragelocationdata-function = mardkey-msgfn.
      APPEND tstoragelocationdata.

*       Ankreuzleiste belegen
      CLEAR tstoragelocationdatax.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tstoragelocationdatax = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tstoragelocationdatax-function = tstoragelocationdata-function.
      tstoragelocationdatax-material_long = tstoragelocationdata-material_long.   "MFLE
      tstoragelocationdatax-material = tstoragelocationdata-material.
      tstoragelocationdatax-plant    = tstoragelocationdata-plant.
      tstoragelocationdatax-stge_loc = tstoragelocationdata-stge_loc.
      CLEAR tstoragelocationdatax-material_external.                              "DIMP activation
      CLEAR tstoragelocationdatax-material_guid.                                  "DIMP activation
      CLEAR tstoragelocationdatax-material_version.                               "DIMP activation
      APPEND tstoragelocationdatax.
*           .....Reduce fields for the segment
*           CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                EXPORTING
*                     MESSAGE_TYPE = MESSAGE_TYPE
*                     SEGMENT_TYPE = C_SEGNAM_E1MARDM
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA
*                IMPORTING
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA.
*           APPEND T_IDOC_DATA.

*     JH/22.04.98/4.0C (Anfang)
*     Userexit zur Übergabe von kundeneigenen Feldern
      CALL CUSTOMER-FUNCTION '003'
        EXPORTING
          message_type          = message_type
          parameter_name        = c_parnam_storagelocationext
          f_mard                = mard
        TABLES
          t_storagelocationext  = tstoragelocationext
          t_storagelocationextx = tstoragelocationextx.
*     JH/22.04.98/4.0C (Ende)

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = tstoragelocationdata-material_long.
        APPEND tmaterial.
      ENDIF.
      IF NOT filtobj_relev-plant IS INITIAL.
        tplant = tstoragelocationdata-plant.
        APPEND tplant.
      ENDIF.
    ENDIF.
  ENDLOOP.                             "MARDKEY
* ENDIF.

* MFHM-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MFHMM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT mfhmkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MFHM_SINGLE_READ'
      EXPORTING
        matnr         = mfhmkey-matnr
        werks         = mfhmkey-werks
      IMPORTING
        wmfhm         = mfhm
      EXCEPTIONS
        not_found     = 1
        wrong_call    = 2
        error_message = 3
        OTHERS        = 4.
    IF sy-subrc = 0.
*       ????noch nicht unterstützt
*       CLEAR T???????????.
*       CALL FUNCTION 'MAP2E_MFHM_TO_BAPIE1MFHMRT'
*            EXPORTING
*                 MFHM         = MFHM
*            CHANGING
*                 BAPIE1MFHMRT = T?????????
*            EXCEPTIONS
*                 OTHERS       = 0.
*
*       T?????????-FUNCTION = MfhmKEY-MSGFN.
*       APPEND T?????????.
*
*       Ankreuzleiste belegen
*       CLEAR T?????????X.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
*       T?????????X = ANKREUZLEISTE.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*       T?????????X-FUNCTION  = T?????????-FUNCTION.
*       T?????????X-MATERIAL  = T?????????-MATERIAL.
*       T?????????X-PLANT     = T?????????-PLANT.
*       APPEND T?????????X.
*           .....Reduce fields for the segment
*           CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                EXPORTING
*                     MESSAGE_TYPE = MESSAGE_TYPE
*                     SEGMENT_TYPE = C_SEGNAM_E1MFHMM
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA
*                IMPORTING
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA.
*           APPEND T_IDOC_DATA.
*           .....Customer exit

*       Filterwerte festhalten
*       IF NOT FILTOBJ_RELEV-MATERIAL IS INITIAL.
*         TMATERIAL = ???????-MATERIAL.
*         APPEND TMATERIAL.
*       ENDIF.
*       IF NOT FILTOBJ_RELEV-PLANT IS INITIAL.
*         TPLANT = ??????-PLANT.
*         APPEND TPLANT.
*       ENDIF.
    ENDIF.
  ENDLOOP.                             "MFHMKEY
* ENDIF.

* MPGD-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MPGDM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT mpgdkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MPGD_SINGLE_READ'
      EXPORTING
        matnr         = mpgdkey-matnr
        werks         = mpgdkey-werks
      IMPORTING
        wmpgd         = mpgd
      EXCEPTIONS
        not_found     = 1
        wrong_call    = 2
        error_message = 3
        OTHERS        = 4.
*JH/10.03.98/4.0C/KPr147241 (Anfang)
*     IF SY-SUBRC = 0.
    IF sy-subrc NE 0.
*       Einen leeren MPGD-Satz erzeugen -> führt im Zielsystem zur
*       Löschung des betreffenden Satzes
      CLEAR mpgd.
      MOVE-CORRESPONDING mpgdkey TO mpgd.
    ENDIF.
*JH/10.03.98/4.0C/KPr147241 (Ende)
    CLEAR tplanningdata.
    CALL FUNCTION 'MAP2E_MPGD_TO_BAPIE1MPGDRT'
      EXPORTING
        mpgd         = mpgd
      CHANGING
        bapie1mpgdrt = tplanningdata
      EXCEPTIONS
        OTHERS       = 0.

    tplanningdata-function = mpgdkey-msgfn.
    APPEND tplanningdata.

*       Ankreuzleiste belegen
    CLEAR tplanningdatax.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
    tplanningdatax = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
    tplanningdatax-function  = tplanningdata-function.
    tplanningdatax-material_long  = tplanningdata-material_long.    "MFLE
    tplanningdatax-material  = tplanningdata-material.
    tplanningdatax-plant     = tplanningdata-plant.
    CLEAR tplanningdatax-material_external.                         "DIMP activation
    CLEAR tplanningdatax-material_guid.                             "DIMP activation
    CLEAR tplanningdatax-material_version.                          "DIMP activation
    APPEND tplanningdatax.
*           .....Reduce fields for the segment
*           CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                EXPORTING
*                     MESSAGE_TYPE = MESSAGE_TYPE
*                     SEGMENT_TYPE = C_SEGNAM_E1MPGDM
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA
*                IMPORTING
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA.
*           APPEND T_IDOC_DATA.

*   Filterwerte festhalten
*   Note 595027
    IF NOT filtobj_relev-material IS INITIAL.
      tmaterial = tplanningdata-material_long.
      APPEND tmaterial.
    ENDIF.
    IF NOT filtobj_relev-plant IS INITIAL.
      tplant = tplanningdata-plant.
      APPEND tplant.
    ENDIF.
*     ENDIF.   "JH/10.03.98/4.0C/KPr147241
  ENDLOOP.                             "MPGDKEY
* ENDIF.

* MPOP-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MPOPM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT mpopkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MPOP_SINGLE_READ'
      EXPORTING
        matnr         = mpopkey-matnr
        werks         = mpopkey-werks
      IMPORTING
        wmpop         = mpop
      EXCEPTIONS
        not_found     = 1
        wrong_call    = 2
        error_message = 3
        OTHERS        = 4.
    IF sy-subrc = 0.
      CLEAR tforecastparameters.
      CALL FUNCTION 'MAP2E_MPOP_TO_BAPIE1MPOPRT'
        EXPORTING
          mpop         = mpop
        CHANGING
          bapie1mpoprt = tforecastparameters
        EXCEPTIONS
          OTHERS       = 0.

      tforecastparameters-function = mpopkey-msgfn.
      APPEND tforecastparameters.

*       Ankreuzleiste belegen
      CLEAR tforecastparametersx.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tforecastparametersx = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tforecastparametersx-function  = tforecastparameters-function.
      tforecastparametersx-material_long  = tforecastparameters-material_long.    "MFLE
      tforecastparametersx-material  = tforecastparameters-material.
      tforecastparametersx-plant     = tforecastparameters-plant.
      CLEAR tforecastparametersx-material_external.                               "DIMP activation
      CLEAR tforecastparametersx-material_guid.                                   "DIMP activation
      CLEAR tforecastparametersx-material_version.                                "DIMP activation
      APPEND tforecastparametersx.
*           .....Reduce fields for the segment
*           CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                EXPORTING
*                     MESSAGE_TYPE = MESSAGE_TYPE
*                     SEGMENT_TYPE = C_SEGNAM_E1MPOPM
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA
*                IMPORTING
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA.
*           APPEND T_IDOC_DATA.
*           .....Customer exit

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = tforecastparameters-material_long.
        APPEND tmaterial.
      ENDIF.
      IF NOT filtobj_relev-plant IS INITIAL.
        tplant = tforecastparameters-plant.
        APPEND tplant.
      ENDIF.
    ENDIF.
  ENDLOOP.                             "MPOPKEY
* ENDIF.

* MPRW-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MPRWM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  CLEAR hwerks.

* Note 556406
  READ TABLE mprwkey WITH KEY mandt = sy-mandt
                              matnr = p_head_matnr
                     BINARY SEARCH.
  IF sy-subrc = 0.
    htabix = sy-tabix.

    LOOP AT mprwkey FROM htabix.
      IF mprwkey-matnr <> p_head_matnr.
        EXIT.
      ENDIF.

*     Bei Wechsel des Werkes Prognosedaten nachlesen
      IF hwerks <> mprwkey-werks.
        hwerks = mprwkey-werks.

        REFRESH thelp_prowfa.

        CALL FUNCTION 'MPOP_SINGLE_READ'
          EXPORTING
            matnr         = mprwkey-matnr
            werks         = mprwkey-werks
          TABLES
            prowf_tab     = thelp_prowfa
          EXCEPTIONS
            not_found     = 1
            wrong_call    = 2
            error_message = 3
            OTHERS        = 4.
        IF sy-subrc = 0.
          SORT thelp_prowfa BY ertag.
        ENDIF.
      ENDIF.

*     Für das aktuelle WERKS und ERTAG die Prognosewerte lesen
      READ TABLE thelp_prowfa WITH KEY ertag = mprwkey-ertag
                                   BINARY SEARCH.
      IF sy-subrc = 0.
        CLEAR mprw.
        MOVE-CORRESPONDING mprwkey      TO mprw.
        MOVE-CORRESPONDING thelp_prowfa TO mprw.
        CLEAR tforecastvalues.
        CALL FUNCTION 'MAP2E_MPRW_TO_BAPIE1MPRWRT'
          EXPORTING
            mprw         = mprw
          CHANGING
            bapie1mprwrt = tforecastvalues
          EXCEPTIONS
            OTHERS       = 0.

        tforecastvalues-function = hmprwkey-msgfn.
        APPEND tforecastvalues.

*             Anmerkung: Keine Ankreuzleiste unterstützt
*             -> Coding dazu auskommentiert! (siehe '*#')
*             Ankreuzleiste belegen
*#            CLEAR TFORECASTVALUESX.
*             Alle Felder der Ankreuzleiste als änderungsrelevant kennz.
*#            TFORECASTVALUESX = ANKREUZLEISTE.
*             Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*#            TFORECASTVALUESX-FUNCTION  = TFORECASTVALUES-FUNCTION.
*#            TFORECASTVALUESX-MATERIAL  = TFORECASTVALUES-MATERIAL.
*#            TFORECASTVALUESX-PLANT     = TFORECASTVALUES-PLANT.
*#            TFORECASTVALUESX-FIRST_DAY = TFORECASTVALUES-FIRST_DAY.
*#            APPEND TFORECASTVALUESX.
*             .....Reduce fields for the segment
*               CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                    EXPORTING
*                         MESSAGE_TYPE = MESSAGE_TYPE
*                         SEGMENT_TYPE = C_SEGNAM_E1MPRWM
*                         SEGMENT_DATA = T_IDOC_DATA-SDATA
*                    IMPORTING
*                         SEGMENT_DATA = T_IDOC_DATA-SDATA.
*               APPEND T_IDOC_DATA.

*       Filterwerte festhalten
*       Note 595027
        IF NOT filtobj_relev-material IS INITIAL.
          tmaterial = tforecastvalues-material_long.
          APPEND tmaterial.
        ENDIF.
        IF NOT filtobj_relev-plant IS INITIAL.
          tplant = tforecastvalues-plant.
          APPEND tplant.
        ENDIF.
      ENDIF.
    ENDLOOP.                             "MPRWKEY
  ENDIF.
* ENDIF.

* MVEG-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MVEGM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  CLEAR hwerks.

* Note 556406
  READ TABLE mvegkey WITH KEY mandt = sy-mandt
                              matnr = p_head_matnr
                     BINARY SEARCH.
  IF sy-subrc = 0.
    htabix = sy-tabix.

    LOOP AT mvegkey FROM htabix.
      IF mvegkey-matnr <> p_head_matnr.
        EXIT.
      ENDIF.

*     Bei Wechsel des Werkes Verbrauchsdaten nachlesen
      IF hwerks <> mvegkey-werks.
        hwerks = mvegkey-werks.

        REFRESH thelp_gesv.

        CALL FUNCTION 'MARC_SINGLE_READ'
          EXPORTING
            matnr         = mvegkey-matnr
            werks         = mvegkey-werks
          IMPORTING
            wmarc         = marc
          EXCEPTIONS
            error_message = 1
            OTHERS        = 2.

        IF sy-subrc = 0.
          CALL FUNCTION 'CONSUMPTION_READ_FOR_MM'
            EXPORTING
              matnr         = marc-matnr
              werks         = marc-werks
              perkz         = marc-perkz
              periv         = marc-periv
            TABLES
              ges_verb_tab  = thelp_gesv
            EXCEPTIONS
              wrong_call    = 1
              not_found     = 2
              error_message = 3
              OTHERS        = 4.
          IF sy-subrc = 0.
            SORT thelp_gesv BY ertag.
          ENDIF.
        ENDIF.
      ENDIF.

*     Für das aktuelle WERKS und ERTAG den Verbrauch lesen
      READ TABLE thelp_gesv WITH KEY ertag = mvegkey-ertag
                                   BINARY SEARCH.
      IF sy-subrc = 0.
        CLEAR mveg.
        MOVE-CORRESPONDING mvegkey    TO mveg.
        MOVE-CORRESPONDING thelp_gesv TO mveg.
        CLEAR ttotalconsumption.
        CALL FUNCTION 'MAP2E_MVEG_TO_BAPIE1MVEGRT'
          EXPORTING
            mveg         = mveg
          CHANGING
            bapie1mvegrt = ttotalconsumption
          EXCEPTIONS
            OTHERS       = 0.

        ttotalconsumption-function = hmvegkey-msgfn.
        APPEND ttotalconsumption.

*               Anmerkung: Keine Ankreuzleiste unterstützt
*               -> Coding dazu auskommentiert! (siehe '*#')
*               Ankreuzleiste belegen
*#              CLEAR TTOTALCONSUMPTIONX.
*               Alle Felder der Ankreuzleiste als änderungsrel. kennz.
*#              TTOTALCONSUMPTIONX = ANKREUZLEISTE.
*               Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*#              TTOTALCONSUMPTIONX-FUNCTION
*#                                       = TTOTALCONSUMPTION-FUNCTION.
*#              TTOTALCONSUMPTIONX-MATERIAL
*#                                       = TTOTALCONSUMPTION-MATERIAL.
*#              TTOTALCONSUMPTIONX-PLANT
*#                                       = TTOTALCONSUMPTION-PLANT.
*#              TTOTALCONSUMPTIONX-FIRST_DAY
*#                                       = TTOTALCONSUMPTION-FIRST_DAY.
*#              APPEND TTOTALCONSUMPTIONX.
*             .....Reduce fields for the segment
*               CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                    EXPORTING
*                         MESSAGE_TYPE = MESSAGE_TYPE
*                         SEGMENT_TYPE = C_SEGNAM_E1MVEGM
*                         SEGMENT_DATA = T_IDOC_DATA-SDATA
*                    IMPORTING
*                         SEGMENT_DATA = T_IDOC_DATA-SDATA.
*               APPEND T_IDOC_DATA.

*       Filterwerte festhalten
*       Note 595027
        IF NOT filtobj_relev-material IS INITIAL.
          tmaterial = ttotalconsumption-material_long.
          APPEND tmaterial.
        ENDIF.
        IF NOT filtobj_relev-plant IS INITIAL.
          tplant = ttotalconsumption-plant.
          APPEND tplant.
        ENDIF.
      ENDIF.
    ENDLOOP.                             "MVEGKEY
  ENDIF.
* ENDIF.

* MVEU-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MVEUM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  CLEAR hwerks.

* Note 556406
  READ TABLE mveukey WITH KEY mandt = sy-mandt
                              matnr = p_head_matnr
                     BINARY SEARCH.
  IF sy-subrc = 0.
    htabix = sy-tabix.

    LOOP AT mveukey FROM htabix.
      IF mveukey-matnr <> p_head_matnr.
        EXIT.
      ENDIF.

*     Bei Wechsel des Werkes Verbrauchsdaten nachlesen
      IF hwerks <> mveukey-werks.
        hwerks = mveukey-werks.

        REFRESH thelp_ungv.

        CALL FUNCTION 'MARC_SINGLE_READ'
          EXPORTING
            matnr         = mveukey-matnr
            werks         = mveukey-werks
          IMPORTING
            wmarc         = marc
          EXCEPTIONS
            error_message = 1
            OTHERS        = 2.
        IF sy-subrc = 0.
          CALL FUNCTION 'CONSUMPTION_READ_FOR_MM'
            EXPORTING
              matnr         = marc-matnr
              werks         = marc-werks
              perkz         = marc-perkz
              periv         = marc-periv
            TABLES
              ung_verb_tab  = thelp_ungv
            EXCEPTIONS
              wrong_call    = 1
              not_found     = 2
              error_message = 3
              OTHERS        = 4.
          IF sy-subrc = 0.
            SORT thelp_ungv BY ertag.
          ENDIF.
        ENDIF.
      ENDIF.

*     Für das aktuelle WERKS und ERTAG den Verbrauch lesen
      READ TABLE thelp_ungv WITH KEY ertag = mveukey-ertag
                                   BINARY SEARCH.
      IF sy-subrc = 0.
        CLEAR mveu.
        MOVE-CORRESPONDING mveukey    TO mveu.
        MOVE-CORRESPONDING thelp_ungv TO mveu.
        CLEAR tunplndconsumption.
        CALL FUNCTION 'MAP2E_MVEU_TO_BAPIE1MVEURT'
          EXPORTING
            mveu         = mveu
          CHANGING
            bapie1mveurt = tunplndconsumption
          EXCEPTIONS
            OTHERS       = 0.

        tunplndconsumption-function = hmveukey-msgfn.
        APPEND tunplndconsumption.

*               Anmerkung: Keine Ankreuzleiste unterstützt
*               -> Coding dazu auskommentiert! (siehe '*#')
*               Ankreuzleiste belegen
*#              CLEAR TUNPLNDCONSUMPTIONX.
*               Alle Felder der Ankreuzleiste als änderungsrel. kennz.
*#              TUNPLNDCONSUMPTIONX = ANKREUZLEISTE.
*               Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*#              TUNPLNDCONSUMPTIONX-FUNCTION
*#                                       = TUNPLNDCONSUMPTION-FUNCTION.
*#              TUNPLNDCONSUMPTIONX-MATERIAL
*#                                       = TUNPLNDCONSUMPTION-MATERIAL.
*#              TUNPLNDCONSUMPTIONX-PLANT
*#                                       = TUNPLNDCONSUMPTION-PLANT.
*#              TUNPLNDCONSUMPTIONX-FIRST_DAY
*#                                       = TUNPLNDCONSUMPTION-FIRST_DAY.
*#              APPEND TUNPLNDCONSUMPTIONX.
*             .....Reduce fields for the segment
*               CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                    EXPORTING
*                         MESSAGE_TYPE = MESSAGE_TYPE
*                         SEGMENT_TYPE = C_SEGNAM_E1MVEUM
*                         SEGMENT_DATA = T_IDOC_DATA-SDATA
*                    IMPORTING
*                         SEGMENT_DATA = T_IDOC_DATA-SDATA.
*               APPEND T_IDOC_DATA.

*       Filterwerte festhalten
*       Note 595027
        IF NOT filtobj_relev-material IS INITIAL.
          tmaterial = tunplndconsumption-material_long.
          APPEND tmaterial.
        ENDIF.
        IF NOT filtobj_relev-plant IS INITIAL.
          tplant = tunplndconsumption-plant.
          APPEND tplant.
        ENDIF.
      ENDIF.
    ENDLOOP.                             "MVEUKEY
  ENDIF.
* ENDIF.

* MKAL-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MKALM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
*????noch nicht unterstützt
*       LOOP AT MKALKEY WHERE MANDT = SY-MANDT
*                         AND MATNR = p_head_matnr
*                         AND WERKS = MARCKEY-WERKS.
*         SELECT SINGLE * FROM MKAL WHERE MATNR = p_head_matnr
*                                     AND WERKS = MKALKEY-WERKS
*                                     AND VERID = MKALKEY-VERID.
*         IF SY-SUBRC = 0.
*           CLEAR E1MKALM.
*           MOVE-CORRESPONDING MKAL TO E1MKALM.
*           E1MKALM-MSGFN = MKALKEY-MSGFN.
*           PERFORM CONDENSE_E1MKALM USING E1MKALM.
*
*           CLEAR T_IDOC_DATA.
*           T_IDOC_DATA-SDATA = E1MKALM.
*           T_IDOC_DATA-SEGNAM = C_SEGNAM_E1MKALM.
*           .....Reduce fields for the segment
*           CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                EXPORTING
*                     MESSAGE_TYPE = MESSAGE_TYPE
*                     SEGMENT_TYPE = C_SEGNAM_E1MKALM
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA
*                IMPORTING
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA.
*           APPEND T_IDOC_DATA.
*         ENDIF. "sy-subrc = 0
*       ENDLOOP.                       "at mkalkey
*     ENDIF.                           "active_flag
*   ENDLOOP.                           "at marckey
* ENDIF.                               "active_flag

* MARM-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MARMM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT marmkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MARM_SINGLE_READ'
      EXPORTING
        matnr         = marmkey-matnr
        meinh         = marmkey-meinh
      IMPORTING
        wmarm         = marm
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    hsubrc = sy-subrc.
    IF sy-subrc NE 0.
*       Mengeneinheit wurde gelöscht -> nur Keys belegen
      CLEAR marm.
      MOVE-CORRESPONDING marmkey TO marm.
*       Sicherstellen, daß Löschcode in MSGFN steht
      marmkey-msgfn = c_msgfn_d.
    ELSE.
*       Sicherstellen, daß kein Löschcode in MSGFN steht
      marmkey-msgfn = c_msgfn_r.
    ENDIF.

    CLEAR tunitsofmeasure.
    CALL FUNCTION 'MAP2E_MARM_TO_BAPIE1MARMRT'
      EXPORTING
        marm         = marm
      CHANGING
        bapie1marmrt = tunitsofmeasure
      EXCEPTIONS
        OTHERS       = 0.
    WRITE marm-ean11 TO tunitsofmeasure-ean_upc.    "note 390227
    tunitsofmeasure-function = marmkey-msgfn.
*   JH/27.04.98/4.0C (Anfang)
*   Daten in ALT_UNIT/ALT_UNIT_ISO redundant auch in UNIT/UNIT_ISO
*   hinterlegen (wg. Parameterfilterung)
    tunitsofmeasure-unit     = tunitsofmeasure-alt_unit.
    tunitsofmeasure-unit_iso = tunitsofmeasure-alt_unit_iso.
*   JH/27.04.98/4.0C (Ende)
    APPEND tunitsofmeasure.

    IF hsubrc = 0.
*       Ankreuzleiste belegen, falls keine Löschung vorliegt
      CLEAR tunitsofmeasurex.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tunitsofmeasurex = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tunitsofmeasurex-function     = tunitsofmeasure-function.
      tunitsofmeasurex-material_long     = tunitsofmeasure-material_long.    "MFLE
      tunitsofmeasurex-material     = tunitsofmeasure-material.
      tunitsofmeasurex-alt_unit     = tunitsofmeasure-alt_unit.
      tunitsofmeasurex-alt_unit_iso = tunitsofmeasure-alt_unit_iso.
      CLEAR tunitsofmeasurex-material_external.                              "DIMP activation
      CLEAR tunitsofmeasurex-material_guid.                                  "DIMP activation
      CLEAR tunitsofmeasurex-material_version.                               "DIMP activation
      APPEND tunitsofmeasurex.
    ENDIF.
*       .....Reduce fields for the segment
*       CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*            EXPORTING
*                 MESSAGE_TYPE = MESSAGE_TYPE
*                 SEGMENT_TYPE = C_SEGNAM_E1MARMM
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA
*            IMPORTING
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA.
*       APPEND T_IDOC_DATA.
*       .....Customer exit

*     Filterwerte festhalten
*     Note 595027
    IF NOT filtobj_relev-material IS INITIAL.
      tmaterial = tunitsofmeasure-material_long.
      APPEND tmaterial.
    ENDIF.
  ENDLOOP.
* ENDIF.

* MAMT-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MAMTM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
*   Kein SINGLE-READ-FB vorhanden!
  CALL FUNCTION 'MAMT_GENERIC_READ_WITH_MATNR'
    EXPORTING
      matnr         = p_head_matnr
    TABLES
      mamt_tab      = t_mamt
    EXCEPTIONS
      wrong_call    = 1
      not_found     = 2
      error_message = 3
      OTHERS        = 4.
  LOOP AT mamtkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    READ TABLE t_mamt WITH KEY mandt = mamtkey-mandt
                               matnr = mamtkey-matnr
                               spras = mamtkey-spras
                               meinh = mamtkey-meinh
                               mtxid = mamtkey-mtxid
                               lfdnr = mamtkey-lfdnr
                      BINARY SEARCH.
    hsubrc = sy-subrc.
    IF sy-subrc NE 0.
*       Mengeneinh. abh. Text wurde gelöscht -> nur Keys belegen
      CLEAR t_mamt.
      MOVE-CORRESPONDING mamtkey TO t_mamt.
*       Sicherstellen, daß Löschcode in MSGFN steht
      mamtkey-msgfn = c_msgfn_d.
    ELSE.
*       Sicherstellen, daß kein Löschcode in MSGFN steht
      mamtkey-msgfn = c_msgfn_r.
    ENDIF.

    CLEAR tunitofmeasuretexts.
    CALL FUNCTION 'MAP2E_MAMT_TO_BAPIE1MAMTRT'
      EXPORTING
        mamt         = t_mamt
      CHANGING
        bapie1mamtrt = tunitofmeasuretexts
      EXCEPTIONS
        OTHERS       = 0.

    tunitofmeasuretexts-function = mamtkey-msgfn.
    APPEND tunitofmeasuretexts.

*     Anmerkung: Keine Ankreuzleiste unterstützt
*     -> Coding dazu auskommentiert! (siehe '*#')
*#    IF HSUBRC = 0.
*       Ankreuzleiste belegen, falls keine Löschung vorliegt
*#      CLEAR TUNITOFMEASURETEXTSX.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
*#      TUNITOFMEASURETEXTSX = ANKREUZLEISTE.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*#      TUNITOFMEASURETEXTSX-FUNCTION
*#                                  = TUNITOFMEASURETEXTS-FUNCTION.
*#      TUNITOFMEASURETEXTSX-MATERIAL
*#                                  = TUNITOFMEASURETEXTS-MATERIAL.
*#      TUNITOFMEASURETEXTSX-LANGU
*#                                  = TUNITOFMEASURETEXTS-LANGU.
*#      TUNITOFMEASURETEXTSX-LANGU_ISO
*#                                  = TUNITOFMEASURETEXTS-LANGU_ISO.
*#      TUNITOFMEASURETEXTSX-ALT_UNIT
*#                                  = TUNITOFMEASURETEXTS-ALT_UNIT.
*#      TUNITOFMEASURETEXTSX-ALT_UNIT_ISO
*#                                  = TUNITOFMEASURETEXTS-ALT_UNIT_ISO.
*#      TUNITOFMEASURETEXTSX-TEXT_ID
*#                                  = TUNITOFMEASURETEXTS-TEXT_ID.
*#      TUNITOFMEASURETEXTSX-CONSEC_NO
*#                                  = TUNITOFMEASURETEXTS-CONSEC_NO.
*#      APPEND TUNITOFMEASURETEXTSX.
*#    ENDIF.
*       .....Reduce fields for the segment
*       CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*            EXPORTING
*                 MESSAGE_TYPE = MESSAGE_TYPE
*                 SEGMENT_TYPE = C_SEGNAM_E1MAMTM
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA
*            IMPORTING
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA.
*       APPEND T_IDOC_DATA.

*   Filterwerte festhalten
*   Note 595027
    IF NOT filtobj_relev-material IS INITIAL.
      tmaterial = tunitofmeasuretexts-material_long.
      APPEND tmaterial.
    ENDIF.
    IF NOT filtobj_relev-langu IS INITIAL.
      tlangu = tunitofmeasuretexts-langu.
      APPEND tlangu.
    ENDIF.
  ENDLOOP.                             "MAMTKEY
* ENDIF.

* MEAN-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MEANM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
*   Kein SINGLE-READ-FB vorhanden!
  CALL FUNCTION 'MEAN_GENERIC_READ_WITH_MATNR'
    EXPORTING
      matnr         = p_head_matnr
    TABLES
      mean_tab      = t_mean
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
*   Zur Sicherheit sortieren, weil LFDNR durch EAN11 als Key ersetzt
*   wird
  SORT t_mean BY mandt matnr meinh ean11.
  LOOP AT meankey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    READ TABLE t_mean WITH KEY mandt = meankey-mandt
                               matnr = meankey-matnr
                               meinh = meankey-meinh
                               ean11 = meankey-ean11
                      BINARY SEARCH.
*   Das Löschen von MEAN-Sätzen wird im MATERIAL_MAINTAIN_DARK_RETAIL
*   über Sonderlogik abgwickelt (EAN_REORG_RT), so daß keine
*   gelöschten Keys übergeben werden müssen.
* JH/08.10.98/4.5B/HW 120622 (Anfang)
* Die Löschinfo ist doch relevant für EAN_REORG_RT!
*   IF SY-SUBRC = 0.
    IF sy-subrc NE 0.
*     EAN wurde gelöscht -> nur Keys belegen
      CLEAR t_mean.
      MOVE-CORRESPONDING meankey TO t_mean.
*     Sicherstellen, daß Löschcode in MSGFN steht
      meankey-msgfn = c_msgfn_d.
    ELSE.
*     Sicherstellen, daß kein Löschcode in MSGFN steht
      meankey-msgfn = c_msgfn_r.
    ENDIF.
* JH/08.10.98/4.5B/HW 120622 (Ende)

    CLEAR tinternationalartnos.
    CALL FUNCTION 'MAP2E_MEAN_TO_BAPIE1MEANRT'
      EXPORTING
        mean         = t_mean
      CHANGING
        bapie1meanrt = tinternationalartnos
      EXCEPTIONS
        OTHERS       = 0.
    WRITE t_mean-ean11 TO tinternationalartnos-ean_upc.   "note 390227
    tinternationalartnos-function = meankey-msgfn.
    APPEND tinternationalartnos.

*       Anmerkung: Keine Ankreuzleiste unterstützt
*       -> Coding dazu auskommentiert! (siehe '*#')
*       Ankreuzleiste belegen
*#      CLEAR TINTERNATIONALARTNOSX.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
*#      TINTERNATIONALARTNOSX = ANKREUZLEISTE.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*#      TINTERNATIONALARTNOSX-FUNCTION = TINTERNATIONALARTNOS-FUNCTION.
*#      TINTERNATIONALARTNOSX-MATERIAL = TINTERNATIONALARTNOS-MATERIAL.
*#      TINTERNATIONALARTNOSX-UNIT     = TINTERNATIONALARTNOS-UNIT.
*#      TINTERNATIONALARTNOSX-UNIT_ISO = TINTERNATIONALARTNOS-UNIT_ISO.
*#      TINTERNATIONALARTNOSX-EAN_UPC  = TINTERNATIONALARTNOS-EAN_UPC.
*#      APPEND TINTERNATIONALARTNOSX.
*           .....Reduce fields for the segment
*           CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                EXPORTING
*                     MESSAGE_TYPE = MESSAGE_TYPE
*                     SEGMENT_TYPE = C_SEGNAM_E1MEANM
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA
*                IMPORTING
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA.
*           APPEND T_IDOC_DATA.

*       Filterwerte festhalten
*       Note 595027
    IF NOT filtobj_relev-material IS INITIAL.
      tmaterial = tinternationalartnos-material_long.
      APPEND tmaterial.
    ENDIF.
*   ENDIF.         "JH/08.10.98/4.5B/HW 120622
  ENDLOOP.                             "MEANKEY
* ENDIF.

* MLEA-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MLEAM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
*   Kein SINGLE-READ-FB vorhanden!
  CALL FUNCTION 'MLEA_GENERIC_READ_WITH_MATNR'
    EXPORTING
      matnr         = p_head_matnr
    TABLES
      mlea_tab      = t_mlea
    EXCEPTIONS
      wrong_call    = 1
      not_found     = 2
      error_message = 3
      OTHERS        = 4.
*   Zur Sicherheit sortieren, weil LFDNR durch EAN11 als Key ersetzt
*   wird
  SORT t_mlea BY mandt matnr meinh lifnr ean11.
  LOOP AT mleakey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    READ TABLE t_mlea WITH KEY mandt = mleakey-mandt
                               matnr = mleakey-matnr
                               meinh = mleakey-meinh
                               lifnr = mleakey-lifnr
                               ean11 = mleakey-ean11
                      BINARY SEARCH.
    IF sy-subrc NE 0.
*       Lieferanten-EAN wurde gelöscht -> nur Keys belegen
      CLEAR t_mlea.
      MOVE-CORRESPONDING mleakey TO t_mlea.
*       Sicherstellen, daß Löschcode in MSGFN steht
      mleakey-msgfn = c_msgfn_d.
    ELSE.
*       Sicherstellen, daß kein Löschcode in MSGFN steht
      mleakey-msgfn = c_msgfn_r.
    ENDIF.

    CLEAR tvendorean.
    CALL FUNCTION 'MAP2E_MLEA_TO_BAPIE1MLEART'
      EXPORTING
        mlea         = t_mlea
      CHANGING
        bapie1mleart = tvendorean
      EXCEPTIONS
        OTHERS       = 0.
    WRITE t_mlea-ean11 TO tvendorean-ean_upc.       "note 390227
    tvendorean-function = mleakey-msgfn.

** start_EoP_adaptation
** Read back internal guideline note 1998910 before starting delivering a correction
    IF NOT cl_vs_switch_check=>cmd_vmd_cvp_ilm_sfw_01( ) IS INITIAL.
      INCLUDE erp_cvp_mm_i3_c_trx0021 IF FOUND.
    ENDIF.
** end_EoP_adaptation

    APPEND tvendorean.

*     Anmerkung: Keine Ankreuzleiste unterstützt
*     -> Coding dazu auskommentiert! (siehe '*#')
*#    IF HSUBRC = 0.
*       Ankreuzleiste belegen, falls keine Löschung vorliegt
*#      CLEAR TVENDOREANX.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
*#      TVENDOREANX = ANKREUZLEISTE.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*#      TVENDOREANX-FUNCTION  = TVENDOREAN-FUNCTION.
*#      TVENDOREANX-MATERIAL  = TVENDOREAN-MATERIAL.
*#      TVENDOREANX-UNIT      = TVENDOREAN-UNIT.
*#      TVENDOREANX-UNIT_ISO  = TVENDOREAN-UNIT_ISO.
*#      TVENDOREANX-VENDOR_NO = TVENDOREAN-VENDOR_NO.
*#      TVENDOREANX-EAN_UPC   = TVENDOREAN-EAN_UPC.
*#      APPEND TVENDOREANX.
*#    ENDIF.
*       .....Reduce fields for the segment
*       CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*            EXPORTING
*                 MESSAGE_TYPE = MESSAGE_TYPE
*                 SEGMENT_TYPE = C_SEGNAM_E1MLEAM
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA
*            IMPORTING
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA.
*       APPEND T_IDOC_DATA.

*     Filterwerte festhalten
*     Note 595027
    IF NOT filtobj_relev-material IS INITIAL.
      tmaterial = tvendorean-material_long.
      APPEND tmaterial.
    ENDIF.
  ENDLOOP.                             "MLEAKEY
* ENDIF.

* MALG-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MALGM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
* JH/05.01.00/4.6C Entkopplung der MALG (Anfang)
* MALG-Daten werden nicht mehr über ARTMAS verteilt
* -> zu Testzwecken (z.B. RBDARTST) kann das Aufbauen der MALG
*    im ALE-Ausgang genutzt werden -> FLAG_TESTMODE setzen
*  IF NOT flag_testmode IS INITIAL.
* JH/05.01.00/4.6C Entkopplung der MALG (Ende)
    LOOP AT malgkey WHERE mandt = sy-mandt
                      AND matnr = p_head_matnr.
      CALL FUNCTION 'MALG_SINGLE_READ'
        EXPORTING
          matnr         = malgkey-matnr
          meinh         = malgkey-meinh
          laygr         = malgkey-laygr
          lmnum         = malgkey-lmnum "JH/4.6C
        IMPORTING
          wmalg         = malg
        EXCEPTIONS
          error_message = 1
          OTHERS        = 2.
      hsubrc = sy-subrc.
      IF sy-subrc NE 0.
*       Layoutbaustein wurde gelöscht -> nur Keys belegen
        CLEAR malg.
        MOVE-CORRESPONDING malgkey TO malg.
*       Sicherstellen, daß Löschcode in MSGFN steht
        malgkey-msgfn = c_msgfn_d.
      ELSE.
*       Sicherstellen, daß kein Löschcode in MSGFN steht
        malgkey-msgfn = c_msgfn_r.
      ENDIF.

      CLEAR tlayoutmoduleassgmt.
      CALL FUNCTION 'MAP2E_MALG_TO_BAPIE1MALGRT'
        EXPORTING
          malg         = malg
        CHANGING
          bapie1malgrt = tlayoutmoduleassgmt
        EXCEPTIONS
          OTHERS       = 0.

      tlayoutmoduleassgmt-function = malgkey-msgfn.
      APPEND tlayoutmoduleassgmt.

* JH/20.04.98/4.0C (Anfang)
* Ankreuzleiste ab 4.0C unterstützt!
      IF hsubrc = 0.
*       Ankreuzleiste belegen, falls keine Löschung vorliegt
        CLEAR tlayoutmoduleassgmtx.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
        tlayoutmoduleassgmtx = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
        tlayoutmoduleassgmtx-function   = tlayoutmoduleassgmt-function.
        tlayoutmoduleassgmtx-material_long   = tlayoutmoduleassgmt-material_long.    "MFLE
        tlayoutmoduleassgmtx-material   = tlayoutmoduleassgmt-material.
        tlayoutmoduleassgmtx-unit       = tlayoutmoduleassgmt-unit.
        tlayoutmoduleassgmtx-unit_iso   = tlayoutmoduleassgmt-unit_iso.
        tlayoutmoduleassgmtx-layout_mod = tlayoutmoduleassgmt-layout_mod.
        CLEAR tlayoutmoduleassgmtx-material_external.                                "DIMP activation
        CLEAR tlayoutmoduleassgmtx-material_guid.                                    "DIMP activation
        CLEAR tlayoutmoduleassgmtx-material_version.                                 "DIMP activation
        APPEND tlayoutmoduleassgmtx.
      ENDIF.
* JH/20.04.98/4.0C (Ende)
*     .....Reduce fields for the segment
*     CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*          EXPORTING
*               MESSAGE_TYPE = MESSAGE_TYPE
*               SEGMENT_TYPE = C_SEGNAM_E1MALGM
*               SEGMENT_DATA = T_IDOC_DATA-SDATA
*          IMPORTING
*               SEGMENT_DATA = T_IDOC_DATA-SDATA.
*     APPEND T_IDOC_DATA.
*     .....Customer exit

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = tlayoutmoduleassgmt-material_long.
        APPEND tmaterial.
      ENDIF.
    ENDLOOP.                             "MALGKEY
*  ENDIF.       "JH/05.01.00/4.6C Entkopplung der MALG
* ENDIF.

* MBEW-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MBEWM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT mbewkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MBEW_SINGLE_READ'
      EXPORTING
        matnr         = mbewkey-matnr
        bwkey         = mbewkey-bwkey
        bwtar         = mbewkey-bwtar
      IMPORTING
        wmbew         = mbew
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    IF sy-subrc = 0.
      REFRESH wambew.
      APPEND mbew TO wambew.
      CALL FUNCTION 'MBEW_EXTEND'
        EXPORTING
          kzrfb    = ' '
          maxtz    = ' '
          xvper    = 'X'
          xvvpr    = 'X'
          xvjah    = 'X'
          xvvja    = 'X'
        TABLES
          mbew_tab = wambew.
      READ TABLE wambew INTO mbew INDEX 1.
      CALL FUNCTION 'T001K_SINGLE_READ'
        EXPORTING
          bwkey      = mbew-bwkey
        IMPORTING
          wt001k     = it001k
        EXCEPTIONS
          not_found  = 1
          wrong_call = 2
          OTHERS     = 3.

      IF sy-subrc = 0.
        CALL FUNCTION 'T001_SINGLE_READ'
          EXPORTING
            bukrs      = it001k-bukrs
          IMPORTING
            wt001      = it001
          EXCEPTIONS
            not_found  = 1
            wrong_call = 2
            OTHERS     = 3.

      ENDIF.
      CLEAR tvaluationdata.
      CALL FUNCTION 'MAP2E_MBEW_TO_BAPIE1MBEWRT'
        EXPORTING
          mbew         = mbew
          currency     = it001-waers
        CHANGING
          bapie1mbewrt = tvaluationdata
        EXCEPTIONS
          OTHERS       = 0.

      tvaluationdata-function = mbewkey-msgfn.
      APPEND tvaluationdata.

*       Ankreuzleiste belegen
      CLEAR tvaluationdatax.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tvaluationdatax = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tvaluationdatax-function  = tvaluationdata-function.
      tvaluationdatax-material_long  = tvaluationdata-material_long.    "MFLE
      tvaluationdatax-material  = tvaluationdata-material.
      tvaluationdatax-val_area  = tvaluationdata-val_area.
      tvaluationdatax-val_type  = tvaluationdata-val_type.
      CLEAR tvaluationdatax-material_external.                          "DIMP activation
      CLEAR tvaluationdatax-material_guid.                              "DIMP activation
      CLEAR tvaluationdatax-material_version.                           "DIMP activation
      APPEND tvaluationdatax.
*       .....Reduce fields for the segment
*       CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*            EXPORTING
*                 MESSAGE_TYPE = MESSAGE_TYPE
*                 SEGMENT_TYPE = C_SEGNAM_E1MBEWM
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA
*            IMPORTING
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA.
*       APPEND T_IDOC_DATA.

*     JH/22.04.98/4.0C (Anfang)
*     Userexit zur Übergabe von kundeneigenen Feldern
      CALL CUSTOMER-FUNCTION '003'
        EXPORTING
          message_type    = message_type
          parameter_name  = c_parnam_valuationext
          f_mbew          = mbew
        TABLES
          t_valuationext  = tvaluationext
          t_valuationextx = tvaluationextx.
*     JH/22.04.98/4.0C (Ende)

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = tvaluationdata-material_long.
        APPEND tmaterial.
      ENDIF.
      IF NOT filtobj_relev-val_area IS INITIAL.
        tval_area = tvaluationdata-val_area.
        APPEND tval_area.
      ENDIF.
    ENDIF.
  ENDLOOP.                             "MBEWKEY
* ENDIF.

* MLGN-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MLGNM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT mlgnkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
*     Die Materialstammverbuchung erwartet die Ladehilfsmittelmengen in
*     der jeweiligen Mengeneinheit zur Ladehilfsmittelmenge (auf der DB
*     ist die Ladehilfsmittelmenge in der BasisME abgespeichert).
    CALL FUNCTION 'MLGN_SINGLE_READ'
      EXPORTING
        matnr         = mlgnkey-matnr
        lgnum         = mlgnkey-lgnum
        lhme          = 'X'
      IMPORTING
        wmlgn         = mlgn
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.

    IF sy-subrc = 0.
      CLEAR twarehousenumberdata.
      CALL FUNCTION 'MAP2E_MLGN_TO_BAPIE1MLGNRT'
        EXPORTING
          mlgn         = mlgn
        CHANGING
          bapie1mlgnrt = twarehousenumberdata
        EXCEPTIONS
          OTHERS       = 0.

      twarehousenumberdata-function = mlgnkey-msgfn.
      APPEND twarehousenumberdata.

*       Ankreuzleiste belegen
      CLEAR twarehousenumberdatax.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      twarehousenumberdatax = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      twarehousenumberdatax-function = twarehousenumberdata-function.
      twarehousenumberdatax-material_long = twarehousenumberdata-material_long.    "MFLE
      twarehousenumberdatax-material = twarehousenumberdata-material.
      twarehousenumberdatax-whse_no  = twarehousenumberdata-whse_no.
      CLEAR twarehousenumberdatax-material_external.                               "DIMP activation
      CLEAR twarehousenumberdatax-material_guid.                                   "DIMP activation
      CLEAR twarehousenumberdatax-material_version.                                "DIMP activation
      APPEND twarehousenumberdatax.
*       .....Reduce fields for the segment
*       CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*            EXPORTING
*                 MESSAGE_TYPE = MESSAGE_TYPE
*                 SEGMENT_TYPE = C_SEGNAM_E1MLGNM
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA
*            IMPORTING
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA.
*       APPEND T_IDOC_DATA.

*     JH/22.04.98/4.0C (Anfang)
*     Userexit zur Übergabe von kundeneigenen Feldern
      CALL CUSTOMER-FUNCTION '003'
        EXPORTING
          message_type          = message_type
          parameter_name        = c_parnam_warehousenumberext
          f_mlgn                = mlgn
        TABLES
          t_warehousenumberext  = twarehousenumberext
          t_warehousenumberextx = twarehousenumberextx.
*     JH/22.04.98/4.0C (Ende)

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = twarehousenumberdata-material_long.
        APPEND tmaterial.
      ENDIF.
    ENDIF.
  ENDLOOP.                             "MLGNKEY
* endif.

* MLGT-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MLGTM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT mlgtkey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MLGT_SINGLE_READ'
      EXPORTING
        matnr         = mlgtkey-matnr
        lgnum         = mlgtkey-lgnum
        lgtyp         = mlgtkey-lgtyp
      IMPORTING
        wmlgt         = mlgt
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.

    IF sy-subrc = 0.
      CLEAR tstoragetypedata.
      CALL FUNCTION 'MAP2E_MLGT_TO_BAPIE1MLGTRT'
        EXPORTING
          mlgt         = mlgt
        CHANGING
          bapie1mlgtrt = tstoragetypedata
        EXCEPTIONS
          OTHERS       = 0.

      tstoragetypedata-function = mlgtkey-msgfn.
      APPEND tstoragetypedata.

*       Ankreuzleiste belegen
      CLEAR tstoragetypedatax.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tstoragetypedatax = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tstoragetypedatax-function  = tstoragetypedata-function.
      tstoragetypedatax-material_long  = tstoragetypedata-material_long.   "MFLE
      tstoragetypedatax-material  = tstoragetypedata-material.
      tstoragetypedatax-whse_no   = tstoragetypedata-whse_no.
      tstoragetypedatax-stge_type = tstoragetypedata-stge_type.
      CLEAR tstoragetypedatax-material_external.                           "DIMP activation
      CLEAR tstoragetypedatax-material_guid.                               "DIMP activation
      CLEAR tstoragetypedatax-material_version.                            "DIMP activation
      APPEND tstoragetypedatax.
*             .....Reduce fields for the segment
*             CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                  EXPORTING
*                       MESSAGE_TYPE = MESSAGE_TYPE
*                       SEGMENT_TYPE = C_SEGNAM_E1MLGTM
*                       SEGMENT_DATA = T_IDOC_DATA-SDATA
*                  IMPORTING
*                       SEGMENT_DATA = T_IDOC_DATA-SDATA.
*             APPEND T_IDOC_DATA.

*     JH/22.04.98/4.0C (Anfang)
*     Userexit zur Übergabe von kundeneigenen Feldern
      CALL CUSTOMER-FUNCTION '003'
        EXPORTING
          message_type      = message_type
          parameter_name    = c_parnam_storagetypeext
          f_mlgt            = mlgt
        TABLES
          t_storagetypeext  = tstoragetypeext
          t_storagetypeextx = tstoragetypeextx.
*     JH/22.04.98/4.0C (Ende)

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = tstoragetypedata-material_long.
        APPEND tmaterial.
      ENDIF.
    ENDIF.
  ENDLOOP.                             "MLGTKEY
* ENDIF.

* MVKE-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MVKEM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT mvkekey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'MVKE_SINGLE_READ'
      EXPORTING
        matnr         = mvkekey-matnr
        vkorg         = mvkekey-vkorg
        vtweg         = mvkekey-vtweg
      IMPORTING
        wmvke         = mvke
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    IF sy-subrc = 0.
      CLEAR tsalesdata.
      CALL FUNCTION 'MAP2E_MVKE_TO_BAPIE1MVKERT'
        EXPORTING
          mvke         = mvke
        CHANGING
          bapie1mvkert = tsalesdata
        EXCEPTIONS
          OTHERS       = 0.

      tsalesdata-function = mvkekey-msgfn.
      APPEND tsalesdata.

*       Ankreuzleiste belegen
      CLEAR tsalesdatax.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tsalesdatax = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tsalesdatax-function   = tsalesdata-function.
      tsalesdatax-material_long   = tsalesdata-material_long.    "MFLE
      tsalesdatax-material   = tsalesdata-material.
      tsalesdatax-sales_org  = tsalesdata-sales_org.
      tsalesdatax-distr_chan = tsalesdata-distr_chan.
      CLEAR tsalesdatax-material_external.                       "DIMP activation
      CLEAR tsalesdatax-material_guid.                           "DIMP activation
      CLEAR tsalesdatax-material_version.                        "DIMP activation
      APPEND tsalesdatax.
*       .....Reduce fields for the segment
*       CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*            EXPORTING
*                 MESSAGE_TYPE = MESSAGE_TYPE
*                 SEGMENT_TYPE = C_SEGNAM_E1MVKEM
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA
*            IMPORTING
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA.
*       APPEND T_IDOC_DATA.

*     JH/22.04.98/4.0C (Anfang)
*     Userexit zur Übergabe von kundeneigenen Feldern
      CALL CUSTOMER-FUNCTION '003'
        EXPORTING
          message_type   = message_type
          parameter_name = c_parnam_salesext
          f_mvke         = mvke
        TABLES
          t_salesext     = tsalesext
          t_salesextx    = tsalesextx.
*     JH/22.04.98/4.0C (Ende)

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = tsalesdata-material_long.
        APPEND tmaterial.
      ENDIF.
    ENDIF.
  ENDLOOP.                             "MVKEKEY
* ENDIF.

* WLK2-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1WLK2M
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
  LOOP AT wlk2key WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    CALL FUNCTION 'WLK2_SINGLE_READ'
      EXPORTING
        matnr         = wlk2key-matnr
        vkorg         = wlk2key-vkorg
        vtweg         = wlk2key-vtweg
        werks         = wlk2key-werks
      IMPORTING
        wwlk2         = wlk2
      EXCEPTIONS
        error_message = 1
        OTHERS        = 2.
    IF sy-subrc = 0.
      CLEAR tposdata.
      CALL FUNCTION 'MAP2E_WLK2_TO_BAPIE1WLK2RT'
        EXPORTING
          wlk2         = wlk2
        CHANGING
          bapie1wlk2rt = tposdata
        EXCEPTIONS
          OTHERS       = 0.

      tposdata-function = wlk2key-msgfn.
      APPEND tposdata.

*       Ankreuzleiste belegen
      CLEAR tposdatax.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tposdatax = ankreuzleiste.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tposdatax-function   = tposdata-function.
      tposdatax-material_long   = tposdata-material_long.    "MFLE
      tposdatax-material   = tposdata-material.
      tposdatax-sales_org  = tposdata-sales_org.
      tposdatax-distr_chan = tposdata-distr_chan.
      tposdatax-plant      = tposdata-plant.
      CLEAR tposdatax-material_external.                     "DIMP activation
      CLEAR tposdatax-material_guid.                         "DIMP activation
      CLEAR tposdatax-material_version.                      "DIMP activation
      APPEND tposdatax.
*       .....Reduce fields for the segment
*       CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*            EXPORTING
*                 MESSAGE_TYPE = MESSAGE_TYPE
*                 SEGMENT_TYPE = C_SEGNAM_E1WLK2M
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA
*            IMPORTING
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA.
*       APPEND T_IDOC_DATA.

*     JH/22.04.98/4.0C (Anfang)
*     Userexit zur Übergabe von kundeneigenen Feldern
      CALL CUSTOMER-FUNCTION '003'
        EXPORTING
          message_type   = message_type
          parameter_name = c_parnam_posext
          f_wlk2         = wlk2
        TABLES
          t_posext       = tposext
          t_posextx      = tposextx.
*     JH/22.04.98/4.0C (Ende)

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = tposdata-material_long.
        APPEND tmaterial.
      ENDIF.
    ENDIF.
  ENDLOOP.                             "WLK2KEY
* ENDIF.

* MLAN-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MLANM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
*   Gültige Steuertypen einlesen
  CALL FUNCTION 'TSTL_FULL_READ'
    TABLES
      ttstl = ttstl.
  LOOP AT mlankey WHERE mandt = sy-mandt
                    AND matnr = p_head_matnr.
    SELECT SINGLE * FROM mlan WHERE matnr = mlankey-matnr
                              AND   aland = mlankey-aland.
    IF sy-subrc = 0.
      CLEAR ttaxclassifications.
      ttaxclassifications-function        = mlankey-msgfn.
      ttaxclassifications-material_long   = mlankey-matnr.
      ttaxclassifications-depcountry      = mlankey-aland.
      IF NOT ttaxclassifications-depcountry IS INITIAL.
        CALL FUNCTION 'COUNTRY_CODE_SAP_TO_ISO'
          EXPORTING
            sap_code  = ttaxclassifications-depcountry
          IMPORTING
            iso_code  = ttaxclassifications-depcountry_iso
          EXCEPTIONS
            not_found = 1
            OTHERS    = 2.
      ENDIF.
*       Verkaufssteuern
      ttaxclassifications-taxclass_1 = mlan-taxm1.
      IF NOT ttaxclassifications-taxclass_1 IS INITIAL.
        READ TABLE ttstl WITH KEY talnd = mlan-aland
                                   lfdnr = '1'
                          BINARY SEARCH.
        IF sy-subrc = 0.
          ttaxclassifications-tax_type_1 = ttstl-tatyp.
        ENDIF.
      ENDIF.
      ttaxclassifications-taxclass_2 = mlan-taxm2.
      IF NOT ttaxclassifications-taxclass_2 IS INITIAL.
        READ TABLE ttstl WITH KEY talnd = mlan-aland
                                   lfdnr = '2'
                          BINARY SEARCH.
        IF sy-subrc = 0.
          ttaxclassifications-tax_type_2 = ttstl-tatyp.
        ENDIF.
      ENDIF.
      ttaxclassifications-taxclass_3 = mlan-taxm3.
      IF NOT ttaxclassifications-taxclass_3 IS INITIAL.
        READ TABLE ttstl WITH KEY talnd = mlan-aland
                                   lfdnr = '3'
                          BINARY SEARCH.
        IF sy-subrc = 0.
          ttaxclassifications-tax_type_3 = ttstl-tatyp.
        ENDIF.
      ENDIF.
      ttaxclassifications-taxclass_4 = mlan-taxm4.
      IF NOT ttaxclassifications-taxclass_4 IS INITIAL.
        READ TABLE ttstl WITH KEY talnd = mlan-aland
                                   lfdnr = '4'
                          BINARY SEARCH.
        IF sy-subrc = 0.
          ttaxclassifications-tax_type_4 = ttstl-tatyp.
        ENDIF.
      ENDIF.
      ttaxclassifications-taxclass_5 = mlan-taxm5.
      IF NOT ttaxclassifications-taxclass_5 IS INITIAL.
        READ TABLE ttstl WITH KEY talnd = mlan-aland
                                   lfdnr = '5'
                          BINARY SEARCH.
        IF sy-subrc = 0.
          ttaxclassifications-tax_type_5 = ttstl-tatyp.
        ENDIF.
      ENDIF.
      ttaxclassifications-taxclass_6 = mlan-taxm6.
      IF NOT ttaxclassifications-taxclass_6 IS INITIAL.
        READ TABLE ttstl WITH KEY talnd = mlan-aland
                                   lfdnr = '6'
                          BINARY SEARCH.
        IF sy-subrc = 0.
          ttaxclassifications-tax_type_6 = ttstl-tatyp.
        ENDIF.
      ENDIF.
      ttaxclassifications-taxclass_7 = mlan-taxm7.
      IF NOT ttaxclassifications-taxclass_7 IS INITIAL.
        READ TABLE ttstl WITH KEY talnd = mlan-aland
                                   lfdnr = '7'
                          BINARY SEARCH.
        IF sy-subrc = 0.
          ttaxclassifications-tax_type_7 = ttstl-tatyp.
        ENDIF.
      ENDIF.
      ttaxclassifications-taxclass_8 = mlan-taxm8.
      IF NOT ttaxclassifications-taxclass_8 IS INITIAL.
        READ TABLE ttstl WITH KEY talnd = mlan-aland
                                   lfdnr = '8'
                          BINARY SEARCH.
        IF sy-subrc = 0.
          ttaxclassifications-tax_type_8 = ttstl-tatyp.
        ENDIF.
      ENDIF.
      ttaxclassifications-taxclass_9 = mlan-taxm9.
      IF NOT ttaxclassifications-taxclass_9 IS INITIAL.
        READ TABLE ttstl WITH KEY talnd = mlan-aland
                                   lfdnr = '9'
                          BINARY SEARCH.
        IF sy-subrc = 0.
          ttaxclassifications-tax_type_9 = ttstl-tatyp.
        ENDIF.
      ENDIF.
*       Einkaufssteuern
      ttaxclassifications-tax_ind = mlan-taxim.
      APPEND ttaxclassifications.

*       Anmerkung: Keine Ankreuzleiste unterstützt
*       -> Coding dazu auskommentiert! (siehe '*#')
*       Ankreuzleiste belegen
*#      CLEAR TTAXCLASSIFICATIONSX.
*       Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
*#      TTAXCLASSIFICATIONSX = ANKREUZLEISTE.
*       Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*#      TTAXCLASSIFICATIONSX-FUNCTION
*#                                = TTAXCLASSIFICATIONS-FUNCTION.
*#      TTAXCLASSIFICATIONSX-MATERIAL
*#                                = TTAXCLASSIFICATIONS-MATERIAL.
*#      TTAXCLASSIFICATIONSX-DEPCOUNTRY
*#                                = TTAXCLASSIFICATIONS-DEPCOUNTRY.
*#      TTAXCLASSIFICATIONSX-DEPCOUNTRY_ISO
*#                                = TTAXCLASSIFICATIONS-DEPCOUNTRY_ISO.
*#      APPEND TTAXCLASSIFICATIONSX.
*       .....Reduce fields for the segment
*       CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*            EXPORTING
*                 MESSAGE_TYPE = MESSAGE_TYPE
*                 SEGMENT_TYPE = C_SEGNAM_E1MLANM
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA
*            IMPORTING
*                 SEGMENT_DATA = T_IDOC_DATA-SDATA.
*       APPEND T_IDOC_DATA.

*     Filterwerte festhalten
*     Note 595027
      IF NOT filtobj_relev-material IS INITIAL.
        tmaterial = ttaxclassifications-material_long.
        APPEND tmaterial.
      ENDIF.
    ENDIF.
  ENDLOOP.                             "MLANKEY
* ENDIF.

* MLTX-Daten
* CALL FUNCTION 'IDOC_REDUCTION_SEGMENT_TEST'
*      EXPORTING
*           MESSAGE_TYPE = MESSAGE_TYPE
*           SEGMENT_TYPE = C_SEGNAM_E1MTXHM
*      IMPORTING
*           ACTIVE       = ACTIVE_FLAG.
* IF ACTIVE_FLAG = C_TRUE.
* JH/15.06.98/4.0C  KPr141366  Hinweis 106677 (Anfang)
* LOOP AT STXHKEY WHERE MANDT = SY-MANDT.
* TDNAME(18) kann hier leider nicht durch TDNAME(LAENGE_MATNR) ersetzt
* werden, weil nur Konstanten erlaubt sind!
  DATA : lv_matnr_length TYPE i,
         l_vkorg         TYPE mvke-vkorg,
         l_vtweg         TYPE mvke-vtweg.

  LOOP AT stxhkey WHERE mandt      = sy-mandt
                    AND tdname(40) = p_head_matnr.
* JH/15.06.98/4.0C  KPr141366  Hinweis 106677 (Anfang)
    CALL FUNCTION 'READ_TEXT'
      EXPORTING
        client                  = sy-mandt
        id                      = stxhkey-tdid
        language                = stxhkey-tdspras
        name                    = stxhkey-tdname
        object                  = stxhkey-tdobject
        archive_handle          = 0
      IMPORTING
        header                  = itextheader
      TABLES
        lines                   = ttextlines
      EXCEPTIONS
        id                      = 01
        language                = 02
        name                    = 03
        not_found               = 04
        object                  = 05
        reference_check         = 06
        wrong_access_to_archive = 07.
    IF sy-subrc = 0.
*       Langtext-Header
      CLEAR smtext.
      CLEAR: l_matnr, l_vkorg, l_vtweg, l_werks.
      MOVE-CORRESPONDING itextheader TO smtext.

      IF smtext-tdid = '0001'.
        lv_matnr_length = strlen( p_head_matnr ).
        IF lv_matnr_length <= 18.
          l_vkorg = smtext-tdname+40(4).
          l_vtweg = smtext-tdname+44(2).
          l_matnr = smtext-tdname(18).
          CLEAR smtext-tdname.
          CONCATENATE p_head_matnr(18) l_vkorg l_vtweg
          INTO smtext-tdname RESPECTING BLANKS.
        ELSE.
          l_vkorg = smtext-tdname+40(4).
          l_vtweg = smtext-tdname+44(2).
          l_matnr = smtext-tdname(40).
        ENDIF.
      ELSEIF smtext-tdid = 'LTXT'.
        lv_matnr_length = strlen( p_head_matnr ).
        IF lv_matnr_length <= 18.
          l_werks = smtext-tdname+41(4).
          l_matnr = smtext-tdname(18).
          CLEAR smtext-tdname.
          CONCATENATE p_head_matnr(18) space l_werks
          INTO smtext-tdname RESPECTING BLANKS.
        ELSE.
          l_werks = smtext-tdname+41(4).
          l_matnr = smtext-tdname(40).
        ENDIF.
      ELSE.
        l_matnr = smtext-tdname.
      ENDIF.
*       Langtext-Lines
      LOOP AT ttextlines.
        MOVE-CORRESPONDING ttextlines TO smtext.
*         Sicherstellen, daß kein Löschcode in MSGFN steht
        stxhkey-msgfn = c_msgfn_r.
        CLEAR tmateriallongtext.
        CALL FUNCTION 'MAP2E_SMTEXT_TO_BAPIE1MLTXRT'
          EXPORTING
            smtext       = smtext
          CHANGING
            bapie1mltxrt = tmateriallongtext
          EXCEPTIONS
            OTHERS       = 0.
        tmateriallongtext-function = stxhkey-msgfn.

* JH/07.05.98/4.0C vorverlegt (s. unten) (Anfang)
*        perform get_key_len_material.
*        clear: l_matnr, l_werks.
*        l_matnr = tmateriallongtext-text_name(laenge_matnr).
*        if tmateriallongtext-text_id = matnotiz_tdid.
**         Werksabhängiger Langtext
*          add 1 to laenge_matnr.     "<-- Werk beginnt ab MATNR + 1 !!!
*          l_werks =
*              tmateriallongtext-text_name+laenge_matnr(laenge_werks).
*          subtract 1 from laenge_matnr.
*        endif.
* JH/07.05.98/4.0C vorverlegt (s. unten) (Ende)

* JH/07.05.98/4.0C (Anfang)
* Feld MATERIAL wegen Parameter-Hierarchie aufgenommen -> entsprechend
* versorgen
        tmateriallongtext-material_long = l_matnr.
* JH/07.05.98/4.0C (Ende)

        APPEND tmateriallongtext.

*         Anmerkung: Keine Ankreuzleiste unterstützt
*         -> Coding dazu auskommentiert! (siehe '*#')
*         Ankreuzleiste belegen
*#        CLEAR TMATERIALLONGTEXTX.
*         Alle Felder der Ankreuzleiste als änderungsrelevant kennz.
*#        TMATERIALLONGTEXTX = ANKREUZLEISTE.
*         Keys korrekt belegen (kein MOVE-CORRESPONDING!)
*#        TMATERIALLONGTEXTX-FUNCTION   = TMATERIALLONGTEXT-FUNCTION.
*#        TMATERIALLONGTEXTX-APPLOBJECT = TMATERIALLONGTEXT-APPLOBJECT.
*#        TMATERIALLONGTEXTX-TEXT_NAME  = TMATERIALLONGTEXT-TEXT_NAME.
*#        TMATERIALLONGTEXTX-TEXT_ID    = TMATERIALLONGTEXT-TEXT_ID.
*#        TMATERIALLONGTEXTX-LANGU      = TMATERIALLONGTEXT-LANGU.
*#        TMATERIALLONGTEXTX-LANGU_ISO  = TMATERIALLONGTEXT-LANGU_ISO.
*#        APPEND TMATERIALLONGTEXTX.
*           .....Reduce fields for the segment
*           CALL FUNCTION 'IDOC_REDUCTION_FIELD_REDUCE'
*                EXPORTING
*                     MESSAGE_TYPE = MESSAGE_TYPE
*                     SEGMENT_TYPE = C_SEGNAM_E1MTXLM
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA
*                IMPORTING
*                     SEGMENT_DATA = T_IDOC_DATA-SDATA.
      ENDLOOP.                         "TTEXTLINES
    ELSE.
*       Langtext wurde gelöscht -> nur Keys belegen
      CLEAR smtext.
      CLEAR: l_matnr, l_vkorg, l_vtweg, l_werks.

      MOVE-CORRESPONDING stxhkey TO smtext.
      IF smtext-tdid = '0001'.
        lv_matnr_length = strlen( p_head_matnr ).
        IF lv_matnr_length <= 18.
          l_vkorg = smtext-tdname+40(4).
          l_vtweg = smtext-tdname+44(2).
          l_matnr = smtext-tdname(18).
          CONCATENATE p_head_matnr(18) l_vkorg l_vtweg
          INTO smtext RESPECTING BLANKS.
        ELSE.
          l_vkorg = smtext-tdname+40(4).
          l_vtweg = smtext-tdname+44(2).
          l_matnr = smtext-tdname(40).
        ENDIF.
      ELSEIF smtext-tdid = 'LTXT'.
        lv_matnr_length = strlen( p_head_matnr ).
        IF lv_matnr_length <= 18.
          l_werks = smtext-tdname+41(4).
          CONCATENATE p_head_matnr(18) space l_werks
          INTO smtext RESPECTING BLANKS.
        ELSE.
          l_werks = smtext-tdname+41(4).
          l_matnr = smtext-tdname(40).
        ENDIF.
      ELSE.
        l_matnr = smtext-tdname.
      ENDIF.
*       Sicherstellen, daß Löschcode in MSGFN steht
      stxhkey-msgfn = c_msgfn_d.
      CLEAR tmateriallongtext.
      CALL FUNCTION 'MAP2E_SMTEXT_TO_BAPIE1MLTXRT'
        EXPORTING
          smtext       = smtext
        CHANGING
          bapie1mltxrt = tmateriallongtext
        EXCEPTIONS
          OTHERS       = 0.
      tmateriallongtext-function = stxhkey-msgfn.

* JH/07.05.98/4.0C vorverlegt (s. unten) (Anfang)
*      perform get_key_len_material.
*      clear: l_matnr, l_werks.
*      l_matnr = tmateriallongtext-text_name(laenge_matnr).
*      if tmateriallongtext-text_id = matnotiz_tdid.
**       Werksabhängiger Langtext
*        add 1 to laenge_matnr.     "<-- Werk beginnt ab MATNR + 1 !!!
*        l_werks =
*            tmateriallongtext-text_name+laenge_matnr(laenge_werks).
*        subtract 1 from laenge_matnr.
*      endif.
* JH/07.05.98/4.0C vorverlegt (s. unten) (Ende)

* JH/07.05.98/4.0C (Anfang)
* Feld MATERIAL wegen Parameter-Hierarchie aufgenommen -> entsprechend
* versorgen
      tmateriallongtext-material_long = l_matnr.
* JH/07.05.98/4.0C (Ende)

      APPEND tmateriallongtext.
    ENDIF.

*     Filterwerte festhalten
* JH/07.05.98/4.0C vorverlegt (s. oben) (Anfang)
*   PERFORM GET_KEY_LEN_MATERIAL.
*   CLEAR: L_MATNR, L_WERKS.
*   L_MATNR = TMATERIALLONGTEXT-TEXT_NAME(LAENGE_MATNR).
*   IF TMATERIALLONGTEXT-TEXT_ID = MATNOTIZ_TDID.
*       Werksabhängiger Langtext
*     ADD 1 TO LAENGE_MATNR.     "<-- Werk beginnt ab MATNR + 1 !!!
*     L_WERKS =
*             TMATERIALLONGTEXT-TEXT_NAME+LAENGE_MATNR(LAENGE_WERKS).
*     SUBTRACT 1 FROM LAENGE_MATNR.
*   ENDIF.
* JH/07.05.98/4.0C vorverlegt (s. oben) (Ende)
*   Note 595027
    IF  ( NOT filtobj_relev-material IS INITIAL )
    AND ( NOT l_matnr IS INITIAL ).
      tmaterial = l_matnr.
      APPEND tmaterial.
    ENDIF.
    IF  ( NOT filtobj_relev-plant IS INITIAL )
    AND ( NOT l_werks IS INITIAL ).
      tplant = l_werks.
      APPEND tplant.
    ENDIF.
  ENDLOOP.                             "STXHKEY
* ENDIF.

* Abschließender Aufruf des Userexits mit der Möglichkeit alle
* kundeneigenen Daten nochmal im Gesamten ändern zu können
  CALL CUSTOMER-FUNCTION '003'
    EXPORTING
      message_type          = message_type
      parameter_name        = space
    TABLES
      t_clientext           = tclientext
      t_clientextx          = tclientextx
      t_plantext            = tplantext
      t_plantextx           = tplantextx
      t_storagelocationext  = tstoragelocationext
      t_storagelocationextx = tstoragelocationextx
      t_valuationext        = tvaluationext
      t_valuationextx       = tvaluationextx
      t_warehousenumberext  = twarehousenumberext
      t_warehousenumberextx = twarehousenumberextx
      t_storagetypeext      = tstoragetypeext
      t_storagetypeextx     = tstoragetypeextx
      t_salesext            = tsalesext
      t_salesextx           = tsalesextx
      t_posext              = tposext
      t_posextx             = tposextx.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form var_bewertung_lesen
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM var_bewertung_lesen USING p_mara LIKE mara.

  DATA hausp LIKE ausp OCCURS 0 WITH HEADER LINE.

  DATA lt_products TYPE if_mgw_classific_access=>tt_products.
  DATA ls_ausp     TYPE ausp.

* MARA's der Varianten einlesen (aus Puffer)
  CALL FUNCTION 'LESEN_VARIANTEN_ZU_SA'
    EXPORTING
      sammelartikel        = p_mara-matnr
    TABLES
      varianten            = var_mara
    EXCEPTIONS
      enqueue_mode_changed = 1
      lock_on_material     = 2
      lock_system_error    = 3
      wrong_call           = 4
      not_found            = 5
      no_maw1_for_mara     = 6
      lock_on_marc         = 7
      lock_on_mbew         = 8
      error_message        = 9
      OTHERS               = 10.

* Merkmalsdaten zu den Varianten zusammenstellen
  CALL FUNCTION 'MATERIAL_READ_CLASSIFIC_RT'
    EXPORTING
      p_matnr        = p_mara-matnr
* Damit im FB MATERIAL_READ_CLASSIFIC_RT über den FB
* C026_SET_UPPER_CLASS_FOR_CP die Warengruppe gesetzt werden kann,
* muß die MARA gelesen werden -> wird aber nicht als Rückgabe
* gebraucht!
*     KZ_MARA_READ   = ' '             "Note 216337
      kz_mara_read   = 'X'             "Note 216337
      p_mara         = p_mara
*     KZ_MAKT_READ   = ' '
*     P_LANGU        = SY-LANGU
      kz_vari_read   = ' '
*     KZ_KLTYP_READ  = ' '
*     KZ_VALU_ALLOWED   = 'X'
*     KZ_VALU_ASSIGNED  = 'X'
*     KZ_CHAR_VARI_EXT  = 'X'
*     KZ_INT_ART     = ' '
*     KZRFB          = ' '
*     MAXTZ          = 0
*     SPERRMODUS     = ' '
*      IMPORTING
*     P_CLASS        =
*     P_KLTYP        =
*     P_MARA         =
*     P_MAKT         =
    TABLES
*     EXP_VAR_TAB    =
      exp_char       = tmerkm "alle Merkmale
      exp_valu       = tbewert "alle Werte
*     EXP_CHAR_VARI  =              "nur var.bild. Merkm.
*     EXP_VALU_VARI  =              "Bew. variantenb. Merkmale
*     EXP_VALU_ASSIGNED = TBEWERT      "zugeordnete Werte
*     EXP_CHAR_VARI_EXT =
    EXCEPTIONS
      wrong_call     = 1
      mara_not_exist = 2
      no_class       = 3
      no_char        = 4
      no_valu_vari   = 5
      error_message  = 6
      OTHERS         = 7.          "928600


  SORT tbewert BY atinn atflv atflb.
  SORT tmerkm  BY atinn.

* Liste der zu berücksichtigenden Merkmale zusammenstellen
  REFRESH r_atinn.
  r_atinn-sign   = 'I'.
  r_atinn-option = 'EQ'.
  LOOP AT tmerkm.
    r_atinn-low = tmerkm-atinn.
    APPEND r_atinn.
  ENDLOOP.

* Zur Sicherheit prüfen, ob Merkmale gefunden wurden -> bei VAR
* sollten zumindest immer var.bild. Merkmale vorhanden sein.
  CHECK NOT r_atinn[] IS INITIAL.     "note 304855

* Liste der zu berücksichtigenden Artikel zusammenstellen
  REFRESH r_objek.
  r_objek-sign   = 'I'.
  r_objek-option = 'EQ'.
  LOOP AT var_mara.                    "Varianten
    READ TABLE auspkey WITH KEY mandt = sy-mandt
                                matnr = var_mara-matnr
                       BINARY SEARCH.
    IF sy-subrc = 0.
*     Bewertungsdaten nur für Varianten mit AUSPKEY-Eintrag lesen
      IF cl_check_mm4x_genart_new=>check_setget_parameter( ) = abap_true.
        APPEND var_mara-matnr TO lt_products.
      ELSE.
        r_objek-low = var_mara-cuobf.
        APPEND r_objek.
      ENDIF.
    ENDIF.
  ENDLOOP.

  REFRESH hausp.

* R_OBJEK enthält im Änderungsfall nur dann einen Eintrag, wenn sich
* bei mind. 1 VAR die Bewertung der informativen Merkmale geändert hat.
* Wenn R_OBJEK leer ist darf der FB CLSE_SELECT_AUSP nicht aufgerufen
* werden, weil ansonsten unnötigerweise die AUSP aller Artikel gelesen
* werden, die zu den übergebenen Merkmalen bewertet wurden.

  IF cl_check_mm4x_genart_new=>check_setget_parameter( ) = abap_true.

    CHECK lt_products IS NOT INITIAL.

    TRY.
        cl_mat_classific_rt=>if_mgw_classific_access~get_instance( )->get_characteristic_valuation(
          EXPORTING
            it_products         = lt_products
            iv_inf_char_values  = abap_true
            iv_var_char_values  = abap_true
            itr_characteristics = r_atinn[]
          IMPORTING
            et_char_valuation_by_product = DATA(lt_char_valuation_by_product)
        ).
      CATCH cx_mat_classification.
        CLEAR lt_char_valuation_by_product.
    ENDTRY.

*   Map the data back to the AUSP format and enrich it with the CUBOF from table VAR_MARA
    LOOP AT lt_char_valuation_by_product ASSIGNING FIELD-SYMBOL(<ls_char_valuation_by_product>).
      READ TABLE var_mara WITH KEY
        matnr = <ls_char_valuation_by_product>-product
      ASSIGNING FIELD-SYMBOL(<ls_variant>).
      IF sy-subrc = 0.
        LOOP AT <ls_char_valuation_by_product>-char_values ASSIGNING FIELD-SYMBOL(<ls_char_value>).
          MOVE-CORRESPONDING <ls_char_value> TO ls_ausp.
          ls_ausp-objek = <ls_variant>-cuobf.
          APPEND ls_ausp TO hausp[].
        ENDLOOP.
      ENDIF.
    ENDLOOP.

  ELSE.

    CHECK NOT r_objek[] IS INITIAL.     "note 304855

*   Bewertungen zu den relevanten Merkmalen und Varianten lesen
    CALL FUNCTION 'CLSE_SELECT_AUSP'
      EXPORTING
        klart                     = class_art
        mafid                     = 'O'  "????Konstante
        key_date                  = sy-datum
      TABLES
        in_objek                  = r_objek
        in_atinn                  = r_atinn
        t_ausp                    = hausp
      EXCEPTIONS
        no_entry_found            = 1
        parameters_not_sufficient = 2
        OTHERS                    = 3.
  ENDIF.

  APPEND LINES OF hausp TO tausp.
  SORT tausp BY objek atinn atwrt atflv atflb.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form IDOC_ERZEUGEN
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM idoc_erzeugen .

* Bei mehrwertigen Merkmalen reicht 1 Eintrag in TCHARACTERISTICVALUE
* für das Merkmal, wenn Artikel mit mehreren Werten bewertet wurde,
* d.h. TCHARACTERISTICVALUE enthält mehrere Einträge für das Merkmal
* und TCHARACTERISTICVALUEX nur einen Eintrag -> doppelte Einträge
* löschen
  SORT tcharacteristicvaluex BY material_long char_name.
  DELETE ADJACENT DUPLICATES FROM tcharacteristicvaluex
                             COMPARING material_long char_name.

*  IF flag_testmode = c_true.
*   Wenn Testmodus vorliegt, dann Daten ins Memory stellen anstatt ein
*   IDOC zu erzeugen. Hierzu wird eine Kopie des generierten FB
*   ALE_MATERIAL_MAINTAINDATA_RT aufgerufen

*JH/28.07.99/4.6C (Anfang)
* Damit im  Testmodus keine Filterung von Parametern erfolgt, wird
* ein Dummy-System als log. System übergeben (nur in der Workarea
* der Tab. TBAPI_LOGSYS).
*    tbapi_logsys-logsys = 'DUMMY-JH'.
**JH/28.07.99/4.6C (Ende)
*
*    CALL FUNCTION 'ALE_MATERIAL_MAINTAINDATA_TEST'
*      EXPORTING
*        headdata                = iheaddata
*      TABLES
*        variantskeys            = tvariantskeys
*        characteristicvalue     = tcharacteristicvalue
*        characteristicvaluex    = tcharacteristicvaluex
*        clientdata              = tclientdata
*        clientdatax             = tclientdatax
*        clientext               = tclientext
*        clientextx              = tclientextx
*        addnlclientdata         = taddnlclientdata
*        addnlclientdatax        = taddnlclientdatax
*        materialdescription     = tmaterialdescription
*        plantdata               = tplantdata
*        plantdatax              = tplantdatax
*        plantext                = tplantext
*        plantextx               = tplantextx
*        forecastparameters      = tforecastparameters
*        forecastparametersx     = tforecastparametersx
*        forecastvalues          = tforecastvalues
*        totalconsumption        = ttotalconsumption
*        unplndconsumption       = tunplndconsumption
*        planningdata            = tplanningdata
*        planningdatax           = tplanningdatax
*        storagelocationdata     = tstoragelocationdata
*        storagelocationdatax    = tstoragelocationdatax
*        storagelocationext      = tstoragelocationext
*        storagelocationextx     = tstoragelocationextx
*        unitsofmeasure          = tunitsofmeasure
*        unitsofmeasurex         = tunitsofmeasurex
*        unitofmeasuretexts      = tunitofmeasuretexts
*        internationalartnos     = tinternationalartnos
*        vendorean               = tvendorean
*        layoutmoduleassgmt      = tlayoutmoduleassgmt
*        layoutmoduleassgmtx     = tlayoutmoduleassgmtx
*        taxclassifications      = ttaxclassifications
*        valuationdata           = tvaluationdata
*        valuationdatax          = tvaluationdatax
*        valuationext            = tvaluationext
*        valuationextx           = tvaluationextx
*        warehousenumberdata     = twarehousenumberdata
*        warehousenumberdatax    = twarehousenumberdatax
*        warehousenumberext      = twarehousenumberext
*        warehousenumberextx     = twarehousenumberextx
*        storagetypedata         = tstoragetypedata
*        storagetypedatax        = tstoragetypedatax
*        storagetypeext          = tstoragetypeext
*        storagetypeextx         = tstoragetypeextx
*        salesdata               = tsalesdata
*        salesdatax              = tsalesdatax
*        salesext                = tsalesext
*        salesextx               = tsalesextx
*        posdata                 = tposdata
*        posdatax                = tposdatax
*        posext                  = tposext
*        posextx                 = tposextx
*        materiallongtext        = tmateriallongtext
*        plantkeys               = tplantkeys
*        storagelocationkeys     = tstoragelocationkeys
*        distrchainkeys          = tdistrchainkeys
*        warehousenokeys         = twarehousenokeys
*        storagetypekeys         = tstoragetypekeys
*        valuationtypekeys       = tvaluationtypekeys
*        textilecomponents       = gt_textile_comp          "Note 1820980
*        fibercodes              = gt_textile_fibr          "Note 1820980
*        receivers               = tbapi_logsys
*        communication_documents = tcommunication_documents
*        application_objects     = tapplication_objects
*        segsalesstatus          = gt_sgt_mvke
*        segweightvolume         = gt_sgt_marm
*        segvaluationtype        = gt_sgt_madka
*        seasons                 = gt_seasons
*        segwarehousenumberdata  = gt_sgt_mlgn
*        segstoragetypedata      = gt_sgt_mlgt
**SDIMP change start I069729
*        segmrpgeneraldata       = gt_sgt_mrpgn
*        segmrpquantitydata      = gt_sgt_mrp
**SDIMP change end I069729
*      EXCEPTIONS
*        error_creating_idocs    = 1
*        OTHERS                  = 2.
*    IF sy-subrc <> 0.
**     Da kein IDoc erzeugt wird, kann auch kein Fehler auftreten!
*    ENDIF.
*  ELSE.                                "IDoc erzeugen
*   Empfänger für das IDoc ermitteln
    PERFORM empfaenger_ermitteln.

*   IDoc anlegen
    PERFORM idoc_anlegen.
*  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form EMPFAENGER_ERMITTELN
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM empfaenger_ermitteln .
  REFRESH: tbapi_logsys.

*JH/29.04.99/4.6A (Anfang)
* Keine Empfängerermittlung, wenn der Aufruf aus der DX-Workbench
* heraus erfolgt ist
  IF dxwb_call IS INITIAL.
*JH/29.04.99/4.6A (Ende)

*   Werte für die Filterobjekte zusammenstellen
    PERFORM filterwerte_erzeugen.

*   Empfänger unter Berücksichtigung der Filterwerte ermitteln
    CALL FUNCTION 'ALE_ASYNC_BAPI_GET_RECEIVER'
      EXPORTING
        object                   = bor_object
        method                   = maintaindata_rt_method
      TABLES
        receiver_input           = treceivers
        receivers                = tbapi_logsys
        filterobject_values      = tfiltobj_val
      EXCEPTIONS
        error_in_filterobjects   = 1
        error_in_ale_customizing = 2
        OTHERS                   = 3.
*JH/29.04.99/4.6A (Anfang)
  ELSE.
    tbapi_logsys[] = treceivers[].
  ENDIF.
*JH/29.04.99/4.6A (Ende)
ENDFORM.
*&---------------------------------------------------------------------*
*& Form IDOC_ANLEGEN
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM idoc_anlegen .

  DATA: lv_delete_checkboxes TYPE xchar.     "Note 595027
  DATA: lt_communication_documents TYPE STANDARD TABLE OF swotobjid. "Note 2562064

  "refresh: tcommunication_documents         "Note 2562064
  REFRESH: tapplication_objects.             "Note 2562064

* Note 595027
  IF artmas_filter IS INITIAL.
*   BADI-Instanz erzeugen
    CALL METHOD cl_exithandler=>get_instance
      EXPORTING
        exit_name        = 'ARTMAS_FILTERING'
*       NULL_INSTANCE_ACCEPTED        =
      IMPORTING
        act_imp_existing = artmas_filter_akt
      CHANGING
        instance         = artmas_filter
      EXCEPTIONS
        OTHERS           = 1.
  ENDIF.

  IF NOT artmas_filter_akt IS INITIAL.
*   Wenn aktive Implementierung vorhanden ist BADI aufrufen
    CALL METHOD artmas_filter->remove_checkbox_data
      EXPORTING
        idoc_head_data = iheaddata
      IMPORTING
        delete_data    = lv_delete_checkboxes.

    IF NOT lv_delete_checkboxes IS INITIAL.
*     Alle Ankreuzleistentabellen löschen, weil die empfangenden
*     Systeme reine Fremdsysteme sind, die mit den Ankreuzleisten
*     nicht umgehen können. Über die normale Datenfilterung sind
*     diese BAPI-Parameter nicht filterbar, denn sie werden
*     automatisch über das Wegfiltern des zugeordneten Nutzdaten-
*     parameters unterdrückt.
      REFRESH tcharacteristicvaluex.
      REFRESH tclientdatax.
      REFRESH tclientextx.
      REFRESH taddnlclientdatax.
      REFRESH tplantdatax.
      REFRESH tplantextx.
      REFRESH tforecastparametersx.
      REFRESH tplanningdatax.
      REFRESH tstoragelocationdatax.
      REFRESH tstoragelocationextx.
      REFRESH tunitsofmeasurex.
      REFRESH tlayoutmoduleassgmtx.
      REFRESH tvaluationdatax.
      REFRESH tvaluationextx.
      REFRESH twarehousenumberdatax.
      REFRESH twarehousenumberextx.
      REFRESH tstoragetypedatax.
      REFRESH tstoragetypeextx.
      REFRESH tsalesdatax.
      REFRESH tsalesextx.
      REFRESH tposdatax.
      REFRESH tposextx.
    ENDIF.
  ENDIF.

* note 1608178
  IF tapplication_objects-logsys IS INITIAL.
    CALL FUNCTION 'OWN_LOGICAL_SYSTEM_GET'
      IMPORTING
        own_logical_system             = tapplication_objects-logsys
      EXCEPTIONS
        own_logical_system_not_defined = 1
        OTHERS                         = 2.
  ENDIF.

  tapplication_objects-objtype = 'BUS1001001'.
  tapplication_objects-objkey  = iheaddata-material_long.
  APPEND tapplication_objects.

  CALL FUNCTION '/DLWUPEX/CONVERT_MATERIAL_DATA'
    EXPORTING
      headdata                = iheaddata
*     OBJ_TYPE                = 'BUS1001001'
*     SERIAL_ID               = '0'
    tables
      variantskeys            = tvariantskeys
      characteristicvalue     = tcharacteristicvalue
      characteristicvaluex    = tcharacteristicvaluex
      clientdata              = tclientdata
      clientdatax             = tclientdatax
      clientext               = tclientext
      clientextx              = tclientextx
      addnlclientdata         = taddnlclientdata
      addnlclientdatax        = taddnlclientdatax
      materialdescription     = tmaterialdescription
      plantdata               = tplantdata
      plantdatax              = tplantdatax
      plantext                = tplantext
      plantextx               = tplantextx
      forecastparameters      = tforecastparameters
      forecastparametersx     = tforecastparametersx
      forecastvalues          = tforecastvalues
      totalconsumption        = ttotalconsumption
      unplndconsumption       = tunplndconsumption
      planningdata            = tplanningdata
      planningdatax           = tplanningdatax
      storagelocationdata     = tstoragelocationdata
      storagelocationdatax    = tstoragelocationdatax
      storagelocationext      = tstoragelocationext
      storagelocationextx     = tstoragelocationextx
      unitsofmeasure          = tunitsofmeasure
      unitsofmeasurex         = tunitsofmeasurex
      unitofmeasuretexts      = tunitofmeasuretexts
      internationalartnos     = tinternationalartnos
      vendorean               = tvendorean
      layoutmoduleassgmt      = tlayoutmoduleassgmt
      layoutmoduleassgmtx     = tlayoutmoduleassgmtx
      taxclassifications      = ttaxclassifications
      valuationdata           = tvaluationdata
      valuationdatax          = tvaluationdatax
      valuationext            = tvaluationext
      valuationextx           = tvaluationextx
      warehousenumberdata     = twarehousenumberdata
      warehousenumberdatax    = twarehousenumberdatax
      warehousenumberext      = twarehousenumberext
      warehousenumberextx     = twarehousenumberextx
      storagetypedata         = tstoragetypedata
      storagetypedatax        = tstoragetypedatax
      storagetypeext          = tstoragetypeext
      storagetypeextx         = tstoragetypeextx
      salesdata               = tsalesdata
      salesdatax              = tsalesdatax
      salesext                = tsalesext
      salesextx               = tsalesextx
      posdata                 = tposdata
      posdatax                = tposdatax
      posext                  = tposext
      posextx                 = tposextx
      materiallongtext        = tmateriallongtext
      plantkeys               = tplantkeys
      storagelocationkeys     = tstoragelocationkeys
      distrchainkeys          = tdistrchainkeys
      warehousenokeys         = twarehousenokeys
      storagetypekeys         = tstoragetypekeys
      valuationtypekeys       = tvaluationtypekeys
      textilecomponents       = gt_textile_comp
      fibercodes              = gt_textile_fibr
      receivers               = tbapi_logsys
      communication_documents = lt_communication_documents
      application_objects     = tapplication_objects
      segsalesstatus          = gt_sgt_mvke
      segweightvolume         = gt_sgt_marm
      segvaluationtype        = gt_sgt_madka
      seasons                 = gt_seasons
      segwarehousenumberdata  = gt_sgt_mlgn
      segstoragetypedata      = gt_sgt_mlgt
      segmrpgeneraldata       = gt_sgt_mrpgn
      segmrpquantitydata      = gt_sgt_mrp
    EXCEPTIONS
      error_creating_idocs    = 1
      OTHERS                  = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*   Wenn ein Fehler bei Aufbau der IDocs entstanden ist, kann trotzdem
*   ein IDoc angelegt worden sein. Der Status des IDoc ist dann
*   'fehlerhaft' -> Anzahl erzeugter IDoc's = 1 anstatt = 0 annehmen.
    created_comm_idocs = 1.
  ELSE.
    DESCRIBE TABLE lt_communication_documents LINES sy-tfill. " note 2562064
    created_comm_idocs = sy-tfill.
  ENDIF.
  communication_documents[] = lt_communication_documents[]. " note 2437280, 2562064

ENDFORM.
*&---------------------------------------------------------------------*
*& Form FILTERWERTE_ERZEUGEN
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM filterwerte_erzeugen .

* Note 595027
  DATA: lt_filtobj_typ TYPE bdi_flttyp_tab,
        lt_filtobj_val TYPE bdi_fobj_tab.

  REFRESH tfiltobj_val.

* Vorerst auskommentiert
* SORT TMATERIAL.   DELETE ADJACENT DUPLICATES FROM TMATERIAL.
  SORT tmatl_type.  DELETE ADJACENT DUPLICATES FROM tmatl_type.
  SORT tmatl_group. DELETE ADJACENT DUPLICATES FROM tmatl_group.
  SORT tmatl_cat.   DELETE ADJACENT DUPLICATES FROM tmatl_cat.
  SORT tplant.      DELETE ADJACENT DUPLICATES FROM tplant.
  SORT tval_area.   DELETE ADJACENT DUPLICATES FROM tval_area.
  SORT tlangu.      DELETE ADJACENT DUPLICATES FROM tlangu.

* Filterwerte pro Filterobjekt zuordnen
  LOOP AT tfiltobj_typ.
    CLEAR tfiltobj_val.
    tfiltobj_val-objtype = tfiltobj_typ-objtype.
    CASE tfiltobj_typ-objtype.
* Vorerst auskommentiert
*     WHEN FOBJ_MATERIAL.
*       LOOP AT TMATERIAL.
*         TFILTOBJ_VAL-OBJVALUE = TMATERIAL.
*         APPEND TFILTOBJ_VAL.
*       ENDLOOP.
      WHEN fobj_matl_type.
        LOOP AT tmatl_type.
          tfiltobj_val-objvalue = tmatl_type.
          APPEND tfiltobj_val.
        ENDLOOP.
      WHEN fobj_matl_group.
        LOOP AT tmatl_group.
          tfiltobj_val-objvalue = tmatl_group.
          APPEND tfiltobj_val.
        ENDLOOP.
      WHEN fobj_matl_cat.
        LOOP AT tmatl_cat.
          tfiltobj_val-objvalue = tmatl_cat.
          APPEND tfiltobj_val.
        ENDLOOP.
      WHEN fobj_plant.
        LOOP AT tplant.
          tfiltobj_val-objvalue = tplant.
          APPEND tfiltobj_val.
        ENDLOOP.
        IF tplant[] IS INITIAL.                         "v note 2562826
          APPEND tfiltobj_val.
        ENDIF.                                          "^ note 2562826
      WHEN fobj_val_area.
        LOOP AT tval_area.
          tfiltobj_val-objvalue = tval_area.
          APPEND tfiltobj_val.
        ENDLOOP.
        IF tval_area[] IS INITIAL.                      "v note 2562826
          APPEND tfiltobj_val.
        ENDIF.                                          "^ note 2562826
      WHEN fobj_langu.
        LOOP AT tlangu.
          tfiltobj_val-objvalue = tlangu.
          APPEND tfiltobj_val.
        ENDLOOP.
        IF tlangu[] IS INITIAL.                         "v note 2562826
          APPEND tfiltobj_val.
        ENDIF.                                          "^ note 2562826
    ENDCASE.
  ENDLOOP.

* Note 595027
  IF artmas_filter IS INITIAL.
*   BADI-Instanz erzeugen
    CALL METHOD cl_exithandler=>get_instance
      EXPORTING
        exit_name        = 'ARTMAS_FILTERING'
*       NULL_INSTANCE_ACCEPTED        =
      IMPORTING
        act_imp_existing = artmas_filter_akt
      CHANGING
        instance         = artmas_filter
      EXCEPTIONS
        OTHERS           = 1.
  ENDIF.

  IF NOT artmas_filter_akt IS INITIAL.
*   Wenn aktive Implementierung vorhanden ist BADI aufrufen
    lt_filtobj_typ[] = tfiltobj_typ[].
    lt_filtobj_val[] = tfiltobj_val[].

    CALL METHOD artmas_filter->add_filter_values
      EXPORTING
        idoc_head_data    = iheaddata
        filter_types_tab  = lt_filtobj_typ
      CHANGING
        filter_values_tab = lt_filtobj_val.

    tfiltobj_val[] = lt_filtobj_val[].
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form ART_BEWERTUNG_LESEN
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- MARA
*&---------------------------------------------------------------------*
FORM art_bewertung_lesen  CHANGING p_mara LIKE mara.

  DATA hobtab LIKE inob-obtab.
  DATA hkltyp LIKE klah-wwskz.
*JH/07.04.99/4.6A (Anfang)
  DATA hausp  LIKE ausp OCCURS 0 WITH HEADER LINE.
  DATA hklah  LIKE klah OCCURS 1 WITH HEADER LINE.
*JH/07.04.99/4.6A (Ende)

  DATA ls_ausp TYPE ausp.

  REFRESH tausp.
  REFRESH tinf_ausp.                                      "note 367970

  IF p_mara-attyp = attyp_samm.        "Sammelartikel
    hobtab = class_table_kl.
  ELSE.                                "sonstige Artikel
    hobtab = class_table_ob.
  ENDIF.

* Interne Objektnummer des Artikels (weil in MARA nicht belegt)
  CLEAR inob.
  SELECT * FROM  inob
         WHERE  obtab       = hobtab
         AND    objek       = p_mara-matnr
         AND    klart       = class_art.
  ENDSELECT.

  CHECK NOT inob-cuobj IS INITIAL.

* CUOBJ in MARA hinterlegen, damit Zugriff über die CUOBJ in FORM
* BEWERTUNG_UEBERNEHMEN möglich ist
  p_mara-cuobf = inob-cuobj.

* Merkmalsdaten des Artikels zusammenstellen
  CALL FUNCTION 'MATERIAL_READ_CLASSIFIC_RT'
    EXPORTING
      p_matnr        = p_mara-matnr
* Damit im FB MATERIAL_READ_CLASSIFIC_RT über den FB
* C026_SET_UPPER_CLASS_FOR_CP die Warengruppe gesetzt werden kann,
* muß die MARA gelesen werden -> wird aber nicht als Rückgabe
* gebraucht!
*     KZ_MARA_READ   = ' '             "Note 216337
      kz_mara_read   = 'X'             "Note 216337
      p_mara         = p_mara
*     KZ_MAKT_READ   = ' '
*     P_LANGU        = SY-LANGU
      kz_vari_read   = ' '
      kz_kltyp_read  = 'X'
*     KZ_VALU_ALLOWED   = 'X'
*     KZ_VALU_ASSIGNED  = 'X'
*     KZ_CHAR_VARI_EXT  = 'X'
*     KZ_INT_ART     = ' '
*     KZRFB          = ' '
*     MAXTZ          = 0
*     SPERRMODUS     = ' '
    IMPORTING
      p_class        = wg_class
      p_kltyp        = hkltyp
      p_conf_klart   = gv_config_klart
      p_conf_class   = gv_config_class
*     P_MARA         =
*     P_MAKT         =
    TABLES
*     EXP_VAR_TAB    =
      exp_char       = tmerkm "alle Merkmale
      exp_valu       = tbewert "alle Werte
*JH/07.04.99/4.6A (Anfang)
*     EXP_CHAR_VARI  =              "nur var.bild. Merkm.
      exp_char_vari  = tmerkm_var   "nur var.bild. Merkm.
*JH/07.04.99/4.6A (Ende)
*     EXP_VALU_VARI  =              "Bew. variantenb. Merkmale
*     EXP_VALU_ASSIGNED =              "zugeordnete Werte
*     EXP_CHAR_VARI_EXT =
    EXCEPTIONS
      wrong_call     = 1
      mara_not_exist = 2
      no_class       = 3
      no_char        = 4
      no_valu_vari   = 5
      error_message  = 6
      OTHERS         = 7.   "928600

* Prüfen, ob bzgl. der Warengruppe oder bzgl. eines Merkmalprofils
* bewertet wurde. Wenn zum Merkmalsprofil bewertet wurde, muß dieses
* im Kopfdatensegment mitgegeben werden.
  IF hkltyp = wwskzm.
    set_mprof = 'X'.
  ELSE.
    CLEAR set_mprof.
  ENDIF.

  SORT tbewert BY atinn atflv atflb.
  SORT tmerkm  BY atinn.

* Liste der zu berücksichtigenden Merkmale zusammenstellen
  REFRESH r_atinn.
  r_atinn-sign   = 'I'.
  r_atinn-option = 'EQ'.
  LOOP AT tmerkm.
    r_atinn-low = tmerkm-atinn.
    APPEND r_atinn.
  ENDLOOP.

* Zur Sicherheit prüfen, ob Merkmale gefunden wurden -> wenn keine
* Merkmale gefunden wurden, braucht keine Merkmalsbewertung für
* den Artikel ermittelt zu werden, auch nicht für die SA-Klasse.
  CHECK NOT r_atinn[] IS INITIAL.     "note 304855

  IF cl_check_mm4x_genart_new=>check_setget_parameter( ) = abap_true.

    TRY.
        cl_mat_classific_rt=>if_mgw_classific_access~get_instance( )->get_characteristic_valuation(
          EXPORTING
            iv_product          = p_mara-matnr
            iv_inf_char_values  = abap_true
            iv_var_char_values  = abap_true
            itr_characteristics = r_atinn[]
          IMPORTING
            et_characteristic_valuation = DATA(lt_characteristic_valuation)
        ).
      CATCH cx_mat_classification.
        CLEAR lt_characteristic_valuation.
    ENDTRY.

*   map data back to AUSP format and fill field objek accordingly
    LOOP AT lt_characteristic_valuation ASSIGNING FIELD-SYMBOL(<ls_characteristic_value>).
      MOVE-CORRESPONDING <ls_characteristic_value> TO ls_ausp.
      ls_ausp-objek = p_mara-cuobf.
      APPEND ls_ausp TO tausp[].
    ENDLOOP.

  ELSE.

*   Liste der zu berücksichtigenden Artikel zusammenstellen
    REFRESH r_objek.
    r_objek-sign   = 'I'.
    r_objek-option = 'EQ'.
    r_objek-low = inob-cuobj.
    APPEND r_objek.

*   Bewertungen zu den relevanten Merkmalen und Artikel lesen
    CALL FUNCTION 'CLSE_SELECT_AUSP'
      EXPORTING
        klart                     = class_art
        mafid                     = 'O'  "????Konstante
        key_date                  = sy-datum
      TABLES
        in_objek                  = r_objek
        in_atinn                  = r_atinn
        t_ausp                    = tausp
      EXCEPTIONS
        no_entry_found            = 1
        parameters_not_sufficient = 2
        OTHERS                    = 3.

  ENDIF.

*JH/07.04.99/4.6A (Anfang)
* Für Sammelartikel ist auf Ebene der Sammelartikel-Klasse eine
* Merkmalswerteeinschränkung möglich (für var.bild. u. informative
* Merkmale). Im MATERIAL_UPDATE_ALL_RETAIL wird bereits eine
* Merkmalswerteeinschränkung auf Ebene des SA für var.bild. Merkmale
* unterstützt, d.h. im Datenübernahmefall werden Merkmalsbewertungen
* für den Sammelartikel für var.bild. Merkmale als Einschränkung auf
* Ebene der SA-Klasse interpretiert. ALE-Ausgangsseitig wird dies noch
* nicht unterstützt -> zur Sammelartikelklasse müssen die Merkmals-
* bewertungen für die var.bild. Merkmale ermittelt werden und als
* Merkmalsbewertungen des Sammelartikels im IDOC hinterlegt werden.
  IF p_mara-attyp = attyp_samm.        "Sammelartikel

    IF cl_check_mm4x_genart_new=>check_setget_parameter( ) = abap_true.

      TRY.
          DATA(lt_char_value_restrictitions) = cl_mat_classific_rt=>if_mgw_classific_access~get_instance( )->get_char_value_restrictions(
                                                 EXPORTING
                                                   iv_product                 = p_mara-matnr
                                                   itr_characteristics        = r_atinn[]
          ).
        CATCH cx_mat_classification.
          CLEAR lt_char_value_restrictitions.
      ENDTRY.

*     map data back to AUSP format and fill field objek accordingly
*     generic article can only have restrictions on variant-creating characteristics
*     no restrictions on informative characteristics anymore
      LOOP AT lt_char_value_restrictitions ASSIGNING <ls_characteristic_value>.
        MOVE-CORRESPONDING <ls_characteristic_value> TO ls_ausp.
        ls_ausp-objek = p_mara-cuobf.
        APPEND ls_ausp TO tausp[].
      ENDLOOP.

    ELSE.

      hklah-klart = class_art.
      hklah-class = p_mara-matnr.
      APPEND hklah.
      CALL FUNCTION 'CLSE_SELECT_KLAH'
        TABLES
          imp_exp_klah   = hklah
        EXCEPTIONS
          no_entry_found = 1
          OTHERS         = 2.
      IF sy-subrc = 0.
        READ TABLE hklah INDEX 1.

        SORT tmerkm_var BY atinn.

*       Liste der zu berücksichtigenden Merkmale zusammenstellen
        REFRESH r_atinn.
        r_atinn-sign   = 'I'.
        r_atinn-option = 'EQ'.
        LOOP AT tmerkm.                                   "note 367970
          r_atinn-low = tmerkm-atinn.
          APPEND r_atinn.
        ENDLOOP.

*       Liste der zu berücksichtigenden Klassen zusammenstellen
        REFRESH r_objek.
        r_objek-sign   = 'I'.
        r_objek-option = 'EQ'.
        r_objek-low = hklah-clint.
        APPEND r_objek.

*       Bewertungen zu den var.bild. Merkmalen der SA-Klasse lesen
        CALL FUNCTION 'CLSE_SELECT_AUSP'
          EXPORTING
            klart                     = class_art
            mafid                     = 'K'  "????Konstante
            key_date                  = sy-datum
          TABLES
            in_objek                  = r_objek
            in_atinn                  = r_atinn
            t_ausp                    = hausp
          EXCEPTIONS
            no_entry_found            = 1
            parameters_not_sufficient = 2
            OTHERS                    = 3.

*       Die gefundenen Merkmalsbewertungen unter dem Objekt 'Sammelart.'
*       ablegen anstatt unter der Klasse 'Sammelartikel'.
        LOOP AT hausp.
          READ TABLE tmerkm_var WITH KEY atinn = hausp-atinn "note 367970
                                BINARY SEARCH.
          IF sy-subrc = 0.
*           Variantenbildendes Merkmal
            hausp-objek = inob-cuobj.
            APPEND hausp TO tausp.
          ELSE.
*           Informatives Merkmal
            tinf_ausp = hausp.
            tinf_ausp-objek = inob-cuobj.
            APPEND tinf_ausp TO tinf_ausp.
          ENDIF.
        ENDLOOP.
      ENDIF.

    ENDIF.

  ENDIF.
*JH/07.04.99/4.6A (Ende)

  SORT tausp BY objek atinn atwrt atflv atflb.
  SORT tinf_ausp BY objek atinn atwrt atflv atflb.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form BEWERTUNG_UEBERNEHMEN
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> AUSPKEY
*&      --> MARA
*&---------------------------------------------------------------------*
FORM bewertung_uebernehmen  USING  p_auspkey LIKE bdiauspkey
                                  p_mara    LIKE mara.

  RANGES: r_icabn FOR cabn-atinn.                       "v note 2395810
  DATA: tcabn        TYPE STANDARD TABLE OF cabn,
        ls_cabn      TYPE cabn,
        ls_cawn      TYPE cawn,
        lv_num_atwrt TYPE ausp-atwrt.                 "^ note 2395810

  CLEAR iausp.
  LOOP AT tausp WHERE objek = p_mara-cuobf.
*    IF  TAUSP-ATWRT EQ SPACE
*    AND ( TAUSP-ATFLV NE 0 OR TAUSP-ATFLB NE 0 ).

    CLEAR iausp.                                  "Note 2269467
    MOVE-CORRESPONDING tausp TO iausp.
    iausp-atwrt_orig = tausp-atwrt.

    IF  tausp-atwrt EQ space.                      "Note 459965
*     Bei numerischen Merkmalswerten den konvertierten ATWRT
*     aus TBEWERT nehmen
      READ TABLE tbewert WITH KEY atinn = tausp-atinn
                                  atflv = tausp-atflv
                                  atflb = tausp-atflb
                         BINARY SEARCH
                         TRANSPORTING atwrt.
      IF sy-subrc = 0.
        tausp-atwrt = tbewert-atwrt.
      ELSE.                                             "v note 2395810
        IF r_icabn-low NE tausp-atinn.
          CLEAR r_icabn.
          REFRESH r_icabn.
          CLEAR ls_cabn.
          REFRESH tcabn.

          r_icabn-sign = 'I'.
          r_icabn-option = 'EQ'.
          r_icabn-low = tausp-atinn.
          APPEND r_icabn.

          CALL FUNCTION 'CLSE_SELECT_CABN'
            TABLES
              in_cabn        = r_icabn
              t_cabn         = tcabn
            EXCEPTIONS
              no_entry_found = 1
              OTHERS         = 2.
        ENDIF.
        READ TABLE tcabn INDEX 1 INTO ls_cabn.
        IF sy-subrc = 0.
          CLEAR ls_cawn.
          ls_cawn-atinn = tausp-atinn.
          ls_cawn-atflv = tausp-atflv.
          ls_cawn-atflb = tausp-atflb.
          ls_cawn-atcod = tausp-atcod.
          ls_cawn-atawe = tausp-atawe.
          ls_cawn-ataw1 = tausp-ataw1.
          ls_cawn-atprz = tausp-atprz.
          ls_cawn-attlv = tausp-attlv.
          ls_cawn-attlb = tausp-attlb.
          ls_cawn-atinc = tausp-atinc.

          CALL FUNCTION 'CTCV_PREPARE_VALUES_TO_DISPLAY'
            EXPORTING
              structure_cabn       = ls_cabn
              structure_cawn       = ls_cawn
              shift                = 'LEFT'
              align                = 'NO'
              single               = 'NO'
              condense             = 'YES'
              string_with_baseunit = 'YES'
              language             = sy-langu
              classtype            = '026'
            IMPORTING
              string               = lv_num_atwrt
            EXCEPTIONS
              unit_not_found       = 08
              overflow             = 18
              exp_overflow         = 18
              OTHERS               = 13.
          IF sy-subrc EQ 0.
            tausp-atwrt = lv_num_atwrt.
          ENDIF.
        ENDIF.
      ENDIF.                                            "^ note 2395810
    ENDIF.
    iausp-atwrt = tausp-atwrt.
*   Externen Merkmalsname holen
    READ TABLE tmerkm WITH KEY atinn = tausp-atinn BINARY SEARCH.
    IF sy-subrc = 0.
      iausp-atnam = tmerkm-atnam.
    ENDIF.
    iausp-matnr = p_mara-matnr.

    CLEAR tcharacteristicvalue.
    CALL FUNCTION 'MAP2E_SAUSP_TO_BAPIE1AUSPRT'
      EXPORTING
        sausp        = iausp
      CHANGING
        bapie1ausprt = tcharacteristicvalue
      EXCEPTIONS
        OTHERS       = 0.
*   TCHARACTERISTICVALUE-FUNCTION = P_AUSPKEY-MSGFN.
    tcharacteristicvalue-function = c_msgfn_r.
    APPEND tcharacteristicvalue.

*   Ankreuzleiste belegen
    CLEAR tcharacteristicvaluex.
*   Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
    tcharacteristicvaluex = ankreuzleiste.
*   Keys korrekt belegen (kein MOVE-CORRESPONDING!)
    tcharacteristicvaluex-function  = tcharacteristicvalue-function.
    tcharacteristicvaluex-material_long  = tcharacteristicvalue-material_long.     "MFLE
    tcharacteristicvaluex-material  = tcharacteristicvalue-material.
    tcharacteristicvaluex-char_name = tcharacteristicvalue-char_name.
    CLEAR tcharacteristicvaluex-material_external.                                 "DIMP activation
    CLEAR tcharacteristicvaluex-material_guid.                                     "DIMP activation
    CLEAR tcharacteristicvaluex-material_version.                                  "DIMP activation
    APPEND tcharacteristicvaluex.
  ENDLOOP.

* now take over the values to be deleted
  READ TABLE lt_del_ausp WITH KEY cdobjid = p_mara-matnr BINARY SEARCH.
  IF sy-subrc = 0.
    LOOP AT lt_del_ausp FROM sy-tabix.

      IF lt_del_ausp-cdobjid <> p_mara-matnr.
        EXIT.
      ENDIF.

      CLEAR tcharacteristicvalue.
      CLEAR iausp.
      iausp-matnr    = lt_del_ausp-tabkey+3(40).
*    Externen Merkmalsname holen
      READ TABLE tmerkm
           WITH KEY atinn = lt_del_ausp-tabkey+43(10) BINARY SEARCH.
      IF sy-subrc = 0.
        iausp-atnam = tmerkm-atnam.
      ENDIF.

*     Take over the value from Changepointer entry
      iausp-atwrt =  lt_del_ausp-tabkey+53(30).

*    the current valid valuation is already in TCHARACTERISTICVALUE
*    so do not mix in the same deletion entries
      READ TABLE tcharacteristicvalue WITH KEY
                 material_long   = iausp-matnr
                 char_name       = iausp-atnam
                 char_value_long = iausp-atwrt.
      IF sy-subrc = 0.
*    do not add this value to the deletion package, cause
*    it is still used
        CONTINUE.
      ENDIF.

      CALL FUNCTION 'MAP2E_SAUSP_TO_BAPIE1AUSPRT'
        EXPORTING
          sausp        = iausp
        CHANGING
          bapie1ausprt = tcharacteristicvalue
        EXCEPTIONS
          OTHERS       = 0.
      tcharacteristicvalue-function = c_msgfn_d.
      APPEND tcharacteristicvalue.

*   Ankreuzleiste belegen
      CLEAR tcharacteristicvaluex.
*   Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tcharacteristicvaluex = ankreuzleiste.
*   Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tcharacteristicvaluex-function  = tcharacteristicvalue-function.
      tcharacteristicvaluex-material_long  = tcharacteristicvalue-material_long.     "MFLE
      tcharacteristicvaluex-material  = tcharacteristicvalue-material.
      tcharacteristicvaluex-char_name = tcharacteristicvalue-char_name.
      CLEAR tcharacteristicvaluex-material_external.                                 "DIMP activation
      CLEAR tcharacteristicvaluex-material_guid.                                     "DIMP activation
      CLEAR tcharacteristicvaluex-material_version.                                  "DIMP activation
      APPEND tcharacteristicvaluex.

    ENDLOOP.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form EINSCHRAENKUNG_UEBERNEHMEN
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> AUSPKEY
*&      --> MARA
*&---------------------------------------------------------------------*
FORM einschraenkung_uebernehmen USING p_auspkey LIKE bdiauspkey
                                      p_mara    LIKE mara.

* form is obsolete because no restrictions on informative characteristics
* for generic article anymore
  IF cl_check_mm4x_genart_new=>check_setget_parameter( ) = abap_false.

    CLEAR iausp.
    LOOP AT tinf_ausp WHERE objek = p_mara-cuobf.
*      IF  TINF_AUSP-ATWRT EQ SPACE
*      AND ( TINF_AUSP-ATFLV NE 0 OR TINF_AUSP-ATFLB NE 0 ).

      CLEAR iausp.                                  "Note 2269467
      MOVE-CORRESPONDING tausp TO iausp.
      iausp-atwrt_orig = tausp-atwrt.

      IF  tinf_ausp-atwrt EQ space.                "Note 459965
*       Bei numerischen Merkmalswerten den konvertierten ATWRT
*       aus TBEWERT nehmen
        READ TABLE tbewert WITH KEY atinn = tinf_ausp-atinn
                                    atflv = tinf_ausp-atflv
                                    atflb = tinf_ausp-atflb
                           BINARY SEARCH
                           TRANSPORTING atwrt.
        IF sy-subrc = 0.
          tinf_ausp-atwrt = tbewert-atwrt.
        ENDIF.
      ENDIF.
      iausp-atwrt = tinf_ausp-atwrt.
*     Externen Merkmalsname holen
      READ TABLE tmerkm WITH KEY atinn = tinf_ausp-atinn BINARY SEARCH.
      IF sy-subrc = 0.
        CONCATENATE '!' tmerkm-atnam INTO iausp-atnam.
      ENDIF.
      iausp-matnr = p_mara-matnr.

      CLEAR tcharacteristicvalue.
      CALL FUNCTION 'MAP2E_SAUSP_TO_BAPIE1AUSPRT'
        EXPORTING
          sausp        = iausp
        CHANGING
          bapie1ausprt = tcharacteristicvalue
        EXCEPTIONS
          OTHERS       = 0.
      tcharacteristicvalue-function = c_msgfn_r.
      APPEND tcharacteristicvalue.

*     Ankreuzleiste belegen
      CLEAR tcharacteristicvaluex.
*     Alle Felder der Ankreuzleiste als änderungsrelevant kennzeichnen
      tcharacteristicvaluex = ankreuzleiste.
*     Keys korrekt belegen (kein MOVE-CORRESPONDING!)
      tcharacteristicvaluex-function  = tcharacteristicvalue-function.
      tcharacteristicvaluex-material_long  = tcharacteristicvalue-material_long.     "MFLE
      tcharacteristicvaluex-material  = tcharacteristicvalue-material.
      tcharacteristicvaluex-char_name = tcharacteristicvalue-char_name.
      CLEAR tcharacteristicvaluex-material_external.                                 "DIMP activation
      CLEAR tcharacteristicvaluex-material_guid.                                     "DIMP activation
      CLEAR tcharacteristicvaluex-material_version.                                  "DIMP activation
      APPEND tcharacteristicvaluex.
    ENDLOOP.

  ENDIF.
ENDFORM.
