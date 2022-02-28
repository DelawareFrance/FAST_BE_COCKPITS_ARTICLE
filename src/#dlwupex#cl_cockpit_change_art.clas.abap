class /DLWUPEX/CL_COCKPIT_CHANGE_ART definition
  public
  create public .

public section.

  interfaces /DLWUPEX/IF_COCKPIT_CHANGE_ART .

  data GT_TVAR_P type /DLWUPEX/TVAR_P_TT .
  data GT_TVAR_IN type /DLWUPEX/TVAR_IN_TT .

  class-methods AVAILABLE_VARIANT
    importing
      !IV_WA type /DLWUPEX/EBUSUNITID
      !IV_USER type USERNAME
    exporting
      !ET_VARIANT type /DLWUPEX/VAR_TT .
  methods CONSTRUCTOR
    importing
      !IV_WA type /DLWUPEX/EBUSUNITID
      !IV_VARIANT type /DLWUPEX/EVARIANT .
  class-methods GET_INSTANCE
    importing
      !IV_WA type /DLWUPEX/EBUSUNITID
      !IV_VARIANT type /DLWUPEX/EVARIANT
    returning
      value(RV_OBJECT) type ref to /DLWUPEX/CL_COCKPIT_CHANGE_ART .
  methods CHANGE_EAN_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_MEAN type MEAN_TAB
      !CT_MARM type MARM_TAB
      !CT_SELDATA type MASS_TABDATA .
  methods CHANGE_SALES_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_CARACT_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_UNIT_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_GLOBAL_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_LISTING_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_SOURCE_LIST_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_FIA_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_LOGDC_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_LOGSTO_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_TAXE_DATA
    importing
      !IT_DATA type ANY TABLE .
  methods CHANGE_LISTING_DATA_BIS
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
protected section.

  data GV_WA type /DLWUPEX/EBUSUNITID .
  data GV_VARIANT type /DLWUPEX/EVARIANT .
  data GT_VIEWKEY type /DLWUPEX/TVIEW_K_TT .
  constants GC_CLASSMSG type ARBGB value '/DLWUPEX/COCKPIT_ART' ##NO_TEXT.
  data GT_CHECK_LINK type /DLWUPEX/TCHECK_TT .
  data GT_EINE type MMPR_EINE .
  data GT_EINA type MMPR_EINA .

  methods READ_CUSTO .
  methods CHANGE_NOMENC_DATA
    importing
      !IT_DATA type ANY TABLE .
  methods CHANGE_FIA_PRICE_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_SALES_PRICE_DATA
    importing
      !IT_DATA type ANY TABLE
    changing
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods READ_FIA_DB
    importing
      !IT_DATA type ANY TABLE .
  methods CHECK_BEFORE_SAVE
    importing
      !IV_VIEW type /DLWUPEX/EVIEWNAME
    exporting
      !EV_RC type SYSUBRC
    changing
      !CT_DATA type ANY TABLE .
  methods CHECK_BEFORE_SAVE_FIA
    exporting
      !EV_RC type SYSUBRC
    changing
      !CT_DATA type ANY TABLE .
  methods CHECK_BEFORE_SAVE_CARAC
    exporting
      !EV_RC type SYSUBRC
    changing
      !CT_DATA type ANY TABLE .
  methods CHECK_BEFORE_SAVE_UNIT
    exporting
      !EV_RC type SYSUBRC
    changing
      !CT_DATA type ANY TABLE .
  methods READ_EAN_DB
    importing
      !IT_DATA type ANY TABLE .
private section.

  constants GC_GDATAVIEW type /DLWUPEX/EVIEWNAME value '01' ##NO_TEXT.
  constants GC_UNITVIEW type /DLWUPEX/EVIEWNAME value '02' ##NO_TEXT.
  constants GC_CARACTVIEW type /DLWUPEX/EVIEWNAME value '03' ##NO_TEXT.
  constants GC_BOMVIEW type /DLWUPEX/EVIEWNAME value '04' ##NO_TEXT.
  constants GC_LISTVIEW type /DLWUPEX/EVIEWNAME value '05' ##NO_TEXT.
  constants GC_FIAVIEW type /DLWUPEX/EVIEWNAME value '06' ##NO_TEXT.
  constants GC_SRLISTVIEW type /DLWUPEX/EVIEWNAME value '07' ##NO_TEXT.
  constants GC_SALEVIEW type /DLWUPEX/EVIEWNAME value '08' ##NO_TEXT.
  constants GC_LOGDCVIEW type /DLWUPEX/EVIEWNAME value '09' ##NO_TEXT.
  constants GC_LOGSTOVIEW type /DLWUPEX/EVIEWNAME value '10' ##NO_TEXT.
  data GT_TBUHEAD type /DLWUPEX/TBUHEAD_TT .
  data GT_TBUOA type /DLWUPEX/TBUOA_TT .
  data GT_TBUOC type /DLWUPEX/TBUOC_TT .
  data GT_TCUSTO type /DLWUPEX/TCUSTO_TT .
  data GT_KEYS_TAB type /DLWUPEX/KEY_INFOS_TT .
  data GT_SMAKT type MAKT_TAB .
  data GT_SMALG type MALG_TTY .
  data GT_SMAMT type MAMT_TTY .
  data GT_SMARA type MARA_TAB .
  data GT_SMARC type MARC_TAB .
  data GT_SMARD type MARD_TAB .
  data GT_SMARM type MARM_TAB .
  data GT_SMAW1 type MAW1_TAB .
  data GT_SMBEW type MBEW_TAB .
  data GT_SMEAN type MEAN_TAB .
  data GT_SMLEA type MLEA_TTY .
  data GT_SMLGN type MLGN_TAB .
  data GT_SMLGT type MLGT_TAB .
  data GT_SMPGD type MPGD_TAB .
  data GT_SMPOP type MPOP_TAB .
  data GT_SMPRW type /DLWUPEX/MPRW_TTY .
  data GT_SMVEG type /DLWUPEX/MVEG_TTY .
  data GT_SMVEU type /DLWUPEX/MVEU_TTY .
  data GT_SMVKE type MVKE_TAB .
  data GT_SWLK2 type WLK2_TABLE .
  data GT_SMARTSTATUS type /DLWUPEX/MARTSTATUS_TTY .
  data GT_SSGT_MARM type SGT_T_MARM .
  data GT_SSGT_MVKE type SGT_T_MVKE .
  data GT_SSGT_MADKA type SGT_T_MADKA .
  data GT_SSGT_MLGT type SGT_T_MLGT .
  data GT_SSGT_MLGN type SGT_T_MLGN .
  data GT_SSGT_MRP type SGT_TT_MRP .
  data GT_SSGT_MRP_GN type SGT_TT_MRP_GN .
  data GT_SFSH_SEASONS_MAT type FSH_TT_SEASONS_MAT .
  data GT_SELDATA type MASS_TABDATA .
  data GS_TLIM_AR type /DLWUPEX/TLIM_AR .
  constants GC_CLASS_CORE type /DLWUPEX/ENAME value 'CLASSNAME_MOD' ##NO_TEXT.
  constants GC_CLASSNAME_CORE type /DLWUPEX/ENAME value '/DLWUPEX/CL_COCKPIT_CHANGE_ART' ##NO_TEXT.
  data GT_T006 type TT_T006 .
  data GC_STATUSINPROGRESS type /DLWUPEX/EMODSTATUS value '01' ##NO_TEXT.
  data GC_STATUSERROR type /DLWUPEX/EMODSTATUS value '03' ##NO_TEXT.
  data GC_STATUSFINISH type /DLWUPEX/EMODSTATUS value '02' ##NO_TEXT.
  data GC_STATUSRETRIED type /DLWUPEX/EMODSTATUS value '04' ##NO_TEXT.
  data GT_CONT_P type /DLWUPEX/TCONT_P_TT .
  data GV_ID type /DLWUPEX/EIDCONT .
  data GT_MEAN_CHECK type MEAN_TAB .

  methods MANAGE_AUTH .
  methods GET_VIEW_AUTORITY
    importing
      !IV_VIEW type /DLWUPEX/EVIEWNAME
    exporting
      !EV_INSERT type C
      !EV_ACCESS type C .
ENDCLASS.



CLASS /DLWUPEX/CL_COCKPIT_CHANGE_ART IMPLEMENTATION.


  METHOD /dlwupex/if_cockpit_change_art~bapi_change_data.

    DATA : ls_cont_p     TYPE /dlwupex/tcont_p,
           lt_cont_p     TYPE TABLE OF /dlwupex/tcont_p,
           lv_ext_number TYPE BALNREXT,
           lt_lognumbers TYPE szal_lognumbers,
           ls_lognumbers TYPE szal_lognumber,
           lt_message    TYPE TABLE OF balm,
           ls_message    TYPE balm,
           lt_msg        TYPE TABLE OF massmsg.

    CHECK me->gt_seldata IS NOT INITIAL.

    CALL FUNCTION 'MASS_SAVE_ARTICLE_USING_BAPI'
      EXPORTING
        seldata          = me->gt_seldata
        testmode         = abap_false
      IMPORTING
        msg              = lt_msg
      TABLES
        smakt            = me->gt_smakt
        smalg            = me->gt_smalg
        smamt            = me->gt_smamt
        smara            = me->gt_smara
        smarc            = me->gt_smarc
        smard            = me->gt_smard
        smarm            = me->gt_smarm
        smaw1            = me->gt_smaw1
        smbew            = me->gt_smbew
        smean            = me->gt_smean
        smlea            = me->gt_smlea
        smlgn            = me->gt_smlgn
        smlgt            = me->gt_smlgt
        smpgd            = me->gt_smpgd
        smpop            = me->gt_smpop
        smprw            = me->gt_smprw
        smveg            = me->gt_smveg
        smveu            = me->gt_smveu
        smvke            = me->gt_smvke
        swlk2            = me->gt_swlk2
        smartstatus      = me->gt_smartstatus
        ssgt_marm        = me->gt_ssgt_marm
        ssgt_mvke        = me->gt_ssgt_mvke
        ssgt_madka       = me->gt_ssgt_madka
        sfsh_seasons_mat = me->gt_sfsh_seasons_mat
        ssgt_mlgt        = me->gt_ssgt_mlgt
        ssgt_mlgn        = me->gt_ssgt_mlgn
        ssgt_mrp_gn      = me->gt_ssgt_mrp_gn
        ssgt_mrp         = me->gt_ssgt_mrp.

    READ TABLE lt_msg TRANSPORTING NO FIELDS
      WITH KEY msgty = 'E'.
    IF sy-subrc IS INITIAL.
      LOOP AT lt_msg ASSIGNING FIELD-SYMBOL(<fs_msg>).
        CHECK <fs_msg>-msgty = 'E'.

        IF <fs_msg>-msgty = 'E' AND <fs_msg>-msgid = 'MG' AND	<fs_msg>-msgno = 537. " Message Protocole

          lv_ext_number = <fs_msg>-msgv2. " numéro protocole

          CALL FUNCTION 'APPL_LOG_READ_DB'
            EXPORTING
              external_number = lv_ext_number " numéro protocole
            TABLES
              messages        = lt_message.

          DELETE lt_message WHERE msgty <> 'E'.
          LOOP AT lt_message ASSIGNING FIELD-SYMBOL(<fs_message>).
            ls_cont_p-id = me->gv_id.
            ls_cont_p-material = <fs_msg>-objkey.
            ls_cont_p-type = <fs_message>-msgty.
            ls_cont_p-idmsg = <fs_message>-msgid.
            ls_cont_p-num = <fs_message>-msgno.
            ls_cont_p-message_v1 = <fs_message>-msgv1.
            ls_cont_p-message_v2 = <fs_message>-msgv2.
            ls_cont_p-message_v3 = <fs_message>-msgv3.
            ls_cont_p-message_v4 = <fs_message>-msgv4.
            MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
               INTO ls_cont_p-message WITH ls_cont_p-message_v1 ls_cont_p-message_v2
                                        ls_cont_p-message_v3 ls_cont_p-message_v4.

            APPEND ls_cont_p TO me->gt_cont_p.
          ENDLOOP.
        ELSE.
          ls_cont_p-id = me->gv_id.
          ls_cont_p-material = <fs_msg>-objkey.
          ls_cont_p-type = <fs_msg>-msgty.
          ls_cont_p-idmsg = <fs_msg>-msgid.
          ls_cont_p-num = <fs_msg>-msgno.
          ls_cont_p-message_v1 = <fs_msg>-msgv1.
          ls_cont_p-message_v2 = <fs_msg>-msgv2.
          ls_cont_p-message_v3 = <fs_msg>-msgv3.
          ls_cont_p-message_v4 = <fs_msg>-msgv4.
          MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
             INTO ls_cont_p-message WITH ls_cont_p-message_v1 ls_cont_p-message_v2
                                      ls_cont_p-message_v3 ls_cont_p-message_v4.

          APPEND ls_cont_p TO me->gt_cont_p.
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~change_all_data.

    TYPES: ty_tdatasave TYPE TABLE OF /dlwupex/cl_productmas_mpc=>ts_gendataupdate WITH DEFAULT KEY.
    TYPES : ty_tunitupdate  TYPE TABLE OF /dlwupex/cl_productmas_mpc=>ts_unitupdate WITH DEFAULT KEY.
    TYPES : ty_tcaracupdate  TYPE TABLE OF /dlwupex/cl_productmas_mpc=>ts_caracupdate WITH DEFAULT KEY.
    TYPES : ty_tsaleupdate  TYPE TABLE OF /dlwupex/cl_productmas_mpc=>ts_saleupdate WITH DEFAULT KEY.
    TYPES : ty_tlistupdate  TYPE TABLE OF /dlwupex/cl_productmas_mpc=>ts_listupdate WITH DEFAULT KEY.
    TYPES : ty_tslistupdateupdate  TYPE TABLE OF /dlwupex/cl_productmas_mpc=>ts_slistupdate WITH DEFAULT KEY.
    TYPES : ty_tfiaupdateupdate  TYPE TABLE OF /dlwupex/cl_productmas_mpc=>ts_fiaupdate WITH DEFAULT KEY.
    TYPES : ty_tlogdcupdate  TYPE TABLE OF /dlwupex/cl_productmas_mpc=>ts_logdcupdate WITH DEFAULT KEY.
    TYPES : ty_tlogstupdate  TYPE TABLE OF /dlwupex/cl_productmas_mpc=>ts_logstoreupdate WITH DEFAULT KEY.

    DATA: lt_gendata TYPE ty_tdatasave,
          lt_unit    TYPE ty_tunitupdate,
          lt_carac   TYPE ty_tcaracupdate,
          lt_sale    TYPE ty_tsaleupdate,
          lt_list    TYPE ty_tlistupdate,
          lt_slist   TYPE ty_tslistupdateupdate,
          lt_fia     TYPE ty_tfiaupdateupdate,
          lt_logdc   TYPE ty_tlogdcupdate,
          lt_logsto  TYPE ty_tlogstupdate.

    DATA :
      lt_change_data  TYPE /dlwupex/if_cockpit_change_art~ty_change_data_tt,
      ls_change_data  TYPE /dlwupex/if_cockpit_change_art~ty_change_data,
      lt_seldata      TYPE /dlwupex/seldata_tt,
      ls_cont_h       TYPE /dlwupex/tcont_h,
      lt_msg          TYPE TABLE OF massmsg,
      lv_nbart        TYPE i,
      lv_qname        TYPE trfcqnam,
      lv_qname_exist  TYPE trfcqnam,
      lt_queue        TYPE /sapapo/cif_trfcqview_tt,
      lv_number       TYPE num4,
      lv_id           TYPE /dlwupex/eidcont,
      lv_idqueue      TYPE char10,
      lv_data         TYPE REF TO data,
      lv_nb_art_queue TYPE int4,
      lrt_matnr       TYPE RANGE OF matnr,
      lrs_matnr       LIKE LINE OF lrt_matnr,
      lrt_matnr2      TYPE RANGE OF matnr.


    FIELD-SYMBOLS : <ft_data>  TYPE ANY TABLE,
                    <ft_data1> TYPE ANY TABLE,
                    <fs_field> TYPE any.

    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.


* Check des données avant Sauvegarde
    LOOP AT ct_all_data ASSIGNING FIELD-SYMBOL(<fs_all_data>).

      TRY .
          DATA(ls_all_data) = <fs_all_data>-data[ 1 ].
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
      IF ls_all_data IS NOT INITIAL.
        ASSIGN ls_all_data-data->* TO <ft_data>.
      ENDIF.
      CLEAR ls_all_data.

      IF <fs_all_data>-view = gc_fiaview.
        CALL METHOD me->read_fia_db
          EXPORTING
            it_data = <ft_data>.

        CALL METHOD me->check_before_save_fia
          IMPORTING
            ev_rc   = ev_rc
          CHANGING
            ct_data = <ft_data>.
      ELSE.
        IF <fs_all_data>-view = gc_caractview.
          CALL METHOD me->check_before_save_carac
            IMPORTING
              ev_rc   = ev_rc
            CHANGING
              ct_data = <ft_data>.
        ENDIF.
        IF <fs_all_data>-view = gc_unitview.
          CALL METHOD me->read_ean_db
          EXPORTING
            it_data = <ft_data>.

          CALL METHOD me->check_before_save_unit
            IMPORTING
              ev_rc   = ev_rc
            CHANGING
              ct_data = <ft_data>.
        ENDIF.
        CALL METHOD me->check_before_save
          EXPORTING
            iv_view = <fs_all_data>-view
          IMPORTING
            ev_rc   = ev_rc
          CHANGING
            ct_data = <ft_data>.
      ENDIF.
      CHECK ev_rc IS INITIAL.

      LOOP AT <ft_data> ASSIGNING FIELD-SYMBOL(<fs_data>).
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        lrs_matnr-low = <fs_field>.
        APPEND lrs_matnr TO lrt_matnr.
      ENDLOOP.
    ENDLOOP.
* on ne fait la suite que si on ne trouve pas d'erreur
    CHECK ev_rc IS INITIAL.


* données pour traitement par queues
    READ TABLE me->gt_tcusto ASSIGNING FIELD-SYMBOL(<fs_custo>)
         WITH KEY name = 'QUEUE_MOD_PREFIXE'
         BINARY SEARCH.
    IF <fs_custo> IS NOT ASSIGNED.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '023'
         WITH '/DLWUPEX/TCUSTO'.
*        INTO ls_msg-message WITH ls_msg-message_v1.
    ENDIF.


    IF iv_id IS INITIAL.
      CLEAR lv_id.
      DATA(lv_newid) = abap_true.
      SELECT SINGLE MAX( id ) FROM /dlwupex/tcont_h INTO lv_id.

      lv_id = lv_id + 1.

      ls_cont_h-id = lv_id.
      ls_cont_h-work_area = me->gv_wa.
      ls_cont_h-context = iv_context.
      ls_cont_h-statut = gc_statusinprogress.
      ls_cont_h-date_creation = sy-datum.
      ls_cont_h-user_creation = sy-uname.
      ls_cont_h-date_treatment = sy-datum.
      ls_cont_h-heure_treatement = sy-uzeit.
      ls_cont_h-user_treatment = sy-uname.
      ls_cont_h-variant_gestion = me->gv_variant.
      INSERT /dlwupex/tcont_h FROM ls_cont_h.
    ELSE.
      SELECT SINGLE * FROM /dlwupex/tcont_h INTO ls_cont_h
                WHERE id = iv_id.
      IF sy-subrc IS NOT INITIAL.
        ev_rc = 8.
        EXIT.
      ENDIF.
      ls_cont_h-statut = gc_statusinprogress.
      ls_cont_h-context = iv_context.
      ls_cont_h-date_treatment = sy-datum.
      ls_cont_h-heure_treatement = sy-uzeit.
      ls_cont_h-user_treatment = sy-uname.
      lv_newid = abap_false.
      lv_id = iv_id.
      MODIFY /dlwupex/tcont_h FROM ls_cont_h.
      DELETE FROM /dlwupex/tcont_p WHERE id = lv_id.
    ENDIF.

    lv_idqueue = lv_id.

    SHIFT lv_idqueue LEFT DELETING LEADING '0'.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.

    DESCRIBE TABLE lrt_matnr LINES DATA(lv_lines).

    IF me->gs_tlim_ar-nb_queue_art IS NOT INITIAL.
      lv_nb_art_queue = lv_lines / me->gs_tlim_ar-nb_queue_art.
    ELSE.
      lv_nb_art_queue = lv_lines.
    ENDIF.

* Boucle de traitement par groupe d'articles
    LOOP AT lrt_matnr INTO lrs_matnr.

      IF lv_nbart = lv_nb_art_queue AND lv_nbart <> 0.
* récupèration des donnes à traiter.
        LOOP AT ct_all_data ASSIGNING <fs_all_data>.
          CHECK <fs_all_data>-view <> '05'.
          APPEND INITIAL LINE TO lt_change_data ASSIGNING FIELD-SYMBOL(<f_change_data>).
          <f_change_data>-view = <fs_all_data>-view.
          <f_change_data>-seldata = <fs_all_data>-seldata.
          UNASSIGN <ft_data>.
          FREE lv_data.
          TRY .
              ls_all_data = <fs_all_data>-data[ 1 ].
            CATCH cx_sy_itab_line_not_found.
          ENDTRY.
          IF ls_all_data IS NOT INITIAL.
            ASSIGN ls_all_data-data->* TO <ft_data>.
          ENDIF.
          CLEAR ls_all_data.
          LOOP AT <ft_data> ASSIGNING FIELD-SYMBOL(<fs_data_to_change>).
            UNASSIGN <fs_field>.

            ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data_to_change> TO <fs_field>.
            CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
            IF <fs_field> IN lrt_matnr2.
              CASE <fs_all_data>-view.
                WHEN '01'.
                  APPEND <fs_data_to_change> TO lt_gendata.
                WHEN '02'.
                  APPEND <fs_data_to_change> TO lt_unit.
                WHEN '03'.
                  APPEND <fs_data_to_change> TO lt_carac.
                WHEN '05'.
                  APPEND <fs_data_to_change> TO lt_list.
                  IF lt_seldata IS INITIAL.
                    lt_seldata = <fs_all_data>-seldata.
                  ENDIF.
                WHEN '06'.
                  APPEND <fs_data_to_change> TO lt_fia.
                WHEN '07'.
                  APPEND <fs_data_to_change> TO lt_slist.
                WHEN '08'.
                  APPEND <fs_data_to_change> TO lt_sale.
                WHEN '09'.
                  APPEND <fs_data_to_change> TO lt_logdc.
                WHEN '10'.
                  APPEND <fs_data_to_change> TO lt_logsto.
                WHEN OTHERS.
              ENDCASE.

            ENDIF.
          ENDLOOP.
          CASE <fs_all_data>-view.
            WHEN '01'.
              CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sgdataup.
              ASSIGN lv_data->* TO <ft_data1>.
              <ft_data1>[] =  lt_gendata[].
            WHEN '02'.
              CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sunitup.
              ASSIGN lv_data->* TO <ft_data1>.
              <ft_data1>[] =  lt_unit[].
            WHEN '03'.
              CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/scaractup.
              ASSIGN lv_data->* TO <ft_data1>.
              <ft_data1>[] =  lt_carac[].
*            WHEN '05'.
*              CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slistup.
*              ASSIGN lv_data->* TO <ft_data1>.
*              <ft_data1>[] =  lt_list[].
            WHEN '06'.
              CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sfiaup.
              ASSIGN lv_data->* TO <ft_data1>.
              <ft_data1>[] =  lt_fia[].
            WHEN '07'.
              CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sslistup.
              ASSIGN lv_data->* TO <ft_data1>.
              <ft_data1>[] =  lt_slist[].
            WHEN '08'.
              CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/ssaleup.
              ASSIGN lv_data->* TO <ft_data1>.
              <ft_data1>[] =  lt_sale[].
            WHEN '09'.
              CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slogdcup.
              ASSIGN lv_data->* TO <ft_data1>.
              <ft_data1>[] =  lt_logdc[].
            WHEN '10'.
              CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slogstoreup.
              ASSIGN lv_data->* TO <ft_data1>.
              <ft_data1>[] =  lt_logsto[].
            WHEN OTHERS.
          ENDCASE.
          APPEND INITIAL LINE TO   <f_change_data>-data ASSIGNING FIELD-SYMBOL(<f_data>).
          <f_data>-data = lv_data.
        ENDLOOP.

** appel des modif via Queue RFC
        lv_number = lv_number + 1.
        CONCATENATE <fs_custo>-value lv_idqueue '/' lv_number INTO lv_qname.

        CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
          EXPORTING
            qin_name           = lv_qname
          EXCEPTIONS
            invalid_queue_name = 1
            OTHERS             = 2.
        IF sy-subrc EQ 0.
          DATA(lv_datatorfc) = /ui2/cl_json=>serialize( EXPORTING data = lt_change_data ).

          CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_MODIF_ART'
            IN BACKGROUND TASK
            AS SEPARATE UNIT
            EXPORTING
              iv_id      = lv_id
              iv_variant = me->gv_variant
              iv_data    = lv_datatorfc
              iv_wa      = me->gv_wa
              iv_newid   = lv_newid
              iv_qname   = lv_qname.
          COMMIT WORK.
        ENDIF.
        REFRESH : lt_change_data, lrt_matnr2, lt_gendata, lt_unit, lt_carac,
*                  lt_list, lt_fia, lt_slist, lt_sale, lt_logdc, lt_logsto,
                   lt_fia, lt_slist, lt_sale, lt_logdc, lt_logsto,
                  <ft_data1>.
        CLEAR lv_nbart.
        UNASSIGN : <f_change_data>, <f_data>.
      ENDIF.

      lv_nbart = lv_nbart + 1.
      APPEND lrs_matnr TO lrt_matnr2.


    ENDLOOP.

* traitement de la dernière partie après boucle
* récupèration des donnes à traiter.
    LOOP AT ct_all_data ASSIGNING <fs_all_data>.
      CHECK <fs_all_data>-view <> '05'.
      APPEND INITIAL LINE TO lt_change_data ASSIGNING <f_change_data>.
      <f_change_data>-view = <fs_all_data>-view.
      <f_change_data>-seldata = <fs_all_data>-seldata.
      UNASSIGN <ft_data>.
      FREE lv_data.
      TRY .
          ls_all_data = <fs_all_data>-data[ 1 ].
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
      IF ls_all_data IS NOT INITIAL.
        ASSIGN ls_all_data-data->* TO <ft_data>.
      ENDIF.
      CLEAR ls_all_data.
      LOOP AT <ft_data> ASSIGNING <fs_data_to_change>.
        UNASSIGN <fs_field>.

        ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data_to_change> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        IF <fs_field> IN lrt_matnr2.
          CASE <fs_all_data>-view.
            WHEN '01'.
              APPEND <fs_data_to_change> TO lt_gendata.
            WHEN '02'.
              APPEND <fs_data_to_change> TO lt_unit.
            WHEN '03'.
              APPEND <fs_data_to_change> TO lt_carac.
            WHEN '05'.
              APPEND <fs_data_to_change> TO lt_list.
              IF lt_seldata IS INITIAL.
                lt_seldata = <fs_all_data>-seldata.
              ENDIF.
            WHEN '06'.
              APPEND <fs_data_to_change> TO lt_fia.
            WHEN '07'.
              APPEND <fs_data_to_change> TO lt_slist.
            WHEN '08'.
              APPEND <fs_data_to_change> TO lt_sale.
            WHEN '09'.
              APPEND <fs_data_to_change> TO lt_logdc.
            WHEN '10'.
              APPEND <fs_data_to_change> TO lt_logsto.
            WHEN OTHERS.
          ENDCASE.

        ENDIF.
      ENDLOOP.
      CASE <fs_all_data>-view.
        WHEN '01'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sgdataup.
          ASSIGN lv_data->* TO <ft_data1>.
          <ft_data1>[] =  lt_gendata[].
        WHEN '02'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sunitup.
          ASSIGN lv_data->* TO <ft_data1>.
          <ft_data1>[] =  lt_unit[].
        WHEN '03'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/scaractup.
          ASSIGN lv_data->* TO <ft_data1>.
          <ft_data1>[] =  lt_carac[].
