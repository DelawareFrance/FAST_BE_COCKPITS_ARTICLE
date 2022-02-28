class /DLWUPEX/CL_CHECK_MODIF definition
  public
  create public .

public section.

  interfaces /DLWUPEX/IF_CHECK_MODIF .

  methods CONSTRUCTOR
    importing
      !IV_VARIANT type /DLWUPEX/EVARIANT
      !IV_WA type /DLWUPEX/EBUSUNITID .
  class-methods GET_INSTANCE
    importing
      !IV_VARIANT type /DLWUPEX/EVARIANT
      !IV_WA type /DLWUPEX/EBUSUNITID
    returning
      value(RV_OBJECT) type ref to /DLWUPEX/CL_CHECK_MODIF .
protected section.

  data GT_TVAR_P type /DLWUPEX/TVAR_P_TT .
  data GV_VARIANT type /DLWUPEX/EVARIANT .
  constants GC_CHECKMETH type STRING value 'CHECK_' ##NO_TEXT.
  constants GC_CHECKMETH_BEFORESAVE type STRING value 'CHECKATSAVE_' ##NO_TEXT.
  data GV_WA type /DLWUPEX/EBUSUNITID .

  methods CHECK_TABLE_CONTROL
    importing
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
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
  methods GET_DOMAIN
    importing
      !IV_DOMNAME type DOMNAME
    exporting
      !ES_DOMAIN_CTR type /DLWUPEX/DOM_CTRL .
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
      !CV_NO_FUNCTION type XFELD
      !CV_RC type SYSUBRC .
  methods GET_TAB_CONTROL
    importing
      !IV_TABNAME type TABNAME
      !IV_VALUE type STRING
      !IT_WHERE type /DLWUPEX/EDPLINE_TT
    exporting
      !ES_OK type XFELD .
  methods CHECK_FIELD
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC
      !CV_NO_METHOD type XFELD .
  methods CHECKATSAVE_MEAN_EAN11
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_MEAN_EANTP
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_EAN
    importing
      !IV_ART type MATNR
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods GET_EAN_TYPE
    importing
      !IV_INTEXT type NRIND
    exporting
      !ET_EAN_TYPE type /DLWUPEX/TYPEINTERV_TT .
  methods CHECK_FIELD_BEFORE_SAVE
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC
      !CV_NO_METHOD type XFELD .
  methods CHECK_AUSP_ATINN
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_AUSP_ATINN
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_AUSP_ATWRT
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_CARACT
    importing
      !IV_ART type MATNR
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_MVKE_VKORG
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_MVKE_VTWEG
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_SALES
    importing
      !IV_ART type MATNR
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_EORD_LIFNR
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_EORD_RESWK
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_SRLIST
    importing
      !IV_ART type MATNR
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_WLK1_FILIA
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_EINA_LIFNR
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_EINE_EKORG
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_SUPPLIER
    importing
      !IV_ART type MATNR
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECKATSAVE_EINA_LTSNR
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_GAMME
    importing
      !IV_ART type MATNR
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_EORD_WERKS
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_EORD_RESWK
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_EORD_EKORG
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_EINA_EKORG
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_/SAPSLL/MARITC_CCNGN
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_MARM_LAENG
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_MARM_BRGEW
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_MARM_BREIT
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
  methods CHECK_MARM_HOEHE
    importing
      !IV_ART type MATNR
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_MSG type BAPI_MSG
      !CV_RC type SYSUBRC .
private section.

  data GT_FIELD_INFOS type /DLWUPEX/FIELD_INFOS_TT .
  constants GC_CLASS_CHECK type /DLWUPEX/ENAME value 'CLASSCHECKMODIF' ##NO_TEXT.
  constants GC_CHECK_CORE type /DLWUPEX/ENAME value '/DLWUPEX/CL_CHECK_MODIF' ##NO_TEXT.
  data GT_KEYS_TAB type /DLWUPEX/KEY_INFOS_TT .
  data GT_DOMAIN type /DLWUPEX/DOM_CTRL_TT .
  constants GC_CLASSMSG type ARBGB value '/DLWUPEX/COCKPIT_ART' ##NO_TEXT.
  constants GC_CONVEXIT type STRING value ' CONVERSION_EXIT_' ##NO_TEXT.
  constants GC_CONVEXIT2 type STRING value '_INPUT' ##NO_TEXT.
  data GT_TAB_CONTROL type /DLWUPEX/TAB_CTRL_TT .
  data GT_EAN_TYPE type /DLWUPEX/EAN_TYPE_TT .
  data GT_TBUOC type /DLWUPEX/TBUOC_TT .
  data GT_TBUOA type /DLWUPEX/TBUOA_TT .

  methods CHECK_TYPAGE
    importing
      !IV_TABNAME type TABNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_RC type SYSUBRC
      !CV_MSG type BAPI_MSG .
ENDCLASS.



