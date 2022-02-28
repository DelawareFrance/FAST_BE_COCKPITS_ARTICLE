class /DLWUPEX/CL_CORE_CHECK definition
  public
  create public .

public section.

  interfaces /DLWUPEX/IF_CHECK .

  methods CONSTRUCTOR
    importing
      !IV_ID type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID .
  class-methods GET_INSTANCE
    importing
      value(IV_ID) type /DLWUPEX/EBUSUNITID
      value(IV_REQID) type /DLWUPEX/EREQID
    returning
      value(RV_OBJECT) type ref to /DLWUPEX/CL_CORE_CHECK .
protected section.

  constants GC_CHECKMETH type STRING value 'CHECK_' ##NO_TEXT.
  data GT_TBUOC type /DLWUPEX/TBUOC_TT .

  methods CHECK_TABLE_CONTROL
    importing
      !IS_TFIELDS type /DLWUPEX/TFIELDS
      !IV_FLAG_EMPTY type XFELD optional
      !IV_TABCONTROL type TABNAME optional
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CS_TVIEW type /DLWUPEX/TVIEW
      !CV_RC type SY-SUBRC .
  methods RETRIEVING_CONTROL_TABLE
    importing
      !IV_TABNAME type DDOBJNAME
      !IV_FIELDNAME type DFIES-FIELDNAME
      !IV_FELD_FIELDTEXT type XFELD optional
    changing
      !CS_DFIES_LINE type DFIES optional
      !CS_DOMAIN_CTR type /DLWUPEX/DOM_CTRL optional
      !CV_TABCONTROL type TABNAME optional
      !CV_FLAG_ERROR type XFELD optional
      !CV_FIELDTEXT type AS4TEXT optional .
  methods CHECK_FIELDS
    importing
      !IT_TVIEW type /DLWUPEX/TVIEW_TT
      !IS_TFIELDS type /DLWUPEX/TFIELDS
      !IV_TABIX type SYST_TABIX
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SY-SUBRC
      !CV_NO_METHOD type XFELD .
  methods CHECK_MEAN_EAN11
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_MEAN_EANTP
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_MEAN_HPEAN
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_STPO_IDNRK
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_EINA_RELIF
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_EORD_LIFNR
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_EORD_RESWK
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_MARA_MATNR
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_MARA_MATKL
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_T002_SPRAS
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_EINE_EKORG
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_MVKE_VTWEG
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods RETRIEVING_FIELDTEXT
    importing
      !IS_DDOBJNAME type TABNAME16
      !IS_TABFIELD type TABFLDNAME
      !IS_FIELDNAME type FIELDNAME
    exporting
      !ES_AS4TEXT type AS4TEXT .
  methods GET_CONVEXIT
    importing
      !IS_CONVEXIT type CONVEXIT optional
      !IS_VALUE type /DLWUPEX/EVALUEFIELD
      !IS_TABCONTROL type DFIES optional
      !IV_DDOBJNAME type DDOBJNAME optional
      !IV_FIELDNAME type FIELDNAME optional
    exporting
      !ES_XFELD type XFELD
      !EV_OUTPUT type STRING
    changing
      !CV_NO_FUNCTION type XFELD .
  methods CHECK_AUSP_ATINN
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_AUSP_ATWRT
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_DUPLICATE_LINES
    importing
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CT_TABLE type /DLWUPEX/TVIEW_TT optional
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_MARC_WERKS
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_MVKE_MATNR
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_EINA_MATNR
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_MARA_ATTYP
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_MARC_MATNR
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods GET_FIELDINFO_FIELD
    importing
      !IV_TABNAME type DDOBJNAME
      !IV_FIELDNAME type FIELDNAME optional
    exporting
      !ET_DFIES_TAB type DFIES_TAB .
  methods GET_KEYFIELD
    importing
      !IV_TABNAME type DDOBJNAME
    exporting
      !ET_KEYFIELDS type CACS_COND_KEYFIELDS .
  methods GET_EAN_TYPE
    importing
      !IV_INTEXT type NRIND
    exporting
      !ET_EAN_TYPE type /DLWUPEX/TYPEINTERV_TT .
  methods GET_DOMAIN
    importing
      !IV_DOMNAME type DOMNAME
    exporting
      !ES_DOMAIN_CTR type /DLWUPEX/DOM_CTRL .
  methods GET_TAB_CONTROL
    importing
      !IV_TABNAME type TABNAME
      !IV_VALUE type STRING
      !IT_WHERE type /DLWUPEX/EDPLINE_TT
    exporting
      !ES_OK type XFELD .
  methods GET_KEYFIELD_TABLE
    importing
      !IV_TABNAME type DDOBJNAME
    exporting
      !ET_DFIES_TAB type DFIES_TAB .
  methods CHECK_WLK1_FILIA
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_EINA_LIFNR
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_EINA_LTSNR
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SY-SUBRC optional .
private section.

  constants GC_CLASSMSG type ARBGB value '/DLWUPEX/COCKPIT_ART' ##NO_TEXT.
  constants GC_MATNR type STRING value 'MATNR' ##NO_TEXT.
  constants GC_MEINH type STRING value 'MEINH' ##NO_TEXT.
  constants GC_ID type STRING value 'ID' ##NO_TEXT.
  constants GC_REQID type STRING value 'REQID' ##NO_TEXT.
  constants GC_LINE type STRING value 'LINE' ##NO_TEXT.
  constants GC_WERKS type STRING value 'WERKS' ##NO_TEXT.
  constants GC_LIFNR type STRING value 'LIFNR' ##NO_TEXT.
  constants GC_RESWK type STRING value 'RESWK' ##NO_TEXT.
  constants GC_EANTP type STRING value 'EANTP' ##NO_TEXT.
  constants GC_MARA type STRING value 'MARA' ##NO_TEXT.
  constants GC_ARTKEY type STRING value 'ARTKEY' ##NO_TEXT.
  constants GC_TAB_RESERVE type STRING value '/DLWUPEX/TVIEW' ##NO_TEXT.
  constants GC_VIEWNAME type STRING value 'VIEWNAME' ##NO_TEXT.
  constants GC_XFELD type STRING value 'X' ##NO_TEXT.
  constants GC_VALUE type STRING value 'VALUE' ##NO_TEXT.
  data GT_TBUOA type /DLWUPEX/TBUOA_TT .
  constants GC_CLASS_CHECK type /DLWUPEX/ENAME value 'CLASSCHECK' ##NO_TEXT.
  constants GC_CHECK_CORE type /DLWUPEX/ENAME value '/DLWUPEX/CL_CORE_CHECK' ##NO_TEXT.
  constants GC_EAN11 type STRING value 'EAN11' ##NO_TEXT.
  constants GC_ATTYP type STRING value 'ATTYP' ##NO_TEXT.
  constants GC_CONVEXIT type STRING value ' CONVERSION_EXIT_' ##NO_TEXT.
  constants GC_CONVEXIT2 type STRING value '_INPUT' ##NO_TEXT.
  constants GC_ATINN type STRING value 'ATINN' ##NO_TEXT.
  constants GC_ROWNB type STRING value 'ROWNB' ##NO_TEXT.
  constants GC_EKORG type STRING value 'EKORG' ##NO_TEXT.
  constants GC_SALE type TABNAME16 value '/DLWUPEX/TSALE' ##NO_TEXT.
  constants GC_LOGSTO type TABNAME16 value '/DLWUPEX/TLOGSTO' ##NO_TEXT.
  constants GC_LOGDC type TABNAME16 value '/DLWUPEX/TLOGDC' ##NO_TEXT.
  constants GC_UNIT type TABNAME16 value '/DLWUPEX/TUNIT' ##NO_TEXT.
  constants GC_FIA type TABNAME16 value '/DLWUPEX/TFIA' ##NO_TEXT.
  data GS_REQIDS type /DLWUPEX/TREQIDS .
  data GT_FIELD_INFOS type /DLWUPEX/FIELD_INFOS_TT .
  data GT_KEYS_TAB type /DLWUPEX/KEY_INFOS_TT .
  data GT_EAN_TYPE type /DLWUPEX/EAN_TYPE_TT .
  data GT_DOMAIN type /DLWUPEX/DOM_CTRL_TT .
  data GT_TAB_CONTROL type /DLWUPEX/TAB_CTRL_TT .
  data GT_KEY_INFOS type /DLWUPEX/FIELD_INFOS_TT .
  data GT_CTVIEW_MVKE_VTWEG type /DLWUPEX/TVIEW_TT .
  data GT_CTVIEW_MARA_MATNR type /DLWUPEX/TVIEW_TT .
  data GT_CTVIEW_MARC_WERKS type /DLWUPEX/TVIEW_TT .
  data GT_TFIA_EINA_RELIF type /DLWUPEX/TTY_TFIA .
  data GV_TFIA_EINA_RELIF type XFELD .
  data GT_T001W type /DLWUPEX/TTY_T001W .
  data GT_MEAN type /DLWUPEX/TTY_MEAN .
  data GT_TUNIT_MEAN_EAN11 type /DLWUPEX/TUNIT_TT .
  data GV_MEAN type XFELD .
  data GT_CTVIEW_EINA_LIFNR type /DLWUPEX/TVIEW_TT .
  data GT_CTVIEW_EINA_LTSNR type /DLWUPEX/TVIEW_TT .
  data GT_CTVIEW_EORD_LIFNR type /DLWUPEX/TVIEW_TT .
  data GT_CTVIEW_EORD_RESWK type /DLWUPEX/TVIEW_TT .

  methods CHECK_TYPAGE
    importing
      !IS_TFIELDS type /DLWUPEX/TFIELDS
      !IV_TABIX type SYST_TABIX
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CS_TVIEW type /DLWUPEX/TVIEW .
  methods CHECK_ALREADY_FILL
    importing
      !IT_TABLE type ANY TABLE
      !IS_TFIELDS type /DLWUPEX/TFIELDS
      !IV_TFIELDS_COMP type TABFLDNAME optional
      !IV_TABNAME type TABNAME
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_TABIX type SYST_TABIX optional
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CS_TVIEW type /DLWUPEX/TVIEW
      !CV_RC type SY-SUBRC .
ENDCLASS.



CLASS /DLWUPEX/CL_CORE_CHECK IMPLEMENTATION.


  METHOD /dlwupex/if_check~check.

    DATA : lv_flag_empty     TYPE xfeld,
           lv_flag_no_method TYPE xfeld.





    CLEAR : lv_flag_no_method, lv_flag_empty.

*** Check 1 : Contrôle sur le typage des champs en entrée
    CALL METHOD me->check_typage
      EXPORTING
        is_tfields = is_tfields
        iv_tabix   = iv_tabix
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview.


*** Check 2 : Contrôle spécifique sur certains champs
    CALL METHOD me->check_fields
      EXPORTING
        it_tview     = it_table
        is_tfields   = is_tfields
        iv_tabix     = iv_tabix
      CHANGING
        ct_msg       = ct_msg
        cs_tview     = cs_tview
        cv_rc        = cv_rc
        cv_no_method = lv_flag_no_method.


    IF is_tfields-obligatory EQ 'Y'.
      lv_flag_empty = 'X'.
    ELSE.
      CLEAR lv_flag_empty.
    ENDIF.

*** Check 3 : Contrôle sur la table de contrôle associé au champ
    IF lv_flag_no_method IS NOT INITIAL.
      CALL METHOD me->check_table_control
        EXPORTING
          is_tfields    = is_tfields
          iv_flag_empty = lv_flag_empty
        CHANGING
          ct_msg        = ct_msg
          cs_tview      = cs_tview
          cv_rc         = cv_rc.
    ENDIF.



**** Check 4 : Contrôle des entrées possédants des clées identiques
*    CALL METHOD me->check_duplicate_lines
*      EXPORTING
*        is_tfields = is_tfields
*        iv_tabix   = iv_tabix
*      CHANGING
*        ct_table   = ct_table
*        cs_tview   = cs_tview
*        ct_msg     = ct_msg
*        cv_rc      = cv_rc.


  ENDMETHOD.


  METHOD /dlwupex/if_check~check_duplicate_line_db.


    TYPES: BEGIN OF ty_field,
             fieldname TYPE fieldname,
             value     TYPE string,
           END OF ty_field,
           BEGIN OF ty_field2,
             line   TYPE /dlwupex/elineid,
             fields TYPE TABLE OF ty_field WITH DEFAULT KEY,
           END OF ty_field2.

    FIELD-SYMBOLS : <fs_tview_tmp>  TYPE any,
                    <fs_field_ctrl> TYPE any.
    DATA : lt_dref         TYPE REF TO data,
           lt_where        TYPE TABLE OF edpline,
           lt_key_fieldtab TYPE TABLE OF dfies,
           lt_table        TYPE /dlwupex/tview_tt,
           lt_field        TYPE TABLE OF ty_field,
           lt_field_bis    TYPE TABLE OF ty_field,
           ls_field        TYPE ty_field,
           lt_field2       TYPE TABLE OF ty_field2,
           ls_field2       TYPE ty_field2,
           lt_table_tmp    TYPE TABLE OF /dlwupex/tview,
           ls_where        TYPE edpline,
           ls_table        TYPE /dlwupex/tview,
           ls_key_fieldtab TYPE dfies,
           ls_msg          TYPE /dlwupex/tmsg,
           lv_strg_msg     TYPE string,
           lv_ddobjname    TYPE tabname16,
           lv_tabfield     TYPE tabfldname,
           lv_fieldname    TYPE fieldname,
           lv_string       TYPE string,
           lv_string2      TYPE string,
           lv_as4text      TYPE as4text,
           lv_tabname      TYPE dfies-tabname,
           lv_tabix        TYPE sy-tabix.

    DATA: lt_dyn_tab TYPE        w_tabname,
          lt_dref2   TYPE REF TO data,
          lt_dref3   TYPE REF TO data.
    FIELD-SYMBOLS: <fs_doublon_check> TYPE ANY TABLE.
    FIELD-SYMBOLS: <fs_doublons> TYPE ANY TABLE.
    FIELD-SYMBOLS: <key> TYPE any.
    DATA : lv_restriction TYPE string.
    DATA : lv_clausewhere TYPE string.



* On n'applique cette règle que pour les vues Sale, logs et FIA
    CASE iv_viewname.
      WHEN '02'.
        lv_tabname = gc_unit.
      WHEN '06'.
        lv_tabname = gc_fia.
      WHEN '08'.
        lv_tabname = gc_sale.
      WHEN '09'.
        lv_tabname = gc_logdc.
      WHEN '10'.
        lv_tabname = gc_logsto.
      WHEN OTHERS.
        EXIT.
    ENDCASE.

*   On récupère les champs qui suivent ARTKEY
    CALL METHOD me->get_keyfield_table
      EXPORTING
        iv_tabname   = lv_tabname
      IMPORTING
        et_dfies_tab = lt_key_fieldtab.

    TRY.



        lt_dyn_tab = lv_tabname.
        CREATE DATA lt_dref2 TYPE TABLE OF (lt_dyn_tab).
        ASSIGN lt_dref2->* TO <fs_doublon_check>.
        CREATE DATA lt_dref3 TYPE TABLE OF (lt_dyn_tab).
        ASSIGN lt_dref3->* TO <fs_doublons>.

*     Clé servant au group by
        lv_restriction = 'ID REQID ART_KEY'.
        LOOP AT  lt_key_fieldtab ASSIGNING FIELD-SYMBOL(<ls_key>).
          lv_restriction = lv_restriction && | | && <ls_key>-fieldname.
        ENDLOOP.

*     Détection de doublons
        SELECT
          (lv_restriction) INTO CORRESPONDING FIELDS OF TABLE <fs_doublon_check>
          FROM (lv_tabname)
          WHERE id    = iv_id
          AND   reqid = iv_reqid
          GROUP BY (lv_restriction)
          HAVING COUNT( * ) > 1.

        IF sy-subrc EQ 0.
*       Récupération des lignes complètes pour assigner l'erreur
          CLEAR lv_clausewhere.
          LOOP AT <fs_doublon_check> ASSIGNING FIELD-SYMBOL(<ls_doublon>).
            IF sy-tabix > 1.
              lv_clausewhere = lv_clausewhere  && | or |.
            ENDIF.
            ASSIGN COMPONENT 'ART_KEY' OF STRUCTURE <ls_doublon> TO FIELD-SYMBOL(<ls_art_key>).
            lv_clausewhere = lv_clausewhere &&
                             '( ID ='        && | '| && iv_id    && |' | &&
                             'AND REQID ='   && | '| && iv_reqid && |' | &&
                             'AND ART_KEY =' && | '| && <ls_art_key>   && |' |.
            LOOP AT  lt_key_fieldtab ASSIGNING FIELD-SYMBOL(<ls_key_sup>).
              ASSIGN COMPONENT <ls_key_sup>-fieldname OF STRUCTURE <ls_doublon> TO <key>.
              lv_clausewhere = lv_clausewhere && |AND | && <ls_key_sup>-fieldname && | | && '=' && | '| && <key> && |' |.
            ENDLOOP.
            lv_clausewhere = lv_clausewhere && |)|.
          ENDLOOP.

          SELECT
            * INTO TABLE <fs_doublons>
            FROM (lv_tabname)
            WHERE (lv_clausewhere).

          IF sy-subrc EQ 0.
*         Maintenant que l'on connait les lignes en erreur, on peut créer les messages qui vont bien !

            LOOP AT <fs_doublons> ASSIGNING  FIELD-SYMBOL(<ls_doublon_msg>).
              ASSIGN COMPONENT 'ART_KEY' OF STRUCTURE <ls_doublon_msg> TO FIELD-SYMBOL(<lv_art_key>).
              ASSIGN COMPONENT 'LINE'    OF STRUCTURE <ls_doublon_msg> TO FIELD-SYMBOL(<lv_line>).

              IF ct_table IS SUPPLIED.
                READ TABLE ct_table ASSIGNING FIELD-SYMBOL(<fs_update>)
                WITH KEY id        = iv_id
                         reqid     = iv_reqid
                         matnr     = <lv_art_key>
*                     rownb     = <lv_rownb>
*                         line      = <lv_line>
                         viewname  = iv_viewname
                         fieldname = 'ARTKEY'.

                IF sy-subrc EQ 0.

                  CLEAR ls_msg.
                  ls_msg-matnr      = <fs_update>-matnr.
                  ls_msg-id         = iv_id.
                  ls_msg-reqid      = iv_reqid.
                  ls_msg-rownb      = <fs_update>-rownb.
                  ls_msg-viewname   = iv_viewname.
*              ls_msg-line       = <lv_line>.
                  ls_msg-field      = 'ART_KEY'.
                  ls_msg-type       = 'E'.
                  ls_msg-idmsg      = gc_classmsg.
                  ls_msg-num        = '051'.
                  ls_msg-message_v1 = lv_strg_msg.
                  ls_msg-message_v2 = <fs_update>-matnr.
                  MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                    INTO ls_msg-message
                  WITH ls_msg-message_v1 ls_msg-message_v2.
                  APPEND ls_msg TO ct_msg.
*                 Update the table view

                  IF <fs_update> IS ASSIGNED.
                    CHECK <fs_update>-status NE 'E'.
                    <fs_update>-status  = ls_msg-type.
                    <fs_update>-message = ls_msg-message.
                  ENDIF.

                ENDIF.
              ELSE.
                CLEAR ls_msg.
                ls_msg-matnr      = <lv_art_key>.
                ls_msg-id         = iv_id.
                ls_msg-reqid      = iv_reqid.
                ls_msg-viewname   = iv_viewname.
                ls_msg-field      = 'ART_KEY'.
                ls_msg-type       = 'E'.
                ls_msg-idmsg      = gc_classmsg.
                ls_msg-num        = '051'.
                ls_msg-message_v1 = lv_strg_msg.
                ls_msg-message_v2 = <lv_art_key>.
                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                  INTO ls_msg-message
                WITH ls_msg-message_v1 ls_msg-message_v2.
                APPEND ls_msg TO ct_msg.
              ENDIF.


            ENDLOOP.

            cv_rc = 4.

          ENDIF.

        ENDIF.


      CATCH cx_root.
    ENDTRY.




  ENDMETHOD.


  METHOD check_already_fill.
*
*    DATA : lt_dref   TYPE REF TO data,
*           lt_where  TYPE TABLE OF edpline,
*           ls_where  TYPE edpline,
*           lv_string TYPE string.
*
*    FIELD-SYMBOLS : <ft_tview_tmp> TYPE table,
*                    <fs_id>        TYPE any,
*                    <fs_reqid>     TYPE any,
*                    <fs_matnr>     TYPE any,
*                    <fs_line>      TYPE any,
*                    <fs_viewname>  TYPE any.
*
**   On alimente une table temporaire sans la ligne en cours de traitement
*    CREATE DATA lt_dref TYPE TABLE OF (gc_tab_reserve).
*    ASSIGN lt_dref->* TO <ft_tview_tmp>.
*    <ft_tview_tmp>[] = it_table[].
*    DELETE <ft_tview_tmp> INDEX iv_tabix.
*
*
*    CLEAR ls_where.
*    REFRESH lt_where.
**   On construit un WHERE
*    CONCATENATE '& =' '''&1''' INTO lv_string SEPARATED BY space.
*    ls_where = lv_string.
*    REPLACE '&'  WITH 'FIELDNAME' INTO ls_where.
*    REPLACE '&1' WITH is_tfields-tabfield INTO ls_where.
*    APPEND ls_where TO lt_where.
*    CONCATENATE 'AND' '& =' '''&1''' INTO lv_string SEPARATED BY space.
*    ls_where = lv_string.
*    REPLACE '&'  WITH 'VALUE' INTO ls_where.
*    REPLACE '&1' WITH gc_xfeld INTO ls_where.
*    APPEND ls_where TO lt_where.
*
*****   Check 1 : 1 seul flag possible par article pour RELIF
*    LOOP AT <ft_tview_tmp> ASSIGNING FIELD-SYMBOL(<fs_tfields>)
*      WHERE (lt_where).
**     On récupère ID
*      ASSIGN COMPONENT gc_id
*      OF STRUCTURE <fs_tfields> TO <fs_id>.
**     On récupère REQID
*      ASSIGN COMPONENT gc_reqid
*      OF STRUCTURE <fs_tfields> TO <fs_reqid>.
**     On récupère MATNR
*      ASSIGN COMPONENT gc_matnr
*      OF STRUCTURE <fs_tfields> TO <fs_matnr>.
**     On récupère LINE
*      ASSIGN COMPONENT gc_line
*      OF STRUCTURE <fs_tfields> TO <fs_line>.
*
*      IF <fs_matnr> EQ cs_tview-value.
***       1 seul flag possible par article pour RELIF
**        CLEAR ls_msg.
**        ls_msg-matnr      = cs_tview-matnr.
**        ls_msg-id         = cs_tview-id.
**        ls_msg-reqid      = cs_tview-reqid.
**        ls_msg-viewname   = cs_tview-viewname.
**        ls_msg-field      = cs_tview-fieldname.
**        ls_msg-type       = 'E'.
**        ls_msg-idmsg      = gc_classmsg.
**        ls_msg-num        = '017'.
**        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
**          INTO ls_msg-message.
**        APPEND ls_msg TO ct_msg.
***       Update the table view
**        cs_tview-status = ls_msg-type.
**        cs_tview-message = ls_msg-message.
**        EXIT.
*
*      ENDIF.
*
*    ENDLOOP.
*
*
**    lv_rupture = gc_matnr.
**
***   Boucle sur la table de view
**    LOOP AT it_table ASSIGNING FIELD-SYMBOL(<fs_tfields>).
***     Valeur du champ à contrôler
**      ASSIGN COMPONENT is_tfields-tabfield
**      OF STRUCTURE <fs_tfields> TO <fs_field_ctrl>.
***     Valeur du champ à comparer
**      ASSIGN COMPONENT iv_tfields_comp
**      OF STRUCTURE <fs_tfields> TO <fs_field_comp>.
***     Valeur de ID
**      ASSIGN COMPONENT gc_id
**      OF STRUCTURE <fs_tfields> TO <fs_id>.
***     Valeur de REQID
**      ASSIGN COMPONENT gc_reqid
**      OF STRUCTURE <fs_tfields> TO <fs_reqid>.
***     Valeur de line
**      ASSIGN COMPONENT gc_line
**      OF STRUCTURE <fs_tfields> TO <fs_line>.
***     Valeur de matnr
**      ASSIGN COMPONENT gc_matnr
**      OF STRUCTURE <fs_tfields> TO <fs_matnr>.
***     Valeur de WERKS
**      ASSIGN COMPONENT gc_werks
**      OF STRUCTURE <fs_tfields> TO <fs_werks>.
**
***     Initialisation du compteur
**      AT NEW (lv_rupture).
**        lv_count = 0.
**      ENDAT.
**      lv_count = lv_count + 1.
**
*****   Check 1 LIFNR RESWK, un seul des deux champs doit etre rempli
**      IF <fs_field_ctrl> IS ASSIGNED
**        AND <fs_field_comp> IS ASSIGNED.
**        IF <fs_field_ctrl> IS NOT INITIAL
**        AND <fs_field_comp> IS NOT INITIAL.
***         Soit LIFNR ou soit RESWK de renseigné pour un article /site donné
**          CLEAR ls_msg.
**          IF  <fs_matnr> IS ASSIGNED.
**            ls_msg-matnr    = <fs_matnr>.
**          ENDIF.
**          IF  <fs_id> IS ASSIGNED.
**            ls_msg-id       = <fs_id>.
**          ENDIF.
**          IF  <fs_reqid> IS ASSIGNED.
**            ls_msg-reqid    = <fs_reqid>.
**          ENDIF.
**          ls_msg-rownb      = lv_count.
**          ls_msg-viewname   = iv_viewname.
**          ls_msg-field      = is_tfields-tabfield.
**          ls_msg-type       = 'E'.
**          ls_msg-idmsg      = gc_classmsg.
**          ls_msg-num        = '018'.
**          ls_msg-message_v1 = <fs_field_ctrl>.
**          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
**            INTO ls_msg-message.
**          APPEND ls_msg TO ct_msg.
**          cv_rc = 4.
**
**        ENDIF.
**
**      ENDIF.
**
**    ENDLOOP.

  ENDMETHOD.


  METHOD check_ausp_atinn.

    TYPES : BEGIN OF tt_atnam_tab,
              atnam TYPE atnam,
              atbez TYPE atbez,
              atfor TYPE atfor,
              spras TYPE spras,
            END OF tt_atnam_tab.

    DATA : lt_dfies_tab   TYPE TABLE OF dfies,
           ls_dfies_tab   TYPE dfies,
           lt_atnam_tab   TYPE TABLE OF tt_atnam_tab,
           lt_gdata       TYPE /dlwupex/tgdata_tt,
           ls_gdata       TYPE /dlwupex/tgdata,
           ls_msg         TYPE /dlwupex/tmsg,
           lv_art_key_tmp TYPE /dlwupex/ematkey,
           lv_output      TYPE string,
           lt_table       TYPE /dlwupex/tview_tt,
           lv_fieldname   TYPE fieldname,
           lv_ddobjname   TYPE ddobjname,
           lv_atinn       TYPE atinn,
           lv_xfeld       TYPE xfeld,
*           lv_rownb_tmp   TYPE /dlwupex/elineid,
           lv_no_function TYPE xfeld.

    FIELD-SYMBOLS : <fs_tview_tmp>  TYPE any,
                    <fs_field_ctrl> TYPE any.

*   INITIALIZATION
    REFRESH : lt_atnam_tab, lt_gdata, lt_dfies_tab.
    CLEAR : ls_gdata, lv_art_key_tmp, lv_output, lv_xfeld, lv_no_function,
            lv_ddobjname, ls_dfies_tab, ls_msg, lv_fieldname, lv_atinn.", lv_rownb_tmp.
    UNASSIGN : <fs_tview_tmp>, <fs_field_ctrl>.

    lt_table = it_table.
    SORT lt_table BY id
                       reqid
                       matnr
                       rownb
                       line
                       viewname
                       fieldname.
* On récupère le numéro d'article temporaire
*    lv_rownb_tmp = cs_tview-line - 1 .

    READ TABLE it_table ASSIGNING <fs_tview_tmp>
     WITH KEY ('ID')        = cs_tview-id
              ('REQID')     = cs_tview-reqid
              ('MATNR')     = cs_tview-matnr
              ('ROWNB')     = cs_tview-rownb
              ('LINE')      = cs_tview-line
              ('VIEWNAME')  = is_tfields-viewname
              ('FIELDNAME') = gc_artkey
              BINARY SEARCH.
    IF sy-subrc EQ 0
      AND cs_tview-value IS NOT INITIAL.
      ASSIGN COMPONENT gc_value
      OF STRUCTURE <fs_tview_tmp> TO <fs_field_ctrl>.
      IF <fs_field_ctrl> IS ASSIGNED.
*** Check 1 : la caractéristique doit être lié au groupe de marchandise de l’article
*   Retrieve the contain of GDATA
        lv_art_key_tmp = <fs_field_ctrl>.
        CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
          EXPORTING
            iv_bu      = cs_tview-id
            iv_reqid   = cs_tview-reqid
            iv_art_key = lv_art_key_tmp
          CHANGING
            ct_gdata   = lt_gdata
            cv_rc      = cv_rc.
        IF lt_gdata[] IS NOT INITIAL.
          CLEAR ls_gdata.
          READ TABLE lt_gdata INTO ls_gdata
          INDEX 1.
          IF sy-subrc EQ 0.
*** Check 1 : La caractéristique doit exister en table
            CALL METHOD me->check_table_control
              EXPORTING
                is_tfields = is_tfields