*        WHEN '05'.
*          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slistup.
*          ASSIGN lv_data->* TO <ft_data1>.
*          <ft_data1>[] =  lt_list[].
        WHEN '06'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sfiaup.
          ASSIGN lv_data->* TO <ft_data1>.
          <ft_data1>[] =  lt_fia[].
        WHEN '07'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sslistup.
          ASSIGN lv_data->* TO <ft_data1>.
          <ft_data1>[] =  lt_slist[].
        WHEN '08'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/ssaleup.
          ASSIGN lv_data->* TO <ft_data1>.
          <ft_data1>[] =  lt_sale[].
        WHEN '09'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slogdcup.
          ASSIGN lv_data->* TO <ft_data1>.
          <ft_data1>[] =  lt_logdc[].
        WHEN '10'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slogstoreup.
          ASSIGN lv_data->* TO <ft_data1>.
          <ft_data1>[] =  lt_logsto[].
        WHEN OTHERS.
      ENDCASE.
      APPEND INITIAL LINE TO   <f_change_data>-data ASSIGNING <f_data>.
      <f_data>-data = lv_data.
    ENDLOOP.

** appel des modif via Queue RFC
    IF lt_change_data IS NOT INITIAL.

      lv_number = lv_number + 1.
      CONCATENATE <fs_custo>-value lv_idqueue '/' lv_number INTO lv_qname.

      CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
        EXPORTING
          qin_name           = lv_qname
        EXCEPTIONS
          invalid_queue_name = 1
          OTHERS             = 2.
      IF sy-subrc EQ 0.
        lv_datatorfc = /ui2/cl_json=>serialize( EXPORTING data = lt_change_data ).

        CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_MODIF_ART'
          IN BACKGROUND TASK
          AS SEPARATE UNIT
          EXPORTING
            iv_id      = lv_id
            iv_variant = me->gv_variant
            iv_data    = lv_datatorfc
            iv_wa      = me->gv_wa
            iv_newid   = lv_newid
            iv_qname   = lv_qname.
        COMMIT WORK.
      ENDIF.
      REFRESH : lt_change_data, lrt_matnr2.
      CLEAR lv_nbart.
      UNASSIGN : <f_change_data>, <f_data>.
    ENDIF.

* Gestion queue listing
    LOOP AT ct_all_data ASSIGNING <fs_all_data>.
      CHECK <fs_all_data>-view = '05'.
      APPEND INITIAL LINE TO lt_change_data ASSIGNING <f_change_data>.
      <f_change_data>-view = <fs_all_data>-view.
      <f_change_data>-seldata = <fs_all_data>-seldata.
      UNASSIGN <ft_data>.
      FREE lv_data.
      TRY .
          ls_all_data = <fs_all_data>-data[ 1 ].
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
      IF ls_all_data IS NOT INITIAL.
        ASSIGN ls_all_data-data->* TO <ft_data>.
      ENDIF.
      CLEAR ls_all_data.
      LOOP AT <ft_data> ASSIGNING <fs_data_to_change>.
        UNASSIGN <fs_field>.

        ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data_to_change> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        IF <fs_field> IN lrt_matnr2.
          APPEND <fs_data_to_change> TO lt_list.
        ENDIF.
      ENDLOOP.
      CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slistup.
      ASSIGN lv_data->* TO <ft_data1>.
      <ft_data1>[] =  lt_list[].

      APPEND INITIAL LINE TO   <f_change_data>-data ASSIGNING <f_data>.
      <f_data>-data = lv_data.
    ENDLOOP.

    CONCATENATE <fs_custo>-value 'LIST_' lv_idqueue  INTO lv_qname.

*    CONCATENATE <fs_custo>-value lv_idqueue '*' INTO lv_qname_exist.
*
*    REFRESH lt_queue.
*    CALL FUNCTION 'TRFC_QIN_OVERVIEW_STATES'
*      EXPORTING
*        qname = lv_qname_exist
*      TABLES
*        qview = lt_queue.
*
*    IF lt_queue IS INITIAL.
*      DATA(lv_no_execute) = abap_false.
*    ELSE.
*      lv_no_execute = abap_true.
*    ENDIF.

    CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
      EXPORTING
        qin_name           = lv_qname
*       no_execute         = lv_no_execute
      EXCEPTIONS
        invalid_queue_name = 1
        OTHERS             = 2.
    IF sy-subrc EQ 0.
      lv_datatorfc = /ui2/cl_json=>serialize( EXPORTING data = lt_change_data ).

      CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_MODIF_ART'
        IN BACKGROUND TASK
        AS SEPARATE UNIT
        EXPORTING
          iv_id      = lv_id
          iv_variant = me->gv_variant
          iv_data    = lv_datatorfc
          iv_wa      = me->gv_wa
          iv_newid   = lv_newid
          iv_qname   = lv_qname.
      COMMIT WORK.
    ENDIF.

*      CALL METHOD me->change_listing_data_bis
*        EXPORTING
*          it_data    = <ft_data1>
*        CHANGING
*          ct_seldata = lt_seldata.
*    LOOP AT ct_all_data ASSIGNING <fs_all_data>.
*      CALL METHOD me->/dlwupex/if_cockpit_change_art~change_data
*        EXPORTING
**         iv_id       =
*          iv_viewname = <fs_all_data>-view
*        IMPORTING
*          ev_rc       = ev_rc
*        CHANGING
*          ct_data     = <fs_all_data>-data
*          ct_seldata  = <fs_all_data>-seldata.
*    ENDLOOP.
*
*
*    CALL FUNCTION 'MASS_SAVE_ARTICLE_USING_BAPI'
*      EXPORTING
*        seldata          = me->gt_seldata
*        testmode         = abap_false
*      IMPORTING
*        msg              = lt_msg
*      TABLES
*        smakt            = me->gt_smakt
*        smalg            = me->gt_smalg
*        smamt            = me->gt_smamt
*        smara            = me->gt_smara
*        smarc            = me->gt_smarc
*        smard            = me->gt_smard
*        smarm            = me->gt_smarm
*        smaw1            = me->gt_smaw1
*        smbew            = me->gt_smbew
*        smean            = me->gt_smean
*        smlea            = me->gt_smlea
*        smlgn            = me->gt_smlgn
*        smlgt            = me->gt_smlgt
*        smpgd            = me->gt_smpgd
*        smpop            = me->gt_smpop
*        smprw            = me->gt_smprw
*        smveg            = me->gt_smveg
*        smveu            = me->gt_smveu
*        smvke            = me->gt_smvke
*        swlk2            = me->gt_swlk2
*        smartstatus      = me->gt_smartstatus
*        ssgt_marm        = me->gt_ssgt_marm
*        ssgt_mvke        = me->gt_ssgt_mvke
*        ssgt_madka       = me->gt_ssgt_madka
*        sfsh_seasons_mat = me->gt_sfsh_seasons_mat
*        ssgt_mlgt        = me->gt_ssgt_mlgt
*        ssgt_mlgn        = me->gt_ssgt_mlgn
*        ssgt_mrp_gn      = me->gt_ssgt_mrp_gn
*        ssgt_mrp         = me->gt_ssgt_mrp.


  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~change_data.

    DATA : lv_rc TYPE sysubrc.

* recupération de données de base avant Sauvegarde
    IF iv_view = gc_fiaview.
      CALL METHOD me->read_fia_db
        EXPORTING
          it_data = ct_data.
    ENDIF.

    CALL METHOD me->(iv_method)
      EXPORTING
        it_data    = ct_data
      CHANGING
        ct_seldata = ct_seldata.
  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~check_authorization.

    DATA : lt_buoa  TYPE TABLE OF /dlwupex/tbuoa,
           lt_buoc  TYPE TABLE OF /dlwupex/tbuoc,
           lt_t001w TYPE TABLE OF t001w,
           lt_t024e TYPE TABLE OF t024e,
           lt_tvkov TYPE TABLE OF tvkov.

* Check niveau OA
    IF  it_oa IS NOT INITIAL.

      SELECT * FROM t024e INTO TABLE lt_t024e
        FOR ALL ENTRIES IN it_oa
        WHERE ekorg = it_oa-table_line.
      IF sy-subrc IS INITIAL.
        SORT lt_t024e BY ekorg.
      ENDIF.

      SELECT * FROM /dlwupex/tbuoa INTO TABLE lt_buoa
        WHERE id = me->gv_wa AND
            ckp_modif = abap_true.
      IF sy-subrc IS INITIAL.
        SORT lt_buoa BY ekorg.
      ENDIF.
      LOOP AT it_oa INTO DATA(ls_oa).
        READ TABLE lt_t024e TRANSPORTING NO FIELDS
       WITH KEY ekorg = ls_oa
       BINARY SEARCH.
        IF sy-subrc IS NOT INITIAL.
          cv_rc	= 4.
          MESSAGE ID gc_classmsg TYPE 'E' NUMBER 069 INTO cv_msg
            WITH ls_oa.
          EXIT.
        ENDIF.
        CHECK iv_check_exist_only IS INITIAL.
        READ TABLE lt_buoa TRANSPORTING NO FIELDS
        WITH KEY ekorg = ls_oa
        BINARY SEARCH.
        IF sy-subrc IS NOT INITIAL.
          cv_rc	= 4.
          MESSAGE ID gc_classmsg TYPE 'E' NUMBER 037 INTO cv_msg
             WITH ls_oa.
          EXIT.
        ENDIF.
      ENDLOOP.
    ENDIF.

    CHECK cv_rc IS INITIAL.

    IF  it_oc_cd IS NOT INITIAL.
      SELECT * FROM tvkov INTO TABLE lt_tvkov
        FOR ALL ENTRIES IN it_oc_cd
        WHERE vkorg = it_oc_cd-vkorg OR
              vtweg = it_oc_cd-vtweg.
      IF sy-subrc IS INITIAL.
        SORT lt_tvkov.
      ENDIF.

      SELECT * FROM /dlwupex/tbuoc INTO TABLE lt_buoc
       WHERE id = me->gv_wa AND
            ckp_modif = abap_true.
      IF sy-subrc IS INITIAL.
        SORT lt_buoc BY vkorg vtweg.
      ENDIF.

      LOOP AT it_oc_cd  INTO DATA(ls_oc_cd).
        IF ls_oc_cd-vtweg IS INITIAL.

          SORT lt_buoc BY vkorg vtweg.
          READ TABLE lt_tvkov TRANSPORTING NO FIELDS
            WITH KEY  vkorg = ls_oc_cd-vkorg
            BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL.
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER 071 INTO cv_msg
              WITH ls_oc_cd-vkorg.
            cv_rc	= 4.
            EXIT.
          ENDIF.

          CHECK iv_check_exist_only IS INITIAL.
          READ TABLE lt_buoc TRANSPORTING NO FIELDS
              WITH KEY vkorg = ls_oc_cd-vkorg
              BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL.
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER 070 INTO cv_msg
              WITH ls_oc_cd-vkorg.
            cv_rc	= 4.
            EXIT.
          ENDIF.
        ELSEIF ls_oc_cd-vkorg IS NOT INITIAL.
          SORT lt_buoc BY vkorg vtweg.
          READ TABLE lt_tvkov TRANSPORTING NO FIELDS
             WITH KEY  vkorg = ls_oc_cd-vkorg
                       vtweg = ls_oc_cd-vtweg
             BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL.
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER 073 INTO cv_msg
              WITH ls_oc_cd-vkorg ls_oc_cd-vtweg.
            cv_rc	= 4.
            EXIT.
          ENDIF.

          CHECK iv_check_exist_only IS INITIAL.
          READ TABLE lt_buoc TRANSPORTING NO FIELDS
             WITH KEY  vkorg = ls_oc_cd-vkorg
                       vtweg = ls_oc_cd-vtweg
             BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL.
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER 072 INTO cv_msg
              WITH ls_oc_cd-vkorg ls_oc_cd-vtweg.
            cv_rc	= 4.
            EXIT.
          ENDIF.
        ELSE. "ls_oc_cd-vkorg is INITIAL and ls_oc_cd-vtweg is not INITIAL
          SORT lt_tvkov BY vtweg.
          READ TABLE lt_tvkov TRANSPORTING NO FIELDS
                       WITH KEY vtweg = ls_oc_cd-vtweg
                       BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL.
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER 077 INTO cv_msg
              WITH ls_oc_cd-vtweg.
            cv_rc	= 4.
            EXIT.
          ENDIF.

          SORT lt_buoc BY vtweg.
          CHECK iv_check_exist_only IS INITIAL.
          READ TABLE lt_buoc TRANSPORTING NO FIELDS
             WITH KEY  vtweg = ls_oc_cd-vtweg
             BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL.
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER 076 INTO cv_msg
              WITH ls_oc_cd-vtweg.
            cv_rc	= 4.
            EXIT.
          ENDIF.
        ENDIF.

      ENDLOOP.
    ENDIF.

    CHECK cv_rc IS INITIAL.

    IF  it_plant IS NOT INITIAL.
      REFRESH lt_buoc.

      SELECT * FROM t001w INTO TABLE lt_t001w
        FOR ALL ENTRIES IN it_plant
        WHERE werks = it_plant-table_line.
      IF sy-subrc IS INITIAL.
        SORT lt_t001w.
      ENDIF.

      SELECT * FROM /dlwupex/tbuoc INTO TABLE lt_buoc
        WHERE id = me->gv_wa AND
            ckp_modif = abap_true.
      IF sy-subrc IS INITIAL.
        SORT lt_buoc BY vkorg.
      ENDIF.

      LOOP AT it_plant INTO DATA(ls_plant).
        READ TABLE lt_t001w INTO DATA(ls_t001w)
          WITH KEY werks = ls_plant
          BINARY SEARCH.
        IF sy-subrc IS NOT INITIAL.
          MESSAGE ID gc_classmsg TYPE 'E' NUMBER 075 INTO cv_msg
            WITH ls_plant.
          cv_rc	= 4.
          EXIT.
        ENDIF.


        CHECK iv_check_exist_only IS INITIAL.
        READ TABLE lt_buoc TRANSPORTING NO FIELDS
          WITH KEY vkorg = ls_t001w-vkorg
          BINARY SEARCH.
        IF sy-subrc IS NOT INITIAL.
          MESSAGE ID gc_classmsg TYPE 'E' NUMBER 074 INTO cv_msg
            WITH ls_plant.
          cv_rc	= 4.
          EXIT.
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~check_data.

*    EXIT.


    CALL METHOD /dlwupex/cl_check_modif=>get_instance
      EXPORTING
        iv_variant = me->gv_variant
        iv_wa      = me->gv_wa
      RECEIVING
        rv_object  = data(lv_object).

    IF lv_object IS NOT INITIAL.
      CALL METHOD lv_object->/dlwupex/if_check_modif~check
        EXPORTING
          iv_art              = iv_art
          iv_viewname         = iv_viewname
          iv_fieldname        = iv_fieldname
          iv_value            = iv_value
        CHANGING
          cv_rc               = cv_rc
          cv_msg              = cv_msg.

    ENDIF.


  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~control_change_inprogress.

    DATA : lv_empty TYPE syst_input,
           lv_qname TYPE trfcqnam.

    READ TABLE me->gt_tcusto ASSIGNING FIELD-SYMBOL(<fs_custo>)
        WITH KEY name = 'QUEUE_MOD_PREFIXE'
        BINARY SEARCH.
    IF <fs_custo> IS NOT ASSIGNED.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CONCATENATE <fs_custo>-value iv_id '*' INTO lv_qname.

    CALL FUNCTION 'TRFC_QIN_CHECK'
      EXPORTING
        qname  = lv_qname
      IMPORTING
        qempty = lv_empty.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

    IF lv_empty IS INITIAL.
      ev_inprogress = 'X'.
    ELSE.
      CLEAR ev_inprogress.
    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~get_data_display.


  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~get_material_limit.

    SELECT SINGLE * FROM /dlwupex/tlim_ar INTO es_limit
      WHERE wa = me->gv_wa AND
            variant = me->gv_variant.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~get_structure_orga.

    et_buoa = me->gt_tbuoa.
    et_buoc = me->gt_tbuoc.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~get_table_key.


    READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
           WITH KEY viewname = iv_viewname
           BINARY SEARCH.
    CHECK  sy-subrc IS INITIAL.
    LOOP AT me->gt_viewkey ASSIGNING FIELD-SYMBOL(<fs_viewkey>) FROM sy-tabix.
      IF <fs_viewkey>-viewname <> iv_viewname.
        EXIT.
      ENDIF.
      APPEND <fs_viewkey> TO et_keys.
    ENDLOOP.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~manage_status.

    DATA : lv_empty      TYPE syst_input,
           lt_queue      TYPE /sapapo/cif_trfcqview_tt,
           lv_qname      TYPE trfcqnam,
           lv_idqueue    TYPE char10,
           lv_qname_list TYPE trfcqnam,
           lv_inprogress TYPE xfeld,
           lv_statut     TYPE /dlwupex/emodstatus,
           lrt_qstate    TYPE RANGE OF qrfcstate,
           lrs_qstate    LIKE LINE OF lrt_qstate.

    CONSTANTS : qs_sysfail TYPE qrfcstate VALUE 'SYSFAIL',
                qs_cpicerr TYPE qrfcstate VALUE 'CPICERR'.

** On vérifie que toutes les queues sont terminées.
    lrs_qstate-sign = 'I'.
    lrs_qstate-option = 'EQ'.

    lrs_qstate-low = qs_sysfail.
    APPEND lrs_qstate TO lrt_qstate.
    lrs_qstate-low = qs_cpicerr.
    APPEND lrs_qstate TO lrt_qstate.

    READ TABLE me->gt_tcusto ASSIGNING FIELD-SYMBOL(<fs_custo>)
        WITH KEY name = 'QUEUE_MOD_PREFIXE'
        BINARY SEARCH.
    IF <fs_custo> IS NOT ASSIGNED.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '023'
         WITH '/DLWUPEX/TCUSTO'.
      EXIT.
    ENDIF.


* Verif des queues en cours.
    lv_idqueue = me->gv_id.

    SHIFT lv_idqueue LEFT DELETING LEADING '0'.

    CONCATENATE <fs_custo>-value '%' lv_idqueue '*' INTO lv_qname.

    REFRESH lt_queue.
    CALL FUNCTION 'TRFC_QIN_OVERVIEW_STATES'
      EXPORTING
        qname = lv_qname
      TABLES
        qview = lt_queue.


    SORT lt_queue BY qstate.
    DELETE lt_queue WHERE qstate IN lrt_qstate.
    DELETE lt_queue WHERE qname = iv_qname.

    IF lt_queue IS NOT INITIAL.
      lv_inprogress = 'X'.
    ELSE.
      CLEAR lv_inprogress.
    ENDIF.

* Check si queue de listing à lancer.
*    CONCATENATE <fs_custo>-value 'LIST_' lv_idqueue INTO lv_qname.
*
*    IF lv_qname <> iv_qname AND lv_inprogress IS INITIAL.
*      REFRESH lt_queue.
*      CALL FUNCTION 'TRFC_QIN_OVERVIEW_STATES'
*        EXPORTING
*          qname = lv_qname
*        TABLES
*          qview = lt_queue.
*
*      IF lt_queue IS NOT INITIAL.
*        CALL FUNCTION 'TRFC_QIN_RESET_LUW'
*          EXPORTING
*            qname                          = lv_qname
**           TID                            =
**           ALL_LUWS                       = ' '
**           NO_COMMIT                      = ' '
*          EXCEPTIONS
*            invalid_parameter              = 1
*            reset_of_runningstate_rejected = 2
*            OTHERS                         = 3.
*        IF sy-subrc <> 0.
** Implement suitable error handling here
*        ENDIF.
*        COMMIT WORK AND WAIT.
*        EXIT. " la gestion des status sera alors fait par la queue de listing
*      ENDIF.
*    ENDIF.

** si certaines tournent encore; le statut reste en cours
* sinon on regarde si des erreurs existent pour mettre le bon statut
    CLEAR lv_statut.
    SELECT COUNT(*) UP TO 1 ROWS
        FROM /dlwupex/tcont_p
      WHERE id = me->gv_id.
    IF sy-subrc IS INITIAL. "" erreur existe
      lv_statut = gc_statuserror.
    ELSEIF lv_inprogress IS INITIAL. " plus rien en cours
      IF iv_newid IS NOT INITIAL.
        lv_statut = gc_statusfinish.
      ELSE.
        lv_statut = gc_statusretried.
      ENDIF.
    ENDIF.

    CHECK lv_statut IS NOT INITIAL.

    UPDATE /dlwupex/tcont_h SET statut = lv_statut
      WHERE id = me->gv_id.


  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~save_errors.

    DATA : lv_matnr TYPE matnr,
           lv_line  TYPE /dlwupex/elineid.

    CHECK me->gt_cont_p IS NOT INITIAL.
    SORT me->gt_cont_p.
    DELETE ADJACENT DUPLICATES FROM me->gt_cont_p.

    LOOP AT me->gt_cont_p ASSIGNING FIELD-SYMBOL(<fs_cont_p>).
      IF <fs_cont_p>-material <> lv_matnr.
        lv_line = 1.
      ENDIF.
      <fs_cont_p>-line = lv_line.
      lv_matnr = <fs_cont_p>-material.
      lv_line = lv_line + 1.

    ENDLOOP.

    INSERT /dlwupex/tcont_p FROM TABLE me->gt_cont_p.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_change_art~set_id.

    me->gv_id = iv_id.

  ENDMETHOD.


  METHOD available_variant.

    DATA : lr_range  TYPE piq_selopt_t,
           lrs_range TYPE selopt.
    DATA : lr_range_gr  TYPE piq_selopt_t,
           lrs_range_gr TYPE selopt.
    DATA : lr_range_role  TYPE RANGE OF agr_name,
           lrs_range_role LIKE LINE OF lr_range_role.
    DATA : lt_agr_users TYPE TABLE OF agr_users.


    SELECT * FROM /dlwupex/tusergr INTO TABLE @DATA(lt_usergr). "#EC CI_NOWHERE

    SELECT * FROM /dlwupex/tvar_h INTO  TABLE @DATA(lt_var_h)
      WHERE work_area = @iv_wa.

    SELECT * INTO TABLE @DATA(lt_variant_au)       "#EC CI_NO_TRANSFORM
      FROM /dlwupex/tvar_au
      FOR ALL ENTRIES IN @lt_var_h
      WHERE variant = @lt_var_h-variant.

    SELECT agr_name INTO TABLE @DATA(lt_roles)
      FROM agr_define.


    SORT : lt_usergr, lt_var_h, lt_variant_au BY variant.

    LOOP AT lt_var_h ASSIGNING FIELD-SYMBOL(<fs_var_h>).
      READ TABLE lt_variant_au
      TRANSPORTING NO FIELDS
        WITH KEY variant = <fs_var_h>-variant.
      IF sy-subrc IS INITIAL.
        REFRESH lr_range.
        LOOP AT lt_variant_au ASSIGNING FIELD-SYMBOL(<fs_variant_au>) FROM sy-tabix.
          IF <fs_variant_au>-variant <> <fs_var_h>-variant.
            EXIT.
          ENDIF.

*          IF iv_user IN lr_range AND lr_range IS NOT INITIAL.
*            APPEND <fs_variant_au>-variant TO et_variant.
*          ENDIF.

          IF <fs_variant_au>-sign_role_user IS NOT INITIAL.
            REFRESH lr_range_role.
*            DATA(lv_sign) = <fs_variant_au>-sign_group_user.
            lrs_range_role-sign = 'I'.
            lrs_range_role-option = <fs_variant_au>-option_role_user.
            lrs_range_role-low = <fs_variant_au>-role_low.
            lrs_range_role-high = <fs_variant_au>-role_high.
            APPEND lrs_range_role TO lr_range_role.
            LOOP AT lt_roles ASSIGNING FIELD-SYMBOL(<fs_role>) WHERE agr_name IN lr_range_role.
              REFRESH lt_agr_users.
              CALL FUNCTION '/SDF/READ_USER_ASSIGNMENT'
                EXPORTING
                  activity_group    = <fs_role>-agr_name
*                 TIME_COMPARE      =
                TABLES
                  i_agr_users       = lt_agr_users
                EXCEPTIONS
                  no_data_available = 1
                  OTHERS            = 2.
              IF sy-subrc <> 0.
* Implement suitable error handling here
              ENDIF.
              IF lt_agr_users IS NOT INITIAL .
                LOOP AT lt_agr_users ASSIGNING FIELD-SYMBOL(<fs_agr_users>).
                  lrs_range-sign = <fs_variant_au>-sign_role_user.
                  lrs_range-option = 'EQ'.
                  lrs_range-low = <fs_agr_users>-uname.
                  APPEND lrs_range TO lr_range.
                ENDLOOP.
              ENDIF.


            ENDLOOP.
          ENDIF.

          IF <fs_variant_au>-sign_group_user IS NOT INITIAL.
            REFRESH lr_range_gr.
*            DATA(lv_sign) = <fs_variant_au>-sign_group_user.
            lrs_range_gr-sign = 'I'. "<fs_variant_au>-sign_group_user.
            lrs_range_gr-option = <fs_variant_au>-option_group_user.
            lrs_range_gr-low = <fs_variant_au>-group_user_low.
            lrs_range_gr-high = <fs_variant_au>-group_user_high.
            APPEND lrs_range_gr TO lr_range_gr.
            LOOP AT lt_usergr ASSIGNING FIELD-SYMBOL(<fs_usergr>).
              IF <fs_usergr>-group_user IN lr_range_gr.
                lrs_range-sign = <fs_variant_au>-sign_group_user.
                lrs_range-option = 'EQ'.
                lrs_range-low = <fs_usergr>-username.
                APPEND lrs_range TO lr_range.
              ENDIF.
            ENDLOOP.
          ENDIF.
*          ELSE.
          IF <fs_variant_au>-sign_user IS NOT INITIAL.
            lrs_range-sign = <fs_variant_au>-sign_user.
            lrs_range-option = <fs_variant_au>-option_user.
            lrs_range-low = <fs_variant_au>-user_low.
            lrs_range-high = <fs_variant_au>-user_high.
            APPEND lrs_range TO lr_range.
          ENDIF.
*          ENDIF.


*          LOOP AT lt_usergr ASSIGNING FIELD-SYMBOL(<fs_usergr>).
*            REFRESH lr_range.
*            IF <fs_variant_au>-sign_group_user IS NOT INITIAL.
*              lrs_range-sign = <fs_variant_au>-sign_group_user.
*              lrs_range-option = <fs_variant_au>-option_group_user.
*              lrs_range-low = <fs_variant_au>-group_user_low.
*              lrs_range-high = <fs_variant_au>-group_user_high.
*              APPEND lrs_range TO lr_range.
*            ENDIF.
*
*            IF <fs_usergr>-group_user IN lr_range AND lr_range IS NOT INITIAL.
*              APPEND <fs_variant_au>-variant TO et_variant.
*            ENDIF.
*
*          ENDLOOP.

        ENDLOOP.
        SORT lr_range.
        DELETE ADJACENT DUPLICATES FROM lr_range.
        IF iv_user IN lr_range AND lr_range IS NOT INITIAL.
          APPEND <fs_var_h>-variant TO et_variant.
        ENDIF.
      ELSE.
        APPEND <fs_var_h>-variant TO et_variant.
      ENDIF.
    ENDLOOP.

    SORT   et_variant.
    DELETE ADJACENT DUPLICATES FROM et_variant.

  ENDMETHOD.


  METHOD change_caract_data.

    TYPES : BEGIN OF ty_charval,
              matnr TYPE matnr,
              atinn TYPE atinn,
              atzhl TYPE atzhl,
              atwrt TYPE atwrt,
              atflv TYPE atflv,
            END OF ty_charval.

    DATA:
      lr_numdata TYPE REF TO data.
    FIELD-SYMBOLS:
      <any>   TYPE any.

    DATA : ls_ausp       TYPE bapie1ausprt,
           lt_ausp       TYPE bapie1ausprt_tab,
           ls_auspx      TYPE bapie1ausprtx,
           lt_auspx      TYPE bapie1ausprtx_tab,
           lrt_matnr     TYPE RANGE OF matnr,
           lrs_matnr     LIKE LINE OF lrt_matnr,
           ls_headdata   TYPE bapie1mathead,
           ls_cont_p     TYPE /dlwupex/tcont_p,
           lt_charval    TYPE TABLE OF ty_charval,
           lt_charval_bd TYPE TABLE OF ty_charval,
           ls_charval    TYPE ty_charval,
           lt_lognumbers TYPE szal_lognumbers,
           ls_lognumbers TYPE szal_lognumber,
           lt_message    TYPE TABLE OF balm,
           ls_message    TYPE balm,
           lv_string     TYPE char22,
           ls_return     TYPE bapireturn1.

    DATA : lv_name      TYPE syuname,
           lv_numformat TYPE val_text.

    FIELD-SYMBOLS: <fs_field> TYPE any,
                   <st_data>  TYPE any.
    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    lv_name = sy-uname.
    CALL FUNCTION '/OSP/GET_DECIMAL_NOTATION'
      EXPORTING
        i_uname = lv_name
      IMPORTING