CLASS /DLWUPEX/CL_CHECK_MODIF IMPLEMENTATION.


  METHOD /dlwupex/if_check_modif~check.

    DATA : lv_tabname        TYPE tabname,
           lv_tabname16      TYPE tabname16,
           lv_as4text        TYPE as4text,
           lv_flag_no_method TYPE xfeld.

    SORT me->gt_tvar_p BY variant viewname fieldname.

    READ TABLE me->gt_tvar_p INTO DATA(ls_var)
      WITH KEY variant = me->gv_variant
               viewname = iv_viewname
               fieldname = iv_fieldname
               BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      lv_tabname = ls_var-tabname.
    ENDIF.
    lv_tabname16 = lv_tabname.
    CALL METHOD me->retrieving_fieldtext
      EXPORTING
        is_ddobjname = lv_tabname16
        is_tabfield  = iv_fieldname
        is_fieldname = iv_fieldname
      IMPORTING
        es_as4text   = lv_as4text.

    IF lv_as4text IS NOT INITIAL.
      DATA(lv_str1) = lv_as4text+0(50).
      DATA(lv_str2) = lv_as4text+50(10).
    ELSE.
      lv_str1 = iv_fieldname.
    ENDIF.

    IF ( ls_var-obligatory = '1' OR ls_var-obligatory = '3' ) AND iv_value IS INITIAL.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '030'
        INTO cv_msg
        WITH lv_str1 lv_str2.
      cv_rc = 4.
      EXIT.
    ENDIF.

    SORT me->gt_tvar_p.
    CALL METHOD me->check_typage
      EXPORTING
        iv_tabname   = lv_tabname
        iv_fieldname = iv_fieldname
        iv_value     = iv_value
      CHANGING
        cv_rc        = cv_rc
        cv_msg       = cv_msg.

    CHECK cv_rc IS INITIAL.

    CALL METHOD me->check_field
      EXPORTING
        iv_art       = iv_art
        iv_tabname   = lv_tabname
        iv_fieldname = iv_fieldname
        iv_value     = iv_value
      CHANGING
        cv_rc        = cv_rc
        cv_msg       = cv_msg
        cv_no_method = lv_flag_no_method.

    IF lv_flag_no_method IS NOT INITIAL.
      CALL METHOD me->check_table_control
        EXPORTING
          iv_tabname   = lv_tabname
          iv_fieldname = iv_fieldname
          iv_value     = iv_value
        CHANGING
          cv_rc        = cv_rc
          cv_msg       = cv_msg.
    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_check_modif~check_fields.

    DATA: lv_nomethod TYPE flag,
          lv_tabname  TYPE tabname.


    SORT me->gt_tvar_p BY variant viewname fieldname.

    READ TABLE me->gt_tvar_p INTO DATA(ls_var)
      WITH KEY variant = me->gv_variant
               viewname = iv_viewname
               fieldname = iv_fieldname
               BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      lv_tabname = ls_var-tabname.
    ENDIF.

    CALL METHOD me->check_field_before_save
      EXPORTING
        iv_art              = iv_art
        iv_tabname          = lv_tabname
        iv_fieldname        = iv_fieldname
        iv_value            = iv_value
        iv_value_linked     = iv_value_linked
        iv_fieldname_linked = iv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc
        cv_no_method        = lv_nomethod.

  ENDMETHOD.


  METHOD checkatsave_ausp_atinn.

    DATA : lv_fieldname	       TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'ATINN' AND iv_fieldname_linked = 'ATWRT'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'ATWRT' AND iv_fieldname_linked = 'ATINN'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_AUSP_ATINN'.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD me->check_caract
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD CHECKATSAVE_AUSP_ATWRT.

    DATA : lv_fieldname	       TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'ATINN' AND iv_fieldname_linked = 'ATWRT'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'ATWRT' AND iv_fieldname_linked = 'ATINN'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_AUSP_ATWRT'.
      cv_rc = 4.
      EXIT.
    ENDIF.



    CALL METHOD me->check_caract
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD checkatsave_eina_lifnr.

    DATA : lv_fieldname	       TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname,
           lv_check_supplier   TYPE c.

    IF iv_fieldname = 'LIFNR' AND iv_fieldname_linked = 'EKORG'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
      lv_check_supplier = abap_true.
    ELSEIF iv_fieldname = 'EKORG' AND iv_fieldname_linked = 'LIFNR'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
      lv_check_supplier = abap_true.

    ELSEIF iv_fieldname = 'LIFNR' AND iv_fieldname_linked = 'LTSNR'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
      CLEAR lv_check_supplier.
    ELSEIF iv_fieldname = 'LTSNR' AND iv_fieldname_linked = 'LIFNR'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
      CLEAR lv_check_supplier.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_EINA_LIFNR'.
      cv_rc = 4.
      EXIT.
    ENDIF.

    IF lv_check_supplier EQ abap_true.
      CALL METHOD me->check_supplier
        EXPORTING
          iv_art              = iv_art
          iv_fieldname        = lv_fieldname
          iv_value            = lv_value
          iv_value_linked     = lv_value_linked
          iv_fieldname_linked = lv_fieldname_linked
        CHANGING
          cv_msg              = cv_msg
          cv_rc               = cv_rc.
    ELSE.
      CALL METHOD me->check_gamme
        EXPORTING
          iv_art              = iv_art
          iv_fieldname        = lv_fieldname
          iv_value            = lv_value
          iv_value_linked     = lv_value_linked
          iv_fieldname_linked = lv_fieldname_linked
        CHANGING
          cv_msg              = cv_msg
          cv_rc               = cv_rc.
    ENDIF.

  ENDMETHOD.


  METHOD CHECKATSAVE_EINA_LTSNR.

    DATA : lv_fieldname	       TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'LIFNR' AND iv_fieldname_linked = 'LTSNR'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'LTSNR' AND iv_fieldname_linked = 'LIFNR'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_EINA_LTSNR'.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD me->check_gamme
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD checkatsave_eine_ekorg.

    DATA : lv_fieldname	       TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'LIFNR' AND iv_fieldname_linked = 'EKORG'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'EKORG' AND iv_fieldname_linked = 'LIFNR'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_EINE_EKORG'.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD me->check_supplier
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD checkatsave_eord_lifnr.

    DATA : lv_fieldname	       TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'LIFNR' AND iv_fieldname_linked = 'RESWK'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'RESWK' AND iv_fieldname_linked = 'LIFNR'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_EORD_LIFNR'.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD me->check_srlist
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD checkatsave_eord_reswk.

    DATA : lv_fieldname        TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'LIFNR' AND iv_fieldname_linked = 'RESWK'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'RESWK' AND iv_fieldname_linked = 'LIFNR'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_EORD_RESWK'.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD me->check_srlist
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD CHECKATSAVE_MEAN_EAN11.

    DATA : lv_fieldname	       TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'EAN11' AND iv_fieldname_linked = 'EANTP'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'EANTP' AND iv_fieldname_linked = 'EAN11'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_MEAN_EAN11'.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD me->check_ean
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD CHECKATSAVE_MEAN_EANTP.

    DATA : lv_fieldname	       TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'EAN11' AND iv_fieldname_linked = 'EANTP'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'EANTP' AND iv_fieldname_linked = 'EAN11'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_MEAN_EANTP'.
      cv_rc = 4.
      EXIT.
    ENDIF.



    CALL METHOD me->check_ean
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD CHECKATSAVE_MVKE_VKORG.

    DATA : lv_fieldname	       TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'VKORG' AND iv_fieldname_linked = 'VTWEG'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'VTWEG' AND iv_fieldname_linked = 'VKORG'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_MVKE_VKORG'.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD me->check_sales
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD checkatsave_mvke_vtweg.

    DATA : lv_fieldname        TYPE tabfldname,
           lv_value            TYPE /dlwupex/evaluefield,
           lv_value_linked     TYPE /dlwupex/evaluefield,
           lv_fieldname_linked TYPE tabfldname.

    IF iv_fieldname = 'VKORG' AND iv_fieldname_linked = 'VTWEG'.
      lv_fieldname        = iv_fieldname.
      lv_value            = iv_value.
      lv_fieldname_linked = iv_fieldname_linked.
      lv_value_linked     = iv_value_linked.
    ELSEIF iv_fieldname = 'VTWEG' AND iv_fieldname_linked = 'VKORG'.
      lv_fieldname        = iv_fieldname_linked.
      lv_value            = iv_value_linked.
      lv_fieldname_linked = iv_fieldname.
      lv_value_linked     = iv_value.
    ELSE.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '078'
                       INTO cv_msg
                     WITH 'CHECKATSAVE_MVKE_VTWEG'.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD me->check_sales
      EXPORTING
        iv_art              = iv_art
        iv_fieldname        = lv_fieldname
        iv_value            = lv_value
        iv_value_linked     = lv_value_linked
        iv_fieldname_linked = lv_fieldname_linked
      CHANGING
        cv_msg              = cv_msg
        cv_rc               = cv_rc.

  ENDMETHOD.


  METHOD check_/sapsll/maritc_ccngn.

    CHECK iv_value IS NOT INITIAL.

    SELECT SINGLE stcts INTO @DATA(lv_stcts)
      FROM /sapsll/tdnos
      WHERE ctsty = '01'.

    SELECT SINGLE ccngn INTO @DATA(lv_ccngn)
      FROM /sapsll/clsnr
      WHERE nosct = @lv_stcts AND
            ccngn = @iv_value AND
            datab <= @sy-datum AND
            datbi >= @sy-datum.
    IF sy-subrc NE 0.