*               iv_flag_empty = lv_flag_empty
              CHANGING
                ct_msg     = ct_msg
                cs_tview   = cs_tview
                cv_rc      = cv_rc.
            IF cs_tview-status IS NOT INITIAL.
              EXIT.
            ENDIF.

*** Check 2 : on récupère le type de référence du champ
            lv_ddobjname = is_tfields-tabname.
            lv_fieldname = is_tfields-tabfield.
            CLEAR lv_xfeld.
            CALL METHOD me->get_convexit
              EXPORTING
                is_convexit    = ls_dfies_tab-convexit
                is_value       = cs_tview-value
                iv_ddobjname   = lv_ddobjname
                iv_fieldname   = lv_fieldname
              IMPORTING
                es_xfeld       = lv_xfeld
                ev_output      = lv_output
              CHANGING
                cv_no_function = lv_no_function.
            IF lv_xfeld IS NOT INITIAL.
              lv_atinn = lv_output.
            ELSE.
              lv_atinn = cs_tview-value.
            ENDIF.

*            SELECT DISTINCT atnam atbez atfor spras FROM
*             ( ( cabn AS c JOIN ksml AS k
*             ON c~atinn = k~imerk )
*             JOIN klah AS kl
*             ON k~clint = kl~clint )
*             JOIN cabnt
*             ON c~atinn = cabnt~atinn
*             INTO CORRESPONDING FIELDS OF TABLE lt_atnam_tab
*             WHERE kl~class = ls_gdata-matkl
*               AND kl~klart EQ '026'
*               AND cabnt~spras = sy-langu
*               AND cabnt~atinn = lv_atinn.
            SELECT COUNT(*) UP TO 1 ROWS FROM
             ( ( cabn AS c JOIN ksml AS k
             ON c~atinn = k~imerk )
             JOIN klah AS kl
             ON k~clint = kl~clint )
             JOIN cabnt
             ON c~atinn = cabnt~atinn
             WHERE kl~class = ls_gdata-matkl
               AND kl~klart EQ '026'
               AND cabnt~spras = sy-langu
               AND cabnt~atinn = lv_atinn.
            IF sy-subrc NE 0.
*             La caractéristique n'est pas lié au groupe marchandise
              CLEAR ls_msg.
              ls_msg-matnr      = <fs_field_ctrl>.
              ls_msg-id         = cs_tview-id.
              ls_msg-reqid      = cs_tview-reqid.
              ls_msg-rownb      = cs_tview-rownb.
              ls_msg-viewname   = cs_tview-viewname.
              ls_msg-field      = cs_tview-fieldname.
              ls_msg-line       = cs_tview-line.
              ls_msg-type       = 'E'.
              ls_msg-idmsg      = gc_classmsg.
              ls_msg-num        = '043'.
              ls_msg-message_v1 = cs_tview-value.
              ls_msg-message_v2 = ls_gdata-matkl.
              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message
              WITH ls_msg-message_v1 ls_msg-message_v2.
              APPEND ls_msg TO ct_msg.
              cv_rc = 4.
*                   Update the table view
              cs_tview-status = ls_msg-type.
              cs_tview-message = ls_msg-message.
              cv_rc = 4.
              EXIT.

            ENDIF.

          ENDIF.

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD check_ausp_atwrt.

    DATA : lt_cawn        TYPE TABLE OF cawn,
           ls_cawn        TYPE cawn,
           ls_cabn        TYPE cabn,
           ls_msg         TYPE /dlwupex/tmsg,
           lv_atinn       TYPE atinn,
           lt_table       TYPE /dlwupex/tview_tt,
           lv_xfeld       TYPE xfeld,
           lv_no_function TYPE xfeld,
           lv_ddobjname   TYPE ddobjname,
           lv_fieldname   TYPE fieldname,
           lv_tabcontrol  TYPE tabname,
           lv_output      TYPE string.

    FIELD-SYMBOLS : <fs_tview_tmp> TYPE any,
                    <fs_field>     TYPE any,
                    <fs_matnr>     TYPE any.

* INITIALIZATION
    REFRESH : lt_cawn.
    CLEAR : ls_cawn, ls_msg, lv_atinn, lv_xfeld, lv_no_function, lv_output,
            lv_ddobjname, lv_fieldname, ls_cabn,lv_tabcontrol.
    UNASSIGN : <fs_tview_tmp>, <fs_field>.

    lt_table = it_table.
    SORT lt_table BY id
                       reqid
                       matnr
                       rownb
                       line
                       viewname
                       fieldname.
*** Check 1 : On récupère la valeur lié à la caractéristique
* En amont on récupère ATINN
    READ TABLE it_table ASSIGNING <fs_tview_tmp>
     WITH KEY ('ID')        = cs_tview-id
              ('REQID')     = cs_tview-reqid
              ('MATNR')     = cs_tview-matnr
              ('ROWNB')     = cs_tview-rownb
              ('LINE')      = cs_tview-line
              ('VIEWNAME')  = is_tfields-viewname
              ('FIELDNAME') = gc_atinn
              BINARY SEARCH.
    IF sy-subrc EQ 0
      AND cs_tview-value IS NOT INITIAL.
      ASSIGN COMPONENT gc_value
      OF STRUCTURE <fs_tview_tmp> TO <fs_field>.
      lv_atinn = <fs_field>.
      IF lv_atinn IS INITIAL.
        lv_ddobjname = is_tfields-tabname.
        lv_fieldname = gc_atinn.
*       Si ATINN contient la caractéristique en lettre on la converti
        CALL METHOD me->get_convexit
          EXPORTING
*           is_convexit    = ls_dfies_tab-convexit
            is_value       = <fs_field>
            iv_ddobjname   = lv_ddobjname
            iv_fieldname   = lv_fieldname
          IMPORTING
            es_xfeld       = lv_xfeld
            ev_output      = lv_output
          CHANGING
            cv_no_function = lv_no_function.
        IF lv_output IS NOT INITIAL.
          lv_atinn = lv_output.
        ENDIF.
      ENDIF.
*      REFRESH lt_cawn.
*      SELECT *
*        FROM cawn
*        INTO TABLE lt_cawn
*        WHERE atinn EQ lv_atinn
*        AND datuv  <= sy-datum
*        AND techv  = space.
*      IF sy-subrc EQ 0
*        AND lt_cawn[] IS NOT INITIAL.
      SELECT COUNT(*) UP TO 1 ROWS
        FROM cawn
*        INTO TABLE lt_cawn
        WHERE atinn EQ lv_atinn
        AND datuv  <= sy-datum
        AND techv  = space.
*        AND atwrt = cs_tview-value.
      IF sy-subrc EQ 0.
        SELECT COUNT(*) UP TO 1 ROWS
            FROM cawn
*                  INTO TABLE lt_cawn
            WHERE atinn EQ lv_atinn
            AND datuv  <= sy-datum
            AND techv  = space
            AND atwrt = cs_tview-value.
*        AND lt_cawn[] IS NOT INITIAL.
**** Check 2 : On check si la valeur est lié à la caractéristique
*        READ TABLE lt_cawn
*        WITH KEY atwrt = cs_tview-value
*        TRANSPORTING NO FIELDS.
        IF sy-subrc NE 0.
*         On récupère le numéro d'article temporaire
          UNASSIGN <fs_tview_tmp>.
          READ TABLE it_table ASSIGNING <fs_tview_tmp>
           WITH KEY ('ID')        = cs_tview-id
                    ('REQID')     = cs_tview-reqid
                    ('MATNR')     = cs_tview-matnr
                    ('ROWNB')     = cs_tview-rownb
                    ('LINE')      = cs_tview-line
                    ('VIEWNAME')  = is_tfields-viewname
                    ('FIELDNAME') = gc_artkey
                    BINARY SEARCH.
          IF sy-subrc EQ 0.
            ASSIGN COMPONENT gc_value
            OF STRUCTURE <fs_tview_tmp> TO <fs_matnr>.
          ELSE.
            ASSIGN cs_tview-matnr TO <fs_matnr>.
          ENDIF.
*         La valeur n'est pas identique à la valeur en table lié à la caractéristique
          CLEAR ls_msg.
          ls_msg-matnr      = <fs_matnr>.
          ls_msg-id         = cs_tview-id.
          ls_msg-reqid      = cs_tview-reqid.
          ls_msg-rownb      = cs_tview-rownb.
          ls_msg-viewname   = cs_tview-viewname.
          ls_msg-field      = cs_tview-fieldname.
          ls_msg-line       = cs_tview-line.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-num        = '044'.
          ls_msg-message_v1 = cs_tview-value.
          ls_msg-message_v2 = lv_atinn.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message
          WITH ls_msg-message_v1 ls_msg-message_v2.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
*         Update the table view
          cs_tview-status = ls_msg-type.
          cs_tview-message = ls_msg-message.
          cv_rc = 4.
          EXIT.

        ENDIF.
      ELSE.
*** Check 3 : On contrôle s'il y a une table de contrôle pour cette valeur
*       Lecture sur la CABN
        CLEAR ls_cabn.
        SELECT SINGLE atprt INTO lv_tabcontrol
          FROM cabn
*          INTO ls_cabn
          WHERE atinn = lv_atinn .
        IF sy-subrc EQ 0 AND lv_tabcontrol IS NOT INITIAL.
*          IF ls_cabn-atprt IS NOT INITIAL.
*            lv_tabcontrol = ls_cabn-atprt.
          CALL METHOD me->check_table_control
            EXPORTING
              is_tfields    = is_tfields
*             iv_flag_empty =
              iv_tabcontrol = lv_tabcontrol
            CHANGING
              ct_msg        = ct_msg
              cs_tview      = cs_tview
              cv_rc         = cv_rc.
          IF cs_tview-status EQ 'E'.
            EXIT.
          ENDIF.

        ENDIF.

      ENDIF.

*    ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD check_duplicate_lines.

    TYPES: BEGIN OF ty_field,
             fieldname TYPE fieldname,
             value     TYPE string,
           END OF ty_field,
           BEGIN OF ty_field2,
             line   TYPE /dlwupex/elineid,
             fields TYPE TABLE OF ty_field WITH DEFAULT KEY,
           END OF ty_field2.

    FIELD-SYMBOLS : <fs_tview_tmp>  TYPE any,
                    <fs_field_ctrl> TYPE any.
    DATA : lt_dref         TYPE REF TO data,
           lt_where        TYPE TABLE OF edpline,
           lt_key_fieldtab TYPE TABLE OF dfies,
           lt_table        TYPE /dlwupex/tview_tt,
           lt_field        TYPE TABLE OF ty_field,
           lt_field_bis    TYPE TABLE OF ty_field,
           ls_field        TYPE ty_field,
           lt_field2       TYPE TABLE OF ty_field2,
           ls_field2       TYPE ty_field2,
           lt_table_tmp    TYPE TABLE OF /dlwupex/tview,
           ls_where        TYPE edpline,
           ls_table        TYPE /dlwupex/tview,
           ls_key_fieldtab TYPE dfies,
           ls_msg          TYPE /dlwupex/tmsg,
           lv_strg_msg     TYPE string,
           lv_ddobjname    TYPE tabname16,
           lv_tabfield     TYPE tabfldname,
           lv_fieldname    TYPE fieldname,
           lv_string       TYPE string,
           lv_string2      TYPE string,
           lv_as4text      TYPE as4text,
           lv_tabname      TYPE dfies-tabname,
           lv_tabix        TYPE sy-tabix.





* On n'applique cette règle que pour les vues Sale, logs et FIA
    CHECK cs_tview-viewname EQ '02' OR
          cs_tview-viewname EQ '06' OR
          cs_tview-viewname EQ '08' OR
          cs_tview-viewname EQ '09' OR
          cs_tview-viewname EQ '10'.


    CASE cs_tview-viewname.
      WHEN '02'.
        lv_tabname = gc_unit.
      WHEN '06'.
        lv_tabname = gc_fia.
      WHEN '08'.
        lv_tabname = gc_sale.
      WHEN '09'.
        lv_tabname = gc_logdc.
      WHEN '10'.
        lv_tabname = gc_logsto.
      WHEN OTHERS.
    ENDCASE.

*   On récupère les champs qui suivent ARTKEY
    CALL METHOD me->get_keyfield_table
      EXPORTING
        iv_tabname   = lv_tabname
      IMPORTING
        et_dfies_tab = lt_key_fieldtab.


* check duplicate on Key field only
    READ TABLE lt_key_fieldtab TRANSPORTING NO FIELDS
      WITH KEY fieldname = cs_tview-fieldname.
    CHECK sy-subrc = 0.

*  On garde en mémoire une version temporaire de la table check
*    lt_table_tmp = ct_table.

    lt_table = ct_table.
    SORT lt_table BY id
                       reqid
                       matnr
                       rownb
                       line
                       viewname
                       fieldname
                       status.

    READ TABLE lt_table TRANSPORTING NO FIELDS
    WITH KEY id        = cs_tview-id
             reqid     = cs_tview-reqid
             matnr     = cs_tview-matnr
             rownb     = cs_tview-rownb
             line      = cs_tview-line
             viewname  = cs_tview-viewname
             fieldname = 'ARTKEY'
             status    = 'E'
             BINARY SEARCH.
    IF sy-subrc EQ 0.
      EXIT.
    ENDIF.

    SORT lt_table.

*   On construit un where dynamique pour ne pas prendre en compte la ligne en cours
*   de traitement

    CLEAR ls_where.
    REFRESH lt_where.
*     On construit un WHERE
    CONCATENATE '& =' '''&1''' INTO lv_string SEPARATED BY space.
    ls_where = lv_string.
    REPLACE '&'  WITH 'ID' INTO ls_where.
    REPLACE '&1' WITH cs_tview-id INTO ls_where.
    APPEND ls_where TO lt_where.

    CLEAR : ls_where, lv_string.
    CONCATENATE 'AND' '& =' '''&1''' INTO lv_string SEPARATED BY space.
    ls_where = lv_string.
    REPLACE '&'  WITH 'REQID' INTO ls_where.
    REPLACE '&1' WITH cs_tview-reqid INTO ls_where.
    APPEND ls_where TO lt_where.

    CLEAR : ls_where, lv_string.
    CONCATENATE 'AND' '& =' '''&1''' INTO lv_string SEPARATED BY space.
    ls_where = lv_string.
    REPLACE '&'  WITH 'MATNR' INTO ls_where.
    REPLACE '&1' WITH cs_tview-matnr INTO ls_where.
    APPEND ls_where TO lt_where.

    CLEAR : ls_where, lv_string.
    CONCATENATE 'AND' '& =' '''&1''' INTO lv_string SEPARATED BY space.
    ls_where = lv_string.
    REPLACE '&'  WITH 'VIEWNAME' INTO ls_where.
    REPLACE '&1' WITH cs_tview-viewname INTO ls_where.
    APPEND ls_where TO lt_where.

    CLEAR : ls_where, lv_string.
    CONCATENATE 'AND' '& <>' '''&1''' INTO lv_string SEPARATED BY space.
    ls_where = lv_string.
    REPLACE '&'  WITH 'LINE' INTO ls_where.
    REPLACE '&1' WITH cs_tview-line INTO ls_where.
    APPEND ls_where TO lt_where.

    CLEAR : ls_where, lv_string, lv_string2.
*   On stock dans une table les données
    lv_string2 = '('.
    LOOP AT lt_key_fieldtab INTO ls_key_fieldtab.
      READ TABLE ct_table INTO ls_table
      WITH KEY id        = cs_tview-id
               reqid     = cs_tview-reqid
               matnr     = cs_tview-matnr
               rownb     = cs_tview-rownb
               line      = cs_tview-line
               viewname = cs_tview-viewname
               fieldname = ls_key_fieldtab-fieldname
               BINARY SEARCH.
      IF sy-subrc EQ 0.
        ls_field-fieldname = ls_key_fieldtab-fieldname.
        ls_field-value = ls_table-value.
        APPEND ls_field TO lt_field.
        CLEAR : ls_where, lv_string.
        IF lv_string2 IS NOT INITIAL.
          CONCATENATE 'AND' lv_string2 '& =' '''&1''' INTO lv_string SEPARATED BY space.
          ls_where = lv_string.
          REPLACE '&'  WITH 'FIELDNAME' INTO ls_where.
          REPLACE '&1' WITH ls_key_fieldtab-fieldname INTO ls_where.
          APPEND ls_where TO lt_where.
          CLEAR lv_string2.
        ELSE.
          CONCATENATE 'OR' '& =' '''&1''' INTO lv_string SEPARATED BY space.
          ls_where = lv_string.
          REPLACE '&'  WITH 'FIELDNAME' INTO ls_where.
          REPLACE '&1' WITH ls_key_fieldtab-fieldname INTO ls_where.
          APPEND ls_where TO lt_where.
        ENDIF.
      ELSE.
        CONTINUE.
      ENDIF.
    ENDLOOP.
    ls_where = ')'.
    APPEND ls_where TO lt_where.
    SORT lt_field.

*   On supprime les entrées inutiles de la table check
*   pour alléger la boucle et garder en perf
*    DELETE lt_table_tmp WHERE fieldname NOT IN lt_range_field
*                          AND fieldname <> 'ARTKEY'.
*    SORT lt_table_tmp BY  id
*                          reqid
*                          matnr
*                          rownb
*                          fieldname.


    LOOP AT lt_table ASSIGNING FIELD-SYMBOL(<fs_table>)
      WHERE (lt_where).
      CLEAR ls_field.
      REFRESH lt_field_bis.

      ls_field-fieldname = <fs_table>-fieldname.
      ls_field-value = <fs_table>-value.
      APPEND ls_field TO lt_field_bis.
      READ TABLE lt_field2 INTO ls_field2 WITH KEY line = <fs_table>-line.
      IF sy-subrc IS INITIAL.
        APPEND ls_field TO ls_field2-fields.
        SORT ls_field2-fields.
      ELSE.
        ls_field2-line = <fs_table>-line.
        APPEND ls_field TO ls_field2-fields.
        INSERT ls_field2 INTO lt_field2 INDEX sy-tabix.
      ENDIF.

    ENDLOOP.

    IF lt_field2 IS NOT INITIAL.
      DATA(lv_duplicate) = 'X'.
    ELSE.
      CLEAR lv_duplicate.
    ENDIF.

    LOOP AT lt_field ASSIGNING FIELD-SYMBOL(<fs_field>).
      LOOP AT lt_field2 ASSIGNING FIELD-SYMBOL(<fs_field2>).
        READ TABLE <fs_field2>-fields INTO ls_field
        WITH KEY fieldname = <fs_field>-fieldname
        BINARY SEARCH.
        IF sy-subrc IS INITIAL AND ls_field-value <> <fs_field>-value.
          CLEAR lv_duplicate.
          EXIT.
        ENDIF.
      ENDLOOP.
      IF lv_duplicate IS INITIAL.
        EXIT.
      ENDIF.
    ENDLOOP.
*     On boucle sur la table des clées
*      CLEAR : ls_key_fieldtab, lv_strg_msg.
*      LOOP AT lt_key_fieldtab INTO ls_key_fieldtab.
*        READ TABLE lt_table_tmp INTO ls_table
*        WITH KEY id        = <fs_table>-id
*                 reqid     = <fs_table>-reqid
*                 matnr     = <fs_table>-matnr
*                 rownb     = <fs_table>-rownb
*                 fieldname = ls_key_fieldtab-fieldname
*                 BINARY SEARCH.
*        IF sy-subrc EQ 0.
*          CLEAR ls_compt_field.
*          ls_compt_field = ls_table-value.
*          APPEND ls_compt_field TO lt_compt_field_tmp.
**         On construit le message en cas d'erreur avec les champs retrouvés
*
**          lv_ddobjname = ls_key_fieldtab-tabname.
**          lv_tabfield = lv_fieldname = ls_key_fieldtab-fieldname.
**
**          CALL METHOD me->retrieving_fieldtext
**            EXPORTING
**              is_ddobjname = lv_ddobjname
**              is_tabfield  = lv_tabfield
**              is_fieldname = lv_fieldname
**            IMPORTING
**              es_as4text   = lv_as4text.
**          CONCATENATE lv_strg_msg lv_as4text '/' ls_table-value
*          CONCATENATE lv_strg_msg ls_key_fieldtab-fieldname '/' ls_table-value
*          INTO lv_strg_msg SEPARATED BY space.
*        ENDIF.

*      ENDLOOP.
*      IF lt_compt_field_tmp[] IS NOT INITIAL.
*        IF lt_compt_field_tmp[] EQ lt_compt_field[].
*         Ligne possédant déjà la même clé
    IF lv_duplicate IS NOT INITIAL.
      CLEAR ls_msg.
      ls_msg-matnr      = cs_tview-matnr.
      ls_msg-id         = cs_tview-id.
      ls_msg-reqid      = cs_tview-reqid.
      ls_msg-rownb      = cs_tview-rownb.
      ls_msg-viewname   = cs_tview-viewname.
      ls_msg-line       = cs_tview-line.
      ls_msg-field      = cs_tview-fieldname.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = gc_classmsg.
      ls_msg-num        = '051'.
      ls_msg-message_v1 = lv_strg_msg.
      ls_msg-message_v2 = cs_tview-matnr.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message
      WITH ls_msg-message_v1 ls_msg-message_v2.
      APPEND ls_msg TO ct_msg.
*         Update the table view

      READ TABLE ct_table ASSIGNING FIELD-SYMBOL(<fs_update>)
      WITH KEY id        = cs_tview-id
               reqid     = cs_tview-reqid
               matnr     = cs_tview-matnr
               rownb     = cs_tview-rownb
               line      = cs_tview-line
               viewname  = cs_tview-viewname
               fieldname = 'ARTKEY'
               BINARY SEARCH.
      IF sy-subrc EQ 0.
        <fs_update>-status  = ls_msg-type.
        <fs_update>-message = ls_msg-message.
      ENDIF.
      cv_rc = 4.
      EXIT.
*    ELSE.
**          REFRESH lt_compt_field_tmp.
*      CLEAR lv_strg_msg.
*    ENDIF.

*    ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD CHECK_EINA_LIFNR.

    DATA : lt_dref        TYPE REF TO data,
           lt_where       TYPE TABLE OF edpline,
           lt_keyfields   TYPE TABLE OF cacs_s_cond_keyfields,
           ls_keyfields   TYPE cacs_s_cond_keyfields,
           ls_where       TYPE edpline,
           ls_msg         TYPE /dlwupex/tmsg,
           lt_table       TYPE /dlwupex/tview_tt,
           lv_string      TYPE string,
           lv_tabname     TYPE dcobjdef-name,
           lv_first       TYPE xfeld,
           lv_xfeld       TYPE xfeld,
           lv_no_function TYPE xfeld,
           lv_ddobjname   TYPE ddobjname,
           lv_output      TYPE string,
           lv_matnr_firt  TYPE matnr.
*           lv_rownb_tmp  TYPE /dlwupex/elineid,
*           lv_as4text     TYPE as4text.

    FIELD-SYMBOLS : <ft_tview_tmp> TYPE table,
                    <fs_id>        TYPE any,
                    <fs_reqid>     TYPE any,
                    <fs_matnr>     TYPE any,
                    <fs_rownb>     TYPE any,
                    <fs_ekorg>     TYPE any,
                    <fs_werks>     TYPE any,
                    <fs_reswk>     TYPE any,
                    <fs_viewname>  TYPE any,
                    <fs_fields>    TYPE any.

    REFRESH : lt_where, lt_keyfields.
    CLEAR : ls_where, ls_msg, lv_string, lv_matnr_firt, lv_tabname,
            ls_keyfields, lv_first.
*            ls_keyfields, lv_first, lv_as4text.
    UNASSIGN : <ft_tview_tmp>, <fs_id>, <fs_reqid>, <fs_matnr>, <fs_viewname>,
               <fs_fields>, <fs_reswk>.


    if GT_CTVIEW_EINA_LIFNR[] is INITIAL.
      GT_CTVIEW_EINA_LIFNR[] = it_table[].

      SORT GT_CTVIEW_EINA_LIFNR BY  id
                                    reqid
                                    matnr
                                    rownb
                                    viewname
                                    fieldname.
    endif.

*    lt_table = it_table.

*    lv_rownb_tmp = cs_tview-line - 1 .
*On récupère en amont le libelle du champ technique en cas d'erreur
*    CALL METHOD me->retrieving_fieldtext
*      EXPORTING
*        is_ddobjname = is_tfields-tabname
*        is_tabfield  = is_tfields-tabfield
*        is_fieldname = cs_tview-fieldname
*      IMPORTING
*        es_as4text   = lv_as4text.

*    SORT lt_table BY  id
*                      reqid
*                      matnr
*                      rownb
*                      viewname
*                      fieldname.

*    READ TABLE lt_table ASSIGNING FIELD-SYMBOL(<fs_line>)
    READ TABLE GT_CTVIEW_EINA_LIFNR ASSIGNING FIELD-SYMBOL(<fs_line>)
          WITH KEY id        = cs_tview-id
                   reqid     = cs_tview-reqid
                   matnr     = cs_tview-matnr
                   rownb     = cs_tview-rownb
                   viewname  = is_tfields-viewname
                   fieldname = gc_ekorg
                   BINARY SEARCH.

    ASSIGN COMPONENT gc_value
                OF STRUCTURE <fs_line> TO <fs_ekorg>.


    lv_ddobjname = is_tfields-tabname.
    CALL METHOD me->get_convexit
      EXPORTING
*       is_convexit    = ls_dfies_tab-convexit
        is_value       = cs_tview-value
*       is_tabcontrol  = ls_dfies_tab
        iv_ddobjname   = lv_ddobjname
        iv_fieldname   = is_tfields-tabfield
      IMPORTING
        es_xfeld       = lv_xfeld
        ev_output      = lv_output
      CHANGING
        cv_no_function = lv_no_function.

    SELECT COUNT(*) UP TO 1 ROWS FROM lfm1
      WHERE lifnr = lv_output AND
      ekorg = <fs_ekorg>.
    IF sy-subrc IS NOT INITIAL.
      CLEAR ls_msg.
      ls_msg-matnr      = cs_tview-matnr.
      ls_msg-id         = cs_tview-id.
      ls_msg-reqid      = cs_tview-reqid.
      ls_msg-viewname   = cs_tview-viewname.
      ls_msg-field      = cs_tview-fieldname.
      ls_msg-line       = cs_tview-line.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = gc_classmsg.
      ls_msg-num        = '058'.
      ls_msg-message_v1 = cs_tview-value.
      ls_msg-message_v2 = <fs_ekorg>.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2.
      APPEND ls_msg TO ct_msg.
*           Update the table view
      cs_tview-status = ls_msg-type.
      cs_tview-message = ls_msg-message.
      EXIT.
    ELSE.
      SELECT COUNT(*) UP TO 1 ROWS FROM lfm1
        WHERE lifnr = lv_output AND
        ekorg = <fs_ekorg> AND
        sperm = abap_true.
      IF sy-subrc IS INITIAL.
        CLEAR ls_msg.
        ls_msg-matnr      = cs_tview-matnr.
        ls_msg-id         = cs_tview-id.
        ls_msg-reqid      = cs_tview-reqid.
        ls_msg-viewname   = cs_tview-viewname.
        ls_msg-field      = cs_tview-fieldname.
        ls_msg-line       = cs_tview-line.
        ls_msg-type       = 'E'.
        ls_msg-idmsg      = 'ME'.
        ls_msg-num        = '023'.
        ls_msg-message_v1 = cs_tview-value.
        ls_msg-message_v2 = <fs_ekorg>.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2.
        APPEND ls_msg TO ct_msg.
*           Update the table view
        cs_tview-status = ls_msg-type.
        cs_tview-message = ls_msg-message.
        EXIT.
      ENDIF.
    ENDIF.
***    Check 2 : LIFNR présent en table
*** DEJA FAIT PLUS TARD DANS LE PROCESSUS A SUPPRIMER APRES VERIF
*    CALL METHOD me->check_table_control
*      EXPORTING
*        is_tfields = is_tfields
**       iv_flag_empty = lv_flag_empty
*      CHANGING
*        ct_msg     = ct_msg
*        cs_tview   = cs_tview
*        cv_rc      = cv_rc.

  ENDMETHOD.


  METHOD check_eina_ltsnr.

    DATA : lt_dref        TYPE REF TO data,
           ls_msg         TYPE /dlwupex/tmsg,
           lt_table       TYPE /dlwupex/tview_tt,
           lv_string      TYPE string,
           lv_tabname     TYPE dcobjdef-name,
           lv_first       TYPE xfeld,
           lv_xfeld       TYPE xfeld,
           lv_no_function TYPE xfeld,
           lv_ddobjname   TYPE ddobjname,
           lv_lifnr       TYPE lifnr,
           lv_matnr_firt  TYPE matnr.
*           lv_rownb_tmp  TYPE /dlwupex/elineid,
*           lv_as4text     TYPE as4text.

    FIELD-SYMBOLS : <fs_lifnr>     TYPE any.

    CLEAR : ls_msg, lv_string, lv_matnr_firt, lv_tabname,
            lv_first.", lv_as4text.
    UNASSIGN : <fs_lifnr>.

    CALL METHOD me->check_table_control
      EXPORTING
        is_tfields = is_tfields
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview
        cv_rc      = cv_rc.
    IF cs_tview-status IS NOT INITIAL.
      EXIT.
    ENDIF.


    if GT_CTVIEW_EINA_LTSNR[] is INITIAL.
      GT_CTVIEW_EINA_LTSNR[] = it_table[].

      SORT GT_CTVIEW_EINA_LTSNR BY  id
                                    reqid
                                    matnr
                                    rownb
                                    viewname
                                    fieldname.
    endif.

*    lt_table = it_table.