*       ET_RETURN                 =
*       EV_DECIMAL_NOTATION       =
        ev_text = lv_numformat.


    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.

    LOOP AT it_data ASSIGNING <st_data>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_charval-matnr = <fs_field>.
      lrs_matnr-low = <fs_field>.
      APPEND lrs_matnr TO lrt_matnr.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'ATINN' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      CALL FUNCTION 'CONVERSION_EXIT_ATINN_INPUT'
        EXPORTING
          input  = <fs_field>
        IMPORTING
          output = ls_charval-atinn.

*      ls_charval-atinn = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'ATWRT' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_charval-atwrt = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'STATUS' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED.
      IF <fs_field> = '02'.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'ATZHL' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK <fs_field> IS  ASSIGNED.
        ls_charval-atzhl = <fs_field>.
      ELSE.
        CLEAR ls_charval-atzhl.
      ENDIF.

      APPEND ls_charval TO lt_charval.

    ENDLOOP.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.

    IF lrt_matnr IS NOT INITIAL.
      SELECT m~matnr
                atinn
                atzhl
                atwrt
                atflv
        FROM ( ( mara AS m
            INNER JOIN inob AS i ON m~matnr = i~objek )
            INNER JOIN ausp AS a ON i~cuobj = a~objek )
            INTO TABLE lt_charval_bd
                 WHERE m~matnr IN lrt_matnr
                   AND a~klart = '026'.
    ENDIF.
    SORT : lt_charval, lt_charval_bd.

    SELECT atinn, atfor, anzst, anzdz, atein
        FROM cabn INTO TABLE @DATA(lt_cabn)
      WHERE atnam like 'Z%'.
    SORT  lt_cabn BY  atinn.

    LOOP AT lrt_matnr INTO lrs_matnr.
      REFRESH : lt_ausp, lt_auspx.
      CLEAR:  ls_headdata, ls_return.
      ls_headdata-material = lrs_matnr-low.
      ls_headdata-function = '005'.
      ls_headdata-basic_view = abap_true.

      READ TABLE lt_charval_bd TRANSPORTING NO FIELDS
        WITH KEY matnr = lrs_matnr-low
          BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_charval_bd ASSIGNING FIELD-SYMBOL(<fs_charval_bd>) FROM sy-tabix.
          IF lrs_matnr-low <> <fs_charval_bd>-matnr.
            EXIT.
          ENDIF.
          CLEAR : ls_ausp, ls_auspx.
          READ TABLE lt_charval ASSIGNING FIELD-SYMBOL(<fs_charval>)
            WITH KEY matnr = <fs_charval_bd>-matnr
                     atinn = <fs_charval_bd>-atinn
                     atzhl = <fs_charval_bd>-atzhl
                     BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            ls_ausp-material = ls_ausp-material_long = ls_auspx-material = ls_auspx-material_long = <fs_charval>-matnr.

            CALL FUNCTION 'CONVERSION_EXIT_ATINN_OUTPUT'
              EXPORTING
                input  = <fs_charval_bd>-atinn
              IMPORTING
                output = ls_ausp-char_name.
            ls_auspx-char_name = ls_ausp-char_name.

            READ TABLE lt_cabn INTO DATA(ls_cabn)
            WITH KEY atinn = <fs_charval_bd>-atinn
            BINARY SEARCH.
            IF ls_cabn-atfor = 'NUM'.
              CREATE DATA lr_numdata TYPE p LENGTH ls_cabn-anzst DECIMALS ls_cabn-anzdz.
              ASSIGN lr_numdata->* TO <any>.
              REPLACE ',' WITH '.' INTO <fs_charval>-atwrt.
              <any> = <fs_charval>-atwrt.
              ls_ausp-char_value = <any>.
              IF lv_numformat+9(1) = '.'.
                REPLACE ',' WITH '.' INTO ls_ausp-char_value.
              ELSE.
                REPLACE '.' WITH ',' INTO ls_ausp-char_value.
              ENDIF.
            ELSE.
              ls_ausp-char_value = <fs_charval>-atwrt.
            ENDIF.

            ls_auspx-char_value = 'X'.
            IF <fs_charval>-atwrt IS INITIAL.
              ls_ausp-char_value = <fs_charval_bd>-atwrt.
              ls_ausp-function = ls_auspx-function = '003'.
              APPEND ls_ausp TO lt_ausp.
              APPEND ls_auspx TO lt_auspx.
            ELSE.
              READ TABLE lt_cabn INTO ls_cabn
                WITH KEY atinn = <fs_charval>-atinn
                BINARY SEARCH.
              IF ls_cabn-atein <> abap_true.
                ls_ausp-char_value = <fs_charval_bd>-atwrt.
                ls_ausp-function = ls_auspx-function = '003'.
                APPEND ls_ausp TO lt_ausp.
                APPEND ls_auspx TO lt_auspx.

                ls_ausp-char_value = <fs_charval>-atwrt.
                ls_ausp-function = ls_auspx-function = '009'.
                APPEND ls_ausp TO lt_ausp.
                APPEND ls_auspx TO lt_auspx.
              ELSE.
                ls_ausp-function = ls_auspx-function = '005'.
                APPEND ls_ausp TO lt_ausp.
                APPEND ls_auspx TO lt_auspx.
              ENDIF.
            ENDIF.



          ELSE.
            ls_ausp-material = ls_ausp-material_long = ls_auspx-material = ls_auspx-material_long = <fs_charval_bd>-matnr.
            CALL FUNCTION 'CONVERSION_EXIT_ATINN_OUTPUT'
              EXPORTING
                input  = <fs_charval_bd>-atinn
              IMPORTING
                output = ls_ausp-char_name.
            ls_auspx-char_name = ls_ausp-char_name.

            READ TABLE lt_cabn INTO ls_cabn
            WITH KEY atinn = <fs_charval_bd>-atinn
            BINARY SEARCH.
            IF ls_cabn-atfor = 'NUM'.
              UNASSIGN <any>.
              CREATE DATA lr_numdata TYPE p LENGTH ls_cabn-anzst DECIMALS ls_cabn-anzdz.
              ASSIGN lr_numdata->* TO <any>.

              CALL FUNCTION 'FLTP_CHAR_CONVERSION'
                EXPORTING
                  decim = 16
                  input = <fs_charval_bd>-atflv
                IMPORTING
                  flstr = lv_string.

              REPLACE ',' WITH '.' INTO lv_string.
              <any> = lv_string.
              ls_ausp-char_value = <any>.
              IF lv_numformat+9(1) = '.'.
                REPLACE ',' WITH '.' INTO ls_ausp-char_value.
              ELSE.
                REPLACE '.' WITH ',' INTO ls_ausp-char_value.
              ENDIF.
            ELSE.
              ls_ausp-char_value = <fs_charval_bd>-atwrt.
            ENDIF.
            ls_auspx-char_value = 'X'.
            ls_ausp-function = ls_auspx-function = '005'.
            APPEND ls_ausp TO lt_ausp.
            APPEND ls_auspx TO lt_auspx.
          ENDIF.


        ENDLOOP.
      ENDIF.
      READ TABLE lt_charval TRANSPORTING NO FIELDS
        WITH KEY matnr = lrs_matnr-low
          BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_charval ASSIGNING <fs_charval> FROM sy-tabix.
          IF lrs_matnr-low <> <fs_charval>-matnr.
            EXIT.
          ENDIF.

          CHECK <fs_charval>-atzhl IS INITIAL.
          CLEAR : ls_ausp, ls_auspx.

          ls_ausp-material = ls_ausp-material_long = ls_auspx-material = ls_auspx-material_long = <fs_charval>-matnr.
          CALL FUNCTION 'CONVERSION_EXIT_ATINN_OUTPUT'
            EXPORTING
              input  = <fs_charval>-atinn
            IMPORTING
              output = ls_ausp-char_name.

          READ TABLE lt_cabn INTO ls_cabn
            WITH KEY atinn = <fs_charval>-atinn
            BINARY SEARCH.
          IF ls_cabn-atein = abap_true.
            READ TABLE lt_ausp ASSIGNING FIELD-SYMBOL(<fs_ausp>)
              WITH KEY
              material = ls_ausp-material
              char_name = ls_ausp-char_name.
            IF sy-subrc IS INITIAL.
              <fs_ausp>-char_value = <fs_charval>-atwrt.
            ELSE.
              ls_auspx-char_name = ls_ausp-char_name.
              ls_ausp-char_value = <fs_charval>-atwrt.
              ls_auspx-char_value = 'X'.

              ls_ausp-function = ls_auspx-function = '005'.
              APPEND ls_ausp TO lt_ausp.
              APPEND ls_auspx TO lt_auspx.
            ENDIF.
          ELSE.
            ls_auspx-char_name = ls_ausp-char_name.
            ls_ausp-char_value = <fs_charval>-atwrt.
            ls_auspx-char_value = 'X'.

            ls_ausp-function = ls_auspx-function = '005'.
            APPEND ls_ausp TO lt_ausp.
            APPEND ls_auspx TO lt_auspx.
          ENDIF.
        ENDLOOP.
      ENDIF.

      CALL FUNCTION 'BAPI_MATERIAL_MAINTAINDATA_RT'
        EXPORTING
          headdata             = ls_headdata
        IMPORTING
          return               = ls_return
        TABLES
          characteristicvalue  = lt_ausp
          characteristicvaluex = lt_auspx.

      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        EXPORTING
          wait = abap_true.

      IF ls_return-type = 'E'.
        IF ls_return-log_no IS NOT INITIAL.

          ls_lognumbers-item = ls_return-log_no.
          APPEND ls_lognumbers TO lt_lognumbers.

          CALL FUNCTION 'APPL_LOG_READ_DB_WITH_LOGNO'
            TABLES
              lognumbers = lt_lognumbers
              messages   = lt_message.
          DELETE lt_message WHERE msgty <> 'E'.
          LOOP AT lt_message ASSIGNING FIELD-SYMBOL(<fs_message>).
            ls_cont_p-id = me->gv_id.
            ls_cont_p-material = ls_headdata-material.
            ls_cont_p-idmsg = <fs_message>-msgid.
            ls_cont_p-type = <fs_message>-msgty.
            ls_cont_p-num = <fs_message>-msgno.
            ls_cont_p-message_v1 = <fs_message>-msgv1.
            ls_cont_p-message_v2 = <fs_message>-msgv2.
            ls_cont_p-message_v3 = <fs_message>-msgv3.
            ls_cont_p-message_v4 = <fs_message>-msgv4.

            MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
               INTO ls_cont_p-message WITH ls_cont_p-message_v1 ls_cont_p-message_v2
                                        ls_cont_p-message_v3 ls_cont_p-message_v4.

            APPEND ls_cont_p TO me->gt_cont_p.
          ENDLOOP.
        ELSE.
          ls_cont_p-id = me->gv_id.
          ls_cont_p-material = ls_headdata-material.
          ls_cont_p-type = ls_return-type.
          ls_cont_p-idmsg = ls_return-id.
          ls_cont_p-num = ls_return-number.
          ls_cont_p-message_v1 = ls_return-message_v1.
          ls_cont_p-message_v2 = ls_return-message_v2.
          ls_cont_p-message_v3 = ls_return-message_v3.
          ls_cont_p-message_v4 = ls_return-message_v4.
          ls_cont_p-message = ls_return-message.

          APPEND ls_cont_p TO me->gt_cont_p.
        ENDIF.
      ENDIF.

    ENDLOOP.


  ENDMETHOD.


  METHOD change_ean_data.

    TYPES : BEGIN OF ty_ean,
              matnr TYPE matnr,
              meinh TYPE meinh,
              lfnum TYPE lfnum,
              ean11 TYPE ean11,
              eantp TYPE numtp,
              hpean TYPE hpean,
            END OF ty_ean.

    DATA : lrt_matnr    TYPE RANGE OF matnr,
           lrs_matnr    LIKE LINE OF lrt_matnr,
           lt_ean       TYPE TABLE OF ty_ean,
           ls_ean       TYPE ty_ean,
           ls_mean      TYPE mean,
           lt_mean_del  TYPE TABLE OF mean,
           lt_marm_del  TYPE TABLE OF marm,
           ls_marm      TYPE marm,
           lv_matnr     TYPE matnr,
           lv_meinh     TYPE meinh,
           ls_seldata   TYPE mass_wa_tabdata,
           lt_key_field TYPE mass_fieldtab,
           lv_field     TYPE ddobjname,
           lt_field     TYPE mass_fieldtab.

    FIELD-SYMBOLS <fs_field> TYPE any.

    REFRESH ct_mean.

* Alim seldata pour MEAN et MARM
    SORT ct_seldata.
    READ TABLE ct_seldata ASSIGNING FIELD-SYMBOL(<fs_seldata>)
      WITH KEY tabname-name = 'MARM'
      BINARY SEARCH.
    IF sy-subrc IS NOT INITIAL.
      READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
              WITH KEY viewname = gc_unitview
                       tabname = 'MARM'
              BINARY SEARCH.
      LOOP AT me->gt_viewkey ASSIGNING FIELD-SYMBOL(<fs_viewkey>) FROM sy-tabix.
        CHECK <fs_viewkey>-keyfield = 'X'.
        IF <fs_viewkey>-viewname <> gc_unitview OR <fs_viewkey>-tabname <> 'MARM'.
          EXIT.
        ENDIF.
        lv_field = <fs_viewkey>-fieldname.
        APPEND lv_field TO lt_key_field.

      ENDLOOP.
      APPEND 'MEINH' TO lt_field.
      APPEND 'EAN11' TO lt_field.
      APPEND 'NUMTP' TO lt_field.
      ls_seldata-tabname-name = ls_seldata-tabname-name_db = 'MARM'.
      ls_seldata-tabname-no_newseg = abap_true.
      ls_seldata-keyfieldnames = lt_key_field.
      ls_seldata-fieldnames = lt_field.
      APPEND ls_seldata TO ct_seldata.
    ELSE.
      APPEND 'MEINH' TO <fs_seldata>-fieldnames.
      APPEND 'EAN11' TO <fs_seldata>-fieldnames.
      APPEND 'NUMTP' TO <fs_seldata>-fieldnames.
      SORT <fs_seldata>-fieldnames.
      DELETE ADJACENT DUPLICATES FROM <fs_seldata>-fieldnames.
    ENDIF.

    SORT ct_seldata.
    READ TABLE ct_seldata ASSIGNING <fs_seldata>
      WITH KEY tabname-name = 'MEAN'
      BINARY SEARCH.
    IF sy-subrc IS NOT INITIAL.
      READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
              WITH KEY viewname = gc_unitview
                       tabname = 'MEAN'
              BINARY SEARCH.
      LOOP AT me->gt_viewkey ASSIGNING <fs_viewkey> FROM sy-tabix.
        CHECK <fs_viewkey>-keyfield = 'X'.
        IF <fs_viewkey>-viewname <> gc_unitview OR <fs_viewkey>-tabname <> 'MEAN'.
          EXIT.
        ENDIF.
        lv_field = <fs_viewkey>-fieldname.
        APPEND lv_field TO lt_key_field.

      ENDLOOP.
      APPEND 'MEINH' TO lt_field.
      APPEND 'EAN11' TO lt_field.
      APPEND 'EANTP' TO lt_field.
      APPEND 'HPEAN' TO lt_field.
      ls_seldata-tabname-name = ls_seldata-tabname-name_db = 'MEAN'.
      ls_seldata-tabname-no_newseg = abap_true.
      ls_seldata-keyfieldnames = lt_key_field.
      ls_seldata-fieldnames = lt_field.
      APPEND ls_seldata TO ct_seldata.
    ELSE.
      APPEND 'MEINH' TO <fs_seldata>-fieldnames.
      APPEND 'EAN11' TO <fs_seldata>-fieldnames.
      APPEND 'EANTP' TO <fs_seldata>-fieldnames.
      APPEND 'HPEAN' TO <fs_seldata>-fieldnames.
      SORT <fs_seldata>-fieldnames.
      DELETE ADJACENT DUPLICATES FROM <fs_seldata>-fieldnames.
    ENDIF.

    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<fs_data>).
      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED AND <fs_field> IS NOT INITIAL.
      lrs_matnr-low = <fs_field>.
      APPEND lrs_matnr TO lrt_matnr.

      ls_ean-matnr = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MEINH' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED.
      ls_ean-meinh = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'STATUS' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED.
      IF <fs_field> = '02'.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'LFNUM' OF STRUCTURE <fs_data> TO <fs_field>.
        CHECK <fs_field> IS  ASSIGNED.
        ls_ean-lfnum = <fs_field>.
      ELSE.
        CLEAR ls_ean-lfnum.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'EAN11' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED.
      ls_ean-ean11 = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'EANTP' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED.
      ls_ean-eantp = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'HPEAN' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED.
      ls_ean-hpean = <fs_field>.
      APPEND ls_ean TO lt_ean.

    ENDLOOP.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.

    IF lrt_matnr IS NOT INITIAL.
      SELECT * FROM mean INTO TABLE @DATA(lt_mean)
          WHERE matnr IN @lrt_matnr.

      SELECT * FROM marm INTO TABLE @DATA(lt_marm)
          WHERE matnr IN @lrt_matnr.
    ENDIF.
    SORT : lt_ean,
           lt_mean BY matnr meinh,
           lt_marm BY matnr meinh.

    SORT : ct_marm.
    DELETE ADJACENT DUPLICATES FROM ct_marm COMPARING matnr meinh.

* si EAN modifié dans on le reprend
    LOOP AT lt_mean ASSIGNING FIELD-SYMBOL(<fs_mean>).

      READ TABLE lt_ean INTO ls_ean WITH KEY
                  matnr = <fs_mean>-matnr
                  meinh = <fs_mean>-meinh
                  lfnum = <fs_mean>-lfnum
                  BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        IF ls_ean-eantp IS NOT INITIAL.
          MOVE-CORRESPONDING ls_ean TO ls_mean.
          CLEAR ls_mean-lfnum.
          APPEND ls_mean TO ct_mean.
        ENDIF.
        IF <fs_mean>-hpean IS NOT INITIAL AND ls_ean-ean11 IS INITIAL.
          READ TABLE lt_ean INTO DATA(ls_ean2) WITH KEY
                  matnr = <fs_mean>-matnr
                  meinh = <fs_mean>-meinh
                  hpean = abap_true.
          IF sy-subrc IS NOT INITIAL OR ls_ean2-ean11 IS INITIAL.
            MOVE-CORRESPONDING <fs_mean> TO ls_marm.
            CLEAR : ls_marm-numtp, ls_marm-ean11.
            APPEND ls_marm TO lt_marm_del.
          ELSE.
            MOVE-CORRESPONDING <fs_mean> TO ls_mean.
            CLEAR :  ls_mean-eantp, ls_mean-hpean.
            APPEND ls_mean TO lt_mean_del.
          ENDIF.
        ELSE.
          MOVE-CORRESPONDING <fs_mean> TO ls_mean.
          CLEAR ls_mean-eantp.
          APPEND ls_mean TO lt_mean_del.
        ENDIF.
        IF <fs_mean>-hpean IS NOT INITIAL AND ls_ean-hpean IS INITIAL.
          READ TABLE ct_marm TRANSPORTING NO FIELDS
          WITH KEY matnr = <fs_mean>-matnr
                   meinh = <fs_mean>-meinh
                   ean11 = ls_ean-ean11
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DELETE ct_marm INDEX sy-tabix.
          ENDIF.
        ENDIF.
      ELSE.
        READ TABLE lt_ean TRANSPORTING NO FIELDS
         WITH KEY
            matnr = <fs_mean>-matnr
            meinh = <fs_mean>-meinh
            BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          MOVE-CORRESPONDING <fs_mean> TO ls_mean.
          APPEND ls_mean TO ct_mean.
        ENDIF.
      ENDIF.

    ENDLOOP.

* si EAN créé dans on le reprend
    DELETE lt_ean WHERE lfnum IS NOT INITIAL.
    REFRESH lt_mean.
    MOVE-CORRESPONDING lt_ean TO lt_mean.
    APPEND LINES OF lt_mean TO ct_mean.

    SORT ct_mean BY matnr meinh.
    SORT : lt_marm_del, lt_mean_del.
* Si EAN unique pour article/unité ou principal, alors table MARM, sinon table MEAN
    LOOP AT ct_mean ASSIGNING <fs_mean>.

      DATA(lv_tabix) = sy-tabix + 1.
      DATA(lv_tabix2) = sy-tabix.

      READ TABLE ct_mean INTO DATA(ls_mean_bis) INDEX lv_tabix.
* si une seule ligne pour article/unité ( la précédente et la suivante sont différente )
* ou EAN principal
      IF (
        ( ls_mean_bis-matnr <> <fs_mean>-matnr OR
          ls_mean_bis-meinh <> <fs_mean>-meinh ) AND
        ( lv_matnr <> <fs_mean>-matnr OR
          lv_meinh <> <fs_mean>-meinh )
        )
        OR <fs_mean>-hpean IS NOT INITIAL.

*        IF ls_mean_bis-hpean IS NOT INITIAL AND
*            ls_mean_bis-matnr = <fs_mean>-matnr AND
*            ls_mean_bis-meinh = <fs_mean>-meinh.
*          CLEAR <fs_mean>-hpean.
*          IF <fs_mean> IS ASSIGNED.
*            lv_matnr = <fs_mean>-matnr.
*            lv_meinh = <fs_mean>-meinh.
*          ENDIF.
*
*          CLEAR ls_mean_bis.
*          CONTINUE.
*        ENDIF.

        READ TABLE ct_marm ASSIGNING FIELD-SYMBOL(<fs_marm>)
          WITH KEY matnr = <fs_mean>-matnr
                   meinh = <fs_mean>-meinh
                    BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          " modif MARM
          MOVE-CORRESPONDING <fs_mean> TO <fs_marm>.
          MOVE <fs_mean>-eantp TO <fs_marm>-numtp.
          IF  <fs_marm>-numtp IS INITIAL.
            CLEAR <fs_marm>-ean11.
          ENDIF.
          READ TABLE lt_marm_del TRANSPORTING NO FIELDS
            WITH KEY matnr = <fs_mean>-matnr
                     meinh = <fs_mean>-meinh
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DELETE lt_marm_del INDEX sy-tabix.
          ENDIF.
          lv_matnr = <fs_mean>-matnr.
          lv_meinh = <fs_mean>-meinh.
          DELETE ct_mean INDEX lv_tabix2.
        ELSE.
          "ajout dans marm
          READ TABLE lt_marm ASSIGNING FIELD-SYMBOL(<fs_marm_db>)
            WITH KEY matnr = <fs_mean>-matnr
                     meinh = <fs_mean>-meinh
                      BINARY SEARCH.
          IF sy-subrc IS INITIAL AND <fs_marm_db> IS ASSIGNED.
            MOVE-CORRESPONDING <fs_marm_db> TO ls_marm.
          ENDIF.
          MOVE-CORRESPONDING <fs_mean> TO ls_marm.
          MOVE <fs_mean>-eantp TO ls_marm-numtp.
          IF  ls_marm-numtp IS INITIAL.
            CLEAR ls_marm-ean11.
          ENDIF.
*          INSERT ls_marm INTO ct_marm INDEX sy-tabix.
          APPEND ls_marm TO ct_marm.
          READ TABLE lt_marm_del TRANSPORTING NO FIELDS
            WITH KEY matnr = <fs_mean>-matnr
                     meinh = <fs_mean>-meinh
                      BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DELETE lt_marm_del INDEX sy-tabix.
          ENDIF.
          lv_matnr = <fs_mean>-matnr.
          lv_meinh = <fs_mean>-meinh.
          DELETE ct_mean INDEX lv_tabix2.
        ENDIF.

      ENDIF.

      IF <fs_mean> IS ASSIGNED.
        lv_matnr = <fs_mean>-matnr.
        lv_meinh = <fs_mean>-meinh.
      ENDIF.

      CLEAR ls_mean_bis.
    ENDLOOP.

    IF lt_mean_del IS NOT INITIAL.
      APPEND LINES OF lt_mean_del TO ct_mean.
    ENDIF.
    IF lt_marm_del IS NOT INITIAL.
      APPEND LINES OF lt_marm_del TO ct_marm.
    ENDIF.

  ENDMETHOD.


  METHOD change_fia_data.

    TYPES : BEGIN OF ty_fia.
              INCLUDE TYPE wdsd_eina_eine_sty.
              INCLUDE TYPE inco_l.
            TYPES :
                      iseina TYPE char01,
                    END OF ty_fia.

    DATA : ls_eine     TYPE eine,
           ls_eine_old TYPE eine,
           ls_eine_ex  TYPE eine,
           ls_eina     TYPE eina,
           ls_eina_old TYPE eina,
           ls_eina_ex  TYPE eina,
           ls_cont_p   TYPE /dlwupex/tcont_p,
           lrt_matnr   TYPE RANGE OF matnr,
           lrs_matnr   LIKE LINE OF lrt_matnr,
           ls_fia      TYPE ty_fia,
           lt_fia      TYPE TABLE OF ty_fia.


    FIELD-SYMBOLS: <fs_field>  TYPE any,
                   <fs_field2> TYPE any,
                   <st_data>   TYPE any.
    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.

    LOOP AT it_data ASSIGNING <st_data>.