* Cohérence de Gamme
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '005'
              INTO cv_msg
            WITH iv_value '/SAPSLL/CLSNR'.
      cv_rc = 4.
      EXIT.
    ENDIF.


  ENDMETHOD.


  METHOD check_ausp_atinn.

    CALL METHOD me->check_table_control
      EXPORTING
        iv_tabname   = iv_tabname
        iv_fieldname = iv_fieldname
        iv_value     = iv_value
      CHANGING
        cv_rc        = cv_rc
        cv_msg       = cv_msg.

    CHECK cv_rc IS INITIAL.

    SELECT SINGLE matkl FROM mara INTO @DATA(lv_matkl)
        WHERE matnr = @iv_art.

    SELECT COUNT(*) UP TO 1 ROWS FROM
             ( ( cabn AS c JOIN ksml AS k
             ON c~atinn = k~imerk )
             JOIN klah AS kl
             ON k~clint = kl~clint )
             JOIN cabnt
             ON c~atinn = cabnt~atinn
             WHERE kl~class = lv_matkl
               AND kl~klart EQ '026'
               AND cabnt~spras = sy-langu
               AND cabnt~atinn = iv_value.
    IF sy-subrc NE 0.
*             La caractéristique n'est pas lié au groupe marchandise
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '043'
                  WITH iv_value lv_matkl
                INTO cv_msg.
      cv_rc = 4.
      EXIT.
    ENDIF.

  ENDMETHOD.


  METHOD check_caract.

    DATA : lt_type_ean TYPE TABLE OF typeinterv,
           ls_type_ean TYPE typeinterv,
           lv_value    TYPE string,
           lv_ean11    TYPE ean11.

    CHECK iv_value IS NOT INITIAL OR iv_value_linked IS NOT INITIAL.

    IF iv_value_linked IS NOT INITIAL.
      SELECT COUNT(*) UP TO 1 ROWS
          FROM cawn
          WHERE atinn EQ iv_value
          AND datuv  <= sy-datum
          AND techv  = space.
      CHECK sy-subrc EQ 0.
      SELECT COUNT(*) UP TO 1 ROWS
            FROM cawn
            WHERE atinn EQ iv_value
            AND datuv  <= sy-datum
            AND techv  = space
            AND atwrt = iv_value_linked.