*    lv_rownb_tmp = cs_tview-line - 1 .
*On récupère en amont le libelle du champ technique en cas d'erreur
*    CALL METHOD me->retrieving_fieldtext
*      EXPORTING
*        is_ddobjname = is_tfields-tabname
*        is_tabfield  = is_tfields-tabfield
*        is_fieldname = cs_tview-fieldname
*      IMPORTING
*        es_as4text   = lv_as4text.
*
*    SORT lt_table BY  id
*                      reqid
*                      matnr
*                      rownb
*                      viewname
*                      fieldname.

    READ TABLE GT_CTVIEW_EINA_LTSNR ASSIGNING FIELD-SYMBOL(<fs_line>)
          WITH KEY id        = cs_tview-id
                   reqid     = cs_tview-reqid
                   matnr     = cs_tview-matnr
                   rownb     = cs_tview-rownb
                   viewname  = is_tfields-viewname
                   fieldname = gc_lifnr
                   BINARY SEARCH.

    ASSIGN COMPONENT gc_value
                OF STRUCTURE <fs_line> TO <fs_lifnr>.


    CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
      EXPORTING
        input  = <fs_lifnr>
      IMPORTING
        output = lv_lifnr.


*    lv_ddobjname = is_tfields-tabname.
*    CALL METHOD me->get_convexit
*      EXPORTING
**       is_convexit    = ls_dfies_tab-convexit
*        is_value       = <fs_lifnr>
**       is_tabcontrol  = ls_dfies_tab
*        iv_ddobjname   = lv_ddobjname
*        iv_fieldname   = is_tfields-tabfield
*      IMPORTING
*        es_xfeld       = lv_xfeld
*        ev_output      = lv_output
*      CHANGING
*        cv_no_function = lv_no_function.

    SELECT COUNT(*) UP TO 1 ROWS FROM wyt1
      WHERE lifnr = lv_lifnr AND
            ltsnr = cs_tview-value.
    IF sy-subrc IS NOT INITIAL.
      CLEAR ls_msg.
      ls_msg-matnr      = cs_tview-matnr.
      ls_msg-id         = cs_tview-id.
      ls_msg-reqid      = cs_tview-reqid.
      ls_msg-viewname   = cs_tview-viewname.
      ls_msg-field      = cs_tview-fieldname.
      ls_msg-line       = cs_tview-line.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = gc_classmsg.
      ls_msg-num        = '067'.
      ls_msg-message_v1 = cs_tview-value.
      ls_msg-message_v2 = lv_lifnr.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2.
      APPEND ls_msg TO ct_msg.
*           Update the table view
      cs_tview-status = ls_msg-type.
      cs_tview-message = ls_msg-message.
      EXIT.
    ENDIF.
***    Check 2 : LIFNR présent en table
*** DEJA FAIT PLUS TARD DANS LE PROCESSUS A SUPPRIMER APRES VERIF
*    CALL METHOD me->check_table_control
*      EXPORTING
*        is_tfields = is_tfields
**       iv_flag_empty = lv_flag_empty
*      CHANGING
*        ct_msg     = ct_msg
*        cs_tview   = cs_tview
*        cv_rc      = cv_rc.

  ENDMETHOD.


  method CHECK_EINA_MATNR.
  endmethod.


  METHOD check_eina_relif.

    DATA : lt_dref    TYPE REF TO data,
           lt_where   TYPE TABLE OF edpline,
           ls_where   TYPE edpline,
           ls_msg     TYPE /dlwupex/tmsg,
           lv_string  TYPE string,
           lv_as4text TYPE as4text.

    FIELD-SYMBOLS : <ft_tview_tmp> TYPE table,
                    <fs_id>        TYPE any,
                    <fs_reqid>     TYPE any,
                    <fs_matnr>     TYPE any,
                    <fs_line>      TYPE any,
                    <fs_viewname>  TYPE any,
                    <fs_fields>    TYPE any.

    check cs_tview-viewname = '06'.

    REFRESH : lt_where.
    CLEAR : ls_where, ls_msg, lv_string, lv_as4text.
    UNASSIGN : <ft_tview_tmp>,
               <fs_id>, <fs_reqid>, <fs_matnr>,
               <fs_line>, <fs_viewname>.

*On récupère en amont le libelle du champ technique en cas d'erreur
    CALL METHOD me->retrieving_fieldtext
      EXPORTING
        is_ddobjname = is_tfields-tabname
        is_tabfield  = is_tfields-tabfield
        is_fieldname = cs_tview-fieldname
      IMPORTING
        es_as4text   = lv_as4text.

*   Si RELIF est coché
    IF cs_tview-value IS NOT INITIAL.


*     Doublons stokés dans /DLWUPEX/TFIA pour le fournisseur principal
      if GV_TFIA_EINA_RELIF is INITIAL.
        select
          id reqid art_key into CORRESPONDING FIELDS OF table Gt_TFIA_EINA_RELIF
          from /DLWUPEX/TFIA
          where id      = cs_tview-id
          and   reqid   = cs_tview-reqid
          and   relif   = 'X'
          group by id reqid art_key
          having count(*) > 1.
        if sy-subrc eq 0.

        endif.

        GV_TFIA_EINA_RELIF = 'X'.
      endif.




      read TABLE Gt_TFIA_EINA_RELIF TRANSPORTING NO FIELDS with key art_key = cs_tview-matnr.
      if sy-subrc eq 0.
        CLEAR ls_msg.
        ls_msg-matnr      = cs_tview-matnr.
        ls_msg-id         = cs_tview-id.
        ls_msg-reqid      = cs_tview-reqid.
        ls_msg-viewname   = cs_tview-viewname.
        ls_msg-field      = cs_tview-fieldname.
*        ls_msg-line       = cs_tview-line.
        ls_msg-type       = 'E'.
        ls_msg-idmsg      = gc_classmsg.
        ls_msg-num        = '017'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message.
        APPEND ls_msg TO ct_msg.
*       Update the table view
        cs_tview-status = ls_msg-type.
        cs_tview-message = ls_msg-message.
      endif.

exit.
*     On alimente une table temporaire sans la ligne en cours de traitement
*      CREATE DATA lt_dref TYPE TABLE OF (gc_tab_reserve).
*      ASSIGN lt_dref->* TO <ft_tview_tmp>.
*      <ft_tview_tmp>[] = it_table[].

*      DELETE <ft_tview_tmp> INDEX iv_tabix.



      CLEAR ls_where.
      REFRESH lt_where.
*     On construit un WHERE
      CONCATENATE '& =' '''&1''' INTO lv_string SEPARATED BY space.
      ls_where = lv_string.
      REPLACE '&'  WITH 'MATNR' INTO ls_where.
      REPLACE '&1' WITH cs_tview-matnr INTO ls_where.
      APPEND ls_where TO lt_where.
      CLEAR : ls_where, lv_string.
      CONCATENATE 'AND' '& <>' '''&1''' INTO lv_string SEPARATED BY space.
      ls_where = lv_string.
      REPLACE '&'  WITH 'LINE' INTO ls_where.
      REPLACE '&1' WITH cs_tview-line INTO ls_where.
      APPEND ls_where TO lt_where.
      CLEAR : ls_where, lv_string.
      CONCATENATE 'AND' '& =' '''&1''' INTO lv_string SEPARATED BY space.
      ls_where = lv_string.
      REPLACE '&'  WITH 'FIELDNAME' INTO ls_where.
      REPLACE '&1' WITH is_tfields-tabfield INTO ls_where.
      APPEND ls_where TO lt_where.
      CLEAR : ls_where, lv_string.
      CONCATENATE 'AND' '& =' '''&1''' INTO lv_string SEPARATED BY space.
      ls_where = lv_string.
      REPLACE '&'  WITH 'VALUE' INTO ls_where.
      REPLACE '&1' WITH gc_xfeld INTO ls_where.
      APPEND ls_where TO lt_where.

****  Check 1 : 1 seul flag possible par article pour RELIF
      LOOP AT <ft_tview_tmp> ASSIGNING FIELD-SYMBOL(<fs_tfields>)
        WHERE (lt_where).
*       On récupère ID
        ASSIGN COMPONENT gc_id
        OF STRUCTURE <fs_tfields> TO <fs_id>.
*       On récupère REQID
        ASSIGN COMPONENT gc_reqid
        OF STRUCTURE <fs_tfields> TO <fs_reqid>.
*       On récupère MATNR
        ASSIGN COMPONENT gc_matnr
        OF STRUCTURE <fs_tfields> TO <fs_matnr>.
*       On récupère la value
        ASSIGN COMPONENT gc_value
        OF STRUCTURE <fs_tfields> TO <fs_fields>.

        IF <fs_fields> EQ cs_tview-value.
*         1 seul flag possible par article pour RELIF
          CLEAR ls_msg.
          ls_msg-matnr      = cs_tview-matnr.
          ls_msg-id         = cs_tview-id.
          ls_msg-reqid      = cs_tview-reqid.
          ls_msg-viewname   = cs_tview-viewname.
          ls_msg-field      = cs_tview-fieldname.
          ls_msg-line       = cs_tview-line.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-num        = '017'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message.
          APPEND ls_msg TO ct_msg.
*         Update the table view
          cs_tview-status = ls_msg-type.
          cs_tview-message = ls_msg-message.
          EXIT.

        ENDIF.

      ENDLOOP.

    ENDIF.

  ENDMETHOD.


  METHOD check_eine_ekorg.

    DATA : ls_tbuoa   TYPE /dlwupex/tbuoa,
           ls_msg     TYPE /dlwupex/tmsg,
           lv_as4text TYPE as4text.

*** INITIALIZATION
    CLEAR : ls_tbuoa, ls_msg, lv_as4text.

    CALL METHOD me->check_table_control
      EXPORTING
        is_tfields = is_tfields
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview
        cv_rc      = cv_rc.
    IF cs_tview-status IS NOT INITIAL.
      EXIT.
    ENDIF.

*On récupère en amont le libelle du champ technique en cas d'erreur
    CALL METHOD me->retrieving_fieldtext
      EXPORTING
        is_ddobjname = is_tfields-tabname
        is_tabfield  = is_tfields-tabfield
        is_fieldname = cs_tview-fieldname
      IMPORTING
        es_as4text   = lv_as4text.

***  Check : Lire la table de custom avec l'OA
    CLEAR ls_tbuoa.
    READ TABLE gt_tbuoa INTO ls_tbuoa
    WITH KEY id    = cs_tview-id
             ekorg = cs_tview-value
             BINARY SEARCH.
    IF sy-subrc NE 0.
*     L'OA saisie n'est pas dans la table de custom
      CLEAR ls_msg.
      ls_msg-matnr      = cs_tview-matnr.
      ls_msg-id         = cs_tview-id.
      ls_msg-reqid      = cs_tview-reqid.
      ls_msg-viewname   = cs_tview-viewname.
      ls_msg-field      = cs_tview-fieldname.
      ls_msg-line       = cs_tview-line.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = gc_classmsg.
      ls_msg-num        = '037'.
      ls_msg-message_v1 = cs_tview-value.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message
        WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
*     Update the table view
      cs_tview-status = ls_msg-type.
      cs_tview-message = ls_msg-message.
      EXIT.

    ENDIF.

  ENDMETHOD.


  METHOD check_eord_lifnr.

    DATA : lt_dref        TYPE REF TO data,
           lt_where       TYPE TABLE OF edpline,
           lt_keyfields   TYPE TABLE OF cacs_s_cond_keyfields,
           ls_keyfields   TYPE cacs_s_cond_keyfields,
           ls_where       TYPE edpline,
           ls_msg         TYPE /dlwupex/tmsg,
*           lt_table       TYPE /dlwupex/tview_tt,
           lv_string      TYPE string,
           lv_tabname     TYPE dcobjdef-name,
           lv_first       TYPE xfeld,
           lv_xfeld       TYPE xfeld,
           lv_no_function TYPE xfeld,
           lv_ddobjname   TYPE ddobjname,
           lv_output      TYPE string.
*           lv_matnr_firt  TYPE matnr.
*           lv_rownb_tmp  TYPE /dlwupex/elineid,
*           lv_as4text     TYPE as4text.

    FIELD-SYMBOLS :" <ft_tview_tmp> TYPE table,
*                    <fs_id>        TYPE any,
*                    <fs_reqid>     TYPE any,
*                    <fs_matnr>     TYPE any,
*                    <fs_rownb>     TYPE any,
*                    <fs_ekorg>     TYPE any,
                    <fs_werks>     TYPE any.
*                    <fs_reswk>     TYPE any,
*                    <fs_viewname>  TYPE any,
*                    <fs_fields>    TYPE any.

    REFRESH : lt_where, lt_keyfields.
    CLEAR : ls_where, ls_msg, lv_string,  lv_tabname,
            ls_keyfields, lv_first.", lv_as4text.
*    UNASSIGN : <ft_tview_tmp>, <fs_id>, <fs_reqid>, <fs_matnr>, <fs_viewname>,
*               <fs_fields>, <fs_reswk>.

*    lt_table = it_table.
*    SORT lt_table BY  id
*                      reqid
*                      matnr
*                      rownb
*                      line
*                      viewname
*                      fieldname.

    IF gt_ctview_eord_lifnr[] IS INITIAL.
      gt_ctview_eord_lifnr[] = it_table[].

      SORT gt_ctview_eord_lifnr BY  id
                                    reqid
                                    matnr
                                    rownb
                                    line
                                    viewname
                                    fieldname.
    ENDIF.




*    lv_rownb_tmp = cs_tview-line - 1 .
*On récupère en amont le libelle du champ technique en cas d'erreur
*    CALL METHOD me->retrieving_fieldtext
*      EXPORTING
*        is_ddobjname = is_tfields-tabname
*        is_tabfield  = is_tfields-tabfield
*        is_fieldname = cs_tview-fieldname
*      IMPORTING
*        es_as4text   = lv_as4text.

*   Si LIFNR est coché
    IF cs_tview-value IS NOT INITIAL.

**     On garde en mémoire le matnr pour la comparaison plus tard
*      lv_matnr_firt = cs_tview-matnr.

*     On va récupérer le WERKS
      READ TABLE gt_ctview_eord_lifnr ASSIGNING FIELD-SYMBOL(<fs_line>)
      WITH KEY id        = cs_tview-id
               reqid     = cs_tview-reqid
               matnr     = cs_tview-matnr
               rownb     = cs_tview-rownb
               line      = cs_tview-line
               viewname  = is_tfields-viewname
               fieldname = gc_werks
               BINARY SEARCH.
      IF sy-subrc EQ 0.
*       Valeur de werks
        ASSIGN COMPONENT gc_value
        OF STRUCTURE <fs_line> TO <fs_werks>.
        CHECK <fs_werks> IS ASSIGNED.

        SELECT SINGLE
          ekorg,
          lifnr,
          reswk
          INTO @DATA(ls_tsrlist)
          FROM /dlwupex/tsrlist
          WHERE id    = @cs_tview-id
          AND reqid   = @cs_tview-reqid
          AND line    = @cs_tview-line
          AND art_key = @cs_tview-matnr
          AND werks   = @<fs_werks>.
        IF sy-subrc EQ 0.
          IF ls_tsrlist-lifnr IS NOT INITIAL AND"Forcément renseigné ici !
             ls_tsrlist-reswk IS NOT INITIAL.
*        seul saisie entre LIFNR et RESWK
            SELECT SINGLE lifnr INTO @DATA(lv_lifnr)
              FROM t001w
              WHERE werks = @ls_tsrlist-reswk.
            IF ( lv_lifnr NE ls_tsrlist-lifnr ).
              CLEAR ls_msg.
              ls_msg-matnr      = cs_tview-matnr.
              ls_msg-id         = cs_tview-id.
              ls_msg-reqid      = cs_tview-reqid.
              ls_msg-viewname   = cs_tview-viewname.
              ls_msg-field      = cs_tview-fieldname.
              ls_msg-line       = cs_tview-line.
              ls_msg-type       = 'E'.
              ls_msg-idmsg      = gc_classmsg.
              ls_msg-num        = '018'.
              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message.
              APPEND ls_msg TO ct_msg.
*           Update the table view
              cs_tview-status = ls_msg-type.
              cs_tview-message = ls_msg-message.
              EXIT.
            ENDIF.
          ENDIF.

*          Check existence LFM1
          SELECT SINGLE
            sperm INTO @DATA(lv_sperm)
            FROM lfm1
            WHERE lifnr = @ls_tsrlist-lifnr
            AND   ekorg = @ls_tsrlist-ekorg.
          IF sy-subrc NE 0.

            CLEAR ls_msg.
            ls_msg-matnr      = cs_tview-matnr.
            ls_msg-id         = cs_tview-id.
            ls_msg-reqid      = cs_tview-reqid.
            ls_msg-viewname   = cs_tview-viewname.
            ls_msg-field      = cs_tview-fieldname.
            ls_msg-line       = cs_tview-line.
            ls_msg-type       = 'E'.
            ls_msg-idmsg      = gc_classmsg.
            ls_msg-num        = '058'.
            ls_msg-message_v1 = cs_tview-value.
            ls_msg-message_v2 = ls_tsrlist-ekorg.
            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
              INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2.
            APPEND ls_msg TO ct_msg.
*                   Update the table view
            cs_tview-status = ls_msg-type.
            cs_tview-message = ls_msg-message.
            EXIT.

          ELSEIF lv_sperm EQ abap_true.

            CLEAR ls_msg.
            ls_msg-matnr      = cs_tview-matnr.
            ls_msg-id         = cs_tview-id.
            ls_msg-reqid      = cs_tview-reqid.
            ls_msg-viewname   = cs_tview-viewname.
            ls_msg-field      = cs_tview-fieldname.
            ls_msg-line       = cs_tview-line.
            ls_msg-type       = 'E'.
            ls_msg-idmsg      = 'ME'.
            ls_msg-num        = '023'.
            ls_msg-message_v1 = cs_tview-value.
            ls_msg-message_v2 = ls_tsrlist-ekorg.
            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
              INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2.
            APPEND ls_msg TO ct_msg.
*                 Update the table view
            cs_tview-status = ls_msg-type.
            cs_tview-message = ls_msg-message.
            EXIT.

          ENDIF.




        ENDIF.
      ENDIF.
    ENDIF.