* Ligne EINA ou EINE ?
      UNASSIGN : <fs_field>.
      ASSIGN COMPONENT 'ISEINA' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_fia-iseina = <fs_field>."

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_fia-matnr = <fs_field>.
      lrs_matnr-low = <fs_field>.
      APPEND lrs_matnr TO lrt_matnr.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'LIFNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_fia-lifnr = <fs_field>."

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'INFNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_fia-infnr = <fs_field>."

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'EKORG' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_fia-ekorg = <fs_field>."

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'ESOKZ' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_fia-esokz = <fs_field>."

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'WERKS' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_fia-werks = <fs_field>."


      READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
        WITH KEY variant = me->gv_variant
                 viewname = gc_fiaview
        BINARY SEARCH.
      LOOP AT me->gt_tvar_p ASSIGNING FIELD-SYMBOL(<fs_tvar_p>) FROM sy-tabix.
        IF <fs_tvar_p>-viewname <> gc_fiaview OR
           <fs_tvar_p>-variant <> me->gv_variant.
          EXIT.
        ENDIF.

        UNASSIGN : <fs_field>, <fs_field2>.
        ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE <st_data> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_fia TO <fs_field2>.
        CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
        <fs_field2> = <fs_field>."

      ENDLOOP.

      IF ls_fia-waers IS INITIAL.
        UNASSIGN : <fs_field>.
        ASSIGN COMPONENT 'KONWA' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_fia-waers = <fs_field>.
      ENDIF.

      APPEND ls_fia TO lt_fia.

    ENDLOOP.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.

    IF lrt_matnr IS NOT INITIAL.
      SELECT matnr, matkl FROM mara
        INTO TABLE @DATA(lt_mara)
        WHERE matnr IN @lrt_matnr.

      SELECT matnr, meinh, umrez, umren FROM marm
        INTO TABLE @DATA(lt_unit)
        WHERE matnr IN @lrt_matnr.
    ENDIF.

    SORT : lt_unit, lt_mara.
    SORT lt_fia BY infnr iseina.

    LOOP AT lt_fia INTO ls_fia.

      CLEAR : ls_eine, ls_eina.

      IF ls_fia-iseina IS NOT INITIAL. " modif EINA
        IF  ls_fia-infnr(1) <> '$'. "création uniquement gérée niveau EINE


          READ TABLE me->gt_eina INTO DATA(ls_eina_bd)
            WITH KEY infnr = ls_fia-infnr
            BINARY SEARCH.
          CHECK sy-subrc IS INITIAL.
          MOVE-CORRESPONDING ls_eina_bd TO ls_eina_old.
          MOVE-CORRESPONDING ls_eina_bd TO ls_eina.

          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
               WITH KEY variant = me->gv_variant
                        viewname = gc_fiaview
               BINARY SEARCH.
          LOOP AT me->gt_tvar_p ASSIGNING <fs_tvar_p> from sy-tabix.
            IF <fs_tvar_p>-viewname <> gc_fiaview OR
               <fs_tvar_p>-variant <> me->gv_variant.
              EXIT.
            ENDIF.

            UNASSIGN : <fs_field>, <fs_field2>.
            ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_eina TO <fs_field>.
            CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
            ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_fia TO <fs_field2>.
            CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
            <fs_field> = <fs_field2>."
          ENDLOOP.

          DATA(lv_witheine) = abap_false.
        ELSE.
          CONTINUE.
        ENDIF.
      ELSE. " modif EINE (récupération des données EINA)
        IF  ls_fia-infnr(1) = '$'. "création uniquement gérée niveau EINE

          READ TABLE lt_unit INTO DATA(ls_unit)
             WITH KEY  matnr = ls_fia-matnr
                       meinh = ls_fia-meins.

          READ TABLE lt_mara INTO DATA(ls_mara)
            WITH KEY  matnr = ls_fia-matnr.

          READ TABLE lt_fia INTO DATA(ls_fia_crea)
            WITH KEY infnr = ls_fia-infnr
                     iseina = abap_true
            BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL.
            CONTINUE. " IMPOSSIBLE
          ENDIF.
          CLEAR ls_fia-infnr.
          CLEAR ls_fia_crea-infnr.
          MOVE-CORRESPONDING ls_fia_crea TO ls_eina.
          ls_eina-matkl = ls_mara-matkl.
          ls_eina-erdat = sy-datum.
          ls_eina-ernam = sy-uname.
          ls_eina-umrez = ls_unit-umrez.
          ls_eina-umren = ls_unit-umren.

          ls_eine-erdat = sy-datum.
          ls_eine-ernam = sy-uname.
          ls_eine-bpumz = ls_unit-umrez.
          ls_eine-bpumn = ls_unit-umren.
          ls_eine-waers = ls_fia-waers.

          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
                 WITH KEY variant = me->gv_variant
                          viewname = gc_fiaview
                 BINARY SEARCH.
          LOOP AT me->gt_tvar_p ASSIGNING <fs_tvar_p> FROM sy-tabix.
            IF <fs_tvar_p>-viewname <> gc_fiaview OR
               <fs_tvar_p>-variant <> me->gv_variant.
              EXIT.
            ENDIF.

            UNASSIGN : <fs_field>, <fs_field2>.
            ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_eine TO <fs_field>.
            IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
              ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_fia TO <fs_field2>.
              IF sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
                <fs_field> = <fs_field2>."
              ENDIF.
            ENDIF.
            UNASSIGN : <fs_field>, <fs_field2>.
            ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_eina TO <fs_field>.
            IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
              ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_fia_crea TO <fs_field2>.
              IF sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
                <fs_field> = <fs_field2>."
              ENDIF.
            ENDIF.
          ENDLOOP.

          IF ls_eine-norbm < ls_eine-minbm.
            ls_eine-norbm = ls_eine-minbm.
          ENDIF.
          IF ls_eina-lmein IS INITIAL.
            ls_eina-lmein = ls_eina-meins.
          ENDIF.
          lv_witheine = abap_true.

          DATA(lv_neweine) = abap_true.

        ELSE. "modif EINE

          READ TABLE me->gt_eina INTO ls_eina_bd
                     WITH KEY infnr = ls_fia-infnr
                     BINARY SEARCH.
          CHECK sy-subrc IS INITIAL.
          MOVE-CORRESPONDING ls_eina_bd TO ls_eina_old.

          READ TABLE lt_fia INTO ls_fia_crea
                      WITH KEY infnr = ls_fia-infnr
                               iseina = abap_true
                      BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL. "EINA non modifié
            ls_eina = ls_eina_old.
          ELSE.
            MOVE-CORRESPONDING ls_eina_bd TO ls_eina.
            READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
                WITH KEY variant = me->gv_variant
                         viewname = gc_fiaview
                BINARY SEARCH.
            LOOP AT me->gt_tvar_p ASSIGNING <fs_tvar_p> FROM sy-tabix.
              IF <fs_tvar_p>-viewname <> gc_fiaview OR
                 <fs_tvar_p>-variant <> me->gv_variant.
                EXIT.
              ENDIF.

              UNASSIGN : <fs_field>, <fs_field2>.
              ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_eina TO <fs_field>.
              CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
              ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_fia_crea TO <fs_field2>.
              CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
              <fs_field> = <fs_field2>."
            ENDLOOP.
          ENDIF.

          READ TABLE me->gt_eine INTO DATA(ls_eine_bd)
                               WITH KEY infnr = ls_fia-infnr
                                        ekorg = ls_fia-ekorg
                                        esokz = ls_fia-esokz
                                        werks = ls_fia-werks
                               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            MOVE-CORRESPONDING ls_eine_bd TO ls_eine_old.
            MOVE-CORRESPONDING ls_eine_bd TO ls_eine.
            lv_neweine = abap_false.
          ELSE.
            lv_neweine = abap_true.
          ENDIF.

          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
                 WITH KEY variant = me->gv_variant
                          viewname = gc_fiaview
                 BINARY SEARCH.
          LOOP AT me->gt_tvar_p ASSIGNING <fs_tvar_p> FROM sy-tabix.
            IF <fs_tvar_p>-viewname <> gc_fiaview OR
               <fs_tvar_p>-variant <> me->gv_variant.
              EXIT.
            ENDIF.

            UNASSIGN : <fs_field>, <fs_field2>.
            ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_eine TO <fs_field>.
            CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
            ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE ls_fia TO <fs_field2>.
            CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
            <fs_field> = <fs_field2>."
          ENDLOOP.

          IF ls_eine-norbm < ls_eine-minbm.
            ls_eine-norbm = ls_eine-minbm.
          ENDIF.

          IF ls_eina-lmein IS INITIAL.
            ls_eina-lmein = ls_eina-meins.
          ENDIF.

          ls_eine-waers = ls_fia-waers.

          lv_witheine = abap_true.

        ENDIF.
      ENDIF.

      TRANSLATE ls_eina-idnlf TO UPPER CASE.
      TRANSLATE ls_eina_old-idnlf TO UPPER CASE.

      IF lv_witheine = abap_true.
        IF lv_neweine = abap_true.
          CALL FUNCTION 'ME_DIRECT_INPUT_INFORECORD'
            EXPORTING
              activity         = 'V'
              i_eina           = ls_eina
              i_eine           = ls_eine
              o_eina           = ls_eina_old
              i_no_suppose     = 'X'
              i_vorga          = 'B'
            IMPORTING
              e_eina           = ls_eina_ex
              e_eine           = ls_eine_ex
*          TABLES
*             t_head           = lt_head
*             t_line           = lt_line
            EXCEPTIONS
              textname_invalid = 1
              error_message    = 2
              OTHERS           = 3.
        ELSE.
          CALL FUNCTION 'ME_DIRECT_INPUT_INFORECORD'
            EXPORTING
              activity         = 'V'
              i_eina           = ls_eina
              i_eine           = ls_eine
              o_eina           = ls_eina_old
              o_eine           = ls_eine_old
              i_no_suppose     = 'X'
              i_vorga          = 'B'
            IMPORTING
              e_eina           = ls_eina_ex
              e_eine           = ls_eine_ex
*          TABLES
*             t_head           = lt_head
*             t_line           = lt_line
            EXCEPTIONS
              textname_invalid = 1
              error_message    = 2
              OTHERS           = 3.
        ENDIF.
      ELSE.
        CALL FUNCTION 'ME_DIRECT_INPUT_INFORECORD'
          EXPORTING
            activity         = 'V'
            i_eina           = ls_eina
            o_eina           = ls_eina_old
            i_no_suppose     = 'X'
            i_vorga          = 'B'
          IMPORTING
            e_eina           = ls_eina_ex
*          TABLES
*           t_head           = lt_head
*           t_line           = lt_line
          EXCEPTIONS
            textname_invalid = 1
            error_message    = 2
            OTHERS           = 3.
      ENDIF.
      IF sy-subrc EQ 0.
        CALL FUNCTION 'ME_POST_INFORECORD'
          EXPORTING
            i_matnr = ls_fia-matnr.
        READ TABLE me->gt_eina ASSIGNING FIELD-SYMBOL(<fs_eina_bd>)
                        WITH KEY infnr = ls_eina-infnr
                        BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          MOVE-CORRESPONDING ls_eina TO <fs_eina_bd>.
        ENDIF.
        COMMIT WORK AND WAIT.
      ELSE.
*     On remplit la table de message d'erreur.
        ls_cont_p-id = me->gv_id.
        ls_cont_p-material = ls_fia-matnr.
        ls_cont_p-type       = sy-msgty.
        ls_cont_p-idmsg      = sy-msgid.
        ls_cont_p-num        = sy-msgno.
        ls_cont_p-message_v1      = sy-msgv1.
        ls_cont_p-message_v2      = sy-msgv2.
        ls_cont_p-message_v3      = sy-msgv3.
        ls_cont_p-message_v4      = sy-msgv4.
        MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
                INTO ls_cont_p-message
                WITH ls_cont_p-message_v1 ls_cont_p-message_v2 ls_cont_p-message_v3 ls_cont_p-message_v4.

        APPEND ls_cont_p TO me->gt_cont_p.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD change_fia_price_data.

    TYPES : BEGIN OF ty_cond,
              infnr TYPE infnr,
              matnr TYPE matnr,
              lifnr TYPE lifnr,
              ekorg TYPE ekorg,
              knumh TYPE knumh,
              kopos TYPE kopos,
              kbetr	TYPE kbetr_kond,
              kmein	TYPE kmein,
              konwa	TYPE konwa,
              kpein	TYPE kpein,
              datbi	TYPE kodatbi,
              datab TYPE kodatab,
            END OF ty_cond.


    DATA : lt_messages    TYPE bapiret2_t,
           ls_cont_p      TYPE /dlwupex/tcont_p,
           lt_cond_eina   TYPE TABLE OF ty_cond,
           lt_cond        TYPE TABLE OF ty_cond,
           ls_cond        TYPE ty_cond,
           ls_cond_change TYPE /dlwupex/price_cond.

    FIELD-SYMBOLS: <st_data> TYPE any,
                   <fs>      TYPE any.


    SORT ct_seldata.
    READ TABLE ct_seldata TRANSPORTING NO FIELDS
            WITH KEY tabname = 'KONP'
            BINARY SEARCH.
    CHECK sy-subrc IS INITIAL.

    LOOP AT it_data ASSIGNING <st_data>.
      UNASSIGN <fs>.
      ASSIGN COMPONENT 'ISEINA' OF STRUCTURE <st_data> TO <fs>.
      CHECK <fs> IS ASSIGNED AND <fs> = abap_true.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'INFNR' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-infnr = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-matnr = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'LIFNR' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-lifnr = <fs>.
      ENDIF.

      APPEND ls_cond TO lt_cond_eina.

    ENDLOOP.

    SORT lt_cond_eina.

    LOOP AT it_data ASSIGNING <st_data>.
      UNASSIGN <fs>.
      ASSIGN COMPONENT 'ISEINA' OF STRUCTURE <st_data> TO <fs>.
      CHECK <fs> IS ASSIGNED AND <fs> IS INITIAL.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'INFNR' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-infnr = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-matnr = <fs>.
      ENDIF.

      READ TABLE lt_cond_eina INTO DATA(ls_cond_eina)
      WITH KEY
        infnr = ls_cond-infnr
        matnr = ls_cond-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        ls_cond-lifnr = ls_cond_eina-lifnr.
      ELSE.
        READ TABLE me->gt_eina INTO DATA(ls_eina)
          WITH KEY
            infnr = ls_cond-infnr
            matnr = ls_cond-matnr
            BINARY SEARCH.
            IF sy-subrc IS INITIAL.
              ls_cond-lifnr = ls_eina-lifnr.
            ENDIF.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'EKORG' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-ekorg = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'KBETR' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-kbetr = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'KMEIN' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        READ TABLE me->gt_t006 INTO DATA(ls_t006)
          WITH KEY msehi = <fs>
               BINARY SEARCH.
        ls_cond-kmein = ls_t006-isocode.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'KONWA' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-konwa = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'KPEIN' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-kpein = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'DATAB' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-datab = <fs>.
      ENDIF.
      IF ls_cond-datab IS INITIAL.
        ls_cond-datab = sy-datum.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'DATBI' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-datbi = <fs>.
      ENDIF.
      IF ls_cond-datbi IS INITIAL.
        ls_cond-datbi = '99991231'.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'STATUS' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        IF <fs> = '01'.
          ls_cond-knumh = '$000000001'.
          ls_cond-kopos = '00'.
        ELSE.
          UNASSIGN <fs>.
          ASSIGN COMPONENT 'KNUMH' OF STRUCTURE <st_data> TO <fs>.
          IF <fs> IS ASSIGNED.
            ls_cond-knumh = <fs>.
          ENDIF.
          UNASSIGN <fs>.
          ASSIGN COMPONENT 'KOPOS' OF STRUCTURE <st_data> TO <fs>.
          IF <fs> IS ASSIGNED.
            ls_cond-kopos = <fs>.
          ENDIF.
        ENDIF.
      ENDIF.

      APPEND ls_cond TO lt_cond.
    ENDLOOP.


    LOOP AT lt_cond ASSIGNING FIELD-SYMBOL(<fs_cond>).

      REFRESH : lt_messages.

      CLEAR ls_cond_change.

      CHECK <fs_cond>-kbetr IS NOT INITIAL.
      ls_cond_change-cond_usage = 'A'.
      ls_cond_change-table_no = '018'.
      ls_cond_change-applicatio = 'M'.
      ls_cond_change-cond_type = 'PB00'.
      CONCATENATE <fs_cond>-lifnr <fs_cond>-matnr <fs_cond>-ekorg '0'
        INTO ls_cond_change-varkey.
      ls_cond_change-valid_to = <fs_cond>-datbi.
      ls_cond_change-valid_from = <fs_cond>-datab.
      ls_cond_change-cond_p_unt = <fs_cond>-kpein.
      ls_cond_change-cond_unit = <fs_cond>-kmein.
      ls_cond_change-base_uom = <fs_cond>-kmein.
      ls_cond_change-cond_value = <fs_cond>-kbetr.
      ls_cond_change-condcurr = <fs_cond>-konwa.

      CALL FUNCTION '/DLWUPEX/COCKPIT_CHANGE_PRICE'
        EXPORTING
          is_cond    = ls_cond_change
        IMPORTING
          et_message = lt_messages.

      READ TABLE lt_messages TRANSPORTING NO FIELDS
           WITH KEY type = 'E'.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_messages ASSIGNING FIELD-SYMBOL(<fs_msg>).
          CHECK <fs_msg>-type = 'E'.
          ls_cont_p-id = me->gv_id.
          ls_cont_p-material = <fs_cond>-matnr.
          ls_cont_p-type = <fs_msg>-type.
          ls_cont_p-idmsg = <fs_msg>-id.
          ls_cont_p-num = <fs_msg>-number.
          ls_cont_p-message_v1 = <fs_msg>-message_v1.
          ls_cont_p-message_v2 = <fs_msg>-message_v2.
          ls_cont_p-message_v3 = <fs_msg>-message_v3.
          ls_cont_p-message_v4 = <fs_msg>-message_v4.
          ls_cont_p-message = <fs_msg>-message.

          APPEND ls_cont_p TO me->gt_cont_p.
        ENDLOOP.
      ENDIF.
    ENDLOOP.



  ENDMETHOD.


  METHOD change_global_data.

    DATA : ls_smakt            TYPE makt,
           ls_smalg            TYPE malg,
           ls_smamt            TYPE mamt,
           ls_smara            TYPE mara,
           ls_smarc            TYPE marc,
           ls_smard            TYPE mard,
           ls_smarm            TYPE marm,
           ls_smaw1            TYPE maw1,
           ls_smbew            TYPE mbew,
           ls_smean            TYPE mean,
           ls_smlea            TYPE mlea,
           ls_smlgn            TYPE mlgn,
           ls_smlgt            TYPE mlgt,
           ls_smpgd            TYPE mpgd,
           ls_smpop            TYPE mpop,
           ls_smprw            TYPE mprw,
           ls_smveg            TYPE mveg,
           ls_smveu            TYPE mveu,
           ls_smvke            TYPE mvke,
           ls_swlk2            TYPE wlk2,
           ls_smartstatus      TYPE martstatus,
           ls_ssgt_marm        TYPE sgt_marm,
           ls_ssgt_mvke        TYPE sgt_mvke,
           ls_ssgt_madka       TYPE sgt_madka,
           ls_sfsh_seasons_mat TYPE fsh_seasons_mat,
           ls_ssgt_mlgt        TYPE sgt_mlgt,
           ls_ssgt_mlgn        TYPE sgt_mlgn,
           ls_ssgt_mrp_gn      TYPE sgt_mrp_gn,
           ls_ssgt_mrp         TYPE sgt_mrp,
           lt_var              TYPE TABLE OF /dlwupex/tvar_p,
           ls_seldata          TYPE mass_wa_tabdata,
           lt_key_field        TYPE mass_fieldtab,
           lv_field            TYPE ddobjname,
           lv_tabname          TYPE tabname16,
           lt_tabname          TYPE TABLE OF tabname16,
           lv_itab             TYPE string,
           lv_istruct          TYPE string,
           lt_field            TYPE mass_fieldtab.

    FIELD-SYMBOLS: <st_data> TYPE any,
                   <lt_itab> TYPE table,
                   <fs_itab> TYPE any.

    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    FIELD-SYMBOLS : <fs_field>  TYPE any,
                    <fs_field2> TYPE any,
                    <ft_data>   TYPE ANY TABLE.

    SORT ct_seldata.


    LOOP AT ct_seldata ASSIGNING FIELD-SYMBOL(<fs_seldata>).

      IF <fs_seldata>-tabname <> lv_tabname AND lv_tabname IS NOT INITIAL.
        READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
              WITH KEY viewname = gc_gdataview
                       tabname = lv_tabname
              BINARY SEARCH.
        IF  sy-subrc IS NOT INITIAL.
          REFRESH : lt_field.
          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
            WITH KEY variant = me->gv_variant
                     viewname = gc_gdataview
                     tabname = <fs_seldata>-tabname
                     fieldname =  <fs_seldata>-fieldname
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            APPEND <fs_seldata>-fieldname TO lt_field.
          ENDIF.
          lv_tabname = <fs_seldata>-tabname.
          CONTINUE.
        ENDIF.
        LOOP AT me->gt_viewkey ASSIGNING FIELD-SYMBOL(<fs_viewkey>) FROM sy-tabix.
          CHECK <fs_viewkey>-keyfield = 'X'.
          IF <fs_viewkey>-viewname <> gc_gdataview OR <fs_viewkey>-tabname <> lv_tabname.
            EXIT.
          ENDIF.
          lv_field = <fs_viewkey>-fieldname.
          APPEND lv_field TO lt_key_field.

        ENDLOOP.
        IF lt_key_field IS NOT INITIAL.
          READ TABLE me->gt_seldata ASSIGNING FIELD-SYMBOL(<ft_seldata>)
            WITH KEY tabname-name = lv_tabname.
            IF sy-subrc IS INITIAL.
              APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
              APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
              SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              APPEND lv_tabname TO lt_tabname.
            ELSE.
              ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
              ls_seldata-tabname-no_newseg = abap_true.
              ls_seldata-keyfieldnames = lt_key_field.
              ls_seldata-fieldnames = lt_field.
              APPEND lv_tabname TO lt_tabname.
              APPEND ls_seldata TO me->gt_seldata.
            ENDIF.
        ENDIF.
        REFRESH : lt_key_field, lt_field.
        CLEAR ls_seldata.

      ENDIF.
      READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
        WITH KEY variant = me->gv_variant
                 viewname = gc_gdataview
                 tabname = <fs_seldata>-tabname
                 fieldname =  <fs_seldata>-fieldname
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        APPEND <fs_seldata>-fieldname TO lt_field.
      ENDIF.
      lv_tabname = <fs_seldata>-tabname.

    ENDLOOP.

    READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
                  WITH KEY viewname = gc_gdataview
                           tabname = lv_tabname
                  BINARY SEARCH.
    IF  sy-subrc IS INITIAL.
      LOOP AT me->gt_viewkey ASSIGNING <fs_viewkey> FROM sy-tabix.
        CHECK <fs_viewkey>-keyfield = 'X'.
        IF <fs_viewkey>-viewname <> gc_gdataview OR <fs_viewkey>-tabname <> lv_tabname.
          EXIT.
        ENDIF.
        lv_field = <fs_viewkey>-fieldname.
        APPEND lv_field TO lt_key_field.

      ENDLOOP.
      IF lt_key_field IS NOT INITIAL.
        READ TABLE me->gt_seldata ASSIGNING <ft_seldata>
            WITH KEY tabname-name = lv_tabname.
            IF sy-subrc IS INITIAL.
              APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
              APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
              SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              APPEND lv_tabname TO lt_tabname.
            ELSE.
              ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
              ls_seldata-tabname-no_newseg = abap_true.
              ls_seldata-keyfieldnames = lt_key_field.
              ls_seldata-fieldnames = lt_field.
              APPEND lv_tabname TO lt_tabname.
              APPEND ls_seldata TO me->gt_seldata.
            ENDIF.
        REFRESH : lt_key_field, lt_field.
        CLEAR ls_seldata.
      ENDIF.
    ENDIF.

*    lt_data = it_data.
    SORT lt_tabname.
    LOOP AT it_data ASSIGNING <st_data>.
      LOOP AT lt_tabname ASSIGNING FIELD-SYMBOL(<fs_tabname>).
        lv_itab = 'ME->GT_S' && <fs_tabname>.
        lv_istruct = 'LS_S' && <fs_tabname>.
        ASSIGN (lv_itab) TO <lt_itab>.
        ASSIGN (lv_istruct) TO <fs_itab>.
        MOVE-CORRESPONDING <st_data> TO <fs_itab>.
        APPEND <fs_itab> TO <lt_itab>.
      ENDLOOP.
    ENDLOOP.

    READ TABLE ct_seldata TRANSPORTING NO FIELDS
             WITH KEY tabname = '/SAPSLL/MARITC'
             BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      CALL METHOD me->change_nomenc_data
        EXPORTING
          it_data = it_data.
    ENDIF.

    READ TABLE ct_seldata TRANSPORTING NO FIELDS
         WITH KEY tabname = 'MLAN'
         BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      CALL METHOD me->change_taxe_data
        EXPORTING
          it_data = it_data.
    ENDIF.


  ENDMETHOD.


  METHOD change_listing_data.


    DATA : lt_tab_wlk1 TYPE TABLE OF wlk1_ueb,
           ls_tab_wlk1 TYPE wlk1_ueb,
           lt_wlk1     TYPE TABLE OF wlk1_ueb,
           ls_wlk1     TYPE  wlk1,
           lt_error    TYPE TABLE OF  merrdat,
           ls_error    TYPE merrdat,
           ls_cont_p   TYPE /dlwupex/tcont_p,
           lrt_matnr   TYPE RANGE OF matnr,
           lrs_matnr   LIKE LINE OF lrt_matnr.

    FIELD-SYMBOLS: <fs_field> TYPE any,
                   <st_data>  TYPE any.
    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.

    LOOP AT it_data ASSIGNING <st_data>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'ARTNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-artnr = <fs_field>.
      lrs_matnr-low = <fs_field>.
      APPEND lrs_matnr TO lrt_matnr.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'FILIA' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-filia = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'VRKME' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-vrkme = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'DATBI' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-datbi = <fs_field>.


      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'DATAB' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-datab = <fs_field>.


      MOVE-CORRESPONDING ls_wlk1 TO ls_tab_wlk1.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'STATUS' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED.
      IF <fs_field> = '02'.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'LFDNR' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK <fs_field> IS  ASSIGNED.
        ls_tab_wlk1-lfdnr = <fs_field>.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'STRNR' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_tab_wlk1-strnr = <fs_field>.
        ls_tab_wlk1-changeid = 'U'.
      ELSE.
        CLEAR ls_wlk1-lfdnr.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'ARTNR' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_tab_wlk1-strnr = <fs_field>.
        ls_tab_wlk1-changeid = 'I'.
      ENDIF.

      ls_tab_wlk1-tranc    = 1.

      APPEND ls_tab_wlk1 TO lt_wlk1.

    ENDLOOP.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.

    IF lrt_matnr IS NOT INITIAL.
      SELECT matnr, m~stlnr, idnrk
        FROM mast AS m INNER JOIN stpo AS s
        ON m~stlnr = s~stlnr
        INTO TABLE @DATA(lt_bom)
        WHERE matnr IN @lrt_matnr AND
              stlty = 'M'.
      IF sy-subrc IS INITIAL.
        SORT lt_bom BY matnr.
      ENDIF.
    ENDIF.

*    SELECT * FROM wlk1 INTO TABLE @DATA(lt_wlk1_db)
*      WHERE artnr IN @lrt_matnr.
*    SORT lt_wlk1_db.

    LOOP AT lrt_matnr INTO lrs_matnr.
      REFRESH : lt_tab_wlk1.
      READ TABLE lt_wlk1 TRANSPORTING NO FIELDS
        WITH KEY artnr = lrs_matnr-low
          BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_wlk1 ASSIGNING FIELD-SYMBOL(<fs_wlk1>) FROM sy-tabix.
          IF lrs_matnr-low <> <fs_wlk1>-artnr.
            EXIT.
          ENDIF.
          READ TABLE lt_bom TRANSPORTING NO FIELDS
            WITH KEY matnr = <fs_wlk1>-artnr
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DATA(lv_tabix) = sy-tabix.
            CLEAR : ls_tab_wlk1.
            MOVE-CORRESPONDING <fs_wlk1> TO ls_tab_wlk1.
            ls_tab_wlk1-strli    = 'H'.
            APPEND ls_tab_wlk1 TO lt_tab_wlk1.
            LOOP AT lt_bom ASSIGNING FIELD-SYMBOL(<fs_bom>) FROM lv_tabix.
              IF <fs_bom>-matnr <> <fs_wlk1>-artnr.
                EXIT.
              ENDIF.
              CLEAR : ls_tab_wlk1.
              MOVE-CORRESPONDING <fs_wlk1> TO ls_tab_wlk1.
              ls_tab_wlk1-artnr    = <fs_bom>-idnrk.
              ls_tab_wlk1-strli    = 'X'.
              APPEND ls_tab_wlk1 TO lt_tab_wlk1.
            ENDLOOP.
          ELSE.
            CLEAR : ls_tab_wlk1.
            MOVE-CORRESPONDING <fs_wlk1> TO ls_tab_wlk1.
            APPEND ls_tab_wlk1 TO lt_tab_wlk1.
          ENDIF.
        ENDLOOP.
        IF lt_tab_wlk1 IS NOT INITIAL.
          REFRESH lt_error.
          SET UPDATE TASK LOCAL.
          CALL FUNCTION 'LISTING_COND_MAINTAIN_DARK'
            EXPORTING
              p_create_change_document = 'X'
            TABLES
              tab_wlk1                 = lt_tab_wlk1
              amatnrerrdat             = lt_error
            EXCEPTIONS
              OTHERS                   = 1.
          DATA(lv_subrc) = sy-subrc.
          READ TABLE lt_error TRANSPORTING NO FIELDS
                  WITH KEY msgty = 'E'.
          IF sy-subrc IS INITIAL OR lv_subrc IS NOT INITIAL.
            ROLLBACK WORK.
            LOOP AT lt_error ASSIGNING FIELD-SYMBOL(<fs_msg>).
              CHECK <fs_msg>-msgty = 'E'.
              ls_cont_p-id = me->gv_id.
              ls_cont_p-material = <fs_msg>-matnr.
              ls_cont_p-type = <fs_msg>-msgty.
              ls_cont_p-idmsg = <fs_msg>-msgid.
              ls_cont_p-num = <fs_msg>-msgno.
              ls_cont_p-message_v1 = <fs_msg>-msgv1.
              ls_cont_p-message_v2 = <fs_msg>-msgv2.
              ls_cont_p-message_v3 = <fs_msg>-msgv3.
              ls_cont_p-message_v4 = <fs_msg>-msgv4.

              MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
               INTO ls_cont_p-message WITH ls_cont_p-message_v1 ls_cont_p-message_v2
                                        ls_cont_p-message_v3 ls_cont_p-message_v4.

              APPEND ls_cont_p TO me->gt_cont_p.
            ENDLOOP.
          ELSE.
            COMMIT WORK AND WAIT.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD change_listing_data_bis.


    DATA : lt_tab_wlk1 TYPE TABLE OF wlk1_ueb,
           ls_tab_wlk1 TYPE wlk1_ueb,
           lt_wlk1     TYPE TABLE OF wlk1_ueb,
           ls_wlk1     TYPE  wlk1,
           lt_error    TYPE TABLE OF  merrdat,
           ls_error    TYPE merrdat,
           ls_cont_p   TYPE /dlwupex/tcont_p,
           lv_comp     TYPE idnrk,
           lrt_matnr   TYPE RANGE OF matnr,
           lrs_matnr   LIKE LINE OF lrt_matnr.

    FIELD-SYMBOLS: <fs_field> TYPE any,
                   <st_data>  TYPE any.
    DATA: dref TYPE REF TO data .

    DATA : lt_queue      TYPE /sapapo/cif_trfcqview_tt,
           lv_inprogress TYPE xfeld,
           lv_qname      TYPE trfcqnam,
           lrt_qstate    TYPE RANGE OF qrfcstate,
           lrs_qstate    LIKE LINE OF lrt_qstate.
    CONSTANTS : qs_sysfail TYPE qrfcstate VALUE 'SYSFAIL',
                qs_cpicerr TYPE qrfcstate VALUE 'CPICERR'.