* On check si la valeur est lié à la caractéristique
      IF sy-subrc NE 0.
        CALL FUNCTION 'CONVERSION_EXIT_ATINN_OUTPUT'
          EXPORTING
            input  = iv_value
          IMPORTING
            output = lv_value.

        MESSAGE ID gc_classmsg TYPE 'E' NUMBER '044'
                INTO cv_msg
              WITH iv_value_linked lv_value.
        cv_rc = 4.
        EXIT.
      ENDIF.
    ENDIF.


  ENDMETHOD.


  METHOD check_ean.

    DATA : lt_type_ean TYPE TABLE OF typeinterv,
           ls_type_ean TYPE typeinterv,
           lv_err      TYPE string,
           lv_ean11    TYPE ean11.

    CHECK iv_value IS NOT INITIAL OR iv_value_linked IS NOT INITIAL.

    IF iv_value IS NOT INITIAL.
      SELECT SINGLE matnr INTO @DATA(lv_matnr)
           FROM mean
           WHERE matnr <> @iv_art AND
                 ean11 = @iv_value
           AND   eantp = @iv_value_linked.
      IF sy-subrc EQ 0.
        SELECT vkorg INTO TABLE @DATA(lt_vkorg)
           FROM mvke
        WHERE matnr = @lv_matnr.
        IF sy-subrc EQ 0.
          SORT lt_vkorg BY vkorg.
          DELETE ADJACENT DUPLICATES FROM lt_vkorg COMPARING vkorg.
          LOOP AT lt_vkorg ASSIGNING FIELD-SYMBOL(<fs_vkorg>).
            IF sy-tabix = 1.
              lv_err = <fs_vkorg>-vkorg.
            ELSE.
              lv_err = lv_err && ',' && <fs_vkorg>-vkorg.
            ENDIF.
          ENDLOOP.
          SHIFT lv_matnr LEFT DELETING LEADING '0'.
          MESSAGE ID gc_classmsg TYPE 'E' NUMBER '014'
                  INTO cv_msg
                WITH iv_value lv_matnr lv_err.
          cv_rc = 4.
          EXIT.
        ENDIF.
      ENDIF.
    ENDIF.

    IF iv_value IS NOT INITIAL AND iv_value_linked IS INITIAL.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '079'
              INTO cv_msg
            WITH iv_value.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD me->get_ean_type
      EXPORTING
        iv_intext   = 'B'
      IMPORTING
        et_ean_type = lt_type_ean.
    CHECK sy-subrc EQ 0.
    SORT lt_type_ean BY eantyp extern.

    IF iv_value IS INITIAL.
      READ TABLE lt_type_ean TRANSPORTING NO FIELDS
             WITH KEY eantyp = iv_value_linked
                      extern = ''
                      BINARY SEARCH.
      IF sy-subrc IS NOT INITIAL.
        MESSAGE ID gc_classmsg TYPE 'E' NUMBER '061'
          INTO cv_msg.
        cv_rc = 4.
        EXIT.
      ENDIF.
    ELSE.
      READ TABLE lt_type_ean TRANSPORTING NO FIELDS
             WITH KEY eantyp = iv_value_linked
                      extern = 'X'
                      BINARY SEARCH.
      IF sy-subrc IS NOT INITIAL.
        MESSAGE ID gc_classmsg TYPE 'E' NUMBER '062'
          INTO cv_msg.
        cv_rc = 4.
        EXIT.
      ENDIF.
    ENDIF.

    CHECK iv_value IS NOT INITIAL.
    lv_ean11 = iv_value.
    REFRESH lt_type_ean.
    CALL FUNCTION 'EAN_TYPE'
      EXPORTING
        i_ean       = lv_ean11
        i_flg_prfz  = 'X'
        i_intext    = 'B'
      TABLES
        e_tab_eantp = lt_type_ean.

    SORT lt_type_ean BY eantyp.
*    SORT lt_type_ean BY eantyp extern.

    READ TABLE lt_type_ean
    INTO ls_type_ean
    WITH KEY eantyp = iv_value_linked