*
**       On alimente une table temporaire sans la ligne en cours de traitement
*        SORT lt_table BY id
*                           reqid
*                           matnr
*                           rownb
*                           viewname
*                           fieldname.
*        CREATE DATA lt_dref TYPE TABLE OF (gc_tab_reserve).
*        ASSIGN lt_dref->* TO <ft_tview_tmp>.
*        <ft_tview_tmp>[] = lt_table[].
*        DELETE <ft_tview_tmp> INDEX iv_tabix.
*
*
**       On récupère la cléde la table des views
*        lv_tabname = gc_tab_reserve.
*        CALL METHOD me->get_keyfield
*          EXPORTING
*            iv_tabname   = lv_tabname
*          IMPORTING
*            et_keyfields = lt_keyfields.
**CALL FUNCTION 'CACS_GET_TABLE_FIELDS'
**          EXPORTING
**            i_tabname  = lv_tabname
**          TABLES
**            t_keyfield = lt_keyfields.
*
*        CLEAR : ls_keyfields, lv_first.
*        LOOP AT lt_keyfields INTO ls_keyfields.
*
**          IF lv_first IS INITIAL.
**            lv_first = 'X'.
**          ENDIF.
*
*          CLEAR : ls_where, lv_string.
*          IF ls_keyfields-fieldname NE 'MANDT'
*            AND ls_keyfields-fieldname NE 'ROWNB'.
**            AND ls_keyfields-fieldname NE 'LINE'.
*
*            CASE lv_first.
*              WHEN ''.
**                CONCATENATE '& =' '''&1''' INTO lv_string SEPARATED BY space.
*                CONCATENATE '& ' '= ''&1' INTO lv_string SEPARATED BY space.
*                lv_first = 'X'.
*              WHEN OTHERS.
**                CONCATENATE 'AND' '& =' '''&1''' INTO lv_string SEPARATED BY space.
*                CONCATENATE 'AND & =' ' ''&1' INTO lv_string SEPARATED BY space.
*            ENDCASE.
*            ls_where = lv_string.
*            REPLACE '&'  WITH ls_keyfields-fieldname INTO ls_where.
*            CASE ls_keyfields-fieldname.
*              WHEN 'FIELDNAME'.
*                IF is_tfields-tabfield EQ 'LIFNR'.
*                  REPLACE '&1' WITH gc_reswk INTO ls_where.
*                ELSEIF is_tfields-tabfield EQ 'RESWK'.
*                  REPLACE '&1' WITH gc_lifnr INTO ls_where.
*                ENDIF.
*              WHEN OTHERS.
*                ASSIGN COMPONENT ls_keyfields-fieldname
*                OF STRUCTURE cs_tview TO <fs_fields>.
*                IF <fs_fields> IS ASSIGNED.
*
*                  REPLACE '&1' WITH <fs_fields> INTO ls_where.
*
*                ENDIF.
*            ENDCASE.
*            CLEAR lv_string.
*            lv_string = ls_where.
*            CONCATENATE lv_string '''' INTO lv_string.
*            ls_where = lv_string.
*            APPEND ls_where TO lt_where.
*
*          ENDIF.
*
*        ENDLOOP.
*
****     Check 1 : Si LIFNR~RESWK est coché RESWK~LIFNR ne doit pas l'être
*        LOOP AT <ft_tview_tmp> ASSIGNING FIELD-SYMBOL(<fs_tfields>)
*          WHERE (lt_where).
**         On récupère ID
*          ASSIGN COMPONENT gc_id
*          OF STRUCTURE <fs_tfields> TO <fs_id>.
**         On récupère REQID
*          ASSIGN COMPONENT gc_reqid
*          OF STRUCTURE <fs_tfields> TO <fs_reqid>.
**         On récupère MATNR
*          ASSIGN COMPONENT gc_matnr
*          OF STRUCTURE <fs_tfields> TO <fs_matnr>.
**         On récupère MATNR
*          ASSIGN COMPONENT gc_rownb
*          OF STRUCTURE <fs_tfields> TO <fs_rownb>.
*
**         On récupère RESWK
*          UNASSIGN <fs_line>.
*          READ TABLE <ft_tview_tmp> ASSIGNING <fs_line>
*          WITH KEY ('ID')        = <fs_id>
*                   ('REQID')     = <fs_reqid>
*                   ('MATNR')     = <fs_matnr>
*                   ('ROWNB')     = <fs_rownb>
*                   ('VIEWNAME')  = is_tfields-viewname
*                   ('FIELDNAME') = 'RESWK'
*                   BINARY SEARCH.
*          IF sy-subrc EQ 0.
*            ASSIGN COMPONENT gc_value
*            OF STRUCTURE <fs_line> TO <fs_reswk>.
*            IF cs_tview-value IS NOT INITIAL
*              AND <fs_reswk> IS NOT INITIAL.
**             1 seul saisie entre LIFNR et RESWK
*              CLEAR ls_msg.
*              ls_msg-matnr      = cs_tview-matnr.
*              ls_msg-id         = cs_tview-id.
*              ls_msg-reqid      = cs_tview-reqid.
*              ls_msg-viewname   = cs_tview-viewname.
*              ls_msg-field      = cs_tview-fieldname.
*              ls_msg-line       = cs_tview-line.
*              ls_msg-type       = 'E'.
*              ls_msg-idmsg      = gc_classmsg.
*              ls_msg-num        = '018'.
*              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                INTO ls_msg-message.
*              APPEND ls_msg TO ct_msg.
**           Update the table view
*              cs_tview-status = ls_msg-type.
*              cs_tview-message = ls_msg-message.
*              EXIT.
*            ENDIF.
*          ENDIF.
*
*        ENDLOOP.
*
*      ENDIF.
*
*    ENDIF.
*
*    SORT lt_table BY  id
*                      reqid
*                      matnr
*                      rownb
*                      viewname
*                      fieldname.
*
*    READ TABLE lt_table ASSIGNING <fs_line>
*          WITH KEY id        = cs_tview-id
*                   reqid     = cs_tview-reqid
*                   matnr     = cs_tview-matnr
*                   rownb     = cs_tview-rownb
*                   viewname  = is_tfields-viewname
*                   fieldname = gc_ekorg
*                   BINARY SEARCH.
*    ASSIGN COMPONENT gc_value
*                OF STRUCTURE <fs_line> TO <fs_ekorg>.
*
*
*    lv_ddobjname = is_tfields-tabname.
*    CALL METHOD me->get_convexit
*      EXPORTING
**       is_convexit    = ls_dfies_tab-convexit
*        is_value       = cs_tview-value
**       is_tabcontrol  = ls_dfies_tab
*        iv_ddobjname   = lv_ddobjname
*        iv_fieldname   = is_tfields-tabfield
*      IMPORTING
*        es_xfeld       = lv_xfeld
*        ev_output      = lv_output
*      CHANGING
*        cv_no_function = lv_no_function.
*
*    SELECT COUNT(*) UP TO 1 ROWS FROM lfm1
*      WHERE lifnr = lv_output AND
*      ekorg = <fs_ekorg>.
*    IF sy-subrc IS NOT INITIAL.
*      CLEAR ls_msg.
*      ls_msg-matnr      = cs_tview-matnr.
*      ls_msg-id         = cs_tview-id.
*      ls_msg-reqid      = cs_tview-reqid.
*      ls_msg-viewname   = cs_tview-viewname.
*      ls_msg-field      = cs_tview-fieldname.
*      ls_msg-line       = cs_tview-line.
*      ls_msg-type       = 'E'.
*      ls_msg-idmsg      = gc_classmsg.
*      ls_msg-num        = '058'.
*      ls_msg-message_v1 = cs_tview-value.
*      ls_msg-message_v2 = <fs_ekorg>.
*      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*        INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2.
*      APPEND ls_msg TO ct_msg.
**           Update the table view
*      cs_tview-status = ls_msg-type.
*      cs_tview-message = ls_msg-message.
*      EXIT.
*    ELSE.
*      SELECT COUNT(*) UP TO 1 ROWS FROM lfm1
*        WHERE lifnr = lv_output AND
*        ekorg = <fs_ekorg> AND
*        sperm = abap_true.
*      IF sy-subrc IS INITIAL.
*        CLEAR ls_msg.
*        ls_msg-matnr      = cs_tview-matnr.
*        ls_msg-id         = cs_tview-id.
*        ls_msg-reqid      = cs_tview-reqid.
*        ls_msg-viewname   = cs_tview-viewname.
*        ls_msg-field      = cs_tview-fieldname.
*        ls_msg-line       = cs_tview-line.
*        ls_msg-type       = 'E'.
*        ls_msg-idmsg      = 'ME'.
*        ls_msg-num        = '023'.
*        ls_msg-message_v1 = cs_tview-value.
*        ls_msg-message_v2 = <fs_ekorg>.
*        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*          INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2.
*        APPEND ls_msg TO ct_msg.
**           Update the table view
*        cs_tview-status = ls_msg-type.
*        cs_tview-message = ls_msg-message.
*        EXIT.
*      ENDIF.
*    ENDIF.
****    Check 2 : LIFNR présent en table
**** DEJA FAIT PLUS TARD DANS LE PROCESSUS A SUPPRIMER APRES VERIF
**    CALL METHOD me->check_table_control
**      EXPORTING
**        is_tfields = is_tfields
***       iv_flag_empty = lv_flag_empty
**      CHANGING
**        ct_msg     = ct_msg
**        cs_tview   = cs_tview
**        cv_rc      = cv_rc.
*
  ENDMETHOD.


  METHOD check_eord_reswk.

    DATA : lt_dref      TYPE REF TO data,
           lt_where     TYPE TABLE OF edpline,
           lt_keyfields TYPE TABLE OF cacs_s_cond_keyfields,
           ls_keyfields TYPE cacs_s_cond_keyfields,
           ls_where     TYPE edpline,
*           lt_table      TYPE /dlwupex/tview_tt,
           ls_msg       TYPE /dlwupex/tmsg,
           lv_string    TYPE string,
           lv_tabname   TYPE dcobjdef-name,
           lv_first     TYPE xfeld.
*           lv_matnr_firt TYPE matnr,
*           lv_as4text    TYPE as4text.

    FIELD-SYMBOLS : "<ft_tview_tmp> TYPE table,
*                    <fs_id>        TYPE any,
*                    <fs_reqid>     TYPE any,
*                    <fs_matnr>     TYPE any,
                    <fs_werks>     TYPE any.
*                    <fs_rownb>     TYPE any,
*                    <fs_viewname>  TYPE any,
*                    <fs_fields>    TYPE any.

    REFRESH : lt_where, lt_keyfields.
    CLEAR : ls_where, ls_msg, lv_string, lv_tabname,
            ls_keyfields, lv_first.
*    UNASSIGN : <ft_tview_tmp>, <fs_id>, <fs_reqid>, <fs_matnr>, <fs_viewname>,
*               <fs_fields>.

*    lt_table = it_table.
*    SORT lt_table BY id
*                     reqid
*                     matnr
*                     rownb
*                     viewname
*                     fieldname.

    IF gt_ctview_eord_reswk[] IS INITIAL.
      gt_ctview_eord_reswk[] = it_table[].

      SORT gt_ctview_eord_reswk BY  id
                                    reqid
                                    matnr
                                    rownb
                                    viewname
                                    fieldname.
    ENDIF.

    CALL METHOD me->check_table_control
      EXPORTING
        is_tfields = is_tfields
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview
        cv_rc      = cv_rc.
    IF cs_tview-status IS NOT INITIAL.
      EXIT.
    ENDIF.

**On récupère en amont le libelle du champ technique en cas d'erreur
*    CALL METHOD me->retrieving_fieldtext
*      EXPORTING
*        is_ddobjname = is_tfields-tabname
*        is_tabfield  = is_tfields-tabfield
*        is_fieldname = cs_tview-fieldname
*      IMPORTING
*        es_as4text   = lv_as4text.

*   Si LIFNR est coché
    IF cs_tview-value IS NOT INITIAL.

**     On garde en mémoire le matnr pour la comparaison plus tard
*      lv_matnr_firt = cs_tview-matnr.

*     On va récupérer le WERKS
      READ TABLE gt_ctview_eord_reswk ASSIGNING FIELD-SYMBOL(<fs_line>)
      WITH KEY id        = cs_tview-id
               reqid     = cs_tview-reqid
               matnr     = cs_tview-matnr
               rownb     = cs_tview-rownb
               viewname  = is_tfields-viewname
               fieldname = gc_werks
               BINARY SEARCH.
      IF sy-subrc EQ 0.
*       Valeur de werks
        ASSIGN COMPONENT gc_value
        OF STRUCTURE <fs_line> TO <fs_werks>.
        CHECK <fs_werks> IS ASSIGNED.

        SELECT SINGLE
          ekorg,
          lifnr,
          reswk
          INTO @DATA(ls_tsrlist)
          FROM /dlwupex/tsrlist
          WHERE id    = @cs_tview-id
          AND reqid   = @cs_tview-reqid
          AND line    = @cs_tview-line
          AND art_key = @cs_tview-matnr
          AND werks   = @<fs_werks>.
        IF sy-subrc EQ 0.
          IF ls_tsrlist-lifnr IS NOT INITIAL AND
             ls_tsrlist-reswk IS NOT INITIAL.   "Forcément renseigné ici !
            SELECT SINGLE lifnr INTO @DATA(lv_lifnr)
             FROM t001w
             WHERE werks = @ls_tsrlist-reswk.
            IF ( lv_lifnr NE ls_tsrlist-lifnr ).
              CLEAR ls_msg.
              ls_msg-matnr      = cs_tview-matnr.
              ls_msg-id         = cs_tview-id.
              ls_msg-reqid      = cs_tview-reqid.
              ls_msg-viewname   = cs_tview-viewname.
              ls_msg-field      = cs_tview-fieldname.
              ls_msg-line       = cs_tview-line.
              ls_msg-type       = 'E'.
              ls_msg-idmsg      = gc_classmsg.
              ls_msg-num        = '018'.
              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message.
              APPEND ls_msg TO ct_msg.
*           Update the table view
              cs_tview-status = ls_msg-type.
              cs_tview-message = ls_msg-message.
              EXIT.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.


*
*
*
*        SORT lt_table BY  id
*                          reqid
*                          matnr
*                          line
*                          viewname
*                          fieldname.
**       Valeur de werks
*        ASSIGN COMPONENT gc_werks
*        OF STRUCTURE <fs_line> TO <fs_werks>.
*        CHECK <fs_werks> IS ASSIGNED.
*
**       On alimente une table temporaire sans la ligne en cours de traitement
*        CREATE DATA lt_dref TYPE TABLE OF (gc_tab_reserve).
*        ASSIGN lt_dref->* TO <ft_tview_tmp>.
*        <ft_tview_tmp>[] = it_table[].
*        DELETE <ft_tview_tmp> INDEX iv_tabix.
*
*
**       On récupère la cléde la table des views
*        lv_tabname = gc_tab_reserve.
*        CALL METHOD me->get_keyfield
*          EXPORTING
*            iv_tabname   = lv_tabname
*          IMPORTING
*            et_keyfields = lt_keyfields.
**        CALL FUNCTION 'CACS_GET_TABLE_FIELDS'
**          EXPORTING
**            i_tabname  = lv_tabname
**          TABLES
**            t_keyfield = lt_keyfields.
*
*        CLEAR : ls_keyfields, lv_first.
*        LOOP AT lt_keyfields INTO ls_keyfields.
*
*          CLEAR : ls_where, lv_string.
*          IF ls_keyfields-fieldname NE 'MANDT'
*            OR ls_keyfields-fieldname NE 'ROWNB'
*            OR ls_keyfields-fieldname NE 'LINE'.
*
*            CASE lv_first.
*              WHEN ''.
*                CONCATENATE '& =' '''&1''' INTO ls_where SEPARATED BY space.
*              WHEN 'X'.
*                CONCATENATE 'AND' '& =' '''&1''' INTO ls_where SEPARATED BY space.
*            ENDCASE.
*            REPLACE '&'  WITH ls_keyfields-fieldname INTO ls_where.
*            CASE is_tfields-tabfield.
*              WHEN 'LIFNR'.
*                REPLACE '&1' WITH gc_reswk INTO ls_where.
*              WHEN 'RESWK'.
*                REPLACE '&1' WITH gc_lifnr INTO ls_where.
*              WHEN OTHERS.
*                ASSIGN COMPONENT is_tfields-tabfield
*                OF STRUCTURE cs_tview TO <fs_fields>.
*                IF <fs_fields> IS ASSIGNED.
*                  REPLACE '&1' WITH <fs_fields> INTO ls_where.
*                ENDIF.
*            ENDCASE.
*            APPEND ls_where TO lt_where.
*
*            IF lv_first IS INITIAL.
*              lv_first = 'X'.
*            ENDIF.
*
*          ENDIF.
*
*        ENDLOOP.
*
****     Check 1 : Si LIFNR~RESWK est coché RESWK~LIFNR ne doit pas l'être
*        LOOP AT <ft_tview_tmp> ASSIGNING FIELD-SYMBOL(<fs_tfields>)
*          WHERE (lt_where).
**         On récupère ID
*          ASSIGN COMPONENT gc_id
*          OF STRUCTURE <fs_tfields> TO <fs_id>.
**         On récupère REQID
*          ASSIGN COMPONENT gc_reqid
*          OF STRUCTURE <fs_tfields> TO <fs_reqid>.
**         On récupère MATNR
*          ASSIGN COMPONENT gc_matnr
*          OF STRUCTURE <fs_tfields> TO <fs_matnr>.
**         On récupère MATNR
*          ASSIGN COMPONENT gc_rownb
*          OF STRUCTURE <fs_tfields> TO <fs_rownb>.
*
**         On récupère WERKS
*          UNASSIGN <fs_line>.
*          READ TABLE <ft_tview_tmp> ASSIGNING <fs_line>
*          WITH KEY ('ID')        = <fs_id>
*                   ('REQID')     = <fs_reqid>
*                   ('MATNR')     = <fs_matnr>
*                   ('LINE')      = <fs_rownb>
*                   ('VIEWNAME')  = is_tfields-viewname
*                   ('FIELDNAME') = gc_werks
*                   BINARY SEARCH.
*          IF sy-subrc EQ 0.
*            ASSIGN COMPONENT gc_werks
*            OF STRUCTURE <fs_line> TO <fs_werks>.
*            CHECK <fs_werks> EQ <fs_werks>.
**           1 seul saisie entre LIFNR et RESWK
*            CLEAR ls_msg.
*            ls_msg-matnr      = cs_tview-matnr.
*            ls_msg-id         = cs_tview-id.
*            ls_msg-reqid      = cs_tview-reqid.
*            ls_msg-viewname   = cs_tview-viewname.
*            ls_msg-field      = cs_tview-fieldname.
*            ls_msg-line       = cs_tview-line.
*            ls_msg-type       = 'E'.
*            ls_msg-idmsg      = gc_classmsg.
*            ls_msg-num        = '018'.
*            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*              INTO ls_msg-message.
*            APPEND ls_msg TO ct_msg.
**           Update the table view
*            cs_tview-status = ls_msg-type.
*            cs_tview-message = ls_msg-message.
*            EXIT.
*
*          ENDIF.
*
*        ENDLOOP.
*
*      ENDIF.
*
*    ENDIF.
*
  ENDMETHOD.


  METHOD check_fields.

    DATA : ls_msg    TYPE /dlwupex/tmsg,
           lv_method TYPE string.
    DATA : lv_subkey TYPE string.


    DATA ts_diff TYPE timestampl.
    DATA tsav TYPE timestampl.
    DATA tsap TYPE timestampl.
    Data : tsaps type string,
           tsavs type string.



*   INITIALIZATION
    CLEAR : ls_msg, lv_method.

    TRY.
        CONCATENATE gc_checkmeth is_tfields-tabname '_' cs_tview-fieldname
         INTO lv_method.

        GET TIME STAMP FIELD tsav.

        CALL METHOD me->(lv_method)
          EXPORTING
            it_table   = it_tview
            is_tfields = is_tfields
            iv_tabix   = iv_tabix
          CHANGING
            cs_tview   = cs_tview
            ct_msg     = ct_msg
            cv_rc      = cv_rc.

      GET TIME STAMP FIELD tsap.
      tsaps = tsap.
      tsavs = tsav.
      ts_diff = ( ( tsaps+8(2) * 3600 ) + ( tsaps+10(2) * 60 ) + tsaps+12(9) ) -
                ( ( tsavs+8(2) * 3600 ) + ( tsavs+10(2) * 60 ) + tsavs+12(9) ).
      if ts_diff < '0.01'."en seconde
        lv_subkey = cs_tview-id && | | && cs_tview-reqid && | | && cs_tview-viewname && | | && lv_method && | <0.01s|.
      elseif ts_diff < '0.02'."en seconde
        lv_subkey = cs_tview-id && | | && cs_tview-reqid && | | && cs_tview-viewname && | | && lv_method && | <0.02s|.
      elseif ts_diff < '0.02'."en seconde
        lv_subkey = cs_tview-id && | | && cs_tview-reqid && | | && cs_tview-viewname && | | && lv_method && | <0.03s|.
      elseif ts_diff < '0.04'."en seconde
        lv_subkey = cs_tview-id && | | && cs_tview-reqid && | | && cs_tview-viewname && | | && lv_method && | <0.04s|.
      else.
        lv_subkey = cs_tview-id && | | && cs_tview-reqid && | | && cs_tview-viewname && | | && lv_method && | | && ts_diff && |s|.
      endif.
      LOG-POINT ID /DLWUPEX/COCKPIT_ATICLE SUBKEY lv_subkey fields cs_tview tsav tsap.

      CATCH cx_sy_dyn_call_illegal_method.
        cv_no_method = abap_true.

    ENDTRY.

  ENDMETHOD.


  METHOD check_mara_attyp.

    DATA : ls_msg     TYPE /dlwupex/tmsg,
           lv_as4text TYPE as4text.

*   INITIALIZATION
*    REFRESH : .
    CLEAR : ls_msg, lv_as4text.
*    UNASSIGN : .

*On récupère en amont le libelle du champ technique en cas d'erreur
    CALL METHOD me->retrieving_fieldtext
      EXPORTING
        is_ddobjname = is_tfields-tabname
        is_tabfield  = is_tfields-tabfield
        is_fieldname = cs_tview-fieldname
      IMPORTING
        es_as4text   = lv_as4text.

*** CHECK 1 Controle que la clé article est de type catégorie 00, 10 ou 12
    IF  cs_tview-value NE '00'
      AND cs_tview-value NE '10'
      AND cs_tview-value NE '12'.
*     ATTYP différent de 00, 10 ou 12
      CLEAR ls_msg.
      ls_msg-matnr      = cs_tview-matnr.
      ls_msg-id         = cs_tview-id.
      ls_msg-reqid      = cs_tview-reqid.
      ls_msg-rownb      = cs_tview-rownb.
      ls_msg-viewname   = cs_tview-viewname.
      ls_msg-field      = cs_tview-fieldname.
      ls_msg-line       = cs_tview-line.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = gc_classmsg.
      ls_msg-num        = '053'.
      ls_msg-message_v1 = lv_as4text.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message
      WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
*     Update the table view
      cs_tview-status = ls_msg-type.
      cs_tview-message = ls_msg-message.
      cv_rc = 4.
      EXIT.
    ENDIF.

  ENDMETHOD.


  METHOD check_mara_matkl.

    DATA : lt_matkl     TYPE TABLE OF matkl,
           ls_matkl     TYPE matkl,
           ls_msg       TYPE /dlwupex/tmsg,
           lv_no_author TYPE xfeld.

*    INITIALIZATION
    REFRESH : lt_matkl.
    CLEAR : ls_matkl, ls_msg, lv_no_author.
*    UNASSIGN : .

    CALL METHOD me->check_table_control
      EXPORTING
        is_tfields = is_tfields
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview
        cv_rc      = cv_rc.
    IF cs_tview-status IS NOT INITIAL.
      EXIT.
    ENDIF.

*** Check 1 : On contrôle que la personne a le droit d'intéragir avec
*** le groupe article sélectionné.

* On alimente une table interne avec le groupe d'article
* pour contrôler les autorisations
    CLEAR ls_matkl.
    ls_matkl = cs_tview-value.
    APPEND ls_matkl TO lt_matkl.

*   On appelle la méthode qui contrôle les autorisations.
    CALL METHOD /dlwupex/cl_cockpit_article=>check_author
      EXPORTING
        it_matkl     = lt_matkl
        iv_uname     = sy-uname
      IMPORTING
        ev_no_author = lv_no_author
      CHANGING
        ct_msg       = ct_msg
        cv_rc        = cv_rc.
    IF lv_no_author EQ abap_true.
      CLEAR ls_msg.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = gc_classmsg.
      ls_msg-num        = '048'.
      ls_msg-message_v1 = cs_tview-value.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message
      WITH ls_msg-message_v1.
*     Update the table view
      cs_tview-status = ls_msg-type.
      cs_tview-message = ls_msg-message.
      cv_rc = 4.
    ENDIF.



  ENDMETHOD.


  METHOD check_mara_matnr.

    CONSTANTS : lc_fieldname  TYPE tabname    VALUE 'MTART',
                lc_nriv       TYPE tabname    VALUE 'NRIV',
                lc_externind  TYPE tabname    VALUE 'EXTERNIND',
                lc_fromnumber TYPE tabname    VALUE 'FROMNUMBER',
                lc_tonumber   TYPE tabname    VALUE 'TONUMBER',
                lc_nrlevel    TYPE tabname    VALUE 'NRLEVEL',
                lc_object     TYPE nrobj      VALUE 'MATERIALNR',
                lc_numki      TYPE tabfldname VALUE 'NUMKI',
                lc_numke      TYPE tabfldname VALUE 'NUMKE'.

    DATA : ls_ref_itab              TYPE REF TO data,
           ls_ref_itab_nriv         TYPE REF TO data,
           lt_where                 TYPE TABLE OF edpline,
           lt_dfies_tabcontrol      TYPE TABLE OF dfies,
           ls_dfies_tabcontrol_line TYPE dfies,
           ls_dfies_line            TYPE dfies,
           ls_where                 TYPE edpline,
           ls_reqid                 TYPE /dlwupex/treqids,
           ls_tview                 TYPE /dlwupex/tview,
           ls_msg                   TYPE /dlwupex/tmsg,
           lv_flag_error            TYPE xfeld,
           lv_tabcontrol            TYPE tabname,
           lv_material              TYPE mara-matnr,
           lv_mtart_input           TYPE t134-mtart,
           lv_concatenate           TYPE string,
           lv_lines                 TYPE i,
           lv_tabname               TYPE ddobjname,
           lv_as4text               TYPE as4text.

    FIELD-SYMBOLS : <fs_tab_grp>  TYPE table,
                    <fs_line_grp> TYPE any,
                    <fs_line>     TYPE any,
                    <fs_extern>   TYPE any,
                    <fs_fromnb>   TYPE any,
                    <fs_nrlevel>  TYPE any,
                    <fs_tonb>     TYPE any,
                    <fs_numki>    TYPE any,
                    <fs_numke>    TYPE any.

    CLEAR : ls_tview, lv_flag_error, lv_tabcontrol, lv_tabname, ls_where,
            ls_dfies_tabcontrol_line, lv_concatenate, lv_lines, lv_as4text, ls_reqid,
            lv_material, lv_mtart_input.
    UNASSIGN : <fs_line>, <fs_extern>, <fs_numki>, <fs_numke>, <fs_tab_grp>, <fs_line_grp>.
    REFRESH : lt_where, lt_dfies_tabcontrol.

*   On ne contrôle le MATNR que dans le cas de la vue général data
    IF is_tfields-viewname EQ '01'.


      IF gt_ctview_mara_matnr[] IS INITIAL.
        gt_ctview_mara_matnr = it_table.
        SORT gt_ctview_mara_matnr BY   id
                                      reqid
                                      matnr
                                      rownb
                                      viewname
                                      fieldname.
      ENDIF.


*      SELECT SINGLE * FROM /dlwupex/treqids
*          INTO ls_reqid
*        WHERE id    = cs_tview-id
*          AND reqid = cs_tview-reqid.
      ls_reqid = gs_reqids.
      IF gs_reqids IS INITIAL.
*       Erreur lors du select
        ls_msg-matnr      = cs_tview-matnr.
        ls_msg-id         = cs_tview-id.
        ls_msg-reqid      = cs_tview-reqid.
        ls_msg-rownb      = cs_tview-rownb.
        ls_msg-viewname   = cs_tview-viewname.
        ls_msg-field      = cs_tview-fieldname.
        ls_msg-line       = cs_tview-line.
        ls_msg-type       = 'E'.
        ls_msg-idmsg      = gc_classmsg.
        ls_msg-message    = 'Erreur lors de la lecture TREQID'.
        APPEND ls_msg TO ct_msg.

*       Update the table view
        cs_tview-status = ls_msg-type.
        cs_tview-message = ls_msg-message.
        cv_rc = 4.
        EXIT.
      ENDIF.
*   On controle dans REQID si le statut est inférieur à 3.
      CHECK ls_reqid-status < '03'.

*  On récupère en amont le libelle du champ technique en cas d'erreur
      CALL METHOD me->retrieving_fieldtext
        EXPORTING
          is_ddobjname = is_tfields-tabname
          is_tabfield  = is_tfields-tabfield
          is_fieldname = cs_tview-fieldname
        IMPORTING
          es_as4text   = lv_as4text.



***   Check 1 : On contrôle que si c'est un MATNR externe la zone MATNR
***             doit être renseigné.
      CLEAR ls_tview.
      READ TABLE gt_ctview_mara_matnr INTO ls_tview
        WITH KEY id        = cs_tview-id
                 reqid     = cs_tview-reqid
                 matnr     = cs_tview-matnr
                 rownb     = cs_tview-rownb
                 viewname  = cs_tview-viewname
                 fieldname = lc_fieldname
                 BINARY SEARCH.
      IF sy-subrc EQ 0.
*       On récupère la table de contrôle
        lv_tabname = is_tfields-tabname.
        CALL METHOD me->retrieving_control_table
          EXPORTING
            iv_tabname    = lv_tabname
            iv_fieldname  = lc_fieldname
          CHANGING
            cs_dfies_line = ls_dfies_line
            cv_tabcontrol = lv_tabcontrol
            cv_flag_error = lv_flag_error.
        IF lv_flag_error IS INITIAL.
*         Check on the table control
          IF lv_tabcontrol IS NOT INITIAL.
            CALL METHOD me->get_fieldinfo_field
              EXPORTING
                iv_tabname   = lv_tabcontrol
              IMPORTING
                et_dfies_tab = lt_dfies_tabcontrol.
*
*            CALL FUNCTION 'DDIF_FIELDINFO_GET'
*              EXPORTING
*                tabname        = lv_tabcontrol
*              TABLES
*                dfies_tab      = lt_dfies_tabcontrol
*              EXCEPTIONS
*                not_found      = 1
*                internal_error = 2
*                OTHERS         = 3.
            IF sy-subrc EQ 0.

              SORT lt_dfies_tabcontrol BY tabname domname.
              CLEAR ls_dfies_tabcontrol_line.
              READ TABLE lt_dfies_tabcontrol INTO ls_dfies_tabcontrol_line
              WITH KEY tabname = lv_tabcontrol
                       domname = ls_dfies_line-domname
                       BINARY SEARCH.
              IF sy-subrc EQ 0.
*               Construction du select dynamique
                REFRESH lt_where.
                CLEAR : ls_where, lv_concatenate.
                IF  cs_tview-fieldname IS NOT INITIAL.
                  CONDENSE ls_dfies_tabcontrol_line-fieldname.
                  CONCATENATE ls_dfies_tabcontrol_line-fieldname '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
                  REPLACE '&' WITH ls_tview-value INTO lv_concatenate.
                  ls_where = lv_concatenate.
*                 On assigne le field symbol en fonction de la table en paramètre
                  CREATE DATA ls_ref_itab TYPE (lv_tabcontrol).
                  ASSIGN ls_ref_itab->* TO <fs_line>.
                ENDIF.
                APPEND ls_where TO lt_where.

                IF <fs_line> IS ASSIGNED.
                  CLEAR <fs_line>.
                  SELECT SINGLE *
                    FROM (lv_tabcontrol)
                    INTO <fs_line>
                    WHERE (lt_where).
                  IF sy-subrc EQ 0
                    AND <fs_line> IS ASSIGNED.
*                   On récupère les tranches de numéros
                    ASSIGN COMPONENT lc_numki
                    OF STRUCTURE <fs_line> TO <fs_numki>.
                    ASSIGN COMPONENT lc_numke
                    OF STRUCTURE <fs_line> TO <fs_numke>.
                    IF <fs_numki> IS ASSIGNED
                      AND <fs_numke> IS ASSIGNED.
*                     On va lire le ou les groupes pour contrôler si
*                     le MTART est ext

*                     Construction du select dynamique
                      REFRESH lt_where.
                      CLEAR : ls_where, lv_concatenate.
                      CONCATENATE 'OBJECT' '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
                      REPLACE '&' WITH lc_object INTO lv_concatenate.
                      ls_where = lv_concatenate.
                      APPEND ls_where TO lt_where.
                      CLEAR : ls_where, lv_concatenate.
                      CONCATENATE 'AND' '( NRRANGENR' '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
                      ls_where = lv_concatenate.
                      REPLACE '&' WITH <fs_numki> INTO ls_where.
                      APPEND ls_where TO lt_where.
                      CLEAR : ls_where, lv_concatenate.
                      CONCATENATE 'OR' 'NRRANGENR' '= ''&'' ) ' INTO lv_concatenate SEPARATED BY space.
                      ls_where = lv_concatenate.
                      REPLACE '&' WITH <fs_numke> INTO ls_where.
                      APPEND ls_where TO lt_where.

*                     On assigne le field symbol avec la nouvelle table
                      CREATE DATA ls_ref_itab_nriv TYPE TABLE OF (lc_nriv).
                      ASSIGN ls_ref_itab_nriv->* TO <fs_tab_grp>.

                      REFRESH <fs_tab_grp>.
                      SELECT *
                        FROM (lc_nriv)
                        INTO TABLE <fs_tab_grp>
                        WHERE (lt_where).
                      IF sy-subrc EQ 0.
                        SORT <fs_tab_grp> BY (lc_externind).
                        CLEAR lv_lines.
*                        DESCRIBE TABLE <fs_tab_grp> LINES lv_lines.
                        READ TABLE <fs_tab_grp> ASSIGNING <fs_line_grp>
                        WITH KEY (lc_externind) = gc_xfeld
                        BINARY SEARCH.
                        IF sy-subrc EQ 0
                          AND cs_tview-value IS INITIAL.
*                         MTART externe, MATNR doit être renseigné
                          ls_msg-matnr      = cs_tview-matnr.
                          ls_msg-id         = cs_tview-id.
                          ls_msg-reqid      = cs_tview-reqid.
                          ls_msg-rownb      = cs_tview-rownb.
                          ls_msg-viewname   = cs_tview-viewname.
                          ls_msg-field      = cs_tview-fieldname.
                          ls_msg-line       = cs_tview-line.
                          ls_msg-type       = 'E'.
                          ls_msg-idmsg      = gc_classmsg.
                          ls_msg-num        = '034'.
                          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                            INTO ls_msg-message.
                          APPEND ls_msg TO ct_msg.

*                         Update the table view
                          cs_tview-status = ls_msg-type.
                          cs_tview-message = ls_msg-message.
                          cv_rc = 4.
                          EXIT.
                        ELSEIF sy-subrc NE 0
                          AND cs_tview-value IS NOT INITIAL.

                          CALL METHOD me->retrieving_fieldtext
                            EXPORTING
                              is_ddobjname = is_tfields-tabname
                              is_tabfield  = lc_fieldname
                              is_fieldname = lc_fieldname
                            IMPORTING
                              es_as4text   = lv_as4text.

*                         MTART interne, MATNR ne doit pas être renseigné
                          CLEAR ls_msg.
                          ls_msg-matnr      = cs_tview-matnr.
                          ls_msg-id         = cs_tview-id.
                          ls_msg-reqid      = cs_tview-reqid.
                          ls_msg-rownb      = cs_tview-rownb.
                          ls_msg-viewname   = cs_tview-viewname.
                          ls_msg-field      = cs_tview-fieldname.
                          ls_msg-line       = cs_tview-line.
                          ls_msg-type       = 'E'.
                          ls_msg-idmsg      = gc_classmsg.
                          ls_msg-num        = '054'.
                          ls_msg-message_v1 = lv_as4text.
                          ls_msg-message_v2 = ls_tview-value.
                          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                            INTO ls_msg-message
                          WITH ls_msg-message_v1 ls_msg-message_v2.
                          APPEND ls_msg TO ct_msg.
*                         Update the table view
                          cs_tview-status = ls_msg-type.
                          cs_tview-message = ls_msg-message.
                          cv_rc = 4.
                          EXIT.

                        ELSEIF sy-subrc EQ 0.

***                     Check 2 : On regarde si l'article est bien compris dans la tranche
                          lv_material = cs_tview-value.
                          lv_mtart_input = ls_tview-value.
                          CALL FUNCTION 'READ_MATERIALTYPE'
                            EXPORTING
                              material                    = lv_material "ARTICLE
                              mtart_input                 = lv_mtart_input "TYPE
                              neuflag                     = 'X'
                              wmara_kzkfg                 = ''
                              aktyp                       = 'N'
                              flg_retail                  = 'X'
                            EXCEPTIONS
                              ext_number_not_allowed      = 1
                              ext_number_not_in_range     = 2
                              ext_number_wo_check_error   = 3
                              internal_number_not_allowed = 4
                              materialtype_missing        = 5
                              ext_matnr_missing           = 6
                              mtart_not_found             = 7
                              number_check_error          = 8
                              no_authority                = 9
                              mpn_not_allowed             = 10
                              OTHERS                      = 11.
                          IF sy-subrc NE 0.
                            CASE sy-subrc.
                              WHEN 2.
*                               ERREUR Pas dans la tranche
*                               On récupère le début de la tranche
                                ASSIGN COMPONENT lc_fromnumber
                                OF STRUCTURE <fs_line_grp> TO <fs_fromnb>.
*                               On récupère la fin de la tranche
                                ASSIGN COMPONENT lc_tonumber
                                OF STRUCTURE <fs_line_grp> TO <fs_tonb>.

                                CLEAR ls_msg.
                                ls_msg-matnr      = cs_tview-matnr.
                                ls_msg-id         = cs_tview-id.
                                ls_msg-reqid      = cs_tview-reqid.
                                ls_msg-rownb      = cs_tview-rownb.
                                ls_msg-viewname   = cs_tview-viewname.
                                ls_msg-field      = cs_tview-fieldname.
                                ls_msg-line       = cs_tview-line.
                                ls_msg-type       = 'E'.
                                ls_msg-idmsg      = gc_classmsg.
                                ls_msg-num        = '055'.
                                ls_msg-message_v1 = cs_tview-value.
                                ls_msg-message_v2 = <fs_fromnb>.
                                ls_msg-message_v3 = <fs_tonb>.
                                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                                  INTO ls_msg-message
                                WITH ls_msg-message_v1 ls_msg-message_v2 ls_msg-message_v3.
                                APPEND ls_msg TO ct_msg.
*                               Update the table view
                                cs_tview-status = ls_msg-type.
                                cs_tview-message = ls_msg-message.
                                cv_rc = 4.
                                EXIT.
                              WHEN OTHERS.
                            ENDCASE.

                          ELSE.
***                Check Init : L'article ne doit pas exister en table.
*                            CALL METHOD me->check_table_control
*                              EXPORTING
*                                is_tfields = is_tfields
**                               iv_flag_empty = lv_flag_empty
*                              CHANGING
*                                ct_msg     = ct_msg
*                                cs_tview   = cs_tview
*                                cv_rc      = cv_rc.
                            SELECT COUNT(*) UP TO 1 ROWS
                               FROM mara
                               WHERE matnr = cs_tview-value.
                            IF sy-subrc EQ 0.
*                           L'article est déjà présent en table
                              ls_msg-matnr      = cs_tview-matnr.
                              ls_msg-id         = cs_tview-id.
                              ls_msg-reqid      = cs_tview-reqid.
                              ls_msg-rownb      = cs_tview-rownb.
                              ls_msg-viewname   = cs_tview-viewname.
                              ls_msg-field      = cs_tview-fieldname.
                              ls_msg-line       = cs_tview-line.
                              ls_msg-type       = 'E'.
                              ls_msg-idmsg      = gc_classmsg.
                              ls_msg-num        = '057'.
                              ls_msg-message_v1 = cs_tview-value.
                              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                                INTO ls_msg-message WITH ls_msg-message_v1.
                              APPEND ls_msg TO ct_msg.

*                           Update the table view
                              cs_tview-status = ls_msg-type.
                              cs_tview-message = ls_msg-message.
                              cv_rc = 4.
                              EXIT.
                            ENDIF.

                          ENDIF.
                        ENDIF.

                      ELSE. " tranche de numéro n'existe pas pour le type article
                        ls_msg-matnr      = cs_tview-matnr.
                        ls_msg-id         = cs_tview-id.
                        ls_msg-reqid      = cs_tview-reqid.
                        ls_msg-rownb      = cs_tview-rownb.
                        ls_msg-viewname   = cs_tview-viewname.
                        ls_msg-field      = cs_tview-fieldname.
                        ls_msg-line       = cs_tview-line.
                        ls_msg-type       = 'E'.
                        ls_msg-idmsg      = gc_classmsg.
                        ls_msg-num        = '081'.
                        ls_msg-message_v1 = ls_tview-value.
                        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                          INTO ls_msg-message WITH ls_msg-message_v1.
                        APPEND ls_msg TO ct_msg.
*                           Update the table view
                        cs_tview-status = ls_msg-type.
                        cs_tview-message = ls_msg-message.
                        cv_rc = 4.
                        EXIT.
                      ENDIF.

                    ENDIF.

                  ENDIF.

                ENDIF.

              ENDIF.

            ENDIF.

          ENDIF.

        ELSE.

          CLEAR ls_msg.
*         Message d'erreur : Impossible de trouver la table de contrôle
*         avec le nom de table et le nom du champ
          ls_msg-viewname   = cs_tview-viewname.
          ls_msg-field      = cs_tview-fieldname.
          ls_msg-line       = cs_tview-line.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-num        = '009'.
          ls_msg-message_v1 = is_tfields-tabname.
          ls_msg-message_v2 = lv_as4text.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message
          WITH ls_msg-message_v1 ls_msg-message_v2.
          APPEND ls_msg TO ct_msg.
          cv_rc = 8.

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD check_marc_matnr.

*
*    CONSTANTS : lc_fieldname  TYPE tabname    VALUE 'MTART',
*                lc_nriv       TYPE tabname    VALUE 'NRIV',
*                lc_externind  TYPE tabname    VALUE 'EXTERNIND',
*                lc_fromnumber TYPE tabname    VALUE 'FROMNUMBER',
*                lc_tonumber   TYPE tabname    VALUE 'TONUMBER',
*                lc_nrlevel    TYPE tabname    VALUE 'NRLEVEL',
*                lc_object     TYPE nrobj      VALUE 'MATERIALNR',
*                lc_numki      TYPE tabfldname VALUE 'NUMKI',
*                lc_numke      TYPE tabfldname VALUE 'NUMKE'.
*
*    DATA : ls_ref_itab              TYPE REF TO data,
*           ls_ref_itab_nriv         TYPE REF TO data,
*           lt_where                 TYPE TABLE OF edpline,
*           lt_dfies_tabcontrol      TYPE TABLE OF dfies,
*           ls_dfies_tabcontrol_line TYPE dfies,
*           ls_dfies_line            TYPE dfies,
*           ls_where                 TYPE edpline,
*           ls_reqid                 TYPE /dlwupex/treqids,
*           ls_tview                 TYPE /dlwupex/tview,
*           ls_msg                   TYPE /dlwupex/tmsg,
*           lv_flag_error            TYPE xfeld,
*           lv_tabcontrol            TYPE tabname,
*           lv_material              TYPE mara-matnr,
*           lv_mtart_input           TYPE t134-mtart,
*           lv_concatenate           TYPE string,
*           lv_lines                 TYPE i,
*           lv_tabname               TYPE ddobjname,
*           lv_as4text               TYPE as4text.
*
*    FIELD-SYMBOLS : <fs_tab_grp>  TYPE table,
*                    <fs_line_grp> TYPE any,
*                    <fs_line>     TYPE any,
*                    <fs_extern>   TYPE any,
*                    <fs_fromnb>   TYPE any,
*                    <fs_nrlevel>  TYPE any,
*                    <fs_tonb>     TYPE any,
*                    <fs_numki>    TYPE any,
*                    <fs_numke>    TYPE any.
*
*    CLEAR : ls_tview, lv_flag_error, lv_tabcontrol, lv_tabname, ls_where,
*            ls_dfies_tabcontrol_line, lv_concatenate, lv_lines, lv_as4text, ls_reqid,
*            lv_material, lv_mtart_input.
*    UNASSIGN : <fs_line>, <fs_extern>, <fs_numki>, <fs_numke>, <fs_tab_grp>, <fs_line_grp>.
*    REFRESH : lt_where, lt_dfies_tabcontrol.
*
*
*    SELECT SINGLE * FROM /dlwupex/treqids
*        INTO ls_reqid
*      WHERE id    = cs_tview-id
*        AND reqid = cs_tview-reqid.
*    IF sy-subrc NE 0.
**     Erreur lors du select
*      ls_msg-matnr      = cs_tview-matnr.
*      ls_msg-id         = cs_tview-id.
*      ls_msg-reqid      = cs_tview-reqid.
*      ls_msg-rownb      = cs_tview-rownb.
*      ls_msg-viewname   = cs_tview-viewname.
*      ls_msg-field      = cs_tview-fieldname.
*      ls_msg-type       = 'E'.
*      ls_msg-idmsg      = gc_classmsg.
*      ls_msg-message    = 'Erreur lors de la lecture TREQID'.
*      APPEND ls_msg TO ct_msg.
*
**     Update the table view
*      cs_tview-status = ls_msg-type.
*      cs_tview-message = ls_msg-message.
*      cv_rc = 4.
*      EXIT.
*    ENDIF.
** On controle dans REQID si le statut est inférieur à 3.
*    CHECK ls_reqid-status < '03'.
*
**On récupère en amont le libelle du champ technique en cas d'erreur
*    CALL METHOD me->retrieving_fieldtext
*      EXPORTING
*        is_ddobjname = is_tfields-tabname
*        is_tabfield  = is_tfields-tabfield
*        is_fieldname = cs_tview-fieldname
*      IMPORTING
*        es_as4text   = lv_as4text.
*
**   On ne contrôle le MATNR que dans le cas de la vue général data
*    IF is_tfields-viewname EQ '09'
*      AND is_tfields-viewname EQ '10'.
*
****   Check 1 : On contrôle que si c'est un MATNR externe la zone MATNR
****             doit être renseigné.
*      CLEAR ls_tview.
*      READ TABLE it_table INTO ls_tview
*        WITH KEY id        = cs_tview-id
*                 reqid     = cs_tview-reqid
*                 matnr     = cs_tview-matnr
*                 rownb     = cs_tview-rownb
*                 viewname  = cs_tview-viewname
*                 fieldname = lc_fieldname.
*      IF sy-subrc EQ 0.
**       On récupère la table de contrôle
*        lv_tabname = is_tfields-tabname.
*        CALL METHOD me->retrieving_control_table
*          EXPORTING
*            iv_tabname    = lv_tabname
*            iv_fieldname  = lc_fieldname
*          CHANGING
*            cs_dfies_line = ls_dfies_line
**           cs_dd01v_wa   = ls_dd01v_wa
*            cv_tabcontrol = lv_tabcontrol
*            cv_flag_error = lv_flag_error.
*        IF lv_flag_error IS INITIAL.
**         Check on the table control
*          IF lv_tabcontrol IS NOT INITIAL.
*            CALL FUNCTION 'DDIF_FIELDINFO_GET'
*              EXPORTING
*                tabname        = lv_tabcontrol
*              TABLES
*                dfies_tab      = lt_dfies_tabcontrol
*              EXCEPTIONS
*                not_found      = 1
*                internal_error = 2
*                OTHERS         = 3.
*            IF sy-subrc EQ 0.
*              CLEAR ls_dfies_tabcontrol_line.
*              READ TABLE lt_dfies_tabcontrol INTO ls_dfies_tabcontrol_line
*              WITH KEY tabname = lv_tabcontrol
*                       domname = ls_dfies_line-domname.
*              IF sy-subrc EQ 0.
**               Construction du select dynamique
*                REFRESH lt_where.
*                CLEAR : ls_where, lv_concatenate.
*                IF  cs_tview-fieldname IS NOT INITIAL.
*                  CONDENSE ls_dfies_tabcontrol_line-fieldname.
*                  CONCATENATE ls_dfies_tabcontrol_line-fieldname '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
*                  REPLACE '&' WITH ls_tview-value INTO lv_concatenate.
*                  ls_where = lv_concatenate.
**                 On assigne le field symbol en fonction de la table en paramètre
*                  CREATE DATA ls_ref_itab TYPE (lv_tabcontrol).
*                  ASSIGN ls_ref_itab->* TO <fs_line>.
*                ENDIF.
*                APPEND ls_where TO lt_where.
*
*                IF <fs_line> IS ASSIGNED.
*                  CLEAR <fs_line>.
*                  SELECT SINGLE *
*                    FROM (lv_tabcontrol)
*                    INTO <fs_line>
*                    WHERE (lt_where).
*                  IF sy-subrc EQ 0
*                    AND <fs_line> IS ASSIGNED.
**                   On récupère les tranches de numéros
*                    ASSIGN COMPONENT lc_numki
*                    OF STRUCTURE <fs_line> TO <fs_numki>.
*                    ASSIGN COMPONENT lc_numke
*                    OF STRUCTURE <fs_line> TO <fs_numke>.
*                    IF <fs_numki> IS ASSIGNED
*                      AND <fs_numke> IS ASSIGNED.
**                     On va lire le ou les groupes pour contrôler si
**                     le MTART est ext
*
**                     Construction du select dynamique
*                      REFRESH lt_where.
*                      CLEAR : ls_where, lv_concatenate.
*                      CONCATENATE 'OBJECT' '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
*                      REPLACE '&' WITH lc_object INTO lv_concatenate.
*                      ls_where = lv_concatenate.
*                      APPEND ls_where TO lt_where.
*                      CLEAR : ls_where, lv_concatenate.
*                      CONCATENATE 'AND' '( NRRANGENR' '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
*                      ls_where = lv_concatenate.
*                      REPLACE '&' WITH <fs_numki> INTO ls_where.
*                      APPEND ls_where TO lt_where.
*                      CLEAR : ls_where, lv_concatenate.
*                      CONCATENATE 'OR' 'NRRANGENR' '= ''&'' ) ' INTO lv_concatenate SEPARATED BY space.
*                      ls_where = lv_concatenate.
*                      REPLACE '&' WITH <fs_numke> INTO ls_where.
*                      APPEND ls_where TO lt_where.
*
**                     On assigne le field symbol avec la nouvelle table
*                      CREATE DATA ls_ref_itab_nriv TYPE TABLE OF (lc_nriv).
*                      ASSIGN ls_ref_itab_nriv->* TO <fs_tab_grp>.
*
*                      REFRESH <fs_tab_grp>.
*                      SELECT *
*                        FROM (lc_nriv)
*                        INTO TABLE <fs_tab_grp>
*                        WHERE (lt_where).
*                      IF sy-subrc EQ 0.
*
*                        CLEAR lv_lines.
**                        DESCRIBE TABLE <fs_tab_grp> LINES lv_lines.
*                        READ TABLE <fs_tab_grp> ASSIGNING <fs_line_grp>
*                        WITH KEY (lc_externind) = gc_xfeld.
*                        IF sy-subrc EQ 0
*                          AND cs_tview-value IS INITIAL.
**                         MTART externe, MATNR doit être renseigné
*                          ls_msg-matnr      = cs_tview-matnr.
*                          ls_msg-id         = cs_tview-id.
*                          ls_msg-reqid      = cs_tview-reqid.
*                          ls_msg-rownb      = cs_tview-rownb.
*                          ls_msg-viewname   = cs_tview-viewname.
*                          ls_msg-field      = cs_tview-fieldname.
*                          ls_msg-type       = 'E'.
*                          ls_msg-idmsg      = gc_classmsg.
*                          ls_msg-num        = '034'.
*                          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                            INTO ls_msg-message.
*                          APPEND ls_msg TO ct_msg.
*
**                         Update the table view
*                          cs_tview-status = ls_msg-type.
*                          cs_tview-message = ls_msg-message.
*                          cv_rc = 4.
*                          EXIT.
*                        ELSEIF sy-subrc NE 0
*                          AND cs_tview-value IS NOT INITIAL.
*
*                          CALL METHOD me->retrieving_fieldtext
*                            EXPORTING
*                              is_ddobjname = is_tfields-tabname
*                              is_tabfield  = lc_fieldname
*                              is_fieldname = lc_fieldname
*                            IMPORTING
*                              es_as4text   = lv_as4text.
*
**                         MTART interne, MATNR ne doit pas être renseigné
*                          CLEAR ls_msg.
*                          ls_msg-matnr      = cs_tview-matnr.
*                          ls_msg-id         = cs_tview-id.
*                          ls_msg-reqid      = cs_tview-reqid.
*                          ls_msg-rownb      = cs_tview-rownb.
*                          ls_msg-viewname   = cs_tview-viewname.
*                          ls_msg-field      = cs_tview-fieldname.
*                          ls_msg-type       = 'E'.
*                          ls_msg-idmsg      = gc_classmsg.
*                          ls_msg-num        = '054'.
*                          ls_msg-message_v1 = lv_as4text.
*                          ls_msg-message_v2 = ls_tview-value.
*                          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                            INTO ls_msg-message
*                          WITH ls_msg-message_v1 ls_msg-message_v2.
*                          APPEND ls_msg TO ct_msg.
**                         Update the table view
*                          cs_tview-status = ls_msg-type.
*                          cs_tview-message = ls_msg-message.
*                          cv_rc = 4.
*                          EXIT.
*
*                        ELSEIF sy-subrc EQ 0.
*
****                     Check 2 : On regarde si l'article est bien compris dans la tranche
*                          lv_material = cs_tview-value.
*                          lv_mtart_input = ls_tview-value.
*                          CALL FUNCTION 'READ_MATERIALTYPE'
*                            EXPORTING
*                              material                    = lv_material "ARTICLE
*                              mtart_input                 = lv_mtart_input "TYPE
*                              neuflag                     = 'X'
*                              wmara_kzkfg                 = ''
*                              aktyp                       = 'N'
*                              flg_retail                  = 'X'
*                            EXCEPTIONS
*                              ext_number_not_allowed      = 1
*                              ext_number_not_in_range     = 2
*                              ext_number_wo_check_error   = 3
*                              internal_number_not_allowed = 4
*                              materialtype_missing        = 5
*                              ext_matnr_missing           = 6
*                              mtart_not_found             = 7
*                              number_check_error          = 8
*                              no_authority                = 9
*                              mpn_not_allowed             = 10
*                              OTHERS                      = 11.
*                          IF sy-subrc NE 0.
*                            CASE sy-subrc.
*                              WHEN 2.
**                               ERREUR Pas dans la tranche
**                               On récupère le début de la tranche
*                                ASSIGN COMPONENT lc_fromnumber
*                                OF STRUCTURE <fs_line_grp> TO <fs_fromnb>.
**                               On récupère la fin de la tranche
*                                ASSIGN COMPONENT lc_tonumber
*                                OF STRUCTURE <fs_line_grp> TO <fs_tonb>.
*
*                                CLEAR ls_msg.
*                                ls_msg-matnr      = cs_tview-matnr.
*                                ls_msg-id         = cs_tview-id.
*                                ls_msg-reqid      = cs_tview-reqid.
*                                ls_msg-rownb      = cs_tview-rownb.
*                                ls_msg-viewname   = cs_tview-viewname.
*                                ls_msg-field      = cs_tview-fieldname.
*                                ls_msg-type       = 'E'.
*                                ls_msg-idmsg      = gc_classmsg.
*                                ls_msg-num        = '055'.
*                                ls_msg-message_v1 = cs_tview-value.
*                                ls_msg-message_v2 = <fs_fromnb>.
*                                ls_msg-message_v3 = <fs_tonb>.
*                                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                                  INTO ls_msg-message
*                                WITH ls_msg-message_v1 ls_msg-message_v2 ls_msg-message_v3.
*                                APPEND ls_msg TO ct_msg.
**                               Update the table view
*                                cs_tview-status = ls_msg-type.
*                                cs_tview-message = ls_msg-message.
*                                cv_rc = 4.
*                                EXIT.
*                              WHEN OTHERS.
*                            ENDCASE.
*
*                          ENDIF.
*                        ELSEIF sy-subrc NE 0.
****                Check Init : L'article ne doit pas exister en table.
*                          CALL METHOD me->check_table_control
*                            EXPORTING
*                              is_tfields = is_tfields
**                             iv_flag_empty = lv_flag_empty
*                            CHANGING
*                              ct_msg     = ct_msg
*                              cs_tview   = cs_tview
*                              cv_rc      = cv_rc.
*                          IF cs_tview-status IS INITIAL
*                            AND cs_tview-value IS NOT INITIAL.
**                           L'article est déjà présent en table
*                            ls_msg-matnr      = cs_tview-matnr.
*                            ls_msg-id         = cs_tview-id.
*                            ls_msg-reqid      = cs_tview-reqid.
*                            ls_msg-rownb      = cs_tview-rownb.
*                            ls_msg-viewname   = cs_tview-viewname.
*                            ls_msg-field      = cs_tview-fieldname.
*                            ls_msg-type       = 'E'.
*                            ls_msg-idmsg      = gc_classmsg.
*                            ls_msg-num        = '057'.
*                            ls_msg-message_v1 = cs_tview-value.
*                            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                              INTO ls_msg-message WITH ls_msg-message_v1.
*                            APPEND ls_msg TO ct_msg.
*
**                           Update the table view
*                            cs_tview-status = ls_msg-type.
*                            cs_tview-message = ls_msg-message.
*                            cv_rc = 4.
*                            EXIT.
*                          ENDIF.
*
*                        ENDIF.
*
*                      ENDIF.
*
*                    ENDIF.
*
*                  ENDIF.
*
*                ENDIF.
*
*              ENDIF.
*
*            ENDIF.
*
*          ENDIF.
*
*        ELSE.
*
*          CLEAR ls_msg.
**         Message d'erreur : Impossible de trouver la table de contrôle
**         avec le nom de table et le nom du champ
*          ls_msg-viewname   = cs_tview-viewname.
*          ls_msg-field      = cs_tview-fieldname.
*          ls_msg-type       = 'E'.
*          ls_msg-idmsg      = gc_classmsg.
*          ls_msg-num        = '009'.
*          ls_msg-message_v1 = is_tfields-tabname.
*          ls_msg-message_v2 = lv_as4text.
*          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*            INTO ls_msg-message
*          WITH ls_msg-message_v1 ls_msg-message_v2.
*          APPEND ls_msg TO ct_msg.
*          cv_rc = 8.
*
*        ENDIF.
*
*      ENDIF.
*
*    ENDIF.

  ENDMETHOD.


  METHOD check_marc_werks.

    DATA : ls_t001w TYPE t001w,
*           lt_table TYPE /dlwupex/tview_tt,
           ls_msg   TYPE /dlwupex/tmsg.
*           lv_rownb_tmp TYPE /dlwupex/elineid.

    FIELD-SYMBOLS : <fs_tview_tmp> TYPE any,
                    <fs_art_key>   TYPE any.


    check cs_tview-viewname = '09' or
          cs_tview-viewname = '10'.


* INITIALIZATION
*REFRESH : .
    CLEAR : ls_t001w, ls_msg.", lv_rownb_tmp.
    UNASSIGN : <fs_tview_tmp>, <fs_art_key>.

*T001W vlfkZ
*A store
*B DC

    CALL METHOD me->check_table_control
      EXPORTING
        is_tfields = is_tfields
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview
        cv_rc      = cv_rc.
    IF cs_tview-status IS NOT INITIAL.
      EXIT.
    ENDIF.

    if gt_ctview_marc_werks[] is INITIAL.
      gt_ctview_marc_werks = it_table.
      SORT gt_ctview_marc_werks BY  id
                                    reqid
                                    matnr
                                    rownb
                                    viewname
                                    fieldname.
    endif.

*lv_rownb_tmp
    IF  cs_tview-value IS NOT INITIAL.
*     On récupère le numéro d'article temporaire
*      lv_rownb_tmp = cs_tview-line - 1 .
      READ TABLE gt_ctview_marc_werks ASSIGNING <fs_tview_tmp>
       WITH KEY ('ID')        = cs_tview-id
                ('REQID')     = cs_tview-reqid
                ('MATNR')     = cs_tview-matnr
                ('ROWNB')     = cs_tview-rownb
                ('VIEWNAME')  = is_tfields-viewname
                ('FIELDNAME') = gc_artkey
                BINARY SEARCH.
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT gc_value
        OF STRUCTURE <fs_tview_tmp> TO <fs_art_key>.
        IF <fs_art_key> IS ASSIGNED.

          if gt_t001w[] is INITIAL.
            select * into TABLE gt_t001w
              from t001w.
            if sy-subrc eq 0.
              sort gt_t001w by werks vlfkz.
            endif.
          endif.

*         Cette méthode doit controler le champ division que les vues logDS et logsto
          CASE cs_tview-viewname.
            WHEN 09. "LOGDC

*              CLEAR ls_t001w.
*              SELECT SINGLE *
*                FROM t001w
*                INTO ls_t001w
*                WHERE werks = cs_tview-value
*                AND   vlfkz = 'B'.
*              SELECT COUNT(*) UP TO 1 ROWS
*                FROM t001w
*                WHERE werks = cs_tview-value
*                AND   vlfkz = 'B'.
              read TABLE gt_t001w TRANSPORTING NO FIELDS with key werks = cs_tview-value
                                                                  vlfkz = 'B'
                                                                  BINARY SEARCH.
              IF sy-subrc NE 0.
*               EAN déjà existant en table
                CLEAR ls_msg.
                ls_msg-matnr      = cs_tview-matnr.
                ls_msg-id         = cs_tview-id.
                ls_msg-reqid      = cs_tview-reqid.
                ls_msg-rownb      = cs_tview-rownb.
                ls_msg-viewname   = cs_tview-viewname.
                ls_msg-field      = cs_tview-fieldname.
                ls_msg-line       = cs_tview-line.
                ls_msg-type       = 'E'.
                ls_msg-idmsg      = gc_classmsg.
                ls_msg-num        = '047'.
                ls_msg-message_v1 = cs_tview-value.
                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                  INTO ls_msg-message
                WITH ls_msg-message_v1.
                APPEND ls_msg TO ct_msg.
                cv_rc = 4.
*               Update the table view
                cs_tview-status = ls_msg-type.
                cs_tview-message = ls_msg-message.
                cv_rc = 4.
                EXIT.

              ENDIF.

            WHEN 10. "LOGSTO
*              CLEAR ls_t001w.
*              SELECT SINGLE *
*                FROM t001w
*                INTO ls_t001w
*                WHERE werks = cs_tview-value
*                AND   vlfkz = 'A'.
*              SELECT COUNT(*) UP TO 1 ROWS
*                FROM t001w
*                WHERE werks = cs_tview-value
*                AND   vlfkz = 'A'.
              read TABLE gt_t001w TRANSPORTING NO FIELDS with key werks = cs_tview-value
                                                                  vlfkz = 'A'
                                                                  BINARY SEARCH.
              IF sy-subrc NE 0.
*               EAN déjà existant en table
                CLEAR ls_msg.
                ls_msg-matnr      = cs_tview-matnr.
                ls_msg-id         = cs_tview-id.
                ls_msg-reqid      = cs_tview-reqid.
                ls_msg-rownb      = cs_tview-rownb.
                ls_msg-viewname   = cs_tview-viewname.
                ls_msg-field      = cs_tview-fieldname.
                ls_msg-line       = cs_tview-line.
                ls_msg-type       = 'E'.
                ls_msg-idmsg      = gc_classmsg.
                ls_msg-num        = '047'.
                ls_msg-message_v1 = cs_tview-value.
                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                  INTO ls_msg-message
                WITH ls_msg-message_v1.
                APPEND ls_msg TO ct_msg.
                cv_rc = 4.
*               Update the table view
                cs_tview-status = ls_msg-type.
                cs_tview-message = ls_msg-message.
                cv_rc = 4.
                EXIT.

              ENDIF.

            WHEN OTHERS.

          ENDCASE.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD check_mean_ean11.

    CONSTANTS : lc_flg_prfz TYPE c       VALUE 'X',
                lc_intext   TYPE nrind   VALUE 'B'.

    DATA : lt_dref_check  TYPE REF TO data,
           lt_tab_eantp   TYPE TABLE OF typeinterv,
           lt_where       TYPE TABLE OF edpline,
           ls_where       TYPE edpline,
           ls_eantp       TYPE typeinterv,
           ls_msg         TYPE /dlwupex/tmsg,
           lv_tabcontrol  TYPE tabname,
           lv_ean         TYPE mean-ean11,
           lv_concatenate TYPE string,
           lv_eantyp      TYPE numtp.
*           lv_rownb_tmp   TYPE /dlwupex/elineid,
*           lv_as4text     TYPE as4text.

    FIELD-SYMBOLS : <ft_tview_tmp>  TYPE table,
                    <fs_tview_tmp>  TYPE any,
                    <fs_field_ctrl> TYPE any,
                    <ft_tab_exist>  TYPE ANY TABLE.

*   INITIALIZATION
    REFRESH : lt_tab_eantp, lt_where.
    CLEAR : ls_where, ls_eantp, ls_msg, lv_tabcontrol, lv_ean, lv_concatenate, lv_eantyp.", lv_as4text.
*            lv_rownb_tmp.
    UNASSIGN : <ft_tview_tmp>, <fs_tview_tmp>, <fs_field_ctrl>, <ft_tab_exist>.
* On récupère le numéro d'article temporaire
*    lv_rownb_tmp = cs_tview-line - 1 .

    CHECK cs_tview-fieldname = 'EAN11'.
    CHECK cs_tview-value <> ''.

    IF gv_mean IS INITIAL.
*     Lecture de la réserve de travail TUNIT une fois
      SELECT
        * INTO TABLE gt_tunit_mean_ean11
        FROM /dlwupex/tunit
        WHERE id    = cs_tview-id
        AND   reqid = cs_tview-reqid.
      IF sy-subrc EQ 0.
        SORT gt_tunit_mean_ean11 BY id reqid art_key ean11.

*       Lecture MEAN une fois pour déterminer si un EAN de la réserve de travail existe déjà
        SELECT
          * INTO TABLE gt_mean
          FROM mean
          FOR ALL ENTRIES IN gt_tunit_mean_ean11
          WHERE ean11 = gt_tunit_mean_ean11-ean11
          AND   eantp = gt_tunit_mean_ean11-eantp.
        IF sy-subrc EQ 0.
          SORT gt_mean BY ean11 eantp.
        ENDIF.

      ENDIF.


      gv_mean = 'X'.
    ENDIF.



**On récupère en amont le libelle du champ technique en cas d'erreur
*    CALL METHOD me->retrieving_fieldtext
*      EXPORTING
*        is_ddobjname = is_tfields-tabname
*        is_tabfield  = is_tfields-tabfield
*        is_fieldname = cs_tview-fieldname
*      IMPORTING
*        es_as4text   = lv_as4text.


*** Check 1 : Check si l'EAN existe en DB pour un article existant
*       EAN déjà existant en table
    READ TABLE gt_mean INTO DATA(ls_mean)
     WITH KEY ean11 = cs_tview-value BINARY SEARCH.
    IF sy-subrc EQ 0.
      SELECT vkorg INTO TABLE @DATA(lt_vkorg)
        FROM mvke
        WHERE matnr = @ls_mean-matnr.
      IF sy-subrc IS INITIAL.
        SORT lt_vkorg BY vkorg.
        DELETE ADJACENT DUPLICATES FROM lt_vkorg COMPARING vkorg.
      ENDIF.
      CLEAR ls_msg.
      ls_msg-matnr      = cs_tview-matnr.
      ls_msg-id         = cs_tview-id.
      ls_msg-reqid      = cs_tview-reqid.
      ls_msg-rownb      = cs_tview-rownb.
      ls_msg-viewname   = cs_tview-viewname.
      ls_msg-field      = cs_tview-fieldname.
      ls_msg-line       = cs_tview-line.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = gc_classmsg.
      ls_msg-num        = '014'.
      ls_msg-message_v1 = cs_tview-value.
      ls_msg-message_v2 = ls_mean-matnr.
      SHIFT ls_msg-message_v2 LEFT DELETING LEADING '0'.
      LOOP AT lt_vkorg ASSIGNING FIELD-SYMBOL(<fs_vkorg>).
        IF sy-tabix = 1.
          ls_msg-message_v3 = <fs_vkorg>-vkorg.
        ELSE.
          ls_msg-message_v3 = ls_msg-message_v3 && ',' && <fs_vkorg>-vkorg.
        ENDIF.
      ENDLOOP.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message
      WITH ls_msg-message_v1 ls_msg-message_v2 ls_msg-message_v3.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
*       Update the table view
      cs_tview-status = ls_msg-type.
      cs_tview-message = ls_msg-message.
      cv_rc = 4.
      EXIT.
    ENDIF.



*** Check 2 : On contrôle que l'EAN11 n'est pas déjà dans la réserve de travail
    LOOP AT gt_tunit_mean_ean11 TRANSPORTING NO FIELDS WHERE id      = cs_tview-id
                                                        AND  reqid   = cs_tview-reqid
                                                        AND  art_key NE cs_tview-matnr
                                                        AND  ean11   = cs_tview-value.
      EXIT.
    ENDLOOP.
    IF sy-subrc EQ 0.
*     EAN déjà existant dans la reserve de travail
      CLEAR ls_msg.
      ls_msg-matnr      = cs_tview-matnr.
      ls_msg-id         = cs_tview-id.
      ls_msg-reqid      = cs_tview-reqid.
      ls_msg-rownb      = cs_tview-rownb.
      ls_msg-viewname   = cs_tview-viewname.
      ls_msg-field      = cs_tview-fieldname.
      ls_msg-line       = cs_tview-line.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = gc_classmsg.
      ls_msg-num        = '011'.
      ls_msg-message_v1 = cs_tview-value.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message
      WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
*     Update the table view
      cs_tview-status = ls_msg-type.
      cs_tview-message = ls_msg-message.
      cv_rc = 4.
      EXIT.
    ENDIF.

    EXIT.


  ENDMETHOD.


  METHOD check_mean_eantp.

    DATA : lt_type_ean     TYPE TABLE OF typeinterv,
           ls_type_ean     TYPE typeinterv,
           ls_msg          TYPE /dlwupex/tmsg,
           lv_max          TYPE num20,
           lv_min          TYPE num20,
           lv_value        TYPE num20,
           lv_ean11        TYPE ean11,
           lv_ean_one_case TYPE xfeld,
*           lv_rownb_tmp    TYPE /dlwupex/elineid,
           lv_as4text      TYPE as4text.

    FIELD-SYMBOLS : <fs_ean11> TYPE any,
                    <fs_line>  TYPE any.

*   INITIALIZATION
    REFRESH : lt_type_ean.
    CLEAR : ls_type_ean, ls_msg, lv_max, lv_min, lv_value, lv_as4text, "lv_rownb_tmp,
            lv_ean_one_case.
    UNASSIGN : <fs_ean11>, <fs_line>.

    CALL METHOD me->check_table_control
      EXPORTING
        is_tfields = is_tfields
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview
        cv_rc      = cv_rc.
    IF cs_tview-status IS NOT INITIAL.
      EXIT.
    ENDIF.

* On récupère le numéro d'article temporaire
*    lv_rownb_tmp = cs_tview-line - 1 .

*On récupère en amont le libelle du champ technique en cas d'erreur
    CALL METHOD me->retrieving_fieldtext
      EXPORTING
        is_ddobjname = is_tfields-tabname
        is_tabfield  = is_tfields-tabfield
        is_fieldname = cs_tview-fieldname
      IMPORTING
        es_as4text   = lv_as4text.

    IF cs_tview-value IS NOT INITIAL.
*      AND cs_tview-value NE 'IE'.
      CALL METHOD me->get_ean_type
        EXPORTING
          iv_intext   = 'B'
        IMPORTING
          et_ean_type = lt_type_ean.
*
*      CALL FUNCTION 'EAN_GET_TYPE_AND_RANGE'
*        EXPORTING
*          i_intext         = 'B'
*        TABLES
*          e_tab_type_range = lt_type_ean.
      IF sy-subrc EQ 0.
*       On va chercher le EAN11
        READ TABLE it_table ASSIGNING <fs_line>
        WITH KEY id        = cs_tview-id
                 reqid     = cs_tview-reqid
                 matnr     = cs_tview-matnr
                 rownb     = cs_tview-rownb
                 line      = cs_tview-line
                 viewname  = is_tfields-viewname
                 fieldname = gc_ean11
                 BINARY SEARCH.
        IF sy-subrc EQ 0.
          ASSIGN COMPONENT gc_value
          OF STRUCTURE <fs_line> TO <fs_ean11>.

          SORT lt_type_ean BY eantyp extern.

          IF <fs_ean11> IS INITIAL.
            READ TABLE lt_type_ean TRANSPORTING NO FIELDS
             WITH KEY eantyp = cs_tview-value
                      extern = ''
                      BINARY SEARCH.
            IF sy-subrc IS NOT INITIAL.
              CLEAR ls_msg.
              ls_msg-matnr      = cs_tview-matnr.
              ls_msg-id         = cs_tview-id.
              ls_msg-reqid      = cs_tview-reqid.
              ls_msg-rownb      = cs_tview-rownb.
              ls_msg-viewname   = cs_tview-viewname.
              ls_msg-field      = cs_tview-fieldname.
              ls_msg-line       = cs_tview-line.
              ls_msg-type       = 'E'.
              ls_msg-idmsg      = gc_classmsg.
              ls_msg-num        = '061'.
              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message.
              APPEND ls_msg TO ct_msg.
*             Update the table view
              cs_tview-status = ls_msg-type.
              cs_tview-message = ls_msg-message.
              cv_rc = 4.
              EXIT.
            ENDIF.
          ELSE.
            READ TABLE lt_type_ean TRANSPORTING NO FIELDS
             WITH KEY eantyp = cs_tview-value
                      extern = 'X'
                      BINARY SEARCH.
            IF sy-subrc IS NOT INITIAL.
              CLEAR ls_msg.
              ls_msg-matnr      = cs_tview-matnr.
              ls_msg-id         = cs_tview-id.
              ls_msg-reqid      = cs_tview-reqid.
              ls_msg-rownb      = cs_tview-rownb.
              ls_msg-viewname   = cs_tview-viewname.
              ls_msg-field      = cs_tview-fieldname.
              ls_msg-line       = cs_tview-line.
              ls_msg-type       = 'E'.
              ls_msg-idmsg      = gc_classmsg.
              ls_msg-num        = '062'.
              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message.
              APPEND ls_msg TO ct_msg.
*             Update the table view
              cs_tview-status = ls_msg-type.
              cs_tview-message = ls_msg-message.
              cv_rc = 4.
              EXIT.
            ENDIF.
          ENDIF.

          CHECK <fs_ean11> IS NOT INITIAL.
          lv_ean11 = <fs_ean11>.
          REFRESH lt_type_ean.
          CALL FUNCTION 'EAN_TYPE'
            EXPORTING
              i_ean       = lv_ean11
              i_flg_prfz  = 'X'
              i_intext    = 'B'
            TABLES
              e_tab_eantp = lt_type_ean.

          SORT lt_type_ean BY eantyp extern.
          READ TABLE lt_type_ean
          INTO ls_type_ean
          WITH KEY eantyp = cs_tview-value
                      extern = 'X'
                      BINARY SEARCH.

          IF sy-subrc IS NOT INITIAL.
            CLEAR ls_msg.
            ls_msg-matnr      = cs_tview-matnr.
            ls_msg-id         = cs_tview-id.
            ls_msg-reqid      = cs_tview-reqid.
            ls_msg-rownb      = cs_tview-rownb.
            ls_msg-viewname   = cs_tview-viewname.
            ls_msg-field      = cs_tview-fieldname.
            ls_msg-line       = cs_tview-line.
            ls_msg-type       = 'E'.
            ls_msg-idmsg      = gc_classmsg.
            ls_msg-num        = '063'.
            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
              INTO ls_msg-message.
            APPEND ls_msg TO ct_msg.
*             Update the table view
            cs_tview-status = ls_msg-type.
            cs_tview-message = ls_msg-message.
            cv_rc = 4.
            EXIT.
          ENDIF.

*          CLEAR : ls_type_ean, lv_ean_one_case.
*          LOOP AT lt_type_ean INTO ls_type_ean
*          WHERE eantyp = cs_tview-value.
*
*            lv_max = ls_type_ean-nrto.
*            lv_min = ls_type_ean-nrfrom.
*            lv_value = <fs_ean11>.
*
*            IF lv_min > lv_value
*              OR lv_value > lv_max.
**             EAN11 saisie pas dans la fourchette du type d'EAN
*              CLEAR ls_msg.
*              ls_msg-matnr      = cs_tview-matnr.
*              ls_msg-id         = cs_tview-id.
*              ls_msg-reqid      = cs_tview-reqid.
*              ls_msg-rownb      = cs_tview-rownb.
*              ls_msg-viewname   = cs_tview-viewname.
*              ls_msg-field      = cs_tview-fieldname.
*              ls_msg-line       = cs_tview-line.
*              ls_msg-type       = 'E'.
*              ls_msg-idmsg      = gc_classmsg.
*              ls_msg-num        = '039'.
*              ls_msg-message_v1 = cs_tview-value.
*              ls_msg-message_v2 = ls_type_ean-nrfrom.
*              ls_msg-message_v3 = ls_type_ean-nrto.
*              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                INTO ls_msg-message
*              WITH ls_msg-message_v1 ls_msg-message_v2 ls_msg-message_v3.
*              APPEND ls_msg TO ct_msg.
**             Update the table view
*              cs_tview-status = ls_msg-type.
*              cs_tview-message = ls_msg-message.
*              cv_rc = 4.
*
*            ELSE.
*              lv_ean_one_case = abap_true.
*              EXIT.
*
*            ENDIF.
*
*          ENDLOOP.
*          IF lv_ean_one_case IS INITIAL.
*            LOOP AT ct_msg ASSIGNING FIELD-SYMBOL(<fs_msg>)
*              WHERE num = '039'.
*              <fs_msg>-type = 'E'.
*            ENDLOOP.
*          ELSE.
*            DELETE ct_msg WHERE num = '039'.
*          ENDIF.

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD check_mean_hpean.

    CONSTANTS : lc_xfeld TYPE xfeld     VALUE 'X'.

    DATA : lt_dref    TYPE REF TO data,
           lt_where   TYPE TABLE OF edpline,
           ls_where   TYPE edpline,
           ls_msg     TYPE /dlwupex/tmsg,
           lv_string  TYPE string,
           lv_meinh   TYPE meinh,
*           lv_rownb_tmp TYPE /dlwupex/elineid,
           lv_as4text TYPE as4text.

    FIELD-SYMBOLS : <ft_tview_tmp> TYPE table,
                    <fs_field>     TYPE any,
                    <fs_id>        TYPE any,
                    <fs_reqid>     TYPE any,
                    <fs_matnr>     TYPE any,
                    <fs_line>      TYPE any,
                    <fs_rownb>     TYPE any,
                    <fs_meinh>     TYPE any,
                    <fs_line_tmp>  TYPE any.

*   INITIALIZATION
    REFRESH : lt_where.
    CLEAR : ls_where, ls_msg, lv_string, lv_meinh, lv_as4text.", lv_rownb_tmp.
    UNASSIGN : <ft_tview_tmp>, <fs_field>, <fs_id>, <fs_reqid>,
               <fs_matnr>, <fs_rownb>, <fs_meinh>, <fs_line>, <fs_line_tmp>.

    CALL METHOD me->check_table_control
      EXPORTING
        is_tfields = is_tfields
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview
        cv_rc      = cv_rc.
    IF cs_tview-status IS NOT INITIAL.
      EXIT.
    ENDIF.

*On récupère en amont le libelle du champ technique en cas d'erreur
    CALL METHOD me->retrieving_fieldtext
      EXPORTING
        is_ddobjname = is_tfields-tabname
        is_tabfield  = is_tfields-tabfield
        is_fieldname = cs_tview-fieldname
      IMPORTING
        es_as4text   = lv_as4text.

    IF cs_tview-value IS NOT INITIAL.
*     on va chercher le MEINH
      READ TABLE it_table ASSIGNING <fs_line>
      WITH KEY id       = cs_tview-id
              reqid     = cs_tview-reqid
              matnr     = cs_tview-matnr
              rownb     = cs_tview-rownb
              line      = cs_tview-line
              viewname  = is_tfields-viewname
              fieldname = gc_meinh
              BINARY SEARCH.
      IF sy-subrc EQ 0.
        ASSIGN COMPONENT gc_value
        OF STRUCTURE <fs_line> TO <fs_field>.
        lv_meinh = <fs_field>.

*       On boucle sur la table pour contrôler qu'il n'y a pas d'autres HPEAN
*       de coche pour le couple MATNR/MEINH
        CREATE DATA lt_dref TYPE TABLE OF (gc_tab_reserve).
        ASSIGN lt_dref->* TO <ft_tview_tmp>.
        <ft_tview_tmp>[] = it_table[].
        DELETE <ft_tview_tmp> INDEX iv_tabix.

        CLEAR ls_where.
        REFRESH lt_where.
*       On construit un WHERE
        CONCATENATE '& =' '''&1''' INTO lv_string SEPARATED BY space.
        ls_where = lv_string.
        REPLACE '&'  WITH 'FIELDNAME' INTO ls_where.
        REPLACE '&1' WITH is_tfields-tabfield INTO ls_where.
        APPEND ls_where TO lt_where.
        CLEAR : lv_string, ls_where.
        CONCATENATE 'AND' '& =' '''&1''' INTO lv_string SEPARATED BY space.
        ls_where = lv_string.
        REPLACE '&'  WITH 'VALUE' INTO ls_where.
        REPLACE '&1' WITH lc_xfeld INTO ls_where.
        APPEND ls_where TO lt_where.
        SORT <ft_tview_tmp> BY
                   ('ID')
                   ('REQID')
                   ('MATNR')
                   ('ROWNB')
                   ('LINE')
                   ('VIEWNAME')
                   ('FIELDNAME').
*       On boucle sur la reserve pour contrôler qu'il n'y a pas d'autre
*       entrée avec la coche HPEAN à X pour le même couple MATNR/MEINH
        LOOP AT <ft_tview_tmp> ASSIGNING FIELD-SYMBOL(<fs_tfields>)
          WHERE (lt_where).
*         On récupère ID
          ASSIGN COMPONENT gc_id
          OF STRUCTURE <fs_tfields> TO <fs_id>.
*         On récupère REQID
          ASSIGN COMPONENT gc_reqid
          OF STRUCTURE <fs_tfields> TO <fs_reqid>.
*         On récupère MATNR
          ASSIGN COMPONENT gc_matnr
          OF STRUCTURE <fs_tfields> TO <fs_matnr>.
*         On récupère ROWNB
          ASSIGN COMPONENT gc_rownb
          OF STRUCTURE <fs_tfields> TO <fs_rownb>.
*         On récupère LINE
          ASSIGN COMPONENT gc_line
          OF STRUCTURE <fs_tfields> TO <fs_line>.

*         On récupère MEINH
          READ TABLE <ft_tview_tmp> ASSIGNING <fs_line_tmp>
          WITH KEY ('ID')        = <fs_id>
                   ('REQID')     = <fs_reqid>
                   ('MATNR')     = <fs_matnr>
                   ('ROWNB')     = <fs_rownb>
                   ('LINE')      = <fs_line>
                   ('VIEWNAME')  = is_tfields-viewname
                   ('FIELDNAME') = gc_meinh
                   BINARY SEARCH.
          IF sy-subrc EQ 0.
            ASSIGN COMPONENT gc_value
            OF STRUCTURE <fs_line_tmp> TO <fs_meinh>.
            IF <fs_matnr> EQ cs_tview-matnr
            AND    <fs_meinh> EQ lv_meinh.
*             Il existe déjà un EAN principal
              CLEAR ls_msg.
              ls_msg-matnr      = cs_tview-matnr.
              ls_msg-id         = cs_tview-id.
              ls_msg-reqid      = cs_tview-reqid.
              ls_msg-viewname   = cs_tview-viewname.
              ls_msg-field      = cs_tview-fieldname.
              ls_msg-line       = cs_tview-line.
              ls_msg-type       = 'E'.
              ls_msg-idmsg      = gc_classmsg.
              ls_msg-num        = '015'.
              ls_msg-message_v1 = cs_tview-matnr.
              ls_msg-message_v2 = lv_meinh.
              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message
              WITH ls_msg-message_v1 ls_msg-message_v2.
              APPEND ls_msg TO ct_msg.
*             Update the table view
              cs_tview-status = ls_msg-type.
              cs_tview-message = ls_msg-message.
              EXIT.

            ENDIF.

          ENDIF.

        ENDLOOP.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD check_mvke_matnr.
*
*    CONSTANTS : lc_fieldname  TYPE tabname    VALUE 'MTART',
*                lc_nriv       TYPE tabname    VALUE 'NRIV',
*                lc_externind  TYPE tabname    VALUE 'EXTERNIND',
*                lc_fromnumber TYPE tabname    VALUE 'FROMNUMBER',
*                lc_tonumber   TYPE tabname    VALUE 'TONUMBER',
*                lc_nrlevel    TYPE tabname    VALUE 'NRLEVEL',
*                lc_object     TYPE nrobj      VALUE 'MATERIALNR',
*                lc_numki      TYPE tabfldname VALUE 'NUMKI',
*                lc_numke      TYPE tabfldname VALUE 'NUMKE'.
*
*    DATA : ls_ref_itab              TYPE REF TO data,
*           ls_ref_itab_nriv         TYPE REF TO data,
*           lt_where                 TYPE TABLE OF edpline,
*           lt_dfies_tabcontrol      TYPE TABLE OF dfies,
*           ls_dfies_tabcontrol_line TYPE dfies,
*           ls_dfies_line            TYPE dfies,
*           ls_where                 TYPE edpline,
*           ls_reqid                 TYPE /dlwupex/treqids,
*           ls_tview                 TYPE /dlwupex/tview,
*           ls_msg                   TYPE /dlwupex/tmsg,
*           lv_flag_error            TYPE xfeld,
*           lv_tabcontrol            TYPE tabname,
*           lv_material              TYPE mara-matnr,
*           lv_mtart_input           TYPE t134-mtart,
*           lv_concatenate           TYPE string,
*           lv_lines                 TYPE i,
*           lv_tabname               TYPE ddobjname,
*           lv_as4text               TYPE as4text.
*
*    FIELD-SYMBOLS : <fs_tab_grp>  TYPE table,
*                    <fs_line_grp> TYPE any,
*                    <fs_line>     TYPE any,
*                    <fs_extern>   TYPE any,
*                    <fs_fromnb>   TYPE any,
*                    <fs_nrlevel>  TYPE any,
*                    <fs_tonb>     TYPE any,
*                    <fs_numki>    TYPE any,
*                    <fs_numke>    TYPE any.
*
*    CLEAR : ls_tview, lv_flag_error, lv_tabcontrol, lv_tabname, ls_where,
*            ls_dfies_tabcontrol_line, lv_concatenate, lv_lines, lv_as4text, ls_reqid,
*            lv_material, lv_mtart_input.
*    UNASSIGN : <fs_line>, <fs_extern>, <fs_numki>, <fs_numke>, <fs_tab_grp>, <fs_line_grp>.
*    REFRESH : lt_where, lt_dfies_tabcontrol.
*
*
*    SELECT SINGLE * FROM /dlwupex/treqids
*        INTO ls_reqid
*      WHERE id    = cs_tview-id
*        AND reqid = cs_tview-reqid.
*    IF sy-subrc NE 0.
**     Erreur lors du select
*      ls_msg-matnr      = cs_tview-matnr.
*      ls_msg-id         = cs_tview-id.
*      ls_msg-reqid      = cs_tview-reqid.
*      ls_msg-rownb      = cs_tview-rownb.
*      ls_msg-viewname   = cs_tview-viewname.
*      ls_msg-field      = cs_tview-fieldname.
*      ls_msg-type       = 'E'.
*      ls_msg-idmsg      = gc_classmsg.
*      ls_msg-message    = 'Erreur lors de la lecture TREQID'.
*      APPEND ls_msg TO ct_msg.
*
**     Update the table view
*      cs_tview-status = ls_msg-type.
*      cs_tview-message = ls_msg-message.
*      cv_rc = 4.
*      EXIT.
*    ENDIF.
** On controle dans REQID si le statut est inférieur à 3.
*    CHECK ls_reqid-status < '03'.
*
**On récupère en amont le libelle du champ technique en cas d'erreur
*    CALL METHOD me->retrieving_fieldtext
*      EXPORTING
*        is_ddobjname = is_tfields-tabname
*        is_tabfield  = is_tfields-tabfield
*        is_fieldname = cs_tview-fieldname
*      IMPORTING
*        es_as4text   = lv_as4text.
*
**   On ne contrôle le MATNR que dans le cas de la vue général data
*    IF is_tfields-viewname EQ '08'.
*
****   Check 1 : On contrôle que si c'est un MATNR externe la zone MATNR
****             doit être renseigné.
*      CLEAR ls_tview.
*      READ TABLE it_table INTO ls_tview
*        WITH KEY id        = cs_tview-id
*                 reqid     = cs_tview-reqid
*                 matnr     = cs_tview-matnr
*                 rownb     = cs_tview-rownb
*                 viewname  = cs_tview-viewname
*                 fieldname = lc_fieldname.
*      IF sy-subrc EQ 0.
**       On récupère la table de contrôle
*        lv_tabname = is_tfields-tabname.
*        CALL METHOD me->retrieving_control_table
*          EXPORTING
*            iv_tabname    = lv_tabname
*            iv_fieldname  = lc_fieldname
*          CHANGING
*            cs_dfies_line = ls_dfies_line
**           cs_dd01v_wa   = ls_dd01v_wa
*            cv_tabcontrol = lv_tabcontrol
*            cv_flag_error = lv_flag_error.
*        IF lv_flag_error IS INITIAL.
**         Check on the table control
*          IF lv_tabcontrol IS NOT INITIAL.
*            CALL FUNCTION 'DDIF_FIELDINFO_GET'
*              EXPORTING
*                tabname        = lv_tabcontrol
*              TABLES
*                dfies_tab      = lt_dfies_tabcontrol
*              EXCEPTIONS
*                not_found      = 1
*                internal_error = 2
*                OTHERS         = 3.
*            IF sy-subrc EQ 0.
*              CLEAR ls_dfies_tabcontrol_line.
*              READ TABLE lt_dfies_tabcontrol INTO ls_dfies_tabcontrol_line
*              WITH KEY tabname = lv_tabcontrol
*                       domname = ls_dfies_line-domname.
*              IF sy-subrc EQ 0.
**               Construction du select dynamique
*                REFRESH lt_where.
*                CLEAR : ls_where, lv_concatenate.
*                IF  cs_tview-fieldname IS NOT INITIAL.
*                  CONDENSE ls_dfies_tabcontrol_line-fieldname.
*                  CONCATENATE ls_dfies_tabcontrol_line-fieldname '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
*                  REPLACE '&' WITH ls_tview-value INTO lv_concatenate.
*                  ls_where = lv_concatenate.
**                 On assigne le field symbol en fonction de la table en paramètre
*                  CREATE DATA ls_ref_itab TYPE (lv_tabcontrol).
*                  ASSIGN ls_ref_itab->* TO <fs_line>.
*                ENDIF.
*                APPEND ls_where TO lt_where.
*
*                IF <fs_line> IS ASSIGNED.
*                  CLEAR <fs_line>.
*                  SELECT SINGLE *
*                    FROM (lv_tabcontrol)
*                    INTO <fs_line>
*                    WHERE (lt_where).
*                  IF sy-subrc EQ 0
*                    AND <fs_line> IS ASSIGNED.
**                   On récupère les tranches de numéros
*                    ASSIGN COMPONENT lc_numki
*                    OF STRUCTURE <fs_line> TO <fs_numki>.
*                    ASSIGN COMPONENT lc_numke
*                    OF STRUCTURE <fs_line> TO <fs_numke>.
*                    IF <fs_numki> IS ASSIGNED
*                      AND <fs_numke> IS ASSIGNED.
**                     On va lire le ou les groupes pour contrôler si
**                     le MTART est ext
*
**                     Construction du select dynamique
*                      REFRESH lt_where.
*                      CLEAR : ls_where, lv_concatenate.
*                      CONCATENATE 'OBJECT' '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
*                      REPLACE '&' WITH lc_object INTO lv_concatenate.
*                      ls_where = lv_concatenate.
*                      APPEND ls_where TO lt_where.
*                      CLEAR : ls_where, lv_concatenate.
*                      CONCATENATE 'AND' '( NRRANGENR' '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
*                      ls_where = lv_concatenate.
*                      REPLACE '&' WITH <fs_numki> INTO ls_where.
*                      APPEND ls_where TO lt_where.
*                      CLEAR : ls_where, lv_concatenate.
*                      CONCATENATE 'OR' 'NRRANGENR' '= ''&'' ) ' INTO lv_concatenate SEPARATED BY space.
*                      ls_where = lv_concatenate.
*                      REPLACE '&' WITH <fs_numke> INTO ls_where.
*                      APPEND ls_where TO lt_where.
*
**                     On assigne le field symbol avec la nouvelle table
*                      CREATE DATA ls_ref_itab_nriv TYPE TABLE OF (lc_nriv).
*                      ASSIGN ls_ref_itab_nriv->* TO <fs_tab_grp>.
*
*                      REFRESH <fs_tab_grp>.
*                      SELECT *
*                        FROM (lc_nriv)
*                        INTO TABLE <fs_tab_grp>
*                        WHERE (lt_where).
*                      IF sy-subrc EQ 0.
*
*                        CLEAR lv_lines.
**                        DESCRIBE TABLE <fs_tab_grp> LINES lv_lines.
*                        READ TABLE <fs_tab_grp> ASSIGNING <fs_line_grp>
*                        WITH KEY (lc_externind) = gc_xfeld.
*                        IF sy-subrc EQ 0
*                          AND cs_tview-value IS INITIAL.
**                         MTART externe, MATNR doit être renseigné
*                          ls_msg-matnr      = cs_tview-matnr.
*                          ls_msg-id         = cs_tview-id.
*                          ls_msg-reqid      = cs_tview-reqid.
*                          ls_msg-rownb      = cs_tview-rownb.
*                          ls_msg-viewname   = cs_tview-viewname.
*                          ls_msg-field      = cs_tview-fieldname.
*                          ls_msg-type       = 'E'.
*                          ls_msg-idmsg      = gc_classmsg.
*                          ls_msg-num        = '034'.
*                          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                            INTO ls_msg-message.
*                          APPEND ls_msg TO ct_msg.
*
**                         Update the table view
*                          cs_tview-status = ls_msg-type.
*                          cs_tview-message = ls_msg-message.
*                          cv_rc = 4.
*                          EXIT.
*                        ELSEIF sy-subrc NE 0
*                          AND cs_tview-value IS NOT INITIAL.
*
*                          CALL METHOD me->retrieving_fieldtext
*                            EXPORTING
*                              is_ddobjname = is_tfields-tabname
*                              is_tabfield  = lc_fieldname
*                              is_fieldname = lc_fieldname
*                            IMPORTING
*                              es_as4text   = lv_as4text.
*
**                         MTART interne, MATNR ne doit pas être renseigné
*                          CLEAR ls_msg.
*                          ls_msg-matnr      = cs_tview-matnr.
*                          ls_msg-id         = cs_tview-id.
*                          ls_msg-reqid      = cs_tview-reqid.
*                          ls_msg-rownb      = cs_tview-rownb.
*                          ls_msg-viewname   = cs_tview-viewname.
*                          ls_msg-field      = cs_tview-fieldname.
*                          ls_msg-type       = 'E'.
*                          ls_msg-idmsg      = gc_classmsg.
*                          ls_msg-num        = '054'.
*                          ls_msg-message_v1 = lv_as4text.
*                          ls_msg-message_v2 = ls_tview-value.
*                          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                            INTO ls_msg-message
*                          WITH ls_msg-message_v1 ls_msg-message_v2.
*                          APPEND ls_msg TO ct_msg.
**                         Update the table view
*                          cs_tview-status = ls_msg-type.
*                          cs_tview-message = ls_msg-message.
*                          cv_rc = 4.
*                          EXIT.
*
*                        ELSEIF sy-subrc EQ 0.
*
****                     Check 2 : On regarde si l'article est bien compris dans la tranche
*                          lv_material = cs_tview-value.
*                          lv_mtart_input = ls_tview-value.
*                          CALL FUNCTION 'READ_MATERIALTYPE'
*                            EXPORTING
*                              material                    = lv_material "ARTICLE
*                              mtart_input                 = lv_mtart_input "TYPE
*                              neuflag                     = 'X'
*                              wmara_kzkfg                 = ''
*                              aktyp                       = 'N'
*                              flg_retail                  = 'X'
*                            EXCEPTIONS
*                              ext_number_not_allowed      = 1
*                              ext_number_not_in_range     = 2
*                              ext_number_wo_check_error   = 3
*                              internal_number_not_allowed = 4
*                              materialtype_missing        = 5
*                              ext_matnr_missing           = 6
*                              mtart_not_found             = 7
*                              number_check_error          = 8
*                              no_authority                = 9
*                              mpn_not_allowed             = 10
*                              OTHERS                      = 11.
*                          IF sy-subrc NE 0.
*                            CASE sy-subrc.
*                              WHEN 2.
**                               ERREUR Pas dans la tranche
**                               On récupère le début de la tranche
*                                ASSIGN COMPONENT lc_fromnumber
*                                OF STRUCTURE <fs_line_grp> TO <fs_fromnb>.
**                               On récupère la fin de la tranche
*                                ASSIGN COMPONENT lc_tonumber
*                                OF STRUCTURE <fs_line_grp> TO <fs_tonb>.
*
*                                CLEAR ls_msg.
*                                ls_msg-matnr      = cs_tview-matnr.
*                                ls_msg-id         = cs_tview-id.
*                                ls_msg-reqid      = cs_tview-reqid.
*                                ls_msg-rownb      = cs_tview-rownb.
*                                ls_msg-viewname   = cs_tview-viewname.
*                                ls_msg-field      = cs_tview-fieldname.
*                                ls_msg-type       = 'E'.
*                                ls_msg-idmsg      = gc_classmsg.
*                                ls_msg-num        = '055'.
*                                ls_msg-message_v1 = cs_tview-value.
*                                ls_msg-message_v2 = <fs_fromnb>.
*                                ls_msg-message_v3 = <fs_tonb>.
*                                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                                  INTO ls_msg-message
*                                WITH ls_msg-message_v1 ls_msg-message_v2 ls_msg-message_v3.
*                                APPEND ls_msg TO ct_msg.
**                               Update the table view
*                                cs_tview-status = ls_msg-type.
*                                cs_tview-message = ls_msg-message.
*                                cv_rc = 4.
*                                EXIT.
*                              WHEN OTHERS.
*                            ENDCASE.
*
*                          ENDIF.
*                        ELSEIF sy-subrc NE 0.
****                Check Init : L'article ne doit pas exister en table.
*                          CALL METHOD me->check_table_control
*                            EXPORTING
*                              is_tfields = is_tfields
**                             iv_flag_empty = lv_flag_empty
*                            CHANGING
*                              ct_msg     = ct_msg
*                              cs_tview   = cs_tview
*                              cv_rc      = cv_rc.
*                          IF cs_tview-status IS INITIAL
*                            AND cs_tview-value IS NOT INITIAL.
**                           L'article est déjà présent en table
*                            ls_msg-matnr      = cs_tview-matnr.
*                            ls_msg-id         = cs_tview-id.
*                            ls_msg-reqid      = cs_tview-reqid.
*                            ls_msg-rownb      = cs_tview-rownb.
*                            ls_msg-viewname   = cs_tview-viewname.
*                            ls_msg-field      = cs_tview-fieldname.
*                            ls_msg-type       = 'E'.
*                            ls_msg-idmsg      = gc_classmsg.
*                            ls_msg-num        = '057'.
*                            ls_msg-message_v1 = cs_tview-value.
*                            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                              INTO ls_msg-message WITH ls_msg-message_v1.
*                            APPEND ls_msg TO ct_msg.
*
**                           Update the table view
*                            cs_tview-status = ls_msg-type.
*                            cs_tview-message = ls_msg-message.
*                            cv_rc = 4.
*                            EXIT.
*                          ENDIF.
*
*                        ENDIF.
*
*                      ENDIF.
*
*                    ENDIF.
*
*                  ENDIF.
*
*                ENDIF.
*
*              ENDIF.
*
*            ENDIF.
*
*          ENDIF.
*
*        ELSE.
*
*          CLEAR ls_msg.
**         Message d'erreur : Impossible de trouver la table de contrôle
**         avec le nom de table et le nom du champ
*          ls_msg-viewname   = cs_tview-viewname.
*          ls_msg-field      = cs_tview-fieldname.
*          ls_msg-type       = 'E'.
*          ls_msg-idmsg      = gc_classmsg.
*          ls_msg-num        = '009'.
*          ls_msg-message_v1 = is_tfields-tabname.
*          ls_msg-message_v2 = lv_as4text.
*          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*            INTO ls_msg-message
*          WITH ls_msg-message_v1 ls_msg-message_v2.
*          APPEND ls_msg TO ct_msg.
*          cv_rc = 8.
*
*        ENDIF.
*
*      ENDIF.
*
*    ENDIF.

  ENDMETHOD.


  METHOD check_mvke_vtweg.

    DATA : ls_tbuoc   TYPE /dlwupex/tbuoc,
           ls_msg     TYPE /dlwupex/tmsg,
*           lt_table   TYPE /dlwupex/tview_tt,
           lv_as4text TYPE as4text..

    FIELD-SYMBOLS : <fs_vkorg> TYPE any.

    CALL METHOD me->check_table_control
      EXPORTING
        is_tfields = is_tfields
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview
        cv_rc      = cv_rc.
    IF cs_tview-status IS NOT INITIAL.
      EXIT.
    ENDIF.

    IF gt_ctview_mvke_vtweg[] IS INITIAL.
      gt_ctview_mvke_vtweg = it_table.
      SORT gt_ctview_mvke_vtweg BY  id
                                    reqid
                                    matnr
                                    rownb
                                    viewname
                                    fieldname.
    ENDIF.

*    lt_table = it_table.
*    SORT lt_table BY id
*                       reqid
*                       matnr
*                       rownb
*                       viewname
*                       fieldname.
*** INITIALIZATION
    CLEAR : ls_tbuoc, ls_msg, lv_as4text.
    UNASSIGN : <fs_vkorg>.

*On récupère en amont le libelle du champ technique en cas d'erreur
    CALL METHOD me->retrieving_fieldtext
      EXPORTING
        is_ddobjname = is_tfields-tabname
        is_tabfield  = is_tfields-tabfield
        is_fieldname = cs_tview-fieldname
      IMPORTING
        es_as4text   = lv_as4text.

    READ TABLE gt_ctview_mvke_vtweg ASSIGNING FIELD-SYMBOL(<fs_line>)
    WITH KEY id        = cs_tview-id
             reqid     = cs_tview-reqid
             matnr     = cs_tview-matnr
             rownb     = cs_tview-rownb
             viewname  = is_tfields-viewname
             fieldname = 'VKORG'
             BINARY SEARCH.
    IF sy-subrc EQ 0
      AND <fs_line> IS ASSIGNED.
*     Valeur de vkorg
      ASSIGN COMPONENT 'VALUE'
      OF STRUCTURE <fs_line> TO <fs_vkorg>.
      CHECK <fs_vkorg> IS ASSIGNED.

***  Check : Lire la table de custom avec l'OC
      CLEAR ls_tbuoc.
      READ TABLE gt_tbuoc INTO ls_tbuoc
      WITH KEY id    = cs_tview-id
               vkorg = <fs_vkorg>
               vtweg = cs_tview-value
               BINARY SEARCH.
      IF sy-subrc NE 0.
*       L'OA saisie n'est pas dans la table de custom
        CLEAR ls_msg.
        ls_msg-matnr      = cs_tview-matnr.
        ls_msg-id         = cs_tview-id.
        ls_msg-reqid      = cs_tview-reqid.
        ls_msg-viewname   = cs_tview-viewname.
        ls_msg-field      = cs_tview-fieldname.
        ls_msg-line       = cs_tview-line.
        ls_msg-type       = 'E'.
        ls_msg-idmsg      = gc_classmsg.
        ls_msg-num        = '038'.
        ls_msg-message_v1 = cs_tview-value.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message
          WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
*       Update the table view
        cs_tview-status = ls_msg-type.
        cs_tview-message = ls_msg-message.
        EXIT.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD check_stpo_idnrk.

    DATA : dref          TYPE REF TO data,
           lt_where      TYPE TABLE OF edpline,
           lt_gdata      TYPE /dlwupex/tgdata_tt,
           ls_where      TYPE edpline,
           ls_msg        TYPE /dlwupex/tmsg,
           ls_gdata      TYPE /dlwupex/tgdata,
           lv_tabcontrol TYPE tabname,
           lv_art_key    TYPE /dlwupex/ematkey,
           lv_string     TYPE string,
           lv_attyp      TYPE attyp,
*           lv_rownb_tmp  TYPE /dlwupex/elineid,
           lv_as4text    TYPE as4text.

    FIELD-SYMBOLS : <ft_itab_tmp> TYPE STANDARD TABLE,
                    <fs_value>    TYPE any.

*   INITIALIZATION
    REFRESH : lt_where, lt_gdata.
    CLEAR : ls_where, ls_msg, lv_tabcontrol, lv_string, ls_gdata,
            lv_art_key, lv_as4text.", lv_rownb_tmp.
    UNASSIGN : <ft_itab_tmp>, <fs_value>.

*    lv_rownb_tmp = cs_tview-line - 1 .


*** CHECK 1 Controle que la clé article est de type 10 ou 12
    lv_art_key = cs_tview-matnr. "ARTXX
    CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
      EXPORTING
        iv_bu      = cs_tview-id
        iv_reqid   = cs_tview-reqid
        iv_art_key = lv_art_key
      CHANGING
        ct_gdata   = lt_gdata "General data
        cv_rc      = cv_rc.
    IF lt_gdata[] IS NOT INITIAL.
      CLEAR ls_gdata.
      READ TABLE lt_gdata INTO ls_gdata
      WITH KEY art_key = cs_tview-matnr
      BINARY SEARCH.
      IF sy-subrc EQ 0
        AND ls_gdata-attyp EQ '00'.
*       ARTXX n'est pas de type 10 ou 12
        CLEAR ls_msg.
        ls_msg-matnr      = cs_tview-matnr.
        ls_msg-id         = cs_tview-id.
        ls_msg-reqid      = cs_tview-reqid.
        ls_msg-rownb      = cs_tview-rownb.
        ls_msg-viewname   = cs_tview-viewname.
        ls_msg-field      = cs_tview-fieldname.
        ls_msg-line       = cs_tview-line.
        ls_msg-type       = 'E'.
        ls_msg-idmsg      = gc_classmsg.
        ls_msg-num        = '040'.
        ls_msg-message_v1 = cs_tview-matnr.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message
        WITH ls_msg-message_v1 ls_msg-message_v2.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
*       Update the table view
        cs_tview-status = ls_msg-type.
        cs_tview-message = ls_msg-message.
        cv_rc = 4.
        EXIT.
      ELSE.
        REFRESH lt_gdata.
      ENDIF.
    ENDIF.

*On récupère en amont le libelle du champ technique en cas d'erreur
    CALL METHOD me->retrieving_fieldtext
      EXPORTING
        is_ddobjname = is_tfields-tabname
        is_tabfield  = is_tfields-tabfield
        is_fieldname = cs_tview-fieldname
      IMPORTING
        es_as4text   = lv_as4text.

    lv_tabcontrol = gc_mara.

*   On assigne le field symbol en fonction de la table en paramètre
    CREATE DATA dref TYPE TABLE OF (lv_tabcontrol).
    ASSIGN dref->* TO <ft_itab_tmp>.

    IF <ft_itab_tmp> IS ASSIGNED
      AND cs_tview-value IS NOT INITIAL.
      CLEAR ls_where.
      REFRESH lt_where.

      CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
        EXPORTING
          input        = cs_tview-value
        IMPORTING
          output       = cs_tview-value
        EXCEPTIONS
          length_error = 1
          OTHERS       = 2.
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.

*     On construit un WHERE dynamique
      CONCATENATE '& =' '''&1''' INTO lv_string SEPARATED BY space.
      ls_where = lv_string.
      REPLACE '&'  WITH gc_matnr INTO ls_where.
      REPLACE '&1' WITH cs_tview-value INTO ls_where.
      APPEND ls_where TO lt_where.

*** Check 2 : Article existe déjà dans MARA
*      SELECT *
*        FROM (lv_tabcontrol)
*        INTO TABLE <ft_itab_tmp>
*        WHERE (lt_where).
      SELECT SINGLE attyp
        FROM (lv_tabcontrol)
        INTO lv_attyp
        WHERE (lt_where).
      IF sy-subrc NE 0.
***     Check 3 : Si l'article n'est pas dans MARA alors on va le chercher dans la
*       reserve de travail
        lv_art_key = cs_tview-value. "ARTXX
        CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
          EXPORTING
            iv_bu      = cs_tview-id
            iv_reqid   = cs_tview-reqid
            iv_art_key = lv_art_key
          CHANGING
            ct_gdata   = lt_gdata "General data
            cv_rc      = cv_rc.
        IF lt_gdata[] IS NOT INITIAL.
***       CHECK 4 Control if the material is type 00.
          CLEAR ls_gdata.
          READ TABLE lt_gdata INTO ls_gdata
          WITH KEY art_key = cs_tview-value
          BINARY SEARCH.
          IF sy-subrc EQ 0
            AND ls_gdata-attyp NE '00'.
*           ARTXX n'est pas de type 00
            CLEAR ls_msg.
            ls_msg-matnr      = cs_tview-matnr.
            ls_msg-id         = cs_tview-id.
            ls_msg-reqid      = cs_tview-reqid.
            ls_msg-rownb      = cs_tview-rownb.
            ls_msg-viewname   = cs_tview-viewname.
            ls_msg-field      = cs_tview-fieldname.
            ls_msg-line       = cs_tview-line.
            ls_msg-type       = 'E'.
            ls_msg-idmsg      = gc_classmsg.
            ls_msg-num        = '052'.
            ls_msg-message_v1 = cs_tview-value.
            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
              INTO ls_msg-message
            WITH ls_msg-message_v1.
            APPEND ls_msg TO ct_msg.
            cv_rc = 4.
*           Update the table view
            cs_tview-status = ls_msg-type.
            cs_tview-message = ls_msg-message.
            cv_rc = 4.
            EXIT.

          ENDIF.

        ELSE.
*         IDNRK n'est pas présent n'y dans MARA n'y dans la reserve
          CLEAR ls_msg.
          ls_msg-matnr      = cs_tview-matnr.
          ls_msg-id         = cs_tview-id.
          ls_msg-reqid      = cs_tview-reqid.
          ls_msg-rownb      = cs_tview-rownb.
          ls_msg-viewname   = cs_tview-viewname.
          ls_msg-field      = cs_tview-fieldname.
          ls_msg-line       = cs_tview-line.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-num        = '016'.
          ls_msg-message_v1 = cs_tview-value.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message
          WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
*         Update the table view
          cs_tview-status = ls_msg-type.
          cs_tview-message = ls_msg-message.
          cv_rc = 4.
          EXIT.
        ENDIF.

      ELSE.
***     CHECK 4 Control if the material is type 00.
*        READ TABLE <ft_itab_tmp> ASSIGNING FIELD-SYMBOL(<fs_itab_line>)
*        INDEX 1.
*        IF sy-subrc EQ 0.
**         On récupère le type d'article
*          ASSIGN COMPONENT gc_attyp
*          OF STRUCTURE <fs_itab_line> TO <fs_value>.
*          IF <fs_value> NE '00'.
        IF lv_attyp NE '00'.
*           L'article n'est pas de type 00
          CLEAR ls_msg.
          ls_msg-matnr      = cs_tview-matnr.
          ls_msg-id         = cs_tview-id.
          ls_msg-reqid      = cs_tview-reqid.
          ls_msg-rownb      = cs_tview-rownb.
          ls_msg-viewname   = cs_tview-viewname.
          ls_msg-field      = cs_tview-fieldname.
          ls_msg-line       = cs_tview-line.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-num        = '052'.
          ls_msg-message_v1 = cs_tview-value.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message
          WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
*           Update the table view
          cs_tview-status = ls_msg-type.
          cs_tview-message = ls_msg-message.
          cv_rc = 4.
          EXIT.

        ENDIF.

*        ENDIF.
*
      ENDIF.

    ENDIF.

*****    CHECK 2 Article présent dans la réserve de travail
*        READ TABLE it_table TRANSPORTING NO FIELDS
*        WITH KEY ('VIEWNAME')  = is_tfields-viewname
**                 ('ROWNB')     = lv_rownb_tmp
*                 ('FIELDNAME') = gc_artkey
*                 ('VALUE')     = cs_tview-value.
*        IF sy-subrc NE 0.
**         IDNRK n'est pas présent n'y dans MARA n'y dans la reserve
*          CLEAR ls_msg.
*          ls_msg-matnr      = cs_tview-matnr.
*          ls_msg-id         = cs_tview-id.
*          ls_msg-reqid      = cs_tview-reqid.
*          ls_msg-rownb      = cs_tview-rownb.
*          ls_msg-viewname   = cs_tview-viewname.
*          ls_msg-field      = cs_tview-fieldname.
*          ls_msg-type       = 'E'.
*          ls_msg-idmsg      = gc_classmsg.
*          ls_msg-num        = '016'.
*          ls_msg-message_v1 = cs_tview-value.
*          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*            INTO ls_msg-message
*          WITH ls_msg-message_v1.
*          APPEND ls_msg TO ct_msg.
*          cv_rc = 4.
**         Update the table view
*          cs_tview-status = ls_msg-type.
*          cs_tview-message = ls_msg-message.
*          cv_rc = 4.
*          EXIT.
*        ELSE.
****       CHECK 4 Control if ARTXX is type 10 or 12.
*          lv_art_key = cs_tview-value.
*          CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
*            EXPORTING
*              iv_bu      = cs_tview-id
*              iv_reqid   = cs_tview-reqid
*              iv_art_key = lv_art_key
*            CHANGING
*              ct_gdata   = lt_gdata
*              cv_rc      = cv_rc.
*          IF lt_gdata[] IS NOT INITIAL.
*            CLEAR ls_gdata.
*            READ TABLE lt_gdata INTO ls_gdata
*            INDEX 1.
*            IF sy-subrc EQ 0
*              AND ls_gdata-attyp NE '00'.
**             l'article n'est pas de type 00
*              CLEAR ls_msg.
*              ls_msg-matnr      = cs_tview-matnr.
*              ls_msg-id         = cs_tview-id.
*              ls_msg-reqid      = cs_tview-reqid.
*              ls_msg-rownb      = cs_tview-rownb.
*              ls_msg-viewname   = cs_tview-viewname.
*              ls_msg-field      = cs_tview-fieldname.
*              ls_msg-type       = 'E'.
*              ls_msg-idmsg      = gc_classmsg.
*              ls_msg-num        = '040'.
*              ls_msg-message_v1 = cs_tview-value.
*              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                INTO ls_msg-message
*              WITH ls_msg-message_v1.
*              APPEND ls_msg TO ct_msg.
*              cv_rc = 4.
**             Update the table view
*              cs_tview-status = ls_msg-type.
*              cs_tview-message = ls_msg-message.
*              cv_rc = 4.
*              EXIT.
*
*            ENDIF.
*
*          ENDIF.
*
*        ENDIF.
*
  ENDMETHOD.


  METHOD check_t002_spras.



  ENDMETHOD.


  METHOD check_table_control.

    DATA : ls_ref_itab              TYPE REF TO data,
           lt_where                 TYPE TABLE OF edpline,
           lt_dfies_tabcontrol      TYPE TABLE OF dfies,
           lt_key_fieldtab          TYPE cacs_cond_keyfields,
           ls_key_fieldtab          TYPE cacs_s_cond_keyfields,
           ls_dfies_line            TYPE dfies,
           ls_dfies_tabcontrol_line TYPE dfies,
           ls_where                 TYPE edpline,
           ls_domain_ctr            TYPE /dlwupex/dom_ctrl,
           ls_msg                   TYPE /dlwupex/tmsg,
           lv_tabname               TYPE ddobjname,
           lv_flag_error            TYPE xfeld,
           lv_concatenate           TYPE string,
           lv_tabcontrol            TYPE tabname,
           lv_fieldname             TYPE dfies-fieldname,
           lv_xfeld                 TYPE xfeld,
           lv_output                TYPE string,
           lv_ok                    TYPE xfeld,
           lv_no_function           TYPE xfeld.

    FIELD-SYMBOLS :  <fs_line>     TYPE any.


    REFRESH : lt_dfies_tabcontrol, lt_where, lt_key_fieldtab.
    CLEAR : ls_dfies_line, ls_domain_ctr, lv_tabname, lv_fieldname,
            lv_tabcontrol, ls_dfies_tabcontrol_line, ls_where,
            ls_msg, lv_concatenate, lv_flag_error, lv_xfeld,
            lv_output, lv_no_function, ls_key_fieldtab.
    UNASSIGN : <fs_line>.



*   Find table control
    IF iv_tabcontrol IS INITIAL.
      lv_tabname = is_tfields-tabname.
      lv_fieldname = cs_tview-fieldname.
    ELSE.
      CALL METHOD me->get_keyfield
        EXPORTING
          iv_tabname   = iv_tabcontrol
        IMPORTING
          et_keyfields = lt_key_fieldtab.

*      CALL FUNCTION 'GET_KEY_FIELDS_OF_TABLE'
*        EXPORTING
*          tabname       = iv_tabcontrol
**         MANDT_NEEDED  = ' '
*        TABLES
*          key_fieldtab  = lt_key_fieldtab
*        EXCEPTIONS
*          not_supported = 1
*          OTHERS        = 2.
      IF sy-subrc EQ 0.
        CLEAR ls_key_fieldtab.
        READ TABLE lt_key_fieldtab INTO ls_key_fieldtab
        INDEX 1.
        IF ls_key_fieldtab-fieldname = 'MANDT'.
          DELETE lt_key_fieldtab INDEX 1. ""Mandt
        ENDIF.
        READ TABLE lt_key_fieldtab INTO ls_key_fieldtab
        INDEX 1.
        IF sy-subrc EQ 0.
          lv_tabname = ls_key_fieldtab-tabname.
          lv_fieldname = ls_key_fieldtab-fieldname.
        ENDIF.
      ENDIF.
    ENDIF.
    IF lv_fieldname = 'DATABB'.
      lv_fieldname = 'DATAB'.
    ENDIF.

    CLEAR : lv_flag_error, ls_dfies_line, ls_domain_ctr, lv_tabcontrol.
    CALL METHOD me->retrieving_control_table
      EXPORTING
        iv_tabname    = lv_tabname
        iv_fieldname  = lv_fieldname
      CHANGING
        cs_dfies_line = ls_dfies_line
        cs_domain_ctr = ls_domain_ctr
        cv_tabcontrol = lv_tabcontrol
        cv_flag_error = lv_flag_error.

    IF lv_flag_error IS INITIAL.


*     Check on the table control
      IF lv_tabcontrol IS NOT INITIAL.
        CALL METHOD me->get_fieldinfo_field
          EXPORTING
            iv_tabname   = lv_tabcontrol
          IMPORTING
            et_dfies_tab = lt_dfies_tabcontrol.
*        CALL FUNCTION 'DDIF_FIELDINFO_GET'
*          EXPORTING
*            tabname        = lv_tabcontrol
*          TABLES
*            dfies_tab      = lt_dfies_tabcontrol
*          EXCEPTIONS
*            not_found      = 1
*            internal_error = 2
*            OTHERS         = 3.
        IF sy-subrc EQ 0.
          SORT lt_dfies_tabcontrol BY tabname domname keyflag.
          CLEAR ls_dfies_tabcontrol_line.
          READ TABLE lt_dfies_tabcontrol INTO ls_dfies_tabcontrol_line
          WITH KEY tabname = lv_tabcontrol
                   domname = ls_dfies_line-domname
                   keyflag = abap_true
                   BINARY SEARCH.
          IF sy-subrc EQ 0.
*           Construction du select dynamique
            REFRESH lt_where.
            CLEAR : ls_where, lv_concatenate.
            IF  cs_tview-fieldname IS NOT INITIAL.

              CONDENSE ls_dfies_tabcontrol_line-fieldname.
              CONCATENATE ls_dfies_tabcontrol_line-fieldname '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
              IF ls_dfies_tabcontrol_line-convexit IS NOT INITIAL.
*               On utilise la valeur de la routine de convertion
                CALL METHOD me->get_convexit
                  EXPORTING
                    is_convexit    = ls_dfies_tabcontrol_line-convexit
                    is_value       = cs_tview-value
                    is_tabcontrol  = ls_dfies_tabcontrol_line
                  IMPORTING
                    es_xfeld       = lv_xfeld
                    ev_output      = lv_output
                  CHANGING
                    cv_no_function = lv_no_function.
              ENDIF.
              IF lv_xfeld IS NOT INITIAL.
                REPLACE '&' WITH lv_output INTO lv_concatenate.
              ELSE.
                REPLACE '&' WITH cs_tview-value INTO lv_concatenate.
                lv_output = cs_tview-value.
              ENDIF.
              ls_where = lv_concatenate.
*             On assigne le field symbol en fonction de la table en paramètre
              CREATE DATA ls_ref_itab TYPE (lv_tabcontrol).
              ASSIGN ls_ref_itab->* TO <fs_line>.
            ENDIF.
            APPEND ls_where TO lt_where.

            IF <fs_line> IS ASSIGNED.
              IF cs_tview-value IS INITIAL
                AND iv_flag_empty IS INITIAL.

              ELSE.
                CALL METHOD me->get_tab_control
                  EXPORTING
                    iv_tabname = lv_tabcontrol
                    iv_value   = lv_output
                    it_where   = lt_where
                  IMPORTING
                    es_ok      = lv_ok.
*                SELECT SINGLE *
*                  FROM (lv_tabcontrol)
*                  INTO <fs_line>
*                  WHERE (lt_where).
                IF lv_ok = abap_false.
                  CLEAR ls_msg.
*                 Message d'erreur car valeur non valide
                  ls_msg-matnr      = cs_tview-matnr.
                  ls_msg-id         = cs_tview-id.
                  ls_msg-reqid      = cs_tview-reqid.
                  ls_msg-rownb      = cs_tview-rownb.
                  ls_msg-viewname   = cs_tview-viewname.
                  ls_msg-line       = cs_tview-line.
                  ls_msg-field      = cs_tview-fieldname.
                  ls_msg-type       = 'E'.
                  ls_msg-idmsg      = gc_classmsg.
                  ls_msg-message_v1 = cs_tview-value.
*                  IF lv_tabcontrol(1) = 'Z'.
                  ls_msg-num        = '059'.
                  ls_msg-message_v2 = cs_tview-fieldname.
*                  ELSE.
*                    ls_msg-num        = '005'.
*                    ls_msg-message_v2 = lv_tabcontrol.
*                  ENDIF.
                  MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                    INTO ls_msg-message
                  WITH ls_msg-message_v1 ls_msg-message_v2.
                  APPEND ls_msg TO ct_msg.

*                 Update the table view
                  cs_tview-status = ls_msg-type.
                  cs_tview-message = ls_msg-message.
                  cv_rc = 4.
                ENDIF.

              ENDIF.

            ENDIF.

          ELSE.
            CLEAR ls_msg.
*           Message d'erreur : Pas de nom de champ pour le
*           nom de domaine saisie
            ls_msg-matnr      = cs_tview-matnr.
            ls_msg-id         = cs_tview-id.
            ls_msg-reqid      = cs_tview-reqid.
            ls_msg-rownb      = cs_tview-rownb.
            ls_msg-viewname   = cs_tview-viewname.
            ls_msg-field      = cs_tview-fieldname.
            ls_msg-line       = cs_tview-line.
            ls_msg-type       = 'E'.
            ls_msg-idmsg      = gc_classmsg.
            ls_msg-num        = '007'.
            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
              INTO ls_msg-message.
            APPEND ls_msg TO ct_msg.
            cv_rc = 8.
          ENDIF.
        ELSE.
          CLEAR ls_msg.
*         Message d'erreur : Nom de la table de contrôle
*         incorrecte
          ls_msg-matnr      = cs_tview-matnr.
          ls_msg-id         = cs_tview-id.
          ls_msg-reqid      = cs_tview-reqid.
          ls_msg-rownb      = cs_tview-rownb.
          ls_msg-viewname   = cs_tview-viewname.
          ls_msg-field      = cs_tview-fieldname.
          ls_msg-line       = cs_tview-line.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-num        = '006'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message.
          APPEND ls_msg TO ct_msg.
          cv_rc = 8.
        ENDIF.
      ELSEIF ls_domain_ctr-values IS NOT INITIAL.
        READ TABLE ls_domain_ctr-values TRANSPORTING NO FIELDS
        WITH KEY domvalue_l = cs_tview-value
        BINARY SEARCH.
        IF sy-subrc IS NOT INITIAL.
          CLEAR ls_msg.
*                 Message d'erreur car valeur non valide
          ls_msg-matnr      = cs_tview-matnr.
          ls_msg-id         = cs_tview-id.
          ls_msg-reqid      = cs_tview-reqid.
          ls_msg-rownb      = cs_tview-rownb.
          ls_msg-viewname   = cs_tview-viewname.
          ls_msg-line       = cs_tview-line.
          ls_msg-field      = cs_tview-fieldname.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-message_v1 = cs_tview-value.
*                  IF lv_tabcontrol(1) = 'Z'.
          ls_msg-num        = '059'.
          ls_msg-message_v2 = cs_tview-fieldname.
*                  ELSE.
*                    ls_msg-num        = '005'.
*                    ls_msg-message_v2 = lv_tabcontrol.
*                  ENDIF.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message
          WITH ls_msg-message_v1 ls_msg-message_v2.
          APPEND ls_msg TO ct_msg.

*                 Update the table view
          cs_tview-status = ls_msg-type.
          cs_tview-message = ls_msg-message.
          cv_rc = 4.
        ENDIF.
      ELSE.
        CLEAR ls_msg.
*       Message d'erreur : Determination de la table de contrôle
*       impossible
        ls_msg-matnr      = cs_tview-matnr.
        ls_msg-id         = cs_tview-id.
        ls_msg-reqid      = cs_tview-reqid.
        ls_msg-rownb      = cs_tview-rownb.
        ls_msg-viewname   = cs_tview-viewname.
        ls_msg-field      = cs_tview-fieldname.
        ls_msg-line       = cs_tview-line.
        ls_msg-type       = 'E'.
        ls_msg-idmsg      = gc_classmsg.
        ls_msg-num        = '008'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message.
        APPEND ls_msg TO ct_msg.
        cv_rc = 8.
      ENDIF.
*    ELSE.
*      CLEAR ls_msg.
**     Message d'erreur : Impossible de trouver la table de contrôle
**     avec le nom de table et le nom du champ
*      ls_msg-viewname   = cs_tview-viewname.
*      ls_msg-field      = cs_tview-fieldname.
*      ls_msg-type       = 'E'.
*      ls_msg-idmsg      = gc_classmsg.
*      ls_msg-num        = '009'.
*      ls_msg-message_v1 = is_tfields-tabname.
*      ls_msg-message_v2 = cs_tview-fieldname.
*      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*        INTO ls_msg-message
*      WITH ls_msg-message_v1 ls_msg-message_v2.
*      cv_rc = 8.

    ENDIF.

  ENDMETHOD.


  METHOD check_typage.

    DATA : lt_dfies_tab     TYPE TABLE OF dfies,
           ls_dfies_tab     TYPE dfies,
*           ls_dd01v         TYPE dd01v,
           ls_msg           TYPE /dlwupex/tmsg,
           lv_ddobjname     TYPE ddobjname,
           lv_date_internal TYPE d,
           lv_date_format   TYPE c LENGTH 15,
           lv_htype         TYPE  dd01v-datatype,
           lv_split1        TYPE string,
           lv_split2        TYPE string,
           lv_len           TYPE i,
           lv_dats_tmp      TYPE string,
           lv_string        TYPE string,
           lv_as4text       TYPE as4text,
           lv_xfeld         TYPE xfeld,
           lv_no_function   TYPE xfeld.




    REFRESH : lt_dfies_tab.
    CLEAR : ls_dfies_tab, ls_msg, lv_ddobjname, lv_len,
            lv_htype,lv_date_internal, lv_date_format, lv_split1,
            lv_split2, lv_dats_tmp, lv_as4text, lv_xfeld, lv_no_function.


*** Check 1 : on récupère le type de référence du champ
    lv_ddobjname = is_tfields-tabname.
    CALL METHOD me->get_fieldinfo_field
      EXPORTING
        iv_tabname   = lv_ddobjname
      IMPORTING
        et_dfies_tab = lt_dfies_tab.
*    CALL FUNCTION 'DDIF_FIELDINFO_GET'
*      EXPORTING
*        tabname        = lv_ddobjname
*      TABLES
*        dfies_tab      = lt_dfies_tab
*      EXCEPTIONS
*        not_found      = 1
*        internal_error = 2
*        OTHERS         = 3.
    IF sy-subrc EQ 0
      AND lt_dfies_tab[] IS NOT INITIAL.

      CLEAR ls_dfies_tab.
      READ TABLE lt_dfies_tab INTO ls_dfies_tab
        WITH KEY tabname = lv_ddobjname
                 fieldname = cs_tview-fieldname
        BINARY SEARCH.
      IF sy-subrc EQ 0.

        IF ls_dfies_tab-convexit IS NOT INITIAL.
***       Check 2 : On contrôle que la valeur saisie est correcte via la routine de conversion
          CLEAR lv_xfeld.
          CALL METHOD me->get_convexit
            EXPORTING
              is_convexit    = ls_dfies_tab-convexit
              is_value       = cs_tview-value
              is_tabcontrol  = ls_dfies_tab
            IMPORTING
              es_xfeld       = lv_xfeld
            CHANGING
              cv_no_function = lv_no_function.
          IF lv_no_function IS NOT INITIAL.
*           Nom de la fonction inéxistante
            CLEAR ls_msg.
            ls_msg-matnr      = cs_tview-matnr.
            ls_msg-id         = cs_tview-id.
            ls_msg-reqid      = cs_tview-reqid.
            ls_msg-viewname   = cs_tview-viewname.
            ls_msg-line       = cs_tview-line.
            ls_msg-field      = cs_tview-fieldname.
            ls_msg-type       = 'E'.
            ls_msg-idmsg      = gc_classmsg.
*            ls_msg-num        = '026'.
            ls_msg-message_v1 = is_tfields-tabfield.
            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
              INTO ls_msg-message
            WITH ls_msg-message_v1.
            APPEND ls_msg TO ct_msg.

          ELSEIF lv_xfeld IS NOT INITIAL.
            EXIT.
          ENDIF.
        ENDIF.

        CLEAR : lv_ddobjname.", ls_dd01v.
        lv_ddobjname = ls_dfies_tab-fieldname.
***     Check 2 : On contrôle la longeur du contenu du champ
        lv_string = cs_tview-value.
        CONDENSE lv_string.
        lv_len = strlen( lv_string ).
        IF lv_len > ls_dfies_tab-leng.
*         Champ trop long
*On récupère le libelle du champ technique pour l'erreur
          CALL METHOD me->retrieving_fieldtext
            EXPORTING
              is_ddobjname = is_tfields-tabname
              is_tabfield  = is_tfields-tabfield
              is_fieldname = cs_tview-fieldname
            IMPORTING
              es_as4text   = lv_as4text.
          CLEAR ls_msg.
          ls_msg-matnr      = cs_tview-matnr.
          ls_msg-id         = cs_tview-id.
          ls_msg-reqid      = cs_tview-reqid.
          ls_msg-viewname   = cs_tview-viewname.
          ls_msg-line       = cs_tview-line.
          ls_msg-field      = cs_tview-fieldname.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-num        = '026'.
*          ls_msg-message_v1 = is_tfields-tabname.
          ls_msg-message_v1 = lv_as4text.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message
          WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.

*         Update the table view
          cs_tview-status = ls_msg-type.
          cs_tview-message = ls_msg-message.
          EXIT.

        ENDIF.

        CALL FUNCTION 'NUMERIC_CHECK'
          EXPORTING
            string_in = cs_tview-value
          IMPORTING
*           STRING_OUT       =
            htype     = lv_htype.
        IF lv_htype IS NOT INITIAL.
          CASE ls_dfies_tab-datatype.
            WHEN 'NUMC'.
              IF lv_htype NE ls_dfies_tab-datatype.
*On récupère le libelle du champ technique pour l'erreur
                CALL METHOD me->retrieving_fieldtext
                  EXPORTING
                    is_ddobjname = is_tfields-tabname
                    is_tabfield  = is_tfields-tabfield
                    is_fieldname = cs_tview-fieldname
                  IMPORTING
                    es_as4text   = lv_as4text.
*               Impossible de mettre du char dans du numeric
                CLEAR ls_msg.
                ls_msg-matnr      = cs_tview-matnr.
                ls_msg-id         = cs_tview-id.
                ls_msg-reqid      = cs_tview-reqid.
                ls_msg-viewname   = cs_tview-viewname.
                ls_msg-line       = cs_tview-line.
                ls_msg-field      = cs_tview-fieldname.
                ls_msg-type       = 'E'.
                ls_msg-idmsg      = gc_classmsg.
                ls_msg-num        = '027'.
*                ls_msg-message_v1 = is_tfields-tabname.
                ls_msg-message_v1 = lv_as4text.
                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                  INTO ls_msg-message
                WITH ls_msg-message_v1.
                APPEND ls_msg TO ct_msg.

*               Update the table view
                cs_tview-status = ls_msg-type.
                cs_tview-message = ls_msg-message.

              ENDIF.
            WHEN 'DATS'.
              IF lv_len >= ls_dfies_tab-leng.
                CONCATENATE cs_tview-value+6(2) cs_tview-value+4(2) cs_tview-value(4)
                INTO lv_dats_tmp.

                CLEAR lv_date_internal.
                CALL FUNCTION 'CONVERT_DATE_TO_INTERNAL'
                  EXPORTING
                    date_external            = lv_dats_tmp
                  IMPORTING
                    date_internal            = lv_date_internal
                  EXCEPTIONS
                    date_external_is_invalid = 1.
                IF sy-subrc EQ 1
                  AND lv_dats_tmp CN '0'.
*                 Format date incorrect
                  WRITE sy-datum TO lv_date_format.
                  CLEAR ls_msg.
                  ls_msg-matnr      = cs_tview-matnr.
                  ls_msg-id         = cs_tview-id.
                  ls_msg-reqid      = cs_tview-reqid.
                  ls_msg-viewname   = cs_tview-viewname.
                  ls_msg-field      = cs_tview-fieldname.
                  ls_msg-line       = cs_tview-line.
                  cs_tview-status   = ls_msg-type = 'E'.
                  ls_msg-idmsg      = gc_classmsg.
                  ls_msg-num        = '025'.
                  ls_msg-message_v1 = lv_date_format.
                  MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                    INTO ls_msg-message
                  WITH ls_msg-message_v1.
                  APPEND ls_msg TO ct_msg.

*               Update the table view
                  cs_tview-message = ls_msg-message.
                ENDIF.
              ELSEIF cs_tview-value CN '0123456789'.
*               Format date incorrect
                WRITE sy-datum TO lv_date_format.
                CLEAR ls_msg.
                ls_msg-matnr      = cs_tview-matnr.
                ls_msg-id         = cs_tview-id.
                ls_msg-reqid      = cs_tview-reqid.
                ls_msg-viewname   = cs_tview-viewname.
                ls_msg-field      = cs_tview-fieldname.
                ls_msg-line       = cs_tview-line.
                cs_tview-status   = ls_msg-type = 'E'.
                ls_msg-idmsg      = gc_classmsg.
                ls_msg-num        = '025'.
                ls_msg-message_v1 = lv_date_format.
                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                  INTO ls_msg-message
                WITH ls_msg-message_v1.
                APPEND ls_msg TO ct_msg.

*               Update the table view
                cs_tview-message = ls_msg-message.
              ELSEIF lv_len < ls_dfies_tab-leng.
*               format date incorrect
                WRITE sy-datum TO lv_date_format.
                CLEAR ls_msg.
                ls_msg-matnr      = cs_tview-matnr.
                ls_msg-id         = cs_tview-id.
                ls_msg-reqid      = cs_tview-reqid.
                ls_msg-viewname   = cs_tview-viewname.
                ls_msg-field      = cs_tview-fieldname.
                ls_msg-line       = cs_tview-line.
                cs_tview-status   = ls_msg-type = 'E'.
                ls_msg-idmsg      = gc_classmsg.
                ls_msg-num        = '025'.
                ls_msg-message_v1 = lv_date_format.
                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                  INTO ls_msg-message
                WITH ls_msg-message_v1.
                APPEND ls_msg TO ct_msg.

*               Update the table view
                cs_tview-message = ls_msg-message.

              ENDIF.

            WHEN 'CHAR'.
*              Nothing to do

            WHEN OTHERS.

              IF cs_tview-value CS '.'.
*               On contrôle que le nombre de décimal correspond au nombre autorisé
                SPLIT cs_tview-value AT '.' INTO lv_split1 lv_split2.
                CONDENSE lv_split2.
                lv_len = strlen( lv_split2 ).
                IF lv_len > ls_dfies_tab-decimals.
*On récupère le libelle du champ technique pour l'erreur
                  CALL METHOD me->retrieving_fieldtext
                    EXPORTING
                      is_ddobjname = is_tfields-tabname
                      is_tabfield  = is_tfields-tabfield
                      is_fieldname = cs_tview-fieldname
                    IMPORTING
                      es_as4text   = lv_as4text.
*                 Nombre de décimal trop important
                  CLEAR ls_msg.
                  ls_msg-matnr      = cs_tview-matnr.
                  ls_msg-id         = cs_tview-id.
                  ls_msg-reqid      = cs_tview-reqid.
                  ls_msg-viewname   = cs_tview-viewname.
                  ls_msg-field      = cs_tview-fieldname.
                  ls_msg-line       = cs_tview-line.
                  ls_msg-type       = 'E'.
                  ls_msg-idmsg      = gc_classmsg.
                  ls_msg-num        = '028'.
                  ls_msg-message_v1  = lv_as4text.
                  ls_msg-message_v2 = ls_dfies_tab-decimals.
                  MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                    INTO ls_msg-message
                  WITH ls_msg-message_v1 ls_msg-message_v2.
                  APPEND ls_msg TO ct_msg.

*                 Update the table view
                  cs_tview-status = ls_msg-type.
                  cs_tview-message = ls_msg-message.
                ENDIF.

              ENDIF.

*              IF cs_tview-value CS '.'.
**               Utilisation du . pour virgule interdite
**On récupère le libelle du champ technique pour l'erreur
*                CALL METHOD me->retrieving_fieldtext
*                  EXPORTING
*                    is_ddobjname = is_tfields-tabname
*                    is_tabfield  = is_tfields-tabfield
*                    is_fieldname = cs_tview-fieldname
*                  IMPORTING
*                    es_as4text   = lv_as4text.
*                CLEAR ls_msg.
*                ls_msg-matnr      = cs_tview-matnr.
*                ls_msg-id         = cs_tview-id.
*                ls_msg-reqid      = cs_tview-reqid.
*                ls_msg-viewname   = cs_tview-viewname.
*                ls_msg-field      = cs_tview-fieldname.
*                ls_msg-line       = cs_tview-line.
*                ls_msg-type       = 'E'.
*                ls_msg-idmsg      = gc_classmsg.
*                ls_msg-num        = '029'.
*                ls_msg-message_v1 = lv_as4text.
**                ls_msg-message_v1 = is_tfields-tabname.
**                ls_msg-message_v2 = lv_as4text.
*                MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*                  INTO ls_msg-message
*                WITH ls_msg-message_v1.
*                APPEND ls_msg TO ct_msg.
*
**               Update the table view
*                cs_tview-status = ls_msg-type.
*                cs_tview-message = ls_msg-message.
*              ENDIF.

          ENDCASE.

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD check_wlk1_filia.

    DATA : ls_tbuoc   TYPE /dlwupex/tbuoc,
           lv_vkorg   TYPE vkorg,
           ls_msg     TYPE /dlwupex/tmsg,
           lv_as4text TYPE as4text.

*** INITIALIZATION
    CLEAR : ls_tbuoc, ls_msg, lv_as4text.

    CALL METHOD me->check_table_control
      EXPORTING
        is_tfields = is_tfields
      CHANGING
        ct_msg     = ct_msg
        cs_tview   = cs_tview
        cv_rc      = cv_rc.
    IF cs_tview-status IS NOT INITIAL.
      EXIT.
    ENDIF.

*On récupère en amont le libelle du champ technique en cas d'erreur
    CALL METHOD me->retrieving_fieldtext
      EXPORTING
        is_ddobjname = is_tfields-tabname
        is_tabfield  = is_tfields-tabfield
        is_fieldname = cs_tview-fieldname
      IMPORTING
        es_as4text   = lv_as4text.

***  Check : Lire la table de custom avec l'OC
    SELECT SINGLE vkorg INTO lv_vkorg
        FROM wrs1
        WHERE asort = cs_tview-value.

    CLEAR ls_tbuoc.
    READ TABLE gt_tbuoc INTO ls_tbuoc
    WITH KEY id    = cs_tview-id
             vkorg = lv_vkorg
             BINARY SEARCH.
    IF sy-subrc NE 0.
*     L'OA saisie n'est pas dans la table de custom
      CLEAR ls_msg.
      ls_msg-matnr      = cs_tview-matnr.
      ls_msg-id         = cs_tview-id.
      ls_msg-reqid      = cs_tview-reqid.
      ls_msg-viewname   = cs_tview-viewname.
      ls_msg-field      = cs_tview-fieldname.
      ls_msg-line       = cs_tview-line.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = gc_classmsg.
      ls_msg-num        = '066'.
      ls_msg-message_v1 = cs_tview-value.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message
        WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
*     Update the table view
      cs_tview-status = ls_msg-type.
      cs_tview-message = ls_msg-message.
      EXIT.

    ENDIF.

  ENDMETHOD.


  METHOD constructor.
*** Constructor

    SELECT * FROM /dlwupex/tbuoa INTO TABLE me->gt_tbuoa
      WHERE id = iv_id AND
            ckp_creation = abap_true.

    SELECT * FROM /dlwupex/tbuoc INTO TABLE me->gt_tbuoc
      WHERE id = iv_id AND
            ckp_creation = abap_true.

    SELECT SINGLE * FROM /dlwupex/treqids
      INTO gs_reqids
         WHERE id    = iv_id
           AND reqid = iv_reqid.

    SORT : me->gt_tbuoa,
           me->gt_tbuoc.

  ENDMETHOD.


  METHOD get_convexit.

    DATA : lv_new_line  TYPE REF TO data,
           lt_dfies_tab TYPE TABLE OF dfies,
           ls_dfies_tab TYPE dfies,
           lv_function  TYPE tdsfname,
           lv_input     TYPE string,
           lv_type      TYPE string,
           lv_fm_name   TYPE rs38l_fnam,
           lv_convexit  TYPE convexit,
           lv_lifnr     TYPE lifnr,
           lv_ddobjname TYPE ddobjname.

*   INITIALIZATION
    REFRESH : lt_dfies_tab.
    CLEAR : ls_dfies_tab, lv_function, lv_input, lv_fm_name,
            lv_convexit, lv_ddobjname.

***A GARDER OU A EFFACER
    IF iv_ddobjname IS NOT INITIAL.
      CALL METHOD me->get_fieldinfo_field
        EXPORTING
          iv_tabname   = iv_ddobjname
        IMPORTING
          et_dfies_tab = lt_dfies_tab.
*      CALL FUNCTION 'DDIF_FIELDINFO_GET'
*        EXPORTING
*          tabname        = iv_ddobjname
*        TABLES
*          dfies_tab      = lt_dfies_tab
*        EXCEPTIONS
*          not_found      = 1
*          internal_error = 2
*          OTHERS         = 3.
      IF sy-subrc EQ 0
      AND lt_dfies_tab[] IS NOT INITIAL.
        CLEAR ls_dfies_tab.
        READ TABLE lt_dfies_tab INTO ls_dfies_tab
          WITH KEY tabname = iv_ddobjname
                   fieldname = iv_fieldname
          BINARY SEARCH.
        IF sy-subrc EQ 0.
          IF ls_dfies_tab-convexit IS NOT INITIAL.
            lv_convexit = ls_dfies_tab-convexit.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
***A GARDER OU A EFFACER
    IF is_convexit IS NOT INITIAL.
      lv_convexit = is_convexit.
    ENDIF.

* On appel la fonction en dynamic avec le nom de la routine de conversion trouvé
* en amont
    TRY.
        CONCATENATE gc_convexit lv_convexit gc_convexit2
        INTO lv_function.
        CONDENSE lv_function.
        lv_fm_name = lv_function.

        IF lt_dfies_tab[] IS NOT INITIAL.
          CONCATENATE ls_dfies_tab-tabname '-' ls_dfies_tab-fieldname INTO lv_type.
        ELSE.
          CONCATENATE is_tabcontrol-tabname '-' is_tabcontrol-fieldname INTO lv_type.
        ENDIF.

        CREATE DATA lv_new_line TYPE (lv_type).
        ASSIGN lv_new_line->* TO  FIELD-SYMBOL(<fs_output>).
        CHECK <fs_output> IS ASSIGNED.
        <fs_output> = is_value.

        CALL FUNCTION 'OM_FUNC_MODULE_EXIST'
          EXPORTING
            function_module = lv_fm_name
*                             IMPORTING
*           TFDIR_INFO      =
          EXCEPTIONS
            not_existent    = 1
            OTHERS          = 2.
        IF sy-subrc <> 0.
* Implement suitable error handling here
          CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
            EXPORTING
              input  = <fs_output>
            IMPORTING
              output = <fs_output>.

        ELSE.
          CALL FUNCTION lv_fm_name
            EXPORTING
              input  = <fs_output>
            IMPORTING
              output = <fs_output>
            EXCEPTIONS
              OTHERS = 99.
        ENDIF.
        ev_output = <fs_output>.
        IF sy-subrc EQ 0
          AND is_value NE ev_output
          AND ev_output IS NOT INITIAL.
          es_xfeld = abap_true.
        ENDIF.
      CATCH   cx_sy_dyn_call_illegal_func.
        cv_no_function = abap_true.

    ENDTRY.

  ENDMETHOD.


  METHOD get_domain.

    DATA : ls_domain TYPE /dlwupex/dom_ctrl,
           ls_dd01v  TYPE dd01v,
           lt_dd07v  TYPE dd07v_tab.

    READ TABLE me->gt_domain INTO ls_domain
           WITH KEY domname = iv_domname
           BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      es_domain_ctr = ls_domain.
    ELSE.
      DATA(lv_tabix) = sy-tabix.
      CALL FUNCTION 'DDIF_DOMA_GET'
        EXPORTING
          name          = iv_domname
        IMPORTING
          dd01v_wa      = ls_dd01v
        TABLES
          dd07v_tab     = lt_dd07v
        EXCEPTIONS
          illegal_input = 1
          OTHERS        = 2.

      ls_domain-domname = iv_domname.
      ls_domain-entitytab = ls_dd01v-entitytab.
      SORT lt_dd07v BY domvalue_l.
      ls_domain-values = lt_dd07v.

      es_domain_ctr = ls_domain.
      INSERT ls_domain INTO me->gt_domain INDEX lv_tabix.
    ENDIF.

  ENDMETHOD.


  METHOD get_ean_type.

    DATA : ls_ean_type TYPE /dlwupex/ean_type,
           lt_type_ean TYPE /dlwupex/typeinterv_tt.

    READ TABLE me->gt_ean_type INTO ls_ean_type
           WITH KEY intext = iv_intext
           BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      et_ean_type = ls_ean_type-type_ean.
    ELSE.
      DATA(lv_tabix) = sy-tabix.
      CALL FUNCTION 'EAN_GET_TYPE_AND_RANGE'
        EXPORTING
          i_intext         = iv_intext
        TABLES
          e_tab_type_range = lt_type_ean.

      ls_ean_type-intext = iv_intext.
      et_ean_type = ls_ean_type-type_ean = lt_type_ean.
      INSERT ls_ean_type INTO me->gt_ean_type INDEX lv_tabix.
    ENDIF.

  ENDMETHOD.


  METHOD get_fieldinfo_field.

    DATA : ls_field_infos      TYPE /dlwupex/field_infos,
           lt_dfies_tabcontrol TYPE dfies_tab.



    READ TABLE me->gt_field_infos INTO ls_field_infos
           WITH KEY tabname = iv_tabname
                    fieldname = iv_fieldname
           BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      et_dfies_tab = ls_field_infos-dfies_tab.
    ELSE.
      DATA(lv_tabix) = sy-tabix.

      CALL FUNCTION 'DDIF_FIELDINFO_GET'
        EXPORTING
          tabname        = iv_tabname
          fieldname      = iv_fieldname
          langu          = sy-langu
        TABLES
          dfies_tab      = lt_dfies_tabcontrol
        EXCEPTIONS
          not_found      = 1
          internal_error = 2
          OTHERS         = 3.
      SORT lt_dfies_tabcontrol.
      ls_field_infos-tabname = iv_tabname.
      ls_field_infos-fieldname = iv_fieldname.
      et_dfies_tab = ls_field_infos-dfies_tab = lt_dfies_tabcontrol.
      INSERT ls_field_infos INTO me->gt_field_infos INDEX lv_tabix.

    ENDIF.

  ENDMETHOD.


  METHOD get_instance.

    DATA : lv_class TYPE /dlwupex/evalue.

*** On récupère la classe d'instruction des checks
    CLEAR lv_class.
    SELECT SINGLE value
      FROM /dlwupex/tcusto
      INTO lv_class
      WHERE name = gc_class_check.
    IF sy-subrc EQ 0
      AND lv_class IS NOT INITIAL.
      CREATE OBJECT rv_object
         TYPE (lv_class)
         EXPORTING iv_id = iv_id
             iv_reqid = iv_reqid.
    ELSE.
      lv_class = gc_check_core.
      CREATE OBJECT rv_object
         TYPE (lv_class)
         EXPORTING iv_id = iv_id
             iv_reqid = iv_reqid.
    ENDIF.

  ENDMETHOD.


  METHOD get_keyfield.

    DATA : ls_keys_tab  TYPE /dlwupex/key_infos,
           lt_keyfields TYPE cacs_cond_keyfields.

    READ TABLE me->gt_keys_tab INTO ls_keys_tab
           WITH KEY tabname = iv_tabname
           BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      et_keyfields = ls_keys_tab-keys_tab.
    ELSE.
      DATA(lv_tabix) = sy-tabix.
      CALL FUNCTION 'CACS_GET_TABLE_FIELDS'
        EXPORTING
          i_tabname  = iv_tabname
        TABLES
          t_keyfield = lt_keyfields.

      ls_keys_tab-tabname = iv_tabname.
      et_keyfields = ls_keys_tab-keys_tab = lt_keyfields.
      INSERT ls_keys_tab INTO me->gt_keys_tab INDEX lv_tabix.
    ENDIF.

  ENDMETHOD.


  METHOD get_keyfield_table.

    DATA : ls_key_infos        TYPE /dlwupex/field_infos,
           lt_dfies_tabcontrol TYPE dfies_tab.


    READ TABLE me->gt_key_infos INTO ls_key_infos
           WITH KEY tabname = iv_tabname
           BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      et_dfies_tab = ls_key_infos-dfies_tab.
    ELSE.
      DATA(lv_tabix) = sy-tabix.

      CALL FUNCTION 'GET_KEY_FIELDS_OF_TABLE'
        EXPORTING
          tabname       = iv_tabname
        TABLES
          key_fieldtab  = lt_dfies_tabcontrol
        EXCEPTIONS
          not_supported = 1
          OTHERS        = 2.
      IF sy-subrc EQ 0.
        SORT lt_dfies_tabcontrol.
        DELETE lt_dfies_tabcontrol WHERE fieldname EQ 'ART_KEY'.
        DELETE lt_dfies_tabcontrol WHERE fieldname EQ 'ID'.
        DELETE lt_dfies_tabcontrol WHERE fieldname EQ 'LINE'.
        DELETE lt_dfies_tabcontrol WHERE fieldname EQ 'REQID'.
        ls_key_infos-tabname = iv_tabname.
        et_dfies_tab = ls_key_infos-dfies_tab = lt_dfies_tabcontrol.
        INSERT ls_key_infos INTO me->gt_key_infos INDEX lv_tabix.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD get_tab_control.

    DATA : ls_tab    TYPE /dlwupex/tab_ctrl,
           lv_tabix  TYPE sytabix,
           lv_tabix2 TYPE sytabix.

    es_ok = abap_false.

    READ TABLE me->gt_tab_control ASSIGNING FIELD-SYMBOL(<fs_tab>)
           WITH KEY tabname = iv_tabname
           BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE <fs_tab>-strings TRANSPORTING NO FIELDS
        WITH KEY table_line = iv_value
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        es_ok = abap_true.
        EXIT.
      ELSE.
        lv_tabix2 = sy-tabix.
        SELECT COUNT(*) UP TO 1 ROWS
                  FROM (iv_tabname)
                  WHERE (it_where).
        IF sy-subrc IS INITIAL.
          INSERT iv_value INTO <fs_tab>-strings INDEX lv_tabix2.

          es_ok = abap_true.
        ENDIF.
      ENDIF.
    ELSE.
      lv_tabix = sy-tabix.
      SELECT COUNT(*) UP TO 1 ROWS
                FROM (iv_tabname)
                WHERE (it_where).
      IF sy-subrc IS INITIAL.

        APPEND iv_value TO ls_tab-strings.
        ls_tab-tabname = iv_tabname.
        INSERT ls_tab INTO me->gt_tab_control INDEX lv_tabix.
        es_ok = abap_true.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD retrieving_control_table.

    DATA : lt_dfies_tab TYPE TABLE OF dfies.

    REFRESH : lt_dfies_tab.

*   find table control
    CALL METHOD me->get_fieldinfo_field
      EXPORTING
        iv_tabname   = iv_tabname
        iv_fieldname = iv_fieldname
      IMPORTING
        et_dfies_tab = lt_dfies_tab.
    IF sy-subrc EQ 0.
*     On récupère la table de contrôle si elle est renseignée
      CLEAR cs_dfies_line.
      READ TABLE lt_dfies_tab INTO cs_dfies_line
      INDEX 1.
      IF sy-subrc EQ 0.
*       On stock le libelle du champ
        IF iv_feld_fieldtext IS NOT INITIAL.
          cv_fieldtext = cs_dfies_line-fieldtext.
          EXIT.
        ENDIF.
        IF cs_dfies_line-checktable IS INITIAL.
*         If checktable is initial
*         With the domname find the associate table control
          CLEAR cs_domain_ctr.

          CALL METHOD me->get_domain
            EXPORTING
              iv_domname    = cs_dfies_line-domname
            IMPORTING
              es_domain_ctr = cs_domain_ctr.
*          CALL FUNCTION 'DDIF_DOMA_GET'
*            EXPORTING
*              name          = cs_dfies_line-domname
*            IMPORTING
*              dd01v_wa      = cs_dd01v_wa
*            EXCEPTIONS
*              illegal_input = 1
*              OTHERS        = 2.
          IF sy-subrc EQ 0.
*         Dynamically assign the table
            IF cs_domain_ctr-entitytab IS NOT INITIAL.
              cv_tabcontrol = cs_domain_ctr-entitytab.
            ELSEIF cs_domain_ctr-values IS INITIAL.
              cv_flag_error = 'X'.
            ENDIF.

          ENDIF.
        ELSEIF sy-subrc EQ 0
          AND cs_dfies_line-checktable IS NOT INITIAL.
*         Dynamically assign the table
          cv_tabcontrol = cs_dfies_line-checktable.
        ENDIF.
      ENDIF.
    ELSE.
      cv_flag_error = 'X'.
    ENDIF.

  ENDMETHOD.


  METHOD retrieving_fieldtext.
    DATA : lt_dfies_tab  TYPE TABLE OF dfies,
           ls_dfies_line TYPE dfies,
           lv_tabname    TYPE ddobjname,
           lv_tabfield   TYPE dfies-fieldname.

*   INITIALIZATION
    REFRESH : lt_dfies_tab.
    CLEAR : ls_dfies_line, lv_tabname, lv_tabfield.

    CLEAR es_as4text.
    lv_tabname  = is_ddobjname.
    lv_tabfield = is_tabfield.
*   Find the field libel
    CALL METHOD me->get_fieldinfo_field
      EXPORTING
        iv_tabname   = lv_tabname
        iv_fieldname = lv_tabfield
      IMPORTING
        et_dfies_tab = lt_dfies_tab.
*    CALL FUNCTION 'DDIF_FIELDINFO_GET'
*      EXPORTING
*        tabname        = lv_tabname
*        fieldname      = lv_tabfield
*        langu          = sy-langu
*      TABLES
*        dfies_tab      = lt_dfies_tab
*      EXCEPTIONS
*        not_found      = 1
*        internal_error = 2
*        OTHERS         = 3.
    IF sy-subrc EQ 0.
      CLEAR ls_dfies_line.
      READ TABLE lt_dfies_tab INTO ls_dfies_line
      INDEX 1.
      IF sy-subrc EQ 0.
*       On stock le libelle du champ
        es_as4text = ls_dfies_line-fieldtext.
      ENDIF.
    ELSE.
*   Si le libelle est vide on met par défaut le champ technique
      es_as4text = is_fieldname.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