** On vérifie que toutes les queues sont terminées.
    lrs_qstate-sign = 'I'.
    lrs_qstate-option = 'EQ'.

    lrs_qstate-low = qs_sysfail.
    APPEND lrs_qstate TO lrt_qstate.
    lrs_qstate-low = qs_cpicerr.
    APPEND lrs_qstate TO lrt_qstate.

    SELECT SINGLE value FROM /dlwupex/tcusto INTO @DATA(lv_value)
             WHERE name = 'QUEUE_MOD_PREFIXE'.
    IF sy-subrc IS NOT INITIAL.
      ls_cont_p-type = 'E'.
      ls_cont_p-idmsg = gc_classmsg.
      ls_cont_p-num = '023'.
      ls_cont_p-message_v1 = '/DLWUPEX/TCUSTO'.
      MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
        INTO ls_cont_p-message WITH ls_cont_p-message_v1.
*      APPEND ls_msg TO ct_msg.
      EXIT.
    ENDIF.

    CONCATENATE lv_value me->gv_id '*' INTO lv_qname.

    lv_inprogress = 'X'.

    WHILE lv_inprogress = 'X'.
      WAIT UP TO 10 SECONDS.
      REFRESH lt_queue.
      CALL FUNCTION 'TRFC_QIN_OVERVIEW_STATES'
        EXPORTING
          qname = lv_qname
        TABLES
          qview = lt_queue.

      SORT lt_queue BY qstate.
      DELETE lt_queue WHERE qstate IN lrt_qstate.

      IF lt_queue IS NOT INITIAL.
        lv_inprogress = 'X'.
      ELSE.
        CLEAR lv_inprogress.
      ENDIF.
    ENDWHILE.




    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.

    LOOP AT it_data ASSIGNING <st_data>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'ARTNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-artnr = <fs_field>.
      lrs_matnr-low = <fs_field>.
      APPEND lrs_matnr TO lrt_matnr.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'FILIA' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-filia = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'VRKME' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-vrkme = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'DATBI' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-datbi = <fs_field>.


      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'DATAB' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_wlk1-datab = <fs_field>.


      MOVE-CORRESPONDING ls_wlk1 TO ls_tab_wlk1.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'STATUS' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED.
      IF <fs_field> = '02'.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'LFDNR' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK <fs_field> IS  ASSIGNED.
        ls_tab_wlk1-lfdnr = <fs_field>.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'STRNR' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_tab_wlk1-strnr = <fs_field>.
        ls_tab_wlk1-changeid = 'U'.
      ELSE.
        CLEAR ls_wlk1-lfdnr.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'ARTNR' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_tab_wlk1-strnr = <fs_field>.
        ls_tab_wlk1-changeid = 'I'.
      ENDIF.

      ls_tab_wlk1-tranc    = 1.

      APPEND ls_tab_wlk1 TO lt_wlk1.

    ENDLOOP.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.

    IF lrt_matnr IS NOT INITIAL.
      SELECT matnr, m~stlnr, idnrk
        FROM mast AS m INNER JOIN stpo AS s
        ON m~stlnr = s~stlnr
        INTO TABLE @DATA(lt_bom)
        WHERE matnr IN @lrt_matnr AND
              stlty = 'M'.
      IF sy-subrc IS INITIAL.
        SORT lt_bom BY matnr.
      ENDIF.
*
*      SELECT matnr, m~stlnr, idnrk
*        FROM mast AS m INNER JOIN stpo AS s
*        ON m~stlnr = s~stlnr
*        INTO TABLE @DATA(lt_bom_all)
*          FOR ALL ENTRIES IN @lt_bom
*        WHERE idnrk = @lt_bom-idnrk AND
*              stlty = 'M'.
*      IF sy-subrc IS INITIAL.
*        SORT lt_bom_all BY matnr.
*      ENDIF.
    ENDIF.

    SORT lt_wlk1 BY artnr.
* Gestion de la Partie BOM
    LOOP AT lrt_matnr INTO lrs_matnr.
      REFRESH : lt_tab_wlk1.
      READ TABLE lt_wlk1 TRANSPORTING NO FIELDS
        WITH KEY artnr = lrs_matnr-low
          BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_wlk1 ASSIGNING FIELD-SYMBOL(<fs_wlk1>) FROM sy-tabix.
          IF lrs_matnr-low <> <fs_wlk1>-artnr.
            EXIT.
          ENDIF.
          READ TABLE lt_bom TRANSPORTING NO FIELDS
            WITH KEY matnr = <fs_wlk1>-artnr
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DATA(lv_tabix) = sy-tabix.
            CLEAR : ls_tab_wlk1.
            MOVE-CORRESPONDING <fs_wlk1> TO ls_tab_wlk1.
            ls_tab_wlk1-strli    = 'H'.
            APPEND ls_tab_wlk1 TO lt_tab_wlk1.
          ELSE.
            CLEAR : ls_tab_wlk1.
            MOVE-CORRESPONDING <fs_wlk1> TO ls_tab_wlk1.
            APPEND ls_tab_wlk1 TO lt_tab_wlk1.
          ENDIF.
        ENDLOOP.
        IF lt_tab_wlk1 IS NOT INITIAL.
          REFRESH lt_error.
          SET UPDATE TASK LOCAL.
          CALL FUNCTION 'LISTING_COND_MAINTAIN_DARK'
            EXPORTING
              p_create_change_document = 'X'
            TABLES
              tab_wlk1                 = lt_tab_wlk1
              amatnrerrdat             = lt_error
            EXCEPTIONS
              OTHERS                   = 1.
          DATA(lv_subrc) = sy-subrc.
          READ TABLE lt_error TRANSPORTING NO FIELDS
                  WITH KEY msgty = 'E'.
          IF sy-subrc IS INITIAL OR lv_subrc IS NOT INITIAL.
            ROLLBACK WORK.
            LOOP AT lt_error ASSIGNING FIELD-SYMBOL(<fs_msg>).
              CHECK <fs_msg>-msgty = 'E'.
              ls_cont_p-id = me->gv_id.
              ls_cont_p-material = <fs_msg>-matnr.
              ls_cont_p-type = <fs_msg>-msgty.
              ls_cont_p-idmsg = <fs_msg>-msgid.
              ls_cont_p-num = <fs_msg>-msgno.
              ls_cont_p-message_v1 = <fs_msg>-msgv1.
              ls_cont_p-message_v2 = <fs_msg>-msgv2.
              ls_cont_p-message_v3 = <fs_msg>-msgv3.
              ls_cont_p-message_v4 = <fs_msg>-msgv4.

              MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
               INTO ls_cont_p-message WITH ls_cont_p-message_v1 ls_cont_p-message_v2
                                        ls_cont_p-message_v3 ls_cont_p-message_v4.

              APPEND ls_cont_p TO me->gt_cont_p.
            ENDLOOP.

          ELSE.
            COMMIT WORK AND WAIT.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDLOOP.



* Gestion de la Partie Composants
    REFRESH : lt_tab_wlk1.
    SORT lt_bom BY idnrk.
    LOOP AT lt_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).

      IF <fs_bom>-idnrk <> lv_comp AND lv_comp IS NOT INITIAL.
* Ajout du Composant seul si géré
        READ TABLE lt_wlk1 TRANSPORTING NO FIELDS
         WITH KEY artnr = <fs_bom>-idnrk
           BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          LOOP AT lt_wlk1 ASSIGNING <fs_wlk1> FROM sy-tabix.
            IF <fs_bom>-idnrk <> <fs_wlk1>-artnr.
              EXIT.
            ENDIF.
            CLEAR : ls_tab_wlk1.
            MOVE-CORRESPONDING <fs_wlk1> TO ls_tab_wlk1.
            APPEND ls_tab_wlk1 TO lt_tab_wlk1.
          ENDLOOP.
        ENDIF.
        IF lt_tab_wlk1 IS NOT INITIAL.
          REFRESH lt_error.
          SET UPDATE TASK LOCAL.
          CALL FUNCTION 'LISTING_COND_MAINTAIN_DARK'
            EXPORTING
              p_create_change_document = 'X'
            TABLES
              tab_wlk1                 = lt_tab_wlk1
              amatnrerrdat             = lt_error
            EXCEPTIONS
              OTHERS                   = 1.
          IF sy-subrc IS NOT INITIAL.
            ROLLBACK WORK.
            READ TABLE lt_error TRANSPORTING NO FIELDS
                    WITH KEY msgty = 'E'.
            IF sy-subrc IS INITIAL.
              LOOP AT lt_error ASSIGNING <fs_msg>.
                CHECK <fs_msg>-msgty = 'E'.
                ls_cont_p-id = me->gv_id.
                ls_cont_p-material = <fs_msg>-matnr.
                ls_cont_p-type = <fs_msg>-msgty.
                ls_cont_p-idmsg = <fs_msg>-msgid.
                ls_cont_p-num = <fs_msg>-msgno.
                ls_cont_p-message_v1 = <fs_msg>-msgv1.
                ls_cont_p-message_v2 = <fs_msg>-msgv2.
                ls_cont_p-message_v3 = <fs_msg>-msgv3.
                ls_cont_p-message_v4 = <fs_msg>-msgv4.

                MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
                 INTO ls_cont_p-message WITH ls_cont_p-message_v1 ls_cont_p-message_v2
                                          ls_cont_p-message_v3 ls_cont_p-message_v4.

                APPEND ls_cont_p TO me->gt_cont_p.
              ENDLOOP.
            ENDIF.
          ELSE.
            COMMIT WORK AND WAIT.
          ENDIF.
        ENDIF.

        REFRESH : lt_tab_wlk1.
      ENDIF.

* Ajout du BOM du Composant si géré
      READ TABLE lt_wlk1 TRANSPORTING NO FIELDS
               WITH KEY artnr = <fs_bom>-matnr
                 BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_wlk1 ASSIGNING <fs_wlk1> FROM sy-tabix.
          IF <fs_bom>-matnr <> <fs_wlk1>-artnr.
            EXIT.
          ENDIF.
          CLEAR : ls_tab_wlk1.
          MOVE-CORRESPONDING <fs_wlk1> TO ls_tab_wlk1.
          ls_tab_wlk1-artnr    = <fs_bom>-idnrk.
          ls_tab_wlk1-strli    = 'X'.
          APPEND ls_tab_wlk1 TO lt_tab_wlk1.
        ENDLOOP.
      ENDIF.
      lv_comp = <fs_bom>-idnrk.
      AT LAST.
* Ajout du Composant seul si géré
        READ TABLE lt_wlk1 TRANSPORTING NO FIELDS
         WITH KEY artnr = <fs_bom>-idnrk
           BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          LOOP AT lt_wlk1 ASSIGNING <fs_wlk1> FROM sy-tabix.
            IF <fs_bom>-idnrk <> <fs_wlk1>-artnr.
              EXIT.
            ENDIF.
            CLEAR : ls_tab_wlk1.
            MOVE-CORRESPONDING <fs_wlk1> TO ls_tab_wlk1.
            APPEND ls_tab_wlk1 TO lt_tab_wlk1.
          ENDLOOP.
        ENDIF.
        IF lt_tab_wlk1 IS NOT INITIAL.
          REFRESH lt_error.
          SET UPDATE TASK LOCAL.
          CALL FUNCTION 'LISTING_COND_MAINTAIN_DARK'
            EXPORTING
              p_create_change_document = 'X'
            TABLES
              tab_wlk1                 = lt_tab_wlk1
              amatnrerrdat             = lt_error
            EXCEPTIONS
              OTHERS                   = 1.
          IF sy-subrc IS NOT INITIAL.
            ROLLBACK WORK.
            READ TABLE lt_error TRANSPORTING NO FIELDS
                    WITH KEY msgty = 'E'.
            IF sy-subrc IS INITIAL.
              LOOP AT lt_error ASSIGNING <fs_msg>.
                CHECK <fs_msg>-msgty = 'E'.
                ls_cont_p-id = me->gv_id.
                ls_cont_p-material = <fs_msg>-matnr.
                ls_cont_p-type = <fs_msg>-msgty.
                ls_cont_p-idmsg = <fs_msg>-msgid.
                ls_cont_p-num = <fs_msg>-msgno.
                ls_cont_p-message_v1 = <fs_msg>-msgv1.
                ls_cont_p-message_v2 = <fs_msg>-msgv2.
                ls_cont_p-message_v3 = <fs_msg>-msgv3.
                ls_cont_p-message_v4 = <fs_msg>-msgv4.

                MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
                 INTO ls_cont_p-message WITH ls_cont_p-message_v1 ls_cont_p-message_v2
                                          ls_cont_p-message_v3 ls_cont_p-message_v4.

                APPEND ls_cont_p TO me->gt_cont_p.
              ENDLOOP.
            ENDIF.
          ELSE.
            COMMIT WORK AND WAIT.
          ENDIF.
        ENDIF.
      ENDAT.
    ENDLOOP.

  ENDMETHOD.


  METHOD change_logdc_data.

    DATA : ls_smakt            TYPE makt,
           ls_smalg            TYPE malg,
           ls_smamt            TYPE mamt,
           ls_smara            TYPE mara,
           ls_smarc            TYPE marc,
           ls_smard            TYPE mard,
           ls_smarm            TYPE marm,
           ls_smaw1            TYPE maw1,
           ls_smbew            TYPE mbew,
           ls_smean            TYPE mean,
           ls_smlea            TYPE mlea,
           ls_smlgn            TYPE mlgn,
           ls_smlgt            TYPE mlgt,
           ls_smpgd            TYPE mpgd,
           ls_smpop            TYPE mpop,
           ls_smprw            TYPE mprw,
           ls_smveg            TYPE mveg,
           ls_smveu            TYPE mveu,
           ls_smvke            TYPE mvke,
           ls_swlk2            TYPE wlk2,
           ls_smartstatus      TYPE martstatus,
           ls_ssgt_marm        TYPE sgt_marm,
           ls_ssgt_mvke        TYPE sgt_mvke,
           ls_ssgt_madka       TYPE sgt_madka,
           ls_sfsh_seasons_mat TYPE fsh_seasons_mat,
           ls_ssgt_mlgt        TYPE sgt_mlgt,
           ls_ssgt_mlgn        TYPE sgt_mlgn,
           ls_ssgt_mrp_gn      TYPE sgt_mrp_gn,
           ls_ssgt_mrp         TYPE sgt_mrp,
           lt_var              TYPE TABLE OF /dlwupex/tvar_p,
           ls_seldata          TYPE mass_wa_tabdata,
           lt_key_field        TYPE mass_fieldtab,
           lv_field            TYPE ddobjname,
           lv_tabname          TYPE tabname16,
           lt_tabname          TYPE TABLE OF tabname16,
           lv_itab             TYPE string,
           lv_istruct          TYPE string,
           lt_field            TYPE mass_fieldtab.

    FIELD-SYMBOLS: <st_data> TYPE any,
                   <lt_itab> TYPE table,
                   <fs_itab> TYPE any.

    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    FIELD-SYMBOLS : <fs_field>  TYPE any,
                    <fs_field2> TYPE any,
                    <ft_data>   TYPE ANY TABLE.

    SORT ct_seldata.


    LOOP AT ct_seldata ASSIGNING FIELD-SYMBOL(<fs_seldata>).

      IF <fs_seldata>-tabname <> lv_tabname AND lv_tabname IS NOT INITIAL.
        READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
              WITH KEY viewname = gc_logdcview
                       tabname = lv_tabname
              BINARY SEARCH.
        IF  sy-subrc IS NOT INITIAL.
          REFRESH : lt_field.
          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
            WITH KEY variant = me->gv_variant
                     viewname = gc_logdcview
                     tabname = <fs_seldata>-tabname
                     fieldname =  <fs_seldata>-fieldname
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            APPEND <fs_seldata>-fieldname TO lt_field.
          ENDIF.
          lv_tabname = <fs_seldata>-tabname.
          CONTINUE.
        ENDIF.
        LOOP AT me->gt_viewkey ASSIGNING FIELD-SYMBOL(<fs_viewkey>) FROM sy-tabix.
          CHECK <fs_viewkey>-keyfield = 'X'.
          IF <fs_viewkey>-viewname <> gc_logdcview OR <fs_viewkey>-tabname <> lv_tabname.
            EXIT.
          ENDIF.
          lv_field = <fs_viewkey>-fieldname.
          APPEND lv_field TO lt_key_field.

        ENDLOOP.
        IF lt_key_field IS NOT INITIAL.
          READ TABLE me->gt_seldata ASSIGNING FIELD-SYMBOL(<ft_seldata>)
                      WITH KEY tabname-name = lv_tabname.
          IF sy-subrc IS INITIAL.
            APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
            APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
            SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
            DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
            APPEND lv_tabname TO lt_tabname.
          ELSE.
            ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
            ls_seldata-tabname-no_newseg = abap_true.
            ls_seldata-keyfieldnames = lt_key_field.
            ls_seldata-fieldnames = lt_field.
            APPEND lv_tabname TO lt_tabname.
            APPEND ls_seldata TO me->gt_seldata.
          ENDIF.
        ENDIF.
        REFRESH : lt_key_field, lt_field.
        CLEAR ls_seldata.
      ENDIF.
      READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
        WITH KEY variant = me->gv_variant
                 viewname = gc_logdcview
                 tabname = <fs_seldata>-tabname
                 fieldname =  <fs_seldata>-fieldname
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        APPEND <fs_seldata>-fieldname TO lt_field.
      ENDIF.
      lv_tabname = <fs_seldata>-tabname.

    ENDLOOP.

    READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
                  WITH KEY viewname = gc_logdcview
                           tabname = lv_tabname
                  BINARY SEARCH.
    IF  sy-subrc IS INITIAL.
      LOOP AT me->gt_viewkey ASSIGNING <fs_viewkey> FROM sy-tabix.
        CHECK <fs_viewkey>-keyfield = 'X'.
        IF <fs_viewkey>-viewname <> gc_logdcview OR <fs_viewkey>-tabname <> lv_tabname.
          EXIT.
        ENDIF.
        lv_field = <fs_viewkey>-fieldname.
        APPEND lv_field TO lt_key_field.

      ENDLOOP.
      IF lt_key_field IS NOT INITIAL.
        READ TABLE me->gt_seldata ASSIGNING <ft_seldata>
                    WITH KEY tabname-name = lv_tabname.
        IF sy-subrc IS INITIAL.
          APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
          APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
          SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
          DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
          APPEND lv_tabname TO lt_tabname.
        ELSE.
          ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
          ls_seldata-tabname-no_newseg = abap_true.
          ls_seldata-keyfieldnames = lt_key_field.
          ls_seldata-fieldnames = lt_field.
          APPEND lv_tabname TO lt_tabname.
          APPEND ls_seldata TO me->gt_seldata.
        ENDIF.
        REFRESH : lt_key_field, lt_field.
        CLEAR ls_seldata.
      ENDIF.
    ENDIF.

*    lt_data = it_data.
    SORT lt_tabname.
    LOOP AT it_data ASSIGNING <st_data>.
      LOOP AT lt_tabname ASSIGNING FIELD-SYMBOL(<fs_tabname>).
        lv_itab = 'ME->GT_S' && <fs_tabname>.
        lv_istruct = 'LS_S' && <fs_tabname>.
        ASSIGN (lv_itab) TO <lt_itab>.
        ASSIGN (lv_istruct) TO <fs_itab>.
        MOVE-CORRESPONDING <st_data> TO <fs_itab>.
        APPEND <fs_itab> TO <lt_itab>.
      ENDLOOP.
    ENDLOOP.


  ENDMETHOD.


    METHOD change_logsto_data.

      DATA : ls_smakt            TYPE makt,
             ls_smalg            TYPE malg,
             ls_smamt            TYPE mamt,
             ls_smara            TYPE mara,
             ls_smarc            TYPE marc,
             ls_smard            TYPE mard,
             ls_smarm            TYPE marm,
             ls_smaw1            TYPE maw1,
             ls_smbew            TYPE mbew,
             ls_smean            TYPE mean,
             ls_smlea            TYPE mlea,
             ls_smlgn            TYPE mlgn,
             ls_smlgt            TYPE mlgt,
             ls_smpgd            TYPE mpgd,
             ls_smpop            TYPE mpop,
             ls_smprw            TYPE mprw,
             ls_smveg            TYPE mveg,
             ls_smveu            TYPE mveu,
             ls_smvke            TYPE mvke,
             ls_swlk2            TYPE wlk2,
             ls_smartstatus      TYPE martstatus,
             ls_ssgt_marm        TYPE sgt_marm,
             ls_ssgt_mvke        TYPE sgt_mvke,
             ls_ssgt_madka       TYPE sgt_madka,
             ls_sfsh_seasons_mat TYPE fsh_seasons_mat,
             ls_ssgt_mlgt        TYPE sgt_mlgt,
             ls_ssgt_mlgn        TYPE sgt_mlgn,
             ls_ssgt_mrp_gn      TYPE sgt_mrp_gn,
             ls_ssgt_mrp         TYPE sgt_mrp,
             lt_var              TYPE TABLE OF /dlwupex/tvar_p,
             ls_seldata          TYPE mass_wa_tabdata,
             lt_key_field        TYPE mass_fieldtab,
             lv_field            TYPE ddobjname,
             lv_tabname          TYPE tabname16,
             lt_tabname          TYPE TABLE OF tabname16,
             lv_itab             TYPE string,
             lv_istruct          TYPE string,
             lt_field            TYPE mass_fieldtab.

      FIELD-SYMBOLS: <st_data> TYPE any,
                     <lt_itab> TYPE table,
                     <fs_itab> TYPE any.

      DATA: dref TYPE REF TO data .
      CREATE DATA dref LIKE LINE OF it_data .

      ASSIGN dref->* TO <st_data> .

      FIELD-SYMBOLS : <fs_field>  TYPE any,
                      <fs_field2> TYPE any,
                      <ft_data>   TYPE ANY TABLE.

      SORT ct_seldata.


      LOOP AT ct_seldata ASSIGNING FIELD-SYMBOL(<fs_seldata>).

        IF <fs_seldata>-tabname <> lv_tabname AND lv_tabname IS NOT INITIAL.
          READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
                WITH KEY viewname = gc_logstoview
                         tabname = lv_tabname
                BINARY SEARCH.
          IF  sy-subrc IS NOT INITIAL.
            REFRESH : lt_field.
            READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
              WITH KEY variant = me->gv_variant
                       viewname = gc_logstoview
                       tabname = <fs_seldata>-tabname
                       fieldname =  <fs_seldata>-fieldname
              BINARY SEARCH.
            IF sy-subrc IS INITIAL.
              APPEND <fs_seldata>-fieldname TO lt_field.
            ENDIF.
            lv_tabname = <fs_seldata>-tabname.
            CONTINUE.
          ENDIF.
          LOOP AT me->gt_viewkey ASSIGNING FIELD-SYMBOL(<fs_viewkey>) FROM sy-tabix.
            CHECK <fs_viewkey>-keyfield = 'X'.
            IF <fs_viewkey>-viewname <> gc_logstoview OR <fs_viewkey>-tabname <> lv_tabname.
              EXIT.
            ENDIF.
            lv_field = <fs_viewkey>-fieldname.
            APPEND lv_field TO lt_key_field.

          ENDLOOP.
          IF lt_key_field IS NOT INITIAL.
            READ TABLE me->gt_seldata ASSIGNING FIELD-SYMBOL(<ft_seldata>)
            WITH KEY tabname-name = lv_tabname.
            IF sy-subrc IS INITIAL.
              APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
              APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
              SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              APPEND lv_tabname TO lt_tabname.
            ELSE.
              ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
              ls_seldata-tabname-no_newseg = abap_true.
              ls_seldata-keyfieldnames = lt_key_field.
              ls_seldata-fieldnames = lt_field.
              APPEND lv_tabname TO lt_tabname.
              APPEND ls_seldata TO me->gt_seldata.
            ENDIF.
          ENDIF.
          REFRESH : lt_key_field, lt_field.
          CLEAR ls_seldata.
        ENDIF.
        READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
          WITH KEY variant = me->gv_variant
                   viewname = gc_logstoview
                   tabname = <fs_seldata>-tabname
                   fieldname =  <fs_seldata>-fieldname
          BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          APPEND <fs_seldata>-fieldname TO lt_field.
        ENDIF.
        lv_tabname = <fs_seldata>-tabname.

      ENDLOOP.

      READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
                    WITH KEY viewname = gc_logstoview
                             tabname = lv_tabname
                    BINARY SEARCH.
      IF  sy-subrc IS INITIAL.
        LOOP AT me->gt_viewkey ASSIGNING <fs_viewkey> FROM sy-tabix.
          CHECK <fs_viewkey>-keyfield = 'X'.
          IF <fs_viewkey>-viewname <> gc_logstoview OR <fs_viewkey>-tabname <> lv_tabname.
            EXIT.
          ENDIF.
          lv_field = <fs_viewkey>-fieldname.
          APPEND lv_field TO lt_key_field.

        ENDLOOP.
        IF lt_key_field IS NOT INITIAL.
          READ TABLE me->gt_seldata ASSIGNING <ft_seldata>
            WITH KEY tabname-name = lv_tabname.
          IF sy-subrc IS INITIAL.
            APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
            APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
            SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
            DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
            APPEND lv_tabname TO lt_tabname.
          ELSE.
            ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
            ls_seldata-tabname-no_newseg = abap_true.
            ls_seldata-keyfieldnames = lt_key_field.
            ls_seldata-fieldnames = lt_field.
            APPEND lv_tabname TO lt_tabname.
            APPEND ls_seldata TO me->gt_seldata.
          ENDIF.
          REFRESH : lt_key_field, lt_field.
          CLEAR ls_seldata.
        ENDIF.
      ENDIF.