*                      extern = 'X'
                      BINARY SEARCH.

    IF sy-subrc IS NOT INITIAL.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '063'
        INTO cv_msg.
      cv_rc = 4.
      EXIT.
    ENDIF.
  ENDMETHOD.


  METHOD CHECK_EINA_EKORG.


    READ TABLE me->gt_tbuoa TRANSPORTING NO FIELDS
          WITH KEY id    = me->gv_wa
                   ekorg = iv_value
                   BINARY SEARCH.
    IF sy-subrc NE 0.
* Cohérence de Gamme
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '037'
              INTO cv_msg
            WITH iv_value.
      cv_rc = 4.
      EXIT.
    ENDIF.


  ENDMETHOD.


  METHOD check_eord_ekorg.


    READ TABLE me->gt_tbuoa TRANSPORTING NO FIELDS
          WITH KEY id    = me->gv_wa
                   ekorg = iv_value
                   BINARY SEARCH.
    IF sy-subrc NE 0.
* Cohérence de Gamme
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '037'
              INTO cv_msg
            WITH iv_value.
      cv_rc = 4.
      EXIT.
    ENDIF.


  ENDMETHOD.


  METHOD check_eord_reswk.

    DATA : lv_vkorg   TYPE vkorg.

    CHECK iv_value IS NOT INITIAL.

    SELECT SINGLE vkorg INTO lv_vkorg
        FROM t001w
        WHERE werks = iv_value.
    IF sy-subrc NE 0.
* Cohérence de Gamme
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '075'
              INTO cv_msg
            WITH iv_value.
      cv_rc = 4.
      EXIT.
    ENDIF.

  ENDMETHOD.


  METHOD check_eord_werks.

    DATA : lv_vkorg   TYPE vkorg.

    SELECT SINGLE vkorg INTO lv_vkorg
        FROM t001w
        WHERE werks = iv_value.
    IF sy-subrc NE 0.
* Cohérence de Gamme
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '075'
              INTO cv_msg
            WITH iv_value.
      cv_rc = 4.
      EXIT.
    ENDIF.

    READ TABLE me->gt_tbuoc TRANSPORTING NO FIELDS
      WITH KEY id    = me->gv_wa
               vkorg = lv_vkorg
               BINARY SEARCH.
    IF sy-subrc NE 0.
* Cohérence de Gamme
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '074'
              INTO cv_msg
            WITH iv_value.
      cv_rc = 4.
      EXIT.
    ENDIF.

  ENDMETHOD.


  METHOD check_field.

    DATA : ls_msg    TYPE /dlwupex/tmsg,
           lv_method TYPE string.
    DATA : lv_subkey TYPE string.


*   INITIALIZATION
    CLEAR : ls_msg, lv_method.

    TRY.
        CONCATENATE gc_checkmeth iv_tabname '_' iv_fieldname
         INTO lv_method.

        CALL METHOD me->(lv_method)
          EXPORTING
            iv_art              = iv_art
            iv_tabname          = iv_tabname
            iv_fieldname        = iv_fieldname
            iv_value            = iv_value
          CHANGING
            cv_msg              = cv_msg
            cv_rc               = cv_rc.

      CATCH cx_sy_dyn_call_illegal_method.
        cv_no_method = abap_true.

    ENDTRY.

  ENDMETHOD.


  METHOD check_field_before_save.

    DATA : ls_msg    TYPE /dlwupex/tmsg,
           lv_method TYPE string.
    DATA : lv_subkey TYPE string.


*   INITIALIZATION
    CLEAR : ls_msg, lv_method.

    TRY.
        CONCATENATE gc_checkmeth_beforesave iv_tabname '_' iv_fieldname
         INTO lv_method.

        CALL METHOD me->(lv_method)
          EXPORTING
            iv_art              = iv_art
            iv_tabname          = iv_tabname
            iv_fieldname        = iv_fieldname
            iv_value            = iv_value
            iv_value_linked     = iv_value_linked
            iv_fieldname_linked = iv_fieldname_linked
          CHANGING
            cv_msg              = cv_msg
            cv_rc               = cv_rc.

      CATCH cx_sy_dyn_call_illegal_method.
        cv_no_method = abap_true.

    ENDTRY.

  ENDMETHOD.


  METHOD check_gamme.

    SELECT COUNT(*) UP TO 1 ROWS FROM wyt1
      WHERE lifnr = iv_value AND
      ltsnr = iv_value_linked.
    IF sy-subrc IS NOT INITIAL.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '067'
        INTO cv_msg WITH iv_value_linked iv_value.
      cv_rc = 4.
      EXIT.

    ENDIF.

  ENDMETHOD.


  method CHECK_MARM_BREIT.
  endmethod.


  METHOD CHECK_MARM_BRGEW.

    IF iv_value < 0.
* Cohérence de Gamme
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '083'
              INTO cv_msg
            WITH iv_fieldname.
      cv_rc = 4.
      EXIT.
    ENDIF.

  ENDMETHOD.


  method CHECK_MARM_HOEHE.
  endmethod.


  METHOD check_marm_laeng.

    IF iv_value < 0.
* Cohérence de Gamme
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '083'
              INTO cv_msg
            WITH iv_fieldname.
      cv_rc = 4.
      EXIT.
    ENDIF.

  ENDMETHOD.


  METHOD check_sales.

    DATA : lt_type_ean TYPE TABLE OF typeinterv,
           ls_type_ean TYPE typeinterv,
           lv_value    TYPE string,
           lv_ean11    TYPE ean11.

    IF iv_value IS INITIAL OR iv_value_linked IS INITIAL.
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '073'
        INTO cv_msg
      WITH iv_value iv_value_linked.
      cv_rc = 4.
      EXIT.
    ENDIF.

    READ TABLE gt_tbuoc TRANSPORTING NO FIELDS
    WITH KEY id    = me->gv_wa
             vkorg = iv_value
             vtweg = iv_value_linked
             BINARY SEARCH.
    IF sy-subrc NE 0.
* On check si l'OC et le canal de distribution sont cohérent
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '038'
              INTO cv_msg
            WITH iv_value_linked.
      cv_rc = 4.
      EXIT.
    ENDIF.


  ENDMETHOD.


  METHOD check_srlist.

    DATA : lt_type_ean TYPE TABLE OF typeinterv,
           ls_type_ean TYPE typeinterv,
           lv_value    TYPE string,
           lv_ean11    TYPE ean11.

    IF iv_value IS NOT INITIAL AND iv_value_linked IS NOT INITIAL.
      SELECT SINGLE lifnr INTO @DATA(lv_lifnr)
        FROM t001w
        WHERE werks = @iv_value_linked.
      IF ( lv_lifnr NE iv_value ).
        MESSAGE ID gc_classmsg TYPE 'E' NUMBER '018'
          INTO cv_msg.
        cv_rc = 4.
        EXIT.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD check_supplier.

    CHECK iv_value_linked IS NOT INITIAL.

    SELECT COUNT(*) UP TO 1 ROWS FROM lfm1
          WHERE lifnr = iv_value AND
          ekorg = iv_value_linked.
    IF sy-subrc IS NOT INITIAL.

      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '058'
        INTO cv_msg WITH iv_value iv_value_linked.
      cv_rc = 4.
      EXIT.
    ELSE.
      SELECT COUNT(*) UP TO 1 ROWS FROM lfm1
      WHERE lifnr = iv_value AND
      ekorg = iv_value_linked AND
      sperm = abap_true.
      IF sy-subrc IS INITIAL.
        MESSAGE ID 'ME' TYPE 'E' NUMBER '023'
         INTO cv_msg WITH iv_value iv_value_linked.
        cv_rc = 4.
        EXIT.
      ENDIF.
    ENDIF.

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
           lv_rc                    TYPE sysubrc,
           lv_no_function           TYPE xfeld.

    FIELD-SYMBOLS :  <fs_line>     TYPE any.


    REFRESH : lt_dfies_tabcontrol, lt_where, lt_key_fieldtab.
    CLEAR : ls_dfies_line, ls_domain_ctr, lv_tabname, lv_fieldname,
            lv_tabcontrol, ls_dfies_tabcontrol_line, ls_where,
            ls_msg, lv_concatenate, lv_flag_error, lv_xfeld,
            lv_output, lv_no_function, ls_key_fieldtab.
    UNASSIGN : <fs_line>.



*   Find table control
    lv_tabname = iv_tabname.
    lv_fieldname = iv_fieldname.

*    IF lv_fieldname = 'DATABB'.
*      lv_fieldname = 'DATAB'.
*    ENDIF.

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
            IF  iv_fieldname IS NOT INITIAL.

              CONDENSE ls_dfies_tabcontrol_line-fieldname.
              CONCATENATE ls_dfies_tabcontrol_line-fieldname '= ''&'' ' INTO lv_concatenate SEPARATED BY space.
              IF ls_dfies_tabcontrol_line-convexit IS NOT INITIAL.
*               On utilise la valeur de la routine de convertion
                CALL METHOD me->get_convexit
                  EXPORTING
                    is_convexit    = ls_dfies_tabcontrol_line-convexit
                    is_value       = iv_value
                    is_tabcontrol  = ls_dfies_tabcontrol_line
                  IMPORTING
                    es_xfeld       = lv_xfeld
                    ev_output      = lv_output
                  CHANGING
                    cv_no_function = lv_no_function
                    cv_rc          = lv_rc.
              ENDIF.
              IF lv_rc IS NOT INITIAL.
                MESSAGE ID gc_classmsg TYPE 'E' NUMBER '059'
                 INTO cv_msg
                 WITH iv_value iv_fieldname.
                cv_rc = 4.
                EXIT.
              ENDIF.
              IF lv_xfeld IS NOT INITIAL.
                REPLACE '&' WITH lv_output INTO lv_concatenate.
              ELSE.
                REPLACE '&' WITH iv_value INTO lv_concatenate.
                lv_output = iv_value.
              ENDIF.
              ls_where = lv_concatenate.
*             On assigne le field symbol en fonction de la table en paramètre
              CREATE DATA ls_ref_itab TYPE (lv_tabcontrol).
              ASSIGN ls_ref_itab->* TO <fs_line>.
            ENDIF.
            APPEND ls_where TO lt_where.

            IF <fs_line> IS ASSIGNED.
              IF iv_value IS NOT INITIAL.
                CALL METHOD me->get_tab_control
                  EXPORTING
                    iv_tabname = lv_tabcontrol
                    iv_value   = lv_output
                    it_where   = lt_where
                  IMPORTING
                    es_ok      = lv_ok.
                IF lv_ok = abap_false.