*    lt_data = it_data.
      SORT lt_tabname.
      LOOP AT it_data ASSIGNING <st_data>.
        LOOP AT lt_tabname ASSIGNING FIELD-SYMBOL(<fs_tabname>).
          lv_itab = 'ME->GT_S' && <fs_tabname>.
          lv_istruct = 'LS_S' && <fs_tabname>.
          ASSIGN (lv_itab) TO <lt_itab>.
          ASSIGN (lv_istruct) TO <fs_itab>.
          MOVE-CORRESPONDING <st_data> TO <fs_itab>.
          APPEND <fs_itab> TO <lt_itab>.
        ENDLOOP.
      ENDLOOP.


    ENDMETHOD.


  METHOD change_nomenc_data.

    DATA : lo_classi   TYPE REF TO /sapsll/cl_prcls_api,
           lt_messages TYPE bapiret2_t,
           ls_cont_p   TYPE /dlwupex/tcont_p,
           lv_ccngn    TYPE /sapsll/ccngn,
           lv_datab    TYPE /sapsll/datab,
           lv_datbi    TYPE /sapsll/datbi,
           lv_matnr    TYPE matnr,
           lt_products TYPE /sapsll/matnr_t.

    FIELD-SYMBOLS: <st_data> TYPE any,
                   <fs>      TYPE any.

    CREATE OBJECT lo_classi.

    LOOP AT it_data ASSIGNING <st_data>.
      REFRESH : lt_messages, lt_products.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        lv_matnr = <fs>.
      ENDIF.
      APPEND lv_matnr TO lt_products.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'CCNGN' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        lv_ccngn = <fs>.
      ENDIF.
      UNASSIGN <fs>.
      ASSIGN COMPONENT 'DATABB' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        lv_datab = <fs>.
      ENDIF.
      UNASSIGN <fs>.
      ASSIGN COMPONENT 'DATBI' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        lv_datbi = <fs>.
      ENDIF.

      CALL METHOD lo_classi->create_classification
        EXPORTING
          iv_stcts    = 'EU01'
          iv_ccngn    = lv_ccngn
          iv_datab    = lv_datab
          iv_datbi    = lv_datbi
          it_products = lt_products
        IMPORTING
          et_messages = lt_messages.

      READ TABLE lt_messages TRANSPORTING NO FIELDS
           WITH KEY type = 'E'.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_messages ASSIGNING FIELD-SYMBOL(<fs_msg>).
          CHECK <fs_msg>-type = 'E'.
          ls_cont_p-id = me->gv_id.
          ls_cont_p-material = lv_matnr.
          ls_cont_p-type = <fs_msg>-type.
          ls_cont_p-idmsg = <fs_msg>-id.
          ls_cont_p-num = <fs_msg>-number.
          ls_cont_p-message_v1 = <fs_msg>-message_v1.
          ls_cont_p-message_v2 = <fs_msg>-message_v2.
          ls_cont_p-message_v3 = <fs_msg>-message_v3.
          ls_cont_p-message_v4 = <fs_msg>-message_v4.
          ls_cont_p-message = <fs_msg>-message.

          APPEND ls_cont_p TO me->gt_cont_p.
        ENDLOOP.
      ENDIF.
    ENDLOOP.





  ENDMETHOD.


  METHOD change_sales_data.

    DATA : ls_smakt            TYPE makt,
           ls_smalg            TYPE malg,
           ls_smamt            TYPE mamt,
           ls_smara            TYPE mara,
           ls_smarc            TYPE marc,
           ls_smard            TYPE mard,
           ls_smarm            TYPE marm,
           ls_smaw1            TYPE maw1,
           ls_smbew            TYPE mbew,
           ls_smean            TYPE mean,
           ls_smlea            TYPE mlea,
           ls_smlgn            TYPE mlgn,
           ls_smlgt            TYPE mlgt,
           ls_smpgd            TYPE mpgd,
           ls_smpop            TYPE mpop,
           ls_smprw            TYPE mprw,
           ls_smveg            TYPE mveg,
           ls_smveu            TYPE mveu,
           ls_smvke            TYPE mvke,
           ls_swlk2            TYPE wlk2,
           ls_smartstatus      TYPE martstatus,
           ls_ssgt_marm        TYPE sgt_marm,
           ls_ssgt_mvke        TYPE sgt_mvke,
           ls_ssgt_madka       TYPE sgt_madka,
           ls_sfsh_seasons_mat TYPE fsh_seasons_mat,
           ls_ssgt_mlgt        TYPE sgt_mlgt,
           ls_ssgt_mlgn        TYPE sgt_mlgn,
           ls_ssgt_mrp_gn      TYPE sgt_mrp_gn,
           ls_ssgt_mrp         TYPE sgt_mrp,
           lt_var              TYPE TABLE OF /dlwupex/tvar_p,
           ls_seldata          TYPE mass_wa_tabdata,
           lt_key_field        TYPE mass_fieldtab,
           lt_msg              TYPE TABLE OF massmsg,
           lv_field            TYPE ddobjname,
           lv_tabname          TYPE tabname16,
           lt_tabname          TYPE TABLE OF tabname16,
           lv_itab             TYPE string,
           lv_istruct          TYPE string,
           lt_field            TYPE mass_fieldtab.

    FIELD-SYMBOLS: <st_data> TYPE any,
                   <lt_itab> TYPE table,
                   <fs_itab> TYPE any.

    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    FIELD-SYMBOLS : <fs_field>  TYPE any,
                    <fs_field2> TYPE any,
                    <ft_data>   TYPE ANY TABLE.

    SORT ct_seldata.


    LOOP AT ct_seldata ASSIGNING FIELD-SYMBOL(<fs_seldata>).

      IF <fs_seldata>-tabname <> lv_tabname AND lv_tabname IS NOT INITIAL.
        READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
              WITH KEY viewname = gc_saleview
                       tabname = lv_tabname
              BINARY SEARCH.
        IF  sy-subrc IS NOT INITIAL.
          REFRESH : lt_field.
          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
            WITH KEY variant = me->gv_variant
                     viewname = gc_saleview
                     tabname = <fs_seldata>-tabname
                     fieldname =  <fs_seldata>-fieldname
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            APPEND <fs_seldata>-fieldname TO lt_field.
          ENDIF.
          lv_tabname = <fs_seldata>-tabname.
          CONTINUE.
        ENDIF.
        LOOP AT me->gt_viewkey ASSIGNING FIELD-SYMBOL(<fs_viewkey>) FROM sy-tabix.
          CHECK <fs_viewkey>-keyfield = 'X'.
          IF <fs_viewkey>-viewname <> gc_saleview OR <fs_viewkey>-tabname <> lv_tabname.
            EXIT.
          ENDIF.
          lv_field = <fs_viewkey>-fieldname.
          APPEND lv_field TO lt_key_field.

        ENDLOOP.
        IF lt_key_field IS NOT INITIAL.
         READ TABLE me->gt_seldata ASSIGNING FIELD-SYMBOL(<ft_seldata>)
            WITH KEY tabname-name = lv_tabname.
            IF sy-subrc IS INITIAL.
              APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
              APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
              SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              APPEND lv_tabname TO lt_tabname.
            ELSE.
              ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
              ls_seldata-tabname-no_newseg = abap_true.
              ls_seldata-keyfieldnames = lt_key_field.
              ls_seldata-fieldnames = lt_field.
              APPEND lv_tabname TO lt_tabname.
              APPEND ls_seldata TO me->gt_seldata.
            ENDIF.
        ENDIF.
        REFRESH : lt_key_field, lt_field.
        CLEAR ls_seldata.
      ENDIF.
      READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
        WITH KEY variant = me->gv_variant
                 viewname = gc_saleview
                 tabname = <fs_seldata>-tabname
                 fieldname =  <fs_seldata>-fieldname
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        APPEND <fs_seldata>-fieldname TO lt_field.
      ENDIF.
      lv_tabname = <fs_seldata>-tabname.

    ENDLOOP.

    READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
                  WITH KEY viewname = gc_saleview
                           tabname = lv_tabname
                  BINARY SEARCH.
    IF  sy-subrc IS INITIAL.
      LOOP AT me->gt_viewkey ASSIGNING <fs_viewkey> FROM sy-tabix.
        CHECK <fs_viewkey>-keyfield = 'X'.
        IF <fs_viewkey>-viewname <> gc_saleview OR <fs_viewkey>-tabname <> lv_tabname.
          EXIT.
        ENDIF.
        lv_field = <fs_viewkey>-fieldname.
        APPEND lv_field TO lt_key_field.

      ENDLOOP.
      IF lt_key_field IS NOT INITIAL.
        READ TABLE me->gt_seldata ASSIGNING <ft_seldata>
            WITH KEY tabname-name = lv_tabname.
            IF sy-subrc IS INITIAL.
              APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
              APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
              SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              APPEND lv_tabname TO lt_tabname.
            ELSE.
              ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
              ls_seldata-tabname-no_newseg = abap_true.
              ls_seldata-keyfieldnames = lt_key_field.
              ls_seldata-fieldnames = lt_field.
              APPEND lv_tabname TO lt_tabname.
              APPEND ls_seldata TO me->gt_seldata.
            ENDIF.
        REFRESH : lt_key_field, lt_field.
        CLEAR ls_seldata.
      ENDIF.
    ENDIF.

*    lt_data = it_data.
    SORT lt_tabname.
    LOOP AT it_data ASSIGNING <st_data>.
      LOOP AT lt_tabname ASSIGNING FIELD-SYMBOL(<fs_tabname>).
        lv_itab = 'ME->GT_S' && <fs_tabname>.
        lv_istruct = 'LS_S' && <fs_tabname>.
        ASSIGN (lv_itab) TO <lt_itab>.
        ASSIGN (lv_istruct) TO <fs_itab>.
        MOVE-CORRESPONDING <st_data> TO <fs_itab>.
        APPEND <fs_itab> TO <lt_itab>.
      ENDLOOP.
    ENDLOOP.


  ENDMETHOD.


  METHOD change_sales_price_data.

    TYPES : BEGIN OF ty_cond,
              matnr TYPE matnr,
              vkorg TYPE vkorg,
              vtweg TYPE vtweg,
              knumh TYPE knumh,
              kopos TYPE kopos,
              kbetr	TYPE kbetr_kond,
              kmein	TYPE kmein,
              konwa	TYPE konwa,
              kpein	TYPE kpein,
              datbi	TYPE kodatbi,
              datab TYPE kodatab,
            END OF ty_cond.


    DATA : ls_cond_change TYPE /dlwupex/price_cond,
           lt_messages    TYPE bapiret2_t,
           ls_cont_p      TYPE /dlwupex/tcont_p,
           lt_cond        TYPE TABLE OF ty_cond,
           ls_cond        TYPE ty_cond.

    FIELD-SYMBOLS: <st_data> TYPE any,
                   <fs>      TYPE any.

    SORT ct_seldata.
    READ TABLE ct_seldata TRANSPORTING NO FIELDS
            WITH KEY tabname = 'KONP'
            BINARY SEARCH.
    CHECK sy-subrc IS INITIAL.

    LOOP AT it_data ASSIGNING <st_data>.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-matnr = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'VKORG' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-vkorg = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'VTWEG' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-vtweg = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'KBETR' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-kbetr = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'KMEIN' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        READ TABLE me->gt_t006 INTO DATA(ls_t006)
          WITH KEY msehi = <fs>
               BINARY SEARCH.
        ls_cond-kmein = ls_t006-isocode.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'KONWA' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-konwa = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'KPEIN' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-kpein = <fs>.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'DATAB' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-datab = <fs>.
      ENDIF.
      IF ls_cond-datab IS INITIAL.
        ls_cond-datab = sy-datum.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'DATBI' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        ls_cond-datbi = <fs>.
      ENDIF.
      IF ls_cond-datbi IS INITIAL.
        ls_cond-datbi = '99991231'.
      ENDIF.

      UNASSIGN <fs>.
      ASSIGN COMPONENT 'STATUS' OF STRUCTURE <st_data> TO <fs>.
      IF <fs> IS ASSIGNED.
        IF <fs> = '01'.
          ls_cond-knumh = '$000000001'.
          ls_cond-kopos = '01'.
        ELSE.
          UNASSIGN <fs>.
          ASSIGN COMPONENT 'KNUMH' OF STRUCTURE <st_data> TO <fs>.
          IF <fs> IS ASSIGNED.
            ls_cond-knumh = <fs>.
          ENDIF.
          UNASSIGN <fs>.
          ASSIGN COMPONENT 'KOPOS' OF STRUCTURE <st_data> TO <fs>.
          IF <fs> IS ASSIGNED.
            ls_cond-kopos = <fs>.
          ENDIF.
        ENDIF.
      ENDIF.

      APPEND ls_cond TO lt_cond.

    ENDLOOP.


    LOOP AT lt_cond ASSIGNING FIELD-SYMBOL(<fs_cond>).


      REFRESH : lt_messages.

      CLEAR ls_cond_change.

      CHECK <fs_cond>-kbetr IS NOT INITIAL.

      ls_cond_change-cond_usage = 'A'.
      ls_cond_change-table_no = '073'.
      ls_cond_change-applicatio = 'V'.
      ls_cond_change-cond_type = 'PR00'.
      CONCATENATE <fs_cond>-vkorg <fs_cond>-vtweg <fs_cond>-matnr <fs_cond>-kmein
       INTO ls_cond_change-varkey.



      ls_cond_change-valid_to = <fs_cond>-datbi.
      ls_cond_change-valid_from = <fs_cond>-datab.
      ls_cond_change-cond_p_unt = <fs_cond>-kpein.
      ls_cond_change-cond_unit = <fs_cond>-kmein.
      ls_cond_change-base_uom = <fs_cond>-kmein.
      ls_cond_change-cond_value = <fs_cond>-kbetr.
      ls_cond_change-condcurr = <fs_cond>-konwa.

      CALL FUNCTION '/DLWUPEX/COCKPIT_CHANGE_PRICE'
        EXPORTING
          is_cond    = ls_cond_change
        IMPORTING
          et_message = lt_messages.
      READ TABLE lt_messages TRANSPORTING NO FIELDS
              WITH KEY type = 'E'.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_messages ASSIGNING FIELD-SYMBOL(<fs_msg>).
          CHECK <fs_msg>-type = 'E'.
          ls_cont_p-id = me->gv_id.
          ls_cont_p-material = <fs_cond>-matnr.
          ls_cont_p-type = <fs_msg>-type.
          ls_cont_p-idmsg = <fs_msg>-id.
          ls_cont_p-num = <fs_msg>-number.
          ls_cont_p-message_v1 = <fs_msg>-message_v1.
          ls_cont_p-message_v2 = <fs_msg>-message_v2.
          ls_cont_p-message_v3 = <fs_msg>-message_v3.
          ls_cont_p-message_v4 = <fs_msg>-message_v4.
          ls_cont_p-message = <fs_msg>-message.

          APPEND ls_cont_p TO me->gt_cont_p.
        ENDLOOP.
      ENDIF.
    ENDLOOP.



  ENDMETHOD.


  METHOD change_source_list_data.

    DATA : ls_eord     TYPE eordu,
           lt_eord     TYPE TABLE OF eordu,
           lt_eord_mod TYPE TABLE OF eordu,
           lt_eordy    TYPE TABLE OF eordu,
           lt_eord_db  TYPE TABLE OF eord,
           lv_zeord    TYPE dzeord,
           lv_werks    TYPE werks_d,
           ls_cont_p   TYPE /dlwupex/tcont_p,
           lrt_matnr   TYPE RANGE OF matnr,
           lrs_matnr   LIKE LINE OF lrt_matnr.

    FIELD-SYMBOLS: <fs_field> TYPE any,
                   <st_data>  TYPE any.
    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.

    SELECT werks, lifnr FROM t001w INTO TABLE @DATA(lt_t001w).
    IF sy-subrc IS INITIAL.
      SORT lt_t001w.
    ENDIF.

    LOOP AT it_data ASSIGNING <st_data>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_eord-matnr = <fs_field>.
      lrs_matnr-low = <fs_field>.
      APPEND lrs_matnr TO lrt_matnr.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'WERKS' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_eord-werks = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'LIFNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_eord-lifnr = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'EKORG' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_eord-ekorg = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'FLIFN' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_eord-flifn = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'RESWK' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_eord-reswk = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'BDATU' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_eord-bdatu = <fs_field>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'VDATU' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_eord-vdatu = <fs_field>.


      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'STATUS' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK <fs_field> IS  ASSIGNED.
      IF <fs_field> = '02'.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'ZEORD' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK <fs_field> IS  ASSIGNED.
        ls_eord-zeord = <fs_field>.
      ELSE.
        CLEAR ls_eord-zeord.
      ENDIF.

      APPEND ls_eord TO lt_eord.

    ENDLOOP.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.


    IF lrt_matnr IS NOT INITIAL.
      SELECT * FROM eord INTO TABLE lt_eord_db
        WHERE matnr IN lrt_matnr.
    ENDIF.
    SORT : lt_eord, lt_eord_db.

    LOOP AT lrt_matnr INTO lrs_matnr.
      REFRESH : lt_eord_mod, lt_eordy.
      READ TABLE lt_eord_db TRANSPORTING NO FIELDS
        WITH KEY matnr = lrs_matnr-low
          BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_eord_db ASSIGNING FIELD-SYMBOL(<fs_eord_db>) FROM sy-tabix.
          IF lrs_matnr-low <> <fs_eord_db>-matnr.
            EXIT.
          ENDIF.
          CLEAR : ls_eord.
          READ TABLE lt_eord ASSIGNING FIELD-SYMBOL(<fs_eord>)
              WITH KEY matnr = <fs_eord_db>-matnr
                       werks = <fs_eord_db>-werks
                       zeord = <fs_eord_db>-zeord
                       BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DATA(lv_tabix) = sy-tabix.
            ls_eord-matnr = <fs_eord>-matnr.
            ls_eord-werks = <fs_eord>-werks.
            ls_eord-zeord = <fs_eord>-zeord.
            ls_eord-lifnr = <fs_eord>-lifnr.
            ls_eord-ekorg = <fs_eord>-ekorg.
            ls_eord-flifn = <fs_eord>-flifn.
            ls_eord-reswk = <fs_eord>-reswk.
            ls_eord-bdatu = <fs_eord>-bdatu.
            ls_eord-vdatu = <fs_eord>-vdatu.
            ls_eord-ernam = sy-uname.
            ls_eord-erdat = sy-datum.
            IF ls_eord-lifnr IS INITIAL.
              READ TABLE lt_t001w INTO DATA(ls_t001w)
                WITH KEY werks = <fs_eord>-reswk
                BINARY SEARCH.
              IF sy-subrc IS INITIAL.
                ls_eord-lifnr = ls_t001w-lifnr.
              ENDIF.
            ENDIF.
            ls_eord-kz = 'U'.
            APPEND ls_eord TO lt_eord_mod.
            CLEAR ls_eord.
            ls_eord-matnr = <fs_eord_db>-matnr.
            ls_eord-werks = <fs_eord_db>-werks.
            ls_eord-zeord = <fs_eord_db>-zeord.
            ls_eord-lifnr = <fs_eord_db>-lifnr.
            ls_eord-ekorg = <fs_eord_db>-ekorg.
            ls_eord-flifn = <fs_eord_db>-flifn.
            ls_eord-reswk = <fs_eord_db>-reswk.
            ls_eord-bdatu = <fs_eord_db>-bdatu.
            ls_eord-vdatu = <fs_eord_db>-vdatu.
            ls_eord-ernam = sy-uname.
            ls_eord-erdat = sy-datum.
            IF ls_eord-lifnr IS INITIAL.
              READ TABLE lt_t001w INTO ls_t001w
                WITH KEY werks = <fs_eord>-reswk
                BINARY SEARCH.
              IF sy-subrc IS INITIAL.
                ls_eord-lifnr = ls_t001w-lifnr.
              ENDIF.
            ENDIF.
*            ls_eord-kz = 'U'.
            APPEND ls_eord TO lt_eordy.
            DELETE lt_eord INDEX lv_tabix.
*          ELSE.
*            ls_eord-matnr = <fs_eord_db>-matnr.
*            ls_eord-werks = <fs_eord_db>-werks.
*            ls_eord-zeord = <fs_eord_db>-zeord.
*            ls_eord-lifnr = <fs_eord_db>-lifnr.
*            ls_eord-ekorg = <fs_eord_db>-ekorg.
*            ls_eord-flifn = <fs_eord_db>-flifn.
*            ls_eord-reswk = <fs_eord_db>-reswk.
*            ls_eord-bdatu = <fs_eord_db>-bdatu.
*            ls_eord-vdatu = <fs_eord_db>-vdatu.
*            ls_eord-ernam = sy-uname.
*            ls_eord-erdat = sy-datum.
*            IF ls_eord-lifnr IS INITIAL.
*              READ TABLE lt_t001w INTO ls_t001w
*                WITH KEY werks = <fs_eord>-reswk
*                BINARY SEARCH.
*              IF sy-subrc IS INITIAL.
*                ls_eord-lifnr = ls_t001w-lifnr.
*              ENDIF.
*            ENDIF.
**            ls_eord-kz = 'U'.
*            APPEND ls_eord TO lt_eord_mod.
*            APPEND ls_eord TO lt_eordy.
          ENDIF.
        ENDLOOP.
      ENDIF.
      READ TABLE lt_eord TRANSPORTING NO FIELDS
              WITH KEY matnr = lrs_matnr-low
                BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_eord ASSIGNING <fs_eord> FROM sy-tabix.
          IF lrs_matnr-low <> <fs_eord>-matnr.
            EXIT.
          ENDIF.

          CHECK <fs_eord>-zeord IS INITIAL.
          CLEAR ls_eord.

* gestion du cas des entrées mutliples pour un même entrepôt
          IF lv_werks <> <fs_eord>-werks.
            CLEAR lv_zeord.
          ENDIF.

          IF lv_zeord IS INITIAL.
            READ TABLE lt_eord_db TRANSPORTING NO FIELDS
                WITH KEY matnr = <fs_eord>-matnr
                         werks = <fs_eord>-werks
                         BINARY SEARCH.
            IF sy-subrc IS INITIAL.
              LOOP AT lt_eord_db ASSIGNING <fs_eord_db> FROM sy-tabix.
                IF <fs_eord_db>-werks <> <fs_eord>-werks.
                  EXIT.
                ENDIF.
                lv_zeord = <fs_eord_db>-zeord.
              ENDLOOP.
              ls_eord-zeord = lv_zeord = lv_zeord + 1.
            ELSE.
              ls_eord-zeord = lv_zeord = lv_zeord + 1.
            ENDIF.
          ELSE.
            ls_eord-zeord = lv_zeord = lv_zeord + 1.
          ENDIF.

          ls_eord-matnr = <fs_eord>-matnr.
          ls_eord-werks = <fs_eord>-werks.
          ls_eord-lifnr = <fs_eord>-lifnr.
          ls_eord-ekorg = <fs_eord>-ekorg.
          ls_eord-flifn = <fs_eord>-flifn.
          ls_eord-reswk = <fs_eord>-reswk.
          ls_eord-bdatu = <fs_eord>-bdatu.
          ls_eord-vdatu = <fs_eord>-vdatu.
          ls_eord-ernam = sy-uname.
          ls_eord-erdat = sy-datum.
          ls_eord-kz = 'I'.
          IF ls_eord-lifnr IS INITIAL.
            READ TABLE lt_t001w INTO ls_t001w
              WITH KEY werks = <fs_eord>-reswk
              BINARY SEARCH.
            IF sy-subrc IS INITIAL.
              ls_eord-lifnr = ls_t001w-lifnr.
            ENDIF.
          ENDIF.
          APPEND ls_eord TO lt_eord_mod.
          lv_werks = <fs_eord>-werks.
        ENDLOOP.
      ENDIF.
      CALL FUNCTION 'ME_UPDATE_SOURCES_OF_SUPPLY'
        EXPORTING
          i_changedocument = 'U'
        TABLES
          xeord            = lt_eord_mod
          yeord            = lt_eordy
        EXCEPTIONS
          error_message    = 1.

      IF sy-subrc EQ 0.
        COMMIT WORK AND WAIT.
      ELSE.