*                 Message d'erreur car valeur non valide
                  MESSAGE ID gc_classmsg TYPE 'E' NUMBER '059'
                    INTO cv_msg
                  WITH iv_value iv_fieldname.
                  cv_rc = 4.
                  EXIT.
                ENDIF.

              ENDIF.

            ENDIF.

          ELSE.
*           Message d'erreur : Pas de nom de champ pour le
*           nom de domaine saisie
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER '007'
             INTO cv_msg.
            cv_rc = 4.
            EXIT.
          ENDIF.
        ELSE.
*         Message d'erreur : Nom de la table de contrôle
*         incorrecte
          MESSAGE ID gc_classmsg TYPE 'E' NUMBER '006'
           INTO cv_msg.
          cv_rc = 4.
          EXIT.
        ENDIF.
      ELSEIF ls_domain_ctr-values IS NOT INITIAL.
        READ TABLE ls_domain_ctr-values TRANSPORTING NO FIELDS
        WITH KEY domvalue_l = iv_value
        BINARY SEARCH.
        IF sy-subrc IS NOT INITIAL.
*                 Message d'erreur car valeur non valide
          MESSAGE ID gc_classmsg TYPE 'E' NUMBER '059'
           INTO cv_msg
        WITH iv_value iv_fieldname.
          cv_rc = 4.
          EXIT.
        ENDIF.
*      ELSE.
**       Message d'erreur : Determination de la table de contrôle
**       impossible
*        MESSAGE ID gc_classmsg TYPE 'E' NUMBER '008'
*         INTO cv_msg.
*        cv_rc = 4.
*        EXIT.
      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD check_typage.

    DATA : lt_dfies_tab     TYPE TABLE OF dfies,
           ls_dfies_tab     TYPE dfies,
           ls_msg           TYPE /dlwupex/tmsg,
           lv_ddobjname     TYPE ddobjname,
           lv_tabname       TYPE tabname16,
           lv_date_internal TYPE d,
           lv_date_format   TYPE c LENGTH 15,
           lv_htype         TYPE  dd01v-datatype,
           lv_split1        TYPE string,
           lv_split2        TYPE string,
           lv_len           TYPE i,
           lv_rc            TYPE sysubrc,
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
    lv_tabname = lv_ddobjname = iv_tabname.
    CALL METHOD me->get_fieldinfo_field
      EXPORTING
        iv_tabname   = lv_ddobjname
      IMPORTING
        et_dfies_tab = lt_dfies_tab.
    IF sy-subrc EQ 0
      AND lt_dfies_tab[] IS NOT INITIAL.

      CLEAR ls_dfies_tab.
      READ TABLE lt_dfies_tab INTO ls_dfies_tab
        WITH KEY tabname = lv_ddobjname
                 fieldname = iv_fieldname
        BINARY SEARCH.
      IF sy-subrc EQ 0.

        IF ls_dfies_tab-convexit IS NOT INITIAL.
***       Check 2 : On contrôle que la valeur saisie est correcte via la routine de conversion
          CLEAR lv_xfeld.
          CALL METHOD me->get_convexit
            EXPORTING
              is_convexit    = ls_dfies_tab-convexit
              is_value       = iv_value
              is_tabcontrol  = ls_dfies_tab
            IMPORTING
              es_xfeld       = lv_xfeld
            CHANGING
              cv_no_function = lv_no_function
              cv_rc          = lv_rc.
          IF lv_no_function IS NOT INITIAL.
*           Nom de la fonction inéxistante
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER '006'
              INTO cv_msg.
            cv_rc = 4.
            EXIT.
*            WITH ls_msg-message_v1.
          ELSEIF lv_rc IS NOT INITIAL.
            MESSAGE ID gc_classmsg TYPE 'E' NUMBER '059'
               INTO cv_msg
               WITH iv_value iv_fieldname.
            cv_rc = 4.
            EXIT.
          ELSEIF lv_xfeld IS NOT INITIAL.
*            cv_rc = 4.
            EXIT.
          ENDIF.
        ENDIF.

        CLEAR : lv_ddobjname.", ls_dd01v.
        lv_ddobjname = iv_fieldname.
***     Check 2 : On contrôle la longeur du contenu du champ
        lv_string = iv_value.
        lv_len = strlen( lv_string ).
        IF lv_len > ls_dfies_tab-leng.
*         Champ trop long
*On récupère le libelle du champ technique pour l'erreur
          CALL METHOD me->retrieving_fieldtext
            EXPORTING
              is_ddobjname = lv_tabname
              is_tabfield  = iv_fieldname
              is_fieldname = iv_fieldname
            IMPORTING
              es_as4text   = lv_as4text.

          MESSAGE ID gc_classmsg TYPE 'E' NUMBER '026'
            INTO cv_msg
          WITH lv_as4text.
          cv_rc = 4.
          EXIT.

        ENDIF.

        CALL FUNCTION 'NUMERIC_CHECK'
          EXPORTING
            string_in = iv_value
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
                    is_ddobjname = lv_tabname
                    is_tabfield  = iv_fieldname
                    is_fieldname = iv_fieldname
                  IMPORTING
                    es_as4text   = lv_as4text.
*               Impossible de mettre du char dans du numeric
                MESSAGE ID gc_classmsg TYPE 'E' NUMBER '027'
                  INTO cv_msg
                WITH lv_as4text.
                cv_rc = 4.
                EXIT.

              ENDIF.
            WHEN 'DATS'.
              CHECK iv_value IS NOT INITIAL.
              IF lv_len >= ls_dfies_tab-leng.
                CONCATENATE iv_value+6(2) iv_value+4(2) iv_value(4)
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
                  MESSAGE ID gc_classmsg TYPE 'E' NUMBER '027'
                     INTO cv_msg
                     WITH lv_date_format.
                  cv_rc = 4.
                  EXIT.

                ENDIF.
              ELSEIF iv_value CN '0123456789'.
*               Format date incorrect
                WRITE sy-datum TO lv_date_format.
                MESSAGE ID gc_classmsg TYPE 'E' NUMBER '025'
                   INTO cv_msg
                   WITH lv_date_format.
                cv_rc = 4.
                EXIT.

              ELSEIF lv_len < ls_dfies_tab-leng.
*               format date incorrect
                WRITE sy-datum TO lv_date_format.
                MESSAGE ID gc_classmsg TYPE 'E' NUMBER '025'
                   INTO cv_msg
                   WITH lv_date_format.
                cv_rc = 4.
                EXIT.

              ENDIF.

            WHEN 'CHAR'.
*              Nothing to do

            WHEN OTHERS.

              IF iv_value CS '.'.
*               On contrôle que le nombre de décimal correspond au nombre autorisé
                SPLIT iv_value AT '.' INTO lv_split1 lv_split2.
                CONDENSE lv_split2.
                lv_len = strlen( lv_split2 ).
                IF lv_len > ls_dfies_tab-decimals.
*On récupère le libelle du champ technique pour l'erreur
                  CALL METHOD me->retrieving_fieldtext
                    EXPORTING
                      is_ddobjname = lv_tabname
                      is_tabfield  = iv_fieldname
                      is_fieldname = iv_fieldname
                    IMPORTING
                      es_as4text   = lv_as4text.
*                 Nombre de décimal trop important
                  MESSAGE ID gc_classmsg TYPE 'E' NUMBER '028'
                   INTO cv_msg
                   WITH lv_as4text ls_dfies_tab-decimals.
                  cv_rc = 4.
                  EXIT.

                ENDIF.
              ENDIF.
              CHECK iv_value IS NOT INITIAL.
              IF iv_value+0(1) = '-'.
                CALL METHOD me->retrieving_fieldtext
                  EXPORTING
                    is_ddobjname = lv_tabname
                    is_tabfield  = iv_fieldname
                    is_fieldname = iv_fieldname
                  IMPORTING
                    es_as4text   = lv_as4text.
                MESSAGE ID gc_classmsg TYPE 'E' NUMBER '083'
                        INTO cv_msg
                      WITH lv_as4text.
                cv_rc = 4.
                EXIT.
              ENDIF.

*              ENDIF.

          ENDCASE.

        ENDIF.

      ENDIF.

    ENDIF.


  ENDMETHOD.


  METHOD check_wlk1_filia.

    DATA : lv_vkorg   TYPE vkorg.

    SELECT SINGLE vkorg INTO lv_vkorg
        FROM wrs1
        WHERE asort = iv_value.

    READ TABLE me->gt_tbuoc TRANSPORTING NO FIELDS
      WITH KEY id    = me->gv_wa
               vkorg = lv_vkorg
               BINARY SEARCH.
    IF sy-subrc NE 0.
* Cohérence de Gamme
      MESSAGE ID gc_classmsg TYPE 'E' NUMBER '066'
              INTO cv_msg
            WITH iv_value.
      cv_rc = 4.
      EXIT.
    ENDIF.

  ENDMETHOD.


  METHOD constructor.

    me->gv_variant = iv_variant.
    me->gv_wa = iv_wa.

    SELECT * FROM /dlwupex/tvar_p INTO TABLE me->gt_tvar_p
       WHERE variant = iv_variant.

    SELECT * FROM /dlwupex/tbuoc INTO TABLE me->gt_tbuoc
      WHERE id = iv_wa AND
            ckp_modif = abap_true.

    SELECT * FROM /dlwupex/tbuoa INTO TABLE me->gt_tbuoa
      WHERE id = iv_wa AND
            ckp_modif = abap_true.

    SORT : me->gt_tvar_p,
           me->gt_tbuoa,
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
          IF sy-subrc IS NOT INITIAL.
            cv_rc = 4.
            EXIT.
          ENDIF.
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


  METHOD GET_EAN_TYPE.

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


  METHOD GET_FIELDINFO_FIELD.

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
         EXPORTING iv_variant = iv_variant
          iv_wa = iv_wa.
    ELSE.
      lv_class = gc_check_core.
      CREATE OBJECT rv_object
         TYPE (lv_class)
         EXPORTING iv_variant = iv_variant
          iv_wa = iv_wa.
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


  METHOD GET_TAB_CONTROL.

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


  METHOD RETRIEVING_CONTROL_TABLE.

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


  METHOD RETRIEVING_FIELDTEXT.
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