*     On remplit la table de message d'erreur.
        ls_cont_p-id = me->gv_id.
        ls_cont_p-material = lrs_matnr-low.
        ls_cont_p-type       = sy-msgty.
        ls_cont_p-idmsg      = sy-msgid.
        ls_cont_p-num        = sy-msgno.
        ls_cont_p-message_v1      = sy-msgv1.
        ls_cont_p-message_v2      = sy-msgv2.
        ls_cont_p-message_v3      = sy-msgv3.
        ls_cont_p-message_v4      = sy-msgv4.
        MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
                INTO ls_cont_p-message
                WITH ls_cont_p-message_v1 ls_cont_p-message_v2 ls_cont_p-message_v3 ls_cont_p-message_v4.

        APPEND ls_cont_p TO me->gt_cont_p.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD change_taxe_data.


    DATA : ls_bapimatmln   TYPE bapimatmln,
           ls_bapimatmlnrt TYPE bapie1mlanrt,
           lt_bapimatmlnrt TYPE bapie1mlanrt_tab,
           ls_mlan         TYPE mlan,
           ls_headdata     TYPE bapie1mathead,
           ls_cont_p       TYPE /dlwupex/tcont_p,
           lt_lognumbers   TYPE szal_lognumbers,
           ls_lognumbers   TYPE szal_lognumber,
           lt_message      TYPE TABLE OF balm,
           ls_message      TYPE balm,
           lv_field        TYPE string,
           ls_return       TYPE bapireturn1.

    FIELD-SYMBOLS: <fs_field> TYPE any,
                   <st_data>  TYPE any.
    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    READ TABLE me->gt_tbuhead INTO DATA(ls_buhead) INDEX 1.

    SELECT * FROM tstl INTO TABLE @DATA(lt_tstl)
      WHERE talnd = @ls_buhead-land1.

    SORT lt_tstl BY tatyp.

    SELECT * FROM /dlwupex/ttaxe INTO TABLE @DATA(lt_taxe)
         WHERE pays = @ls_buhead-land1.

    SORT lt_taxe BY pays taxe.


    LOOP AT it_data ASSIGNING <st_data>.

      CLEAR : ls_mlan, ls_bapimatmln, ls_bapimatmlnrt.
      REFRESH lt_bapimatmlnrt.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      ls_mlan-matnr = <fs_field>.

      ls_mlan-aland = ls_buhead-land1.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXM1' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxm1 = <fs_field>.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXM2' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxm2 = <fs_field>.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXM3' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxm3 = <fs_field>.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXM4' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxm4 = <fs_field>.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXM5' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxm5 = <fs_field>.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXM6' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxm6 = <fs_field>.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXM7' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxm7 = <fs_field>.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXM8' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxm8 = <fs_field>.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXM9' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxm9 = <fs_field>.
      ENDIF.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'TAXIM' OF STRUCTURE <st_data> TO <fs_field>.
      IF sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        ls_mlan-taxim = <fs_field>.
      ENDIF.

      SELECT SINGLE * FROM mlan INTO @DATA(ls_mlan_db)
        WHERE matnr = @ls_mlan-matnr AND
              aland = @ls_mlan-aland.

      IF ls_mlan-taxim IS INITIAL.
        ls_mlan-taxim = ls_mlan_db-taxim.
      ENDIF.

      CALL FUNCTION 'MAP2E_MLAN_TO_BAPIMATMLN'
        EXPORTING
          mlan       = ls_mlan
        CHANGING
          bapimatmln = ls_bapimatmln.

      MOVE-CORRESPONDING ls_bapimatmln TO ls_bapimatmlnrt.
      ls_bapimatmlnrt-tax_ind = ls_bapimatmln-taxflag.
      ls_bapimatmlnrt-taxclass_1 = ls_bapimatmln-taxclass1.
      ls_bapimatmlnrt-taxclass_2 = ls_bapimatmln-taxclass2.
      ls_bapimatmlnrt-taxclass_3 = ls_bapimatmln-taxclass3.
      ls_bapimatmlnrt-taxclass_4 = ls_bapimatmln-taxclass4.
      ls_bapimatmlnrt-taxclass_5 = ls_bapimatmln-taxclass5.
      ls_bapimatmlnrt-taxclass_6 = ls_bapimatmln-taxclass6.
      ls_bapimatmlnrt-taxclass_7 = ls_bapimatmln-taxclass7.
      ls_bapimatmlnrt-taxclass_8 = ls_bapimatmln-taxclass8.
      ls_bapimatmlnrt-taxclass_9 = ls_bapimatmln-taxclass9.

      LOOP AT lt_tstl ASSIGNING FIELD-SYMBOL(<fs_tstl>).
        UNASSIGN <fs_field>.
        lv_field = 'LS_BAPIMATMLNRT-TAX_TYPE_' && <fs_tstl>-lfdnr.
        ASSIGN (lv_field) TO <fs_field>.
        <fs_field> =  <fs_tstl>-tatyp.
      ENDLOOP.


      IF ls_bapimatmlnrt-tax_type_2 IS NOT INITIAL AND ls_bapimatmlnrt-taxclass_2 IS INITIAL.
        READ TABLE lt_taxe TRANSPORTING NO FIELDS
        WITH KEY pays = ls_mlan-aland
                 taxe = ls_bapimatmlnrt-tax_type_2
                 BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          ls_bapimatmlnrt-taxclass_2 = ls_mlan_db-taxm2.
        ELSE.
          ls_bapimatmlnrt-taxclass_2 = ls_bapimatmlnrt-taxclass_1.
        ENDIF.
      ENDIF.
      IF ls_bapimatmlnrt-tax_type_3 IS NOT INITIAL AND ls_bapimatmlnrt-taxclass_3 IS INITIAL.
        READ TABLE lt_taxe TRANSPORTING NO FIELDS
        WITH KEY pays = ls_mlan-aland
                 taxe = ls_bapimatmlnrt-tax_type_3
                 BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          ls_bapimatmlnrt-taxclass_3 = ls_mlan_db-taxm3.
        ELSE.
          ls_bapimatmlnrt-taxclass_3 = ls_bapimatmlnrt-taxclass_1.
        ENDIF.
      ENDIF.
      IF ls_bapimatmlnrt-tax_type_4 IS NOT INITIAL AND ls_bapimatmlnrt-taxclass_4 IS INITIAL.
        READ TABLE lt_taxe TRANSPORTING NO FIELDS
        WITH KEY pays = ls_mlan-aland
                 taxe = ls_bapimatmlnrt-tax_type_4
                 BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          ls_bapimatmlnrt-taxclass_4 = ls_mlan_db-taxm4.
        ELSE.
          ls_bapimatmlnrt-taxclass_4 = ls_bapimatmlnrt-taxclass_1.
        ENDIF.
      ENDIF.
      IF ls_bapimatmlnrt-tax_type_5 IS NOT INITIAL AND ls_bapimatmlnrt-taxclass_5 IS INITIAL.
        READ TABLE lt_taxe TRANSPORTING NO FIELDS
        WITH KEY pays = ls_mlan-aland
                 taxe = ls_bapimatmlnrt-tax_type_5
                 BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          ls_bapimatmlnrt-taxclass_5 = ls_mlan_db-taxm5.
        ELSE.
          ls_bapimatmlnrt-taxclass_5 = ls_bapimatmlnrt-taxclass_1.
        ENDIF.
      ENDIF.
      IF ls_bapimatmlnrt-tax_type_6 IS NOT INITIAL AND ls_bapimatmlnrt-taxclass_6 IS INITIAL.
        READ TABLE lt_taxe TRANSPORTING NO FIELDS
        WITH KEY pays = ls_mlan-aland
                 taxe = ls_bapimatmlnrt-tax_type_6
                 BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          ls_bapimatmlnrt-taxclass_6 = ls_mlan_db-taxm6.
        ELSE.
          ls_bapimatmlnrt-taxclass_6 = ls_bapimatmlnrt-taxclass_1.
        ENDIF.
      ENDIF.
      IF ls_bapimatmlnrt-tax_type_7 IS NOT INITIAL AND ls_bapimatmlnrt-taxclass_7 IS INITIAL.
        READ TABLE lt_taxe TRANSPORTING NO FIELDS
        WITH KEY pays = ls_mlan-aland
                 taxe = ls_bapimatmlnrt-tax_type_7
                 BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          ls_bapimatmlnrt-taxclass_7 = ls_mlan_db-taxm7.
        ELSE.
          ls_bapimatmlnrt-taxclass_7 = ls_bapimatmlnrt-taxclass_1.
        ENDIF.
      ENDIF.
      IF ls_bapimatmlnrt-tax_type_8 IS NOT INITIAL AND ls_bapimatmlnrt-taxclass_8 IS INITIAL.
        READ TABLE lt_taxe TRANSPORTING NO FIELDS
        WITH KEY pays = ls_mlan-aland
                 taxe = ls_bapimatmlnrt-tax_type_8
                 BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          ls_bapimatmlnrt-taxclass_8 = ls_mlan_db-taxm8.
        ELSE.
          ls_bapimatmlnrt-taxclass_8 = ls_bapimatmlnrt-taxclass_1.
        ENDIF.
      ENDIF.
      IF ls_bapimatmlnrt-tax_type_9 IS NOT INITIAL AND ls_bapimatmlnrt-taxclass_9 IS INITIAL.
        READ TABLE lt_taxe TRANSPORTING NO FIELDS
        WITH KEY pays = ls_mlan-aland
                 taxe = ls_bapimatmlnrt-tax_type_9
                 BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          ls_bapimatmlnrt-taxclass_9 = ls_mlan_db-taxm9.
        ELSE.
          ls_bapimatmlnrt-taxclass_9 = ls_bapimatmlnrt-taxclass_1.
        ENDIF.
      ENDIF.


      CLEAR:  ls_headdata, ls_return.
      ls_headdata-material = ls_bapimatmlnrt-material.
      ls_headdata-function = '005'.
      ls_headdata-basic_view = abap_true.

      APPEND ls_bapimatmlnrt TO lt_bapimatmlnrt.
      CALL FUNCTION 'BAPI_MATERIAL_MAINTAINDATA_RT'
        EXPORTING
          headdata           = ls_headdata
        IMPORTING
          return             = ls_return
        TABLES
          taxclassifications = lt_bapimatmlnrt.

      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        EXPORTING
          wait = abap_true.

      IF ls_return-type = 'E'.
        IF ls_return-log_no IS NOT INITIAL.

          ls_lognumbers-item = ls_return-log_no.
          APPEND ls_lognumbers TO lt_lognumbers.

          CALL FUNCTION 'APPL_LOG_READ_DB_WITH_LOGNO'
            TABLES
              lognumbers = lt_lognumbers
              messages   = lt_message.
          DELETE lt_message WHERE msgty <> 'E'.
          LOOP AT lt_message ASSIGNING FIELD-SYMBOL(<fs_message>).
            ls_cont_p-id = me->gv_id.
            ls_cont_p-material = ls_headdata-material.
            ls_cont_p-idmsg = <fs_message>-msgid.
            ls_cont_p-type = <fs_message>-msgty.
            ls_cont_p-num = <fs_message>-msgno.
            ls_cont_p-message_v1 = <fs_message>-msgv1.
            ls_cont_p-message_v2 = <fs_message>-msgv2.
            ls_cont_p-message_v3 = <fs_message>-msgv3.
            ls_cont_p-message_v4 = <fs_message>-msgv4.

            MESSAGE ID ls_cont_p-idmsg TYPE ls_cont_p-type NUMBER ls_cont_p-num
               INTO ls_cont_p-message WITH ls_cont_p-message_v1 ls_cont_p-message_v2
                                        ls_cont_p-message_v3 ls_cont_p-message_v4.

            APPEND ls_cont_p TO me->gt_cont_p.
          ENDLOOP.
        ELSE.
          ls_cont_p-id = me->gv_id.
          ls_cont_p-material = ls_headdata-material.
          ls_cont_p-type = ls_return-type.
          ls_cont_p-idmsg = ls_return-id.
          ls_cont_p-num = ls_return-number.
          ls_cont_p-message_v1 = ls_return-message_v1.
          ls_cont_p-message_v2 = ls_return-message_v2.
          ls_cont_p-message_v3 = ls_return-message_v3.
          ls_cont_p-message_v4 = ls_return-message_v4.
          ls_cont_p-message = ls_return-message.

          APPEND ls_cont_p TO me->gt_cont_p.
        ENDIF.
      ENDIF.

    ENDLOOP.


  ENDMETHOD.


  METHOD change_unit_data.

    DATA : ls_smakt            TYPE makt,
           ls_smalg            TYPE malg,
           ls_smamt            TYPE mamt,
           ls_smara            TYPE mara,
           ls_smarc            TYPE marc,
           ls_smard            TYPE mard,
           ls_smarm            TYPE marm,
           ls_smaw1            TYPE maw1,
           ls_smbew            TYPE mbew,
           ls_smean            TYPE mean,
           ls_smlea            TYPE mlea,
           ls_smlgn            TYPE mlgn,
           ls_smlgt            TYPE mlgt,
           ls_smpgd            TYPE mpgd,
           ls_smpop            TYPE mpop,
           ls_smprw            TYPE mprw,
           ls_smveg            TYPE mveg,
           ls_smveu            TYPE mveu,
           ls_smvke            TYPE mvke,
           ls_swlk2            TYPE wlk2,
           ls_smartstatus      TYPE martstatus,
           ls_ssgt_marm        TYPE sgt_marm,
           ls_ssgt_mvke        TYPE sgt_mvke,
           ls_ssgt_madka       TYPE sgt_madka,
           ls_sfsh_seasons_mat TYPE fsh_seasons_mat,
           ls_ssgt_mlgt        TYPE sgt_mlgt,
           ls_ssgt_mlgn        TYPE sgt_mlgn,
           ls_ssgt_mrp_gn      TYPE sgt_mrp_gn,
           ls_ssgt_mrp         TYPE sgt_mrp,
           lt_var              TYPE TABLE OF /dlwupex/tvar_p,
           ls_seldata          TYPE mass_wa_tabdata,
           lt_key_field        TYPE mass_fieldtab,
           lt_msg              TYPE TABLE OF massmsg,
           lv_field            TYPE ddobjname,
           lv_tabname          TYPE tabname16,
           lt_tabname          TYPE TABLE OF tabname16,
           lv_itab             TYPE string,
           lv_istruct          TYPE string,
           lt_field            TYPE mass_fieldtab.

    FIELD-SYMBOLS: <st_data> TYPE any,
                   <lt_itab> TYPE table,
                   <fs_itab> TYPE any.

    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    FIELD-SYMBOLS : <fs_field>  TYPE any,
                    <fs_field2> TYPE any,
                    <ft_data>   TYPE ANY TABLE.

    SORT ct_seldata.


    LOOP AT ct_seldata ASSIGNING FIELD-SYMBOL(<fs_seldata>).

      IF <fs_seldata>-tabname <> lv_tabname AND lv_tabname IS NOT INITIAL.
        READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
              WITH KEY viewname = gc_unitview
                       tabname = lv_tabname
              BINARY SEARCH.
        IF  sy-subrc IS NOT INITIAL.
          REFRESH : lt_field.
          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
            WITH KEY variant = me->gv_variant
                     viewname = gc_unitview
                     tabname = <fs_seldata>-tabname
                     fieldname =  <fs_seldata>-fieldname
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            APPEND <fs_seldata>-fieldname TO lt_field.
          ENDIF.
          lv_tabname = <fs_seldata>-tabname.
          CONTINUE.
        ENDIF.
        LOOP AT me->gt_viewkey ASSIGNING FIELD-SYMBOL(<fs_viewkey>) FROM sy-tabix.
          CHECK <fs_viewkey>-keyfield = 'X'.
          IF <fs_viewkey>-viewname <> gc_unitview OR <fs_viewkey>-tabname <> lv_tabname.
            EXIT.
          ENDIF.
          lv_field = <fs_viewkey>-fieldname.
          APPEND lv_field TO lt_key_field.

        ENDLOOP.
        IF lt_key_field IS NOT INITIAL.
          READ TABLE me->gt_seldata ASSIGNING FIELD-SYMBOL(<ft_seldata>)
            WITH KEY tabname-name = lv_tabname.
            IF sy-subrc IS INITIAL.
              APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
              APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
              SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              APPEND lv_tabname TO lt_tabname.
            ELSE.
              ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
              ls_seldata-tabname-no_newseg = abap_true.
              ls_seldata-keyfieldnames = lt_key_field.
              ls_seldata-fieldnames = lt_field.
              APPEND lv_tabname TO lt_tabname.
              APPEND ls_seldata TO me->gt_seldata.
            ENDIF.
        ENDIF.
        REFRESH : lt_key_field, lt_field.
        CLEAR ls_seldata.
      ENDIF.
      READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
        WITH KEY variant = me->gv_variant
                 viewname = gc_unitview
                 tabname = <fs_seldata>-tabname
                 fieldname =  <fs_seldata>-fieldname
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        APPEND <fs_seldata>-fieldname TO lt_field.
      ENDIF.
      lv_tabname = <fs_seldata>-tabname.

    ENDLOOP.

    READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
                  WITH KEY viewname = gc_unitview
                           tabname = lv_tabname
                  BINARY SEARCH.
    IF  sy-subrc IS INITIAL.
      LOOP AT me->gt_viewkey ASSIGNING <fs_viewkey> FROM sy-tabix.
        CHECK <fs_viewkey>-keyfield = 'X'.
        IF <fs_viewkey>-viewname <> gc_unitview OR <fs_viewkey>-tabname <> lv_tabname.
          EXIT.
        ENDIF.
        lv_field = <fs_viewkey>-fieldname.
        APPEND lv_field TO lt_key_field.

      ENDLOOP.
      IF lt_key_field IS NOT INITIAL.
        READ TABLE me->gt_seldata ASSIGNING <ft_seldata>
            WITH KEY tabname-name = lv_tabname.
            IF sy-subrc IS INITIAL.
              APPEND LINES OF lt_key_field TO <ft_seldata>-keyfieldnames.
              APPEND LINES OF lt_field TO <ft_seldata>-fieldnames.
              SORT : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              DELETE ADJACENT DUPLICATES FROM : <ft_seldata>-keyfieldnames, <ft_seldata>-fieldnames.
              APPEND lv_tabname TO lt_tabname.
            ELSE.
              ls_seldata-tabname-name = ls_seldata-tabname-name_db = lv_tabname.
              ls_seldata-tabname-no_newseg = abap_true.
              ls_seldata-keyfieldnames = lt_key_field.
              ls_seldata-fieldnames = lt_field.
              APPEND lv_tabname TO lt_tabname.
              APPEND ls_seldata TO me->gt_seldata.
            ENDIF.
        REFRESH : lt_key_field, lt_field.
        CLEAR ls_seldata.
      ENDIF.
    ENDIF.

    SORT ct_seldata BY fieldname.
    READ TABLE ct_seldata TRANSPORTING NO FIELDS
      WITH KEY fieldname = 'EAN11'.
    IF sy-subrc IS INITIAL.
      DATA(lv_checkean) = abap_true.
    ELSE.
      READ TABLE ct_seldata TRANSPORTING NO FIELDS
        WITH KEY fieldname = 'EANTP'.
      IF sy-subrc IS INITIAL.
        lv_checkean = abap_true.
      ELSE.
        READ TABLE ct_seldata TRANSPORTING NO FIELDS
          WITH KEY fieldname = 'HPEAN'.
        IF sy-subrc IS INITIAL.
          lv_checkean = abap_true.
        ENDIF.
      ENDIF.
    ENDIF.


*    lt_data = it_data.
    SORT lt_tabname.
    LOOP AT it_data ASSIGNING <st_data>.
      LOOP AT lt_tabname ASSIGNING FIELD-SYMBOL(<fs_tabname>).
        lv_itab = 'ME->GT_S' && <fs_tabname>.
        lv_istruct = 'LS_S' && <fs_tabname>.
        ASSIGN (lv_itab) TO <lt_itab>.
        ASSIGN (lv_istruct) TO <fs_itab>.
        MOVE-CORRESPONDING <st_data> TO <fs_itab>.
        APPEND <fs_itab> TO <lt_itab>.
      ENDLOOP.
    ENDLOOP.

    IF lv_checkean = abap_true.
      CALL METHOD me->change_ean_data
        EXPORTING
          it_data    = it_data
        CHANGING
          ct_seldata = me->gt_seldata
          ct_mean    = me->gt_smean
          ct_marm    = me->gt_smarm.
    ENDIF.


  ENDMETHOD.


  METHOD check_before_save.

    DATA : lv_msg    TYPE bapi_msg,
           lv_matnr  TYPE matnr,
           lv_werks  TYPE werks_d,
           lv_value  TYPE string,
           lv_value2 TYPE string,
           lv_rc     TYPE sysubrc.

    FIELD-SYMBOLS : <fs_field>        TYPE any,
                    <fs_field2>       TYPE any,
                    <fs_field_linked> TYPE any.

    READ TABLE me->gt_check_link TRANSPORTING NO FIELDS
      WITH KEY viewname = iv_view
      BINARY SEARCH.
    CHECK sy-subrc IS INITIAL.

    CALL METHOD /dlwupex/cl_check_modif=>get_instance
      EXPORTING
        iv_variant = me->gv_variant
        iv_wa      = me->gv_wa
      RECEIVING
        rv_object  = DATA(lv_object).

    LOOP AT ct_data ASSIGNING FIELD-SYMBOL(<fs_data>).
      CLEAR lv_rc.

* on vérifie en premier si les valeurs obligatoires (pour insertions) sont remplies
      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'STATUS' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
               WITH KEY viewname = iv_view
                        BINARY SEARCH.
      IF <fs_field> = '01'.
        LOOP AT me->gt_tvar_p ASSIGNING FIELD-SYMBOL(<fs_tvar_p>) FROM sy-tabix.
          IF <fs_tvar_p>-viewname <> iv_view.
            EXIT.
          ENDIF.
          CHECK <fs_tvar_p>-obligatory = '2' OR <fs_tvar_p>-obligatory = '3'.

          UNASSIGN <fs_field2>.
          ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE <fs_data> TO <fs_field2>.
          CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
          IF <fs_field2> IS INITIAL.
            UNASSIGN <fs_field2>.
            ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <fs_data> TO <fs_field2>.
            CHECK <fs_field2> IS ASSIGNED.
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER '030'
              INTO lv_msg
              WITH <fs_tvar_p>-fieldname.
            lv_rc = 4.
            <fs_field2> = lv_msg.
            ev_rc = lv_rc.
            EXIT.
          ENDIF.
        ENDLOOP.

* check des données supplémentaire en insertion.
        IF lv_rc IS INITIAL.
          READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
            WITH KEY viewname = iv_view
            BINARY SEARCH.
          LOOP AT me->gt_viewkey ASSIGNING FIELD-SYMBOL(<fs_viewkey>).
            IF <fs_viewkey>-viewname <> iv_view.
              EXIT.
            ENDIF.
            CHECK <fs_viewkey>-to_be_check = abap_true.

            UNASSIGN <fs_field>.
            ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data> TO <fs_field>.
            CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
            lv_matnr = <fs_field>.

            UNASSIGN <fs_field>.
            ASSIGN COMPONENT <fs_viewkey>-fieldname OF STRUCTURE <fs_data> TO <fs_field>.
            CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
            lv_value = <fs_field>.

            CALL METHOD lv_object->/dlwupex/if_check_modif~check
              EXPORTING
                iv_art       = lv_matnr
                iv_viewname  = iv_view
                iv_fieldname = <fs_viewkey>-fieldname
                iv_value     = lv_value
              CHANGING
                cv_msg       = lv_msg
                cv_rc        = lv_rc.
            IF lv_rc IS NOT INITIAL.
              UNASSIGN <fs_field>.
              ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <fs_data> TO <fs_field>.
              CHECK <fs_field> IS ASSIGNED.
              <fs_field> = lv_msg.
              ev_rc = lv_rc.
            ENDIF.

          ENDLOOP.
        ENDIF.
      ENDIF.

      IF lv_rc IS INITIAL.
        READ TABLE me->gt_check_link TRANSPORTING NO FIELDS
            WITH KEY viewname = iv_view
            BINARY SEARCH.
        LOOP AT me->gt_check_link ASSIGNING FIELD-SYMBOL(<fs_check_link>) FROM sy-tabix.
          CHECK <fs_check_link>-viewname = iv_view.
          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
           WITH KEY viewname = iv_view
                    tabname = <fs_check_link>-tabname
                    fieldname = <fs_check_link>-fieldname
                    BINARY SEARCH.
          CHECK sy-subrc IS INITIAL.
          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
            WITH KEY viewname = iv_view
                     tabname = <fs_check_link>-tabname_linked
                     fieldname = <fs_check_link>-fieldname_linked
                     BINARY SEARCH.
          CHECK sy-subrc IS INITIAL.
          UNASSIGN : <fs_field>, <fs_field_linked>.
          ASSIGN COMPONENT <fs_check_link>-fieldname OF STRUCTURE <fs_data> TO <fs_field>.
          ASSIGN COMPONENT <fs_check_link>-fieldname_linked OF STRUCTURE <fs_data> TO <fs_field_linked>.
          CHECK <fs_field> IS ASSIGNED AND <fs_field_linked> IS ASSIGNED.

          UNASSIGN <fs_field2>.
          ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data> TO <fs_field2>.
          IF lv_object IS NOT INITIAL.
            lv_value = <fs_field>.
            lv_value2 = <fs_field_linked>.
            CALL METHOD lv_object->/dlwupex/if_check_modif~check_fields
              EXPORTING
                iv_art              = <fs_field2>
                iv_viewname         = iv_view
                iv_fieldname        = <fs_check_link>-fieldname
                iv_value            = lv_value
                iv_fieldname_linked = <fs_check_link>-fieldname_linked
                iv_value_linked     = lv_value2
              CHANGING
                cv_rc               = lv_rc
                cv_msg              = lv_msg.
            IF lv_rc IS NOT INITIAL.
              UNASSIGN <fs_field>.
              ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <fs_data> TO <fs_field>.
              CHECK <fs_field> IS ASSIGNED.
              <fs_field> = lv_msg.
              ev_rc = lv_rc.
            ENDIF.
          ENDIF.
          "ERRMESSAGE
        ENDLOOP.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD check_before_save_carac.


    DATA : lv_msg    TYPE bapi_msg,
           lv_matnr  TYPE matnr,
           lv_value  TYPE string,
           lv_rc     TYPE sysubrc.

    FIELD-SYMBOLS : <fs_field>  TYPE any,
                    <fs_field2> TYPE any.

    CALL METHOD /dlwupex/cl_check_modif=>get_instance
      EXPORTING
        iv_variant = me->gv_variant
        iv_wa      = me->gv_wa
      RECEIVING
        rv_object  = data(lv_object).

    LOOP AT ct_data ASSIGNING FIELD-SYMBOL(<fs_data>).
      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'ATINN' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      lv_value = <fs_field>.

      UNASSIGN <fs_field2>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data> TO <fs_field2>.
      CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
      lv_matnr = <fs_field2>.

      CALL METHOD lv_object->/dlwupex/if_check_modif~check
        EXPORTING
          iv_art       = lv_matnr
          iv_viewname  = gc_caractview
          iv_fieldname = 'ATINN'
          iv_value     = lv_value
        CHANGING
          cv_rc        = lv_rc
          cv_msg       = lv_msg.
      IF lv_rc IS NOT INITIAL.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <fs_data> TO <fs_field>.
        CHECK <fs_field> IS ASSIGNED.
        <fs_field> = lv_msg.
        ev_rc = lv_rc.
        CONTINUE.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD check_before_save_fia.

    TYPES : BEGIN OF ty_eine_key,
              infnr TYPE infnr,
              ekorg TYPE ekorg,
              esokz TYPE esokz,
              werks TYPE ewerk,
            END OF ty_eine_key.

    DATA : lv_msg    TYPE bapi_msg,
           lv_value  TYPE string,
           lv_value2 TYPE string,
           lv_matnr  TYPE matnr,
           lv_unit   TYPE meins,
           lrt_matnr TYPE RANGE OF matnr,
           lrs_matnr LIKE LINE OF lrt_matnr,
           lt_eine_k TYPE TABLE OF ty_eine_key,
           ls_eine_k TYPE ty_eine_key,
           lv_iseina TYPE c,
           lv_rc     TYPE sysubrc.

    FIELD-SYMBOLS : <fs_field>        TYPE any,
                    <fs_infnr>        TYPE any,
                    <fs_ekorg>        TYPE any,
                    <fs_esokz>        TYPE any,
                    <fs_werks>        TYPE any,
                    <fs_field2>       TYPE any,
                    <fs_field_linked> TYPE any,
                    <st_data>         TYPE any.

    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF ct_data .

    ASSIGN dref->* TO <st_data> .

    READ TABLE me->gt_check_link TRANSPORTING NO FIELDS
         WITH KEY viewname = gc_fiaview
         BINARY SEARCH.

    CALL METHOD /dlwupex/cl_check_modif=>get_instance
      EXPORTING
        iv_variant = me->gv_variant
        iv_wa      = me->gv_wa
      RECEIVING
        rv_object  = DATA(lv_object).


    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.

    LOOP AT ct_data ASSIGNING <st_data>.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      lrs_matnr-low = <fs_field>.
      APPEND lrs_matnr TO lrt_matnr.

    ENDLOOP.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.

    SELECT matnr, meins INTO TABLE @DATA(lt_mara)
      FROM mara
      WHERE matnr IN @lrt_matnr.

    SORT lt_mara BY matnr.

    LOOP AT ct_data ASSIGNING <st_data>.
      CLEAR lv_rc.

* on vérifie en premier si les valeurs obligatoires (pour insertions) sont remplies
      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'STATUS' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
               WITH KEY viewname = gc_fiaview
                        BINARY SEARCH.
      IF <fs_field> = '01'.
        LOOP AT me->gt_tvar_p ASSIGNING FIELD-SYMBOL(<fs_tvar_p>) FROM sy-tabix.
          IF <fs_tvar_p>-viewname <> gc_fiaview.
            EXIT.
          ENDIF.

          CHECK <fs_tvar_p>-obligatory = '1' OR <fs_tvar_p>-obligatory = '3'.

          UNASSIGN : <fs_field2>.
          ASSIGN COMPONENT 'ISEINA' OF STRUCTURE <st_data> TO <fs_field2>.
          CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
          IF <fs_field2> IS INITIAL. "EINE
            CHECK <fs_tvar_p>-tabname = 'EINE' OR <fs_tvar_p>-tabname = 'A018' OR <fs_tvar_p>-tabname = 'KONP'.
            UNASSIGN <fs_field2>.
            ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE <st_data> TO <fs_field2>.
            CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
            IF <fs_field2> IS INITIAL.
              UNASSIGN <fs_field2>.
              ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <st_data> TO <fs_field2>.
              CHECK <fs_field2> IS ASSIGNED.
              MESSAGE ID gc_classmsg TYPE 'E' NUMBER '030'
                INTO lv_msg
                WITH <fs_tvar_p>-fieldname.
              lv_rc = 4.
              <fs_field2> = lv_msg.
              ev_rc = lv_rc.
              CONTINUE.
            ENDIF.
          ELSE.
            CHECK <fs_tvar_p>-tabname = 'EINA'.
            UNASSIGN <fs_field2>.
            ASSIGN COMPONENT <fs_tvar_p>-fieldname OF STRUCTURE <st_data> TO <fs_field2>.
            CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
            IF <fs_field2> IS INITIAL.
              UNASSIGN <fs_field2>.
              ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <st_data> TO <fs_field2>.
              CHECK <fs_field2> IS ASSIGNED.
              MESSAGE ID gc_classmsg TYPE 'E' NUMBER '030'
                INTO lv_msg
                WITH <fs_tvar_p>-fieldname.
              lv_rc = 4.
              <fs_field2> = lv_msg.
              ev_rc = lv_rc.
              CONTINUE.
            ENDIF.
          ENDIF.
        ENDLOOP.

* check des données supplémentaire en insertion.
        IF lv_rc IS INITIAL.
          READ TABLE me->gt_viewkey TRANSPORTING NO FIELDS
            WITH KEY viewname = gc_fiaview
            BINARY SEARCH.
          LOOP AT me->gt_viewkey ASSIGNING FIELD-SYMBOL(<fs_viewkey>) FROM sy-tabix.
            IF <fs_viewkey>-viewname <> gc_fiaview.
              EXIT.
            ENDIF.
            CHECK <fs_viewkey>-to_be_check = abap_true.

            UNASSIGN <fs_field>.
            ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field>.
            CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
            lv_matnr = <fs_field>.

            UNASSIGN <fs_field>.
            ASSIGN COMPONENT <fs_viewkey>-fieldname OF STRUCTURE <st_data> TO <fs_field>.
            CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
            lv_value = <fs_field>.
            CHECK lv_value IS NOT INITIAL. " contrôlé en amont

            CALL METHOD lv_object->/dlwupex/if_check_modif~check
              EXPORTING
                iv_art       = lv_matnr
                iv_viewname  = gc_fiaview
                iv_fieldname = <fs_viewkey>-fieldname
                iv_value     = lv_value
              CHANGING
                cv_msg       = lv_msg
                cv_rc        = lv_rc.
            IF lv_rc IS NOT INITIAL.
              UNASSIGN <fs_field>.
              ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <st_data> TO <fs_field>.
              CHECK <fs_field> IS ASSIGNED.
              <fs_field> = lv_msg.
              ev_rc = lv_rc.
            ENDIF.

          ENDLOOP.
        ENDIF.

      ENDIF.


* Si les champs obligatoires sont bien renseignés, on contrôle les cohérences de données

* Vérification de cohérence des unités par rapport aux unités de base
      IF lv_rc IS INITIAL.
        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field>.
        CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
        lv_matnr = <fs_field>.

        READ TABLE lt_mara INTO DATA(ls_mara)
          WITH KEY matnr = lv_matnr
          BINARY SEARCH.

        UNASSIGN : <fs_field2>.
        ASSIGN COMPONENT 'ISEINA' OF STRUCTURE <st_data> TO <fs_field2>.
        CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
        IF <fs_field2> IS NOT INITIAL. "EINA
          UNASSIGN <fs_field>.
          ASSIGN COMPONENT 'MEINS' OF STRUCTURE <st_data> TO <fs_field>.
          CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
          lv_unit = <fs_field>.
        ELSE."EINE
          UNASSIGN <fs_field>.
          ASSIGN COMPONENT 'KMEIN' OF STRUCTURE <st_data> TO <fs_field>.
          CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
          lv_unit = <fs_field>.
        ENDIF.
        IF lv_unit <> ls_mara-meins.
          UNASSIGN <fs_field2>.
          ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <st_data> TO <fs_field2>.
          CHECK <fs_field2> IS ASSIGNED.
          MESSAGE ID gc_classmsg TYPE 'E' NUMBER '084'
            INTO lv_msg
            WITH lv_unit ls_mara-meins.
          lv_rc = 4.
          <fs_field2> = lv_msg.
          ev_rc = lv_rc.
          CONTINUE.
        ENDIF.
      ENDIF.

* Contrôle de cohérence des données
      IF lv_rc IS INITIAL.
        READ TABLE me->gt_check_link TRANSPORTING NO FIELDS
           WITH KEY viewname = gc_fiaview
           BINARY SEARCH.
        LOOP AT me->gt_check_link ASSIGNING FIELD-SYMBOL(<fs_check_link>) FROM sy-tabix.
          CHECK <fs_check_link>-viewname = gc_fiaview.
          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
           WITH KEY viewname = gc_fiaview
                    tabname = <fs_check_link>-tabname
                    fieldname = <fs_check_link>-fieldname
                    BINARY SEARCH.
          CHECK sy-subrc IS INITIAL.
          READ TABLE me->gt_tvar_p TRANSPORTING NO FIELDS
            WITH KEY viewname = gc_fiaview
                     tabname = <fs_check_link>-tabname_linked
                     fieldname = <fs_check_link>-fieldname_linked
                     BINARY SEARCH.
          CHECK sy-subrc IS INITIAL.
          IF <fs_check_link>-tabname = <fs_check_link>-tabname_linked.

            UNASSIGN : <fs_field>.
            ASSIGN COMPONENT 'ISEINA' OF STRUCTURE <st_data> TO <fs_field>.
            CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.

            CHECK ( <fs_field> IS INITIAL AND <fs_check_link>-tabname = 'EINE' ) OR ( <fs_field> IS NOT INITIAL AND <fs_check_link>-tabname = 'EINA' ).

            UNASSIGN : <fs_field>, <fs_field_linked>.
            ASSIGN COMPONENT <fs_check_link>-fieldname OF STRUCTURE <st_data> TO <fs_field>.
            ASSIGN COMPONENT <fs_check_link>-fieldname_linked OF STRUCTURE <st_data> TO <fs_field_linked>.
            CHECK <fs_field> IS ASSIGNED AND <fs_field_linked> IS ASSIGNED.

            ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field2>.
            IF lv_object IS NOT INITIAL.
              lv_value = <fs_field>.
              lv_value2 = <fs_field_linked>.
              CALL METHOD lv_object->/dlwupex/if_check_modif~check_fields
                EXPORTING
                  iv_art              = <fs_field2>
                  iv_viewname         = gc_fiaview
                  iv_fieldname        = <fs_check_link>-fieldname
                  iv_value            = lv_value
                  iv_fieldname_linked = <fs_check_link>-fieldname_linked
                  iv_value_linked     = lv_value2
                CHANGING
                  cv_rc               = lv_rc
                  cv_msg              = lv_msg.
              IF lv_rc IS NOT INITIAL.
                UNASSIGN <fs_field>.
                ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <st_data> TO <fs_field>.
                CHECK <fs_field> IS ASSIGNED.
                <fs_field> = lv_msg.
                ev_rc = lv_rc.
                EXIT.
              ENDIF.
            ENDIF.
          ELSE. " tabname <> tabname_linked ==> EINE et EINA

            REFRESH : lt_eine_k.
            UNASSIGN <fs_infnr>.
            ASSIGN COMPONENT 'INFNR' OF STRUCTURE <st_data> TO <fs_infnr>.
            CHECK sy-subrc IS INITIAL AND <fs_infnr> IS ASSIGNED.

* Ligne EINA ou EINE ?
            UNASSIGN : <fs_field>.
            ASSIGN COMPONENT 'ISEINA' OF STRUCTURE <st_data> TO <fs_field>.
            CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
            lv_iseina = <fs_field>.

            IF <fs_field> IS NOT INITIAL. " check pour chaque EINE attaché modifiée ou en base
* on commence par celles modifiées
              LOOP AT ct_data ASSIGNING FIELD-SYMBOL(<fs_data_eine>) WHERE ('INFNR = <fs_infnr>').
                UNASSIGN : <fs_field>.
                ASSIGN COMPONENT 'ISEINA' OF STRUCTURE <fs_data_eine> TO <fs_field>.
                CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
                CLEAR ls_eine_k.
                ls_eine_k-infnr = <fs_infnr>.
                CHECK <fs_field> IS INITIAL. " ne prendre en compte que les lignes EINE

                UNASSIGN <fs_ekorg>.
                ASSIGN COMPONENT 'EKORG' OF STRUCTURE <fs_data_eine> TO <fs_ekorg>.
                CHECK sy-subrc IS INITIAL AND <fs_ekorg> IS ASSIGNED.
                ls_eine_k-ekorg = <fs_ekorg>.

                UNASSIGN <fs_esokz>.
                ASSIGN COMPONENT 'ESOKZ' OF STRUCTURE <fs_data_eine> TO <fs_esokz>.
                CHECK sy-subrc IS INITIAL AND <fs_esokz> IS ASSIGNED.
                ls_eine_k-esokz = <fs_esokz>.

                UNASSIGN <fs_werks>.
                ASSIGN COMPONENT 'WERKS' OF STRUCTURE <fs_data_eine> TO <fs_werks>.
                CHECK sy-subrc IS INITIAL AND <fs_werks> IS ASSIGNED.
                ls_eine_k-werks = <fs_werks>.

                APPEND ls_eine_k TO lt_eine_k.

                UNASSIGN : <fs_field>, <fs_field_linked>.
                IF <fs_check_link>-tabname = 'EINA'.
                  ASSIGN COMPONENT <fs_check_link>-fieldname OF STRUCTURE <st_data> TO <fs_field>.
                  ASSIGN COMPONENT <fs_check_link>-fieldname_linked OF STRUCTURE <fs_data_eine> TO <fs_field_linked>.
                ELSE.
                  ASSIGN COMPONENT <fs_check_link>-fieldname OF STRUCTURE <fs_data_eine> TO <fs_field>.
                  ASSIGN COMPONENT <fs_check_link>-fieldname_linked OF STRUCTURE <st_data> TO <fs_field_linked>.
                ENDIF.
                CHECK <fs_field> IS ASSIGNED AND <fs_field_linked> IS ASSIGNED.

                CHECK <fs_check_link>-fieldname <> 'EKORG' AND <fs_check_link>-fieldname_linked <> 'EKORG' . "on ne fait pas de check lié à l'OA sur les vue EINA

                ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field2>.
                IF lv_object IS NOT INITIAL.
                  lv_value = <fs_field>.
                  lv_value2 = <fs_field_linked>.
                  CALL METHOD lv_object->/dlwupex/if_check_modif~check_fields
                    EXPORTING
                      iv_art              = <fs_field2>
                      iv_viewname         = gc_fiaview
                      iv_fieldname        = <fs_check_link>-fieldname
                      iv_value            = lv_value
                      iv_fieldname_linked = <fs_check_link>-fieldname_linked
                      iv_value_linked     = lv_value2
                    CHANGING
                      cv_rc               = lv_rc
                      cv_msg              = lv_msg.
                  IF lv_rc IS NOT INITIAL.
                    UNASSIGN <fs_field>.
                    ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <st_data> TO <fs_field>.
                    CHECK <fs_field> IS ASSIGNED.
                    <fs_field> = lv_msg.
                    ev_rc = lv_rc.
                    EXIT.
                  ENDIF.
                ENDIF.
              ENDLOOP.

* on regarde ensuite celle de la base de données
              IF <fs_infnr>(1) <> '$'. " rien en base pour les nouvelles FIA
                SORT lt_eine_k.
                READ TABLE me->gt_eine TRANSPORTING NO FIELDS
                  WITH KEY infnr = <fs_infnr>
                  BINARY SEARCH.
                LOOP AT me->gt_eine ASSIGNING FIELD-SYMBOL(<fs_eine>) FROM sy-tabix.
                  IF <fs_eine>-infnr <> <fs_infnr>.
                    EXIT.
                  ENDIF.
                  READ TABLE lt_eine_k TRANSPORTING NO FIELDS
                    WITH KEY  infnr = <fs_eine>-infnr
                              ekorg = <fs_eine>-ekorg
                              esokz = <fs_eine>-esokz
                              werks = <fs_eine>-werks
                              BINARY SEARCH.
                  CHECK sy-subrc IS NOT INITIAL. "pas déjà traitée dans les données EINE modifiées

                  UNASSIGN : <fs_field>, <fs_field_linked>.
                  IF <fs_check_link>-tabname = 'EINA'.
                    ASSIGN COMPONENT <fs_check_link>-fieldname OF STRUCTURE <st_data> TO <fs_field>.
                    ASSIGN COMPONENT <fs_check_link>-fieldname_linked OF STRUCTURE <fs_eine> TO <fs_field_linked>.
                  ELSE.
                    ASSIGN COMPONENT <fs_check_link>-fieldname OF STRUCTURE <fs_eine> TO <fs_field>.
                    ASSIGN COMPONENT <fs_check_link>-fieldname_linked OF STRUCTURE <st_data> TO <fs_field_linked>.
                  ENDIF.
                  CHECK <fs_field> IS ASSIGNED AND <fs_field_linked> IS ASSIGNED.

                  CHECK lv_iseina <> 'X' OR "on ne fait pas de check lié à l'OA sur les vue EINA
                      ( lv_iseina =  'X' AND <fs_check_link>-fieldname <> 'EKORG' AND <fs_check_link>-fieldname_linked <> 'EKORG' ).

                  ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field2>.
                  IF lv_object IS NOT INITIAL.
                    lv_value = <fs_field>.
                    lv_value2 = <fs_field_linked>.
                    CALL METHOD lv_object->/dlwupex/if_check_modif~check_fields
                      EXPORTING
                        iv_art              = <fs_field2>
                        iv_viewname         = gc_fiaview
                        iv_fieldname        = <fs_check_link>-fieldname
                        iv_value            = lv_value
                        iv_fieldname_linked = <fs_check_link>-fieldname_linked
                        iv_value_linked     = lv_value2
                      CHANGING
                        cv_rc               = lv_rc
                        cv_msg              = lv_msg.
                    IF lv_rc IS NOT INITIAL.
                      UNASSIGN <fs_field>.
                      ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <st_data> TO <fs_field>.
                      CHECK <fs_field> IS ASSIGNED.
                      <fs_field> = lv_msg.
                      ev_rc = lv_rc.
                      EXIT.
                    ENDIF.
                  ENDIF.
                ENDLOOP.
              ENDIF.
            ELSE. " check pour chaque la ligne EINE en cours

              READ TABLE me->gt_eina ASSIGNING FIELD-SYMBOL(<fs_eina>)
                             WITH KEY infnr = <fs_infnr>
                             BINARY SEARCH.
              CHECK sy-subrc IS INITIAL.
              UNASSIGN : <fs_field>, <fs_field_linked>.
              IF <fs_check_link>-tabname = 'EINA'.
                ASSIGN COMPONENT <fs_check_link>-fieldname OF STRUCTURE <fs_eina> TO <fs_field>.
                ASSIGN COMPONENT <fs_check_link>-fieldname_linked OF STRUCTURE <st_data> TO <fs_field_linked>.
              ELSE.
                ASSIGN COMPONENT <fs_check_link>-fieldname OF STRUCTURE <st_data> TO <fs_field>.
                ASSIGN COMPONENT <fs_check_link>-fieldname_linked OF STRUCTURE <fs_eina> TO <fs_field_linked>.
              ENDIF.
              CHECK <fs_field> IS ASSIGNED AND <fs_field_linked> IS ASSIGNED.

              ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field2>.
              IF lv_object IS NOT INITIAL.
                lv_value = <fs_field>.
                lv_value2 = <fs_field_linked>.
                CALL METHOD lv_object->/dlwupex/if_check_modif~check_fields
                  EXPORTING
                    iv_art              = <fs_field2>
                    iv_viewname         = gc_fiaview
                    iv_fieldname        = <fs_check_link>-fieldname
                    iv_value            = lv_value
                    iv_fieldname_linked = <fs_check_link>-fieldname_linked
                    iv_value_linked     = lv_value2
                  CHANGING
                    cv_rc               = lv_rc
                    cv_msg              = lv_msg.
                IF lv_rc IS NOT INITIAL.
                  UNASSIGN <fs_field>.
                  ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <st_data> TO <fs_field>.
                  CHECK <fs_field> IS ASSIGNED.
                  <fs_field> = lv_msg.
                  ev_rc = lv_rc.
                  EXIT.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDIF.
          "ERRMESSAGE
        ENDLOOP.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD check_before_save_unit.


    DATA : lv_msg   TYPE bapi_msg,
           lv_matnr TYPE matnr,
           lv_value TYPE string,
           lv_err   TYPE xfeld,
           lv_rc    TYPE sysubrc,
           lt_mean  TYPE TABLE OF mean,
           ls_mean  TYPE mean.

    FIELD-SYMBOLS : <fs_field>  TYPE any,
                    <fs_field2> TYPE any.

    LOOP AT ct_data ASSIGNING FIELD-SYMBOL(<fs_data>).
      CLEAR ls_mean.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MEINH' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      lv_value = <fs_field>.
      ls_mean-meinh = lv_value.

      UNASSIGN <fs_field2>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data> TO <fs_field2>.
      CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
      lv_matnr = <fs_field2>.
      ls_mean-matnr = lv_matnr.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'LFNUM' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      lv_value = <fs_field>.
      ls_mean-lfnum = lv_value.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'HPEAN' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      lv_value = <fs_field>.
      ls_mean-hpean = lv_value.

      APPEND ls_mean TO lt_mean.

    ENDLOOP.

    LOOP AT ct_data ASSIGNING <fs_data>.
      CLEAR ls_mean.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'HPEAN' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      lv_value = <fs_field>.
      ls_mean-hpean = lv_value.

      CHECK ls_mean-hpean IS NOT INITIAL.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MEINH' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      lv_value = <fs_field>.
      ls_mean-meinh = lv_value.

      UNASSIGN <fs_field2>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_data> TO <fs_field2>.
      CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
      lv_matnr = <fs_field2>.
      ls_mean-matnr = lv_matnr.

      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'LFNUM' OF STRUCTURE <fs_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      lv_value = <fs_field>.
      ls_mean-lfnum = lv_value.



      READ TABLE lt_mean TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_mean-matnr
                 meinh = ls_mean-meinh
        BINARY SEARCH.
      LOOP AT lt_mean ASSIGNING FIELD-SYMBOL(<fs_mean>) FROM sy-tabix.
        IF <fs_mean>-matnr <> ls_mean-matnr OR
           <fs_mean>-meinh <> ls_mean-meinh.
          EXIT.
        ENDIF.

        IF <fs_mean>-hpean IS NOT INITIAL AND ls_mean-lfnum <> <fs_mean>-lfnum.

          lv_rc = 4.
          EXIT.
        ENDIF.

      ENDLOOP.

      IF lv_rc IS NOT INITIAL.
        MESSAGE ID gc_classmsg TYPE 'E' NUMBER '091'
        INTO lv_msg.

        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <fs_data> TO <fs_field>.
        CHECK <fs_field> IS ASSIGNED.
        <fs_field> = lv_msg.
        ev_rc = lv_rc.
        CONTINUE.
      ENDIF.

      READ TABLE me->gt_mean_check TRANSPORTING NO FIELDS
       WITH KEY matnr = ls_mean-matnr
                meinh = ls_mean-meinh
       BINARY SEARCH.
      LOOP AT me->gt_mean_check ASSIGNING <fs_mean> FROM sy-tabix.
        IF <fs_mean>-matnr <> ls_mean-matnr OR
           <fs_mean>-meinh <> ls_mean-meinh.
          EXIT.
        ENDIF.
        READ TABLE lt_mean TRANSPORTING NO FIELDS
        WITH KEY matnr = <fs_mean>-matnr
                 meinh = <fs_mean>-meinh
                 lfnum = <fs_mean>-lfnum
        BINARY SEARCH.
        check sy-subrc is NOT INITIAL.

        IF <fs_mean>-hpean IS NOT INITIAL AND ls_mean-lfnum <> <fs_mean>-lfnum.

          lv_rc = 4.
          EXIT.
        ENDIF.

      ENDLOOP.
      IF lv_rc IS NOT INITIAL.
        MESSAGE ID gc_classmsg TYPE 'E' NUMBER '091'
        INTO lv_msg.

        UNASSIGN <fs_field>.
        ASSIGN COMPONENT 'ERRMESSAGE' OF STRUCTURE <fs_data> TO <fs_field>.
        CHECK <fs_field> IS ASSIGNED.
        <fs_field> = lv_msg.
        ev_rc = lv_rc.
        CONTINUE.
      ENDIF.

    ENDLOOP.




  ENDMETHOD.


  METHOD constructor.

    me->gv_wa = iv_wa.
    me->gv_variant = iv_variant.
    me->read_custo( ).
    me->manage_auth( ).

  ENDMETHOD.


  METHOD get_instance.

    DATA : lv_class TYPE /dlwupex/evalue.

*** On récupère la classe d'instruction des checks
    CLEAR lv_class.
    SELECT SINGLE value
      FROM /dlwupex/tcusto
      INTO lv_class
      WHERE name = gc_class_core.
    IF sy-subrc EQ 0
      AND lv_class IS NOT INITIAL.
      CREATE OBJECT rv_object
        TYPE (lv_class)
        EXPORTING iv_wa = iv_wa
                  iv_variant = iv_variant.
    ELSE.
      lv_class = gc_classname_core.
      CREATE OBJECT rv_object
        TYPE (lv_class)
        EXPORTING iv_wa = iv_wa
                  iv_variant = iv_variant.
    ENDIF.

  ENDMETHOD.


  METHOD get_view_autority.

    ev_insert = 'H'. " non autorisé
    AUTHORITY-CHECK OBJECT 'Z/DLWMAM/'
     ID 'ACTVT' FIELD '01'
     ID 'ZVIEW_ID' FIELD iv_view
     ID 'ZBUID' FIELD gv_wa
     ID 'ZINS_DEL' FIELD 'Y'.
    IF sy-subrc = 0.
      ev_insert = 'M'. " Modif possible
    ENDIF.
    AUTHORITY-CHECK OBJECT 'Z/DLWMAM/'
      ID 'ACTVT' FIELD '02'
      ID 'ZVIEW_ID' FIELD iv_view
     ID 'ZBUID' FIELD gv_wa
      ID 'ZINS_DEL' FIELD 'Y'.
    IF sy-subrc = 0.
      ev_insert = 'M'. " Modif possible
    ENDIF.

    ev_access = 'H'. " non autorisé
    AUTHORITY-CHECK OBJECT 'Z/DLWMAM/'
      ID 'ACTVT' FIELD '03'
      ID 'ZVIEW_ID' FIELD iv_view
     ID 'ZBUID' FIELD gv_wa.
    IF sy-subrc = 0.
      ev_access = 'D'. " Display possible
    ENDIF.
    AUTHORITY-CHECK OBJECT 'Z/DLWMAM/'
     ID 'ACTVT' FIELD '01'
     ID 'ZVIEW_ID' FIELD iv_view
     ID 'ZBUID' FIELD gv_wa.
    IF sy-subrc = 0.
      ev_access = 'M'. " Modif possible
    ENDIF.
    AUTHORITY-CHECK OBJECT 'Z/DLWMAM/'
      ID 'ACTVT' FIELD '02'
      ID 'ZVIEW_ID' FIELD iv_view
     ID 'ZBUID' FIELD gv_wa.
    IF sy-subrc = 0.
      ev_access = 'M'. " Modif possible
    ENDIF.


  ENDMETHOD.


  METHOD manage_auth.

*01	Ajouter ou créer
*02	Modifier
*03	Afficher

    DATA : lv_insert_gd     TYPE c,
           lv_insert_unit   TYPE c,
           lv_insert_carac  TYPE c,
           lv_insert_bom    TYPE c,
           lv_insert_list   TYPE c,
           lv_insert_fia    TYPE c,
           lv_insert_srlist TYPE c,
           lv_insert_sale   TYPE c,
           lv_insert_logdc  TYPE c,
           lv_insert_logsto TYPE c,
           lv_access_gd     TYPE c,
           lv_access_unit   TYPE c,
           lv_access_carac  TYPE c,
           lv_access_bom    TYPE c,
           lv_access_list   TYPE c,
           lv_access_fia    TYPE c,
           lv_access_srlist TYPE c,
           lv_access_sale   TYPE c,
           lv_access_logdc  TYPE c,
           lv_access_logsto TYPE c.

* autority view general data
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_gdataview
      IMPORTING
        ev_insert = lv_insert_gd
        ev_access = lv_access_gd.

* autority view unit
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_unitview
      IMPORTING
        ev_insert = lv_insert_unit
        ev_access = lv_access_unit.

* autority view characteristic
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_caractview
      IMPORTING
        ev_insert = lv_insert_carac
        ev_access = lv_access_carac.

* autority view BOM
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_bomview
      IMPORTING
        ev_insert = lv_insert_bom
        ev_access = lv_access_bom.

* autority view list
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_listview
      IMPORTING
        ev_insert = lv_insert_list
        ev_access = lv_access_list.

* autority view fia
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_fiaview
      IMPORTING
        ev_insert = lv_insert_fia
        ev_access = lv_access_fia.

* autority view srlist
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_srlistview
      IMPORTING
        ev_insert = lv_insert_srlist
        ev_access = lv_access_srlist.

* autority view sale
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_saleview
      IMPORTING
        ev_insert = lv_insert_sale
        ev_access = lv_access_sale.

* autority view logdc
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_logdcview
      IMPORTING
        ev_insert = lv_insert_logdc
        ev_access = lv_access_logdc.

* autority view logsto
    CALL METHOD me->get_view_autority
      EXPORTING
        iv_view   = gc_logstoview
      IMPORTING
        ev_insert = lv_insert_logsto
        ev_access = lv_access_logsto.

    LOOP AT me->gt_tvar_p ASSIGNING FIELD-SYMBOL(<fs_var_p>).
      CASE <fs_var_p>-viewname.
        WHEN gc_gdataview.
          CASE lv_access_gd.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_unitview.
          CASE lv_access_unit.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_caractview.
          CASE lv_access_carac.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_bomview.
          CASE lv_access_bom.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_listview.
          CASE lv_access_list.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_fiaview.
          CASE lv_access_fia.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_srlistview.
          CASE lv_access_srlist.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_saleview.
          CASE lv_access_sale.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_logdcview.
          CASE lv_access_logdc.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_logstoview.
          CASE lv_access_logsto.
            WHEN 'H'.
              DELETE me->gt_tvar_p INDEX sy-tabix.
            WHEN 'D'.
              CLEAR <fs_var_p>-edit.
            WHEN OTHERS.
          ENDCASE.
        WHEN OTHERS.
      ENDCASE.
    ENDLOOP.


    LOOP AT me->gt_tvar_in ASSIGNING FIELD-SYMBOL(<fs_var_in>).
      CASE <fs_var_in>-viewname.
        WHEN gc_gdataview.
          CASE lv_insert_gd.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_unitview.
          CASE lv_insert_unit.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_caractview.
          CASE lv_insert_carac.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_bomview.
          CASE lv_insert_bom.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_listview.
          CASE lv_insert_list.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_fiaview.
          CASE lv_insert_fia.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_srlistview.
          CASE lv_insert_srlist.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_saleview.
          CASE lv_insert_sale.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_logdcview.
          CASE lv_insert_logdc.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN gc_logstoview.
          CASE lv_insert_logsto.
            WHEN 'H'.
              <fs_var_in>-insert_line = 'N'.
            WHEN OTHERS.
          ENDCASE.
        WHEN OTHERS.
      ENDCASE.
    ENDLOOP.


  ENDMETHOD.


  METHOD read_custo.

    SELECT * FROM /dlwupex/tbuhead INTO TABLE me->gt_tbuhead
      WHERE id = me->gv_wa AND
            ckp_modif = abap_true.

    SELECT * FROM /dlwupex/tbuoa INTO TABLE me->gt_tbuoa
      WHERE id = me->gv_wa AND
            ckp_modif = abap_true.

    SELECT * FROM /dlwupex/tbuoc INTO TABLE me->gt_tbuoc
      WHERE id = me->gv_wa AND
            ckp_modif = abap_true.

    SELECT * FROM /dlwupex/tvar_p INTO TABLE me->gt_tvar_p
      WHERE variant = me->gv_variant AND
            active = 'Y'.

    SELECT * FROM /dlwupex/tvar_in INTO TABLE me->gt_tvar_in
      WHERE variant = me->gv_variant.

    SELECT * FROM /dlwupex/tview_k INTO TABLE me->gt_viewkey.

    SELECT * FROM /dlwupex/tcheck INTO TABLE me->gt_check_link.

    SELECT * FROM /dlwupex/tcusto INTO TABLE me->gt_tcusto.

    SELECT SINGLE * FROM /dlwupex/tlim_ar INTO me->gs_tlim_ar
      WHERE wa = me->gv_wa AND
            variant = me->gv_variant.
    IF sy-subrc IS NOT INITIAL.
      SELECT SINGLE * FROM /dlwupex/tlim_ar INTO me->gs_tlim_ar
        WHERE wa = me->gv_wa.
    ENDIF.


    SELECT * FROM t006 INTO TABLE me->gt_t006.

    SORT : me->gt_tbuhead,
           me->gt_tbuoa,
           me->gt_tbuoc,
           me->gt_tvar_p,
           me->gt_tvar_in,
           me->gt_viewkey,
           me->gt_check_link,
           me->gt_tcusto,
           me->gt_t006.

  ENDMETHOD.


  METHOD read_ean_db.

    DATA : lrt_matnr TYPE RANGE OF matnr,
           lrs_matnr LIKE LINE OF lrt_matnr.

    FIELD-SYMBOLS : <fs_field> TYPE any,
                    <st_data>  TYPE any.

    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.

    LOOP AT it_data ASSIGNING <st_data>.
      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field>.
      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.
      lrs_matnr-low = <fs_field>.
      APPEND lrs_matnr TO lrt_matnr.
    ENDLOOP.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.

    IF lrt_matnr IS NOT INITIAL.
      SELECT * FROM mean INTO TABLE me->gt_mean_check
          WHERE matnr IN lrt_matnr.
    ENDIF.
    SORT : me->gt_mean_check.



  ENDMETHOD.


  METHOD read_fia_db.

    DATA : lrt_matnr TYPE RANGE OF matnr,
           lrs_matnr LIKE LINE OF lrt_matnr.

    FIELD-SYMBOLS : <fs_field> TYPE any,
                    <st_data>  TYPE any.

    DATA: dref TYPE REF TO data .
    CREATE DATA dref LIKE LINE OF it_data .

    ASSIGN dref->* TO <st_data> .

    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.

    LOOP AT it_data ASSIGNING <st_data>.
*      UNASSIGN <fs_field>.
*      ASSIGN COMPONENT 'INFNR' OF STRUCTURE <st_data> TO <fs_field>.
*      CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED AND <fs_field>(1) <> '$'.
*      lrs_infnr-low = <fs_field>.
*      APPEND lrs_infnr TO lrt_infnr.
      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'MATNR' OF STRUCTURE <st_data> TO <fs_field>.
      lrs_matnr-low = <fs_field>.
      APPEND lrs_matnr TO lrt_matnr.
    ENDLOOP.

    SORT lrt_matnr.
    DELETE ADJACENT DUPLICATES FROM lrt_matnr.

    IF lrt_matnr IS NOT INITIAL.
      SELECT * FROM eina INTO TABLE me->gt_eina
          WHERE matnr IN lrt_matnr.

      SELECT * FROM eine INTO TABLE me->gt_eine "#EC CI_NO_TRANSFORM
        FOR ALL ENTRIES IN me->gt_eina
          WHERE infnr = me->gt_eina-infnr.

      SORT : me->gt_eina, me->gt_eine.
    ENDIF.


  ENDMETHOD.
ENDCLASS.
