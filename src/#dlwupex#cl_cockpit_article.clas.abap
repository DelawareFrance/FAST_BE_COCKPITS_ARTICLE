class /DLWUPEX/CL_COCKPIT_ARTICLE definition
  public
  create public .

public section.

  interfaces /DLWUPEX/IF_COCKPIT_ARTICLE .

  types:
    tty_bapi1080_bgr_c TYPE STANDARD TABLE OF bapi1080_bgr_c .
  types:
    tty_bapi1080_bom_c TYPE STANDARD TABLE OF bapi1080_bom_c .
  types:
    tty_bapi1080_itm_c TYPE STANDARD TABLE OF bapi1080_itm_c .
  types:
    tty_bapi1080_mbm_c TYPE STANDARD TABLE OF bapi1080_mbm_c .
  types:
    tty_bapi1080_rel_itm_bom_c TYPE STANDARD TABLE OF bapi1080_rel_itm_bom_c .

  class-methods READ_DATA_FROM_MATNR
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_ART_KEY type /DLWUPEX/EMATKEY
    changing
      !CT_UNIT type /DLWUPEX/TUNIT_TT optional
      !CT_CARACT type /DLWUPEX/TCARACT_TT optional
      !CT_BOM type /DLWUPEX/TBOM_TT optional
      !CT_FIA type /DLWUPEX/TFIA_TT optional
      !CT_LIST type /DLWUPEX/TLIST_TT optional
      !CT_SRLIST type /DLWUPEX/TSRLIST_TT optional
      !CT_SALE type /DLWUPEX/TSALE_TT optional
      !CT_LOGDC type /DLWUPEX/TLOGDC_TT optional
      !CT_LOGSTO type /DLWUPEX/TLOGSTO_TT optional
      !CT_GDATA type /DLWUPEX/TGDATA_TT optional
      !CT_MSG_CH type /DLWUPEX/TMSG_TT optional
      !CV_RC type SYSUBRC .
  methods CONSTRUCTOR
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID .
  class-methods BAPI_CREATE_MATERIAL
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods GET_INSTANCE
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
    returning
      value(RV_OBJECT) type ref to /DLWUPEX/CL_COCKPIT_ARTICLE .
  class-methods BAPI_CREATE_BOM
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods GET_DATA
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
    changing
      !CT_UNIT type /DLWUPEX/TUNIT_TT optional
      !CT_CARACT type /DLWUPEX/TCARACT_TT optional
      !CT_BOM type /DLWUPEX/TBOM_TT optional
      !CT_FIA type /DLWUPEX/TFIA_TT optional
      !CT_LIST type /DLWUPEX/TLIST_TT optional
      !CT_SRLIST type /DLWUPEX/TSRLIST_TT optional
      !CT_SALE type /DLWUPEX/TSALE_TT optional
      !CT_LOGDC type /DLWUPEX/TLOGDC_TT optional
      !CT_LOGSTO type /DLWUPEX/TLOGSTO_TT optional
      !CT_GDATA type /DLWUPEX/TGDATA_TT optional
      !CV_RC type SYSUBRC
      !CT_REQIDS type /DLWUPEX/TREQIDS_TT optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CT_MSG_CH type /DLWUPEX/TMSG_TT optional .
  class-methods FILL_WORKLIST
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IT_GDATA type /DLWUPEX/TGDATA_TT optional
      !IT_UNIT type /DLWUPEX/TUNIT_TT optional
      !IT_CARACT type /DLWUPEX/TCARACT_TT optional
      !IT_BOM type /DLWUPEX/TBOM_TT optional
      !IT_FIA type /DLWUPEX/TFIA_TT optional
      !IT_LIST type /DLWUPEX/TLIST_TT optional
      !IT_SRLIST type /DLWUPEX/TSRLIST_TT optional
      !IT_SALE type /DLWUPEX/TSALE_TT optional
      !IT_LOGDC type /DLWUPEX/TLOGDC_TT optional
      !IT_LOGSTO type /DLWUPEX/TLOGSTO_TT optional
      !IV_LOCKDB type XFELD optional
      !IV_FLAG_COPY type XFELD optional
      !IV_CHANGE_REQIDS type XFELD optional
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC
      !CV_REQID type /DLWUPEX/EREQID optional .
  class-methods BAPI_CREATE_FIA
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods VALID_STEP
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_STEP type /DLWUPEX/ESTEP
      !IV_ARTKEY type /DLWUPEX/EMATKEY
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods BAPI_CREATE_LISTING
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods BAPI_CREATE_SRLIST
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods CHECK_AUTHOR
    importing
      !IT_MATKL type MGW_MATKL_TT
      !IV_UNAME type UNAME
    exporting
      !EV_NO_AUTHOR type XFELD
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods BAPI_CREATE_NOMENC
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods BAPI_CREATE_SALE_PRICING
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods BAPI_CREATE_FIA_PRICING
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods SET_QUEUE_ERROR
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  methods GET_EAN_TYPE
    importing
      !IV_INTEXT type NRIND
    exporting
      !ET_EAN_TYPE type /DLWUPEX/TYPEINTERV_TT .
  methods GET_FIELDINFO_FIELD
    importing
      !IV_TABNAME type DDOBJNAME
      !IV_FIELDNAME type FIELDNAME
    exporting
      !ET_DFIES_TAB type DFIES_TAB .
  class-methods INSERT_MSG_IN_WORKLIST
    importing
      !IT_MSG type /DLWUPEX/TMSG_TT
    changing
      !CV_RC type SYSUBRC .
  class-methods DELETE_MSG_IN_WORKLIST
    importing
      !IV_ID type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
      !IV_LINE type /DLWUPEX/ELINEID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
    changing
      !CV_RC type SYSUBRC .
  methods DELETE_MSG_FOR_DELETED_LINE
    importing
      !IV_ID type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
      !IV_LINE type /DLWUPEX/ELINEID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
    changing
      !CV_RC type SYSUBRC .
  class-methods BAPI_CREATE_LISTING_BIS
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods BAPI_CREATE_BOM_LISTING
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods BAPI_CREATE_BOM_QUEUE
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_ARTKEY type /DLWUPEX/EMATKEY
    changing
      !CT_BOMGROUP type /DLWUPEX/BAPI1080_BGR_C_TT
      !CT_VARIANTS type /DLWUPEX/BAPI1080_BOM_C_TT
      !CT_ITEMS type /DLWUPEX/BAPI1080_ITM_C_TT
      !CT_MATERIALRELATIONS type /DLWUPEX/BAPI1080_MBM_C_TT
      !CT_ITEMASSIGNMENTS type /DLWUPEX/BAPI1080_ITM_BOM_TT
      !CT_BOM type /DLWUPEX/TBOM_TT
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  class-methods BAPI_CREATE_LISTING_QUEUE
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_ARTKEY type /DLWUPEX/EMATKEY
    changing
      !CT_TAB_WLK1 type WRF_PRICAT_WLK1_TTY
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CT_LIST type /DLWUPEX/TLIST_TT .
  methods DELETE_MSG_FOR_MANY_LINES
    importing
      !IV_ID type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IT_LINES type /DLWUPEX/IF_COCKPIT_ARTICLE~TTY_LINES
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
    changing
      !CV_RC type SYSUBRC .
protected section.

  data GT_TBUOC type /DLWUPEX/TBUOC_TT .
  data GV_BU type /DLWUPEX/EBUSUNITID .

  methods GET_NEXT_MATNR
    changing
      !CV_MATNR type I .
  class-methods FILL_GDATA
    importing
      !IT_GDATA type /DLWUPEX/TGDATA_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods FILL_UNIT
    importing
      !IT_UNIT type /DLWUPEX/TUNIT_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods FILL_CARACT
    importing
      !IT_CARACT type /DLWUPEX/TCARACT_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods FILL_BOM
    importing
      !IT_BOM type /DLWUPEX/TBOM_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods FILL_FIA
    importing
      !IT_FIA type /DLWUPEX/TFIA_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods FILL_LIST
    importing
      !IT_LIST type /DLWUPEX/TLIST_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods FILL_SRLIST
    importing
      !IT_SRLIST type /DLWUPEX/TSRLIST_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods FILL_SALE
    importing
      !IT_SALE type /DLWUPEX/TSALE_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods FILL_LOGDC
    importing
      !IT_LOGDC type /DLWUPEX/TLOGDC_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods FILL_LOGSTO
    importing
      !IT_LOGSTO type /DLWUPEX/TLOGSTO_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods READ_TFIELDS_CUSTO .
  class-methods FILL_REQIDS
    importing
      !IT_REQIDS type /DLWUPEX/TREQIDS_TT
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  class-methods INSERT_IN_WORKLIST
    importing
      !IT_GDATA type /DLWUPEX/TGDATA_TT optional
      !IT_UNIT type /DLWUPEX/TUNIT_TT optional
      !IT_CARACT type /DLWUPEX/TCARACT_TT optional
      !IT_BOM type /DLWUPEX/TBOM_TT optional
      !IT_FIA type /DLWUPEX/TFIA_TT optional
      !IT_LIST type /DLWUPEX/TLIST_TT optional
      !IT_SRLIST type /DLWUPEX/TSRLIST_TT optional
      !IT_SALE type /DLWUPEX/TSALE_TT optional
      !IT_LOGDC type /DLWUPEX/TLOGDC_TT optional
      !IT_LOGSTO type /DLWUPEX/TLOGSTO_TT optional
      !IT_REQIDS type /DLWUPEX/TREQIDS_TT optional
      !IV_CHANGE_REQIDS type XFELD optional
      !IV_CHANGE_WORKLIST type XFELD optional
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods GET_TABLE_FIELDS
    importing
      !IV_TABNAME type DDOBJNAME
    changing
      !CT_KEYFIELDS type CACS_COND_KEYFIELDS optional
      !CT_NONKEYFIELDS type CACS_COND_KEYFIELDS optional .
  class-methods CHANGE_STATUS
    importing
      !IV_STATUS type /DLWUPEX/ELINESTATUS
    changing
      !CT_UNIT type /DLWUPEX/TUNIT_TT optional
      !CT_CARACT type /DLWUPEX/TCARACT_TT optional
      !CT_BOM type /DLWUPEX/TBOM_TT optional
      !CT_FIA type /DLWUPEX/TFIA_TT optional
      !CT_LIST type /DLWUPEX/TLIST_TT optional
      !CT_SRLIST type /DLWUPEX/TSRLIST_TT optional
      !CT_SALE type /DLWUPEX/TSALE_TT optional
      !CT_LOGDC type /DLWUPEX/TLOGDC_TT optional
      !CT_LOGSTO type /DLWUPEX/TLOGSTO_TT optional
      !CT_GDATA type /DLWUPEX/TGDATA_TT optional
      !CT_REQIDS type /DLWUPEX/TREQIDS_TT optional
      !CV_RC type SYSUBRC .
  class-methods SET_ERRORS
    importing
      !IT_MSG type /DLWUPEX/TMSG_TT
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
private section.

  types:
    BEGIN OF ty_select,
      tabname TYPE tabname16,
      fields  TYPE TABLE OF tabfldname WITH DEFAULT KEY,
    END OF ty_select .

  constants GC_FELD type XFELD value 'X' ##NO_TEXT.
  data GT_TFIELDS type /DLWUPEX/TFIELDS_TT .
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
  constants GC_CLASSMSG type ARBGB value '/DLWUPEX/COCKPIT_ART' ##NO_TEXT.
  constants GC_CHECKMETH type STRING value 'CHECK_' ##NO_TEXT.
  constants GC_MATNR type STRING value 'MATNR' ##NO_TEXT.
  constants GC_MEINH type STRING value 'MEINH' ##NO_TEXT.
  constants GC_ID type STRING value 'ID' ##NO_TEXT.
  constants GC_REQID type STRING value 'REQID' ##NO_TEXT.
  constants GC_LINE type STRING value 'LINE' ##NO_TEXT.
  constants GC_WERKS type STRING value 'WERKS' ##NO_TEXT.
  constants GC_LIFNR type STRING value 'LIFNR' ##NO_TEXT.
  constants GC_RESWK type STRING value 'RESWK' ##NO_TEXT.
  constants GC_EANTP type STRING value 'EANTP' ##NO_TEXT.
  data GT_TBUHEAD type /DLWUPEX/TBUHEAD_TT .
  data GT_TBUOA type /DLWUPEX/TBUOA_TT .
  constants GC_EKORG type STRING value 'EKORG' ##NO_TEXT.
  constants GC_VKORG type STRING value 'VKORG' ##NO_TEXT.
  constants GC_VTWEG type STRING value 'VTWEG' ##NO_TEXT.
  data GT_TCUSTO type /DLWUPEX/TCUSTO_TT .
  constants GC_STATUSNEW type /DLWUPEX/ELINESTATUS value '01' ##NO_TEXT.
  constants GC_STATUSINPROGRESS type /DLWUPEX/ELINESTATUS value '02' ##NO_TEXT.
  constants GC_STATUSVALIDATED type /DLWUPEX/ELINESTATUS value '03' ##NO_TEXT.
  constants GC_STATUSINCREATION type /DLWUPEX/ELINESTATUS value '04' ##NO_TEXT.
  constants GC_STATUSINERROR type /DLWUPEX/ELINESTATUS value '05' ##NO_TEXT.
  constants GC_STATUSCOMPLETED type /DLWUPEX/ELINESTATUS value '06' ##NO_TEXT.
  constants GC_ART_PREFIXE type STRING value 'ART' ##NO_TEXT.
  constants GC_CLASS_CHECK type /DLWUPEX/ENAME value 'CLASSCHECK' ##NO_TEXT.
  constants GC_CHECK_CORE type /DLWUPEX/ENAME value '/DLWUPEX/CL_CORE_CHECK' ##NO_TEXT.
  constants GC_TAB_RESERVE type STRING value '/DLWUPEX/TVIEW' ##NO_TEXT.
  constants GC_CLASS_CORE type /DLWUPEX/ENAME value 'CLASSNAME' ##NO_TEXT.
  constants GC_CLASSNAME_CORE type /DLWUPEX/ENAME value '/DLWUPEX/CL_COCKPIT_ARTICLE' ##NO_TEXT.
  constants GC_SPRAS type STRING value 'SPRAS' ##NO_TEXT.
  constants GC_MATKL type STRING value 'MATKL' ##NO_TEXT.
  constants GC_UNIT type STRING value '/DLWUPEX/TUNIT' ##NO_TEXT.
  constants GC_SALE type STRING value '/DLWUPEX/TSALE' ##NO_TEXT.
  constants GC_LOGDC type STRING value '/DLWUPEX/TLOGDC' ##NO_TEXT.
  constants GC_LOGSTO type STRING value '/DLWUPEX/TLOGSTO' ##NO_TEXT.
  constants GC_ALAND type STRING value 'ALAND' ##NO_TEXT.
  data GT_EAN_TYPE type /DLWUPEX/EAN_TYPE_TT .
  data GT_FIELD_INFOS type /DLWUPEX/FIELD_INFOS_TT .
ENDCLASS.



CLASS /DLWUPEX/CL_COCKPIT_ARTICLE IMPLEMENTATION.


  METHOD /dlwupex/if_cockpit_article~alim_data_for_excel.


    DATA : lv_id_matnr TYPE i,
           lv_artkey   TYPE /dlwupex/ematkey,
           lt_gdata    TYPE /dlwupex/tgdata_tt,
           lt_unit     TYPE /dlwupex/tunit_tt,
           ls_unit     TYPE /dlwupex/tunit,
           lt_caract   TYPE /dlwupex/tcaract_tt,
           ls_caract   TYPE /dlwupex/tcaract,
           lt_bom      TYPE /dlwupex/tbom_tt,
           ls_bom      TYPE /dlwupex/tbom,
           lt_fia      TYPE /dlwupex/tfia_tt,
           ls_fia      TYPE /dlwupex/tfia,
           lt_list     TYPE /dlwupex/tlist_tt,
           ls_list     TYPE /dlwupex/tlist,
           lt_srlist   TYPE /dlwupex/tsrlist_tt,
           ls_srlist   TYPE /dlwupex/tsrlist,
           lt_sale     TYPE /dlwupex/tsale_tt,
           ls_sale     TYPE /dlwupex/tsale,
           lt_logdc    TYPE /dlwupex/tlogdc_tt,
           ls_logdc    TYPE /dlwupex/tlogdc,
           lt_logsto   TYPE /dlwupex/tlogsto_tt,
           ls_logsto   TYPE /dlwupex/tlogsto.


    lt_gdata  = ct_gdata.
*    lt_unit   = ct_unit.
*    lt_caract = ct_caract.
*    lt_bom    = ct_bom.
*    lt_fia    = ct_fia.
*    lt_list   = ct_list.
*    lt_srlist = ct_srlist.
*    lt_sale   = ct_sale.
*    lt_logdc  = ct_logdc.
*    lt_logsto = ct_logsto.

    SORT :  lt_gdata BY art_key,
            ct_unit BY art_key,
            ct_caract BY art_key,
            ct_sale BY art_key,
            ct_logdc BY art_key,
            ct_logsto BY art_key.

    lv_id_matnr = 1.
    LOOP AT lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
      DATA(lv_line) = 1.
      <fs_gdata>-matnr = lv_artkey = '$' && lv_id_matnr.

      CLEAR <fs_gdata>-databb.

      lv_id_matnr = lv_id_matnr + 1.
      lv_line = lv_line + 1.
    ENDLOOP.

    SORT lt_gdata BY num_line.

    LOOP AT lt_gdata ASSIGNING <fs_gdata>.
      lv_line = 1.
      READ TABLE ct_unit TRANSPORTING NO FIELDS
        WITH KEY art_key = <fs_gdata>-art_key
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT ct_unit INTO ls_unit FROM sy-tabix.
          IF ls_unit-art_key <> <fs_gdata>-art_key.
            EXIT.
          ENDIF.
          ls_unit-matnr = <fs_gdata>-matnr.
          APPEND ls_unit TO lt_unit.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_caract TRANSPORTING NO FIELDS
        WITH KEY art_key = <fs_gdata>-art_key
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT ct_caract INTO ls_caract FROM sy-tabix.
          IF ls_caract-art_key <> <fs_gdata>-art_key.
            EXIT.
          ENDIF.
          ls_caract-matnr = <fs_gdata>-matnr.
          APPEND ls_caract TO lt_caract.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_sale TRANSPORTING NO FIELDS
        WITH KEY art_key = <fs_gdata>-art_key
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT ct_sale INTO ls_sale FROM sy-tabix.
          IF ls_sale-art_key <> <fs_gdata>-art_key.
            EXIT.
          ENDIF.
          ls_sale-matnr = <fs_gdata>-matnr.
          APPEND ls_sale TO lt_sale.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_logdc TRANSPORTING NO FIELDS
        WITH KEY art_key = <fs_gdata>-art_key
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT ct_logdc INTO ls_logdc FROM sy-tabix.
          IF ls_logdc-art_key <> <fs_gdata>-art_key.
            EXIT.
          ENDIF.
          ls_logdc-matnr = <fs_gdata>-matnr.
          APPEND ls_logdc TO lt_logdc.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_logsto TRANSPORTING NO FIELDS
        WITH KEY art_key = <fs_gdata>-art_key
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT ct_logsto INTO ls_logsto FROM sy-tabix.
          IF ls_logsto-art_key <> <fs_gdata>-art_key.
            EXIT.
          ENDIF.
          ls_logsto-matnr = <fs_gdata>-matnr.
          APPEND ls_logsto TO lt_logsto.
        ENDLOOP.
      ENDIF.

      ls_fia-id = me->gv_bu.
      ls_fia-reqid = <fs_gdata>-reqid.
      ls_fia-matnr = <fs_gdata>-matnr.
      ls_fia-line = lv_line.
      APPEND ls_fia TO lt_fia.

      ls_list-id = me->gv_bu.
      ls_list-reqid = <fs_gdata>-reqid.
      ls_list-matnr = <fs_gdata>-matnr.
      ls_list-line = lv_line.
      APPEND ls_list TO lt_list.

      lv_line = lv_line + 1.
    ENDLOOP.

    ct_gdata  = lt_gdata.
    ct_unit   = lt_unit.
    ct_caract = lt_caract.
    ct_bom    = lt_bom.
    ct_fia    = lt_fia.
    ct_list   = lt_list.
    ct_srlist = lt_srlist.
    ct_sale   = lt_sale.
    ct_logdc  = lt_logdc.
    ct_logsto = lt_logsto.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~alim_data_save.

    TYPES : BEGIN OF ty_mara,
              matnr TYPE matnr,
              attyp TYPE attyp,
            END OF ty_mara.

    DATA : lv_volum    TYPE  volum,
           lt_t023     TYPE TABLE OF t023,
           lt_mara     TYPE TABLE OF ty_mara,
           lt_gdata_db TYPE /dlwupex/tgdata_tt,
           lv_rc       TYPE sysubrc,
           ls_fia      TYPE lfa1.

*   Volum data
    CLEAR : lv_volum.

    LOOP AT ct_unit ASSIGNING FIELD-SYMBOL(<fs_unit>).
      CHECK <fs_unit>-volum IS INITIAL OR <fs_unit>-volum = 0.
      IF <fs_unit>-laeng IS NOT INITIAL
        AND <fs_unit>-breit IS NOT INITIAL
        AND <fs_unit>-hoehe IS NOT INITIAL
        AND <fs_unit>-meabm IS NOT INITIAL
        AND <fs_unit>-voleh IS NOT INITIAL.

*       On appelle la fonction pour déterminer automatiquement le volume
        CALL FUNCTION '/SCMB/MDL_VOLUME_CALC'
          EXPORTING
            iv_meabm_uom     = <fs_unit>-meabm
            iv_laeng         = <fs_unit>-laeng
            iv_breit         = <fs_unit>-breit
            iv_hoehe         = <fs_unit>-hoehe
            iv_voleh_uom     = <fs_unit>-voleh
          IMPORTING
            ev_volum         = lv_volum
*           EV_VOLEH_UOM     =
          EXCEPTIONS
            not_qualified    = 1
            unit_not_found   = 2
            conversion_error = 3
            OTHERS           = 4.
        IF sy-subrc EQ 0
          AND lv_volum IS NOT INITIAL.
          <fs_unit>-volum = lv_volum.
        ENDIF.
      ENDIF.
    ENDLOOP.

* convert LIFNR
    LOOP AT ct_srlist ASSIGNING FIELD-SYMBOL(<fs_srlist>).
      ASSIGN COMPONENT 'LIFNR' OF STRUCTURE <fs_srlist> TO FIELD-SYMBOL(<fs_field>).
      CHECK <fs_field> IS ASSIGNED AND <fs_field> IS NOT INITIAL.
      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          input  = <fs_field>
        IMPORTING
          output = <fs_field>.
    ENDLOOP.

* convert LIFNR and retrieve Pays et Régio of supplier
    LOOP AT ct_fia ASSIGNING FIELD-SYMBOL(<fs_fia>).
      UNASSIGN <fs_field>.
      ASSIGN COMPONENT 'LIFNR' OF STRUCTURE <fs_fia> TO <fs_field>.
      CHECK <fs_field> IS ASSIGNED AND <fs_field> IS NOT INITIAL.
      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          input  = <fs_field>
        IMPORTING
          output = <fs_field>.

      ASSIGN COMPONENT 'URZLA' OF STRUCTURE <fs_fia> TO FIELD-SYMBOL(<fs_urzla>).
      ASSIGN COMPONENT 'REGIO' OF STRUCTURE <fs_fia> TO FIELD-SYMBOL(<fs_regio>).

      IF ( <fs_urzla> IS ASSIGNED AND <fs_urzla> IS INITIAL ) OR
        ( <fs_regio> IS ASSIGNED AND <fs_regio> IS INITIAL ).
        SELECT SINGLE * FROM lfa1 INTO ls_fia
          WHERE lifnr = <fs_field>.
        IF <fs_urzla> IS INITIAL.
          <fs_urzla> = ls_fia-land1.
        ENDIF.
        IF <fs_regio> IS INITIAL.
          <fs_regio> = ls_fia-regio.
        ENDIF.
      ENDIF.
    ENDLOOP.

* change Reference Article if GM change
    IF ct_gdata IS NOT INITIAL.
      READ TABLE ct_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>) INDEX 1.
      CALL METHOD /dlwupex/cl_cockpit_article=>get_data
        EXPORTING
          iv_bu    = <fs_gdata>-id
          iv_reqid = <fs_gdata>-reqid
        CHANGING
          ct_gdata = lt_gdata_db
          cv_rc    = lv_rc.

      SORT lt_gdata_db BY art_key.
      IF lt_gdata_db IS NOT INITIAL.
        SELECT matnr attyp FROM mara INTO TABLE lt_mara
                   FOR ALL ENTRIES IN lt_gdata_db
                  WHERE matnr = lt_gdata_db-ref_art AND
                        attyp = '30'.
      ENDIF.
      SELECT * FROM t023 INTO TABLE lt_t023
                 FOR ALL ENTRIES IN ct_gdata
                WHERE matkl = ct_gdata-matkl.
      SORT : lt_t023, lt_mara.
      LOOP AT ct_gdata ASSIGNING <fs_gdata>.

        CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
          EXPORTING
            input  = <fs_gdata>-matnr
          IMPORTING
            output = <fs_gdata>-matnr.


        READ TABLE lt_gdata_db ASSIGNING FIELD-SYMBOL(<fs_gdata_db>)
        WITH KEY art_key = <fs_gdata>-art_key
        BINARY SEARCH.

        IF <fs_gdata_db>-ref_art IS ASSIGNED.
          READ TABLE lt_mara TRANSPORTING NO FIELDS
            WITH KEY matnr = <fs_gdata_db>-ref_art
            BINARY SEARCH.
          CHECK sy-subrc IS INITIAL OR <fs_gdata_db>-ref_art IS INITIAL.

          READ TABLE lt_t023 INTO DATA(ls_t023)
            WITH KEY matkl = <fs_gdata>-matkl
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_gdata>-ref_art = ls_t023-wwgda.
          ENDIF.
        ELSE.
          READ TABLE lt_t023 INTO ls_t023
            WITH KEY matkl = <fs_gdata>-matkl
            BINARY SEARCH.
          IF sy-subrc IS INITIAL AND <fs_gdata>-ref_art IS INITIAL.
            <fs_gdata>-ref_art = ls_t023-wwgda.
          ENDIF.
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~alim_msg_check.

    DATA : lv_rc    TYPE sysubrc,
           lv_qname TYPE trfcqnam,
           lt_msg   TYPE /dlwupex/tmsg_tt,
           ls_msg   TYPE /dlwupex/tmsg,
           lt_tview	TYPE /dlwupex/tview_tt.

    DATA : lv_object     TYPE REF TO /dlwupex/if_cockpit_article.

    CHECK ct_tview IS NOT INITIAL.
    READ TABLE ct_tview ASSIGNING FIELD-SYMBOL(<fs_tview_tmp>)
        INDEX 1 .

    CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
      EXPORTING
        iv_bu     = me->gv_bu
      RECEIVING
        rv_object = lv_object.

    IF iv_init IS NOT INITIAL.

      READ TABLE me->gt_tcusto ASSIGNING FIELD-SYMBOL(<fs_custo>)
         WITH KEY name = 'CHECK_QUEUE'
         BINARY SEARCH.
      IF <fs_custo> IS NOT ASSIGNED.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '023'.
        ls_msg-message_v1 = '/DLWUPEX/TCUSTO'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        lv_rc = 4.
        EXIT.
      ENDIF.

      CONCATENATE <fs_custo>-value <fs_tview_tmp>-reqid '_' <fs_tview_tmp>-viewname INTO lv_qname.

      CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
        EXPORTING
          qin_name           = lv_qname
        EXCEPTIONS
          invalid_queue_name = 1
          OTHERS             = 2.
      IF sy-subrc EQ 0.
        CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_CHECK'
          IN BACKGROUND TASK
          AS SEPARATE UNIT
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = <fs_tview_tmp>-reqid
          CHANGING
            ct_views = ct_tview.
        COMMIT WORK.
      ENDIF.

    ELSE.

      lt_tview = ct_tview.

      IF <fs_tview_tmp>-viewname = gc_gdataview.

        DELETE lt_tview WHERE fieldname <> 'MATNR'.
        LOOP AT lt_tview ASSIGNING FIELD-SYMBOL(<fs_views>).
          CALL METHOD me->delete_msg_in_worklist
            EXPORTING
              iv_id       = <fs_views>-id
              iv_reqid    = <fs_views>-reqid
              iv_matnr    = <fs_views>-matnr
              iv_line     = <fs_views>-line
              iv_viewname = <fs_views>-viewname
            CHANGING
              cv_rc       = lv_rc.
        ENDLOOP.
      ELSE.
        DELETE lt_tview WHERE fieldname <> 'LINE'.

        LOOP AT lt_tview ASSIGNING <fs_views>.
          CALL METHOD me->delete_msg_in_worklist
            EXPORTING
              iv_id       = <fs_views>-id
              iv_reqid    = <fs_views>-reqid
              iv_matnr    = <fs_views>-matnr
              iv_line     = <fs_views>-line
              iv_viewname = <fs_views>-viewname
            CHANGING
              cv_rc       = lv_rc.
        ENDLOOP.
      ENDIF.



      IF lv_object IS NOT INITIAL.
        CALL METHOD lv_object->check_views
          CHANGING
            ct_tview = ct_tview
            ct_msg   = lt_msg.
      ENDIF.
      CALL METHOD me->insert_msg_in_worklist
        EXPORTING
          it_msg = lt_msg
        CHANGING
          cv_rc  = lv_rc.

      COMMIT WORK AND WAIT.
    ENDIF.

  ENDMETHOD.


  method /DLWUPEX/IF_COCKPIT_ARTICLE~BAPI_MAT_SPECIFIC_FIELDS.
  endmethod.


  METHOD /dlwupex/if_cockpit_article~check_f4.

    DATA : ls_shlp      TYPE shlp_descr,
           lv_tabname   TYPE dfies-tabname,
           lv_fieldname TYPE dfies-fieldname.

*INITIALIZATION
    CLEAR : ls_shlp, lv_tabname, lv_fieldname.

    lv_tabname   = iv_tabname.
    lv_fieldname = iv_tabfield.
*   On cherche si le champ possède une aide à
*   la recherche
    CALL FUNCTION 'F4IF_DETERMINE_SEARCHHELP'
      EXPORTING
        tabname           = lv_tabname
        fieldname         = lv_fieldname
*       SELECTION_SCREEN  = ' '
      IMPORTING
        shlp              = ls_shlp
      EXCEPTIONS
        field_not_found   = 1
        no_help_for_field = 2
        inconsistent_help = 3
        OTHERS            = 4.
    IF sy-subrc EQ 0
      AND ls_shlp IS NOT INITIAL
      AND ls_shlp-shlpname IS NOT INITIAL.
*     Le champ possède une aide
      ev_exist = abap_true.

    ELSE.
*     Le champ ne possède pas d'aide
      ev_exist = abap_false.

    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~check_views.

    DATA : lt_dfies_tab  TYPE TABLE OF dfies,
           lt_type_ean   TYPE TABLE OF typeinterv,
           ls_type_ean   TYPE typeinterv,
           ls_dfies_line TYPE dfies,
           ls_tview_tmp  TYPE /dlwupex/tview,
           ls_tfields    TYPE /dlwupex/tfields,
           ls_msg        TYPE /dlwupex/tmsg,
           ls_rc         TYPE sy-subrc,
           lv_tabname    TYPE ddobjname,
           lv_art_key    TYPE matnr,
           lv_tabfield   TYPE dfies-fieldname,
           lv_tabix      TYPE syst_tabix,
           lv_fieldtext  TYPE as4text,
           lv_fieldname  TYPE tabfldname,
           lv_flag_empty TYPE xfeld,
           lv_flag_ean   TYPE xfeld,
           lv_id         TYPE /dlwupex/ebusunitid,
           lv_reqid      TYPE /dlwupex/ereqid.

*    FIELD-SYMBOLS : .

    REFRESH : lt_dfies_tab, lt_type_ean.
    CLEAR : ls_tfields, ls_msg, ls_rc, lv_tabix, lv_flag_empty,
            lv_tabname, lv_tabfield, lv_fieldtext, ls_dfies_line, lv_flag_ean,
            ls_tview_tmp, lv_fieldname, ls_type_ean.

*    UNASSIGN : .

    DATA  : lo_object    TYPE REF TO object,
            lv_classname TYPE seoclsname.

    SORT me->gt_tfields BY viewname.


    SORT ct_tview BY id reqid rownb viewname fieldname.
*   On récupère le ARTKEY et le numéro de Line pour les futurs checks
    CLEAR ls_tview_tmp.
    READ TABLE ct_tview ASSIGNING FIELD-SYMBOL(<fs_tview_tmp>) INDEX 1.
    lv_id = <fs_tview_tmp>-id.
    lv_reqid = <fs_tview_tmp>-reqid.
*
*      CLEAR ls_tview_tmp2.
*      READ TABLE ct_tview ASSIGNING FIELD-SYMBOL(<fs_tview_tmp2>)
*      WITH KEY id        = <fs_tview_tmp>-id
*              reqid     = <fs_tview_tmp>-reqid
*              rownb     = <fs_tview_tmp>-rownb
*              viewname  = <fs_tview_tmp>-viewname
*              fieldname = 'ARTKEY'
*              BINARY SEARCH.
*      IF sy-subrc EQ 0 AND <fs_tview_tmp2> IS ASSIGNED.
*        <fs_tview_tmp>-matnr = <fs_tview_tmp2>-value.
*      ENDIF.
*      CLEAR ls_tview_tmp2.
*      READ TABLE ct_tview ASSIGNING <fs_tview_tmp2>
*      WITH KEY id        = <fs_tview_tmp>-id
*              reqid     = <fs_tview_tmp>-reqid
*              rownb     = <fs_tview_tmp>-rownb
*              viewname  = <fs_tview_tmp>-viewname
*              fieldname = 'LINE'
*              BINARY SEARCH.
*      IF sy-subrc EQ 0 AND <fs_tview_tmp2> IS ASSIGNED.
*        <fs_tview_tmp>-line = <fs_tview_tmp2>-value.
*      ENDIF.
*    ENDLOOP.

    CALL METHOD /dlwupex/cl_core_check=>get_instance
      EXPORTING
        iv_id     = lv_id
        iv_reqid  = lv_reqid
      RECEIVING
        rv_object = data(lv_object).

*   On boucle sur la table de FIORI pour contrôler les données
    SORT ct_tview.
    SORT me->gt_tfields BY id tabfield viewname.
*    LOOP AT ct_tview INTO ls_tview.
    LOOP AT ct_tview ASSIGNING FIELD-SYMBOL(<fs_tview>).

*     On garde en mémoire le tabix de la ligne en cours de traitement
      lv_tabix = sy-tabix.



**     On récupère le numéro de ligne que l'on insère dans la struc LS_TVIEW
*      CLEAR ls_tview_tmp.
*      READ TABLE ct_tview INTO ls_tview_tmp
*      WITH KEY id        = <fs_tview>-id
*               reqid     = <fs_tview>-reqid
*               rownb     = <fs_tview>-rownb
*               viewname  = <fs_tview>-viewname
*               fieldname = 'ARTKEY'.
*      IF sy-subrc EQ 0.
*        <fs_tview>-matnr = ls_tview_tmp-value.
*      ENDIF.
*
**     On récupère le numéro de ligne que l'on insère dans la struc LS_TVIEW
*      CLEAR ls_tview_tmp.
*      READ TABLE ct_tview INTO ls_tview_tmp
*      WITH KEY id        = <fs_tview>-id
*               reqid     = <fs_tview>-reqid
*               rownb     = <fs_tview>-rownb
*               viewname  = <fs_tview>-viewname
*               fieldname = 'LINE'.
*      IF sy-subrc EQ 0.
*        <fs_tview>-line = ls_tview_tmp-value.
*      ENDIF.

*     Lecture sur la table tfields
      IF <fs_tview>-fieldname EQ 'DATABB'.
        lv_fieldname = 'DATAB'.
      ELSE.
        lv_fieldname = <fs_tview>-fieldname.
      ENDIF.

      CLEAR ls_tfields.
      READ TABLE me->gt_tfields ASSIGNING FIELD-SYMBOL(<fs_tfields>)
      WITH KEY id       = <fs_tview>-id
               tabfield = lv_fieldname
               viewname = <fs_tview>-viewname
               BINARY SEARCH.
      IF sy-subrc EQ 0.
***Check : Pour le champ EAN11, on contrôle que le type EANTP
*          Si le type possède une tanche interne ou ne controle
*          plus le champ s'il est vide
        CLEAR lv_flag_ean.
        IF <fs_tview>-fieldname EQ 'EAN11'.
          READ TABLE ct_tview ASSIGNING FIELD-SYMBOL(<fs_eantp>)
           WITH KEY ('ID')        = <fs_tview>-id
                    ('REQID')     = <fs_tview>-reqid
                    ('MATNR')     = <fs_tview>-matnr
                    ('ROWNB')     = <fs_tview>-rownb
                    ('VIEWNAME')  = ls_tfields-viewname
                    ('FIELDNAME') = 'EANTP'
                    BINARY SEARCH.
          IF sy-subrc EQ 0.
            CALL METHOD me->get_ean_type
              EXPORTING
                iv_intext   = 'B'
              IMPORTING
                et_ean_type = lt_type_ean.
            IF lt_type_ean[] IS NOT INITIAL.
              CLEAR ls_type_ean.
              SORT lt_type_ean BY eantyp extern.
              READ TABLE lt_type_ean INTO ls_type_ean
              WITH KEY eantyp = <fs_eantp>-value
                       extern = ''
                       BINARY SEARCH.
              IF sy-subrc EQ 0.
*               On passe outre le contrôle obligatoire
                lv_flag_ean = abap_true.
              ENDIF.

            ENDIF.

          ENDIF.

        ENDIF.
        IF ( <fs_tfields>-obligatory EQ 'Y'
          AND <fs_tview>-value IS INITIAL
          AND lv_flag_ean IS INITIAL ) OR
          ( <fs_tfields>-obligatory EQ 'Y' AND
          <fs_tview>-value CO '0-.' AND
           <fs_tview>-fieldname(3) EQ 'DAT' ).
          CLEAR lv_fieldtext.
          lv_tabname  = <fs_tfields>-tabname.
          lv_tabfield = <fs_tfields>-tabfield.
*         find the field libel
          CALL METHOD me->get_fieldinfo_field
            EXPORTING
              iv_tabname   = lv_tabname
              iv_fieldname = lv_tabfield
            IMPORTING
              et_dfies_tab = lt_dfies_tab.
          IF sy-subrc EQ 0.
            CLEAR ls_dfies_line.
            READ TABLE lt_dfies_tab INTO ls_dfies_line
            INDEX 1.
            IF sy-subrc EQ 0.
*             On stock le libelle du champ
              lv_fieldtext = ls_dfies_line-fieldtext.
            ENDIF.
          ENDIF.
          IF lv_fieldtext IS INITIAL.
            lv_fieldtext = <fs_tview>-fieldname.
          ENDIF.

*         Erreur si un champ est vide alors qu'il est obligatoire
          CLEAR ls_msg.
          ls_msg-matnr      = <fs_tview>-matnr.
          ls_msg-id         = <fs_tview>-id.
          ls_msg-reqid      = <fs_tview>-reqid.
          ls_msg-rownb      = <fs_tview>-rownb.
          ls_msg-viewname   = <fs_tview>-viewname.
          ls_msg-field      = <fs_tview>-fieldname.
          ls_msg-line     = <fs_tview>-line.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-num        = '030'.
          ls_msg-message_v1 = lv_fieldtext.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message
          WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.

*         Update the table view
          <fs_tview>-status = ls_msg-type.
          <fs_tview>-message = ls_msg-message.

          CONTINUE.
        ENDIF.

*       On récupère la classe CHECK
        IF lv_object IS NOT INITIAL.
          CALL METHOD lv_object->/dlwupex/if_check~check
            EXPORTING
              it_table   = ct_tview
              is_tfields = <fs_tfields>
              iv_tabix   = lv_tabix
            CHANGING
              cs_tview   = <fs_tview>
              ct_msg     = ct_msg
              ct_table   = ct_tview
              cv_rc      = ls_rc.
          IF <fs_tview>-status IS NOT INITIAL.
            CONTINUE.
          ENDIF.

        ENDIF.

      ENDIF.



    ENDLOOP.


*   Check duplicate line
    IF lv_object IS NOT INITIAL.
      CALL METHOD lv_object->/dlwupex/if_check~check_duplicate_line_db
        EXPORTING
          iv_id       = <fs_tview_tmp>-id
          iv_reqid    = <fs_tview_tmp>-reqid
          iv_viewname = <fs_tview_tmp>-viewname
        CHANGING
          ct_msg      = ct_msg
*         cv_rc       =
          ct_table    = ct_tview.
    ENDIF.


    SORT me->gt_tfields.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~control_check_inprogress.

    DATA : lv_empty TYPE syst_input,
           lv_qname TYPE trfcqnam.

    READ TABLE me->gt_tcusto ASSIGNING FIELD-SYMBOL(<fs_custo>)
        WITH KEY name = 'CHECK_QUEUE'
        BINARY SEARCH.
    IF <fs_custo> IS NOT ASSIGNED.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CONCATENATE <fs_custo>-value iv_reqid '*' INTO lv_qname.

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


  METHOD /dlwupex/if_cockpit_article~control_create_inprogress.

    DATA : lv_empty   TYPE syst_input,
           lt_queue   TYPE /sapapo/cif_trfcqview_tt,
           lv_qname   TYPE trfcqnam,
           lrt_qstate TYPE RANGE OF qrfcstate,
           lrs_qstate LIKE LINE OF lrt_qstate.

    CONSTANTS : qs_ready    TYPE qrfcstate VALUE 'READY',
                qs_executed TYPE qrfcstate VALUE 'EXECUTED',
                qs_sysfail  TYPE qrfcstate VALUE 'SYSFAIL',
                qs_cpicerr  TYPE qrfcstate VALUE 'CPICERR',
                qs_running  TYPE qrfcstate VALUE 'RUNNING',
                qs_waiting  TYPE qrfcstate VALUE 'WAITING',
                qs_waitstop TYPE qrfcstate VALUE 'WAITSTOP',
                qs_finish   TYPE qrfcstate VALUE 'FINISH',
                qs_retry    TYPE qrfcstate VALUE 'RETRY',
                qs_afinish  TYPE qrfcstate VALUE 'AFINISH',
                qs_aretry   TYPE qrfcstate VALUE 'ARETRY',
                qs_anoretry TYPE qrfcstate VALUE 'ANORETRY',
                qs_modify   TYPE qrfcstate VALUE 'MODIFY',
                qs_noexec   TYPE qrfcstate VALUE 'NOEXEC'.

    lrs_qstate-sign = 'I'.
    lrs_qstate-option = 'EQ'.

    lrs_qstate-low = qs_sysfail.
    APPEND lrs_qstate TO lrt_qstate.
    lrs_qstate-low = qs_cpicerr.
    APPEND lrs_qstate TO lrt_qstate.

    READ TABLE me->gt_tcusto ASSIGNING FIELD-SYMBOL(<fs_custo>)
        WITH KEY name = 'QUEUE_PREFIXE'
        BINARY SEARCH.
    IF <fs_custo> IS NOT ASSIGNED.
      cv_rc = 4.
      EXIT.
    ENDIF.
    DATA(lv_reqid_short) = iv_reqid.
    SHIFT lv_reqid_short LEFT DELETING LEADING '0'.

    CONCATENATE <fs_custo>-value '%' 'RT' lv_reqid_short '*' INTO lv_qname.


    CALL FUNCTION 'TRFC_QIN_OVERVIEW_STATES'
      EXPORTING
        qname = lv_qname
      TABLES
        qview = lt_queue.


    SORT lt_queue BY qstate.
    DELETE lt_queue WHERE qstate IN lrt_qstate.

    IF lt_queue IS NOT INITIAL.
      ev_inprogress = 'X'.
    ELSE.
      CLEAR ev_inprogress.
    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~copy_line.

    DATA : lv_rc         TYPE sysubrc,
           lv_reqid      TYPE /dlwupex/ereqid,
           lt_gdata	     TYPE /dlwupex/tgdata_tt,
           lt_unit       TYPE /dlwupex/tunit_tt,
           lt_caract     TYPE /dlwupex/tcaract_tt,
           lt_bom        TYPE /dlwupex/tbom_tt,
           lt_fia        TYPE /dlwupex/tfia_tt,
           lt_list       TYPE /dlwupex/tlist_tt,
           lt_srlist     TYPE /dlwupex/tsrlist_tt,
           lt_sale       TYPE /dlwupex/tsale_tt,
           lt_logdc      TYPE /dlwupex/tlogdc_tt,
           lt_logsto     TYPE /dlwupex/tlogsto_tt,
           lt_gdata_cpy  TYPE /dlwupex/tgdata_tt,
           lt_unit_cpy   TYPE /dlwupex/tunit_tt,
           lt_unit_bis   TYPE /dlwupex/tunit_tt,
           lt_caract_cpy TYPE /dlwupex/tcaract_tt,
           lt_caract_bis TYPE /dlwupex/tcaract_tt,
           lt_bom_cpy    TYPE /dlwupex/tbom_tt,
           lt_bom_bis    TYPE /dlwupex/tbom_tt,
           lt_fia_cpy    TYPE /dlwupex/tfia_tt,
           lt_fia_bis    TYPE /dlwupex/tfia_tt,
           lt_list_cpy   TYPE /dlwupex/tlist_tt,
           lt_list_bis   TYPE /dlwupex/tlist_tt,
           lt_srlist_cpy TYPE /dlwupex/tsrlist_tt,
           lt_srlist_bis TYPE /dlwupex/tsrlist_tt,
           lt_sale_cpy   TYPE /dlwupex/tsale_tt,
           lt_sale_bis   TYPE /dlwupex/tsale_tt,
           lt_logdc_cpy  TYPE /dlwupex/tlogdc_tt,
           lt_logdc_bis  TYPE /dlwupex/tlogdc_tt,
           lt_logsto_cpy TYPE /dlwupex/tlogsto_tt,
           lt_logsto_bis TYPE /dlwupex/tlogsto_tt,
           lt_msg        TYPE /dlwupex/tmsg_tt,
           lt_msg_cpy    TYPE /dlwupex/tmsg_tt,
           ls_gdata	     TYPE /dlwupex/tgdata,
           ls_unit       TYPE /dlwupex/tunit,
           ls_caract     TYPE /dlwupex/tcaract,
           ls_bom        TYPE /dlwupex/tbom,
           ls_fia        TYPE /dlwupex/tfia,
           ls_list       TYPE /dlwupex/tlist,
           ls_srlist     TYPE /dlwupex/tsrlist,
           ls_sale       TYPE /dlwupex/tsale,
           ls_logdc      TYPE /dlwupex/tlogdc,
           ls_logsto     TYPE /dlwupex/tlogsto,
           ls_msg        TYPE /dlwupex/tmsg,
           t_params      TYPE abap_parmbind_tab,
           t_params_cpy  TYPE abap_parmbind_tab,
           l_param       TYPE abap_parmbind,
           lv_line       TYPE /dlwupex/elineid.


    REFRESH t_params.


******* Récupération des donnnées à copier *************

    l_param-name = 'IV_BU'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF gv_bu INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    l_param-name = 'IV_REQID'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_reqid INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CASE iv_viewname.
      WHEN gc_gdataview. "Données Générales
        CLEAR l_param.
        l_param-name = 'CT_GDATA'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_gdata INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN gc_unitview. "Données Unités et EAN
        CLEAR l_param.
        l_param-name = 'CT_UNIT'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_unit INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN gc_caractview. "Caractéristiques
        CLEAR l_param.
        l_param-name = 'CT_CARACT'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_caract INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN gc_bomview. "BOM
        CLEAR l_param.
        l_param-name = 'CT_BOM'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_bom INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN gc_fiaview. "FIA
        CLEAR l_param.
        l_param-name = 'CT_FIA'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_fia INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN gc_listview. "Source lists
        CLEAR l_param.
        l_param-name = 'CT_LIST'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_list INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN gc_srlistview. "Référencement listing
        CLEAR l_param.
        l_param-name = 'CT_SRLIST'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_srlist INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN gc_saleview. "Données Ventes
        CLEAR l_param.
        l_param-name = 'CT_SALE'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_sale INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN gc_logdcview. "Log Site ref DC
        CLEAR l_param.
        l_param-name = 'CT_LOGDC'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_logdc INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN gc_logstoview. "Log Site ref Store
        CLEAR l_param.
        l_param-name = 'CT_LOGSTO'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_logsto INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      WHEN OTHERS.
    ENDCASE.


    l_param-name = 'CV_RC'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lv_rc INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CALL METHOD ('/DLWUPEX/CL_COCKPIT_ARTICLE')=>get_data
      PARAMETER-TABLE
      t_params.


    CASE iv_viewname.
      WHEN gc_unitview. "Données Unités et EAN
        CLEAR l_param.
        l_param-name = 'CT_UNIT'.
        lt_unit_bis = lt_unit.
        SORT lt_unit_bis BY art_key ASCENDING line DESCENDING.
      WHEN gc_caractview. "Caractéristiques
        CLEAR l_param.
        l_param-name = 'CT_CARACT'.
        lt_caract_bis = lt_caract.
        SORT lt_caract_bis BY art_key ASCENDING line DESCENDING.
      WHEN gc_bomview. "BOM
        lt_bom_bis = lt_bom.
        SORT lt_bom_bis BY art_key ASCENDING line DESCENDING.
      WHEN gc_fiaview. "FIA
        lt_fia_bis = lt_fia.
        SORT lt_fia_bis BY art_key ASCENDING line DESCENDING.
      WHEN gc_listview. "Source lists
        lt_list_bis = lt_list.
        SORT lt_list_bis BY art_key ASCENDING line DESCENDING.
      WHEN gc_srlistview. "Référencement listing
        lt_srlist_bis = lt_srlist.
        SORT lt_srlist_bis BY art_key ASCENDING line DESCENDING.
      WHEN gc_saleview. "Données Ventes
        lt_sale_bis = lt_sale.
        SORT lt_sale_bis BY art_key ASCENDING line DESCENDING.
      WHEN gc_logdcview. "Log Site ref DC
        lt_logdc_bis = lt_logdc.
        SORT lt_logdc_bis BY art_key ASCENDING line DESCENDING.
      WHEN gc_logstoview. "Log Site ref Store
        lt_logsto_bis = lt_logsto.
        SORT lt_logsto_bis BY art_key ASCENDING line DESCENDING.
      WHEN OTHERS.
    ENDCASE.


    CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
      EXPORTING
        iv_bu     = me->gv_bu
      RECEIVING
        rv_object = data(lv_object).
    IF lv_object IS NOT INITIAL.
      CALL METHOD lv_object->/dlwupex/if_cockpit_article~get_msg_check
        EXPORTING
          iv_id       = me->gv_bu
          iv_reqid    = iv_reqid
          iv_viewname = iv_viewname
          iv_nochange = abap_true
        CHANGING
          cv_rc       = cv_rc
          ct_msg      = lt_msg.
      SORT lt_msg.
    ENDIF.

******* Copie des données vers les articles voulus *************

*    /DLWUPEX/Tgdata
    LOOP AT lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
      CLEAR ls_gdata.
      CHECK <fs_gdata>-id EQ me->gv_bu AND
            <fs_gdata>-reqid EQ iv_reqid AND
            <fs_gdata>-art_key EQ iv_matnr.

      ls_gdata = <fs_gdata>.

      LOOP AT ir_matnr INTO DATA(lr_matnr).
        ls_gdata-art_key = lr_matnr-low.
        DO iv_nbcopy TIMES.
          APPEND  ls_gdata TO lt_gdata_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
           WITH KEY  id = me->gv_bu
                     reqid = iv_reqid
                     matnr = iv_matnr
                     BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr.
                EXIT.
              ENDIF.
              ls_msg-matnr = ls_gdata-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.
        ENDDO.
      ENDLOOP.
    ENDLOOP.

*    /DLWUPEX/TUNIT
    LOOP AT lt_unit ASSIGNING FIELD-SYMBOL(<fs_unit>).
      CLEAR ls_unit.
      CHECK <fs_unit>-id EQ me->gv_bu AND
            <fs_unit>-reqid EQ iv_reqid AND
            <fs_unit>-line EQ iv_lineid AND
            <fs_unit>-art_key EQ iv_matnr.

      ls_unit = <fs_unit>.
      LOOP AT ir_matnr INTO lr_matnr.
        ls_unit-art_key = lr_matnr-low.
*        IF ls_unit-art_key = iv_matnr.
*          CLEAR ls_unit-meinh.
*        ENDIF.
        READ TABLE lt_unit_bis INTO DATA(ls_unit_bis)
          WITH KEY art_key = ls_unit-art_key
          BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lv_line = ls_unit_bis-line.
        ELSE.
          CLEAR lv_line.
        ENDIF.
        DO iv_nbcopy TIMES.
          ls_unit-line = lv_line = lv_line + 1.
          APPEND  ls_unit TO lt_unit_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
           WITH KEY  id = me->gv_bu
                     reqid = iv_reqid
                     matnr = iv_matnr
                     line = iv_lineid
                     BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr OR
                 ls_msg-line <> iv_lineid.
                EXIT.
              ENDIF.
              ls_msg-line = ls_unit-line.
              ls_msg-matnr = ls_unit-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.
        ENDDO.
      ENDLOOP.
    ENDLOOP.

*    /DLWUPEX/TCARACT
    LOOP AT lt_caract ASSIGNING FIELD-SYMBOL(<fs_caract>).
      CLEAR ls_caract.
      CHECK <fs_caract>-id EQ me->gv_bu AND
            <fs_caract>-reqid EQ iv_reqid AND
            <fs_caract>-line EQ iv_lineid AND
            <fs_caract>-art_key EQ iv_matnr.

      ls_caract = <fs_caract>.
      LOOP AT ir_matnr INTO lr_matnr.
        ls_caract-art_key = lr_matnr-low.
*        IF ls_caract-art_key = ls_tview-matnr.
*          CLEAR ls_caract-meinh.
*        ENDIF.
        READ TABLE lt_caract_bis INTO DATA(ls_caract_bis)
        WITH KEY art_key = ls_caract-art_key
        BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lv_line = ls_caract_bis-line.
        ELSE.
          CLEAR lv_line.
        ENDIF.
        DO iv_nbcopy TIMES.
          ls_caract-line = lv_line = lv_line + 1.
          APPEND  ls_caract TO lt_caract_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
            WITH KEY  id = me->gv_bu
                      reqid = iv_reqid
                      matnr = iv_matnr
                      line = iv_lineid
                      BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr OR
                 ls_msg-line <> iv_lineid.
                EXIT.
              ENDIF.
              ls_msg-line = ls_caract-line.
              ls_msg-matnr = ls_caract-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.
        ENDDO.
      ENDLOOP.
    ENDLOOP.

*    /DLWUPEX/TBOM
    LOOP AT lt_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).
      CLEAR ls_bom.
      CHECK <fs_bom>-id EQ me->gv_bu AND
            <fs_bom>-reqid EQ iv_reqid AND
            <fs_bom>-line EQ iv_lineid AND
            <fs_bom>-art_key EQ iv_matnr.

      ls_bom = <fs_bom>.
      LOOP AT ir_matnr INTO lr_matnr.
        ls_bom-art_key = lr_matnr-low.
*        IF ls_bom-art_key = ls_tview-matnr.
*          CLEAR ls_bom-meinh.
*        ENDIF.
        READ TABLE lt_bom_bis INTO DATA(ls_bom_bis)
       WITH KEY art_key = ls_bom-art_key
       BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lv_line = ls_bom_bis-line.
        ELSE.
          CLEAR lv_line.
        ENDIF.
        DO iv_nbcopy TIMES.
          ls_bom-line = lv_line = lv_line + 1.
          APPEND  ls_bom TO lt_bom_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
            WITH KEY  id = me->gv_bu
                      reqid = iv_reqid
                      matnr = iv_matnr
                      line = iv_lineid
                      BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr OR
                 ls_msg-line <> iv_lineid.
                EXIT.
              ENDIF.
              ls_msg-line = ls_bom-line.
              ls_msg-matnr = ls_bom-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.
        ENDDO.
      ENDLOOP.
    ENDLOOP.

*    /DLWUPEX/TFIA

    LOOP AT lt_fia ASSIGNING FIELD-SYMBOL(<fs_fia>).
      CLEAR ls_fia.
      CHECK <fs_fia>-id EQ me->gv_bu AND
            <fs_fia>-reqid EQ iv_reqid AND
            <fs_fia>-line EQ iv_lineid AND
            <fs_fia>-art_key EQ iv_matnr.

      ls_fia = <fs_fia>.
      LOOP AT ir_matnr INTO lr_matnr.
        ls_fia-art_key = lr_matnr-low.
*        IF ls_fia-art_key = iv_matnr.
*          CLEAR : ls_fia-lifnr, ls_fia-ekorg.
*        ENDIF.

        READ TABLE lt_fia_bis INTO DATA(ls_fia_bis)
        WITH KEY art_key = ls_fia-art_key
        BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lv_line = ls_fia_bis-line.
        ELSE.
          CLEAR lv_line.
        ENDIF.
        DO iv_nbcopy TIMES.
          ls_fia-line = lv_line = lv_line + 1.
          APPEND  ls_fia TO lt_fia_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
            WITH KEY  id = me->gv_bu
                      reqid = iv_reqid
                      matnr = iv_matnr
                      line = iv_lineid
                      BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr OR
                 ls_msg-line <> iv_lineid.
                EXIT.
              ENDIF.
              ls_msg-line = ls_fia-line.
              ls_msg-matnr = ls_fia-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.

        ENDDO.
      ENDLOOP.
    ENDLOOP.

*    /DLWUPEX/TLIST
    LOOP AT lt_list ASSIGNING FIELD-SYMBOL(<fs_list>).
      CLEAR ls_list.
      CHECK <fs_list>-id EQ me->gv_bu AND
            <fs_list>-reqid EQ iv_reqid AND
            <fs_list>-line EQ iv_lineid AND
            <fs_list>-art_key EQ iv_matnr.

      ls_list = <fs_list>.
      LOOP AT ir_matnr INTO lr_matnr.
        ls_list-art_key = lr_matnr-low.
*        IF ls_list-art_key = ls_tview-matnr.
*          CLEAR ls_list-meinh.
*        ENDIF.
        READ TABLE lt_list_bis INTO DATA(ls_list_bis)
        WITH KEY art_key = ls_list-art_key
        BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lv_line = ls_list_bis-line.
        ELSE.
          CLEAR lv_line.
        ENDIF.
        DO iv_nbcopy TIMES.
          ls_list-line = lv_line = lv_line + 1.
          APPEND  ls_list TO lt_list_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
           WITH KEY  id = me->gv_bu
                     reqid = iv_reqid
                     matnr = iv_matnr
                     line = iv_lineid
                     BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr OR
                 ls_msg-line <> iv_lineid.
                EXIT.
              ENDIF.
              ls_msg-line = ls_list-line.
              ls_msg-matnr = ls_list-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.
        ENDDO.
      ENDLOOP.
    ENDLOOP.

*    /DLWUPEX/TSRLIST
    LOOP AT lt_srlist ASSIGNING FIELD-SYMBOL(<fs_srlist>).
      CLEAR ls_srlist.
      CHECK <fs_srlist>-id EQ me->gv_bu AND
            <fs_srlist>-reqid EQ iv_reqid AND
            <fs_srlist>-line EQ iv_lineid AND
            <fs_srlist>-art_key EQ iv_matnr.

      ls_srlist = <fs_srlist>.
      LOOP AT ir_matnr INTO lr_matnr.
        ls_srlist-art_key = lr_matnr-low.
*        IF ls_srlist-art_key = iv_matnr.
*          CLEAR ls_srlist-werks.
*        ENDIF.
        READ TABLE lt_srlist_bis INTO DATA(ls_srlist_bis)
        WITH KEY art_key = ls_srlist-art_key
        BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lv_line = ls_srlist_bis-line.
        ELSE.
          CLEAR lv_line.
        ENDIF.
        DO iv_nbcopy TIMES.
          ls_srlist-line = lv_line = lv_line + 1.
          APPEND  ls_srlist TO lt_srlist_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
            WITH KEY  id = me->gv_bu
                      reqid = iv_reqid
                      matnr = iv_matnr
                      line = iv_lineid
                      BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr OR
                 ls_msg-line <> iv_lineid.
                EXIT.
              ENDIF.
              ls_msg-line = ls_srlist-line.
              ls_msg-matnr = ls_srlist-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.
        ENDDO.
      ENDLOOP.
    ENDLOOP.

*    /DLWUPEX/TSALE
    LOOP AT lt_sale ASSIGNING FIELD-SYMBOL(<fs_sale>).
      CLEAR ls_sale.
      CHECK <fs_sale>-id EQ me->gv_bu AND
            <fs_sale>-reqid EQ iv_reqid AND
            <fs_sale>-line EQ iv_lineid AND
            <fs_sale>-art_key EQ iv_matnr.

      ls_sale = <fs_sale>.
      LOOP AT ir_matnr INTO lr_matnr.
        ls_sale-art_key = lr_matnr-low.
*        IF ls_sale-art_key = iv_matnr.
*          CLEAR : ls_sale-vkorg, ls_sale-vtweg.
*        ENDIF.
        READ TABLE lt_sale_bis INTO DATA(ls_sale_bis)
        WITH KEY art_key = ls_sale-art_key
        BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lv_line = ls_sale_bis-line.
        ELSE.
          CLEAR lv_line.
        ENDIF.
        DO iv_nbcopy TIMES.
          ls_sale-line = lv_line = lv_line + 1.
          APPEND  ls_sale TO lt_sale_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
            WITH KEY  id = me->gv_bu
                      reqid = iv_reqid
                      matnr = iv_matnr
                      line = iv_lineid
                      BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr OR
                 ls_msg-line <> iv_lineid.
                EXIT.
              ENDIF.
              ls_msg-line = ls_sale-line.
              ls_msg-matnr = ls_sale-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.
        ENDDO.
      ENDLOOP.
    ENDLOOP.

*    /DLWUPEX/TLOGDC
    LOOP AT lt_logdc ASSIGNING FIELD-SYMBOL(<fs_logdc>).
      CLEAR ls_logdc.
      CHECK <fs_logdc>-id EQ me->gv_bu AND
            <fs_logdc>-reqid EQ iv_reqid AND
            <fs_logdc>-line EQ iv_lineid AND
            <fs_logdc>-art_key EQ iv_matnr.

      ls_logdc = <fs_logdc>.
      LOOP AT ir_matnr INTO lr_matnr.
        ls_logdc-art_key = lr_matnr-low.
*        IF ls_logdc-art_key = iv_matnr.
*          CLEAR ls_logdc-werks.
*        ENDIF.
        READ TABLE lt_logdc_bis INTO DATA(ls_logdc_bis)
                WITH KEY art_key = ls_logdc-art_key
                BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lv_line = ls_logdc_bis-line.
        ELSE.
          CLEAR lv_line.
        ENDIF.
        DO iv_nbcopy TIMES.
          ls_logdc-line = lv_line = lv_line + 1.
          APPEND  ls_logdc TO lt_logdc_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
            WITH KEY  id = me->gv_bu
                      reqid = iv_reqid
                      matnr = iv_matnr
                      line = iv_lineid
                      BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr OR
                 ls_msg-line <> iv_lineid.
                EXIT.
              ENDIF.
              ls_msg-line = ls_logdc-line.
              ls_msg-matnr = ls_logdc-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.
        ENDDO.
      ENDLOOP.
    ENDLOOP.

*    /DLWUPEX/TLOGSTO
    LOOP AT lt_logsto ASSIGNING FIELD-SYMBOL(<fs_logsto>).
      CLEAR ls_logsto.
      CHECK <fs_logsto>-id EQ me->gv_bu AND
            <fs_logsto>-reqid EQ iv_reqid AND
            <fs_logsto>-line EQ iv_lineid AND
            <fs_logsto>-art_key EQ iv_matnr.

      ls_logsto = <fs_logsto>.
      LOOP AT ir_matnr INTO lr_matnr.
        ls_logsto-art_key = lr_matnr-low.
*        IF ls_logsto-art_key = iv_matnr.
*          CLEAR ls_logsto-werks.
*        ENDIF.
        READ TABLE lt_logsto_bis INTO DATA(ls_logsto_bis)
        WITH KEY art_key = ls_logsto-art_key
        BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lv_line = ls_logsto_bis-line.
        ELSE.
          CLEAR lv_line.
        ENDIF.
        DO iv_nbcopy TIMES.
          ls_logsto-line = lv_line = lv_line + 1.
          APPEND  ls_logsto TO lt_logsto_cpy.
          READ TABLE lt_msg TRANSPORTING NO FIELDS
            WITH KEY  id = me->gv_bu
                      reqid = iv_reqid
                      matnr = iv_matnr
                      line = iv_lineid
                      BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_msg INTO ls_msg FROM sy-tabix.
              IF ls_msg-matnr <> iv_matnr OR
                 ls_msg-line <> iv_lineid.
                EXIT.
              ENDIF.
              ls_msg-line = ls_logsto-line.
              ls_msg-matnr = ls_logsto-art_key.
              APPEND ls_msg TO lt_msg_cpy.
            ENDLOOP.
          ENDIF.
        ENDDO.
      ENDLOOP.
    ENDLOOP.


******* Sauvegarde des données copiées *************
* statut new for copied material
    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = gc_statusnew
      CHANGING
        ct_unit   = lt_unit_cpy
        ct_caract = lt_caract_cpy
        ct_bom    = lt_bom_cpy
        ct_fia    = lt_fia_cpy
        ct_list   = lt_list_cpy
        ct_srlist = lt_srlist_cpy
        ct_sale   = lt_sale_cpy
        ct_logdc  = lt_logdc_cpy
        ct_logsto = lt_logsto_cpy
        ct_gdata  = lt_gdata_cpy
        cv_rc     = lv_rc.

* insert in Worklist
    lv_reqid = iv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu            = me->gv_bu
        it_gdata         = lt_gdata_cpy
        it_unit          = lt_unit_cpy
        it_caract        = lt_caract_cpy
        it_bom           = lt_bom_cpy
        it_fia           = lt_fia_cpy
        it_list          = lt_list_cpy
        it_srlist        = lt_srlist_cpy
        it_sale          = lt_sale_cpy
        it_logdc         = lt_logdc_cpy
        it_logsto        = lt_logsto_cpy
*       iv_flag_copy     = abap_true
        iv_change_reqids = abap_true
      CHANGING
        ct_msg           = ct_msg
        cv_rc            = lv_rc
        cv_reqid         = lv_reqid.


    CALL METHOD /dlwupex/cl_core_check=>get_instance
      EXPORTING
        iv_id     = me->gv_bu
        iv_reqid  = iv_reqid
      RECEIVING
        rv_object = data(lv_object_ch).
    IF lv_object_ch IS NOT INITIAL.
      CALL METHOD lv_object_ch->/dlwupex/if_check~check_duplicate_line_db
        EXPORTING
          iv_id       = me->gv_bu
          iv_reqid    = iv_reqid
          iv_viewname = iv_viewname
        CHANGING
          ct_msg      = lt_msg_cpy.
    ENDIF.

    CALL METHOD me->insert_msg_in_worklist
      EXPORTING
        it_msg = lt_msg_cpy
      CHANGING
        cv_rc  = cv_rc.

    COMMIT WORK AND WAIT .

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~copy_material.

    DATA :lv_line       TYPE  /dlwupex/elineid,
*          lv_art        TYPE /dlwupex/ematkey,
          lv_art        TYPE /dlwupex/ematkey,
          lt_gdata      TYPE /dlwupex/tgdata_tt,
          lt_unit       TYPE /dlwupex/tunit_tt,
          lt_caract     TYPE /dlwupex/tcaract_tt,
          lt_bom        TYPE /dlwupex/tbom_tt,
          lt_fia        TYPE /dlwupex/tfia_tt,
          lt_list       TYPE /dlwupex/tlist_tt,
          lt_srlist     TYPE /dlwupex/tsrlist_tt,
          lt_sale       TYPE /dlwupex/tsale_tt,
          lt_logdc      TYPE /dlwupex/tlogdc_tt,
          lt_logsto     TYPE /dlwupex/tlogsto_tt,
          lt_msg_ch     TYPE /dlwupex/tmsg_tt,
          lt_msg_ch_cpy TYPE /dlwupex/tmsg_tt,
          lt_gdata_cpy  TYPE /dlwupex/tgdata_tt,
          lt_unit_cpy   TYPE /dlwupex/tunit_tt,
          lt_caract_cpy TYPE /dlwupex/tcaract_tt,
          lt_bom_cpy    TYPE /dlwupex/tbom_tt,
          lt_fia_cpy    TYPE /dlwupex/tfia_tt,
          lt_list_cpy   TYPE /dlwupex/tlist_tt,
          lt_srlist_cpy TYPE /dlwupex/tsrlist_tt,
          lt_sale_cpy   TYPE /dlwupex/tsale_tt,
          lt_logdc_cpy  TYPE /dlwupex/tlogdc_tt,
          lt_logsto_cpy TYPE /dlwupex/tlogsto_tt,
          lv_id_matnr   TYPE i,
          ls_msg        TYPE /dlwupex/tmsg,
          lv_reqid      TYPE /dlwupex/ereqid,
          lv_num_artkey TYPE numc2,
          lv_num_line   TYPE numc_50.

*    INITIALIZATION.
*    REFRESH : .
    CLEAR : lv_num_artkey.

    SELECT SINGLE MAX( num_line ) INTO lv_num_line FROM /dlwupex/tgdata
      WHERE id = me->gv_bu AND
            reqid = iv_reqid.

* select data from Worklist Table for material to be copied
    CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
      EXPORTING
        iv_bu      = me->gv_bu
        iv_reqid   = iv_reqid
        iv_art_key = iv_matnr
      CHANGING
        ct_unit    = lt_unit
        ct_caract  = lt_caract
        ct_bom     = lt_bom
        ct_fia     = lt_fia
        ct_list    = lt_list
        ct_srlist  = lt_srlist
        ct_sale    = lt_sale
        ct_logdc   = lt_logdc
        ct_logsto  = lt_logsto
        ct_gdata   = lt_gdata
        ct_msg_ch  = lt_msg_ch
        cv_rc      = cv_rc.


    IF lt_gdata IS INITIAL.
      ls_msg-type = 'E'.
      ls_msg-idmsg = gc_classmsg.
      ls_msg-num = '031'.
      ls_msg-message_v1 = iv_matnr.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
      EXIT.
    ENDIF.

    READ TABLE lt_gdata INTO DATA(ls_gdata) INDEX 1.
* copy data
*    lv_art = lv_art+3.
*    lv_id_matnr = lv_art.
    lv_id_matnr = lv_num_line.
    DO iv_nbcopy TIMES.
      me->get_next_matnr( CHANGING cv_matnr = lv_id_matnr ).
      IF lv_id_matnr < 10.
        lv_num_artkey = lv_id_matnr.
        lv_art = ls_gdata-art_key = gc_art_prefixe && lv_num_artkey.
      ELSE.
        lv_art = ls_gdata-art_key = gc_art_prefixe && lv_id_matnr.
      ENDIF.
*      lv_art = ls_gdata-art_key = gc_art_prefixe && lv_id_matnr.
      lv_num_line = lv_id_matnr.
      ls_gdata-num_line = lv_num_line.
      APPEND ls_gdata TO lt_gdata_cpy.

      LOOP AT lt_unit INTO DATA(ls_unit).
        ls_unit-art_key = lv_art.
        APPEND ls_unit TO lt_unit_cpy.
      ENDLOOP.

      LOOP AT lt_caract INTO DATA(ls_caract).
        ls_caract-art_key = lv_art.
        APPEND ls_caract TO lt_caract_cpy.
      ENDLOOP.

      LOOP AT lt_bom INTO DATA(ls_bom).
        ls_bom-art_key = lv_art.
        APPEND ls_bom TO lt_bom_cpy.
      ENDLOOP.

      LOOP AT lt_fia INTO DATA(ls_fia).
        ls_fia-art_key = lv_art.
        APPEND ls_fia TO lt_fia_cpy.
      ENDLOOP.

      LOOP AT lt_list INTO DATA(ls_list).
        ls_list-art_key = lv_art.
        APPEND ls_list TO lt_list_cpy.
      ENDLOOP.

      LOOP AT lt_srlist INTO DATA(ls_srlist).
        ls_srlist-art_key = lv_art.
        APPEND ls_srlist TO lt_srlist_cpy.
      ENDLOOP.

      LOOP AT lt_sale INTO DATA(ls_sale).
        ls_sale-art_key = lv_art.
        APPEND ls_sale TO lt_sale_cpy.
      ENDLOOP.

      LOOP AT lt_logdc INTO DATA(ls_logdc).
        ls_logdc-art_key = lv_art.
        APPEND ls_logdc TO lt_logdc_cpy.
      ENDLOOP.

      LOOP AT lt_logsto INTO DATA(ls_logsto).
        ls_logsto-art_key = lv_art.
        APPEND ls_logsto TO lt_logsto_cpy.
      ENDLOOP.

      LOOP AT lt_msg_ch INTO DATA(ls_msg_ch).
        ls_msg_ch-matnr = lv_art.
*        CLEAR ls_msg_ch-line.
        APPEND ls_msg_ch TO lt_msg_ch_cpy.
      ENDLOOP.
    ENDDO.

* statut new for copied material
    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = gc_statusnew
      CHANGING
        ct_unit   = lt_unit_cpy
        ct_caract = lt_caract_cpy
        ct_bom    = lt_bom_cpy
        ct_fia    = lt_fia_cpy
        ct_list   = lt_list_cpy
        ct_srlist = lt_srlist_cpy
        ct_sale   = lt_sale_cpy
        ct_logdc  = lt_logdc_cpy
        ct_logsto = lt_logsto_cpy
        ct_gdata  = lt_gdata_cpy
        cv_rc     = cv_rc.

* insert in Worklist
    lv_reqid = iv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu            = me->gv_bu
        it_gdata         = lt_gdata_cpy
        it_unit          = lt_unit_cpy
        it_caract        = lt_caract_cpy
        it_bom           = lt_bom_cpy
        it_fia           = lt_fia_cpy
        it_list          = lt_list_cpy
        it_srlist        = lt_srlist_cpy
        it_sale          = lt_sale_cpy
        it_logdc         = lt_logdc_cpy
        it_logsto        = lt_logsto_cpy
*        iv_flag_copy     = abap_true
        iv_change_reqids = abap_true
        iv_lockdb        = abap_true
      CHANGING
        ct_msg           = ct_msg
        cv_rc            = cv_rc
        cv_reqid         = lv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>insert_msg_in_worklist
      EXPORTING
        it_msg = lt_msg_ch_cpy
      CHANGING
        cv_rc  = cv_rc.


*    CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
*      EXPORTING
*        it_gdata  = lt_gdata_cpy
*        it_unit   = lt_unit_cpy
*        it_caract = lt_caract_cpy
*        it_bom    = lt_bom_cpy
*        it_fia    = lt_fia_cpy
*        it_list   = lt_list_cpy
*        it_srlist = lt_srlist_cpy
*        it_sale   = lt_sale_cpy
*        it_logdc  = lt_logdc_cpy
*        it_logsto = lt_logsto_cpy
*      CHANGING
*        ct_msg    = ct_msg
*        cv_rc     = cv_rc.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~create_worklist.

    TYPES : BEGIN OF ty_cond,
              cond(72) TYPE c,
            END OF ty_cond,
            BEGIN OF ty_new_art,
              ref_art  TYPE matnr,
              matnr    TYPE matnr,
              num_line TYPE numc_50,
            END OF ty_new_art.

    DATA : lv_object     TYPE REF TO /dlwupex/if_cockpit_article.

    DATA: lt_tbuhead       TYPE TABLE OF /dlwupex/tbuhead,
          lt_t005          TYPE TABLE OF t005,
          lt_t023          TYPE TABLE OF t023,
          lt_key_fieldtab  TYPE TABLE OF dfies,
          ls_key_fieldtab  TYPE dfies,
          ls_msg           TYPE /dlwupex/tmsg,
          lv_tabname       TYPE ddobjname,
          lrt_matnr        TYPE RANGE OF matnr,
          lrs_matnr        LIKE LINE OF lrt_matnr,
          lrt_vkorg        TYPE RANGE OF vkorg,
          lrs_vkorg        LIKE LINE OF lrt_vkorg,
          lrt_ekorg        TYPE RANGE OF ekorg,
          lrs_ekorg        LIKE LINE OF lrt_ekorg,
          lrt_vtweg        TYPE RANGE OF vtweg,
          lrs_vtweg        LIKE LINE OF lrt_vtweg,
          lt_matnr         TYPE wsd_matnr_tty,
          lt_mara          TYPE wsd_matnr_tty,
          lv_cond          TYPE ty_cond,
          lt_cond          TYPE TABLE OF ty_cond,
          lrt_view         TYPE RANGE OF /dlwupex/eviewname,
          lrs_view         LIKE LINE OF lrt_view,
          lt_select        TYPE TABLE OF ty_select,
          ls_select        TYPE ty_select,
          lt_keyfield      TYPE cacs_cond_keyfields,
          lt_fields        TYPE TABLE OF tabfldname,
          ref_tab          TYPE REF TO data,
          new_line         TYPE REF TO data,
          lt_reqids        TYPE /dlwupex/treqids_tt,
          lt_gdata         TYPE /dlwupex/tgdata_tt,
          lt_gdata_bis     TYPE /dlwupex/tgdata_tt,
          ls_gdata         TYPE /dlwupex/tgdata,
          lt_unit          TYPE /dlwupex/tunit_tt,
          lt_unit_bis      TYPE /dlwupex/tunit_tt,
          ls_unit          TYPE /dlwupex/tunit,
          lt_caract        TYPE /dlwupex/tcaract_tt,
          lt_caract_bis    TYPE /dlwupex/tcaract_tt,
          ls_caract        TYPE /dlwupex/tcaract,
          lt_bom           TYPE /dlwupex/tbom_tt,
          lt_bom_bis       TYPE /dlwupex/tbom_tt,
          ls_bom           TYPE /dlwupex/tbom,
          lt_fia           TYPE /dlwupex/tfia_tt,
          lt_fia_bis       TYPE /dlwupex/tfia_tt,
          ls_fia           TYPE /dlwupex/tfia,
          lt_list          TYPE /dlwupex/tlist_tt,
          lt_list_bis      TYPE /dlwupex/tlist_tt,
          ls_list          TYPE /dlwupex/tlist,
          lt_srlist        TYPE /dlwupex/tsrlist_tt,
          lt_srlist_bis    TYPE /dlwupex/tsrlist_tt,
          ls_srlist        TYPE /dlwupex/tsrlist,
          lt_sale          TYPE /dlwupex/tsale_tt,
          lt_sale_bis      TYPE /dlwupex/tsale_tt,
          lt_sale_ter      TYPE /dlwupex/tsale_tt,
          ls_sale          TYPE /dlwupex/tsale,
          lt_logdc         TYPE /dlwupex/tlogdc_tt,
          lt_logdc_bis     TYPE /dlwupex/tlogdc_tt,
          ls_logdc         TYPE /dlwupex/tlogdc,
          lt_logsto        TYPE /dlwupex/tlogsto_tt,
          lt_logsto_bis    TYPE /dlwupex/tlogsto_tt,
          ls_logsto        TYPE /dlwupex/tlogsto,
          lt_new_art       TYPE TABLE OF ty_new_art,
          ls_new_art       TYPE ty_new_art,
          lt_tvkov         TYPE TABLE OF tvkov,
          lv_id_matnr      TYPE i,
          lrt_sitesto      TYPE RANGE OF werks_d,
          lrs_sitesto      LIKE LINE OF lrt_sitesto,
          lrt_sitedc       TYPE RANGE OF werks_d,
          lrs_sitedc       LIKE LINE OF lrt_sitedc,
          lv_count_line    TYPE i,
          lv_dfies_tabname TYPE dfies-tabname,
          lv_num_artkey    TYPE numc2,
          lv_tabix         TYPE sy-tabix,
          lv_artkey        TYPE /dlwupex/ematkey.

*    INITIALIZATION
    CLEAR : lv_count_line, lv_num_artkey, ls_key_fieldtab, lv_dfies_tabname.

    FIELD-SYMBOLS <ft_table> TYPE table.
    DATA : lv_no_author TYPE xfeld.

*** On contrôle si l'on est dans un cas de création Excel ou Fiori
    IF iv_flag_create_excel IS INITIAL.
* On contrôle les autorisations sur les groupes de marchandises
      CALL METHOD /dlwupex/cl_cockpit_article=>check_author
        EXPORTING
          it_matkl     = it_matkl
          iv_uname     = sy-uname
        IMPORTING
          ev_no_author = lv_no_author
        CHANGING
          ct_msg       = ct_msg
          cv_rc        = cv_rc.
      IF lv_no_author IS NOT INITIAL.
*     Pas d'autorisation pour créer une reserve de travaille sur ce GM.
        cv_rc = 4.
        EXIT.
      ENDIF.


* Vérification des paramètres (on doit avoir soit les articles, soit les GM)
      IF it_matkl IS INITIAL AND
         it_article IS INITIAL.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '002'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
      ELSEIF it_matkl IS NOT INITIAL AND
               it_article IS NOT INITIAL.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '002'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
      ENDIF.


* Détermination des articles à sélectionner
      IF it_matkl IS NOT INITIAL.
        SELECT * FROM t023 INTO TABLE lt_t023
           FOR ALL ENTRIES IN it_matkl
          WHERE matkl = it_matkl-table_line.
        IF lt_t023 IS NOT INITIAL.
          SELECT matnr FROM mara INTO TABLE lt_mara
              FOR ALL ENTRIES IN lt_t023
                 WHERE matnr = lt_t023-wwgda."#EC CI_NO_TRANSFORM
        ENDIF.
      ELSE.
        SELECT matnr FROM mara INTO TABLE lt_mara
              FOR ALL ENTRIES IN it_article
                 WHERE matnr = it_article-table_line.
      ENDIF.


      SORT lt_mara.

* On prépare la table qui permettra d'affecter à chaue article une clef unique
      lrs_matnr-sign = 'I'.
      lrs_matnr-option = 'EQ'.
      LOOP AT lt_mara ASSIGNING FIELD-SYMBOL(<fs_mara>).
        lrs_matnr-low = <fs_mara>.
        APPEND lrs_matnr TO lrt_matnr.
        me->get_next_matnr( CHANGING cv_matnr = lv_id_matnr ).
        IF lv_id_matnr < 10.
          lv_num_artkey = lv_id_matnr.
          ls_new_art-matnr = gc_art_prefixe && lv_num_artkey.
          ls_new_art-num_line = lv_num_artkey.
        ELSE.
          ls_new_art-matnr = gc_art_prefixe && lv_id_matnr.
          ls_new_art-num_line = lv_id_matnr.
        ENDIF.
        ls_new_art-ref_art = <fs_mara>.
        APPEND ls_new_art TO lt_new_art.
      ENDLOOP.

      SORT lt_new_art.

      IF lrt_matnr IS INITIAL.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '003'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
      ENDIF.

* alimentation des tables de custo
      lrs_ekorg-sign = 'I'.
      lrs_ekorg-option = 'EQ'.
      LOOP AT me->gt_tbuoa ASSIGNING FIELD-SYMBOL(<fs_tbuoa>).
        lrs_ekorg-low = <fs_tbuoa>-ekorg.
        APPEND lrs_ekorg TO lrt_ekorg.
      ENDLOOP.

      lrs_vkorg-sign = lrs_vtweg-sign = 'I'.
      lrs_vkorg-option = lrs_vtweg-option = 'EQ'.
      LOOP AT me->gt_tbuoc ASSIGNING FIELD-SYMBOL(<fs_tbuoc>).
        lrs_vkorg-low = <fs_tbuoc>-vkorg.
        APPEND lrs_vkorg TO lrt_vkorg.
        lrs_vtweg-low = <fs_tbuoc>-vtweg.
        APPEND lrs_vtweg TO lrt_vtweg.
      ENDLOOP.
      SORT : lrt_ekorg, lrt_vkorg, lrt_vtweg.
      DELETE ADJACENT DUPLICATES FROM : lrt_ekorg, lrt_vkorg, lrt_vtweg.


**********************************************************************

* Récupération des sites de référence
      lrs_sitedc-sign = lrs_sitesto-sign = 'I'.
      lrs_sitedc-option = lrs_sitesto-option = 'EQ'.

      SELECT SINGLE vlgvz vlgfi INTO ( lrs_sitedc-low, lrs_sitesto-low ) FROM twpa.

      IF lrs_sitedc-low IS NOT INITIAL.
        APPEND lrs_sitedc TO lrt_sitedc.
      ENDIF.

      IF lrs_sitesto-low IS NOT INITIAL.
        APPEND lrs_sitesto TO lrt_sitesto.
      ELSE.
        SELECT * INTO TABLE lt_tvkov FROM tvkov
          WHERE vkorg IN lrt_vkorg AND
                vtweg IN lrt_vtweg.
        LOOP AT lt_tvkov ASSIGNING FIELD-SYMBOL(<fs_tvkov>).
          CHECK <fs_tvkov>-vlgfi IS NOT INITIAL.
          lrs_sitesto-low = <fs_tvkov>-vlgfi.
          APPEND lrs_sitesto TO lrt_sitesto.
        ENDLOOP.
      ENDIF.

* Construction table : champs par table.
* on va créer une table contenant la liste des tables et leurs champs à récupérer
      IF me->gt_tfields IS INITIAL.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '004'.
        ls_msg-message_v1 = gv_bu.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
      ENDIF.
      LOOP AT me->gt_tfields ASSIGNING FIELD-SYMBOL(<fs_tfields>).
        READ TABLE lt_select ASSIGNING FIELD-SYMBOL(<fs_select>)
                WITH KEY tabname = <fs_tfields>-tabname
                BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          lt_fields = <fs_select>-fields.
          READ TABLE lt_fields TRANSPORTING NO FIELDS
            WITH KEY table_line = <fs_tfields>-tabfield
            BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL.
            INSERT <fs_tfields>-tabfield INTO lt_fields INDEX sy-tabix.
            <fs_select>-fields = lt_fields.
          ENDIF.
        ELSE.
          lv_tabix = sy-tabix.
          REFRESH lt_fields.
          APPEND <fs_tfields>-tabfield TO lt_fields.
          ls_select-tabname = <fs_tfields>-tabname.
          ls_select-fields = lt_fields.
          INSERT ls_select INTO lt_select INDEX lv_tabix.
        ENDIF.
      ENDLOOP.
      SORT me->gt_tfields BY tabname tabfield.

* Recherches des données à récupérer (table par table)
      LOOP AT lt_select ASSIGNING <fs_select>.
        UNASSIGN <ft_table>.
        FREE ref_tab.
        REFRESH lt_keyfield.

* recherche clef de table
        lv_tabname = <fs_select>-tabname.

        me->get_table_fields(
          EXPORTING
            iv_tabname  = lv_tabname
          CHANGING
            ct_keyfields = lt_keyfield ).

*on construit le select dynamique
        REFRESH lt_cond.
        LOOP AT lt_keyfield ASSIGNING FIELD-SYMBOL(<fs_keyfield>).
          CLEAR lv_cond.
          lt_fields = <fs_select>-fields.
          READ TABLE lt_fields TRANSPORTING NO FIELDS
            WITH KEY table_line = <fs_keyfield>-fieldname
            BINARY SEARCH.
          IF sy-subrc IS NOT INITIAL.
            INSERT <fs_keyfield>-fieldname INTO lt_fields INDEX sy-tabix.
            <fs_select>-fields = lt_fields.
          ENDIF.
          CASE <fs_keyfield>-fieldname.
            WHEN gc_matnr.
              CONCATENATE <fs_keyfield>-fieldname ' IN lrt_matnr'
                INTO lv_cond.
            WHEN gc_ekorg OR gc_vkorg OR gc_vtweg.
              CONCATENATE <fs_keyfield>-fieldname ' IN lrt_' <fs_keyfield>-fieldname
                INTO lv_cond.
            WHEN OTHERS.
              CONTINUE.
          ENDCASE.
          IF lt_cond IS NOT INITIAL.
            CONCATENATE 'AND' lv_cond
              INTO lv_cond SEPARATED BY space.
          ENDIF.
          APPEND lv_cond TO lt_cond.
        ENDLOOP.
        CHECK lt_cond IS NOT INITIAL.
* selection de données
        CREATE DATA ref_tab TYPE TABLE OF (<fs_select>-tabname).
        ASSIGN ref_tab->* TO <ft_table>.

        SELECT (<fs_select>-fields) FROM (<fs_select>-tabname)
          INTO CORRESPONDING FIELDS OF TABLE <ft_table>
          WHERE (lt_cond).

        REFRESH lrt_view.
        lrs_view-sign = 'I'.
        lrs_view-option = 'EQ'.

* Remplissage pour table de réserve de travail
* pour chaque champ on va regarder dans quelle table de réserve de travail il doit être
        LOOP AT <fs_select>-fields ASSIGNING FIELD-SYMBOL(<fs_fields>).

          READ TABLE me->gt_tfields TRANSPORTING NO FIELDS
            WITH KEY tabname = <fs_select>-tabname
                     tabfield = <fs_fields>
            BINARY SEARCH.
          CHECK sy-subrc IS INITIAL.
          LOOP AT me->gt_tfields ASSIGNING <fs_tfields> FROM sy-tabix.
            IF <fs_tfields>-tabname <> <fs_select>-tabname OR
               <fs_tfields>-tabfield <> <fs_fields>.
              EXIT.
            ENDIF.

            CHECK <fs_tfields>-viewname NOT IN lrt_view OR lrt_view IS INITIAL. " vue déjà traitée
*         On récupère la langue en fonction de la BU
*            REFRESH lt_tbuhead.
*            SELECT *
*              FROM /dlwupex/tbuhead
*              INTO TABLE lt_tbuhead
*              WHERE id = me->gv_bu.

*            IF sy-subrc EQ 0.
            IF me->gt_tbuhead IS NOT INITIAL.
              REFRESH lt_t005.
              SELECT *
                FROM t005
                INTO TABLE lt_t005
                FOR ALL ENTRIES IN me->gt_tbuhead
                WHERE land1 = me->gt_tbuhead-land1.
            ENDIF.

            CASE <fs_tfields>-viewname.
              WHEN gc_gdataview.
                LOOP AT <ft_table> ASSIGNING FIELD-SYMBOL(<fs_line>).
***             On récupère la langue dans un field symbol
                  ASSIGN COMPONENT gc_spras OF STRUCTURE <fs_line> TO FIELD-SYMBOL(<fs_spras>).
                  IF <fs_spras> IS NOT ASSIGNED OR sy-subrc IS NOT INITIAL.
                    ASSIGN COMPONENT gc_aland OF STRUCTURE <fs_line> TO <fs_spras>.
                  ENDIF.
                  IF <fs_spras> IS ASSIGNED
                    AND sy-subrc = 0.
*                 On ne garde que les langues qui sont liés au BU choisis.
                    READ TABLE lt_t005
                    TRANSPORTING NO FIELDS
                    WITH KEY spras = <fs_spras>.
                    IF sy-subrc NE 0.
                      CONTINUE.
                    ENDIF.
                  ENDIF.
                  UNASSIGN <fs_spras>.
                  ASSIGN COMPONENT gc_matnr OF STRUCTURE <fs_line> TO FIELD-SYMBOL(<fs_matnr>).
                  CHECK <fs_matnr> IS ASSIGNED.
                  READ TABLE lt_new_art INTO ls_new_art
                    WITH KEY ref_art = <fs_matnr>
                    BINARY SEARCH.
                  CHECK sy-subrc IS INITIAL.
                  READ TABLE lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>)
                    WITH KEY art_key = ls_new_art-matnr
                    BINARY SEARCH.
                  IF sy-subrc IS INITIAL.
                    MOVE-CORRESPONDING <fs_line> TO <fs_gdata>.
                    IF it_matkl IS NOT INITIAL.
* le GM doit correspondre aux données en entrée, et non au GM de l'article de référence
                      READ TABLE lt_t023 INTO DATA(ls_t023)
                        WITH KEY wwgda = ls_new_art-ref_art.
                      <fs_gdata>-matkl    = ls_t023-matkl.
                    ENDIF.
                    <fs_gdata>-art_key  = ls_new_art-matnr.
                    <fs_gdata>-num_line = ls_new_art-num_line.
                    CLEAR : <fs_gdata>-matnr, <fs_gdata>-mtart, <fs_gdata>-attyp.
                  ELSE.
                    lv_tabix = sy-tabix.
                    CLEAR ls_gdata.
                    MOVE-CORRESPONDING <fs_line> TO ls_gdata.
                    IF it_matkl IS NOT INITIAL.
                      READ TABLE lt_t023 INTO ls_t023
                        WITH KEY wwgda = ls_new_art-ref_art.
                      ls_gdata-matkl    = ls_t023-matkl.
                    ENDIF.
                    READ TABLE lt_t005 INTO DATA(ls_t005) INDEX 1.
                    ASSIGN COMPONENT gc_spras OF STRUCTURE ls_gdata TO <fs_spras>.
                    IF <fs_spras> IS ASSIGNED.
                      <fs_spras> = ls_t005-spras.
                    ENDIF.
                    ls_gdata-ref_art  = ls_new_art-ref_art.
                    ls_gdata-art_key  = ls_new_art-matnr.
                    ls_gdata-num_line = ls_new_art-num_line.
                    ls_gdata-status = gc_statusnew.
                    CLEAR : ls_gdata-matnr, ls_gdata-mtart, ls_gdata-attyp.
                    INSERT ls_gdata INTO lt_gdata INDEX lv_tabix.
                  ENDIF.
                ENDLOOP.

              WHEN gc_unitview.
* On va ici gérer des table bis car la table contient 2 clefs,
*  et les données peuvent provenir de table étant à différent niveau de clef

*             On initialise le compteur de line
                CLEAR lv_count_line.
                LOOP AT <ft_table> ASSIGNING <fs_line>.
                  ASSIGN COMPONENT gc_matnr OF STRUCTURE <fs_line> TO <fs_matnr>.
                  ASSIGN COMPONENT gc_meinh OF STRUCTURE <fs_line> TO FIELD-SYMBOL(<fs_meinh>).
                  CHECK <fs_matnr> IS ASSIGNED.
*               On incrémente le compteur de line
                  lv_count_line = lv_count_line + 1.
                  ls_unit-line  = lv_count_line.
                  READ TABLE lt_new_art INTO ls_new_art
                    WITH KEY ref_art = <fs_matnr>
                    BINARY SEARCH.
                  CHECK sy-subrc IS INITIAL.
                  IF <fs_meinh> IS NOT ASSIGNED.
                    READ TABLE lt_unit_bis ASSIGNING FIELD-SYMBOL(<fs_unit>)
                    WITH KEY art_key = ls_new_art-matnr
                    BINARY SEARCH.
                    IF sy-subrc IS INITIAL.
                      MOVE-CORRESPONDING <fs_line> TO <fs_unit>.
                      <fs_unit>-art_key = ls_new_art-matnr.
                      CLEAR <fs_unit>-matnr.
                    ELSE.
                      CLEAR ls_unit.
                      MOVE-CORRESPONDING <fs_line> TO ls_unit.
                      ls_unit-art_key = ls_new_art-matnr.
                      CLEAR ls_unit-matnr.
                      ls_unit-status = gc_statusnew.
                      INSERT ls_unit INTO lt_unit_bis INDEX sy-tabix.
                    ENDIF.
                  ELSE.
                    READ TABLE lt_unit ASSIGNING <fs_unit>
                      WITH KEY art_key = ls_new_art-matnr
                               meinh = <fs_meinh>
                      BINARY SEARCH.
                    IF sy-subrc IS INITIAL.
                      MOVE-CORRESPONDING <fs_line> TO <fs_unit>.
                      <fs_unit>-art_key = ls_new_art-matnr.
                      CLEAR <fs_unit>-matnr.
                    ELSE.
                      CLEAR ls_unit.
                      MOVE-CORRESPONDING <fs_line> TO ls_unit.
                      ls_unit-art_key = ls_new_art-matnr.
                      CLEAR ls_unit-matnr.
                      ls_unit-status = gc_statusnew.
                      INSERT ls_unit INTO lt_unit INDEX sy-tabix.
                    ENDIF.
                  ENDIF.

                ENDLOOP.
              WHEN gc_saleview.
* On va ici gérer des table bis et Ter car la table contient 3 clefs,
*  et les données peuvent provenir de table étant à différent niveau de clef

*             On initialise le compteur de line
                CLEAR lv_count_line.
                LOOP AT <ft_table> ASSIGNING <fs_line>.
                  ASSIGN COMPONENT gc_matnr OF STRUCTURE <fs_line> TO <fs_matnr>.
                  ASSIGN COMPONENT gc_vkorg OF STRUCTURE <fs_line> TO FIELD-SYMBOL(<fs_vkorg>).
                  ASSIGN COMPONENT gc_vtweg OF STRUCTURE <fs_line> TO FIELD-SYMBOL(<fs_vtweg>).
                  CHECK <fs_matnr> IS ASSIGNED.
*               On incrémente le compteur de line
                  lv_count_line = lv_count_line + 1.
                  ls_sale-line  = lv_count_line.
                  READ TABLE lt_new_art INTO ls_new_art
                    WITH KEY ref_art = <fs_matnr>
                    BINARY SEARCH.
                  CHECK sy-subrc IS INITIAL.
                  IF <fs_vkorg> IS NOT ASSIGNED.
                    READ TABLE lt_sale_ter ASSIGNING FIELD-SYMBOL(<fs_sale>)
                        WITH KEY art_key = ls_new_art-matnr
                        BINARY SEARCH.
                    IF sy-subrc IS INITIAL.
                      MOVE-CORRESPONDING <fs_line> TO <fs_sale>.
                      <fs_sale>-art_key = ls_new_art-matnr.
                      CLEAR <fs_sale>-matnr.
                    ELSE.
                      CLEAR ls_sale.
                      MOVE-CORRESPONDING <fs_line> TO ls_sale.
                      ls_sale-art_key = ls_new_art-matnr.
                      CLEAR ls_sale-matnr.
                      ls_sale-status = gc_statusnew.
                      INSERT ls_sale INTO lt_sale_ter INDEX sy-tabix.
                    ENDIF.
                  ELSEIF <fs_vtweg> IS NOT ASSIGNED.
                    READ TABLE lt_sale_bis ASSIGNING <fs_sale>
                        WITH KEY art_key = ls_new_art-matnr
                                 vkorg = <fs_vkorg>
                        BINARY SEARCH.
                    IF sy-subrc IS INITIAL.
                      MOVE-CORRESPONDING <fs_line> TO <fs_sale>.
                      <fs_sale>-art_key = ls_new_art-matnr.
                      CLEAR <fs_sale>-matnr.
                    ELSE.
                      CLEAR ls_sale.
                      MOVE-CORRESPONDING <fs_line> TO ls_sale.
                      ls_sale-art_key = ls_new_art-matnr.
                      CLEAR ls_sale-matnr.
                      ls_sale-status = gc_statusnew.
                      INSERT ls_sale INTO lt_sale_bis INDEX sy-tabix.
                    ENDIF.
                  ELSE.
                    READ TABLE lt_sale ASSIGNING <fs_sale>
                      WITH KEY art_key = ls_new_art-matnr
                               vkorg = <fs_vkorg>
                               vtweg = <fs_vtweg>
                      BINARY SEARCH.
                    IF sy-subrc IS INITIAL.
                      MOVE-CORRESPONDING <fs_line> TO <fs_sale>.
                      <fs_sale>-art_key = ls_new_art-matnr.
                      CLEAR <fs_sale>-matnr.
                    ELSE.
                      CLEAR ls_sale.
                      MOVE-CORRESPONDING <fs_line> TO ls_sale.
                      ls_sale-art_key = ls_new_art-matnr.
                      CLEAR ls_sale-matnr.
                      ls_sale-status = gc_statusnew.
                      INSERT ls_sale INTO lt_sale INDEX sy-tabix.
                    ENDIF.
                  ENDIF.

                ENDLOOP.
              WHEN gc_logdcview.
* On va ici gérer des table bis car la table contient 2 clefs,
*  et les données peuvent provenir de table étant à différent niveau de clef

*             On initialise le compteur de line
                CLEAR lv_count_line.
                LOOP AT <ft_table> ASSIGNING <fs_line>.
                  ASSIGN COMPONENT gc_matnr OF STRUCTURE <fs_line> TO <fs_matnr>.
                  ASSIGN COMPONENT gc_werks OF STRUCTURE <fs_line> TO FIELD-SYMBOL(<fs_werks>).
                  CHECK <fs_werks> IN lrt_sitedc AND lrt_sitedc IS NOT INITIAL.
                  CHECK <fs_matnr> IS ASSIGNED.
*               On incrémente le compteur de line
                  lv_count_line = lv_count_line + 1.
                  ls_logdc-line  = lv_count_line.
                  READ TABLE lt_new_art INTO ls_new_art
                    WITH KEY ref_art = <fs_matnr>
                    BINARY SEARCH.
                  CHECK sy-subrc IS INITIAL.
                  IF <fs_werks> IS NOT ASSIGNED.
                    READ TABLE lt_logdc_bis ASSIGNING FIELD-SYMBOL(<fs_logdc>)
                      WITH KEY art_key = ls_new_art-matnr
                      BINARY SEARCH.
                    IF sy-subrc IS INITIAL.
                      MOVE-CORRESPONDING <fs_line> TO <fs_logdc>.
                      <fs_logdc>-art_key = ls_new_art-matnr.
                      CLEAR <fs_logdc>-matnr.
                    ELSE.
                      CLEAR ls_logdc.
                      MOVE-CORRESPONDING <fs_line> TO ls_logdc.
                      ls_logdc-art_key = ls_new_art-matnr.
                      CLEAR ls_logdc-matnr.
                      ls_logdc-status = gc_statusnew.
                      INSERT ls_logdc INTO lt_logdc_bis INDEX sy-tabix.
                    ENDIF.
                  ELSE.
                    READ TABLE lt_logdc ASSIGNING <fs_logdc>
                      WITH KEY art_key = ls_new_art-matnr
                               werks = <fs_werks>
                      BINARY SEARCH.
                    IF sy-subrc IS INITIAL.
                      MOVE-CORRESPONDING <fs_line> TO <fs_logdc>.
                      <fs_logdc>-art_key = ls_new_art-matnr.
                      CLEAR <fs_logdc>-matnr.
                    ELSE.
                      CLEAR ls_logdc.
                      MOVE-CORRESPONDING <fs_line> TO ls_logdc.
                      ls_logdc-art_key = ls_new_art-matnr.
                      CLEAR ls_logdc-matnr.
                      ls_logdc-status = gc_statusnew.
                      INSERT ls_logdc INTO lt_logdc INDEX sy-tabix.
                    ENDIF.
                  ENDIF.

                ENDLOOP.
              WHEN gc_logstoview.
* On va ici gérer des table bis car la table contient 2 clefs,
*  et les données peuvent provenir de table étant à différent niveau de clef

*             On initialise le compteur de line
                CLEAR lv_count_line.
                LOOP AT <ft_table> ASSIGNING <fs_line>.
                  ASSIGN COMPONENT gc_matnr OF STRUCTURE <fs_line> TO <fs_matnr>.
                  ASSIGN COMPONENT gc_werks OF STRUCTURE <fs_line> TO <fs_werks>.
                  CHECK <fs_werks> IN lrt_sitesto AND lrt_sitesto IS NOT INITIAL.
                  CHECK <fs_matnr> IS ASSIGNED.
*               On incrémente le compteur de line
                  lv_count_line = lv_count_line + 1.
                  ls_logsto-line  = lv_count_line.
                  READ TABLE lt_new_art INTO ls_new_art
                    WITH KEY ref_art = <fs_matnr>
                    BINARY SEARCH.
                  CHECK sy-subrc IS INITIAL.
                  IF <fs_werks> IS NOT ASSIGNED.
                    READ TABLE lt_logsto_bis ASSIGNING FIELD-SYMBOL(<fs_logsto>)
                      WITH KEY art_key = ls_new_art-matnr
                      BINARY SEARCH.
                    IF sy-subrc IS INITIAL.
                      MOVE-CORRESPONDING <fs_line> TO <fs_logsto>.
                      <fs_logsto>-art_key = ls_new_art-matnr.
                      CLEAR <fs_logsto>-matnr.
                    ELSE.
                      CLEAR ls_logsto.
                      MOVE-CORRESPONDING <fs_line> TO ls_logsto.
                      ls_logsto-art_key = ls_new_art-matnr.
                      CLEAR ls_logsto-matnr.
                      ls_logsto-status = gc_statusnew.
                      INSERT ls_logsto INTO lt_logsto_bis INDEX sy-tabix.
                    ENDIF.
                  ELSE.
                    READ TABLE lt_logsto ASSIGNING <fs_logsto>
                      WITH KEY art_key = ls_new_art-matnr
                               werks = <fs_werks>
                      BINARY SEARCH.
                    IF sy-subrc IS INITIAL.
                      MOVE-CORRESPONDING <fs_line> TO <fs_logsto>.
                      <fs_logsto>-art_key = ls_new_art-matnr.
                      CLEAR <fs_logsto>-matnr.
                    ELSE.
                      CLEAR ls_logsto.
                      MOVE-CORRESPONDING <fs_line> TO ls_logsto.
                      ls_logsto-art_key = ls_new_art-matnr.
                      CLEAR ls_logsto-matnr.
                      ls_logsto-status = gc_statusnew.
                      INSERT ls_logsto INTO lt_logsto INDEX sy-tabix.
                    ENDIF.
                  ENDIF.
                ENDLOOP.
            ENDCASE.
            lrs_view-low = <fs_tfields>-viewname.
            APPEND lrs_view TO lrt_view.
          ENDLOOP.

        ENDLOOP.
      ENDLOOP.

* alimentation des tables à plusieurs niveaux
      IF lt_unit_bis IS NOT INITIAL.
        REFRESH lt_key_fieldtab.
        CLEAR lv_dfies_tabname.
        lv_dfies_tabname = gc_unit.
        CALL FUNCTION 'GET_KEY_FIELDS_OF_TABLE'
          EXPORTING
            tabname       = lv_dfies_tabname
          TABLES
            key_fieldtab  = lt_key_fieldtab
          EXCEPTIONS
            not_supported = 1
            OTHERS        = 2.
        LOOP AT lt_unit ASSIGNING <fs_unit>.
          READ TABLE lt_unit_bis INTO ls_unit
            WITH KEY art_key = <fs_unit>-art_key
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DO.
              CLEAR ls_key_fieldtab.
              READ TABLE lt_key_fieldtab INTO ls_key_fieldtab
              WITH KEY position = sy-index.
              IF sy-subrc EQ 0
                AND ls_key_fieldtab-fieldname EQ gc_line.
                CONTINUE.
              ENDIF.
              ASSIGN COMPONENT sy-index OF STRUCTURE ls_unit TO FIELD-SYMBOL(<field>).
              IF sy-subrc IS NOT INITIAL.
                EXIT.
              ENDIF.
              IF <field> IS NOT INITIAL.
                ASSIGN COMPONENT sy-index OF STRUCTURE <fs_unit> TO FIELD-SYMBOL(<field_res>).
                <field_res> = <field>.
              ENDIF.
            ENDDO.
          ENDIF.
        ENDLOOP.
      ENDIF.

      IF lt_sale_ter IS NOT INITIAL.
        REFRESH lt_key_fieldtab.
        CLEAR lv_dfies_tabname.
        lv_dfies_tabname = gc_sale.
        CALL FUNCTION 'GET_KEY_FIELDS_OF_TABLE'
          EXPORTING
            tabname       = lv_dfies_tabname
          TABLES
            key_fieldtab  = lt_key_fieldtab
          EXCEPTIONS
            not_supported = 1
            OTHERS        = 2.
        LOOP AT lt_sale ASSIGNING <fs_sale>.
          READ TABLE lt_sale_ter INTO ls_sale
            WITH KEY art_key = <fs_sale>-art_key
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DO.
              CLEAR ls_key_fieldtab.
              READ TABLE lt_key_fieldtab INTO ls_key_fieldtab
              WITH KEY position = sy-index.
              IF sy-subrc EQ 0
                AND ls_key_fieldtab-fieldname EQ gc_line.
                CONTINUE.
              ENDIF.
              ASSIGN COMPONENT sy-index OF STRUCTURE ls_sale TO <field>.
              IF sy-subrc IS NOT INITIAL.
                EXIT.
              ENDIF.
              IF <field> IS NOT INITIAL.
                ASSIGN COMPONENT sy-index OF STRUCTURE <fs_sale> TO <field_res>.
                <field_res> = <field>.
              ENDIF.
            ENDDO.
          ENDIF.
        ENDLOOP.
      ENDIF.

      IF lt_sale_bis IS NOT INITIAL.
        REFRESH lt_key_fieldtab.
        CLEAR lv_dfies_tabname.
        lv_dfies_tabname = gc_sale.
        CALL FUNCTION 'GET_KEY_FIELDS_OF_TABLE'
          EXPORTING
            tabname       = lv_dfies_tabname
          TABLES
            key_fieldtab  = lt_key_fieldtab
          EXCEPTIONS
            not_supported = 1
            OTHERS        = 2.
        LOOP AT lt_sale ASSIGNING <fs_sale>.
          READ TABLE lt_sale_bis INTO ls_sale
            WITH KEY art_key = <fs_sale>-art_key
                     vkorg = <fs_sale>-vkorg
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DO.
              CLEAR ls_key_fieldtab.
              READ TABLE lt_key_fieldtab INTO ls_key_fieldtab
              WITH KEY position = sy-index.
              IF sy-subrc EQ 0
                AND ls_key_fieldtab-fieldname EQ gc_line.
                CONTINUE.
              ENDIF.
              ASSIGN COMPONENT sy-index OF STRUCTURE ls_sale TO <field>.
              IF sy-subrc IS NOT INITIAL.
                EXIT.
              ENDIF.
              IF <field> IS NOT INITIAL.
                ASSIGN COMPONENT sy-index OF STRUCTURE <fs_sale> TO <field_res>.
                <field_res> = <field>.
              ENDIF.
            ENDDO.
          ENDIF.
        ENDLOOP.
      ENDIF.

      IF lt_logdc_bis IS NOT INITIAL.
        REFRESH lt_key_fieldtab.
        CLEAR lv_dfies_tabname.
        lv_dfies_tabname = gc_logdc.
        CALL FUNCTION 'GET_KEY_FIELDS_OF_TABLE'
          EXPORTING
            tabname       = lv_dfies_tabname
          TABLES
            key_fieldtab  = lt_key_fieldtab
          EXCEPTIONS
            not_supported = 1
            OTHERS        = 2.
        LOOP AT lt_logdc ASSIGNING <fs_logdc>.
          READ TABLE lt_logdc_bis INTO ls_logdc
            WITH KEY art_key = <fs_logdc>-art_key
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DO.
              CLEAR ls_key_fieldtab.
              READ TABLE lt_key_fieldtab INTO ls_key_fieldtab
              WITH KEY position = sy-index.
              IF sy-subrc EQ 0
                AND ls_key_fieldtab-fieldname EQ gc_line.
                CONTINUE.
              ENDIF.
              ASSIGN COMPONENT sy-index OF STRUCTURE ls_logdc TO <field>.
              IF sy-subrc IS NOT INITIAL.
                EXIT.
              ENDIF.
              IF <field> IS NOT INITIAL.
                ASSIGN COMPONENT sy-index OF STRUCTURE <fs_logdc> TO <field_res>.
                <field_res> = <field>.
              ENDIF.
            ENDDO.
          ENDIF.
        ENDLOOP.
      ENDIF.

      IF lt_logsto_bis IS NOT INITIAL.
        REFRESH lt_key_fieldtab.
        CLEAR lv_dfies_tabname.
        lv_dfies_tabname = gc_logsto.
        CALL FUNCTION 'GET_KEY_FIELDS_OF_TABLE'
          EXPORTING
            tabname       = lv_dfies_tabname
          TABLES
            key_fieldtab  = lt_key_fieldtab
          EXCEPTIONS
            not_supported = 1
            OTHERS        = 2.
        LOOP AT lt_logsto ASSIGNING <fs_logsto>.
          READ TABLE lt_logsto_bis INTO ls_logsto
            WITH KEY art_key = <fs_logsto>-art_key
            BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            DO.
              CLEAR ls_key_fieldtab.
              READ TABLE lt_key_fieldtab INTO ls_key_fieldtab
              WITH KEY position = sy-index.
              IF sy-subrc EQ 0
                AND ls_key_fieldtab-fieldname EQ gc_line.
                CONTINUE.
              ENDIF.
              ASSIGN COMPONENT sy-index OF STRUCTURE ls_logsto TO <field>.
              IF sy-subrc IS NOT INITIAL.
                EXIT.
              ENDIF.
              IF <field> IS NOT INITIAL.
                ASSIGN COMPONENT sy-index OF STRUCTURE <fs_logsto> TO <field_res>.
                <field_res> = <field>.
              ENDIF.
            ENDDO.
          ENDIF.
        ENDLOOP.
      ENDIF.
      SORT me->gt_tfields.

* Alimentation default value
      CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
        EXPORTING
          iv_bu     = me->gv_bu
        RECEIVING
          rv_object = lv_object.
      IF lv_object IS NOT INITIAL.
        CALL METHOD lv_object->manage_before_creation
          EXPORTING
            iv_bu     = me->gv_bu
          CHANGING
            ct_gdata  = lt_gdata
            ct_unit   = lt_unit
            ct_caract = lt_caract
            ct_sale   = lt_sale
            ct_logdc  = lt_logdc
            ct_logsto = lt_logsto
            ct_msg    = ct_msg
            cv_rc     = cv_rc.
      ENDIF.

* gestion multi GM avec le même article de référence (on duplique les lignes)
      SORT lt_gdata BY matkl.
      IF it_matkl IS NOT INITIAL.
        lt_unit_bis = lt_unit.
        lt_gdata_bis = lt_gdata.
        lt_caract_bis = lt_caract.
        lt_bom_bis = lt_bom.
        lt_fia_bis = lt_fia.
        lt_list_bis = lt_list.
        lt_srlist_bis = lt_srlist.
        lt_sale_bis = lt_sale.
        lt_logdc_bis = lt_logdc.
        lt_logsto_bis = lt_logsto.

        SORT :
        lt_gdata_bis BY art_key,
        lt_unit_bis BY art_key,
        lt_caract_bis BY art_key,
        lt_bom_bis BY art_key,
        lt_fia_bis BY art_key,
        lt_list_bis BY art_key,
        lt_srlist_bis BY art_key,
        lt_sale_bis BY art_key,
        lt_logdc_bis BY art_key,
        lt_logsto_bis BY art_key.

        SELECT * FROM t023 INTO TABLE lt_t023
           FOR ALL ENTRIES IN it_matkl
          WHERE matkl = it_matkl-table_line.

        LOOP AT lt_t023 ASSIGNING FIELD-SYMBOL(<fs_t023>).
          READ TABLE lt_gdata TRANSPORTING NO FIELDS
              WITH KEY matkl = <fs_t023>-matkl
              BINARY SEARCH.
          lv_tabix = sy-tabix.
          CHECK sy-subrc <> 0.

          READ TABLE lt_gdata_bis INTO ls_gdata
              WITH KEY ref_art = <fs_t023>-wwgda.
          CHECK sy-subrc = 0.
          lv_artkey = ls_gdata-art_key.

          me->get_next_matnr( CHANGING cv_matnr = lv_id_matnr ).
          IF lv_id_matnr < 10.
            lv_num_artkey = lv_id_matnr.
            ls_gdata-art_key = gc_art_prefixe && lv_num_artkey.
            ls_gdata-num_line = lv_num_artkey.
          ELSE.
            ls_gdata-art_key = gc_art_prefixe && lv_id_matnr.
            ls_gdata-num_line = lv_id_matnr.
          ENDIF.
          ls_gdata-matkl = <fs_t023>-matkl.

          READ TABLE lt_unit_bis TRANSPORTING NO FIELDS
            WITH KEY art_key = lv_artkey.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_unit_bis INTO ls_unit FROM sy-tabix.
              IF ls_unit-art_key <> lv_artkey.
                EXIT.
              ENDIF.
              ls_unit-art_key = ls_gdata-art_key.
              CLEAR ls_unit-matnr.
              APPEND ls_unit TO lt_unit.
            ENDLOOP.
          ENDIF.

          READ TABLE lt_caract_bis TRANSPORTING NO FIELDS
            WITH KEY art_key = lv_artkey.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_caract_bis INTO ls_caract FROM sy-tabix.
              IF ls_caract-art_key <> lv_artkey.
                EXIT.
              ENDIF.
              ls_caract-art_key = ls_gdata-art_key.
              CLEAR ls_caract-matnr.
              APPEND ls_caract TO lt_caract.
            ENDLOOP.
          ENDIF.

          READ TABLE lt_bom_bis TRANSPORTING NO FIELDS
            WITH KEY art_key = lv_artkey.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_bom_bis INTO ls_bom FROM sy-tabix.
              IF ls_bom-art_key <> lv_artkey.
                EXIT.
              ENDIF.
              ls_bom-art_key = ls_gdata-art_key.
              CLEAR ls_bom-matnr.
              APPEND ls_bom TO lt_bom.
            ENDLOOP.
          ENDIF.

          READ TABLE lt_fia_bis TRANSPORTING NO FIELDS
            WITH KEY art_key = lv_artkey.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_fia_bis INTO ls_fia FROM sy-tabix.
              IF ls_fia-art_key <> lv_artkey.
                EXIT.
              ENDIF.
              ls_fia-art_key = ls_gdata-art_key.
              CLEAR ls_fia-matnr.
              APPEND ls_fia TO lt_fia.
            ENDLOOP.
          ENDIF.

          READ TABLE lt_list_bis TRANSPORTING NO FIELDS
            WITH KEY art_key = lv_artkey.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_list_bis INTO ls_list FROM sy-tabix.
              IF ls_list-art_key <> lv_artkey.
                EXIT.
              ENDIF.
              ls_list-art_key = ls_gdata-art_key.
              CLEAR ls_list-matnr.
              APPEND ls_list TO lt_list.
            ENDLOOP.
          ENDIF.

          READ TABLE lt_srlist_bis TRANSPORTING NO FIELDS
            WITH KEY art_key = lv_artkey.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_srlist_bis INTO ls_srlist FROM sy-tabix.
              IF ls_srlist-art_key <> lv_artkey.
                EXIT.
              ENDIF.
              ls_srlist-art_key = ls_gdata-art_key.
              CLEAR ls_srlist-matnr.
              APPEND ls_srlist TO lt_srlist.
            ENDLOOP.
          ENDIF.

          READ TABLE lt_sale_bis TRANSPORTING NO FIELDS
            WITH KEY art_key = lv_artkey.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_sale_bis INTO ls_sale FROM sy-tabix.
              IF ls_sale-art_key <> lv_artkey.
                EXIT.
              ENDIF.
              ls_sale-art_key = ls_gdata-art_key.
              CLEAR ls_sale-matnr.
              APPEND ls_sale TO lt_sale.
            ENDLOOP.
          ENDIF.

          READ TABLE lt_logdc_bis TRANSPORTING NO FIELDS
            WITH KEY art_key = lv_artkey.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_logdc_bis INTO ls_logdc FROM sy-tabix.
              IF ls_logdc-art_key <> lv_artkey.
                EXIT.
              ENDIF.
              ls_logdc-art_key = ls_gdata-art_key.
              CLEAR ls_logdc-matnr.
              APPEND ls_logdc TO lt_logdc.
            ENDLOOP.
          ENDIF.

          READ TABLE lt_logsto_bis TRANSPORTING NO FIELDS
            WITH KEY art_key = lv_artkey.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_logsto_bis INTO ls_logsto FROM sy-tabix.
              IF ls_logsto-art_key <> lv_artkey.
                EXIT.
              ENDIF.
              ls_logsto-art_key = ls_gdata-art_key.
              CLEAR ls_logsto-matnr.
              APPEND ls_logsto TO lt_logsto.
            ENDLOOP.
          ENDIF.

          INSERT ls_gdata INTO lt_gdata INDEX lv_tabix.
        ENDLOOP.
        SORT lt_gdata.
      ENDIF.

      ct_gdata  = lt_gdata.
      ct_unit   = lt_unit.
      ct_caract = lt_caract.
      ct_sale   = lt_sale.
      ct_logdc  = lt_logdc.
      ct_logsto = lt_logsto.

      IF iv_flag_excel IS INITIAL.
*     Alimentation des table de réserve de travail
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
          EXPORTING
            iv_bu            = me->gv_bu
            it_gdata         = lt_gdata
            it_unit          = lt_unit
            it_caract        = lt_caract
            it_sale          = lt_sale
            it_logdc         = lt_logdc
            it_logsto        = lt_logsto
            iv_change_reqids = 'X'
          CHANGING
            cv_rc            = cv_rc
            ct_msg           = ct_msg
            cv_reqid         = ev_id.
      ELSE.
* pour le gabarit Excel, on reprend la réserve de travail
* on préalimente le code article avec la logique à respecter ($1, $2, $3,...)
        CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
          EXPORTING
            iv_bu     = me->gv_bu
          RECEIVING
            rv_object = lv_object.
        IF lv_object IS NOT INITIAL.
          CALL METHOD lv_object->alim_data_for_excel
            CHANGING
              cv_rc     = cv_rc
              ct_msg    = ct_msg
              ct_unit   = ct_unit
              ct_caract = ct_caract
              ct_bom    = ct_bom
              ct_fia    = ct_fia
              ct_list   = ct_list
              ct_srlist = ct_srlist
              ct_sale   = ct_sale
              ct_logdc  = ct_logdc
              ct_logsto = ct_logsto
              ct_gdata  = ct_gdata.
          CALL METHOD lv_object->manage_before_creation
            EXPORTING
              iv_bu     = me->gv_bu
            CHANGING
              ct_gdata  = ct_gdata
              ct_unit   = ct_unit
              ct_caract = ct_caract
              ct_bom    = ct_bom
              ct_fia    = ct_fia
              ct_list   = ct_list
              ct_srlist = ct_srlist
              ct_sale   = ct_sale
              ct_logdc  = ct_logdc
              ct_logsto = ct_logsto
              ct_msg    = ct_msg
              cv_rc     = cv_rc.

        ENDIF.

      ENDIF.
    ELSE. "cas de création Excel
      CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
        EXPORTING
          iv_bu     = me->gv_bu
        RECEIVING
          rv_object = lv_object.
      IF lv_object IS NOT INITIAL.
        CALL METHOD lv_object->manage_data_from_excel
          CHANGING
            cv_rc     = cv_rc
            ct_msg    = ct_msg
            ct_unit   = ct_unit
            ct_caract = ct_caract
            ct_bom    = ct_bom
            ct_fia    = ct_fia
            ct_list   = ct_list
            ct_srlist = ct_srlist
            ct_sale   = ct_sale
            ct_logdc  = ct_logdc
            ct_logsto = ct_logsto
            ct_gdata  = ct_gdata.

        CALL METHOD lv_object->alim_data_save
          CHANGING
            ct_gdata  = ct_gdata
            ct_unit   = ct_unit
            ct_caract = ct_caract
            ct_bom    = ct_bom
            ct_fia    = ct_fia
            ct_list   = ct_list
            ct_srlist = ct_srlist
            ct_sale   = ct_sale
            ct_logdc  = ct_logdc
            ct_logsto = ct_logsto.

      ENDIF.
      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
        EXPORTING
          iv_status = gc_statusnew
        CHANGING
          ct_unit   = ct_unit
          ct_caract = ct_caract
          ct_bom    = ct_bom
          ct_fia    = ct_fia
          ct_list   = ct_list
          ct_srlist = ct_srlist
          ct_sale   = ct_sale
          ct_logdc  = ct_logdc
          ct_logsto = ct_logsto
          ct_gdata  = ct_gdata
          cv_rc     = cv_rc.

*     On alimente les tables en sortie en cas de création externe
      CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
        EXPORTING
          iv_bu            = me->gv_bu
          it_gdata         = ct_gdata
          it_unit          = ct_unit
          it_caract        = ct_caract
          it_bom           = ct_bom
          it_fia           = ct_fia
          it_list          = ct_list
          it_srlist        = ct_srlist
          it_sale          = ct_sale
          it_logdc         = ct_logdc
          it_logsto        = ct_logsto
          iv_change_reqids = 'X'
        CHANGING
          cv_rc            = cv_rc
          ct_msg           = ct_msg
          cv_reqid         = ev_id.

    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~delete_line.

    TYPES : BEGIN OF ty_cond,
              cond(72) TYPE c,
            END OF ty_cond.

    DATA : lv_cond    TYPE ty_cond,
           lt_cond    TYPE TABLE OF ty_cond,
           lv_tabname TYPE tabname,
           lv_lineid  TYPE /dlwupex/elineid,
           lv_reqid   TYPE /dlwupex/ereqid,
           lt_unit    TYPE /dlwupex/tunit_tt,
           lt_caract  TYPE /dlwupex/tcaract_tt,
           lt_bom     TYPE /dlwupex/tbom_tt,
           lt_fia     TYPE /dlwupex/tfia_tt,
           lt_list    TYPE /dlwupex/tlist_tt,
           lt_srlist  TYPE /dlwupex/tsrlist_tt,
           lt_sale    TYPE /dlwupex/tsale_tt,
           lt_logdc   TYPE /dlwupex/tlogdc_tt,
           lt_logsto  TYPE /dlwupex/tlogsto_tt,
           lt_msg     TYPE /dlwupex/tmsg_tt.


    CLEAR lv_lineid.
* Tables pour récupération des données articles
    CASE iv_viewname.
      WHEN gc_gdataview. "Données Générales
        cv_rc = 4.
      WHEN gc_unitview. "Données Unités et EAN
        lv_tabname = '/dlwupex/tunit'.
      WHEN gc_caractview. "Caractéristiques
        lv_tabname = '/dlwupex/tcaract'.
      WHEN gc_bomview. "BOM
        lv_tabname = '/dlwupex/tbom'.
      WHEN gc_fiaview. "FIA
        lv_tabname = '/dlwupex/tfia'.
      WHEN gc_listview. "Source lists
        lv_tabname = '/dlwupex/tlist'.
      WHEN gc_srlistview. "Référencement listing
        lv_tabname = '/dlwupex/tsrlist'.
      WHEN gc_saleview. "Données Ventes
        lv_tabname = '/dlwupex/tsale'.
      WHEN gc_logdcview. "Log Site ref DC
        lv_tabname = '/dlwupex/tlogdc'.
      WHEN gc_logstoview. "Log Site ref Store
        lv_tabname = '/dlwupex/tlogsto'.
      WHEN OTHERS.
    ENDCASE.

    CHECK cv_rc IS INITIAL.


    MOVE 'id = me->gv_bu AND reqid = iv_reqid AND '  TO lv_cond.
    APPEND lv_cond TO lt_cond.
    MOVE 'art_key = iv_matnr AND line = iv_lineid' TO lv_cond.
    APPEND lv_cond TO lt_cond.

    DELETE FROM (lv_tabname)
     WHERE (lt_cond).

    CALL METHOD me->delete_msg_for_deleted_line
      EXPORTING
        iv_id       = me->gv_bu
        iv_reqid    = iv_reqid
        iv_matnr    = iv_matnr
        iv_line     = iv_lineid
        iv_viewname = iv_viewname
      CHANGING
        cv_rc       = cv_rc.

    CASE iv_viewname.
      WHEN gc_gdataview. "Données Générales
        cv_rc = 4.
      WHEN gc_unitview. "Données Unités et EAN
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_unit  = lt_unit
            cv_rc    = cv_rc.
      WHEN gc_caractview. "Caractéristiques
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu     = me->gv_bu
            iv_reqid  = iv_reqid
          CHANGING
            ct_caract = lt_caract
            cv_rc     = cv_rc.
      WHEN gc_bomview. "BOM
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_bom   = lt_bom
            cv_rc    = cv_rc.
      WHEN gc_fiaview. "FIA
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_fia   = lt_fia
            cv_rc    = cv_rc.
      WHEN gc_listview. "Source lists
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_list  = lt_list
            cv_rc    = cv_rc.
      WHEN gc_srlistview. "Référencement listing
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu     = me->gv_bu
            iv_reqid  = iv_reqid
          CHANGING
            ct_srlist = lt_srlist
            cv_rc     = cv_rc.
      WHEN gc_saleview. "Données Ventes
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_sale  = lt_sale
            cv_rc    = cv_rc.
      WHEN gc_logdcview. "Log Site ref DC
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_logdc = lt_logdc
            cv_rc    = cv_rc.
      WHEN gc_logstoview. "Log Site ref Store
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu     = me->gv_bu
            iv_reqid  = iv_reqid
          CHANGING
            ct_logsto = lt_logsto
            cv_rc     = cv_rc.
      WHEN OTHERS.
    ENDCASE.


    CALL METHOD /dlwupex/cl_core_check=>get_instance
      EXPORTING
        iv_id     = me->gv_bu
        iv_reqid  = iv_reqid
      RECEIVING
        rv_object = DATA(lv_object).

    IF lv_object IS NOT INITIAL.
      REFRESH lt_msg.
      CALL METHOD lv_object->/dlwupex/if_check~check_duplicate_line_db
        EXPORTING
          iv_id       = me->gv_bu
          iv_reqid    = iv_reqid
          iv_viewname = iv_viewname
        CHANGING
          ct_msg      = lt_msg.
*         cv_rc       =
*          ct_table    = lt_tview.
    ENDIF.

    CALL METHOD me->insert_msg_in_worklist
      EXPORTING
        it_msg = lt_msg
      CHANGING
        cv_rc  = cv_rc.

    lv_reqid = iv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu            = me->gv_bu
        iv_change_reqids = 'X'
        it_unit          = lt_unit
        it_caract        = lt_caract
        it_bom           = lt_bom
        it_fia           = lt_fia
        it_list          = lt_list
        it_srlist        = lt_srlist
        it_sale          = lt_sale
        it_logdc         = lt_logdc
        it_logsto        = lt_logsto
      CHANGING
        cv_rc            = cv_rc
        ct_msg           = ct_msg
        cv_reqid         = lv_reqid.
  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~delete_many_lines.
*
    TYPES : BEGIN OF ty_cond,
              cond(72) TYPE c,
            END OF ty_cond.

    DATA : lv_cond    TYPE ty_cond,
           lt_cond    TYPE TABLE OF ty_cond,
           lv_tabname TYPE tabname,
           lv_lineid  TYPE /dlwupex/elineid,
           lv_reqid   TYPE /dlwupex/ereqid,
           lt_unit    TYPE /dlwupex/tunit_tt,
           lt_caract  TYPE /dlwupex/tcaract_tt,
           lt_bom     TYPE /dlwupex/tbom_tt,
           lt_fia     TYPE /dlwupex/tfia_tt,
           lt_list    TYPE /dlwupex/tlist_tt,
           lt_srlist  TYPE /dlwupex/tsrlist_tt,
           lt_sale    TYPE /dlwupex/tsale_tt,
           lt_logdc   TYPE /dlwupex/tlogdc_tt,
           lt_logsto  TYPE /dlwupex/tlogsto_tt,
           lt_msg     TYPE /dlwupex/tmsg_tt.

    CHECK it_lines IS NOT INITIAL.

    CLEAR lv_lineid.
* Tables pour récupération des données articles
    CASE iv_viewname.
      WHEN gc_gdataview. "Données Générales
        cv_rc = 4.
      WHEN gc_unitview. "Données Unités et EAN
        lv_tabname = '/dlwupex/tunit'.
      WHEN gc_caractview. "Caractéristiques
        lv_tabname = '/dlwupex/tcaract'.
      WHEN gc_bomview. "BOM
        lv_tabname = '/dlwupex/tbom'.
      WHEN gc_fiaview. "FIA
        lv_tabname = '/dlwupex/tfia'.
      WHEN gc_listview. "Source lists
        lv_tabname = '/dlwupex/tlist'.
      WHEN gc_srlistview. "Référencement listing
        lv_tabname = '/dlwupex/tsrlist'.
      WHEN gc_saleview. "Données Ventes
        lv_tabname = '/dlwupex/tsale'.
      WHEN gc_logdcview. "Log Site ref DC
        lv_tabname = '/dlwupex/tlogdc'.
      WHEN gc_logstoview. "Log Site ref Store
        lv_tabname = '/dlwupex/tlogsto'.
      WHEN OTHERS.
    ENDCASE.

    CHECK cv_rc IS INITIAL.

    MOVE 'id = me->gv_bu AND reqid = iv_reqid '  TO lv_cond.
    APPEND lv_cond TO lt_cond.

    LOOP AT it_lines ASSIGNING FIELD-SYMBOL(<fs_lines>).
      IF sy-tabix = 1.
        CONCATENATE ' AND ( ( art_key = ' <fs_lines>-matnr
                    ' AND line = ' <fs_lines>-lineid ' ) '
                    INTO lv_cond.
      ELSE.
        CONCATENATE  ' OR ( art_key = ' <fs_lines>-matnr
                     ' AND line =  ' <fs_lines>-lineid ' ) '
                     INTO lv_cond.
      ENDIF.
      APPEND lv_cond TO lt_cond.

    ENDLOOP.
    MOVE ' ) ' TO lv_cond.

    APPEND lv_cond TO lt_cond.

    DELETE FROM (lv_tabname)
     WHERE (lt_cond).


***
    CALL METHOD me->delete_msg_for_many_lines
      EXPORTING
        iv_id       = me->gv_bu
        iv_reqid    = iv_reqid
        it_lines    = it_lines
        iv_viewname = iv_viewname
      CHANGING
        cv_rc       = cv_rc.

    CASE iv_viewname.
      WHEN gc_gdataview. "Données Générales
        cv_rc = 4.
      WHEN gc_unitview. "Données Unités et EAN
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_unit  = lt_unit
            cv_rc    = cv_rc.
      WHEN gc_caractview. "Caractéristiques
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu     = me->gv_bu
            iv_reqid  = iv_reqid
          CHANGING
            ct_caract = lt_caract
            cv_rc     = cv_rc.
      WHEN gc_bomview. "BOM
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_bom   = lt_bom
            cv_rc    = cv_rc.
      WHEN gc_fiaview. "FIA
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_fia   = lt_fia
            cv_rc    = cv_rc.
      WHEN gc_listview. "Source lists
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_list  = lt_list
            cv_rc    = cv_rc.
      WHEN gc_srlistview. "Référencement listing
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu     = me->gv_bu
            iv_reqid  = iv_reqid
          CHANGING
            ct_srlist = lt_srlist
            cv_rc     = cv_rc.
      WHEN gc_saleview. "Données Ventes
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_sale  = lt_sale
            cv_rc    = cv_rc.
      WHEN gc_logdcview. "Log Site ref DC
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu    = me->gv_bu
            iv_reqid = iv_reqid
          CHANGING
            ct_logdc = lt_logdc
            cv_rc    = cv_rc.
      WHEN gc_logstoview. "Log Site ref Store
        CALL METHOD /dlwupex/cl_cockpit_article=>get_data
          EXPORTING
            iv_bu     = me->gv_bu
            iv_reqid  = iv_reqid
          CHANGING
            ct_logsto = lt_logsto
            cv_rc     = cv_rc.
      WHEN OTHERS.
    ENDCASE.


    CALL METHOD /dlwupex/cl_core_check=>get_instance
      EXPORTING
        iv_id     = me->gv_bu
        iv_reqid  = iv_reqid
      RECEIVING
        rv_object = DATA(lv_object).

    IF lv_object IS NOT INITIAL.
      REFRESH lt_msg.
      CALL METHOD lv_object->/dlwupex/if_check~check_duplicate_line_db
        EXPORTING
          iv_id       = me->gv_bu
          iv_reqid    = iv_reqid
          iv_viewname = iv_viewname
        CHANGING
          ct_msg      = lt_msg.
*         cv_rc       =
*          ct_table    = lt_tview.
    ENDIF.

    CALL METHOD me->insert_msg_in_worklist
      EXPORTING
        it_msg = lt_msg
      CHANGING
        cv_rc  = cv_rc.

    lv_reqid = iv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu            = me->gv_bu
        iv_change_reqids = 'X'
        it_unit          = lt_unit
        it_caract        = lt_caract
        it_bom           = lt_bom
        it_fia           = lt_fia
        it_list          = lt_list
        it_srlist        = lt_srlist
        it_sale          = lt_sale
        it_logdc         = lt_logdc
        it_logsto        = lt_logsto
      CHANGING
        cv_rc            = cv_rc
        ct_msg           = ct_msg
        cv_reqid         = lv_reqid.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~delete_material.

    DATA : ls_msg     TYPE /dlwupex/tmsg,
           lt_gdata  TYPE /dlwupex/tgdata_tt,
           lt_unit   TYPE /dlwupex/tunit_tt,
           lt_caract TYPE /dlwupex/tcaract_tt,
           lt_bom    TYPE /dlwupex/tbom_tt,
           lt_fia    TYPE /dlwupex/tfia_tt,
           lt_list   TYPE /dlwupex/tlist_tt,
           lt_srlist TYPE /dlwupex/tsrlist_tt,
           lt_sale   TYPE /dlwupex/tsale_tt,
           lt_logdc  TYPE /dlwupex/tlogdc_tt,
           lt_logsto TYPE /dlwupex/tlogsto_tt,
           lt_reqids  TYPE /dlwupex/treqids_tt.

    IF ir_matnr IS INITIAL.
      ls_msg-type = 'E'.
      ls_msg-idmsg = gc_classmsg.
      ls_msg-num = '030'.
      ls_msg-message_v1 = 'IR_MATNR'.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
      EXIT.
    ENDIF.
* delete data input parameters
    TRY .
        DELETE FROM /dlwupex/tgdata
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TGDATA'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tunit
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TUNIT'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tcaract
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TCARACT'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tbom
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TBOM'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tfia
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TFIA'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tlist
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TLIST'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tsrlist
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TSRLIST'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tsale
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TSALE'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tlogdc
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TLOGDC'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tlogsto
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                art_key IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TLOGSTO'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    TRY .
        DELETE FROM /dlwupex/tmsg_ch
          WHERE id = me->gv_bu AND
                reqid = iv_reqid AND
                matnr IN ir_matnr.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TMSG_CH'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
    ENDTRY.

    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = me->gv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_unit   = lt_unit
        ct_caract = lt_caract
        ct_bom    = lt_bom
        ct_fia    = lt_fia
        ct_list   = lt_list
        ct_srlist = lt_srlist
        ct_sale   = lt_sale
        ct_logdc  = lt_logdc
        ct_logsto = lt_logsto
        ct_gdata  = lt_gdata
        cv_rc     = cv_rc
        ct_reqids = lt_reqids.

    READ TABLE lt_reqids ASSIGNING FIELD-SYMBOL(<fs_reqids>) INDEX 1.


    IF lt_gdata IS INITIAL.
      CLEAR <fs_reqids>-statdg.
    ENDIF.

    IF lt_unit IS INITIAL.
      CLEAR <fs_reqids>-statunit.
    ENDIF.

    IF lt_caract IS INITIAL.
      CLEAR <fs_reqids>-statcara.
    ENDIF.

    IF lt_bom IS INITIAL.
      CLEAR <fs_reqids>-statbom.
    ENDIF.

    IF lt_fia IS INITIAL.
      CLEAR <fs_reqids>-statfia.
    ENDIF.

    IF lt_list IS INITIAL.
      CLEAR <fs_reqids>-statlist.
    ENDIF.

    IF lt_srlist IS INITIAL.
      CLEAR <fs_reqids>-statsrlist.
    ENDIF.

    IF lt_logdc IS INITIAL.
      CLEAR <fs_reqids>-statdc.
    ENDIF.

    IF lt_logsto IS INITIAL.
      CLEAR <fs_reqids>-statstore.
    ENDIF.

    CALL METHOD /dlwupex/cl_cockpit_article=>fill_reqids
      EXPORTING
        it_reqids = lt_reqids
      CHANGING
        ct_msg    = ct_msg
        cv_rc     = cv_rc.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~delete_worklist.

    DATA : ls_msg   TYPE /dlwupex/tmsg,
           lt_gdata TYPE /dlwupex/tgdata_tt,
           lv_qname TYPE trfcqnam.

    IF ir_view IS INITIAL.
      TRY .
          DELETE FROM /dlwupex/treqids
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TREQIDS'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.

      CALL METHOD /dlwupex/cl_cockpit_article=>get_data
        EXPORTING
          iv_bu    = me->gv_bu
          iv_reqid = iv_reqid
        CHANGING
          ct_gdata = lt_gdata
          cv_rc    = cv_rc.

      READ TABLE me->gt_tcusto ASSIGNING FIELD-SYMBOL(<fs_custo>)
               WITH KEY name = 'QUEUE_PREFIXE'
               BINARY SEARCH.
      IF <fs_custo> IS NOT ASSIGNED.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '023'.
        ls_msg-message_v1 = '/DLWUPEX/TCUSTO'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
        EXIT.
      ENDIF.
      DATA(lv_reqid_short) = iv_reqid.
      SHIFT lv_reqid_short LEFT DELETING LEADING '0'.
      LOOP AT lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
        CONCATENATE <fs_custo>-value 'RT' lv_reqid_short '/' <fs_gdata>-art_key INTO lv_qname.

        CALL FUNCTION 'TRFC_QIN_DELETE_QUEUE'
          EXPORTING
            qname = lv_qname.

      ENDLOOP.

    ENDIF.

    IF gc_gdataview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tgdata
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TGDATA'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.


    IF gc_unitview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tunit
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TUNIT'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.


    IF gc_caractview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tcaract
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TCARACT'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.


    IF gc_bomview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tbom
           WHERE id = me->gv_bu AND
                 reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TBOM'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.

    IF gc_fiaview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tfia
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TFIA'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.


    IF gc_listview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tlist
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TLIST'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.


    IF gc_srlistview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tsrlist
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TSRLIST'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.


    IF gc_saleview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tsale
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TSALE'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.


    IF gc_logdcview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tlogdc
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TLOGDC'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.


    IF gc_logstoview IN ir_view.
      TRY .
          DELETE FROM /dlwupex/tlogsto
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TLOGSTO'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.

    IF ir_view IS INITIAL.
      TRY .
          DELETE FROM /dlwupex/tmsg_ch
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TMSG_CH'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
      TRY .
          DELETE FROM /dlwupex/tmsg
            WHERE id = me->gv_bu AND
                  reqid = iv_reqid.
        CATCH cx_root.
          ls_msg-type = 'E'.
          ls_msg-idmsg = gc_classmsg.
          ls_msg-num = '033'.
          ls_msg-message_v1 = '/DLWUPEX/TMSG'.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
      ENDTRY.
    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~execute_step.

    DATA: lv_qname       TYPE trfcqnam,
          lt_gdata       TYPE /dlwupex/tgdata_tt,
          lt_unit        TYPE /dlwupex/tunit_tt,
          lt_caract      TYPE /dlwupex/tcaract_tt,
          lt_bom         TYPE /dlwupex/tbom_tt,
          lt_fia         TYPE /dlwupex/tfia_tt,
          lt_list        TYPE /dlwupex/tlist_tt,
          lt_srlist      TYPE /dlwupex/tsrlist_tt,
          lt_sale        TYPE /dlwupex/tsale_tt,
          lt_logdc       TYPE /dlwupex/tlogdc_tt,
          lt_logsto      TYPE /dlwupex/tlogsto_tt,
          lt_reqids      TYPE /dlwupex/treqids_tt,
          lv_qname_exist TYPE trfcqnam,
          lt_queue       TYPE /sapapo/cif_trfcqview_tt,
          lv_state       TYPE qrfcstate.

    DATA ls_msg        TYPE /dlwupex/tmsg.

    CONSTANTS lc_stateerror TYPE qrfcstate VALUE 'SYSFAIL'.

    READ TABLE me->gt_tcusto ASSIGNING FIELD-SYMBOL(<fs_custo>)
         WITH KEY name = 'QUEUE_PREFIXE'
         BINARY SEARCH.
    IF <fs_custo> IS NOT ASSIGNED.
      ls_msg-type = 'E'.
      ls_msg-idmsg = gc_classmsg.
      ls_msg-num = '023'.
      ls_msg-message_v1 = '/DLWUPEX/TCUSTO'.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
      EXIT.
    ENDIF.

    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = me->gv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_unit   = lt_unit
        ct_caract = lt_caract
        ct_bom    = lt_bom
        ct_fia    = lt_fia
        ct_list   = lt_list
        ct_srlist = lt_srlist
        ct_sale   = lt_sale
        ct_logdc  = lt_logdc
        ct_logsto = lt_logsto
        ct_gdata  = lt_gdata
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = gc_statusincreation
      CHANGING
        ct_unit   = lt_unit
        ct_caract = lt_caract
        ct_bom    = lt_bom
        ct_fia    = lt_fia
        ct_list   = lt_list
        ct_srlist = lt_srlist
        ct_sale   = lt_sale
        ct_logdc  = lt_logdc
        ct_logsto = lt_logsto
        ct_gdata  = lt_gdata
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

    DATA(lv_reqid) = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu     = me->gv_bu
        it_gdata  = lt_gdata
        it_unit   = lt_unit
        it_caract = lt_caract
        it_bom    = lt_bom
        it_fia    = lt_fia
        it_list   = lt_list
        it_srlist = lt_srlist
        it_sale   = lt_sale
        it_logdc  = lt_logdc
        it_logsto = lt_logsto
        iv_lockdb = 'X'
      CHANGING
        ct_msg    = ct_msg
        cv_rc     = cv_rc
        cv_reqid  = lv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = gc_statuscompleted
      CHANGING
        ct_unit   = lt_unit
        ct_caract = lt_caract
        ct_bom    = lt_bom
        ct_fia    = lt_fia
        ct_list   = lt_list
        ct_srlist = lt_srlist
        ct_sale   = lt_sale
        ct_logdc  = lt_logdc
        ct_logsto = lt_logsto
        ct_gdata  = lt_gdata
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.


    CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
      EXPORTING
        it_reqids        = lt_reqids
        iv_change_reqids = 'X'
      CHANGING
        ct_msg           = ct_msg
        cv_rc            = cv_rc.

    DATA(lv_reqid_short) = iv_reqid.
    SHIFT lv_reqid_short LEFT DELETING LEADING '0'.

    SORT lt_gdata BY attyp.
    LOOP AT lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
      CONCATENATE <fs_custo>-value 'RT' lv_reqid_short '/' <fs_gdata>-art_key INTO lv_qname.

      CALL FUNCTION 'TRFC_QIN_STATE'
        EXPORTING
          qname             = lv_qname
        IMPORTING
          qstate            = lv_state
        EXCEPTIONS
          invalid_parameter = 1
          OTHERS            = 2.
      IF sy-subrc = 0 AND lv_state = lc_stateerror.
        CALL FUNCTION 'TRFC_QIN_RESTART'
          EXPORTING
            qname                = lv_qname
          EXCEPTIONS
            invalid_parameter    = 1
            system_failed        = 2
            communication_failed = 3
            OTHERS               = 4.
        IF sy-subrc <> 0.
* Implement suitable error handling here
        ENDIF.
      ELSE.
        CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
          EXPORTING
            qin_name           = lv_qname
          EXCEPTIONS
            invalid_queue_name = 1
            OTHERS             = 2.
        IF sy-subrc EQ 0.
          CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_CREAT_ART'
            IN BACKGROUND TASK
            AS SEPARATE UNIT
            EXPORTING
              iv_bu    = me->gv_bu
              iv_reqid = iv_reqid
              iv_matnr = <fs_gdata>-art_key.
*          COMMIT WORK.
        ENDIF.
      ENDIF.
    ENDLOOP.
    COMMIT WORK.


    CONCATENATE <fs_custo>-value 'LIST_' 'RT' lv_reqid_short  INTO lv_qname.

    CONCATENATE <fs_custo>-value 'RT' lv_reqid_short '*' INTO lv_qname_exist.

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
      CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_ART_LIST'
        IN BACKGROUND TASK
        AS SEPARATE UNIT
        EXPORTING
          iv_bu    = me->gv_bu
          iv_reqid = iv_reqid.
      COMMIT WORK.
    ENDIF.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~get_errors.


    DATA: lv_qname   TYPE trfcqnam,
          lv_message TYPE t100-text,
          ls_msg     TYPE /dlwupex/tmsg.

    SELECT * FROM /dlwupex/tmsg INTO TABLE ct_msg
      WHERE id = me->gv_bu AND
            reqid = iv_reqid.
    IF sy-subrc IS NOT INITIAL.
      cv_rc = 4.
    ENDIF.

    READ TABLE me->gt_tcusto ASSIGNING FIELD-SYMBOL(<fs_custo>)
            WITH KEY name = 'QUEUE_PREFIXE'
            BINARY SEARCH.
    IF <fs_custo> IS NOT ASSIGNED.
      ls_msg-type = 'E'.
      ls_msg-idmsg = gc_classmsg.
      ls_msg-num = '023'.
      ls_msg-message_v1 = '/DLWUPEX/TCUSTO'.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
      EXIT.
    ENDIF.

    DATA(lv_reqid_short) = iv_reqid.
    SHIFT lv_reqid_short LEFT DELETING LEADING '0'.

    LOOP AT ct_msg ASSIGNING FIELD-SYMBOL(<fs_msg>).
      IF <fs_msg>-idmsg = '/DLWUPEX/COCKPIT_ART' AND <fs_msg>-num = '049'.

        CONCATENATE <fs_custo>-value 'RT' lv_reqid_short '/' <fs_msg>-matnr INTO lv_qname.
        CALL FUNCTION 'TRFC_QIN_STATE'
          EXPORTING
            qname             = lv_qname
          IMPORTING
            errmess           = lv_message
          EXCEPTIONS
            invalid_parameter = 1
            OTHERS            = 2.
        <fs_msg>-message = lv_message.
      ENDIF.
    ENDLOOP.


  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~get_msg_check.

    DATA :
      lt_gdata  TYPE /dlwupex/tgdata_tt,
      lt_unit   TYPE /dlwupex/tunit_tt,
      lt_caract TYPE /dlwupex/tcaract_tt,
      lt_bom    TYPE /dlwupex/tbom_tt,
      lt_fia    TYPE /dlwupex/tfia_tt,
      lt_list   TYPE /dlwupex/tlist_tt,
      lt_srlist TYPE /dlwupex/tsrlist_tt,
      lt_sale   TYPE /dlwupex/tsale_tt,
      lt_logdc  TYPE /dlwupex/tlogdc_tt,
      lt_logsto TYPE /dlwupex/tlogsto_tt,
      lt_msg    TYPE /dlwupex/tmsg_tt,
      ls_msg    TYPE /dlwupex/tmsg,
      lv_reqid  TYPE /dlwupex/ereqid
      .


    lv_reqid = iv_reqid.
*    FIELD-SYMBOLS : <lt_itab>   TYPE table.
    IF iv_viewname IS NOT INITIAL.
      SELECT * FROM /dlwupex/tmsg_ch INTO TABLE ct_msg
            WHERE
             id = iv_id AND
             reqid = iv_reqid AND
             viewname = iv_viewname.
    ELSE.
      SELECT * FROM /dlwupex/tmsg_ch INTO TABLE ct_msg
        WHERE
         id = iv_id AND
         reqid = iv_reqid.
    ENDIF.

*    CHECK ct_msg IS NOT INITIAL.

    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_id
        iv_reqid  = iv_reqid
      CHANGING
        ct_gdata  = lt_gdata
        ct_unit   = lt_unit
        ct_caract = lt_caract
        ct_bom    = lt_bom
        ct_fia    = lt_fia
        ct_list   = lt_list
        ct_srlist = lt_srlist
        ct_sale   = lt_sale
        ct_logdc  = lt_logdc
        ct_logsto = lt_logsto
        cv_rc     = cv_rc.

    IF iv_nochange IS INITIAL.
      LOOP AT ct_msg ASSIGNING FIELD-SYMBOL(<fs_msg>).
        CHECK <fs_msg>-line IS INITIAL.
        CASE iv_viewname.
          WHEN gc_gdataview.
            <fs_msg>-line = 0001.
          WHEN gc_unitview.
            LOOP AT lt_unit ASSIGNING FIELD-SYMBOL(<fs_unit>).
              CHECK <fs_unit>-art_key = <fs_msg>-matnr.
              ls_msg = <fs_msg>.
              ls_msg-line = <fs_unit>-line.
              APPEND ls_msg TO lt_msg.
            ENDLOOP.
          WHEN gc_fiaview.
            LOOP AT lt_fia ASSIGNING FIELD-SYMBOL(<fs_fia>).
              CHECK <fs_fia>-art_key = <fs_msg>-matnr.
              ls_msg = <fs_msg>.
              ls_msg-line = <fs_fia>-line.
              APPEND ls_msg TO lt_msg.
            ENDLOOP.
          WHEN gc_caractview.
            LOOP AT lt_caract ASSIGNING FIELD-SYMBOL(<fs_caract>).
              CHECK <fs_caract>-art_key = <fs_msg>-matnr.
              ls_msg = <fs_msg>.
              ls_msg-line = <fs_caract>-line.
              APPEND ls_msg TO lt_msg.
            ENDLOOP.
          WHEN gc_bomview.
            LOOP AT lt_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).
              CHECK <fs_bom>-art_key = <fs_msg>-matnr.
              ls_msg = <fs_msg>.
              ls_msg-line = <fs_bom>-line.
              APPEND ls_msg TO lt_msg.
            ENDLOOP.
          WHEN gc_listview.
            LOOP AT lt_list ASSIGNING FIELD-SYMBOL(<fs_list>).
              CHECK <fs_list>-art_key = <fs_msg>-matnr.
              ls_msg = <fs_msg>.
              ls_msg-line = <fs_list>-line.
              APPEND ls_msg TO lt_msg.
            ENDLOOP.
          WHEN gc_srlistview.
            LOOP AT lt_srlist ASSIGNING FIELD-SYMBOL(<fs_srlist>).
              CHECK <fs_srlist>-art_key = <fs_msg>-matnr.
              ls_msg = <fs_msg>.
              ls_msg-line = <fs_srlist>-line.
              APPEND ls_msg TO lt_msg.
            ENDLOOP.
          WHEN gc_saleview.
            LOOP AT lt_sale ASSIGNING FIELD-SYMBOL(<fs_sale>).
              CHECK <fs_sale>-art_key = <fs_msg>-matnr.
              ls_msg = <fs_msg>.
              ls_msg-line = <fs_sale>-line.
              APPEND ls_msg TO lt_msg.
            ENDLOOP.
          WHEN gc_logdcview.
            LOOP AT lt_logdc ASSIGNING FIELD-SYMBOL(<fs_logdc>).
              CHECK <fs_logdc>-art_key = <fs_msg>-matnr.
              ls_msg = <fs_msg>.
              ls_msg-line = <fs_logdc>-line.
              APPEND ls_msg TO lt_msg.
            ENDLOOP.
          WHEN gc_logstoview.
            LOOP AT lt_logsto ASSIGNING FIELD-SYMBOL(<fs_logsto>).
              CHECK <fs_logsto>-art_key = <fs_msg>-matnr.
              ls_msg = <fs_msg>.
              ls_msg-line = <fs_logsto>-line.
              APPEND ls_msg TO lt_msg.
            ENDLOOP.
        ENDCASE.

      ENDLOOP.
    ENDIF.

    APPEND LINES OF lt_msg TO ct_msg.
*    cv_rc = sy-subrc.


  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~insert_line.



    DATA : t_params      TYPE abap_parmbind_tab,
           t_params2     TYPE abap_parmbind_tab,
           l_param       TYPE abap_parmbind,
           lt_msg        TYPE /dlwupex/tmsg_tt,
           ls_msg        TYPE /dlwupex/tmsg,
           lv_reqid      TYPE /dlwupex/ereqid,
           lt_gdata	     TYPE /dlwupex/tgdata_tt,
           lt_unit       TYPE /dlwupex/tunit_tt,
           lt_caract     TYPE /dlwupex/tcaract_tt,
           lt_bom        TYPE /dlwupex/tbom_tt,
           lt_fia        TYPE /dlwupex/tfia_tt,
           lt_list       TYPE /dlwupex/tlist_tt,
           lt_srlist     TYPE /dlwupex/tsrlist_tt,
           lt_sale       TYPE /dlwupex/tsale_tt,
           lt_logdc      TYPE /dlwupex/tlogdc_tt,
           lt_logsto     TYPE /dlwupex/tlogsto_tt,
           lt_gdata_cpy	 TYPE /dlwupex/tgdata_tt,
           lt_unit_cpy   TYPE /dlwupex/tunit_tt,
           lt_caract_cpy TYPE /dlwupex/tcaract_tt,
           lt_bom_cpy    TYPE /dlwupex/tbom_tt,
           lt_fia_cpy    TYPE /dlwupex/tfia_tt,
           lt_list_cpy   TYPE /dlwupex/tlist_tt,
           lt_srlist_cpy TYPE /dlwupex/tsrlist_tt,
           lt_sale_cpy   TYPE /dlwupex/tsale_tt,
           lt_logdc_cpy  TYPE /dlwupex/tlogdc_tt,
           lt_logsto_cpy TYPE /dlwupex/tlogsto_tt,
           lrt_matnr     TYPE RANGE OF matnr,
           lrs_matnr     LIKE LINE OF lrt_matnr,
           lv_lineid     TYPE /dlwupex/elineid,
           lv_nb_line    TYPE i.


    DATA: new_line TYPE REF TO data.

    FIELD-SYMBOLS : <lt_itab>   TYPE table,
                    <lt_itab2>  TYPE table,
                    <fs_itab>   TYPE any,
                    <fs_itab2>  TYPE any,
                    <fs_field>  TYPE any,
                    <fs_field2> TYPE any.

*  INITIALIZATION
    CLEAR : lv_nb_line.

* contrôle et alimentation données d'entrées

    IF iv_matnr IS INITIAL AND
           ir_matnr IS INITIAL.
      ls_msg-type = 'E'.
      ls_msg-idmsg = gc_classmsg.
      ls_msg-num = '045'.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
      EXIT.
    ELSEIF iv_matnr IS NOT INITIAL AND
             ir_matnr IS NOT INITIAL.
      ls_msg-type = 'E'.
      ls_msg-idmsg = gc_classmsg.
      ls_msg-num = '045'.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
      EXIT.
    ENDIF.

    lrs_matnr-sign = 'I'.
    lrs_matnr-option = 'EQ'.
    IF iv_matnr IS NOT INITIAL.
      lrs_matnr-low = iv_matnr.
      APPEND lrs_matnr TO lrt_matnr.
    ELSE.
      LOOP AT ir_matnr INTO DATA(ls_matnr).
        lrs_matnr-low = ls_matnr-low.
        APPEND lrs_matnr TO lrt_matnr.
      ENDLOOP.
    ENDIF.

    lv_reqid = iv_reqid.

*** Alimentation des paramètres pour appel de méthode de récupération de données articles
    REFRESH t_params.
    l_param-name = 'IV_BU'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF me->gv_bu INTO l_param-value.
    INSERT l_param INTO TABLE t_params.
    INSERT l_param INTO TABLE t_params2.

    CLEAR l_param.
    l_param-name = 'IV_REQID'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_reqid INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'CV_RC'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF cv_rc INTO l_param-value.
    INSERT l_param INTO TABLE t_params.
    INSERT l_param INTO TABLE t_params2.

    CLEAR l_param.
    l_param-name = 'CT_MSG'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF ct_msg INTO l_param-value.
    INSERT l_param INTO TABLE t_params2.

    CLEAR l_param.
    l_param-name = 'CV_REQID'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lv_reqid INTO l_param-value.
    INSERT l_param INTO TABLE t_params2.

    CLEAR l_param.
    l_param-name = 'IV_CHANGE_REQIDS'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF abap_true INTO l_param-value.
    INSERT l_param INTO TABLE t_params2.

* Tables pour récupération des données articles
    CASE iv_viewname.
      WHEN gc_gdataview. "Données Générales
        CLEAR l_param.
        l_param-name = 'CT_GDATA'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_gdata INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_GDATA'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_gdata_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_gdata TO <lt_itab>.
        ASSIGN lt_gdata_cpy TO <lt_itab2>.
      WHEN gc_unitview. "Données Unités et EAN
        CLEAR l_param.
        l_param-name = 'CT_UNIT'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_unit INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_UNIT'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_unit_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_unit TO <lt_itab>.
        ASSIGN lt_unit_cpy TO <lt_itab2>.
      WHEN gc_caractview. "Caractéristiques
        CLEAR l_param.
        l_param-name = 'CT_CARACT'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_caract INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_CARACT'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_caract_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_caract TO <lt_itab>.
        ASSIGN lt_caract_cpy TO <lt_itab2>.
      WHEN gc_bomview. "BOM
        CLEAR l_param.
        l_param-name = 'CT_BOM'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_bom INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_BOM'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_bom_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_bom TO <lt_itab>.
        ASSIGN lt_bom_cpy TO <lt_itab2>.
      WHEN gc_fiaview. "FIA
        CLEAR l_param.
        l_param-name = 'CT_FIA'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_fia INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_FIA'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_fia_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_fia TO <lt_itab>.
        ASSIGN lt_fia_cpy TO <lt_itab2>.
      WHEN gc_listview. "Source lists
        CLEAR l_param.
        l_param-name = 'CT_LIST'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_list INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_LIST'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_list_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_list TO <lt_itab>.
        ASSIGN lt_list_cpy TO <lt_itab2>.
      WHEN gc_srlistview. "Référencement listing
        CLEAR l_param.
        l_param-name = 'CT_SRLIST'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_srlist INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_SRLIST'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_srlist_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_srlist TO <lt_itab>.
        ASSIGN lt_srlist_cpy TO <lt_itab2>.
      WHEN gc_saleview. "Données Ventes
        CLEAR l_param.
        l_param-name = 'CT_SALE'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_sale INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_SALE'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_sale_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_sale TO <lt_itab>.
        ASSIGN lt_sale_cpy TO <lt_itab2>.
      WHEN gc_logdcview. "Log Site ref DC
        CLEAR l_param.
        l_param-name = 'CT_LOGDC'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_logdc INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_LOGDC'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_logdc_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_logdc TO <lt_itab>.
        ASSIGN lt_logdc_cpy TO <lt_itab2>.
      WHEN gc_logstoview. "Log Site ref Store
        CLEAR l_param.
        l_param-name = 'CT_LOGSTO'.
        l_param-kind = cl_abap_objectdescr=>changing.
        GET REFERENCE OF lt_logsto INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
        CLEAR l_param.
        l_param-name = 'IT_LOGSTO'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lt_logsto_cpy INTO l_param-value.
        INSERT l_param INTO TABLE t_params2.
        ASSIGN lt_logsto TO <lt_itab>.
        ASSIGN lt_logsto_cpy TO <lt_itab2>.
      WHEN OTHERS.
    ENDCASE.

    LOOP AT lrt_matnr INTO lrs_matnr.

      CLEAR lv_lineid.
      READ TABLE t_params ASSIGNING FIELD-SYMBOL(<fs_params>)
        WITH KEY name = 'IV_ART_KEY'.
      IF sy-subrc IS INITIAL.
        GET REFERENCE OF lrs_matnr-low INTO <fs_params>-value.
      ELSE.
        CLEAR l_param.
        l_param-name = 'IV_ART_KEY'.
        l_param-kind = cl_abap_objectdescr=>exporting.
        GET REFERENCE OF lrs_matnr-low INTO l_param-value.
        INSERT l_param INTO TABLE t_params.
      ENDIF.

      CALL METHOD ('/DLWUPEX/CL_COCKPIT_ARTICLE')=>read_data_from_matnr
        PARAMETER-TABLE
        t_params.

      CHECK <lt_itab> IS ASSIGNED.

      SORT <lt_itab> BY ('LINE') DESCENDING.

      READ TABLE <lt_itab> ASSIGNING <fs_itab> INDEX 1.
      IF  sy-subrc IS INITIAL AND <fs_itab> IS ASSIGNED.
        ASSIGN COMPONENT 'LINE' OF STRUCTURE <fs_itab> TO <fs_field>.
        lv_lineid = <fs_field>.
      ENDIF.

      SORT <lt_itab> BY ('LINE').

      CREATE DATA new_line LIKE LINE OF <lt_itab>.
      ASSIGN new_line->* TO <fs_itab2>.
      CHECK <fs_itab2> IS ASSIGNED.

      UNASSIGN : <fs_field>,<fs_field2>.
      ASSIGN COMPONENT 'ID' OF STRUCTURE <fs_itab2> TO <fs_field2>.
      IF <fs_itab> IS ASSIGNED.
        ASSIGN COMPONENT 'ID' OF STRUCTURE <fs_itab> TO <fs_field>.
      ENDIF.
      IF  <fs_field> IS ASSIGNED AND iv_matnr IS NOT INITIAL.
        <fs_field2> = <fs_field>.
      ELSE.
        <fs_field2> = me->gv_bu.
      ENDIF.
      ls_msg-id = <fs_field2>.
      ls_msg-viewname = iv_viewname.
      ls_msg-type = 'E'.
      ls_msg-idmsg = gc_classmsg.
      ls_msg-field = 'ART_KEY'.
      ls_msg-num = '060'.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message.

      UNASSIGN : <fs_field>,<fs_field2>.
      ASSIGN COMPONENT 'REQID' OF STRUCTURE <fs_itab2> TO <fs_field2>.
      IF <fs_itab> IS ASSIGNED.
        ASSIGN COMPONENT 'REQID' OF STRUCTURE <fs_itab> TO <fs_field>.
      ENDIF.
      IF  <fs_field> IS ASSIGNED AND iv_matnr IS NOT INITIAL.
        <fs_field2> = <fs_field>.
      ELSE.
        <fs_field2> = iv_reqid.
      ENDIF.
      ls_msg-reqid = <fs_field2>.

      UNASSIGN : <fs_field>,<fs_field2>.
      ASSIGN COMPONENT 'ART_KEY' OF STRUCTURE <fs_itab2> TO <fs_field2>.
      IF <fs_itab> IS ASSIGNED.
        ASSIGN COMPONENT 'ART_KEY' OF STRUCTURE <fs_itab> TO <fs_field>.
      ENDIF.
      IF  <fs_field> IS ASSIGNED AND iv_matnr IS NOT INITIAL.
        <fs_field2> = <fs_field>.
      ELSE.
        <fs_field2> = lrs_matnr-low.
      ENDIF.
      ls_msg-matnr = <fs_field2>.


      CLEAR lv_nb_line.
      DO iv_nbcopy TIMES.
        IF lv_nb_line IS INITIAL.
          lv_nb_line = lv_lineid + 1.
        ELSE.
          lv_nb_line = lv_nb_line  + 1.
        ENDIF.
        UNASSIGN : <fs_field2>.
        ASSIGN COMPONENT 'STATUS' OF STRUCTURE <fs_itab2> TO <fs_field2>.
        <fs_field2> = gc_statusnew.
        UNASSIGN : <fs_field2>.
        ASSIGN COMPONENT 'LINE' OF STRUCTURE <fs_itab2> TO <fs_field2>.
        IF <fs_field2> IS ASSIGNED.
*         On initialise la première ligne à 1 puis on incrémente les autres
          <fs_field2> = lv_nb_line.
        ENDIF.
        ls_msg-line = <fs_field2>.

        INSERT <fs_itab2> INTO TABLE <lt_itab2>.
        APPEND ls_msg TO lt_msg.
      ENDDO.
    ENDLOOP.

* Alimentation default value
    CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
      EXPORTING
        iv_bu     = me->gv_bu
      RECEIVING
        rv_object = data(lv_object).
    IF lv_object IS NOT INITIAL.
      CALL METHOD lv_object->/dlwupex/if_cockpit_article~manage_before_creation
        EXPORTING
          iv_bu          = me->gv_bu
          iv_reqid       = iv_reqid
          iv_flag_insert = abap_true
        CHANGING
          ct_gdata       = lt_gdata_cpy
          ct_unit        = lt_unit_cpy
          ct_caract      = lt_caract_cpy
          ct_bom         = lt_bom_cpy
          ct_fia         = lt_fia_cpy
          ct_list        = lt_list_cpy
          ct_srlist      = lt_srlist_cpy
          ct_sale        = lt_sale_cpy
          ct_logdc       = lt_logdc_cpy
          ct_logsto      = lt_logsto_cpy
          ct_msg         = ct_msg
          cv_rc          = cv_rc.
    ENDIF.

    CALL METHOD /dlwupex/cl_core_check=>get_instance
      EXPORTING
        iv_id     = me->gv_bu
        iv_reqid  = iv_reqid
      RECEIVING
        rv_object = data(lv_object_ch).
    IF lv_object_ch IS NOT INITIAL.
      CALL METHOD lv_object_ch->/dlwupex/if_check~check_duplicate_line_db
        EXPORTING
          iv_id       = me->gv_bu
          iv_reqid    = iv_reqid
          iv_viewname = iv_viewname
        CHANGING
          ct_msg      = lt_msg.
    ENDIF.

    CALL METHOD me->insert_msg_in_worklist
      EXPORTING
        it_msg = lt_msg
      CHANGING
        cv_rc  = cv_rc.

    COMMIT WORK AND WAIT.

    CALL METHOD ('/DLWUPEX/CL_COCKPIT_ARTICLE')=>fill_worklist
      PARAMETER-TABLE
      t_params2.

    COMMIT WORK AND WAIT.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~manage_before_creation.

    DATA : lt_tfields TYPE /dlwupex/tfields_tt,
           ls_buhead  TYPE /dlwupex/tbuhead,
           lt_gdata   TYPE /dlwupex/tgdata_tt,
           lv_line    TYPE /dlwupex/elineid,
           lv_art_key TYPE /dlwupex/ematkey.

    FIELD-SYMBOLS : <fs_field>  TYPE any,
                    <fs_field1> TYPE any.

*** FILL DEFAULT VALUES
    lt_tfields = me->gt_tfields.

    DELETE lt_tfields WHERE default_val IS INITIAL.

    CHECK lt_tfields IS NOT INITIAL.

    LOOP AT lt_tfields ASSIGNING FIELD-SYMBOL(<fs_tfields>).

      UNASSIGN : <fs_field>, <fs_field1>.
      ASSIGN COMPONENT 'DEFAULT_VAL' OF STRUCTURE <fs_tfields> TO <fs_field>.
      CHECK <fs_field> IS ASSIGNED.

      CASE <fs_tfields>-viewname.
        WHEN gc_gdataview. "Données Générales
          LOOP AT ct_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_gdata> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN gc_unitview. "Données Unités et EAN
          LOOP AT ct_unit ASSIGNING FIELD-SYMBOL(<fs_unit>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_unit> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN gc_caractview. "Caractéristiques
          LOOP AT ct_caract ASSIGNING FIELD-SYMBOL(<fs_caract>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_caract> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN gc_bomview. "BOM
          LOOP AT ct_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_bom> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN gc_fiaview. "FIA
          LOOP AT ct_fia ASSIGNING FIELD-SYMBOL(<fs_fia>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_fia> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN gc_listview. "Source lists
          LOOP AT ct_list ASSIGNING FIELD-SYMBOL(<fs_list>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_list> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN gc_srlistview. "Référencement listing
          LOOP AT ct_srlist ASSIGNING FIELD-SYMBOL(<fs_srlist>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_srlist> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN gc_saleview. "Données Ventes
          LOOP AT ct_sale ASSIGNING FIELD-SYMBOL(<fs_sale>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_sale> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN gc_logdcview. "Log Site ref DC
          LOOP AT ct_logdc ASSIGNING FIELD-SYMBOL(<fs_logdc>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_logdc> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN gc_logstoview. "Log Site ref Store
          LOOP AT ct_logsto ASSIGNING FIELD-SYMBOL(<fs_logsto>).
            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_logsto> TO <fs_field1>.
            CHECK <fs_field1> IS ASSIGNED.
            <fs_field1> = <fs_field>.
          ENDLOOP.
        WHEN OTHERS.
      ENDCASE.
    ENDLOOP.

    READ TABLE me->gt_tbuhead INTO ls_buhead
      WITH KEY id = iv_bu
      BINARY SEARCH.

    LOOP AT ct_gdata ASSIGNING <fs_gdata>.
      IF <fs_gdata>-spras IS INITIAL.
        <fs_gdata>-spras = ls_buhead-land1.
      ENDIF.
    ENDLOOP.

* init line id
    IF iv_flag_insert IS INITIAL.

      LOOP AT ct_unit ASSIGNING <fs_unit>.
        IF lv_art_key IS INITIAL OR lv_art_key <> <fs_unit>-art_key.
          CLEAR lv_line.
          lv_line = lv_line + 1.
          <fs_unit>-line = lv_line.
        ELSE.
          lv_line = lv_line + 1.
          <fs_unit>-line = lv_line.
        ENDIF.
        lv_art_key = <fs_unit>-art_key.
        ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_unit> TO <fs_field1>.
        CHECK <fs_field1> IS ASSIGNED.
        <fs_field1> = <fs_field>.

      ENDLOOP.
      LOOP AT ct_caract ASSIGNING <fs_caract>.
        IF lv_art_key IS INITIAL OR lv_art_key <> <fs_caract>-art_key.
          CLEAR lv_line.
          lv_line = lv_line + 1.
          <fs_caract>-line = lv_line.
        ELSE.
          lv_line = lv_line + 1.
          <fs_caract>-line = lv_line.
        ENDIF.
        lv_art_key = <fs_caract>-art_key.
        ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_caract> TO <fs_field1>.
        CHECK <fs_field1> IS ASSIGNED.
        <fs_field1> = <fs_field>.

      ENDLOOP.
      LOOP AT ct_bom ASSIGNING <fs_bom>.
        IF lv_art_key IS INITIAL OR lv_art_key <> <fs_bom>-art_key.
          CLEAR lv_line.
          lv_line = lv_line + 1.
          <fs_bom>-line = lv_line.
        ELSE.
          lv_line = lv_line + 1.
          <fs_bom>-line = lv_line.
        ENDIF.
        lv_art_key = <fs_bom>-art_key.
        ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_bom> TO <fs_field1>.
        CHECK <fs_field1> IS ASSIGNED.
        <fs_field1> = <fs_field>.
      ENDLOOP.
      LOOP AT ct_fia ASSIGNING <fs_fia>.
        IF lv_art_key IS INITIAL OR lv_art_key <> <fs_fia>-art_key.
          CLEAR lv_line.
          lv_line = lv_line + 1.
          <fs_fia>-line = lv_line.
        ELSE.
          lv_line = lv_line + 1.
          <fs_fia>-line = lv_line.
        ENDIF.
        lv_art_key = <fs_fia>-art_key.
        ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_fia> TO <fs_field1>.
        CHECK <fs_field1> IS ASSIGNED.
        <fs_field1> = <fs_field>.
      ENDLOOP.
      LOOP AT ct_list ASSIGNING <fs_list>.
        IF lv_art_key IS INITIAL OR lv_art_key <> <fs_list>-art_key.
          CLEAR lv_line.
          lv_line = lv_line + 1.
          <fs_list>-line = lv_line.
        ELSE.
          lv_line = lv_line + 1.
          <fs_list>-line = lv_line.
        ENDIF.
        lv_art_key = <fs_list>-art_key.
        ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_list> TO <fs_field1>.
        CHECK <fs_field1> IS ASSIGNED.
        <fs_field1> = <fs_field>.
      ENDLOOP.
      LOOP AT ct_srlist ASSIGNING <fs_srlist>.
        IF lv_art_key IS INITIAL OR lv_art_key <> <fs_srlist>-art_key.
          CLEAR lv_line.
          lv_line = lv_line + 1.
          <fs_srlist>-line = lv_line.
        ELSE.
          lv_line = lv_line + 1.
          <fs_srlist>-line = lv_line.
        ENDIF.
        lv_art_key = <fs_caract>-art_key.
        ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_srlist> TO <fs_field1>.
        CHECK <fs_field1> IS ASSIGNED.
        <fs_field1> = <fs_field>.
      ENDLOOP.
      LOOP AT ct_sale ASSIGNING <fs_sale>.
        IF lv_art_key IS INITIAL OR lv_art_key <> <fs_sale>-art_key.
          CLEAR lv_line.
          lv_line = lv_line + 1.
          <fs_sale>-line = lv_line.
        ELSE.
          lv_line = lv_line + 1.
          <fs_sale>-line = lv_line.
        ENDIF.
        lv_art_key = <fs_sale>-art_key.
        ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_sale> TO <fs_field1>.
        CHECK <fs_field1> IS ASSIGNED.
        <fs_field1> = <fs_field>.
      ENDLOOP.
      LOOP AT ct_logdc ASSIGNING <fs_logdc>.
        IF lv_art_key IS INITIAL OR lv_art_key <> <fs_logdc>-art_key.
          CLEAR lv_line.
          lv_line = lv_line + 1.
          <fs_logdc>-line = lv_line.
        ELSE.
          lv_line = lv_line + 1.
          <fs_logdc>-line = lv_line.
        ENDIF.
        lv_art_key = <fs_logdc>-art_key.
        ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_logdc> TO <fs_field1>.
        CHECK <fs_field1> IS ASSIGNED.
        <fs_field1> = <fs_field>.
      ENDLOOP.
      LOOP AT ct_logsto ASSIGNING <fs_logsto>.
        IF lv_art_key IS INITIAL OR lv_art_key <> <fs_logsto>-art_key.
          CLEAR lv_line.
          lv_line = lv_line + 1.
          <fs_logsto>-line = lv_line.
        ELSE.
          lv_line = lv_line + 1.
          <fs_logsto>-line = lv_line.
        ENDIF.
        lv_art_key = <fs_logsto>-art_key.
        ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_logsto> TO <fs_field1>.
        CHECK <fs_field1> IS ASSIGNED.
        <fs_field1> = <fs_field>.
      ENDLOOP.
    ENDIF.

    IF iv_reqid IS NOT INITIAL.

      CALL METHOD /dlwupex/cl_cockpit_article=>get_data
        EXPORTING
          iv_bu    = iv_bu
          iv_reqid = iv_reqid
        CHANGING
          ct_gdata = lt_gdata
          cv_rc    = cv_rc.
    ELSE.
      lt_gdata = ct_gdata.
    ENDIF.

** Alim default unit


    LOOP AT ct_sale ASSIGNING <fs_sale>.
      READ TABLE lt_gdata INTO DATA(ls_gdata)
        WITH KEY art_key = <fs_sale>-art_key.
      CHECK sy-subrc IS INITIAL.
      UNASSIGN : <fs_field1>, <fs_field>.
      ASSIGN COMPONENT 'KMEIN' OF STRUCTURE <fs_sale> TO <fs_field1>.
      IF <fs_field1> IS ASSIGNED.
        ASSIGN COMPONENT 'BMSTE' OF STRUCTURE ls_gdata TO <fs_field>.
        IF <fs_field> IS NOT ASSIGNED.
          ASSIGN COMPONENT 'MEINS' OF STRUCTURE ls_gdata TO <fs_field>.
        ENDIF.
        <fs_field1> = <fs_field>.
      ENDIF.
      UNASSIGN : <fs_field1>, <fs_field>.
      ASSIGN COMPONENT 'WVRKM' OF STRUCTURE <fs_sale> TO <fs_field1>.
      IF <fs_field1> IS ASSIGNED.
        ASSIGN COMPONENT 'BMSTE' OF STRUCTURE ls_gdata TO <fs_field>.
        IF <fs_field> IS NOT ASSIGNED.
          ASSIGN COMPONENT 'MEINS' OF STRUCTURE ls_gdata TO <fs_field>.
        ENDIF.
        <fs_field1> = <fs_field>.
      ENDIF.
    ENDLOOP.

** Alim default unit
    LOOP AT ct_fia ASSIGNING <fs_fia>.
      READ TABLE lt_gdata INTO ls_gdata
        WITH KEY art_key = <fs_fia>-art_key.
      CHECK sy-subrc IS INITIAL.
      UNASSIGN : <fs_field1>, <fs_field>.
      ASSIGN COMPONENT 'KMEIN' OF STRUCTURE <fs_fia> TO <fs_field1>.
      IF <fs_field1> IS ASSIGNED.
        ASSIGN COMPONENT 'BMSTE' OF STRUCTURE ls_gdata TO <fs_field>.
        IF <fs_field> IS NOT ASSIGNED.
          ASSIGN COMPONENT 'MEINS' OF STRUCTURE ls_gdata TO <fs_field>.
        ENDIF.
        <fs_field1> = <fs_field>.
      ENDIF.
      UNASSIGN : <fs_field1>, <fs_field>.
      ASSIGN COMPONENT 'MEINS' OF STRUCTURE <fs_fia> TO <fs_field1>.
      IF <fs_field1> IS ASSIGNED.
        ASSIGN COMPONENT 'BMSTE' OF STRUCTURE ls_gdata TO <fs_field>.
        IF <fs_field> IS NOT ASSIGNED.
          ASSIGN COMPONENT 'MEINS' OF STRUCTURE ls_gdata TO <fs_field>.
        ENDIF.
        <fs_field1> = <fs_field>.
      ENDIF.
    ENDLOOP.


** Clear EAN data
    LOOP AT ct_unit ASSIGNING <fs_unit>.
      ASSIGN COMPONENT 'EAN11' OF STRUCTURE <fs_unit> TO <fs_field>.
      IF <fs_field> IS ASSIGNED.
        CLEAR <fs_field>.
      ENDIF.
      UNASSIGN : <fs_field>.
      ASSIGN COMPONENT 'EANTP' OF STRUCTURE <fs_unit> TO <fs_field>.
      IF <fs_field> IS ASSIGNED.
        CLEAR <fs_field>.
      ENDIF.
      UNASSIGN : <fs_field>.
      ASSIGN COMPONENT 'HPEAN' OF STRUCTURE <fs_unit> TO <fs_field>.
      IF <fs_field> IS ASSIGNED.
        CLEAR <fs_field>.
      ENDIF.
      UNASSIGN : <fs_field>.
    ENDLOOP.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~manage_data_from_excel.

    DATA : lv_matnr         TYPE matnr,
           lv_artkey        TYPE /dlwupex/ematkey,
           lv_id_matnr      TYPE i,
           lv_id_matnr_high TYPE i,
           lv_line          TYPE /dlwupex/elineid,
           lv_num_artkey    TYPE numc2,
           lt_unit          TYPE /dlwupex/tunit_tt,
           lt_caract        TYPE /dlwupex/tcaract_tt,
           lt_bom           TYPE /dlwupex/tbom_tt,
           lt_fia           TYPE /dlwupex/tfia_tt,
           lt_list          TYPE /dlwupex/tlist_tt,
           lt_srlist        TYPE /dlwupex/tsrlist_tt,
           lt_sale          TYPE /dlwupex/tsale_tt,
           lt_logdc         TYPE /dlwupex/tlogdc_tt,
           lt_logsto        TYPE /dlwupex/tlogsto_tt,
           lt_gdata         TYPE /dlwupex/tgdata_tt.

    SORT : ct_gdata BY matnr,
           ct_unit BY matnr,
           ct_caract BY matnr,
           ct_bom BY matnr,
           ct_fia BY matnr,
           ct_list BY matnr,
           ct_srlist BY matnr,
           ct_sale BY matnr,
           ct_logdc BY matnr,
           ct_logsto BY matnr.

    LOOP AT ct_gdata INTO DATA(ls_gdata).
      CHECK ls_gdata-matnr+0(1) = '$'.
      lv_id_matnr = ls_gdata-matnr+1(39).
      IF lv_id_matnr < 10.
        lv_num_artkey = lv_id_matnr.
        lv_artkey = gc_art_prefixe && lv_num_artkey.
        ls_gdata-num_line = lv_num_artkey.
        IF lv_id_matnr > lv_id_matnr_high.
          lv_id_matnr_high = lv_id_matnr.
        ENDIF.
      ELSE.
        lv_artkey = gc_art_prefixe && lv_id_matnr.
        ls_gdata-num_line = lv_id_matnr.
        IF lv_id_matnr > lv_id_matnr_high.
          lv_id_matnr_high = lv_id_matnr.
        ENDIF.
      ENDIF.

      ls_gdata-art_key = lv_artkey.

      READ TABLE ct_unit TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_unit INTO DATA(ls_unit) FROM sy-tabix.
          IF ls_unit-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_unit-line = lv_line.
          ls_unit-art_key = lv_artkey.
          CLEAR ls_unit-matnr.
          APPEND ls_unit TO lt_unit.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_caract TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_caract INTO DATA(ls_caract) FROM sy-tabix.
          IF ls_caract-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_caract-line = lv_line.
          ls_caract-art_key = lv_artkey.
          CLEAR ls_caract-matnr.
          APPEND ls_caract TO lt_caract.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_bom TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_bom INTO DATA(ls_bom) FROM sy-tabix.
          IF ls_bom-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_bom-line = lv_line.
          ls_bom-art_key = lv_artkey.
          CLEAR ls_bom-matnr.
          APPEND ls_bom TO lt_bom.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_fia TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_fia INTO DATA(ls_fia) FROM sy-tabix.
          IF ls_fia-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_fia-line = lv_line.
          ls_fia-art_key = lv_artkey.
          CLEAR ls_fia-matnr.
          APPEND ls_fia TO lt_fia.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_list TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_list INTO DATA(ls_list) FROM sy-tabix.
          IF ls_list-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_list-line = lv_line.
          ls_list-art_key = lv_artkey.
          CLEAR ls_list-matnr.
          APPEND ls_list TO lt_list.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_srlist TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_srlist INTO DATA(ls_srlist) FROM sy-tabix.
          IF ls_srlist-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_srlist-line = lv_line.
          ls_srlist-art_key = lv_artkey.
          CLEAR ls_srlist-matnr.
          APPEND ls_srlist TO lt_srlist.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_sale TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_sale INTO DATA(ls_sale) FROM sy-tabix.
          IF ls_sale-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_sale-line = lv_line.
          ls_sale-art_key = lv_artkey.
          CLEAR ls_sale-matnr.
          APPEND ls_sale TO lt_sale.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_logdc TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_logdc INTO DATA(ls_logdc) FROM sy-tabix.
          IF ls_logdc-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_logdc-line = lv_line.
          ls_logdc-art_key = lv_artkey.
          CLEAR ls_logdc-matnr.
          APPEND ls_logdc TO lt_logdc.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_logsto TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_logsto INTO DATA(ls_logsto) FROM sy-tabix.
          IF ls_logsto-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_logsto-line = lv_line.
          ls_logsto-art_key = lv_artkey.
          CLEAR ls_logsto-matnr.
          APPEND ls_logsto TO lt_logsto.
        ENDLOOP.
      ENDIF.

      CLEAR ls_gdata-matnr.
      APPEND ls_gdata TO lt_gdata.
    ENDLOOP.

    lv_id_matnr = lv_id_matnr_high.
    LOOP AT ct_gdata INTO ls_gdata.
      CHECK ls_gdata-matnr+0(1) <> '$'.
      me->get_next_matnr( CHANGING cv_matnr = lv_id_matnr ).
      IF lv_id_matnr < 10.
        lv_num_artkey = lv_id_matnr.
        lv_artkey = gc_art_prefixe && lv_num_artkey.
        ls_gdata-num_line = lv_num_artkey.
      ELSE.
        lv_artkey = gc_art_prefixe && lv_id_matnr.
        ls_gdata-num_line = lv_id_matnr.
      ENDIF.

      ls_gdata-art_key = lv_artkey.

      READ TABLE ct_unit TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_unit INTO ls_unit FROM sy-tabix.
          IF ls_unit-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_unit-line = lv_line.
          ls_unit-art_key = lv_artkey.
          CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
            EXPORTING
              input  = ls_unit-matnr
            IMPORTING
              output = ls_unit-matnr.
          APPEND ls_unit TO lt_unit.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_caract TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_caract INTO ls_caract FROM sy-tabix.
          IF ls_caract-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_caract-line = lv_line.
          ls_caract-art_key = lv_artkey.
          CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
            EXPORTING
              input  = ls_caract-matnr
            IMPORTING
              output = ls_caract-matnr.
          APPEND ls_caract TO lt_caract.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_bom TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_bom INTO ls_bom FROM sy-tabix.
          IF ls_bom-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_bom-line = lv_line.
          ls_bom-art_key = lv_artkey.
          CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
            EXPORTING
              input  = ls_bom-matnr
            IMPORTING
              output = ls_bom-matnr.
          APPEND ls_bom TO lt_bom.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_fia TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_fia INTO ls_fia FROM sy-tabix.
          IF ls_fia-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_fia-line = lv_line.
          ls_fia-art_key = lv_artkey.
          CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
            EXPORTING
              input  = ls_fia-matnr
            IMPORTING
              output = ls_fia-matnr.
          APPEND ls_fia TO lt_fia.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_list TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_list INTO ls_list FROM sy-tabix.
          IF ls_list-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_list-line = lv_line.
          ls_list-art_key = lv_artkey.
          CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
            EXPORTING
              input  = ls_list-matnr
            IMPORTING
              output = ls_list-matnr.
          APPEND ls_list TO lt_list.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_srlist TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_srlist INTO ls_srlist FROM sy-tabix.
          IF ls_srlist-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_srlist-line = lv_line.
          ls_srlist-art_key = lv_artkey.
          CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
            EXPORTING
              input  = ls_srlist-matnr
            IMPORTING
              output = ls_srlist-matnr.
          APPEND ls_srlist TO lt_srlist.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_sale TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_sale INTO ls_sale FROM sy-tabix.
          IF ls_sale-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_sale-line = lv_line.
          ls_sale-art_key = lv_artkey.
          CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
            EXPORTING
              input  = ls_sale-matnr
            IMPORTING
              output = ls_sale-matnr.
          APPEND ls_sale TO lt_sale.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_logdc TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_logdc INTO ls_logdc FROM sy-tabix.
          IF ls_logdc-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_logdc-line = lv_line.
          ls_logdc-art_key = lv_artkey.
          CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
            EXPORTING
              input  = ls_logdc-matnr
            IMPORTING
              output = ls_logdc-matnr.
          APPEND ls_logdc TO lt_logdc.
        ENDLOOP.
      ENDIF.

      READ TABLE ct_logsto TRANSPORTING NO FIELDS
        WITH KEY matnr = ls_gdata-matnr
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        CLEAR lv_line.
        LOOP AT ct_logsto INTO ls_logsto FROM sy-tabix.
          IF ls_logsto-matnr <> ls_gdata-matnr.
            EXIT.
          ENDIF.
          lv_line = lv_line + 1.
          ls_logsto-line = lv_line.
          ls_logsto-art_key = lv_artkey.
          CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
            EXPORTING
              input  = ls_logsto-matnr
            IMPORTING
              output = ls_logsto-matnr.
          APPEND ls_logsto TO lt_logsto.
        ENDLOOP.
      ENDIF.

      CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
        EXPORTING
          input  = ls_gdata-matnr
        IMPORTING
          output = ls_gdata-matnr.
      APPEND ls_gdata TO lt_gdata.
    ENDLOOP.

    SORT lt_gdata BY matnr.

    LOOP AT lt_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).
      CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
        EXPORTING
          input  = <fs_bom>-idnrk
        IMPORTING
          output = <fs_bom>-idnrk
*       EXCEPTIONS
*         LENGTH_ERROR       = 1
*         OTHERS = 2
        .
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.


      READ TABLE lt_gdata INTO ls_gdata
        WITH KEY matnr = <fs_bom>-idnrk
        BINARY SEARCH.
      CHECK sy-subrc IS INITIAL.
      <fs_bom>-idnrk = ls_gdata-art_key.
    ENDLOOP.

    SORT lt_gdata.

    ct_unit = lt_unit.
    ct_caract = lt_caract.
    ct_bom = lt_bom.
    ct_fia = lt_fia.
    ct_list = lt_list.
    ct_srlist = lt_srlist.
    ct_sale = lt_sale.
    ct_logdc = lt_logdc.
    ct_logsto = lt_logsto.
    ct_gdata = lt_gdata.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~msg_check_type.

    DATA : ls_msg TYPE /dlwupex/tmsg,
           lt_msg TYPE /dlwupex/tmsg_tt,
           lv_rc TYPE sysubrc.

    ls_msg-matnr      = iv_art.
    ls_msg-id         = me->gv_bu.
    ls_msg-reqid      = iv_reqid.
    ls_msg-viewname   = iv_viewname.
    ls_msg-field      = iv_fieldname.
    ls_msg-line       = iv_line.
    ls_msg-type       = 'E'.
    ls_msg-idmsg      = gc_classmsg.
    ls_msg-num        = '068'.
    ls_msg-message_v1 = iv_value.
    MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
      INTO ls_msg-message
    WITH ls_msg-message_v1.
    APPEND ls_msg TO lt_msg.

    CALL METHOD me->insert_msg_in_worklist
      EXPORTING
        it_msg = lt_msg
      CHANGING
        cv_rc  = lv_rc.

    COMMIT WORK AND WAIT.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~msg_check_type_delete.

    DELETE FROM /dlwupex/tmsg_ch WHERE
             id = me->gv_bu AND
             reqid = iv_reqid AND
             matnr = iv_art AND
             viewname = iv_viewname AND
             field = iv_fieldname AND
             idmsg = gc_classmsg AND
             num = '068'.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~msg_check_type_get.

    SELECT * FROM /dlwupex/tmsg_ch INTO TABLE et_msg
      WHERE id = me->gv_bu AND
            reqid = iv_reqid AND
            viewname = iv_viewname AND
            idmsg = gc_classmsg AND
            num = '068'.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~save_worklist.

    DATA : lt_unit   TYPE /dlwupex/tunit_tt,
           lt_caract TYPE /dlwupex/tcaract_tt,
           lt_bom    TYPE /dlwupex/tbom_tt,
           lt_fia    TYPE /dlwupex/tfia_tt,
           lt_list   TYPE /dlwupex/tlist_tt,
           lt_srlist TYPE /dlwupex/tsrlist_tt,
           lt_sale   TYPE /dlwupex/tsale_tt,
           lt_logdc  TYPE /dlwupex/tlogdc_tt,
           lt_logsto TYPE /dlwupex/tlogsto_tt,
           lt_gdata  TYPE /dlwupex/tgdata_tt,
           lt_msg    TYPE /dlwupex/tmsg_tt,
           ls_msg    TYPE /dlwupex/tmsg,
           lr_view   TYPE piq_selopt_t,
           lv_reqid  TYPE /dlwupex/ereqid.

    DATA : lv_object     TYPE REF TO /dlwupex/if_cockpit_article.

    lt_unit   = it_unit.
    lt_caract = it_caract.
    lt_bom    = it_bom.
    lt_fia    = it_fia.
    lt_list   = it_list.
    lt_srlist = it_srlist.
    lt_sale   = it_sale.
    lt_logdc  = it_logdc.
    lt_logsto = it_logsto.
    lt_gdata  = it_gdata.

*** set status in progress
    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = gc_statusinprogress
      CHANGING
        ct_unit   = lt_unit
        ct_caract = lt_caract
        ct_bom    = lt_bom
        ct_fia    = lt_fia
        ct_list   = lt_list
        ct_srlist = lt_srlist
        ct_sale   = lt_sale
        ct_logdc  = lt_logdc
        ct_logsto = lt_logsto
        ct_gdata  = lt_gdata
        cv_rc     = cv_rc.

    lv_reqid = iv_reqid.

*     On appelle la méthode pour déterminer le volume
    CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
      EXPORTING
        iv_bu     = me->gv_bu
      RECEIVING
        rv_object = lv_object.
    IF lv_object IS NOT INITIAL.
      CALL METHOD lv_object->alim_data_save
        CHANGING
          ct_gdata  = lt_gdata
          ct_unit   = lt_unit
          ct_caract = lt_caract
          ct_bom    = lt_bom
          ct_fia    = lt_fia
          ct_list   = lt_list
          ct_srlist = lt_srlist
          ct_sale   = lt_sale
          ct_logdc  = lt_logdc
          ct_logsto = lt_logsto.
    ENDIF.

    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu            = me->gv_bu
        it_gdata         = lt_gdata
        it_unit          = lt_unit
        it_caract        = lt_caract
        it_bom           = lt_bom
        it_fia           = lt_fia
        it_list          = lt_list
        it_srlist        = lt_srlist
        it_sale          = lt_sale
        it_logdc         = lt_logdc
        it_logsto        = lt_logsto
        iv_change_reqids = abap_true
        iv_lockdb        = abap_true
      CHANGING
        ct_msg           = ct_msg
        cv_rc            = cv_rc
        cv_reqid         = lv_reqid.

  ENDMETHOD.


  METHOD /dlwupex/if_cockpit_article~validated_worklist.

    DATA : lt_dref   TYPE REF TO data,
           ls_gdata  TYPE /dlwupex/tgdata,
           lt_gdata  TYPE /dlwupex/tgdata_tt,
           ls_unit   TYPE /dlwupex/tunit,
           ls_caract TYPE /dlwupex/tcaract,
           ls_bom    TYPE /dlwupex/tbom,
           ls_fia    TYPE /dlwupex/tfia,
           ls_list   TYPE /dlwupex/tlist,
           ls_srlist TYPE /dlwupex/tsrlist,
           ls_sale   TYPE /dlwupex/tsale,
           ls_logdc  TYPE /dlwupex/tlogdc,
           ls_logsto TYPE /dlwupex/tlogsto,
           lt_unit   TYPE /dlwupex/tunit_tt,
           lt_caract TYPE /dlwupex/tcaract_tt,
           lt_bom    TYPE /dlwupex/tbom_tt,
           lt_fia    TYPE /dlwupex/tfia_tt,
           lt_list   TYPE /dlwupex/tlist_tt,
           lt_srlist TYPE /dlwupex/tsrlist_tt,
           lt_sale   TYPE /dlwupex/tsale_tt,
           lt_logdc  TYPE /dlwupex/tlogdc_tt,
           lt_logsto TYPE /dlwupex/tlogsto_tt,
           lv_reqid  TYPE /dlwupex/ereqid.

    DATA : lv_object     TYPE REF TO /dlwupex/if_cockpit_article.
    CLEAR : ls_gdata, ls_unit, ls_caract, ls_bom,
            ls_fia, ls_list, ls_srlist, ls_sale, ls_logdc, ls_logsto.

    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = me->gv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_gdata  = lt_gdata
        ct_unit   = lt_unit
        ct_caract = lt_caract
        ct_bom    = lt_bom
        ct_fia    = lt_fia
        ct_list   = lt_list
        ct_srlist = lt_srlist
        ct_sale   = lt_sale
        ct_logdc  = lt_logdc
        ct_logsto = lt_logsto
        cv_rc     = cv_rc.
    SORT :  lt_gdata,
            lt_unit,
            lt_caract,
            lt_bom,
            lt_fia,
            lt_list,
            lt_srlist,
            lt_sale,
            lt_logdc,
            lt_logsto.

*     On appel la méthode SAVE pour mettre à jour la reserve de travail
    CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
      EXPORTING
        iv_bu     = me->gv_bu
      RECEIVING
        rv_object = lv_object.
    IF lv_object IS NOT INITIAL.
      CALL METHOD lv_object->alim_data_save
        CHANGING
          ct_gdata  = ct_gdata
          ct_unit   = ct_unit
          ct_caract = ct_caract
          ct_bom    = ct_bom
          ct_fia    = ct_fia
          ct_list   = ct_list
          ct_srlist = ct_srlist
          ct_sale   = ct_sale
          ct_logdc  = ct_logdc
          ct_logsto = ct_logsto.
    ENDIF.

*** On appel la méthode des checks
    CALL METHOD /dlwupex/if_cockpit_article~get_msg_check
      EXPORTING
        iv_id       = me->gv_bu
        iv_reqid    = iv_reqid
        iv_viewname = iv_viewname
      CHANGING
        cv_rc       = cv_rc
        ct_msg      = ct_msg.

    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu    = me->gv_bu
        iv_reqid = iv_reqid
      CHANGING
        ct_gdata = lt_gdata
        cv_rc    = cv_rc.
    SORT lt_gdata.


    SORT ct_msg BY id reqid matnr line viewname.

* il ne doit pas y avoir d'erreur sur la ligne
*       On change le statut de la line
    CASE iv_viewname.
      WHEN gc_gdataview. "Données Générales
        LOOP AT ct_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
          READ TABLE lt_gdata INTO ls_gdata
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   art_key = <fs_gdata>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_gdata> = ls_gdata.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_gdata>-status <> gc_statusvalidated AND <fs_gdata>-status <> gc_statuscompleted.
            <fs_gdata>-status = gc_statusinprogress.
          ENDIF.

          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_gdata>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_gdata>-id
                         reqid = iv_reqid
                         matnr = <fs_gdata>-art_key
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_gdata>-status <> gc_statuscompleted.
            <fs_gdata>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.

      WHEN gc_unitview. "Données Unités et EAN
        LOOP AT ct_unit ASSIGNING FIELD-SYMBOL(<fs_unit>).
          READ TABLE lt_unit INTO ls_unit
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   line = <fs_unit>-line
                   art_key = <fs_unit>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_unit> = ls_unit.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_unit>-status <> gc_statusvalidated AND <fs_unit>-status <> gc_statuscompleted.
            <fs_unit>-status = gc_statusinprogress.
          ENDIF.
          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_unit>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_unit>-id
                         reqid = iv_reqid
                         matnr = <fs_unit>-art_key
                         line = <fs_unit>-line
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_unit>-status <> gc_statuscompleted.
            <fs_unit>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.
      WHEN gc_caractview. "Caractéristiques
        LOOP AT ct_caract ASSIGNING FIELD-SYMBOL(<fs_caract>).
          READ TABLE lt_caract INTO ls_caract
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   line = <fs_caract>-line
                   art_key = <fs_caract>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_caract> = ls_caract.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_caract>-status <> gc_statusvalidated AND <fs_caract>-status <> gc_statuscompleted.
            <fs_caract>-status = gc_statusinprogress.
          ENDIF.
          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_caract>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_caract>-id
                         reqid = iv_reqid
                         matnr = <fs_caract>-art_key
                         line = <fs_caract>-line
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_caract>-status <> gc_statuscompleted.
            <fs_caract>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.
      WHEN gc_bomview. "BOM
        LOOP AT ct_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).
          READ TABLE lt_bom INTO ls_bom
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   line = <fs_bom>-line
                   art_key = <fs_bom>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_bom> = ls_bom.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_bom>-status <> gc_statusvalidated AND <fs_bom>-status <> gc_statuscompleted.
            <fs_bom>-status = gc_statusinprogress.
          ENDIF.
          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_bom>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_bom>-id
                         reqid = iv_reqid
                         matnr = <fs_bom>-art_key
                         line = <fs_bom>-line
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_bom>-status <> gc_statuscompleted.
            <fs_bom>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.
      WHEN gc_fiaview. "FIA
        LOOP AT ct_fia ASSIGNING FIELD-SYMBOL(<fs_fia>).
          READ TABLE lt_fia INTO ls_fia
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   line = <fs_fia>-line
                   art_key = <fs_fia>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_fia> = ls_fia.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_fia>-status <> gc_statusvalidated AND <fs_fia>-status <> gc_statuscompleted.
            <fs_fia>-status = gc_statusinprogress.
          ENDIF.
          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_fia>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_fia>-id
                         reqid = iv_reqid
                         matnr = <fs_fia>-art_key
                         line = <fs_fia>-line
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_fia>-status <> gc_statuscompleted.
            <fs_fia>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.
      WHEN gc_listview. "Source lists
        LOOP AT ct_list ASSIGNING FIELD-SYMBOL(<fs_list>).
          READ TABLE lt_list INTO ls_list
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   line = <fs_list>-line
                   art_key = <fs_list>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_list> = ls_list.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_list>-status <> gc_statusvalidated AND <fs_list>-status <> gc_statuscompleted.
            <fs_list>-status = gc_statusinprogress.
          ENDIF.
          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_list>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_list>-id
                         reqid = iv_reqid
                         matnr = <fs_list>-art_key
                         line = <fs_list>-line
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_list>-status <> gc_statuscompleted.
            <fs_list>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.
      WHEN gc_srlistview. "Référencement listing
        LOOP AT ct_srlist ASSIGNING FIELD-SYMBOL(<fs_srlist>).
          READ TABLE lt_srlist INTO ls_srlist
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   line = <fs_srlist>-line
                   art_key = <fs_srlist>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_srlist> = ls_srlist.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_srlist>-status <> gc_statusvalidated AND <fs_srlist>-status <> gc_statuscompleted.
            <fs_srlist>-status = gc_statusinprogress.
          ENDIF.
          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_srlist>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_srlist>-id
                         reqid = iv_reqid
                         matnr = <fs_srlist>-art_key
                         line = <fs_srlist>-line
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_srlist>-status <> gc_statuscompleted.
            <fs_srlist>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.
      WHEN gc_saleview. "Données Ventes
        LOOP AT ct_sale ASSIGNING FIELD-SYMBOL(<fs_sale>).
          READ TABLE lt_sale INTO ls_sale
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   line = <fs_sale>-line
                   art_key = <fs_sale>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_sale> = ls_sale.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_sale>-status <> gc_statusvalidated AND <fs_sale>-status <> gc_statuscompleted.
            <fs_sale>-status = gc_statusinprogress.
          ENDIF.
          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_sale>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_sale>-id
                         reqid = iv_reqid
                         matnr = <fs_sale>-art_key
                         line = <fs_sale>-line
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_sale>-status <> gc_statuscompleted.
            <fs_sale>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.
      WHEN gc_logdcview. "Log Site ref DC
        LOOP AT ct_logdc ASSIGNING FIELD-SYMBOL(<fs_logdc>).
          READ TABLE lt_logdc INTO ls_logdc
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   line = <fs_logdc>-line
                   art_key = <fs_logdc>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_logdc> = ls_logdc.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_logdc>-status <> gc_statusvalidated AND <fs_logdc>-status <> gc_statuscompleted.
            <fs_logdc>-status = gc_statusinprogress.
          ENDIF.
          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_logdc>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_logdc>-id
                         reqid = iv_reqid
                         matnr = <fs_logdc>-art_key
                         line = <fs_logdc>-line
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_logdc>-status <> gc_statuscompleted.
            <fs_logdc>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.
      WHEN gc_logstoview. "Log Site ref Store
        LOOP AT ct_logsto ASSIGNING FIELD-SYMBOL(<fs_logsto>).
          READ TABLE lt_logsto INTO ls_logsto
          WITH KEY id = me->gv_bu
                   reqid = iv_reqid
                   line = <fs_logsto>-line
                   art_key = <fs_logsto>-art_key
                   BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            <fs_logsto> = ls_logsto.
          ELSE.
            CONTINUE.
          ENDIF.
          IF <fs_logsto>-status <> gc_statusvalidated AND <fs_logsto>-status <> gc_statuscompleted.
            <fs_logsto>-status = gc_statusinprogress.
          ENDIF.
          DELETE FROM /dlwupex/tmsg
             WHERE id = me->gv_bu AND
                   reqid = iv_reqid AND
                   matnr = <fs_logsto>-art_key AND
                   viewname = iv_viewname.
          READ TABLE ct_msg TRANSPORTING NO FIELDS
               WITH KEY  id = <fs_logsto>-id
                         reqid = iv_reqid
                         matnr = <fs_logsto>-art_key
                         line = <fs_logsto>-line
                         viewname = iv_viewname
               BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            CONTINUE.
          ENDIF.
          IF <fs_logsto>-status <> gc_statuscompleted.
            <fs_logsto>-status = gc_statusvalidated.
          ENDIF.
        ENDLOOP.
      WHEN OTHERS.

    ENDCASE.


    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu            = me->gv_bu
        it_gdata         = ct_gdata
        it_unit          = ct_unit
        it_caract        = ct_caract
        it_bom           = ct_bom
        it_fia           = ct_fia
        it_list          = ct_list
        it_srlist        = ct_srlist
        it_sale          = ct_sale
        it_logdc         = ct_logdc
        it_logsto        = ct_logsto
        iv_change_reqids = abap_true
        iv_lockdb        = abap_true
      CHANGING
        ct_msg           = ct_msg
        cv_rc            = cv_rc
        cv_reqid         = lv_reqid.

    COMMIT WORK AND WAIT.

  ENDMETHOD.


  METHOD bapi_create_bom.

    CONSTANTS : lc_str  TYPE string VALUE '00',
                lc_str2 TYPE string VALUE '0'.

    DATA  : lt_bomgroup          TYPE TABLE OF bapi1080_bgr_c,
            lt_variants          TYPE TABLE OF bapi1080_bom_c,
            lt_items             TYPE TABLE OF bapi1080_itm_c,
            lt_materialrelations TYPE TABLE OF bapi1080_mbm_c,
            lt_itemas            TYPE TABLE OF bapi1080_rel_itm_bom_c,
            lt_return            TYPE TABLE OF bapiret2,
            lt_bom               TYPE /dlwupex/tbom_tt,
            lt_reqids            TYPE /dlwupex/treqids_tt,
            lt_gdata             TYPE /dlwupex/tgdata_tt,
            ls_bomgroup          TYPE bapi1080_bgr_c,
            ls_variants          TYPE bapi1080_bom_c,
            ls_items             TYPE bapi1080_itm_c,
            ls_materialrelations TYPE bapi1080_mbm_c,
            ls_itemas            TYPE bapi1080_rel_itm_bom_c,
            ls_bom               TYPE /dlwupex/tbom,
            ls_msg               TYPE /dlwupex/tmsg,
            ls_gdata             TYPE /dlwupex/tgdata,
            ls_return            TYPE bapiret2,
            lv_material          TYPE matnr18,
            lv_count             TYPE i,
            lv_art_key           TYPE /dlwupex/ematkey,
            lv_string            TYPE string,
            lv_reqid             TYPE /dlwupex/ereqid,
            lv_status            TYPE /dlwupex/elinestatus,
            lv_cmpt_str          TYPE c LENGTH 3.

    REFRESH : lt_bomgroup, lt_variants, lt_items, lt_materialrelations,
              lt_itemas, lt_return, lt_bom, lt_gdata.
    CLEAR : ls_bomgroup, ls_variants, ls_items, ls_materialrelations, ls_itemas,
            ls_bom, ls_msg, ls_return, lv_material, lv_count, lv_string,
            lv_cmpt_str, lv_status, lv_reqid, ls_gdata, lv_art_key.

*   Retrieve the contain of BOM
    CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
      EXPORTING
        iv_bu      = iv_bu
        iv_reqid   = iv_reqid
        iv_art_key = iv_matnr
      CHANGING
        ct_bom     = lt_bom
        cv_rc      = cv_rc.
    IF lt_bom[] IS NOT INITIAL.

*     On va chercher la général data de la reserve de travail
      CALL METHOD /dlwupex/cl_cockpit_article=>get_data
        EXPORTING
          iv_bu    = iv_bu
          iv_reqid = iv_reqid
        CHANGING
          ct_gdata = lt_gdata
          ct_reqids = lt_reqids
          cv_rc    = cv_rc.
      IF lt_gdata[] IS NOT INITIAL.
*       On remplace le numéro temporaire d'article
        LOOP AT lt_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).
          IF <fs_bom>-idnrk(3) EQ 'ART'.
            lv_art_key = <fs_bom>-idnrk.

            DO 10 TIMES. "pour attendre les créations des autres articles utilisés pour le BOM
              CLEAR ls_gdata.
              READ TABLE lt_gdata INTO ls_gdata
              WITH KEY id      = iv_bu
                       reqid   = iv_reqid
                       art_key = lv_art_key.
              IF sy-subrc EQ 0
                AND ls_gdata-matnr IS NOT INITIAL.

                SELECT COUNT(*) UP TO 1 ROWS FROM mara
                       WHERE matnr = ls_gdata-matnr.
                IF sy-subrc EQ 0.
                  <fs_bom>-idnrk = ls_gdata-matnr.
                  DATA(lv_error) = abap_false.
                  EXIT.
                ELSE.
                  lv_error = abap_true.
                  WAIT UP TO 1 SECONDS.
                ENDIF.
              ELSE.
                lv_error = abap_true.
                WAIT UP TO 1 SECONDS.
              ENDIF.
            ENDDO.
            IF lv_error = abap_true.
*               L'article n'est pas encore créé
              ls_msg-id         = iv_bu.
              ls_msg-reqid      = iv_reqid.
              ls_msg-matnr      = iv_matnr.
              ls_msg-viewname   = gc_bomview.
              ls_msg-type       = 'E'.
              ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
              ls_msg-num        = '050'.
              ls_msg-message_v1 = ls_gdata-matnr.
              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message
              WITH ls_msg-message_v1.
              APPEND ls_msg TO ct_msg.
              cv_rc = 4.
            ENDIF.
          ENDIF.
        ENDLOOP.
      ENDIF.


      IF cv_rc IS INITIAL.

*     Material BOM Group Header Data
        CLEAR ls_bomgroup.
        ls_bomgroup-bom_group_identification = 'BAPI_SMP_COL1'.
        ls_bomgroup-object_type = 'BGR'.
        ls_bomgroup-object_id = 'SIMPLE1'.
        ls_bomgroup-bom_usage = '3'.
        ls_bomgroup-ltxt_lang = sy-langu.
        ls_bomgroup-technical_type = ' '.
        ls_bomgroup-bom_text = 'Simple BoM - FM'.
        APPEND ls_bomgroup TO lt_bomgroup.

*     Header Details of the different variants
        CLEAR ls_variants.
        ls_variants-bom_group_identification = 'BAPI_SMP_COL1'.
        ls_variants-object_type = 'BOM'.
        ls_variants-object_id = 'SIMPLE1'.
        ls_variants-alternative_bom = '01'.
        ls_variants-bom_status = '01'.
        ls_variants-valid_from_date = sy-datum.
        ls_variants-function = 'NEW'.
        APPEND ls_variants TO lt_variants.



*     We loop on BOM to create items
        CLEAR : ls_bom, lv_count, lv_cmpt_str, lv_string.
        LOOP AT lt_bom INTO ls_bom.

*       On récupère le material
          IF lv_material IS INITIAL.
            lv_material = ls_bom-matnr.
          ENDIF.

*       Init compteur
          lv_count = lv_count + 1.
          WRITE lv_count TO lv_cmpt_str.

*       Details of the items of the variants
          CLEAR ls_items.
          ls_items-bom_group_identification = 'BAPI_SMP_COL1'.
          ls_items-object_type     = 'ITM'.
          ls_items-object_id       = 'SIMPLE1'.
          CONDENSE lv_cmpt_str.
          IF lv_count > 9.
            CONCATENATE lc_str2 lv_cmpt_str lc_str2 INTO lv_string.
          ELSE.
            CONCATENATE lc_str lv_cmpt_str lc_str2 INTO lv_string.
          ENDIF.
          ls_items-item_no         = lv_string.
          ls_items-item_cat        = ls_bom-postp.
          ls_items-component       = ls_bom-idnrk.
          ls_items-comp_unit       = ls_bom-meins.
          ls_items-comp_qty        = ls_bom-menge.
          ls_items-valid_from_date = sy-datum.
          ls_items-component_long  = ls_bom-idnrk.
          APPEND ls_items TO lt_items.

        ENDLOOP.

*     Details of the materials of the different variants
        CLEAR ls_materialrelations.
        ls_materialrelations-bom_group_identification = 'BAPI_SMP_COL1'.
        ls_materialrelations-material = lv_material.
        ls_materialrelations-bom_usage = '3'.
        ls_materialrelations-alternative_bom = '01'.
        APPEND ls_materialrelations TO lt_materialrelations.

*     Linking items to the corresponding variants
        CLEAR ls_itemas.
        ls_itemas-bom_group_identification = 'BAPI_SMP_COL1'.
        ls_itemas-sub_object_type = 'ITM'.
        ls_itemas-sub_object_id = 'SIMPLE1'.
        ls_itemas-super_object_type = 'BOM'.
        ls_itemas-super_object_id = 'SIMPLE1'.
        ls_itemas-valid_from_date = sy-datum.
        ls_itemas-function = 'NEW'.
        APPEND ls_itemas TO lt_itemas.


        CALL FUNCTION 'BAPI_MATERIAL_BOM_GROUP_CREATE'
          EXPORTING
            all_error         = 'X'
          TABLES
            bomgroup          = lt_bomgroup
            variants          = lt_variants
            items             = lt_items
            materialrelations = lt_materialrelations
            itemassignments   = lt_itemas
            return            = lt_return.

*     Commit creation
        CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'.

        IF lt_return[] IS NOT INITIAL.
          CLEAR : ls_msg, ls_return.
          LOOP AT lt_return INTO ls_return.
            IF ls_return-type EQ 'E'.
*             On remplit la table de message d'erreur.
              ls_msg-id         = iv_bu.
              ls_msg-reqid      = iv_reqid.
              ls_msg-matnr      = iv_matnr.
              ls_msg-viewname   = gc_bomview.
              ls_msg-type       = ls_return-type.
              ls_msg-idmsg      = ls_return-id.
              ls_msg-num        = ls_return-number.
              ls_msg-message    = ls_return-message.
              APPEND ls_msg TO ct_msg.
              cv_rc = 4.
            ENDIF.

          ENDLOOP.

        ENDIF.

      ENDIF.

      CLEAR lv_status.
      IF cv_rc IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>change_status
          EXPORTING
            iv_status = gc_statusinerror
          CHANGING
            ct_bom    = lt_bom
            ct_reqids = lt_reqids
            cv_rc     = cv_rc.

        CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
          EXPORTING
            it_msg = ct_msg
          CHANGING
            cv_rc  = cv_rc
            ct_msg = ct_msg.

        CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
          EXPORTING
            it_reqids        = lt_reqids
            iv_change_reqids = 'X'
          CHANGING
            ct_msg           = ct_msg
            cv_rc            = cv_rc.

      ELSE.
        CALL METHOD /dlwupex/cl_cockpit_article=>change_status
          EXPORTING
            iv_status = gc_statuscompleted
          CHANGING
            ct_bom    = lt_bom
            cv_rc     = cv_rc.
      ENDIF.


      lv_reqid = iv_reqid.

      CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
        EXPORTING
          iv_bu    = iv_bu
          it_bom   = lt_bom
        CHANGING
          ct_msg   = ct_msg
          cv_rc    = cv_rc
          cv_reqid = lv_reqid.

      COMMIT WORK AND WAIT.


    ENDIF.

  ENDMETHOD.


  METHOD bapi_create_bom_listing.


    CONSTANTS : lc_str  TYPE string VALUE '00',
                lc_str2 TYPE string VALUE '0'.

    TYPES : BEGIN OF ty_matnr,
              matnr TYPE matnr,
            END OF ty_matnr.

    DATA : lt_bom               TYPE /dlwupex/tbom_tt,
           lt_list              TYPE /dlwupex/tlist_tt,
           lt_list_comp         TYPE /dlwupex/tlist_tt,
           lt_list_stat         TYPE /dlwupex/tlist_tt,
           lt_list_global       TYPE /dlwupex/tlist_tt,
           lt_reqids            TYPE /dlwupex/treqids_tt,
           lt_gdata             TYPE /dlwupex/tgdata_tt,
           lt_msg               TYPE /dlwupex/tmsg_tt,
           lt_bomgroup          TYPE TABLE OF bapi1080_bgr_c,
           lt_variants          TYPE TABLE OF bapi1080_bom_c,
           lt_items             TYPE TABLE OF bapi1080_itm_c,
           lt_materialrelations TYPE TABLE OF bapi1080_mbm_c,
           lt_itemas            TYPE TABLE OF bapi1080_rel_itm_bom_c,
           lt_return            TYPE TABLE OF bapiret2,
           ls_bomgroup          TYPE bapi1080_bgr_c,
           ls_variants          TYPE bapi1080_bom_c,
           ls_items             TYPE bapi1080_itm_c,
           ls_materialrelations TYPE bapi1080_mbm_c,
           ls_itemas            TYPE bapi1080_rel_itm_bom_c,
           ls_msg               TYPE /dlwupex/tmsg,
           ls_gdata             TYPE /dlwupex/tgdata,
           ls_return            TYPE bapiret2,
           lv_material          TYPE matnr,
           lv_art_key           TYPE /dlwupex/ematkey,
           lv_art_key_save      TYPE /dlwupex/ematkey,
           lv_rownb             TYPE int4,
           lv_count             TYPE i,
           lv_string            TYPE string,
           lv_cmpt_str          TYPE c LENGTH 3,
           lt_bom_stat          TYPE /dlwupex/tbom_tt,
           lt_bom_global        TYPE /dlwupex/tbom_tt,
           lv_reqid             TYPE /dlwupex/ereqid,
           lv_rc                TYPE sysubrc,
           lt_art_err           TYPE TABLE OF ty_matnr,
           lt_error             TYPE TABLE OF  merrdat,
           ls_error             TYPE merrdat,
           lv_comp              TYPE idnrk,
           lt_tab_wlk1          TYPE TABLE OF wlk1_ueb,
           ls_tab_wlk1          TYPE wlk1_ueb.


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
             WHERE name = 'QUEUE_PREFIXE'.
    IF sy-subrc IS NOT INITIAL.
      ls_msg-type = 'E'.
      ls_msg-idmsg = gc_classmsg.
      ls_msg-num = '023'.
      ls_msg-message_v1 = '/DLWUPEX/TCUSTO'.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
      EXIT.
    ENDIF.

    DATA(lv_reqid_short) = iv_reqid.
    SHIFT lv_reqid_short LEFT DELETING LEADING '0'.

    CONCATENATE lv_value 'RT' lv_reqid_short '*' INTO lv_qname.

    lv_inprogress = 'X'.

    WHILE lv_inprogress = 'X'.
      WAIT UP TO 5 SECONDS.
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


*     On va chercher la général data et bom de la reserve de travail
    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_gdata  = lt_gdata
        ct_bom    = lt_bom
        ct_list   = lt_list
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.


    DELETE lt_bom WHERE status = '06'.
    DELETE lt_list WHERE status = '06'.

**********************************************************************
**************************** BOM MANAGE ******************************
**********************************************************************

    IF lt_bom[] IS NOT INITIAL.

*     Material BOM Group Header Data
      CLEAR ls_bomgroup.
      ls_bomgroup-bom_group_identification = 'BAPI_SMP_COL1'.
      ls_bomgroup-object_type = 'BGR'.
      ls_bomgroup-object_id = 'SIMPLE1'.
      ls_bomgroup-bom_usage = '3'.
      ls_bomgroup-ltxt_lang = sy-langu.
      ls_bomgroup-technical_type = ' '.
      ls_bomgroup-bom_text = 'Simple BoM - FM'.
      APPEND ls_bomgroup TO lt_bomgroup.

*     Header Details of the different variants
      CLEAR ls_variants.
      ls_variants-bom_group_identification = 'BAPI_SMP_COL1'.
      ls_variants-object_type = 'BOM'.
      ls_variants-object_id = 'SIMPLE1'.
      ls_variants-alternative_bom = '01'.
      ls_variants-bom_status = '01'.
      ls_variants-valid_from_date = sy-datum.
      ls_variants-function = 'NEW'.
      APPEND ls_variants TO lt_variants.

*     We loop on BOM to create items
      SORT lt_bom BY matnr.
      LOOP AT lt_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).
        IF <fs_bom>-idnrk(3) EQ 'ART'.
          lv_art_key = <fs_bom>-idnrk.
          READ TABLE lt_gdata INTO ls_gdata
                        WITH KEY id      = iv_bu
                                 reqid   = iv_reqid
                                 art_key = lv_art_key.
          IF sy-subrc EQ 0.
            <fs_bom>-idnrk = ls_gdata-matnr.
          ENDIF.
        ENDIF.

        IF lv_material <> <fs_bom>-matnr AND lv_material IS NOT INITIAL.

*     Details of the materials of the different variants
          CLEAR ls_materialrelations.
          ls_materialrelations-bom_group_identification = 'BAPI_SMP_COL1'.
          ls_materialrelations-material = lv_material.
          ls_materialrelations-bom_usage = '3'.
          ls_materialrelations-alternative_bom = '01'.
          APPEND ls_materialrelations TO lt_materialrelations.

*     Linking items to the corresponding variants
          CLEAR ls_itemas.
          ls_itemas-bom_group_identification = 'BAPI_SMP_COL1'.
          ls_itemas-sub_object_type = 'ITM'.
          ls_itemas-sub_object_id = 'SIMPLE1'.
          ls_itemas-super_object_type = 'BOM'.
          ls_itemas-super_object_id = 'SIMPLE1'.
          ls_itemas-valid_from_date = sy-datum.
          ls_itemas-function = 'NEW'.
          APPEND ls_itemas TO lt_itemas.

          DATA(lv_mat) = lv_material.
          SHIFT lv_mat LEFT DELETING LEADING '0'.

          CONCATENATE lv_value 'BOM_' 'RT' lv_reqid_short '/' lv_mat INTO lv_qname.

          CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
            EXPORTING
              qin_name           = lv_qname
            EXCEPTIONS
              invalid_queue_name = 1
              OTHERS             = 2.
          IF sy-subrc EQ 0.
            CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_CAM_BOM'
              IN BACKGROUND TASK
              AS SEPARATE UNIT
              EXPORTING
                iv_bu                = iv_bu
                iv_reqid             = iv_reqid
                iv_artkey            = lv_art_key_save
              CHANGING
                ct_bomgroup          = lt_bomgroup
                ct_variants          = lt_variants
                ct_items             = lt_items
                ct_materialrelations = lt_materialrelations
                ct_itemassignments   = lt_itemas
                ct_bom               = lt_bom_stat.
            COMMIT WORK.
          ENDIF.


          REFRESH : lt_bom_stat, lt_itemas, lt_items, lt_materialrelations.
          CLEAR : lv_rc, lv_count.
        ENDIF.


        CLEAR : lv_cmpt_str, lv_string.

*       Init compteur
        lv_count = lv_count + 1.
        WRITE lv_count TO lv_cmpt_str.

*       Details of the items of the variants
        CLEAR ls_items.
        ls_items-bom_group_identification = 'BAPI_SMP_COL1'.
        ls_items-object_type     = 'ITM'.
        ls_items-object_id       = 'SIMPLE1'.
        CONDENSE lv_cmpt_str.
        IF lv_count > 9.
          CONCATENATE lc_str2 lv_cmpt_str lc_str2 INTO lv_string.
        ELSE.
          CONCATENATE lc_str lv_cmpt_str lc_str2 INTO lv_string.
        ENDIF.
        ls_items-item_no         = lv_string.
        ls_items-item_cat        = <fs_bom>-postp.
        ls_items-component       = <fs_bom>-idnrk.
        ls_items-comp_unit       = <fs_bom>-meins.
        ls_items-comp_qty        = <fs_bom>-menge.
        ls_items-valid_from_date = sy-datum.
        ls_items-component_long  = <fs_bom>-idnrk.
        APPEND ls_items TO lt_items.

        APPEND <fs_bom> TO lt_bom_stat.
*        ENDIF.

        lv_material = <fs_bom>-matnr.
        lv_art_key_save = <fs_bom>-art_key.

        AT LAST.

          CLEAR ls_materialrelations.
          ls_materialrelations-bom_group_identification = 'BAPI_SMP_COL1'.
          ls_materialrelations-material = lv_material.
          ls_materialrelations-bom_usage = '3'.
          ls_materialrelations-alternative_bom = '01'.
          APPEND ls_materialrelations TO lt_materialrelations.

*     Linking items to the corresponding variants
          CLEAR ls_itemas.
          ls_itemas-bom_group_identification = 'BAPI_SMP_COL1'.
          ls_itemas-sub_object_type = 'ITM'.
          ls_itemas-sub_object_id = 'SIMPLE1'.
          ls_itemas-super_object_type = 'BOM'.
          ls_itemas-super_object_id = 'SIMPLE1'.
          ls_itemas-valid_from_date = sy-datum.
          ls_itemas-function = 'NEW'.
          APPEND ls_itemas TO lt_itemas.

          lv_mat = lv_material.
          SHIFT lv_mat LEFT DELETING LEADING '0'.
          CONCATENATE lv_value 'BOM_' 'RT' lv_reqid_short '/' lv_mat INTO lv_qname.

          CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
            EXPORTING
              qin_name           = lv_qname
            EXCEPTIONS
              invalid_queue_name = 1
              OTHERS             = 2.
          IF sy-subrc EQ 0.
            CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_CAM_BOM'
              IN BACKGROUND TASK
              AS SEPARATE UNIT
              EXPORTING
                iv_bu                = iv_bu
                iv_reqid             = iv_reqid
                iv_artkey            = lv_art_key_save
              CHANGING
                ct_bomgroup          = lt_bomgroup
                ct_variants          = lt_variants
                ct_items             = lt_items
                ct_materialrelations = lt_materialrelations
                ct_itemassignments   = lt_itemas
                ct_bom               = lt_bom_stat.
            COMMIT WORK.
          ENDIF.
          REFRESH : lt_bom_stat, lt_itemas, lt_items, lt_materialrelations.
          CLEAR lv_rc.
        ENDAT.

      ENDLOOP.

    ENDIF.

*    IF  lv_error = abap_true.
*      CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
*        EXPORTING
*          it_reqids        = lt_reqids
*          iv_change_reqids = 'X'
*        CHANGING
*          ct_msg           = ct_msg
*          cv_rc            = cv_rc.
*    ENDIF.
*
** mise à jour réserve de travail
*    IF lt_bom_global IS NOT INITIAL.
*      lv_reqid = iv_reqid.
*      CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
*        EXPORTING
*          iv_bu    = iv_bu
*          it_bom   = lt_bom_global
*        CHANGING
*          ct_msg   = ct_msg
*          cv_rc    = cv_rc
*          cv_reqid = lv_reqid.
*    ENDIF.
*    SORT lt_art_err.
*    DELETE ADJACENT DUPLICATES FROM lt_art_err.

**********************************************************************
************************** LISTING MANAGE ****************************
**********************************************************************
** On vérifie que toutes les queues BOM sont terminées.


    CONCATENATE lv_value 'BOM_' 'RT' lv_reqid_short '*' INTO lv_qname.

    lv_inprogress = 'X'.

    WHILE lv_inprogress = 'X'.
      WAIT UP TO 5 SECONDS.
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


* Gestion de la Partie BOM / et classique

    IF lt_list IS NOT INITIAL.

*     On va chercher les données d'erreur de la reserve de travail
      CALL METHOD /dlwupex/cl_cockpit_article=>get_data
        EXPORTING
          iv_bu    = iv_bu
          iv_reqid = iv_reqid
        CHANGING
          ct_bom   = lt_bom
          ct_msg   = lt_msg
          cv_rc    = cv_rc.

* on garde les message d'erreur de BOM
      DELETE lt_msg WHERE type <> 'E'.
*      DELETE lt_msg WHERE viewname <> gc_bomview OR type <> 'E'.

      SORT lt_msg.
      SORT lt_list BY matnr.
      SORT lt_bom BY matnr.
      LOOP AT lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
* on ne traite que si pas d'erreur BOM
        READ TABLE lt_msg TRANSPORTING NO FIELDS
              WITH KEY  id = <fs_gdata>-id
                        reqid = <fs_gdata>-reqid
                        matnr = <fs_gdata>-art_key
                 BINARY SEARCH.
        CHECK sy-subrc IS NOT INITIAL.
* traitement de l'article
        READ TABLE lt_list TRANSPORTING NO FIELDS
               WITH KEY matnr = <fs_gdata>-matnr
                 BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          LOOP AT lt_list ASSIGNING FIELD-SYMBOL(<fs_list>) FROM  sy-tabix.
            IF <fs_gdata>-matnr <> <fs_list>-matnr.
              EXIT.
            ENDIF.
            READ TABLE lt_bom TRANSPORTING NO FIELDS
                  WITH KEY matnr = <fs_list>-matnr
                  BINARY SEARCH.
            IF sy-subrc IS INITIAL.
              CLEAR : ls_tab_wlk1.
              MOVE-CORRESPONDING <fs_list> TO ls_tab_wlk1.
              ls_tab_wlk1-strli    = 'H'.
              ls_tab_wlk1-artnr    = <fs_list>-matnr.
              ls_tab_wlk1-strnr  = <fs_list>-matnr.
              ls_tab_wlk1-changeid = 'I'.
              ls_tab_wlk1-tranc    = 1.
              APPEND ls_tab_wlk1 TO lt_tab_wlk1.
              APPEND <fs_list> TO lt_list_stat.
            ELSE.
              CLEAR : ls_tab_wlk1.
              MOVE-CORRESPONDING <fs_list> TO ls_tab_wlk1.
              ls_tab_wlk1-artnr    = <fs_list>-matnr.
              ls_tab_wlk1-strnr  = <fs_list>-matnr.
              ls_tab_wlk1-changeid = 'I'.
              ls_tab_wlk1-tranc    = 1.
              APPEND ls_tab_wlk1 TO lt_tab_wlk1.
              APPEND <fs_list> TO lt_list_stat.
            ENDIF.
            IF lt_tab_wlk1 IS NOT INITIAL.

              lv_mat = <fs_gdata>-matnr.
              SHIFT lv_mat LEFT DELETING LEADING '0'.
              CONCATENATE lv_value 'LIST_' 'RT' lv_reqid_short '/' lv_mat INTO lv_qname.

              CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
                EXPORTING
                  qin_name           = lv_qname
                EXCEPTIONS
                  invalid_queue_name = 1
                  OTHERS             = 2.
              IF sy-subrc EQ 0.
                CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_CAM_LIST'
                  IN BACKGROUND TASK
                  AS SEPARATE UNIT
                  EXPORTING
                    iv_bu       = iv_bu
                    iv_reqid    = iv_reqid
                    iv_artkey   = <fs_gdata>-art_key
                  CHANGING
                    ct_tab_wlk1 = lt_tab_wlk1
                    ct_list     = lt_list_stat.
                COMMIT WORK.
              ENDIF.

              REFRESH : lt_tab_wlk1, lt_list_stat.
            ENDIF.
          ENDLOOP.
        ENDIF.
      ENDLOOP.

    ENDIF.


* Gestion de la Partie Composants
    REFRESH : lt_tab_wlk1.
    SORT lt_bom BY idnrk.
    SORT lt_list BY artnr.
    LOOP AT lt_bom ASSIGNING <fs_bom>.

      IF <fs_bom>-idnrk(3) EQ 'ART'.
        lv_art_key = <fs_bom>-idnrk.
        READ TABLE lt_gdata INTO ls_gdata
                      WITH KEY id      = iv_bu
                               reqid   = iv_reqid
                               art_key = lv_art_key.
        IF sy-subrc EQ 0.
          <fs_bom>-idnrk = ls_gdata-matnr.
        ENDIF.
      ENDIF.

      lt_list_comp = lt_list.
      SORT lt_list_comp BY matnr.
* on ne traite que si pas d'erreur BOM
      READ TABLE lt_msg TRANSPORTING NO FIELDS
                    WITH KEY  id = iv_bu
                              reqid = iv_reqid
                              matnr = <fs_bom>-art_key
                       BINARY SEARCH.
      IF sy-subrc IS NOT INITIAL.

        IF <fs_bom>-idnrk <> lv_comp AND lv_comp IS NOT INITIAL.
* Ajout du Composant seul si géré
          READ TABLE lt_list TRANSPORTING NO FIELDS
           WITH KEY artnr = <fs_bom>-idnrk
             BINARY SEARCH.
          IF sy-subrc IS INITIAL.
            LOOP AT lt_list ASSIGNING <fs_list> FROM sy-tabix.
              IF <fs_bom>-idnrk <> <fs_list>-artnr.
                EXIT.
              ENDIF.
              CLEAR : ls_tab_wlk1.
              MOVE-CORRESPONDING <fs_list> TO ls_tab_wlk1.
              ls_tab_wlk1-artnr    = <fs_list>-matnr.
              ls_tab_wlk1-strnr  = <fs_list>-matnr.
              ls_tab_wlk1-changeid = 'I'.
              ls_tab_wlk1-tranc    = 1.
              APPEND ls_tab_wlk1 TO lt_tab_wlk1.
              APPEND <fs_list> TO lt_list_stat.
              DATA(lv_artkey) = <fs_bom>-art_key.
              lv_mat = <fs_bom>-matnr.
            ENDLOOP.
          ENDIF.
          IF lt_tab_wlk1 IS NOT INITIAL.
            SHIFT lv_mat LEFT DELETING LEADING '0'.
            CONCATENATE lv_value 'LIST_' 'RT' lv_reqid_short '/' lv_mat INTO lv_qname.

            CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
              EXPORTING
                qin_name           = lv_qname
              EXCEPTIONS
                invalid_queue_name = 1
                OTHERS             = 2.
            IF sy-subrc EQ 0.
              CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_CAM_LIST'
                IN BACKGROUND TASK
                AS SEPARATE UNIT
                EXPORTING
                  iv_bu       = iv_bu
                  iv_reqid    = iv_reqid
                  iv_artkey   = lv_artkey
                CHANGING
                  ct_tab_wlk1 = lt_tab_wlk1
                  ct_list     = lt_list_stat.
              COMMIT WORK.
            ENDIF.

            REFRESH : lt_tab_wlk1, lt_list_stat.
          ENDIF.
        ENDIF.

* Ajout du BOM du Composant si géré
        READ TABLE lt_list_comp TRANSPORTING NO FIELDS
                 WITH KEY matnr = <fs_bom>-matnr
                   BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          LOOP AT lt_list_comp ASSIGNING <fs_list> FROM sy-tabix.
            IF <fs_bom>-matnr <> <fs_list>-matnr.
              EXIT.
            ENDIF.
            CLEAR : ls_tab_wlk1.
            MOVE-CORRESPONDING <fs_list> TO ls_tab_wlk1.
            ls_tab_wlk1-artnr    = <fs_bom>-idnrk.
            ls_tab_wlk1-strli    = 'X'.
            ls_tab_wlk1-strnr  = <fs_list>-matnr.
            ls_tab_wlk1-changeid = 'I'.
            ls_tab_wlk1-tranc    = 1.
            ls_tab_wlk1-strli    = 'X'.
            APPEND ls_tab_wlk1 TO lt_tab_wlk1.
            APPEND <fs_list> TO lt_list_stat.
            lv_artkey = <fs_bom>-art_key.
            lv_mat = <fs_bom>-matnr.
          ENDLOOP.
        ENDIF.
      ENDIF.
      lv_comp = <fs_bom>-idnrk.
      AT LAST.
* Ajout du Composant seul si géré
        READ TABLE lt_list TRANSPORTING NO FIELDS
         WITH KEY artnr = <fs_bom>-idnrk
           BINARY SEARCH.
        IF sy-subrc IS INITIAL.
          LOOP AT lt_list ASSIGNING <fs_list> FROM sy-tabix.
            IF <fs_bom>-idnrk <> <fs_list>-artnr.
              EXIT.
            ENDIF.
            CLEAR : ls_tab_wlk1.
            MOVE-CORRESPONDING <fs_list> TO ls_tab_wlk1.
            ls_tab_wlk1-artnr    = <fs_list>-matnr.
            ls_tab_wlk1-strnr  = <fs_list>-matnr.
            ls_tab_wlk1-changeid = 'I'.
            ls_tab_wlk1-tranc    = 1.
            APPEND ls_tab_wlk1 TO lt_tab_wlk1.
            APPEND <fs_list> TO lt_list_stat.
            lv_artkey = <fs_bom>-art_key.
            lv_mat = <fs_bom>-matnr.
          ENDLOOP.
        ENDIF.
        IF lt_tab_wlk1 IS NOT INITIAL.
          SHIFT lv_mat LEFT DELETING LEADING '0'.
          CONCATENATE lv_value 'LIST_' 'RT' lv_reqid_short '/' lv_mat INTO lv_qname.

          CALL FUNCTION 'TRFC_SET_QIN_PROPERTIES'
            EXPORTING
              qin_name           = lv_qname
            EXCEPTIONS
              invalid_queue_name = 1
              OTHERS             = 2.
          IF sy-subrc EQ 0.
            CALL FUNCTION '/DLWUPEX/COCKPIT_RFC_CAM_LIST'
              IN BACKGROUND TASK
              AS SEPARATE UNIT
              EXPORTING
                iv_bu       = iv_bu
                iv_reqid    = iv_reqid
                iv_artkey   = lv_artkey
              CHANGING
                ct_tab_wlk1 = lt_tab_wlk1
                ct_list     = lt_list_stat.
            COMMIT WORK.
          ENDIF.
          REFRESH : lt_tab_wlk1, lt_list_stat.
        ENDIF.
      ENDAT.
    ENDLOOP.
*
** Gestion du Step
*    SORT lt_art_err.
*    DELETE ADJACENT DUPLICATES FROM lt_art_err.
*
*    LOOP AT lt_gdata ASSIGNING <fs_gdata>.
*      READ TABLE lt_art_err TRANSPORTING NO FIELDS
*        WITH KEY matnr = <fs_gdata>-matnr
*        BINARY SEARCH.
*      IF sy-subrc IS NOT INITIAL.
*        <fs_gdata>-step = <fs_gdata>-step + 1.
*      ENDIF.
*    ENDLOOP.
*
*    CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
*      EXPORTING
*        it_gdata           = lt_gdata
*        iv_change_worklist = abap_true
*      CHANGING
*        ct_msg             = ct_msg
*        cv_rc              = cv_rc.
*
** mise à jour réserve de travail
*    IF lt_list_global IS NOT INITIAL.
*      lv_reqid = iv_reqid.
*      CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
*        EXPORTING
*          iv_bu    = iv_bu
*          it_list  = lt_list_global
*        CHANGING
*          ct_msg   = ct_msg
*          cv_rc    = cv_rc
*          cv_reqid = lv_reqid.
*    ENDIF.

  ENDMETHOD.


  METHOD bapi_create_bom_queue.


    DATA : lt_bom      TYPE /dlwupex/tbom_tt,
           lt_reqids   TYPE /dlwupex/treqids_tt,
           lt_gdata    TYPE /dlwupex/tgdata_tt,
           lt_list     TYPE /dlwupex/tlist_tt,
           lt_return   TYPE TABLE OF bapiret2,
           ls_msg      TYPE /dlwupex/tmsg,
           ls_gdata    TYPE /dlwupex/tgdata,
           ls_return   TYPE bapiret2,
           lv_material TYPE matnr,
           lv_rownb    TYPE int4,
           lv_reqid    TYPE /dlwupex/ereqid,
           lv_rc       TYPE sysubrc.


**********************************************************************
**************************** BOM MANAGE ******************************
**********************************************************************

    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

    CALL FUNCTION 'BAPI_MATERIAL_BOM_GROUP_CREATE'
      EXPORTING
        all_error         = 'X'
      TABLES
        bomgroup          = ct_bomgroup
        variants          = ct_variants
        items             = ct_items
        materialrelations = ct_materialrelations
        itemassignments   = ct_itemassignments
        return            = lt_return.

    IF lt_return[] IS NOT INITIAL.
      CLEAR : ls_msg, ls_return, lv_rownb.
      SORT lt_return.
      DELETE ADJACENT DUPLICATES FROM lt_return.
      LOOP AT lt_return INTO ls_return.
        IF ls_return-type EQ 'E'.
          lv_rownb = lv_rownb + 1.
*             On remplit la table de message d'erreur.
          ls_msg-id         = iv_bu.
          ls_msg-reqid      = iv_reqid.
          ls_msg-matnr      = iv_artkey.
          ls_msg-rownb      = lv_rownb.
          ls_msg-viewname   = gc_bomview.
          ls_msg-type       = ls_return-type.
          ls_msg-idmsg      = ls_return-id.
          ls_msg-num        = ls_return-number.
          ls_msg-message    = ls_return-message.
          APPEND ls_msg TO ct_msg.
          lv_rc = 4.
        ENDIF.

      ENDLOOP.

    ENDIF.
    IF lv_rc IS NOT INITIAL.
      CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.

      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
        EXPORTING
          iv_status = gc_statusinerror
        CHANGING
          ct_bom    = ct_bom
          ct_reqids = lt_reqids
          cv_rc     = cv_rc.

      CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
        EXPORTING
          it_msg = ct_msg
        CHANGING
          cv_rc  = cv_rc
          ct_msg = ct_msg.
      COMMIT WORK AND WAIT.

      DATA(lv_error) = abap_true.

    ELSE.
*     Commit creation
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'.
      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
        EXPORTING
          iv_status = gc_statuscompleted
        CHANGING
          ct_bom    = ct_bom
          cv_rc     = cv_rc.
    ENDIF.

    IF  lv_error = abap_true.
      CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
        EXPORTING
          it_reqids        = lt_reqids
          iv_change_reqids = 'X'
        CHANGING
          ct_msg           = ct_msg
          cv_rc            = cv_rc.
    ENDIF.

* Gestion du Step
    CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
      EXPORTING
        iv_bu      = iv_bu
        iv_reqid   = iv_reqid
        iv_art_key = iv_artkey
      CHANGING
*       ct_unit    =
*       ct_caract  =
*       ct_bom     = lt_bom
        ct_list    = lt_list
*       ct_fia     =
*       ct_srlist  =
*       ct_sale    =
*       ct_logdc   =
*       ct_logsto  =
        ct_gdata   = lt_gdata
*       ct_msg_ch  =
        cv_rc      = lv_rc.

* uniquement si erreur et pas de listing sur l'article
    IF lv_error = abap_false AND lt_list IS INITIAL.
      LOOP AT lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
        <fs_gdata>-step = <fs_gdata>-step + 1.
      ENDLOOP.
      CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
        EXPORTING
          it_gdata           = lt_gdata
          iv_change_worklist = abap_true
        CHANGING
          ct_msg             = ct_msg
          cv_rc              = cv_rc.
    ENDIF.


* mise à jour réserve de travail
    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu    = iv_bu
        it_bom   = ct_bom
        it_gdata = lt_gdata
      CHANGING
        ct_msg   = ct_msg
        cv_rc    = cv_rc
        cv_reqid = lv_reqid.


  ENDMETHOD.


  METHOD bapi_create_fia.

    DATA : lt_fia        TYPE /dlwupex/tfia_tt,
           ls_fia        TYPE /dlwupex/tfia,
           lt_gdata      TYPE /dlwupex/tgdata_tt,
           lt_unit       TYPE /dlwupex/tunit_tt,
           lt_reqids     TYPE /dlwupex/treqids_tt,
           lt_eina       TYPE TABLE OF eina,
           lt_eine       TYPE TABLE OF eine,
           ls_eina       TYPE eina,
           ls_eina_empty TYPE eina,
           ls_eina_expor TYPE eina,
           ls_eine_expor TYPE eine,
           ls_eine       TYPE eine,
           ls_eine_empty TYPE eine,
           ls_msg        TYPE /dlwupex/tmsg,
           lv_reqid      TYPE /dlwupex/ereqid,
           lv_status     TYPE /dlwupex/elinestatus,
           lt_head       TYPE TABLE OF mestxh,
           lt_line       TYPE TABLE OF mestxl.

    CLEAR : ls_fia, ls_eina, ls_eine, ls_msg, lv_status, lv_reqid.
    REFRESH : lt_fia.
*    UNASSIGN : .

    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

*   Retrieve the contain of FIA
    CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
      EXPORTING
        iv_bu      = iv_bu
        iv_reqid   = iv_reqid
        iv_art_key = iv_matnr
      CHANGING
        ct_fia     = lt_fia
        ct_gdata   = lt_gdata
        ct_unit    = lt_unit
        cv_rc      = cv_rc.

    IF lt_fia[] IS NOT INITIAL.


      READ TABLE lt_gdata INTO DATA(ls_gdata) INDEX 1.

      CLEAR ls_fia.
      LOOP AT lt_fia INTO ls_fia.

        READ TABLE lt_unit INTO DATA(ls_unit)
          WITH KEY meinh = ls_fia-meins.

        CLEAR : ls_eine, ls_eina.
        ls_eina-mandt = sy-mandt.
        ls_eina-matnr = ls_fia-matnr.
        ls_eina-lifnr = ls_fia-lifnr.
        ls_eina-matkl = ls_gdata-matkl.
        ls_eina-erdat = sy-datum.
        ls_eina-ernam = sy-uname.
        ls_eina-meins = ls_fia-meins.
        ls_eina-umrez = ls_unit-umrez.
        ls_eina-umren = ls_unit-umren.
        ls_eina-urzla = ls_fia-urzla.
        ls_eina-lmein = ls_fia-meins.
        CLEAR ls_eina-vabme.
        "ls_eina-ltsnr = '000000'.
*        ls_eina-lifab = sy-datum.
*        ls_eina-lifbi = '99991231'.
        ls_eina-relif = ls_fia-relif.
        ls_eina-ltsnr = ls_fia-ltsnr.
        ls_eina-rueck = ls_fia-rueck.
        ls_eina-urzla = ls_fia-urzla.
        ls_eina-regio = ls_fia-regio.
        ls_eina-idnlf = ls_fia-idnlf.

        TRANSLATE ls_eina-idnlf TO UPPER CASE.

        ls_eine-ekorg = ls_fia-ekorg.
        ls_eine-erdat = sy-datum.
        ls_eine-ernam = sy-uname.
        ls_eine-waers = ls_fia-konwa.
        ls_eine-ekgrp = ls_fia-ekgrp.
        ls_eine-aplfz = ls_fia-aplfz.
        ls_eine-minbm = ls_fia-minbm.
        ls_eine-bstma = ls_fia-bstma.
        ls_eine-untto = ls_fia-untto.
        ls_eine-uebto = ls_fia-uebto.
        ls_eine-uebtk = ls_fia-uebtk.
        ls_eine-netpr = ls_fia-kbetr.
        ls_eine-peinh = ls_fia-kpein.
        ls_eine-bprme = ls_fia-meins.
        ls_eine-bpumz = ls_unit-umrez.
        ls_eine-bpumn = ls_unit-umren.
        ls_eine-bstae = ls_fia-bstae.
        ls_eine-meprf = ls_fia-meprf.
        ls_eine-inco1 = ls_fia-inco1.
        ls_eine-inco2 = ls_fia-inco2.
        ls_eine-webre = ls_fia-webre.
        ls_eine-inco2_l = ls_fia-inco2_l.


        CALL FUNCTION 'ME_DIRECT_INPUT_INFORECORD'
          EXPORTING
            activity         = 'A'
            i_eina           = ls_eina
            i_eine           = ls_eine
            i_no_suppose     = 'X'
            i_vorga          = 'B'
          IMPORTING
            e_eina           = ls_eina_expor
            e_eine           = ls_eine_expor
          TABLES
            t_head           = lt_head
            t_line           = lt_line
          EXCEPTIONS
            textname_invalid = 1
            error_message    = 2
            OTHERS           = 3.
        IF sy-subrc EQ 0.
          CALL FUNCTION 'ME_POST_INFORECORD'
            EXPORTING
              i_matnr = ls_fia-matnr.

          COMMIT WORK AND WAIT.
        ELSE.
*     On remplit la table de message d'erreur.
          ls_msg-id         = iv_bu.
          ls_msg-reqid      = iv_reqid.
          ls_msg-matnr      = iv_matnr.
          ls_msg-line       = ls_fia-line.
          ls_msg-viewname   = '06'.
          ls_msg-field      = 'FIA'.
          ls_msg-type       = sy-msgty.
          ls_msg-idmsg      = sy-msgid.
          ls_msg-num        = sy-msgno.
          ls_msg-message_v1      = sy-msgv1.
          ls_msg-message_v2      = sy-msgv2.
          ls_msg-message_v3      = sy-msgv3.
          ls_msg-message_v4      = sy-msgv4.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                  INTO ls_msg-message
                  WITH ls_msg-message_v1 ls_msg-message_v2 ls_msg-message_v3 ls_msg-message_v4.
          APPEND ls_msg TO ct_msg.
          cv_rc = 4.
          EXIT.
        ENDIF.
      ENDLOOP.


** suppression des erreurs
*      DELETE FROM /dlwupex/tmsg
*              WHERE id = iv_bu AND
*                    reqid = iv_reqid AND
*                    viewname = '06' AND
*                    matnr = iv_matnr.

      IF cv_rc IS NOT INITIAL.
*        lv_status = gc_statusinerror.

        CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
          EXPORTING
            it_msg = ct_msg
          CHANGING
            cv_rc  = cv_rc
            ct_msg = ct_msg.

        CALL METHOD /dlwupex/cl_cockpit_article=>change_status
          EXPORTING
            iv_status = gc_statusinerror
          CHANGING
            ct_fia    = lt_fia
            ct_reqids = lt_reqids
            cv_rc     = cv_rc.


        CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
          EXPORTING
            iv_bu    = iv_bu
            it_fia   = lt_fia
          CHANGING
            ct_msg   = ct_msg
            cv_rc    = cv_rc
            cv_reqid = lv_reqid.

        CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
          EXPORTING
            it_reqids        = lt_reqids
            iv_change_reqids = abap_true
          CHANGING
            ct_msg           = ct_msg
            cv_rc            = cv_rc.

      ELSE.

*        lv_status = gc_statuscompleted.
        CALL METHOD /dlwupex/cl_cockpit_article=>change_status
          EXPORTING
            iv_status = gc_statuscompleted
          CHANGING
            ct_fia    = lt_fia
*           ct_reqids = lt_reqids
            cv_rc     = cv_rc.

        lv_reqid = iv_reqid.

        CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
          EXPORTING
            iv_bu    = iv_bu
            it_fia   = lt_fia
          CHANGING
            ct_msg   = ct_msg
            cv_rc    = cv_rc
            cv_reqid = lv_reqid.

      ENDIF.


    ENDIF.
  ENDMETHOD.


  METHOD bapi_create_fia_pricing.

    DATA :
      lt_fia      TYPE /dlwupex/tfia_tt,
      lt_gdata    TYPE /dlwupex/tgdata_tt,
      lt_reqids   TYPE /dlwupex/treqids_tt,
      lt_messages TYPE bapiret2_t,
      ls_msg      TYPE /dlwupex/tmsg,
      lv_status   TYPE /dlwupex/elinestatus,
      lv_reqid    TYPE /dlwupex/ereqid,
      t_params    TYPE abap_parmbind_tab,
      l_param     TYPE abap_parmbind.
    DATA : ls_cond_change TYPE /dlwupex/price_cond.
*          lt_bapict      TYPE TABLE OF bapicondct,
*           ls_bapict      TYPE bapicondct,
*           lt_bapihd      TYPE TABLE OF bapicondhd,
*           ls_bapihd      TYPE bapicondhd,
*           lt_bapiit      TYPE TABLE OF bapicondit,
*           ls_bapiit      TYPE bapicondit,
*           lt_bapiqs      TYPE TABLE OF bapicondqs,
*           ls_bapiqs      TYPE bapicondqs,
*           lt_bapivs      TYPE TABLE OF bapicondvs,
*           ls_bapivs      TYPE bapicondvs,
*           lt_bapiknumhs  TYPE TABLE OF bapiknumhs,
*           ls_bapiknumhs  TYPE bapiknumhs,
*           lt_mem_initial TYPE TABLE OF cnd_mem_initial,
*           ls_mem_initial TYPE cnd_mem_initial.

    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

*** Alimentation des paramètres pour appel de méthode de récupération de données articles
    l_param-name = 'IV_BU'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_bu INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'IV_REQID'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_reqid INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'IV_ART_KEY'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_matnr INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'CV_RC'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF cv_rc INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

* Tables pour récupération des données articles
*     /DLWUPEX/TFIA
    CLEAR l_param.
    l_param-name = 'CT_FIA'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_fia INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

*     /DLWUPEX/Tgdata
    CLEAR l_param.
    l_param-name = 'CT_GDATA'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_gdata INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CALL METHOD ('/DLWUPEX/CL_COCKPIT_ARTICLE')=>read_data_from_matnr
      PARAMETER-TABLE
      t_params.

    LOOP AT lt_fia ASSIGNING FIELD-SYMBOL(<fs_fia>).

      REFRESH : lt_messages.
      CLEAR ls_cond_change.
*      REFRESH : lt_bapict, lt_bapihd, lt_bapiit, lt_bapiqs, lt_bapivs,
*                lt_messages, lt_bapiknumhs, lt_mem_initial.

      CHECK <fs_fia>-kbetr IS NOT INITIAL.

*      ls_bapict-operation = '009'.
*      ls_bapict-cond_usage = 'A'.
*      ls_bapict-table_no = '018'.
*      ls_bapict-applicatio = 'M'.
*      ls_bapict-cond_type = 'PB00'.
*      CONCATENATE <fs_fia>-lifnr <fs_fia>-matnr <fs_fia>-ekorg '0'
*        INTO ls_bapict-varkey.
*      ls_bapict-valid_to = '99991231'.
*      ls_bapict-valid_from = sy-datum.
*      ls_bapict-cond_no = '$000000001'.
*      APPEND ls_bapict TO lt_bapict.
*
*      ls_bapihd-operation = '009'.
*      ls_bapihd-cond_no = '$000000001'.
*      ls_bapihd-created_by = sy-uname.
*      ls_bapihd-creat_date = sy-datum.
*      ls_bapihd-cond_usage = 'A'.
*      ls_bapihd-table_no = '018'.
*      ls_bapihd-applicatio = 'M'.
*      ls_bapihd-cond_type = 'PB00'.
*      ls_bapihd-varkey = ls_bapict-varkey.
*      ls_bapihd-valid_from = sy-datum.
*      ls_bapihd-valid_to = '99991231'.
*      APPEND ls_bapihd TO lt_bapihd.
*
*      ls_bapiit-operation = '009'.
*      ls_bapiit-cond_no = '$000000001'.
*      ls_bapiit-cond_count = '01'.
*      ls_bapiit-applicatio = 'M'.
*      ls_bapiit-cond_type = 'PB00'.
*      ls_bapiit-cond_p_unt = <fs_fia>-kpein.
*      ls_bapiit-cond_unit = <fs_fia>-kmein.
*      ls_bapiit-base_uom = <fs_fia>-kmein.
*      ls_bapiit-calctypcon = 'C'.
*      ls_bapiit-cond_value = <fs_fia>-kbetr.
*      ls_bapiit-condcurr = <fs_fia>-konwa.
*      ls_bapiit-condcurren = <fs_fia>-konwa.
*      ls_bapiit-relprcg = 'X'.
*      APPEND ls_bapiit TO lt_bapiit.
*
*      CALL FUNCTION 'BAPI_PRICES_CONDITIONS'
*        TABLES
*          ti_bapicondct  = lt_bapict
*          ti_bapicondhd  = lt_bapihd
*          ti_bapicondit  = lt_bapiit
*          ti_bapicondqs  = lt_bapiqs
*          ti_bapicondvs  = lt_bapivs
*          to_bapiret2    = lt_messages
*          to_bapiknumhs  = lt_bapiknumhs
*          to_mem_initial = lt_mem_initial
*        EXCEPTIONS
*          update_error   = 1
*          OTHERS         = 2.

      SELECT SINGLE isocode INTO @DATA(lv_isocode) FROM t006
        WHERE msehi = @<fs_fia>-kmein.

      ls_cond_change-cond_usage = 'A'.
      ls_cond_change-table_no = '018'.
      ls_cond_change-applicatio = 'M'.
      ls_cond_change-cond_type = 'PB00'.
      CONCATENATE <fs_fia>-lifnr <fs_fia>-matnr <fs_fia>-ekorg '0'
        INTO ls_cond_change-varkey.
      ls_cond_change-valid_to = '99991231'.
      ls_cond_change-valid_from = sy-datum.
      ls_cond_change-cond_p_unt = <fs_fia>-kpein.
      ls_cond_change-cond_unit = lv_isocode.
      ls_cond_change-base_uom = lv_isocode.
      ls_cond_change-cond_value = <fs_fia>-kbetr.
      ls_cond_change-condcurr = <fs_fia>-konwa.

      CALL FUNCTION '/DLWUPEX/COCKPIT_CHANGE_PRICE'
        EXPORTING
          is_cond    = ls_cond_change
        IMPORTING
          et_message = lt_messages.
      IF lt_messages[] IS NOT INITIAL.
        CLEAR : ls_msg.
        LOOP AT lt_messages INTO DATA(ls_messages).
          IF ls_messages-type EQ 'E'.
*           On remplit la table de message d'erreur.
            ls_msg-id         = iv_bu.
            ls_msg-reqid      = iv_reqid.
            ls_msg-matnr      = iv_matnr.
            ls_msg-viewname   = gc_fiaview.
            ls_msg-type       = ls_messages-type.
            ls_msg-idmsg      = ls_messages-id.
            ls_msg-num        = ls_messages-number.
            ls_msg-message    = ls_messages-message.
            APPEND ls_msg TO ct_msg.
            cv_rc = 4.
            EXIT.
          ENDIF.

        ENDLOOP.
      ENDIF.
    ENDLOOP.


    CLEAR lv_status.
    IF cv_rc IS NOT INITIAL.
*      lv_status = gc_statusinerror.

      CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
        EXPORTING
          it_msg = ct_msg
        CHANGING
          cv_rc  = cv_rc
          ct_msg = ct_msg.

      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
        EXPORTING
          iv_status = gc_statusinerror
        CHANGING
          ct_fia    = lt_fia
          ct_gdata  = lt_gdata
          ct_reqids = lt_reqids
          cv_rc     = cv_rc.

      CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
        EXPORTING
          iv_bu    = iv_bu
          it_fia   = lt_fia
          it_gdata = lt_gdata
        CHANGING
          ct_msg   = ct_msg
          cv_rc    = cv_rc
          cv_reqid = lv_reqid.

      CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
        EXPORTING
          it_reqids        = lt_reqids
          iv_change_reqids = abap_true
        CHANGING
          ct_msg           = ct_msg
          cv_rc            = cv_rc.
      COMMIT WORK AND WAIT.
      EXIT.
    ELSE.
      lv_status = gc_statuscompleted.
    ENDIF.

    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = lv_status
      CHANGING
        ct_fia    = lt_fia
        ct_gdata  = lt_gdata
        cv_rc     = cv_rc.


    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu    = iv_bu
        it_fia   = lt_fia
        it_gdata = lt_gdata
      CHANGING
        ct_msg   = ct_msg
        cv_rc    = cv_rc
        cv_reqid = lv_reqid.

    COMMIT WORK AND WAIT.


  ENDMETHOD.


  METHOD bapi_create_listing.

    DATA : lt_tab_wlk1 TYPE TABLE OF wlk1_ueb,
           lt_list     TYPE /dlwupex/tlist_tt,
           lt_list_bom TYPE /dlwupex/tlist_tt,
           ls_list     TYPE /dlwupex/tlist,
           lt_bom      TYPE /dlwupex/tbom_tt,
           ls_bom      TYPE /dlwupex/tbom,
           lt_reqids   TYPE /dlwupex/treqids_tt,
           ls_tab_wlk1 TYPE wlk1_ueb,
           ls_msg      TYPE /dlwupex/tmsg,
           lv_reqid    TYPE /dlwupex/ereqid,
           lt_error    TYPE TABLE OF  merrdat,
           ls_error    TYPE merrdat,
           lv_status   TYPE /dlwupex/elinestatus.
    DATA : lv_garg   TYPE eqegraarg,
           lt_enq    TYPE STANDARD TABLE OF seqg3,
           lv_number TYPE sy-tabix.


    REFRESH : lt_tab_wlk1, lt_list.
    CLEAR : ls_tab_wlk1, ls_list, ls_msg, lv_reqid, lv_status.

    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_reqids = lt_reqids
        ct_bom    = lt_bom
        cv_rc     = cv_rc.

    SORT lt_bom BY matnr.
    IF lt_bom IS NOT INITIAL.
      SELECT * FROM /dlwupex/tlist INTO TABLE lt_list_bom
        FOR ALL ENTRIES IN lt_bom
        WHERE id = iv_bu AND
              reqid = iv_reqid AND
              matnr = lt_bom-idnrk AND
              status <> gc_statuscompleted.
    ENDIF.
    SORT lt_list_bom BY matnr.

*   Retrieve the contain of Listing
    CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
      EXPORTING
        iv_bu      = iv_bu
        iv_reqid   = iv_reqid
        iv_art_key = iv_matnr
      CHANGING
        ct_list    = lt_list
        cv_rc      = cv_rc.


*** Test lock Article.
    READ TABLE lt_list INTO ls_list INDEX 1.

*    CONCATENATE sy-mandt ls_list-matnr INTO lv_garg.
*    DO 10 TIMES.
*      CLEAR lv_number.
*      CALL FUNCTION 'ENQUEUE_READ'
*        EXPORTING
*          gclient               = sy-mandt
*          garg                  = lv_garg
*        IMPORTING
*          number                = lv_number
*        TABLES
*          enq                   = lt_enq
*        EXCEPTIONS
*          communication_failure = 1
*          system_failure        = 2
*          OTHERS                = 3.
*      IF lv_number = 0 AND sy-subrc IS INITIAL.
*        EXIT.
*      ENDIF.
*      WAIT UP TO 1 SECONDS.
*    ENDDO.



    IF lt_list[] IS NOT INITIAL.
      CLEAR ls_list.
      LOOP AT lt_list INTO ls_list.
        READ TABLE lt_bom TRANSPORTING NO FIELDS
          WITH KEY matnr = ls_list-matnr
          BINARY SEARCH.
        IF sy-subrc IS NOT INITIAL.
          ls_tab_wlk1-filia    = ls_list-filia.
          ls_tab_wlk1-artnr    = ls_list-matnr.
          ls_tab_wlk1-datbi    = ls_list-datbi.
          ls_tab_wlk1-datab    = ls_list-datab.
          ls_tab_wlk1-strnr  = ls_list-matnr.
          ls_tab_wlk1-changeid = 'I'.
          ls_tab_wlk1-tranc    = 1.
          APPEND ls_tab_wlk1 TO lt_tab_wlk1.
        ELSE.
          DATA(lv_tabix) = sy-tabix.
          ls_tab_wlk1-filia    = ls_list-filia.
          ls_tab_wlk1-artnr    = ls_list-matnr.
          ls_tab_wlk1-datbi    = ls_list-datbi.
          ls_tab_wlk1-datab    = ls_list-datab.
          ls_tab_wlk1-strnr  = ls_list-matnr.
          ls_tab_wlk1-changeid = 'I'.
          ls_tab_wlk1-tranc    = 1.
          ls_tab_wlk1-strli    = 'H'.
          APPEND ls_tab_wlk1 TO lt_tab_wlk1.
          LOOP AT lt_bom INTO ls_bom FROM lv_tabix.
            IF ls_bom-matnr <> ls_list-matnr.
              EXIT.
            ENDIF.
            READ TABLE lt_list_bom TRANSPORTING NO FIELDS
              WITH KEY matnr = ls_bom-idnrk
              BINARY SEARCH.
            IF sy-subrc IS INITIAL.
              ls_msg-id         = iv_bu.
              ls_msg-reqid      = iv_reqid.
              ls_msg-matnr      = iv_matnr.
              ls_msg-viewname   = gc_listview.
              ls_msg-type       = 'E'.
              ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
              ls_msg-num        = 064.
              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message.
              APPEND ls_msg TO ct_msg.
              cv_rc = 4.
              EXIT.
            ENDIF.
            ls_tab_wlk1-filia    = ls_list-filia.
            ls_tab_wlk1-artnr    = ls_bom-idnrk.
            ls_tab_wlk1-datbi    = ls_list-datbi.
            ls_tab_wlk1-datab    = ls_list-datab.
            ls_tab_wlk1-strnr  = ls_list-matnr.
            ls_tab_wlk1-changeid = 'I'.
            ls_tab_wlk1-tranc    = 1.
            ls_tab_wlk1-strli    = 'X'.
            APPEND ls_tab_wlk1 TO lt_tab_wlk1.
          ENDLOOP.
        ENDIF.
        IF cv_rc IS NOT INITIAL.
          EXIT.
        ENDIF.
      ENDLOOP.
    ENDIF.

    IF lt_tab_wlk1 IS NOT INITIAL.
      SET UPDATE TASK LOCAL.
      CALL FUNCTION 'LISTING_COND_MAINTAIN_DARK'
        TABLES
          tab_wlk1     = lt_tab_wlk1
          amatnrerrdat = lt_error
        EXCEPTIONS
          OTHERS       = 1.
      IF sy-subrc IS NOT INITIAL.
        ROLLBACK WORK.
*         On remplit la table de message d'erreur.
        ls_msg-matnr      = iv_matnr.
        ls_msg-field      = 'LISTING'.
        ls_msg-type       = 'E'.
        ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
        ls_msg-num        = 042.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
      ELSE.
        COMMIT WORK.
        IF lt_error[] IS NOT INITIAL.
          CLEAR : ls_msg, ls_error.
          LOOP AT lt_error INTO ls_error.
            IF ls_error-msgty EQ 'E'.
*           On remplit la table de message d'erreur.
              ls_msg-id         = iv_bu.
              ls_msg-reqid      = iv_reqid.
              ls_msg-matnr      = iv_matnr.
              ls_msg-viewname   = gc_listview.
              ls_msg-type       = ls_error-msgty.
              ls_msg-idmsg      = ls_error-msgid.
              ls_msg-num        = ls_error-msgno.
              ls_msg-message_v1        = ls_error-msgv1.
              ls_msg-message_v2       = ls_error-msgv2.
              ls_msg-message_v3        = ls_error-msgv3.
              ls_msg-message_v4        = ls_error-msgv4.

              MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
              WITH ls_msg-message_v1 ls_msg-message_v2 ls_msg-message_v3 ls_msg-message_v4
                INTO ls_msg-message.

              APPEND ls_msg TO ct_msg.
              cv_rc = 4.
            ENDIF.

          ENDLOOP.
        ENDIF.
      ENDIF.
    ENDIF.

    IF cv_rc IS NOT INITIAL.
*      lv_status = gc_statusinerror.

      CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
        EXPORTING
          it_msg = ct_msg
        CHANGING
          cv_rc  = cv_rc
          ct_msg = ct_msg.

      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
        EXPORTING
          iv_status = gc_statusinerror
        CHANGING
          ct_list   = lt_list
          ct_reqids = lt_reqids
          cv_rc     = cv_rc.

      CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
        EXPORTING
          iv_bu    = iv_bu
          it_list  = lt_list
        CHANGING
          ct_msg   = ct_msg
          cv_rc    = cv_rc
          cv_reqid = lv_reqid.

      CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
        EXPORTING
          it_reqids        = lt_reqids
          iv_change_reqids = abap_true
        CHANGING
          ct_msg           = ct_msg
          cv_rc            = cv_rc.

    ELSE.
*      lv_status = gc_statuscompleted.
      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
        EXPORTING
          iv_status = gc_statuscompleted
        CHANGING
          ct_list   = lt_list
          cv_rc     = cv_rc.

      CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
        EXPORTING
          iv_bu    = iv_bu
          it_list  = lt_list
        CHANGING
          ct_msg   = ct_msg
          cv_rc    = cv_rc
          cv_reqid = lv_reqid.
    ENDIF.



  ENDMETHOD.


  METHOD bapi_create_listing_bis.

    DATA : lt_queue      TYPE /sapapo/cif_trfcqview_tt,
           lv_inprogress TYPE xfeld,
           lv_qname      TYPE trfcqnam,
           lv_qname_me   TYPE trfcqnam,
           ls_msg        TYPE /dlwupex/tmsg,
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
             WHERE name = 'QUEUE_PREFIXE'.
    IF sy-subrc IS NOT INITIAL.
      ls_msg-type = 'E'.
      ls_msg-idmsg = gc_classmsg.
      ls_msg-num = '023'.
      ls_msg-message_v1 = '/DLWUPEX/TCUSTO'.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message WITH ls_msg-message_v1.
      APPEND ls_msg TO ct_msg.
      cv_rc = 4.
      EXIT.
    ENDIF.

    DATA(lv_reqid_short) = iv_reqid.
    SHIFT lv_reqid_short LEFT DELETING LEADING '0'.

    CONCATENATE lv_value 'RT' lv_reqid_short '*' INTO lv_qname.
    CONCATENATE lv_value 'RT' lv_reqid_short '/' iv_matnr INTO lv_qname_me.



    REFRESH lt_queue.
    CALL FUNCTION 'TRFC_QIN_OVERVIEW_STATES'
      EXPORTING
        qname = lv_qname
      TABLES
        qview = lt_queue.


    SORT lt_queue BY qstate.
    DELETE lt_queue WHERE qstate IN lrt_qstate.
    DELETE lt_queue WHERE qname = lv_qname_me.

    IF lt_queue IS NOT INITIAL.
      lv_inprogress = 'X'.
    ELSE.
      CLEAR lv_inprogress.
    ENDIF.

    CONCATENATE lv_value 'LIST_' 'RT' lv_reqid_short INTO lv_qname.

    IF lv_inprogress IS INITIAL.
      REFRESH lt_queue.
      CALL FUNCTION 'TRFC_QIN_OVERVIEW_STATES'
        EXPORTING
          qname = lv_qname
        TABLES
          qview = lt_queue.

      IF lt_queue IS NOT INITIAL.
        CALL FUNCTION 'TRFC_QIN_RESET_LUW'
          EXPORTING
            qname                          = lv_qname
*           TID                            =
*           ALL_LUWS                       = ' '
*           NO_COMMIT                      = ' '
          EXCEPTIONS
            invalid_parameter              = 1
            reset_of_runningstate_rejected = 2
            OTHERS                         = 3.
        IF sy-subrc <> 0.
* Implement suitable error handling here
        ENDIF.
        COMMIT WORK AND WAIT.
        EXIT.
      ENDIF.
    ENDIF.

    cv_rc = 2. " ne pas modifier le step



  ENDMETHOD.


  METHOD bapi_create_listing_queue.


    DATA : lt_list              TYPE /dlwupex/tlist_tt,
           lt_reqids            TYPE /dlwupex/treqids_tt,
           lt_gdata             TYPE /dlwupex/tgdata_tt,
           ls_msg               TYPE /dlwupex/tmsg,
           ls_return            TYPE bapiret2,
           lv_rownb             TYPE int4,
           lv_count             TYPE i,
           lv_string            TYPE string,
           lv_cmpt_str          TYPE c LENGTH 3,
           lv_reqid             TYPE /dlwupex/ereqid,
           lv_rc                TYPE sysubrc,
           lt_error             TYPE TABLE OF  merrdat,
           ls_error             TYPE merrdat,
           lv_comp              TYPE idnrk,
           lt_tab_wlk1          TYPE TABLE OF wlk1_ueb,
           ls_tab_wlk1          TYPE wlk1_ueb.


**********************************************************************
************************** LISTING MANAGE ****************************
**********************************************************************

    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_gdata  = lt_gdata
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

* Gestion de la Partie BOM / et classique

    REFRESH lt_error.
    SET UPDATE TASK LOCAL.
    CALL FUNCTION 'LISTING_COND_MAINTAIN_DARK'
      EXPORTING
        p_create_change_document = 'X'
      TABLES
        tab_wlk1                 = ct_tab_wlk1
        amatnrerrdat             = lt_error
      EXCEPTIONS
        OTHERS                   = 1.
    IF sy-subrc IS NOT INITIAL.
      ROLLBACK WORK.
*         On remplit la table de message d'erreur.
      ls_msg-matnr      = iv_artkey.
      ls_msg-field      = 'LISTING'.
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
      ls_msg-num        = 042.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
              INTO ls_msg-message.
      APPEND ls_msg TO ct_msg.
      lv_rc = 4.
    ELSE.
      COMMIT WORK AND WAIT.
      IF lt_error[] IS NOT INITIAL.
        CLEAR : ls_msg, ls_error.
        LOOP AT lt_error INTO ls_error.
          IF ls_error-msgty EQ 'E'.
*           On remplit la table de message d'erreur.
            ls_msg-id         = iv_bu.
            ls_msg-reqid      = iv_reqid.
            ls_msg-matnr      = iv_artkey.
            ls_msg-viewname   = gc_listview.
            ls_msg-type       = ls_error-msgty.
            ls_msg-idmsg      = ls_error-msgid.
            ls_msg-num        = ls_error-msgno.
            ls_msg-message_v1        = ls_error-msgv1.
            ls_msg-message_v2       = ls_error-msgv2.
            ls_msg-message_v3        = ls_error-msgv3.
            ls_msg-message_v4        = ls_error-msgv4.

            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            WITH ls_msg-message_v1 ls_msg-message_v2 ls_msg-message_v3 ls_msg-message_v4
              INTO ls_msg-message.

            APPEND ls_msg TO ct_msg.
            lv_rc = 4.
          ENDIF.

        ENDLOOP.
      ENDIF.
    ENDIF.
    IF lv_rc IS NOT  INITIAL.
      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
        EXPORTING
          iv_status = gc_statusinerror
        CHANGING
          ct_list   = ct_list
          ct_reqids = lt_reqids
          cv_rc     = cv_rc.

      CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
        EXPORTING
          it_msg = ct_msg
        CHANGING
          cv_rc  = cv_rc
          ct_msg = ct_msg.

      DATA(lv_error) = abap_true.

    ELSE.
      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
        EXPORTING
          iv_status = gc_statuscompleted
        CHANGING
          ct_list   = ct_list
          cv_rc     = cv_rc.
    ENDIF.

    REFRESH : lt_tab_wlk1.

    IF lv_error = abap_true.
      CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
        EXPORTING
          it_reqids        = lt_reqids
          iv_change_reqids = 'X'
        CHANGING
          ct_msg           = ct_msg
          cv_rc            = cv_rc.
    ENDIF.

* Gestion du Step
    CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
      EXPORTING
        iv_bu      = iv_bu
        iv_reqid   = iv_reqid
        iv_art_key = iv_artkey
      CHANGING
*       ct_unit    =
*       ct_caract  =
*       ct_bom     =
*       ct_fia     =
*       ct_list    =
*       ct_srlist  =
*       ct_sale    =
*       ct_logdc   =
*       ct_logsto  =
        ct_gdata   = lt_gdata
*       ct_msg_ch  =
        cv_rc      = lv_rc.


    IF lv_error = abap_false.
      LOOP AT lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
        <fs_gdata>-step = <fs_gdata>-step + 1.
      ENDLOOP.
      CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
        EXPORTING
          it_gdata           = lt_gdata
          iv_change_worklist = abap_true
        CHANGING
          ct_msg             = ct_msg
          cv_rc              = cv_rc.
    ENDIF.

* mise à jour réserve de travail
    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu    = iv_bu
        it_list  = ct_list
        it_gdata = lt_gdata
      CHANGING
        ct_msg   = ct_msg
        cv_rc    = cv_rc
        cv_reqid = lv_reqid.

  ENDMETHOD.


METHOD bapi_create_material.

  TYPES : BEGIN OF ty_views,
            viewname TYPE /dlwupex/eviewname,
          END OF ty_views.


  DATA : lv_object     TYPE REF TO /dlwupex/if_cockpit_article.

  DATA : lt_ale2wt                 TYPE TABLE OF /dlwupex/tale2wt,
         lt_ale2wt_bis             TYPE TABLE OF /dlwupex/tale2wt,
         ls_msg                    TYPE /dlwupex/tmsg,
         lt_msg                    TYPE /dlwupex/tmsg_tt,
         lt_gdata	                 TYPE /dlwupex/tgdata_tt,
         lt_unit                   TYPE /dlwupex/tunit_tt,
         lt_caract                 TYPE /dlwupex/tcaract_tt,
         lt_bom                    TYPE /dlwupex/tbom_tt,
         lt_fia                    TYPE /dlwupex/tfia_tt,
         lt_list                   TYPE /dlwupex/tlist_tt,
         lt_srlist                 TYPE /dlwupex/tsrlist_tt,
         lt_sale                   TYPE /dlwupex/tsale_tt,
         lt_logdc                  TYPE /dlwupex/tlogdc_tt,
         lt_logsto                 TYPE /dlwupex/tlogsto_tt,
         lt_reqids                 TYPE /dlwupex/treqids_tt,
         lt_taxe                   TYPE /dlwupex/ttaxe_tt,
         lt_tbuhead                TYPE /dlwupex/tbuhead_tt,
*           lt_select                 TYPE TABLE OF ty_select,
*           ls_select                 TYPE ty_select,
         lt_fields                 TYPE TABLE OF tabfldname,
         lt_marakey                TYPE bdimarakey_tab,
         ls_marakey                TYPE bdimarakey,
         ls_headdata               TYPE bapie1mathead,
         ls_return                 TYPE bapireturn1,
         lv_mestyp                 TYPE edi_mestyp,
         lt_characteristicvalue    TYPE TABLE OF bapie1ausprt,
         lt_characteristicvaluex   TYPE TABLE OF bapie1ausprtx,
         lt_clientdata             TYPE TABLE OF bapie1marart,
         lt_clientdatax            TYPE TABLE OF bapie1marartx,
         lt_clientext              TYPE TABLE OF bapie1maraextrt,
         lt_clientextx             TYPE TABLE OF bapie1maraextrtx,
         lt_addnlclientdata        TYPE TABLE OF bapie1maw1rt,
         lt_addnlclientdatax       TYPE TABLE OF bapie1maw1rtx,
         lt_materialdescription    TYPE TABLE OF bapie1maktrt,
         lt_plantdata              TYPE TABLE OF bapie1marcrt,
         lt_plantdata_bis          TYPE TABLE OF bapie1marcrt,
         lt_plantdatax             TYPE TABLE OF bapie1marcrtx,
         lt_plantext               TYPE TABLE OF bapie1marcextrt,
         lt_plantextx              TYPE TABLE OF bapie1marcextrtx,
         lt_forecastparameters     TYPE TABLE OF bapie1mpoprt,
         lt_forecastparametersx    TYPE TABLE OF bapie1mpoprtx,
         lt_forecastvalues         TYPE TABLE OF bapie1mprwrt,
         lt_totalconsumption       TYPE TABLE OF bapie1mvegrt,
         lt_unplndconsumption      TYPE TABLE OF bapie1mveurt,
         lt_planningdata           TYPE TABLE OF bapie1mpgdrt,
         lt_planningdatax          TYPE TABLE OF bapie1mpgdrtx,
         lt_storagelocationdata    TYPE TABLE OF bapie1mardrt,
         lt_storagelocationdatax   TYPE TABLE OF bapie1mardrtx,
         lt_storagelocationext     TYPE TABLE OF bapie1mardextrt,
         lt_storagelocationextx    TYPE TABLE OF bapie1mardextrtx,
         lt_unitsofmeasure         TYPE TABLE OF bapie1marmrt,
         lt_unitsofmeasurex        TYPE TABLE OF bapie1marmrtx,
         lt_unitofmeasuretexts     TYPE TABLE OF bapie1mamtrt,
         lt_internationalartnos    TYPE TABLE OF bapie1meanrt,
         lt_vendorean              TYPE TABLE OF bapie1mleart,
         lt_layoutmoduleassgmt     TYPE TABLE OF bapie1malgrt,
         lt_layoutmoduleassgmtx    TYPE TABLE OF bapie1malgrtx,
         lt_taxclassifications     TYPE TABLE OF bapie1mlanrt,
         lt_valuationdata          TYPE TABLE OF bapie1mbewrt,
         lt_valuationdatax         TYPE TABLE OF bapie1mbewrtx,
         lt_valuationext           TYPE TABLE OF bapie1mbewextrt,
         lt_valuationextx          TYPE TABLE OF bapie1mbewextrtx,
         lt_warehousenumberdata    TYPE TABLE OF bapie1mlgnrt,
         lt_warehousenumberdatax   TYPE TABLE OF bapie1mlgnrtx,
         lt_warehousenumberext     TYPE TABLE OF bapie1mlgnextrt,
         lt_warehousenumberextx    TYPE TABLE OF bapie1mlgnextrtx,
         lt_storagetypedata        TYPE TABLE OF bapie1mlgtrt,
         lt_storagetypedatax       TYPE TABLE OF bapie1mlgtrtx,
         lt_storagetypeext         TYPE TABLE OF bapie1mlgtextrt,
         lt_storagetypeextx        TYPE TABLE OF bapie1mlgtextrtx,
         lt_salesdata              TYPE TABLE OF bapie1mvkert,
         lt_salesdatax             TYPE TABLE OF bapie1mvkertx,
         lt_salesext               TYPE TABLE OF bapie1mvkeextrt,
         lt_salesextx              TYPE TABLE OF bapie1mvkeextrtx,
         lt_posdata                TYPE TABLE OF bapie1wlk2rt,
         lt_posdatax               TYPE TABLE OF bapie1wlk2rtx,
         lt_posext                 TYPE TABLE OF bapie1wlk2extrt,
         lt_posextx                TYPE TABLE OF bapie1wlk2extrtx,
         lt_materiallongtext       TYPE TABLE OF bapie1mltxrt,
         lt_plantkeys              TYPE TABLE OF bapie1wrkkey,
         lt_storagelocationkeys    TYPE TABLE OF bapie1lgokey,
         lt_distrchainkeys         TYPE TABLE OF bapie1vtlkey,
         lt_warehousenokeys        TYPE TABLE OF bapie1lgnkey,
         lt_storagetypekeys        TYPE TABLE OF bapie1lgtkey,
         lt_valuationtypekeys      TYPE TABLE OF bapie1bwakey,
         lt_textilecomponents      TYPE TABLE OF bapitextlcomp,
         lt_fibercodes             TYPE TABLE OF bapitextlfibr,
         lt_segsalesstatus         TYPE TABLE OF bapisgtmvke,
         lt_segweightvolume        TYPE TABLE OF bapisgtmarm,
         lt_segvaluationtype       TYPE TABLE OF bapisgtmadka,
         lt_seasons                TYPE TABLE OF bapifshseasons,
         lt_segwarehousenumberdata TYPE TABLE OF bapisgtmlgn,
         lt_segstoragetypedata     TYPE TABLE OF bapisgtmlgt,
         lt_segmrpgeneraldata      TYPE TABLE OF bapisgtmrpgn,
         lt_segmrpquantitydata     TYPE TABLE OF bapisgtmrp,
         lv_tabname                TYPE tabname,
         lv_key                    TYPE string,
         lt_bapi                   TYPE REF TO data,
         lt_table                  TYPE REF TO data,
         t_params                  TYPE abap_parmbind_tab,
         l_param                   TYPE abap_parmbind,
         lv_mtart                  TYPE mtart,
         lv_art                    TYPE matnr,
         lv_ref_art                TYPE matnr,
         lt_taddi                  TYPE TABLE OF wtaddi,
         lt_return                 TYPE TABLE OF bapiret2,
         lt_maintaindata           TYPE TABLE OF bapie1wta01,
         ls_maintaindata           TYPE bapie1wta01,
         lv_tabix                  TYPE sytabix,
         lv_reqid                  TYPE /dlwupex/ereqid,
         lt_lognumbers             TYPE szal_lognumbers,
         ls_lognumbers             TYPE szal_lognumber,
         lt_message                TYPE TABLE OF balm,
         ls_message                TYPE balm,
         lt_tfields                TYPE /dlwupex/tfields_tt,
         lv_tabcusto               TYPE tabname16,
         lv_tabfield               TYPE fieldname,
         lt_dfies_tab              TYPE TABLE OF dfies,
         lt_view                   TYPE TABLE OF ty_views,
         ls_view                   TYPE ty_views,
         lv_atnam                  TYPE atnam,
         lv_sitesto                TYPE werks_d,
         lv_sitedc                 TYPE werks_d,
         lt_t001w                  TYPE TABLE OF t001w,
         lt_tvkov                  TYPE TABLE OF tvkov,
         new_line                  TYPE REF TO data,
         lv_nocheck                TYPE xflag.

  FIELD-SYMBOLS: <lt_itab>      TYPE table,
                 <lt_itab2>     TYPE ANY TABLE,
                 <lt_itab_bis>  TYPE table,
                 <fs_itab>      TYPE any,
                 <fs_itab2>     TYPE any,
                 <fs_field>     TYPE any,
                 <fs_field_bis> TYPE any,
                 <fs_mat>       TYPE any,
                 <fs_key>       TYPE any,
                 <fs_key1>      TYPE any,
                 <fs_key_bis>   TYPE any,
                 <fs_key1_bis>  TYPE any.

  CONSTANTS : lc_create TYPE msgfn VALUE '009'.

  lv_reqid = iv_reqid.

  SELECT * FROM /dlwupex/tfields INTO TABLE lt_tfields
    WHERE id = iv_bu AND
          actif = 'Y'.
  SORT lt_tfields BY viewname tabfield.

  SELECT * FROM /dlwupex/tbuhead INTO TABLE lt_tbuhead
    WHERE id = iv_bu AND
          ckp_creation = abap_true.


  SELECT * FROM /dlwupex/ttaxe INTO TABLE lt_taxe.
*    FOR ALL ENTRIES IN lt_tbuhead
*    WHERE pays = lt_tbuhead-land1.                 "#EC CI_NO_TRANSFORM
  SORT lt_taxe.

  SELECT * FROM /dlwupex/tale2wt INTO TABLE lt_ale2wt
    WHERE ( id = '' OR
          id = iv_bu ).
  IF sy-subrc IS NOT INITIAL.
    ls_msg-id = iv_bu.
    ls_msg-reqid = iv_reqid.
    ls_msg-matnr = iv_matnr.
    ls_msg-type = 'E'.
    ls_msg-idmsg = gc_classmsg.
    ls_msg-num = '023'.
    ls_msg-message_v1 = '/DLWUPEX/TALE2WT'.
    MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
      WITH ls_msg-message_v1
      INTO ls_msg-message.
    INSERT /dlwupex/tmsg FROM ls_msg.
    cv_rc = 4.
    EXIT.
  ENDIF.
  SORT lt_ale2wt.

  lt_ale2wt_bis = lt_ale2wt.
  DELETE lt_ale2wt WHERE worklist_table = ''.

*** Alimentation des paramètres pour appel de méthode de récupération de données articles
  l_param-name = 'IV_BU'.
  l_param-kind = cl_abap_objectdescr=>exporting.
  GET REFERENCE OF iv_bu INTO l_param-value.
  INSERT l_param INTO TABLE t_params.

  CLEAR l_param.
  l_param-name = 'IV_REQID'.
  l_param-kind = cl_abap_objectdescr=>exporting.
  GET REFERENCE OF iv_reqid INTO l_param-value.
  INSERT l_param INTO TABLE t_params.

  CLEAR l_param.
  l_param-name = 'IV_ART_KEY'.
  l_param-kind = cl_abap_objectdescr=>exporting.
  GET REFERENCE OF iv_matnr INTO l_param-value.
  INSERT l_param INTO TABLE t_params.

  CLEAR l_param.
  l_param-name = 'CV_RC'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF cv_rc INTO l_param-value.
  INSERT l_param INTO TABLE t_params.

* Tables pour récupération des données articles
*     /DLWUPEX/TGDATA
  CLEAR l_param.
  l_param-name = 'CT_GDATA'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_gdata INTO l_param-value.
  INSERT l_param INTO TABLE t_params.
*    /DLWUPEX/TUNIT
  CLEAR l_param.
  l_param-name = 'CT_UNIT'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_unit INTO l_param-value.
  INSERT l_param INTO TABLE t_params.
*    /DLWUPEX/TCARACT
  CLEAR l_param.
  l_param-name = 'CT_CARACT'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_caract INTO l_param-value.
  INSERT l_param INTO TABLE t_params.
*    /DLWUPEX/TBOM
  CLEAR l_param.
  l_param-name = 'CT_BOM'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_bom INTO l_param-value.
  INSERT l_param INTO TABLE t_params.
*    /DLWUPEX/TFIA
  CLEAR l_param.
  l_param-name = 'CT_FIA'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_fia INTO l_param-value.
  INSERT l_param INTO TABLE t_params.
*    /DLWUPEX/TLIST
  CLEAR l_param.
  l_param-name = 'CT_LIST'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_list INTO l_param-value.
  INSERT l_param INTO TABLE t_params.
*    /DLWUPEX/TSRLIST
  CLEAR l_param.
  l_param-name = 'CT_SRLIST'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_srlist INTO l_param-value.
  INSERT l_param INTO TABLE t_params.
*    /DLWUPEX/TSALE
  CLEAR l_param.
  l_param-name = 'CT_SALE'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_sale INTO l_param-value.
  INSERT l_param INTO TABLE t_params.
*    /DLWUPEX/TLOGDC
  CLEAR l_param.
  l_param-name = 'CT_LOGDC'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_logdc INTO l_param-value.
  INSERT l_param INTO TABLE t_params.
*    /DLWUPEX/TLOGSTO
  CLEAR l_param.
  l_param-name = 'CT_LOGSTO'.
  l_param-kind = cl_abap_objectdescr=>changing.
  GET REFERENCE OF lt_logsto INTO l_param-value.
  INSERT l_param INTO TABLE t_params.

  CALL METHOD ('/DLWUPEX/CL_COCKPIT_ARTICLE')=>read_data_from_matnr
    PARAMETER-TABLE
    t_params.

  READ TABLE lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>) INDEX 1.
  CHECK <fs_gdata> IS ASSIGNED.
  lv_art = <fs_gdata>-matnr.
  lv_mtart = <fs_gdata>-mtart.
  ls_marakey-mandt = sy-mandt.
  ls_marakey-matnr = lv_ref_art = <fs_gdata>-ref_art.
  ls_marakey-msgfn = lc_create.
  APPEND ls_marakey TO lt_marakey.
*    lv_mestyp = 'ARTMAS'.

  CALL FUNCTION '/DLWUPEX/GET_MATERIAL_DATA'
    EXPORTING
      message_type           = lv_mestyp
    TABLES
      marakey                = lt_marakey
      characteristicvalue    = lt_characteristicvalue
      characteristicvaluex   = lt_characteristicvaluex
      clientdata             = lt_clientdata
      clientdatax            = lt_clientdatax
      clientext              = lt_clientext
      clientextx             = lt_clientextx
      addnlclientdata        = lt_addnlclientdata
      addnlclientdatax       = lt_addnlclientdatax
      materialdescription    = lt_materialdescription
      plantdata              = lt_plantdata
      plantdatax             = lt_plantdatax
      plantext               = lt_plantext
      plantextx              = lt_plantextx
      forecastparameters     = lt_forecastparameters
      forecastparametersx    = lt_forecastparametersx
      forecastvalues         = lt_forecastvalues
      totalconsumption       = lt_totalconsumption
      unplndconsumption      = lt_unplndconsumption
      planningdata           = lt_planningdata
      planningdatax          = lt_planningdatax
      storagelocationdata    = lt_storagelocationdata
      storagelocationdatax   = lt_storagelocationdatax
      storagelocationext     = lt_storagelocationext
      storagelocationextx    = lt_storagelocationextx
      unitsofmeasure         = lt_unitsofmeasure
      unitsofmeasurex        = lt_unitsofmeasurex
      unitofmeasuretexts     = lt_unitofmeasuretexts
      internationalartnos    = lt_internationalartnos
      vendorean              = lt_vendorean
      layoutmoduleassgmt     = lt_layoutmoduleassgmt
      layoutmoduleassgmtx    = lt_layoutmoduleassgmtx
      taxclassifications     = lt_taxclassifications
      valuationdata          = lt_valuationdata
      valuationdatax         = lt_valuationdatax
      valuationext           = lt_valuationext
      valuationextx          = lt_valuationextx
      warehousenumberdata    = lt_warehousenumberdata
      warehousenumberdatax   = lt_warehousenumberdatax
      warehousenumberext     = lt_warehousenumberext
      warehousenumberextx    = lt_warehousenumberextx
      storagetypedata        = lt_storagetypedata
      storagetypedatax       = lt_storagetypedatax
      storagetypeext         = lt_storagetypeext
      storagetypeextx        = lt_storagetypeextx
      salesdata              = lt_salesdata
      salesdatax             = lt_salesdatax
      salesext               = lt_salesext
      salesextx              = lt_salesextx
      posdata                = lt_posdata
      posdatax               = lt_posdatax
      posext                 = lt_posext
      posextx                = lt_posextx
      materiallongtext       = lt_materiallongtext
      plantkeys              = lt_plantkeys
      storagelocationkeys    = lt_storagelocationkeys
      distrchainkeys         = lt_distrchainkeys
      warehousenokeys        = lt_warehousenokeys
      storagetypekeys        = lt_storagetypekeys
      valuationtypekeys      = lt_valuationtypekeys
      textilecomponents      = lt_textilecomponents
      fibercodes             = lt_fibercodes
      segsalesstatus         = lt_segsalesstatus
      segweightvolume        = lt_segweightvolume
      segvaluationtype       = lt_segvaluationtype
      seasons                = lt_seasons
      segwarehousenumberdata = lt_segwarehousenumberdata
      segstoragetypedata     = lt_segstoragetypedata
      segmrpgeneraldata      = lt_segmrpgeneraldata
      segmrpquantitydata     = lt_segmrpquantitydata.

* Alimentation avec les données modifiées (Worklist table)

  SORT lt_ale2wt BY worklist_table worklist_field.

* For global data (key Material only)
  READ TABLE lt_gdata INTO DATA(ls_gdata) INDEX 1.

  READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
    WITH KEY worklist_table = '/DLWUPEX/TGDATA'
    BINARY SEARCH.
  IF sy-subrc IS INITIAL.
    LOOP AT lt_ale2wt ASSIGNING FIELD-SYMBOL(<fs_ale2wt>) FROM sy-tabix.
      READ TABLE lt_tfields TRANSPORTING NO FIELDS
        WITH KEY viewname = gc_gdataview
                 tabfield = <fs_ale2wt>-worklist_field.
      CHECK sy-subrc IS INITIAL.
      UNASSIGN : <lt_itab>, <fs_field>.
      IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TGDATA'.
        EXIT.
      ENDIF.
      lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
      ASSIGN (lv_tabname) TO <lt_itab>.
      CHECK <lt_itab> IS ASSIGNED.
      ASSIGN COMPONENT <fs_ale2wt>-worklist_field OF STRUCTURE ls_gdata TO <fs_field>.
      CHECK <fs_field> IS ASSIGNED.
      IF lv_tabname = 'LT_TAXCLASSIFICATIONS'.
        READ TABLE <lt_itab> ASSIGNING <fs_itab> INDEX 1.
        CHECK sy-subrc IS INITIAL.

        LOOP AT <lt_itab> ASSIGNING <fs_itab>.
          lv_tabix = sy-tabix.
          UNASSIGN <fs_field_bis>.
          ASSIGN COMPONENT 'DEPCOUNTRY' OF STRUCTURE <fs_itab> TO <fs_key>.
          IF <fs_key> IS ASSIGNED.
*            CLEAR lv_nocheck.
*            LOOP AT lt_tbuhead ASSIGNING FIELD-SYMBOL(<fs_head>).
*              IF <fs_head>-land1 = <fs_key>.
*                lv_nocheck = abap_true.
*              ENDIF.
*            ENDLOOP.
*            IF lv_nocheck = abap_false.
*              DELETE <lt_itab> INDEX lv_tabix.
*              CONTINUE.
*            ENDIF.
*            READ TABLE lt_taxe TRANSPORTING NO FIELDS
*              WITH KEY pays = <fs_key>
*              BINARY SEARCH.
*            IF sy-subrc IS NOT INITIAL.
*              DELETE <lt_itab> INDEX lv_tabix.
*              CONTINUE.
*            ENDIF.
          ENDIF.
          IF <fs_ale2wt>-idoc_field+0(8) = 'TAXCLASS'.
            CONCATENATE  'TAX_TYPE_' <fs_ale2wt>-idoc_field+9(1) INTO lv_key.
            ASSIGN COMPONENT lv_key OF STRUCTURE <fs_itab> TO <fs_field_bis>.
            CHECK <fs_field_bis> IS ASSIGNED.
            READ TABLE lt_taxe TRANSPORTING NO FIELDS
            WITH KEY pays = <fs_key>
                     taxe = <fs_field_bis>
            BINARY SEARCH.
            IF sy-subrc IS INITIAL.
              CONTINUE.
            ENDIF.
          ENDIF.

          UNASSIGN <fs_field_bis>.
          ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab> TO <fs_field_bis>.
          CHECK <fs_field_bis> IS ASSIGNED.
          IF <fs_ale2wt>-idoc_field+0(8) = 'TAXCLASS'.
            IF <fs_field_bis> IS NOT INITIAL.
              <fs_field_bis> = <fs_field>.
            ENDIF.
          ELSEIF <fs_ale2wt>-idoc_field = 'TAX_IND'.
            IF <fs_field_bis> IS NOT INITIAL.
              <fs_field_bis> = <fs_field>.
            ENDIF.
          ELSE.
            <fs_field_bis> = <fs_field>.
          ENDIF.
        ENDLOOP.

      ELSE.
        READ TABLE <lt_itab> ASSIGNING <fs_itab> INDEX 1.
        IF sy-subrc IS INITIAL.
          LOOP AT <lt_itab> ASSIGNING <fs_itab>.
            ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab> TO <fs_field_bis>.
            CHECK <fs_field_bis> IS ASSIGNED.
            <fs_field_bis> = <fs_field>.
          ENDLOOP.
        ELSE.
          CREATE DATA new_line LIKE LINE OF <lt_itab>.
          ASSIGN new_line->* TO <fs_itab2>.
          CHECK <fs_itab2> IS ASSIGNED.
          ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
          IF <fs_mat> IS ASSIGNED.
            <fs_mat> = iv_matnr.
          ENDIF.
          ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
          <fs_field_bis> = <fs_field>.
          APPEND <fs_itab2> TO <lt_itab>." INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
*  ls_headdata-basic_view = abap_true.


* init Table if worklist is empty
  READ TABLE lt_unit  TRANSPORTING NO FIELDS INDEX 1.
  IF sy-subrc IS NOT INITIAL.
    READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
      WITH KEY worklist_table = '/DLWUPEX/TUNIT'
      BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
*        READ TABLE lt_tfields TRANSPORTING NO FIELDS
*           WITH KEY viewname = gc_unitview
*                    tabfield = <fs_ale2wt>-worklist_field.
*        CHECK sy-subrc IS INITIAL.
        UNASSIGN : <lt_itab>.
        IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TUNIT'.
          EXIT.
        ENDIF.
        lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
        ASSIGN (lv_tabname) TO <lt_itab>.
        CHECK <lt_itab> IS ASSIGNED.
        REFRESH <lt_itab>.
      ENDLOOP.
    ENDIF.
  ENDIF.

  READ TABLE lt_caract  TRANSPORTING NO FIELDS INDEX 1.
  IF sy-subrc IS NOT INITIAL.
    READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
      WITH KEY worklist_table = '/DLWUPEX/TCARACT'
      BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
*        READ TABLE lt_tfields TRANSPORTING NO FIELDS
*           WITH KEY viewname = gc_caractview
*                    tabfield = <fs_ale2wt>-worklist_field.
*        CHECK sy-subrc IS INITIAL.
        UNASSIGN : <lt_itab>.
        IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TCARACT'.
          EXIT.
        ENDIF.
        lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
        ASSIGN (lv_tabname) TO <lt_itab>.
        CHECK <lt_itab> IS ASSIGNED.
        REFRESH <lt_itab>.
      ENDLOOP.
    ENDIF.
  ENDIF.

  READ TABLE lt_logsto  TRANSPORTING NO FIELDS INDEX 1.
  IF sy-subrc IS NOT INITIAL.
    READ TABLE lt_logdc  TRANSPORTING NO FIELDS INDEX 1.
    IF sy-subrc IS NOT INITIAL.
      READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
        WITH KEY worklist_table = '/DLWUPEX/TLOGDC'
        BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
*        READ TABLE lt_tfields TRANSPORTING NO FIELDS
*           WITH KEY viewname = gc_logdcview
*                    tabfield = <fs_ale2wt>-worklist_field.
*        CHECK sy-subrc IS INITIAL.
          UNASSIGN : <lt_itab>.
          IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TLOGDC'.
            EXIT.
          ENDIF.
          lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
          ASSIGN (lv_tabname) TO <lt_itab>.
          CHECK <lt_itab> IS ASSIGNED.
          REFRESH <lt_itab>.
        ENDLOOP.
      ENDIF.
      READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
      WITH KEY worklist_table = '/DLWUPEX/TLOGSTO'
      BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
*        READ TABLE lt_tfields TRANSPORTING NO FIELDS
*           WITH KEY viewname = gc_logstoview
*                    tabfield = <fs_ale2wt>-worklist_field.
*        CHECK sy-subrc IS INITIAL.
          UNASSIGN : <lt_itab>.
          IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TLOGSTO'.
            EXIT.
          ENDIF.
          lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
          ASSIGN (lv_tabname) TO <lt_itab>.
          CHECK <lt_itab> IS ASSIGNED.
          REFRESH <lt_itab>.
        ENDLOOP.
      ENDIF.
    ELSE.
      ls_headdata-logdc_view = abap_true.
    ENDIF.
  ELSE.

    ls_headdata-logst_view = abap_true.
  ENDIF.
  ls_headdata-logdc_view = abap_true.


  READ TABLE lt_sale  TRANSPORTING NO FIELDS INDEX 1.
  IF sy-subrc IS NOT INITIAL.
    READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
      WITH KEY worklist_table = '/DLWUPEX/TSALE'
      BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
*        READ TABLE lt_tfields TRANSPORTING NO FIELDS
*           WITH KEY viewname = gc_saleview
*                    tabfield = <fs_ale2wt>-worklist_field.
*        CHECK sy-subrc IS INITIAL.
        UNASSIGN : <lt_itab>.
        IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TSALE'.
          EXIT.
        ENDIF.
        lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
        ASSIGN (lv_tabname) TO <lt_itab>.
        CHECK <lt_itab> IS ASSIGNED.
        REFRESH <lt_itab>.
      ENDLOOP.
    ENDIF.
  ELSE.
    ls_headdata-sales_view = ls_headdata-pos_view = abap_true.
  ENDIF.

* For unit (key Material & Unit)

  LOOP AT lt_unit INTO DATA(ls_unit).
    UNASSIGN : <fs_key>, <fs_key_bis>.
    ASSIGN COMPONENT 'MEINH' OF STRUCTURE ls_unit TO <fs_key>.

    READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
      WITH KEY worklist_table = '/DLWUPEX/TUNIT'
      BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
        READ TABLE lt_tfields TRANSPORTING NO FIELDS
           WITH KEY viewname = gc_unitview
                    tabfield = <fs_ale2wt>-worklist_field.
        CHECK sy-subrc IS INITIAL.
        UNASSIGN : <fs_key_bis>.
        CLEAR lv_key.
        IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TUNIT'.
          EXIT.
        ENDIF.
        CHECK <fs_ale2wt>-worklist_field IS NOT INITIAL.
        UNASSIGN : <lt_itab>, <lt_itab_bis>, <fs_field>.
        lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
        ASSIGN (lv_tabname) TO <lt_itab>.
        CHECK <lt_itab> IS ASSIGNED.

        ASSIGN COMPONENT <fs_ale2wt>-worklist_field OF STRUCTURE ls_unit TO <fs_field>.
        READ TABLE <lt_itab> ASSIGNING <fs_itab> INDEX 1.
        IF sy-subrc IS INITIAL.
          ASSIGN COMPONENT 'ALT_UNIT' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
          IF <fs_key_bis> IS ASSIGNED.
            lv_key = 'ALT_UNIT'.
          ELSE.
            ASSIGN COMPONENT 'UNIT' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
            IF <fs_key_bis> IS ASSIGNED.
              lv_key = 'UNIT'.
            ENDIF.
          ENDIF.
          IF lv_key IS NOT INITIAL.
            SORT <lt_itab> BY (lv_key).
          ENDIF.

          CHECK <fs_field> IS ASSIGNED AND
                <fs_key>  IS ASSIGNED.

          LOOP AT <lt_itab> ASSIGNING <fs_itab>.
            lv_tabix = sy-tabix.
            UNASSIGN <fs_mat>.
            ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab> TO <fs_mat>.
            IF <fs_mat> IS ASSIGNED.
              CLEAR <fs_mat>.
            ENDIF.
* Change table contain
            UNASSIGN : <fs_field_bis>, <fs_key_bis>.
            ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab> TO <fs_field_bis>.
            ASSIGN COMPONENT lv_key OF STRUCTURE <fs_itab> TO <fs_key_bis>.
            CHECK <fs_field_bis> IS ASSIGNED.
            IF <fs_key_bis> IS NOT ASSIGNED.
              <fs_field_bis> = <fs_field>.
            ELSEIF <fs_key_bis> IS ASSIGNED.
              IF <fs_key_bis> EQ <fs_key>.
                IF <fs_ale2wt>-idoc_field <> lv_key.
                  <fs_field_bis> = <fs_field>.
                ENDIF.
              ELSE.
* Delete Line of Worklist if needed.
                READ TABLE lt_unit TRANSPORTING NO FIELDS
                  WITH KEY meinh = <fs_key_bis>.
                IF sy-subrc IS NOT INITIAL.
                  DELETE <lt_itab> INDEX lv_tabix.
*                  CONTINUE.
                ENDIF.
* Add Line from Worklist if needed.
                READ TABLE <lt_itab> TRANSPORTING NO FIELDS
                  WITH KEY (lv_key) = <fs_key>
                  BINARY SEARCH.
                IF sy-subrc IS NOT INITIAL.
                  CREATE DATA new_line LIKE LINE OF <lt_itab>.
                  ASSIGN new_line->* TO <fs_itab2>.
                  CHECK <fs_itab2> IS ASSIGNED.
                  ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
                  IF <fs_mat> IS ASSIGNED.
                    <fs_mat> = iv_matnr.
                  ENDIF.
                  ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
                  ASSIGN COMPONENT lv_key OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
                  <fs_key_bis> = <fs_key>.
                  <fs_field_bis> = <fs_field>.
                  INSERT <fs_itab2> INTO <lt_itab> INDEX sy-tabix.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDLOOP.
        ELSE. " sy-subrc IS NOT INITIAL.
          CREATE DATA new_line LIKE LINE OF <lt_itab>.
          ASSIGN new_line->* TO <fs_itab2>.
          CHECK <fs_itab2> IS ASSIGNED.
          ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
          IF <fs_mat> IS ASSIGNED.
            <fs_mat> = iv_matnr.
          ENDIF.
          ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
          ASSIGN COMPONENT 'ALT_UNIT' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
          IF <fs_key_bis> IS NOT ASSIGNED.
            ASSIGN COMPONENT 'UNIT' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
          ENDIF.
          <fs_key_bis> = <fs_key>.
          <fs_field_bis> = <fs_field>.
          APPEND <fs_itab2> TO <lt_itab>." INDEX sy-tabix.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDLOOP.

* For Characteristics (key Material Only)
  LOOP AT lt_caract INTO DATA(ls_caract).
    UNASSIGN : <fs_key>, <fs_key_bis>, <fs_key1_bis>.
    ASSIGN COMPONENT 'ATINN' OF STRUCTURE ls_caract TO <fs_key>.
    ASSIGN COMPONENT 'ATWRT' OF STRUCTURE ls_caract TO <fs_key1>.
    CALL FUNCTION 'CONVERSION_EXIT_ATINN_OUTPUT'
      EXPORTING
        input  = <fs_key>
      IMPORTING
        output = lv_atnam.

    READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
      WITH KEY worklist_table = '/DLWUPEX/TCARACT'
      BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
        READ TABLE lt_tfields TRANSPORTING NO FIELDS
           WITH KEY viewname = gc_caractview
                    tabfield = <fs_ale2wt>-worklist_field.
        CHECK sy-subrc IS INITIAL.
        UNASSIGN : <lt_itab>, <fs_field>.
        IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TCARACT'.
          EXIT.
        ENDIF.
        CHECK <fs_ale2wt>-worklist_field IS NOT INITIAL.
        lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
        ASSIGN (lv_tabname) TO <lt_itab>.
        CHECK <lt_itab> IS ASSIGNED.

        ASSIGN COMPONENT <fs_ale2wt>-worklist_field OF STRUCTURE ls_caract TO <fs_field>.
        CHECK <fs_field> IS ASSIGNED.

        READ TABLE <lt_itab> ASSIGNING <fs_itab> INDEX 1.
        IF sy-subrc IS INITIAL.
          ASSIGN COMPONENT 'CHAR_NAME' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
          ASSIGN COMPONENT 'CHAR_VALUE' OF STRUCTURE <fs_itab> TO <fs_key1_bis>.
          SORT <lt_itab> BY ('CHAR_NAME') ('CHAR_VALUE').
          CHECK <fs_field> IS ASSIGNED AND
                <fs_key>  IS ASSIGNED.

          LOOP AT <lt_itab> ASSIGNING <fs_itab>.
            lv_tabix = sy-tabix.
            UNASSIGN <fs_mat>.
            ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab> TO <fs_mat>.
            IF <fs_mat> IS ASSIGNED.
              CLEAR <fs_mat>.
            ENDIF.
* Change table contain
            UNASSIGN : <fs_field_bis>, <fs_key_bis>, <fs_key1_bis>.
            ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab> TO <fs_field_bis>.
            ASSIGN COMPONENT 'CHAR_NAME' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
            ASSIGN COMPONENT 'CHAR_VALUE' OF STRUCTURE <fs_itab> TO <fs_key1_bis>.
            CHECK <fs_field_bis> IS ASSIGNED.
            IF <fs_key_bis> IS ASSIGNED.
*                      IF <fs_key_bis> EQ lv_atnam.
*                        <fs_field_bis> = <fs_field>.
*                      ELSE.
** Delete Line of Worklist if needed.
*                        READ TABLE lt_caract TRANSPORTING NO FIELDS
*                          WITH KEY atinn = <fs_key_bis>.
*                        IF sy-subrc IS NOT INITIAL.
*                          DELETE <lt_itab> INDEX lv_tabix.
*                          CONTINUE.
*                        ENDIF.
* Add Line from Worklist if needed.
              READ TABLE <lt_itab> TRANSPORTING NO FIELDS
                WITH KEY ('CHAR_NAME') = lv_atnam
                         ('CHAR_VALUE') = <fs_key1>
                BINARY SEARCH.
              IF sy-subrc IS NOT INITIAL.
                CREATE DATA new_line LIKE LINE OF <lt_itab>.
                ASSIGN new_line->* TO <fs_itab2>.
                CHECK <fs_itab2> IS ASSIGNED.
                ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
                IF <fs_mat> IS ASSIGNED.
                  <fs_mat> = iv_matnr.
                ENDIF.
                ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
                ASSIGN COMPONENT 'CHAR_VALUE' OF STRUCTURE <fs_itab2> TO <fs_key1_bis>.
                <fs_key1_bis> = <fs_key1>.
                IF <fs_ale2wt>-idoc_field = 'CHAR_NAME'.
                  <fs_field_bis> = lv_atnam.
                ELSE.
                  ASSIGN COMPONENT 'CHAR_NAME' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
                  <fs_field_bis> = <fs_field>.
                  <fs_key_bis> = lv_atnam.
                ENDIF.
                INSERT <fs_itab2> INTO <lt_itab> INDEX sy-tabix.
              ENDIF.
*                      ENDIF.
            ENDIF.
          ENDLOOP.
        ELSE.
          CREATE DATA new_line LIKE LINE OF <lt_itab>.
          ASSIGN new_line->* TO <fs_itab2>.
          CHECK <fs_itab2> IS ASSIGNED.
          ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
          IF <fs_mat> IS ASSIGNED.
            <fs_mat> = iv_matnr.
          ENDIF.
          ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
          ASSIGN COMPONENT 'CHAR_VALUE' OF STRUCTURE <fs_itab2> TO <fs_key1_bis>.
          <fs_key1_bis> = <fs_key1>.
          IF <fs_ale2wt>-idoc_field = 'CHAR_NAME'.
            <fs_field_bis> = lv_atnam.
          ELSE.
            ASSIGN COMPONENT 'CHAR_NAME' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
            <fs_field_bis> = <fs_field>.
            <fs_key_bis> = lv_atnam.
          ENDIF.
          APPEND <fs_itab2> TO <lt_itab>.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDLOOP.

* For Sale (key Material & OC & Canal distrib)

  LOOP AT lt_sale INTO DATA(ls_sale).
    UNASSIGN : <fs_key>, <fs_key1>, <fs_key_bis>, <fs_key1_bis>.
    ASSIGN COMPONENT 'VKORG' OF STRUCTURE ls_sale TO <fs_key>.
    ASSIGN COMPONENT 'VTWEG' OF STRUCTURE ls_sale TO <fs_key1>.

    READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
      WITH KEY worklist_table = '/DLWUPEX/TSALE'
      BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
        READ TABLE lt_tfields TRANSPORTING NO FIELDS
           WITH KEY viewname = gc_saleview
                    tabfield = <fs_ale2wt>-worklist_field.
        CHECK sy-subrc IS INITIAL.
        UNASSIGN : <fs_key_bis>, <fs_key1_bis>.
        IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TSALE'.
          EXIT.
        ENDIF.
        CHECK <fs_ale2wt>-worklist_field IS NOT INITIAL.
        UNASSIGN : <lt_itab>, <lt_itab_bis>, <fs_field>.
        lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
        ASSIGN (lv_tabname) TO <lt_itab>.
        CHECK <lt_itab> IS ASSIGNED.

        ASSIGN COMPONENT <fs_ale2wt>-worklist_field OF STRUCTURE ls_sale TO <fs_field>.
        READ TABLE <lt_itab> ASSIGNING <fs_itab> INDEX 1.
        IF sy-subrc IS INITIAL.
          ASSIGN COMPONENT 'SALES_ORG' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
          ASSIGN COMPONENT 'DISTR_CHAN' OF STRUCTURE <fs_itab> TO <fs_key1_bis>.
          IF <fs_key_bis> IS ASSIGNED AND <fs_key1_bis> IS ASSIGNED.
            SORT <lt_itab> BY ('SALES_ORG') ('DISTR_CHAN').
          ELSEIF <fs_key_bis> IS ASSIGNED.
            SORT <lt_itab> BY ('SALES_ORG').
          ENDIF.


          ASSIGN COMPONENT <fs_ale2wt>-worklist_field OF STRUCTURE ls_sale TO <fs_field>.

          CHECK <fs_field> IS ASSIGNED AND
                <fs_key>  IS ASSIGNED.

          LOOP AT <lt_itab> ASSIGNING <fs_itab>.
            lv_tabix = sy-tabix.
            UNASSIGN <fs_mat>.
            ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab> TO <fs_mat>.
            IF <fs_mat> IS ASSIGNED.
              CLEAR <fs_mat>.
            ENDIF.
* Change table contain
            UNASSIGN : <fs_field_bis>, <fs_key_bis>, <fs_key1_bis>.
            ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab> TO <fs_field_bis>.
            ASSIGN COMPONENT 'SALES_ORG' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
            ASSIGN COMPONENT 'DISTR_CHAN' OF STRUCTURE <fs_itab> TO <fs_key1_bis>.
            CHECK <fs_field_bis> IS ASSIGNED.
            IF <fs_key_bis> IS NOT ASSIGNED AND <fs_key1_bis> IS NOT ASSIGNED.
              <fs_field_bis> = <fs_field>.
            ELSEIF <fs_key_bis> IS ASSIGNED AND <fs_key1_bis> IS NOT ASSIGNED.
              IF <fs_key_bis> EQ <fs_key>.
                IF <fs_ale2wt>-idoc_field <> 'SALES_ORG'.
                  <fs_field_bis> = <fs_field>.
                ENDIF.
              ELSE.
* Delete Line of Worklist if needed.
                READ TABLE lt_sale TRANSPORTING NO FIELDS
                  WITH KEY vkorg = <fs_key_bis>.
                IF sy-subrc IS NOT INITIAL.
                  DELETE <lt_itab> INDEX lv_tabix.
*                  CONTINUE.
                ENDIF.
* Add Line from Worklist if needed.
                READ TABLE <lt_itab> TRANSPORTING NO FIELDS
                  WITH KEY ('SALES_ORG') = <fs_key>
                  BINARY SEARCH.
                IF sy-subrc IS NOT INITIAL.
                  CREATE DATA new_line LIKE LINE OF <lt_itab>.
                  ASSIGN new_line->* TO <fs_itab2>.
                  CHECK <fs_itab2> IS ASSIGNED.
                  ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
                  IF <fs_mat> IS ASSIGNED.
                    <fs_mat> = iv_matnr.
                  ENDIF.
                  ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
                  ASSIGN COMPONENT 'SALES_ORG' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
                  <fs_key_bis> = <fs_key>.
                  <fs_field_bis> = <fs_field>.
                  INSERT <fs_itab2> INTO <lt_itab> INDEX sy-tabix.
                ENDIF.
              ENDIF.
            ELSEIF <fs_key_bis> IS ASSIGNED AND <fs_key1_bis> IS ASSIGNED.
              IF <fs_key_bis> EQ <fs_key> AND <fs_key1_bis> EQ <fs_key1>.
                IF <fs_ale2wt>-idoc_field <> 'SALES_ORG' AND <fs_ale2wt>-idoc_field <> 'DISTR_CHAN'.
                  <fs_field_bis> = <fs_field>.
                ENDIF.
              ELSE.
* Delete Line of Worklist if needed.
                READ TABLE lt_sale TRANSPORTING NO FIELDS
                  WITH KEY vkorg = <fs_key_bis>
                           vtweg = <fs_key1_bis>.
                IF sy-subrc IS NOT INITIAL.
                  DELETE <lt_itab> INDEX lv_tabix.
*                  CONTINUE.
                ENDIF.
* Add Line from Worklist if needed.
                READ TABLE <lt_itab> TRANSPORTING NO FIELDS
                  WITH KEY ('SALES_ORG') = <fs_key>
                           ('DISTR_CHAN') = <fs_key1>
                  BINARY SEARCH.
                IF sy-subrc IS NOT INITIAL.
                  CREATE DATA new_line LIKE LINE OF <lt_itab>.
                  ASSIGN new_line->* TO <fs_itab2>.
                  CHECK <fs_itab2> IS ASSIGNED.
                  ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
                  IF <fs_mat> IS ASSIGNED.
                    <fs_mat> = iv_matnr.
                  ENDIF.
                  ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
                  ASSIGN COMPONENT 'SALES_ORG' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
                  ASSIGN COMPONENT 'DISTR_CHAN' OF STRUCTURE <fs_itab2> TO <fs_key1_bis>.
                  <fs_key_bis> = <fs_key>.
                  <fs_key1_bis> = <fs_key1>.
                  <fs_field_bis> = <fs_field>.
                  INSERT <fs_itab2> INTO <lt_itab> INDEX sy-tabix.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDLOOP.
        ELSE.
          CREATE DATA new_line LIKE LINE OF <lt_itab>.
          ASSIGN new_line->* TO <fs_itab2>.
          CHECK <fs_itab2> IS ASSIGNED.
          ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
          IF <fs_mat> IS ASSIGNED.
            <fs_mat> = iv_matnr.
          ENDIF.
          ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
          ASSIGN COMPONENT 'SALES_ORG' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
          ASSIGN COMPONENT 'DISTR_CHAN' OF STRUCTURE <fs_itab2> TO <fs_key1_bis>.
          <fs_key_bis> = <fs_key>.
          <fs_key1_bis> = <fs_key1>.
          <fs_field_bis> = <fs_field>.
          APPEND <fs_itab2> TO <lt_itab>." INDEX sy-tabix.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDLOOP.


  SORT : lt_logdc BY werks,
         lt_logsto BY werks.

* Retreive data from reference for PLANDATA
  SELECT SINGLE vlgvz vlgfi INTO ( lv_sitedc, lv_sitesto ) FROM twpa.
  IF lv_sitesto IS INITIAL.
    IF lt_logsto IS NOT INITIAL.
      SELECT * FROM t001w INTO TABLE lt_t001w
      FOR ALL ENTRIES IN lt_logsto
      WHERE werks = lt_logsto-werks.
      IF sy-subrc IS INITIAL.
        SELECT * INTO TABLE lt_tvkov FROM tvkov
          FOR ALL ENTRIES IN lt_t001w
               WHERE vkorg = lt_t001w-vkorg AND
                     vtweg = lt_t001w-vtweg AND
                     vltyp = '1'.
      ENDIF.
    ENDIF.
  ENDIF.

  READ TABLE lt_logsto INTO DATA(ls_logsto) INDEX 1.
  IF sy-subrc IS INITIAL.
    READ TABLE lt_t001w INTO DATA(ls_t001w)
            WITH KEY werks = ls_logsto-werks.
    IF sy-subrc IS INITIAL.
      READ TABLE lt_tvkov INTO DATA(ls_tvkov)
        WITH KEY vkorg = ls_t001w-vkorg
                   vtweg = ls_t001w-vtweg.
      IF sy-subrc IS INITIAL.
        lv_sitesto = ls_tvkov-vlgfi.
      ENDIF.
    ENDIF.
  ENDIF.

  SORT : lt_posdata,
         lt_storagelocationkeys,
         lt_forecastparameters,
         lt_forecastvalues,
         lt_planningdata,
         lt_plantdata,
         lt_plantkeys,
         lt_segmrpgeneraldata,
         lt_segmrpquantitydata,
         lt_segvaluationtype,
         lt_storagelocationdata,
         lt_totalconsumption,
         lt_unplndconsumption,
         lt_valuationdata,
         lt_valuationtypekeys.


  LOOP AT lt_logdc INTO DATA(ls_logdc).
    CHECK ls_logdc-werks <> lv_sitedc.

    READ TABLE lt_plantdata INTO DATA(ls_plantdata)
      WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_plantdata ASSIGNING FIELD-SYMBOL(<fs_plantdata>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_plantdata>-plant = ls_logdc-werks.
      ELSE.
        ls_plantdata-plant = ls_logdc-werks.
        INSERT ls_plantdata INTO lt_plantdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_forecastparameters INTO DATA(ls_forecastparameters)
      WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_forecastparameters ASSIGNING FIELD-SYMBOL(<fs_forecastparameters>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_forecastparameters>-plant = ls_logdc-werks.
      ELSE.
        ls_forecastparameters-plant = ls_logdc-werks.
        INSERT ls_forecastparameters INTO lt_forecastparameters INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_forecastvalues INTO DATA(ls_forecastvalues)
      WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_forecastvalues ASSIGNING FIELD-SYMBOL(<fs_forecastvalues>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_forecastvalues>-plant = ls_logdc-werks.
      ELSE.
        ls_forecastvalues-plant = ls_logdc-werks.
        INSERT ls_forecastvalues INTO lt_forecastvalues INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_planningdata INTO DATA(ls_planningdata)
  WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_planningdata ASSIGNING FIELD-SYMBOL(<fs_planningdata>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_planningdata>-plant = ls_logdc-werks.
      ELSE.
        ls_planningdata-plant = ls_logdc-werks.
        INSERT ls_planningdata INTO lt_planningdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_plantkeys INTO DATA(ls_plantkeys)
  WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_plantkeys ASSIGNING FIELD-SYMBOL(<fs_plantkeys>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_plantkeys>-plant = ls_logdc-werks.
      ELSE.
        ls_plantkeys-plant = ls_logdc-werks.
        INSERT ls_plantkeys INTO lt_plantkeys INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_segmrpgeneraldata INTO DATA(ls_segmrpgeneraldata)
  WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_segmrpgeneraldata ASSIGNING FIELD-SYMBOL(<fs_segmrpgeneraldata>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_segmrpgeneraldata>-plant = ls_logdc-werks.
      ELSE.
        ls_segmrpgeneraldata-plant = ls_logdc-werks.
        INSERT ls_segmrpgeneraldata INTO lt_segmrpgeneraldata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_segmrpquantitydata INTO DATA(ls_segmrpquantitydata)
  WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_segmrpquantitydata ASSIGNING FIELD-SYMBOL(<fs_segmrpquantitydata>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_segmrpquantitydata>-plant = ls_logdc-werks.
      ELSE.
        ls_segmrpquantitydata-plant = ls_logdc-werks.
        INSERT ls_segmrpquantitydata INTO lt_segmrpquantitydata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_segvaluationtype INTO DATA(ls_segvaluationtype)
  WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_segvaluationtype ASSIGNING FIELD-SYMBOL(<fs_segvaluationtype>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_segvaluationtype>-plant = ls_logdc-werks.
      ELSE.
        ls_segvaluationtype-plant = ls_logdc-werks.
        INSERT ls_segvaluationtype INTO lt_segvaluationtype INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_storagelocationdata INTO DATA(ls_storagelocationdata)
  WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_storagelocationdata ASSIGNING FIELD-SYMBOL(<fs_storagelocationdata>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_storagelocationdata>-plant = ls_logdc-werks.
      ELSE.
        ls_storagelocationdata-plant = ls_logdc-werks.
        INSERT ls_storagelocationdata INTO lt_storagelocationdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_totalconsumption INTO DATA(ls_totalconsumption)
  WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_totalconsumption ASSIGNING FIELD-SYMBOL(<fs_totalconsumption>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_totalconsumption>-plant = ls_logdc-werks.
      ELSE.
        ls_totalconsumption-plant = ls_logdc-werks.
        INSERT ls_totalconsumption INTO lt_totalconsumption INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_unplndconsumption INTO DATA(ls_unplndconsumption)
  WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_unplndconsumption ASSIGNING FIELD-SYMBOL(<fs_unplndconsumption>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_unplndconsumption>-plant = ls_logdc-werks.
      ELSE.
        ls_unplndconsumption-plant = ls_logdc-werks.
        INSERT ls_unplndconsumption INTO lt_unplndconsumption INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_posdata INTO DATA(ls_posdata)
     WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_posdata ASSIGNING FIELD-SYMBOL(<fs_posdata>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_posdata>-plant = ls_logdc-werks.
      ELSE.
        ls_posdata-plant = ls_logdc-werks.
        INSERT ls_posdata INTO lt_posdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_storagelocationkeys INTO DATA(ls_storagelocationkeys)
      WITH KEY plant = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_storagelocationkeys ASSIGNING FIELD-SYMBOL(<fs_storagelocationkeys>)
        WITH KEY plant = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_storagelocationkeys>-plant = ls_logdc-werks.
      ELSE.
        ls_storagelocationkeys-plant = ls_logdc-werks.
        INSERT ls_storagelocationkeys INTO lt_storagelocationkeys INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_valuationdata INTO DATA(ls_valuationdata)
      WITH KEY val_area = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_valuationdata ASSIGNING FIELD-SYMBOL(<fs_valuationdata>)
        WITH KEY val_area = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_valuationdata>-val_area = ls_logdc-werks.
      ELSE.
        ls_valuationdata-val_area = ls_logdc-werks.
        INSERT ls_valuationdata INTO lt_valuationdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_valuationtypekeys INTO DATA(ls_valuationtypekeys)
      WITH KEY val_area = lv_sitedc.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_valuationtypekeys ASSIGNING FIELD-SYMBOL(<fs_valuationtypekeys>)
        WITH KEY val_area = ls_logdc-werks.
      IF sy-subrc IS INITIAL.
        <fs_valuationtypekeys>-val_area = ls_logdc-werks.
      ELSE.
        ls_valuationtypekeys-val_area = ls_logdc-werks.
        INSERT ls_valuationtypekeys INTO lt_valuationtypekeys INDEX lv_tabix.
      ENDIF.
    ENDIF.
  ENDLOOP.


  LOOP AT lt_logsto INTO ls_logsto.
    CHECK ls_logsto-werks <> lv_sitesto.

    READ TABLE lt_plantdata INTO ls_plantdata
      WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_plantdata ASSIGNING <fs_plantdata>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_plantdata>-plant = ls_logsto-werks.
      ELSE.
        ls_plantdata-plant = ls_logsto-werks.
        INSERT ls_plantdata INTO lt_plantdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_forecastparameters INTO ls_forecastparameters
      WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_forecastparameters ASSIGNING <fs_forecastparameters>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_forecastparameters>-plant = ls_logsto-werks.
      ELSE.
        ls_forecastparameters-plant = ls_logsto-werks.
        INSERT ls_forecastparameters INTO lt_forecastparameters INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_forecastvalues INTO ls_forecastvalues
      WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_forecastvalues ASSIGNING <fs_forecastvalues>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_forecastvalues>-plant = ls_logsto-werks.
      ELSE.
        ls_forecastvalues-plant = ls_logsto-werks.
        INSERT ls_forecastvalues INTO lt_forecastvalues INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_planningdata INTO ls_planningdata
  WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_planningdata ASSIGNING <fs_planningdata>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_planningdata>-plant = ls_logsto-werks.
      ELSE.
        ls_planningdata-plant = ls_logsto-werks.
        INSERT ls_planningdata INTO lt_planningdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_plantkeys INTO ls_plantkeys
  WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_plantkeys ASSIGNING <fs_plantkeys>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_plantkeys>-plant = ls_logsto-werks.
      ELSE.
        ls_plantkeys-plant = ls_logsto-werks.
        INSERT ls_plantkeys INTO lt_plantkeys INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_segmrpgeneraldata INTO ls_segmrpgeneraldata
  WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_segmrpgeneraldata ASSIGNING <fs_segmrpgeneraldata>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_segmrpgeneraldata>-plant = ls_logsto-werks.
      ELSE.
        ls_segmrpgeneraldata-plant = ls_logsto-werks.
        INSERT ls_segmrpgeneraldata INTO lt_segmrpgeneraldata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_segmrpquantitydata INTO ls_segmrpquantitydata
  WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_segmrpquantitydata ASSIGNING <fs_segmrpquantitydata>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_segmrpquantitydata>-plant = ls_logsto-werks.
      ELSE.
        ls_segmrpquantitydata-plant = ls_logsto-werks.
        INSERT ls_segmrpquantitydata INTO lt_segmrpquantitydata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_segvaluationtype INTO ls_segvaluationtype
  WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_segvaluationtype ASSIGNING <fs_segvaluationtype>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_segvaluationtype>-plant = ls_logsto-werks.
      ELSE.
        ls_segvaluationtype-plant = ls_logsto-werks.
        INSERT ls_segvaluationtype INTO lt_segvaluationtype INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_storagelocationdata INTO ls_storagelocationdata
  WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_storagelocationdata ASSIGNING <fs_storagelocationdata>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_storagelocationdata>-plant = ls_logsto-werks.
      ELSE.
        ls_storagelocationdata-plant = ls_logsto-werks.
        INSERT ls_storagelocationdata INTO lt_storagelocationdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_totalconsumption INTO ls_totalconsumption
  WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_totalconsumption ASSIGNING <fs_totalconsumption>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_totalconsumption>-plant = ls_logsto-werks.
      ELSE.
        ls_totalconsumption-plant = ls_logsto-werks.
        INSERT ls_totalconsumption INTO lt_totalconsumption INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_unplndconsumption INTO ls_unplndconsumption
  WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_unplndconsumption ASSIGNING <fs_unplndconsumption>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_unplndconsumption>-plant = ls_logsto-werks.
      ELSE.
        ls_unplndconsumption-plant = ls_logsto-werks.
        INSERT ls_unplndconsumption INTO lt_unplndconsumption INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_posdata INTO ls_posdata
  WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_posdata ASSIGNING <fs_posdata>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_posdata>-plant = ls_logsto-werks.
      ELSE.
        ls_posdata-plant = ls_logsto-werks.
        INSERT ls_posdata INTO lt_posdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_storagelocationkeys INTO ls_storagelocationkeys
      WITH KEY plant = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_storagelocationkeys ASSIGNING <fs_storagelocationkeys>
        WITH KEY plant = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_storagelocationkeys>-plant = ls_logsto-werks.
      ELSE.
        ls_storagelocationkeys-plant = ls_logsto-werks.
        INSERT ls_storagelocationkeys INTO lt_storagelocationkeys INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_valuationdata INTO ls_valuationdata
  WITH KEY val_area = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_valuationdata ASSIGNING <fs_valuationdata>
        WITH KEY val_area = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_valuationdata>-val_area = ls_logsto-werks.
      ELSE.
        ls_valuationdata-val_area = ls_logsto-werks.
        INSERT ls_valuationdata INTO lt_valuationdata INDEX lv_tabix.
      ENDIF.
    ENDIF.

    READ TABLE lt_valuationtypekeys INTO ls_valuationtypekeys
      WITH KEY val_area = lv_sitesto.
    IF sy-subrc IS INITIAL.
      lv_tabix = sy-tabix.
      READ TABLE lt_valuationtypekeys ASSIGNING <fs_valuationtypekeys>
        WITH KEY val_area = ls_logsto-werks.
      IF sy-subrc IS INITIAL.
        <fs_valuationtypekeys>-val_area = ls_logsto-werks.
      ELSE.
        ls_valuationtypekeys-val_area = ls_logsto-werks.
        INSERT ls_valuationtypekeys INTO lt_valuationtypekeys INDEX lv_tabix.
      ENDIF.
    ENDIF.
  ENDLOOP.

* For LogDC (key Material & Division)

  LOOP AT lt_logdc INTO ls_logdc.
    UNASSIGN : <fs_key>, <fs_key_bis>.
    ASSIGN COMPONENT 'WERKS' OF STRUCTURE ls_logdc TO <fs_key>.

    READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
      WITH KEY worklist_table = '/DLWUPEX/TLOGDC'
      BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
        READ TABLE lt_tfields TRANSPORTING NO FIELDS
           WITH KEY viewname = gc_logdcview
                    tabfield = <fs_ale2wt>-worklist_field.
        CHECK sy-subrc IS INITIAL.
        UNASSIGN : <fs_key_bis>.
        IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TLOGDC'.
          EXIT.
        ENDIF.
        CHECK <fs_ale2wt>-worklist_field IS NOT INITIAL.
        UNASSIGN : <lt_itab>, <lt_itab_bis>, <fs_field>.
        lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
        ASSIGN (lv_tabname) TO <lt_itab>.
        CHECK <lt_itab> IS ASSIGNED.

        ASSIGN COMPONENT <fs_ale2wt>-worklist_field OF STRUCTURE ls_logdc TO <fs_field>.
        READ TABLE <lt_itab> ASSIGNING <fs_itab> INDEX 1.
        IF sy-subrc IS INITIAL.
          ASSIGN COMPONENT 'PLANT' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
          IF <fs_key_bis> IS ASSIGNED.
            SORT <lt_itab> BY ('PLANT').
          ENDIF.

          CHECK <fs_field> IS ASSIGNED AND
                <fs_key>  IS ASSIGNED.

          LOOP AT <lt_itab> ASSIGNING <fs_itab>.
            lv_tabix = sy-tabix.
            UNASSIGN <fs_mat>.
            ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab> TO <fs_mat>.
            IF <fs_mat> IS ASSIGNED.
              CLEAR <fs_mat>.
            ENDIF.
* Change table contain
            UNASSIGN : <fs_field_bis>, <fs_key_bis>.
            ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab> TO <fs_field_bis>.
            ASSIGN COMPONENT 'PLANT' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
            CHECK <fs_field_bis> IS ASSIGNED.
            IF <fs_key_bis> IS NOT ASSIGNED.
              <fs_field_bis> = <fs_field>.
            ELSEIF <fs_key_bis> IS ASSIGNED.
              IF <fs_key_bis> EQ <fs_key>.
                IF <fs_ale2wt>-idoc_field <> 'PLANT'.
                  <fs_field_bis> = <fs_field>.
                ENDIF.
              ELSE.
* Delete Line of Worklist if needed.
                READ TABLE lt_logdc TRANSPORTING NO FIELDS
                  WITH KEY werks = <fs_key_bis>
                  BINARY SEARCH.
                IF sy-subrc IS NOT INITIAL.
                  READ TABLE lt_logsto TRANSPORTING NO FIELDS
                    WITH KEY werks = <fs_key_bis>
                    BINARY SEARCH.
                  IF sy-subrc IS NOT INITIAL.
                    IF <fs_key_bis> <> lv_sitedc.
                      DELETE <lt_itab> INDEX lv_tabix.
                    ENDIF.
*                    CONTINUE.
                  ENDIF.
                ENDIF.
* Add Line from Worklist if needed.
                READ TABLE <lt_itab> TRANSPORTING NO FIELDS
                  WITH KEY ('PLANT') = <fs_key>
                  BINARY SEARCH.
                IF sy-subrc IS NOT INITIAL.
                  CREATE DATA new_line LIKE LINE OF <lt_itab>.
                  ASSIGN new_line->* TO <fs_itab2>.
                  CHECK <fs_itab2> IS ASSIGNED.
                  ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
                  IF <fs_mat> IS ASSIGNED.
                    <fs_mat> = iv_matnr.
                  ENDIF.
                  ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
                  ASSIGN COMPONENT 'PLANT' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
                  <fs_key_bis> = <fs_key>.
                  <fs_field_bis> = <fs_field>.
                  INSERT <fs_itab2> INTO <lt_itab> INDEX sy-tabix.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDLOOP.
        ELSE. " sy-subrc IS NOT INITIAL.
          CREATE DATA new_line LIKE LINE OF <lt_itab>.
          ASSIGN new_line->* TO <fs_itab2>.
          CHECK <fs_itab2> IS ASSIGNED.
          ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
          IF <fs_mat> IS ASSIGNED.
            <fs_mat> = iv_matnr.
          ENDIF.
          ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
          ASSIGN COMPONENT 'PLANT' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
          IF <fs_key_bis> IS ASSIGNED AND <fs_key> IS ASSIGNED.
            <fs_key_bis> = <fs_key>.
          ENDIF.
          <fs_field_bis> = <fs_field>.
          APPEND <fs_itab2> TO <lt_itab>." INDEX sy-tabix.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDLOOP.
*          lt_plantdata_bis = lt_plantdata.

* For LogStore (key Material & Division)

  LOOP AT lt_logsto INTO ls_logsto.
    UNASSIGN : <fs_key>, <fs_key_bis>.
    ASSIGN COMPONENT 'WERKS' OF STRUCTURE ls_logsto TO <fs_key>.

    READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
      WITH KEY worklist_table = '/DLWUPEX/TLOGSTO'
      BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
        READ TABLE lt_tfields TRANSPORTING NO FIELDS
           WITH KEY viewname = gc_logstoview
                    tabfield = <fs_ale2wt>-worklist_field.
        CHECK sy-subrc IS INITIAL.
        UNASSIGN : <fs_key_bis>.
        IF <fs_ale2wt>-worklist_table <> '/DLWUPEX/TLOGSTO'.
          EXIT.
        ENDIF.
        CHECK <fs_ale2wt>-worklist_field IS NOT INITIAL.
        UNASSIGN : <lt_itab>, <lt_itab_bis>, <fs_field>.
        lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
        ASSIGN (lv_tabname) TO <lt_itab>.
        CHECK <lt_itab> IS ASSIGNED.

        ASSIGN COMPONENT <fs_ale2wt>-worklist_field OF STRUCTURE ls_logsto TO <fs_field>.
        READ TABLE <lt_itab> ASSIGNING <fs_itab> INDEX 1.
        IF sy-subrc IS INITIAL.

          ASSIGN COMPONENT 'PLANT' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
          IF <fs_key_bis> IS ASSIGNED.
            SORT <lt_itab> BY ('PLANT').
          ENDIF.

          CHECK <fs_field> IS ASSIGNED AND
                <fs_key>  IS ASSIGNED.

          LOOP AT <lt_itab> ASSIGNING <fs_itab>.
            lv_tabix = sy-tabix.
            UNASSIGN <fs_mat>.
            ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab> TO <fs_mat>.
            IF <fs_mat> IS ASSIGNED.
              CLEAR <fs_mat>.
            ENDIF.
* Change table contain
            UNASSIGN : <fs_field_bis>, <fs_key_bis>.
            ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab> TO <fs_field_bis>.
            ASSIGN COMPONENT 'PLANT' OF STRUCTURE <fs_itab> TO <fs_key_bis>.
            CHECK <fs_field_bis> IS ASSIGNED.
            IF <fs_key_bis> IS NOT ASSIGNED.
              <fs_field_bis> = <fs_field>.
            ELSEIF <fs_key_bis> IS ASSIGNED.
              IF <fs_key_bis> EQ <fs_key>.
                IF <fs_ale2wt>-idoc_field <> 'PLANT'.
                  <fs_field_bis> = <fs_field>.
                ENDIF.
              ELSE.
* Delete Line of Worklist if needed.
                READ TABLE lt_logsto TRANSPORTING NO FIELDS
                  WITH KEY werks = <fs_key_bis>
                  BINARY SEARCH.
                IF sy-subrc IS NOT INITIAL.
                  READ TABLE lt_logdc TRANSPORTING NO FIELDS
                    WITH KEY werks = <fs_key_bis>
                    BINARY SEARCH.
                  IF sy-subrc IS NOT INITIAL.
                    IF <fs_key_bis> <> lv_sitedc.
                      DELETE <lt_itab> INDEX lv_tabix.
                    ENDIF.
*                    CONTINUE.
                  ENDIF.
                ENDIF.
* Add Line from Worklist if needed.
                READ TABLE <lt_itab> TRANSPORTING NO FIELDS
                  WITH KEY ('PLANT') = <fs_key>
                  BINARY SEARCH.
                IF sy-subrc IS NOT INITIAL.
                  CREATE DATA new_line LIKE LINE OF <lt_itab>.
                  ASSIGN new_line->* TO <fs_itab2>.
                  CHECK <fs_itab2> IS ASSIGNED.
                  ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
                  IF <fs_mat> IS ASSIGNED.
                    <fs_mat> = iv_matnr.
                  ENDIF.
                  ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
                  ASSIGN COMPONENT 'PLANT' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
                  <fs_key_bis> = <fs_key>.
                  <fs_field_bis> = <fs_field>.
                  INSERT <fs_itab2> INTO <lt_itab> INDEX sy-tabix.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDLOOP.
        ELSE. " sy-subrc IS NOT INITIAL.
          CREATE DATA new_line LIKE LINE OF <lt_itab>.
          ASSIGN new_line->* TO <fs_itab2>.
          CHECK <fs_itab2> IS ASSIGNED.
          ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab2> TO <fs_mat>.
          IF <fs_mat> IS ASSIGNED.
            <fs_mat> = iv_matnr.
          ENDIF.
          ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
          ASSIGN COMPONENT 'PLANT' OF STRUCTURE <fs_itab2> TO <fs_key_bis>.
          IF <fs_key_bis> IS ASSIGNED AND <fs_key> IS ASSIGNED.
            <fs_key_bis> = <fs_key>.
          ENDIF.
          <fs_field_bis> = <fs_field>.
          APPEND <fs_itab2> TO <lt_itab>." INDEX sy-tabix.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDLOOP.

* Alim Headdata
  SORT lt_ale2wt.
  READ TABLE lt_ale2wt TRANSPORTING NO FIELDS
          WITH KEY idoc_struct = 'HEADDATA'
          BINARY SEARCH.
  IF sy-subrc IS NOT INITIAL.
    cv_rc = sy-subrc.
    EXIT.
  ENDIF.
  LOOP AT lt_ale2wt ASSIGNING <fs_ale2wt> FROM sy-tabix.
    IF  <fs_ale2wt>-idoc_struct <> 'HEADDATA'.
      EXIT.
    ENDIF.
    UNASSIGN : <fs_field_bis>, <fs_field>, <fs_itab>.
    lv_tabname = 'LT_' && <fs_ale2wt>-worklist_table+10.
    CHECK sy-subrc IS INITIAL.
    ASSIGN (lv_tabname) TO <lt_itab>.
    CHECK <lt_itab> IS ASSIGNED.

    READ TABLE <lt_itab> ASSIGNING <fs_itab>
          WITH KEY ('ART_KEY') = iv_matnr
          BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      ASSIGN COMPONENT <fs_ale2wt>-idoc_field OF STRUCTURE ls_headdata TO <fs_field_bis>.
      ASSIGN COMPONENT <fs_ale2wt>-worklist_field OF STRUCTURE <fs_itab> TO <fs_field>.
      CHECK <fs_field_bis> IS ASSIGNED AND <fs_field> IS ASSIGNED.
      <fs_field_bis> = <fs_field>.
    ENDIF.
  ENDLOOP.
  ls_headdata-function = lc_create.
  ls_headdata-matl_type = lv_mtart.
  ls_headdata-basic_view = abap_true.
  CLEAR ls_headdata-material_long.



  IF lv_art IS INITIAL.
    CALL FUNCTION 'MATERIAL_NUMBER_GET_NEXT'
      EXPORTING
        materialart          = lv_mtart
      IMPORTING
        materialnr           = lv_art
*       RETURNCODE           =
      EXCEPTIONS
        no_internal_interval = 1
        type_not_found       = 2
        OTHERS               = 3.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

  ENDIF.


*    /DLWUPEX/Tgdata
  LOOP AT lt_gdata ASSIGNING FIELD-SYMBOL(<gs_gdata>).
    <gs_gdata>-matnr = lv_art.
  ENDLOOP.
*    /DLWUPEX/TUNIT
  LOOP AT lt_unit ASSIGNING FIELD-SYMBOL(<gs_unit>).
    <gs_unit>-matnr = lv_art.
  ENDLOOP.
*    /DLWUPEX/TCARACT
  LOOP AT lt_caract ASSIGNING FIELD-SYMBOL(<gs_caract>).
    <gs_caract>-matnr = lv_art.
  ENDLOOP.
*    /DLWUPEX/TBOM
  LOOP AT lt_bom ASSIGNING FIELD-SYMBOL(<gs_bom>).
    <gs_bom>-matnr = lv_art.
  ENDLOOP.
*    /DLWUPEX/TFIA
  LOOP AT lt_fia ASSIGNING FIELD-SYMBOL(<gs_fia>).
    <gs_fia>-matnr = lv_art.
  ENDLOOP.
*    /DLWUPEX/TLIST
  LOOP AT lt_list ASSIGNING FIELD-SYMBOL(<gs_list>).
    <gs_list>-matnr = lv_art.
  ENDLOOP.
*    /DLWUPEX/TSRLIST
  LOOP AT lt_srlist ASSIGNING FIELD-SYMBOL(<gs_srlist>).
    <gs_srlist>-matnr = lv_art.
  ENDLOOP.
*    /DLWUPEX/TSALE
  LOOP AT lt_sale ASSIGNING FIELD-SYMBOL(<gs_sale>).
    <gs_sale>-matnr = lv_art.
  ENDLOOP.
*    /DLWUPEX/TLOGDC
  LOOP AT lt_logdc ASSIGNING FIELD-SYMBOL(<gs_logdc>).
    <gs_logdc>-matnr = lv_art.
  ENDLOOP.
*    /DLWUPEX/TLOGSTO
  LOOP AT lt_logsto ASSIGNING FIELD-SYMBOL(<gs_logsto>).
    <gs_logsto>-matnr = lv_art.
  ENDLOOP.

  CALL METHOD /dlwupex/cl_cockpit_article=>get_data
    EXPORTING
      iv_bu     = iv_bu
      iv_reqid  = iv_reqid
    CHANGING
      ct_reqids = lt_reqids
      cv_rc     = cv_rc.


  IF  <fs_gdata>-ccngn IS INITIAL.
    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = gc_statuscompleted
      CHANGING
        ct_unit   = lt_unit
        ct_caract = lt_caract
*       ct_bom    = lt_bom
*       ct_fia    = lt_fia
*       ct_list   = lt_list
*       ct_srlist = lt_srlist
        ct_sale   = lt_sale
        ct_logdc  = lt_logdc
        ct_logsto = lt_logsto
        ct_gdata  = lt_gdata
*       ct_reqids = lt_reqids
        cv_rc     = cv_rc.
  ELSE.
    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = gc_statuscompleted
      CHANGING
        ct_unit   = lt_unit
        ct_caract = lt_caract
*       ct_bom    = lt_bom
*       ct_fia    = lt_fia
*       ct_list   = lt_list
*       ct_srlist = lt_srlist
        ct_sale   = lt_sale
        ct_logdc  = lt_logdc
        ct_logsto = lt_logsto
*       ct_reqids = lt_reqids
*       ct_gdata  = lt_gdata
        cv_rc     = cv_rc.
  ENDIF.

  CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
    EXPORTING
      iv_bu     = iv_bu
      it_gdata  = lt_gdata
      it_unit   = lt_unit
      it_caract = lt_caract
      it_bom    = lt_bom
      it_fia    = lt_fia
      it_list   = lt_list
      it_srlist = lt_srlist
      it_sale   = lt_sale
      it_logdc  = lt_logdc
      it_logsto = lt_logsto
    CHANGING
      ct_msg    = ct_msg
      cv_rc     = cv_rc
      cv_reqid  = lv_reqid.

  COMMIT WORK AND WAIT.


  ls_headdata-material = lv_art.

  SORT lt_ale2wt_bis BY idoc_struct.
  DELETE ADJACENT DUPLICATES FROM lt_ale2wt_bis COMPARING idoc_struct.

  DATA lt_struct TYPE TABLE OF dfies.


  LOOP AT lt_ale2wt_bis ASSIGNING <fs_ale2wt>.
    UNASSIGN : <lt_itab>, <fs_field>, <lt_itab_bis>, <fs_field_bis>.
    lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct.
    ASSIGN (lv_tabname) TO <lt_itab>.
    CHECK <lt_itab> IS ASSIGNED.

* Alim structure 'X'
    lv_tabname = 'LT_' && <fs_ale2wt>-idoc_struct && 'X'.
    ASSIGN (lv_tabname) TO <lt_itab_bis>.
    IF <lt_itab_bis> IS ASSIGNED.
      REFRESH <lt_itab_bis>.
      CREATE DATA new_line LIKE LINE OF <lt_itab_bis>.
      ASSIGN new_line->* TO <fs_itab2>.
      CHECK <fs_itab2> IS ASSIGNED.
      lv_tabname = <fs_ale2wt>-idoc_type_struct && 'X'.
      CALL FUNCTION 'DDIF_FIELDINFO_GET'
        EXPORTING
          tabname   = lv_tabname
        TABLES
          dfies_tab = lt_struct.
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.

      LOOP AT <lt_itab> ASSIGNING <fs_itab>.
        UNASSIGN : <fs_field>.
        ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab> TO <fs_field>.
        IF <fs_field> IS ASSIGNED.
          <fs_field> = lv_art.
        ENDIF.
        UNASSIGN : <fs_field>.
        ASSIGN COMPONENT 'MATERIAL_LONG' OF STRUCTURE <fs_itab> TO <fs_field>.
        IF <fs_field> IS ASSIGNED.
          <fs_field> = lv_art.
        ENDIF.
        UNASSIGN : <fs_field>.
        ASSIGN COMPONENT 'FUNCTION' OF STRUCTURE <fs_itab> TO <fs_field>.
        IF <fs_field> IS ASSIGNED.
          <fs_field> = lc_create.
        ENDIF.
        UNASSIGN : <fs_field>.
        ASSIGN COMPONENT 'CREATED_ON' OF STRUCTURE <fs_itab> TO <fs_field>.
        IF <fs_field> IS ASSIGNED.
          <fs_field> = sy-datum.
        ENDIF.
        UNASSIGN : <fs_field>.
        ASSIGN COMPONENT 'CREATED_BY' OF STRUCTURE <fs_itab> TO <fs_field>.
        IF <fs_field> IS ASSIGNED.
          <fs_field> = sy-uname.
        ENDIF.
        UNASSIGN : <fs_field>.


* X data
        LOOP AT lt_struct INTO DATA(ls_struct).
          ASSIGN COMPONENT ls_struct-fieldname OF STRUCTURE <fs_itab> TO <fs_field>.
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.
          ASSIGN COMPONENT ls_struct-fieldname OF STRUCTURE <fs_itab2> TO <fs_field_bis>.
          IF <fs_field> IS NOT INITIAL.
            IF ls_struct-domname EQ 'BAPIUPDATE'.
              <fs_field_bis> = abap_true.
            ELSE.
              <fs_field_bis> = <fs_field>.
            ENDIF.
          ENDIF.
        ENDLOOP.
        APPEND <fs_itab2> TO <lt_itab_bis>.
      ENDLOOP.
    ELSE.
      LOOP AT <lt_itab> ASSIGNING <fs_itab>.
        UNASSIGN : <fs_field>.
        ASSIGN COMPONENT 'MATERIAL' OF STRUCTURE <fs_itab> TO <fs_field>.
        IF <fs_field> IS ASSIGNED.
          <fs_field> = lv_art.
        ENDIF.
        UNASSIGN : <fs_field>.
        ASSIGN COMPONENT 'MATERIAL_LONG' OF STRUCTURE <fs_itab> TO <fs_field>.
        IF <fs_field> IS ASSIGNED.
          <fs_field> = lv_art.
        ENDIF.
        UNASSIGN : <fs_field>.
        ASSIGN COMPONENT 'FUNCTION' OF STRUCTURE <fs_itab> TO <fs_field>.
        IF <fs_field> IS ASSIGNED.
          <fs_field> = lc_create.
        ENDIF.
        UNASSIGN : <fs_field>.
      ENDLOOP.
    ENDIF.
  ENDLOOP.


  CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
    EXPORTING
      iv_bu     = iv_bu
    RECEIVING
      rv_object = lv_object.
  IF lv_object IS NOT INITIAL.
    CALL METHOD lv_object->bapi_mat_specific_fields
      EXPORTING
        iv_bu                  = iv_bu
        iv_reqid               = iv_reqid
        iv_art_key             = iv_matnr
        iv_matnr               = lv_art
        it_plantdata           = lt_plantdata
      CHANGING
        ct_clientext           = lt_clientext
        ct_clientextx          = lt_clientextx
        ct_plantext            = lt_plantext
        ct_plantextx           = lt_plantextx
        ct_storagelocationext  = lt_storagelocationext
        ct_storagelocationextx = lt_storagelocationextx
        ct_valuationext        = lt_valuationext
        ct_valuationextx       = lt_valuationextx
        ct_warehousenumberext  = lt_warehousenumberext
        ct_warehousenumberextx = lt_warehousenumberextx
        ct_storagetypeext      = lt_storagetypeext
        ct_storagetypeextx     = lt_storagetypeextx
        ct_salesext            = lt_salesext
        ct_salesextx           = lt_salesextx
        ct_posext              = lt_posext
        ct_posextx             = lt_posextx.
  ENDIF.

  CALL FUNCTION 'BAPI_MATERIAL_MAINTAINDATA_RT'
    EXPORTING
      headdata               = ls_headdata
    IMPORTING
      return                 = ls_return
    TABLES
*     variantskeys           =
      characteristicvalue    = lt_characteristicvalue
      characteristicvaluex   = lt_characteristicvaluex
      clientdata             = lt_clientdata
      clientdatax            = lt_clientdatax
      clientext              = lt_clientext
      clientextx             = lt_clientextx
      addnlclientdata        = lt_addnlclientdata
      addnlclientdatax       = lt_addnlclientdatax
      materialdescription    = lt_materialdescription
      plantdata              = lt_plantdata
      plantdatax             = lt_plantdatax
      plantext               = lt_plantext
      plantextx              = lt_plantextx
      forecastparameters     = lt_forecastparameters
      forecastparametersx    = lt_forecastparametersx
      forecastvalues         = lt_forecastvalues
      totalconsumption       = lt_totalconsumption
      unplndconsumption      = lt_unplndconsumption
      planningdata           = lt_planningdata
      planningdatax          = lt_planningdatax
      storagelocationdata    = lt_storagelocationdata
      storagelocationdatax   = lt_storagelocationdatax
      storagelocationext     = lt_storagelocationext
      storagelocationextx    = lt_storagelocationextx
      unitsofmeasure         = lt_unitsofmeasure
      unitsofmeasurex        = lt_unitsofmeasurex
      unitofmeasuretexts     = lt_unitofmeasuretexts
*     internationalartnos    = lt_internationalartnos
      vendorean              = lt_vendorean
      layoutmoduleassgmt     = lt_layoutmoduleassgmt
      layoutmoduleassgmtx    = lt_layoutmoduleassgmtx
      taxclassifications     = lt_taxclassifications
      valuationdata          = lt_valuationdata
      valuationdatax         = lt_valuationdatax
      valuationext           = lt_valuationext
      valuationextx          = lt_valuationextx
      warehousenumberdata    = lt_warehousenumberdata
      warehousenumberdatax   = lt_warehousenumberdatax
      warehousenumberext     = lt_warehousenumberext
      warehousenumberextx    = lt_warehousenumberextx
      storagetypedata        = lt_storagetypedata
      storagetypedatax       = lt_storagetypedatax
      storagetypeext         = lt_storagetypeext
      storagetypeextx        = lt_storagetypeextx
      salesdata              = lt_salesdata
      salesdatax             = lt_salesdatax
      salesext               = lt_salesext
      salesextx              = lt_salesextx
      posdata                = lt_posdata
      posdatax               = lt_posdatax
      posext                 = lt_posext
      posextx                = lt_posextx
      materiallongtext       = lt_materiallongtext
      plantkeys              = lt_plantkeys
      storagelocationkeys    = lt_storagelocationkeys
      distrchainkeys         = lt_distrchainkeys
      warehousenokeys        = lt_warehousenokeys
      storagetypekeys        = lt_storagetypekeys
      valuationtypekeys      = lt_valuationtypekeys
      textilecomponents      = lt_textilecomponents
      fibercodes             = lt_fibercodes
      segsalesstatus         = lt_segsalesstatus
      segweightvolume        = lt_segweightvolume
      segvaluationtype       = lt_segvaluationtype
      seasons                = lt_seasons
      segwarehousenumberdata = lt_segwarehousenumberdata
      segstoragetypedata     = lt_segstoragetypedata
      segmrpgeneraldata      = lt_segmrpgeneraldata
      segmrpquantitydata     = lt_segmrpquantitydata.

  IF ls_return-type = 'E' AND ls_return-log_no IS NOT INITIAL.


    SORT lt_tfields BY tabname viewname.
    DELETE ADJACENT DUPLICATES FROM lt_tfields COMPARING tabname viewname.

    ls_lognumbers-item = ls_return-log_no.
    APPEND ls_lognumbers TO lt_lognumbers.

    CALL FUNCTION 'APPL_LOG_READ_DB_WITH_LOGNO'
      TABLES
        lognumbers = lt_lognumbers
        messages   = lt_message.
    DELETE lt_message WHERE msgty <> 'E'.
    LOOP AT lt_message ASSIGNING FIELD-SYMBOL(<fs_message>).
      ls_msg-id = iv_bu.
      ls_msg-reqid = iv_reqid.
      ls_msg-matnr = iv_matnr.
      ls_msg-idmsg = <fs_message>-msgid.
      ls_msg-type = <fs_message>-msgty.
      ls_msg-num = <fs_message>-msgno.
      ls_msg-message_v1 = <fs_message>-msgv1.
      ls_msg-message_v2 = <fs_message>-msgv2.
      ls_msg-message_v3 = <fs_message>-msgv3.
      ls_msg-message_v4 = <fs_message>-msgv4.


      lv_tabcusto = <fs_message>-msgv1(4).
      READ TABLE lt_tfields TRANSPORTING NO FIELDS
       WITH KEY tabname = lv_tabcusto
       BINARY SEARCH.
      IF sy-subrc IS NOT INITIAL.
        ls_msg-viewname = gc_gdataview.
*                ls_view-viewname = ls_msg-viewname.
*                APPEND ls_view TO lt_view.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
           INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2
                                    ls_msg-message_v3 ls_msg-message_v4.
        APPEND ls_msg TO lt_msg.
      ELSE.
        LOOP AT lt_tfields ASSIGNING FIELD-SYMBOL(<fs_tfields>) FROM sy-tabix.
          IF <fs_tfields>-tabname <> lv_tabcusto.
            EXIT.
          ENDIF.
          lv_tabname = lv_tabcusto.
          lv_tabfield = <fs_message>-msgv1+5(5).

          CALL FUNCTION 'DDIF_FIELDINFO_GET'
            EXPORTING
              tabname        = lv_tabname
              fieldname      = lv_tabfield
              langu          = sy-langu
            TABLES
              dfies_tab      = lt_dfies_tab
            EXCEPTIONS
              not_found      = 1
              internal_error = 2
              OTHERS         = 3.
          IF sy-subrc EQ 0.
            READ TABLE lt_dfies_tab ASSIGNING FIELD-SYMBOL(<fs_dfies_line>)
            INDEX 1.
            IF sy-subrc EQ 0.
*             On stock le libelle du champ
              ls_msg-message_v1 = <fs_dfies_line>-fieldtext.
            ENDIF.
          ENDIF.

          ls_msg-viewname = <fs_tfields>-viewname.
          ls_msg-field = <fs_message>-msgv1+5(5).
*                  ls_view-viewname = ls_msg-viewname.
*                  APPEND ls_view TO lt_view.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
           INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2
                                    ls_msg-message_v3 ls_msg-message_v4.

          APPEND ls_msg TO lt_msg.
        ENDLOOP.
      ENDIF.
    ENDLOOP.

    CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
      EXPORTING
        it_msg = lt_msg
      CHANGING
        cv_rc  = cv_rc
        ct_msg = ct_msg.

    CLEAR ls_msg.
    ls_msg-type       = ls_return-type.
    ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
    ls_msg-num        = '036'.
    ls_msg-message_v1 = ls_return-log_no.
    cv_rc = 4.

  ELSE.
    ls_msg-id = iv_bu.
    ls_msg-reqid = iv_reqid.
    ls_msg-matnr = iv_matnr.
    ls_msg-idmsg = ls_return-id.
    ls_msg-viewname = gc_gdataview.
    ls_msg-type = ls_return-type.
    ls_msg-num = ls_return-number.
    ls_msg-message = ls_return-message.
    ls_msg-log_no = ls_return-log_no.
    ls_msg-log_msg_no = ls_return-log_msg_no.
    ls_msg-message_v1 = ls_return-message_v1.
    ls_msg-message_v2 = ls_return-message_v2.
    ls_msg-message_v3 = ls_return-message_v3.
    ls_msg-message_v4 = ls_return-message_v4.
    APPEND ls_msg TO lt_msg.
    IF ls_return-type = 'E'.
      CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
        EXPORTING
          it_msg = lt_msg
        CHANGING
          cv_rc  = cv_rc
          ct_msg = ct_msg.
      cv_rc = 4.
    ENDIF.

  ENDIF.
  APPEND ls_msg TO ct_msg.

  CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
    EXPORTING
      wait = 'X'.

  IF ls_return-type = 'E'.

*            SORT lt_view.
*            DELETE ADJACENT DUPLICATES FROM lt_view.
    REFRESH t_params.

    l_param-name = 'IV_STATUS'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF gc_statusinerror INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

*            LOOP AT lt_view ASSIGNING FIELD-SYMBOL(<fs_view>).
*              CASE <fs_view>-viewname.
*                WHEN gc_gdataview. "Données Générales
    CLEAR l_param.
    l_param-name = 'CT_GDATA'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_gdata INTO l_param-value.
    INSERT l_param INTO TABLE t_params.
*                WHEN gc_unitview. "Données Unités et EAN
    CLEAR l_param.
    l_param-name = 'CT_UNIT'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_unit INTO l_param-value.
    INSERT l_param INTO TABLE t_params.
*                WHEN gc_caractview. "Caractéristiques
    CLEAR l_param.
    l_param-name = 'CT_CARACT'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_caract INTO l_param-value.
    INSERT l_param INTO TABLE t_params.
*                WHEN gc_saleview. "Données Ventes
    CLEAR l_param.
    l_param-name = 'CT_SALE'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_sale INTO l_param-value.
    INSERT l_param INTO TABLE t_params.
*                WHEN gc_logdcview. "Log Site ref DC
    CLEAR l_param.
    l_param-name = 'CT_LOGDC'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_logdc INTO l_param-value.
    INSERT l_param INTO TABLE t_params.
*                WHEN gc_logstoview. "Log Site ref Store

    CLEAR l_param.
    l_param-name = 'CT_LOGSTO'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_logsto INTO l_param-value.
*                WHEN OTHERS.
*              ENDCASE.
    INSERT l_param INTO TABLE t_params.
*            ENDLOOP.

    CLEAR l_param.
    l_param-name = 'CT_REQIDS'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_reqids INTO l_param-value.
*                WHEN OTHERS.
*              ENDCASE.
    INSERT l_param INTO TABLE t_params.
*            ENDLOOP.


    l_param-name = 'CV_RC'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF cv_rc INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CALL METHOD ('/DLWUPEX/CL_COCKPIT_ARTICLE')=>change_status
      PARAMETER-TABLE
      t_params.

*  ELSE.

*    IF  <fs_gdata>-ccngn IS INITIAL.
*      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
*        EXPORTING
*          iv_status = gc_statuscompleted
*        CHANGING
*          ct_unit   = lt_unit
*          ct_caract = lt_caract
**         ct_bom    = lt_bom
**         ct_fia    = lt_fia
**         ct_list   = lt_list
**         ct_srlist = lt_srlist
*          ct_sale   = lt_sale
*          ct_logdc  = lt_logdc
*          ct_logsto = lt_logsto
*          ct_gdata  = lt_gdata
*          ct_reqids = lt_reqids
*          cv_rc     = cv_rc.
*    ELSE.
*      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
*        EXPORTING
*          iv_status = gc_statuscompleted
*        CHANGING
*          ct_unit   = lt_unit
*          ct_caract = lt_caract
**         ct_bom    = lt_bom
**         ct_fia    = lt_fia
**         ct_list   = lt_list
**         ct_srlist = lt_srlist
*          ct_sale   = lt_sale
*          ct_logdc  = lt_logdc
*          ct_logsto = lt_logsto
*          ct_reqids = lt_reqids
**         ct_gdata  = lt_gdata
*          cv_rc     = cv_rc.
*    ENDIF.

    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu     = iv_bu
        it_gdata  = lt_gdata
        it_unit   = lt_unit
        it_caract = lt_caract
        it_bom    = lt_bom
        it_fia    = lt_fia
        it_list   = lt_list
        it_srlist = lt_srlist
        it_sale   = lt_sale
        it_logdc  = lt_logdc
        it_logsto = lt_logsto
      CHANGING
        ct_msg    = ct_msg
        cv_rc     = cv_rc
        cv_reqid  = lv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
      EXPORTING
        it_reqids        = lt_reqids
        iv_change_reqids = 'X'
      CHANGING
        ct_msg           = ct_msg
        cv_rc            = cv_rc.

    COMMIT WORK AND WAIT.


  ELSE.
    READ TABLE lt_gdata INTO ls_gdata INDEX 1.

    SELECT SINGLE wwgda FROM t023 INTO lv_ref_art
              WHERE matkl = ls_gdata-matkl.

    CALL FUNCTION 'WTAD_READ_ADDI_4_MATNR'
      EXPORTING
        matnr      = lv_ref_art
      TABLES
        iwtaddi    = lt_taddi
      EXCEPTIONS
        wrong_call = 1
        db_error   = 2
        OTHERS     = 3.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.


    READ TABLE lt_taddi INTO DATA(ls_taddi) INDEX 1.
    IF sy-subrc IS INITIAL.

      ls_maintaindata-function = lc_create.
      ls_maintaindata-material = lv_art.


      ls_maintaindata-sales_unit = ls_gdata-meins.
      ls_maintaindata-procedure = ls_taddi-addifm.

      APPEND ls_maintaindata TO lt_maintaindata.

      CALL FUNCTION 'BAPI_ADDITIONAL_MAINTAINDATA'
        TABLES
          maintaindata = lt_maintaindata
          return       = lt_return.

      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        EXPORTING
          wait = 'X'.

    ENDIF.
  ENDIF.

ENDMETHOD.


  METHOD bapi_create_nomenc.

    DATA : lo_classi   TYPE REF TO /sapsll/cl_prcls_api,
           lt_gdata	   TYPE /dlwupex/tgdata_tt,
           lt_reqids   TYPE /dlwupex/treqids_tt,
           lt_products TYPE /sapsll/matnr_t,
           lt_messages TYPE bapiret2_t,
           ls_msg      TYPE /dlwupex/tmsg,
           lv_status   TYPE /dlwupex/elinestatus,
           lv_reqid    TYPE /dlwupex/ereqid,
           t_params    TYPE abap_parmbind_tab,
           l_param     TYPE abap_parmbind.

    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.


*** Alimentation des paramètres pour appel de méthode de récupération de données articles
    l_param-name = 'IV_BU'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_bu INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'IV_REQID'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_reqid INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'IV_ART_KEY'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_matnr INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'CV_RC'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF cv_rc INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

* Tables pour récupération des données articles
*     /DLWUPEX/TGDATA
    CLEAR l_param.
    l_param-name = 'CT_GDATA'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_gdata INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CALL METHOD ('/DLWUPEX/CL_COCKPIT_ARTICLE')=>read_data_from_matnr
      PARAMETER-TABLE
      t_params.

    READ TABLE lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>) INDEX 1.
    CHECK <fs_gdata> IS ASSIGNED.
    IF <fs_gdata>-ccngn IS NOT INITIAL.

      CREATE OBJECT lo_classi.

*    APPEND iv_matnr TO lt_products.
      APPEND <fs_gdata>-matnr TO lt_products.

      CALL METHOD lo_classi->create_classification
        EXPORTING
          iv_stcts    = 'EU01'
          iv_ccngn    = <fs_gdata>-ccngn
          iv_datab    = <fs_gdata>-databb
          iv_datbi    = <fs_gdata>-datbi
          it_products = lt_products
        IMPORTING
          et_messages = lt_messages.


      IF lt_messages[] IS NOT INITIAL.
        CLEAR : ls_msg.
        LOOP AT lt_messages INTO DATA(ls_messages).
          IF ls_messages-type EQ 'E'.
*           On remplit la table de message d'erreur.
            ls_msg-id         = iv_bu.
            ls_msg-reqid      = iv_reqid.
            ls_msg-matnr      = iv_matnr.
            ls_msg-viewname   = gc_gdataview.
            ls_msg-type       = ls_messages-type.
            ls_msg-idmsg      = ls_messages-id.
            ls_msg-num        = ls_messages-number.
            ls_msg-message    = ls_messages-message.
            APPEND ls_msg TO ct_msg.
            cv_rc = 4.
          ENDIF.

        ENDLOOP.

        CLEAR lv_status.
        IF cv_rc IS NOT INITIAL.
          lv_status = gc_statusinerror.

          CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
            EXPORTING
              it_msg = ct_msg
            CHANGING
              cv_rc  = cv_rc
              ct_msg = ct_msg.

          CALL METHOD /dlwupex/cl_cockpit_article=>change_status
            EXPORTING
              iv_status = gc_statusinerror
            CHANGING
              ct_gdata    = lt_gdata
              ct_reqids = lt_reqids
              cv_rc     = cv_rc.


          CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
            EXPORTING
              iv_bu    = iv_bu
              it_gdata = lt_gdata
            CHANGING
              ct_msg   = ct_msg
              cv_rc    = cv_rc
              cv_reqid = lv_reqid.

          CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
            EXPORTING
              it_reqids        = lt_reqids
              iv_change_reqids = abap_true
            CHANGING
              ct_msg           = ct_msg
              cv_rc            = cv_rc.

          COMMIT WORK AND WAIT.
          EXIT.

        ELSE.
          lv_status = gc_statuscompleted.
        ENDIF.
      ELSE.
        lv_status = gc_statuscompleted.
      ENDIF.
    ELSE.
      lv_status = gc_statuscompleted.
    ENDIF.

    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = lv_status
      CHANGING
        ct_gdata  = lt_gdata
        cv_rc     = cv_rc.


    lv_reqid = iv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu    = iv_bu
        it_gdata = lt_gdata
      CHANGING
        ct_msg   = ct_msg
        cv_rc    = cv_rc
        cv_reqid = lv_reqid.

    COMMIT WORK AND WAIT.




  ENDMETHOD.


  METHOD bapi_create_sale_pricing.

    DATA :
      lt_sale     TYPE /dlwupex/tsale_tt,
      lt_gdata    TYPE /dlwupex/tgdata_tt,
      lt_reqids   TYPE /dlwupex/treqids_tt,
      lt_messages TYPE bapiret2_t,
      ls_msg      TYPE /dlwupex/tmsg,
      lv_status   TYPE /dlwupex/elinestatus,
      lv_reqid    TYPE /dlwupex/ereqid,
      t_params    TYPE abap_parmbind_tab,
      l_param     TYPE abap_parmbind.
    DATA : ls_cond_change TYPE /dlwupex/price_cond.
*          lt_bapict      TYPE TABLE OF bapicondct,
*           ls_bapict      TYPE bapicondct,
*           lt_bapihd      TYPE TABLE OF bapicondhd,
*           ls_bapihd      TYPE bapicondhd,
*           lt_bapiit      TYPE TABLE OF bapicondit,
*           ls_bapiit      TYPE bapicondit,
*           lt_bapiqs      TYPE TABLE OF bapicondqs,
*           ls_bapiqs      TYPE bapicondqs,
*           lt_bapivs      TYPE TABLE OF bapicondvs,
*           ls_bapivs      TYPE bapicondvs,
*           lt_bapiknumhs  TYPE TABLE OF bapiknumhs,
*           ls_bapiknumhs  TYPE bapiknumhs,
*           lt_mem_initial TYPE TABLE OF cnd_mem_initial,
*           ls_mem_initial TYPE cnd_mem_initial.

    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

*** Alimentation des paramètres pour appel de méthode de récupération de données articles
    l_param-name = 'IV_BU'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_bu INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'IV_REQID'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_reqid INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'IV_ART_KEY'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF iv_matnr INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CLEAR l_param.
    l_param-name = 'CV_RC'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF cv_rc INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

* Tables pour récupération des données articles
*     /DLWUPEX/TSALE
    CLEAR l_param.
    l_param-name = 'CT_SALE'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_sale INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

*     /DLWUPEX/TGDATA
    CLEAR l_param.
    l_param-name = 'CT_GDATA'.
    l_param-kind = cl_abap_objectdescr=>changing.
    GET REFERENCE OF lt_gdata INTO l_param-value.
    INSERT l_param INTO TABLE t_params.

    CALL METHOD ('/DLWUPEX/CL_COCKPIT_ARTICLE')=>read_data_from_matnr
      PARAMETER-TABLE
      t_params.

    LOOP AT lt_sale ASSIGNING FIELD-SYMBOL(<fs_sale>).
      REFRESH : lt_messages.
      CLEAR ls_cond_change.
*      REFRESH : lt_bapict, lt_bapihd, lt_bapiit, lt_bapiqs, lt_bapivs,
*          lt_messages, lt_bapiknumhs, lt_mem_initial.

      CHECK <fs_sale>-kbetr IS NOT INITIAL.

*      ls_bapict-operation = '009'.
*      ls_bapict-cond_usage = 'A'.
*      ls_bapict-table_no = '073'.
*      ls_bapict-applicatio = 'V'.
*      ls_bapict-cond_type = 'PR00'.
*      CONCATENATE <fs_sale>-vkorg <fs_sale>-vtweg <fs_sale>-matnr <fs_sale>-kmein
*        INTO ls_bapict-varkey.
*      ls_bapict-valid_to = '99991231'.
*      ls_bapict-valid_from = sy-datum.
*      ls_bapict-cond_no = '$000000001'.
*      APPEND ls_bapict TO lt_bapict.
*
*      ls_bapihd-operation = '009'.
*      ls_bapihd-cond_no = '$000000001'.
*      ls_bapihd-created_by = sy-uname.
*      ls_bapihd-creat_date = sy-datum.
*      ls_bapihd-cond_usage = 'A'.
*      ls_bapihd-table_no = '073'.
*      ls_bapihd-applicatio = 'V'.
*      ls_bapihd-cond_type = 'PR00'.
*      ls_bapihd-varkey = ls_bapict-varkey.
*      ls_bapihd-valid_from = sy-datum.
*      ls_bapihd-valid_to = '99991231'.
*      APPEND ls_bapihd TO lt_bapihd.
*
*      ls_bapiit-operation = '009'.
*      ls_bapiit-cond_no = '$000000001'.
*      ls_bapiit-cond_count = '01'.
*      ls_bapiit-applicatio = 'V'.
*      ls_bapiit-cond_type = 'PR00'.
*      ls_bapiit-cond_p_unt = <fs_sale>-kpein.
*      ls_bapiit-cond_unit = <fs_sale>-kmein.
*      ls_bapiit-base_uom = <fs_sale>-kmein.
*      ls_bapiit-calctypcon = 'C'.
*      ls_bapiit-cond_value = <fs_sale>-kbetr.
*      ls_bapiit-condcurr = <fs_sale>-konwa.
*      ls_bapiit-condcurren = <fs_sale>-konwa.
*      APPEND ls_bapiit TO lt_bapiit.
*
*      CALL FUNCTION 'BAPI_PRICES_CONDITIONS'
*        TABLES
*          ti_bapicondct  = lt_bapict
*          ti_bapicondhd  = lt_bapihd
*          ti_bapicondit  = lt_bapiit
*          ti_bapicondqs  = lt_bapiqs
*          ti_bapicondvs  = lt_bapivs
*          to_bapiret2    = lt_messages
*          to_bapiknumhs  = lt_bapiknumhs
*          to_mem_initial = lt_mem_initial
*        EXCEPTIONS
*          update_error   = 1
*          OTHERS         = 2.

      CLEAR ls_cond_change.

      SELECT SINGLE isocode INTO @DATA(lv_isocode) FROM t006
        WHERE msehi = @<fs_sale>-kmein.

      ls_cond_change-cond_usage = 'A'.
      ls_cond_change-table_no = '073'.
      ls_cond_change-applicatio = 'V'.
      ls_cond_change-cond_type = 'PR00'.
      CONCATENATE <fs_sale>-vkorg <fs_sale>-vtweg <fs_sale>-matnr <fs_sale>-kmein
       INTO ls_cond_change-varkey.

      ls_cond_change-valid_to = '99991231'.
      ls_cond_change-valid_from = sy-datum.
      ls_cond_change-cond_p_unt = <fs_sale>-kpein.
      ls_cond_change-cond_unit = lv_isocode.
      ls_cond_change-base_uom = lv_isocode.
      ls_cond_change-cond_value = <fs_sale>-kbetr.
      ls_cond_change-condcurr = <fs_sale>-konwa.
      CALL FUNCTION '/DLWUPEX/COCKPIT_CHANGE_PRICE'
        EXPORTING
          is_cond    = ls_cond_change
        IMPORTING
          et_message = lt_messages.

      IF lt_messages[] IS NOT INITIAL.
        CLEAR : ls_msg.
        LOOP AT lt_messages INTO DATA(ls_messages).
          IF ls_messages-type EQ 'E'.
*           On remplit la table de message d'erreur.
            ls_msg-id         = iv_bu.
            ls_msg-reqid      = iv_reqid.
            ls_msg-matnr      = iv_matnr.
            ls_msg-viewname   = gc_saleview.
            ls_msg-type       = ls_messages-type.
            ls_msg-idmsg      = ls_messages-id.
            ls_msg-num        = ls_messages-number.
            ls_msg-message    = ls_messages-message.
            APPEND ls_msg TO ct_msg.
            cv_rc = 4.
            EXIT.
          ENDIF.

        ENDLOOP.
      ENDIF.
    ENDLOOP.



    CLEAR lv_status.
    IF cv_rc IS NOT INITIAL.
*      lv_status = gc_statusinerror.

      CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
        EXPORTING
          it_msg = ct_msg
        CHANGING
          cv_rc  = cv_rc
          ct_msg = ct_msg.

      CALL METHOD /dlwupex/cl_cockpit_article=>change_status
        EXPORTING
          iv_status = gc_statusinerror
        CHANGING
          ct_sale   = lt_sale
          ct_gdata  = lt_gdata
          ct_reqids = lt_reqids
          cv_rc     = cv_rc.


      CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
        EXPORTING
          iv_bu    = iv_bu
          it_sale  = lt_sale
          it_gdata = lt_gdata
        CHANGING
          ct_msg   = ct_msg
          cv_rc    = cv_rc
          cv_reqid = lv_reqid.

      CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
        EXPORTING
          it_reqids        = lt_reqids
          iv_change_reqids = abap_true
        CHANGING
          ct_msg           = ct_msg
          cv_rc            = cv_rc.
      COMMIT WORK AND WAIT.
      EXIT.
    ELSE.
      lv_status = gc_statuscompleted.
    ENDIF.


    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = lv_status
      CHANGING
        ct_sale   = lt_sale
        ct_gdata  = lt_gdata
        cv_rc     = cv_rc.


    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu    = iv_bu
        it_sale  = lt_sale
        it_gdata = lt_gdata
      CHANGING
        ct_msg   = ct_msg
        cv_rc    = cv_rc
        cv_reqid = lv_reqid.

    COMMIT WORK AND WAIT.




  ENDMETHOD.


  METHOD bapi_create_srlist.

    DATA : lt_gdata  TYPE /dlwupex/tgdata_tt,
           lt_srlist TYPE /dlwupex/tsrlist_tt,
           ls_srlist TYPE /dlwupex/tsrlist,
           lt_reqids TYPE /dlwupex/treqids_tt,
           ls_eord   TYPE eordu,
           lt_eord   TYPE TABLE OF eordu,
           lt_eordy  TYPE TABLE OF eordu,
           ls_msg    TYPE /dlwupex/tmsg,
           lv_reqid  TYPE /dlwupex/ereqid,
           lv_status TYPE /dlwupex/elinestatus.


    CLEAR : ls_srlist, ls_msg, lv_status, lv_reqid.
    REFRESH : lt_srlist.

    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

*   Retrieve the contain of Source List
    CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
      EXPORTING
        iv_bu      = iv_bu
        iv_reqid   = iv_reqid
        iv_art_key = iv_matnr
      CHANGING
        ct_srlist  = lt_srlist
        ct_gdata   = lt_gdata
        cv_rc      = cv_rc.


    IF lt_srlist[] IS NOT INITIAL.

      READ TABLE lt_gdata INTO DATA(ls_gdata) INDEX 1.

      CLEAR ls_srlist.
      LOOP AT lt_srlist INTO ls_srlist.

        CLEAR : ls_eord.
        ls_eord-matnr = ls_gdata-matnr.
        ls_eord-werks = ls_srlist-werks.
        ls_eord-lifnr = ls_srlist-lifnr.
        ls_eord-ekorg = ls_srlist-ekorg.
        ls_eord-flifn = ls_srlist-flifn.
        ls_eord-reswk = ls_srlist-reswk.
        ls_eord-bdatu = ls_srlist-bdatu.
        ls_eord-vdatu = ls_srlist-vdatu.
        ls_eord-ernam = sy-uname.
        ls_eord-erdat = sy-datum.
        ls_eord-kz = 'I'.
        IF ls_eord-lifnr IS INITIAL.
          SELECT SINGLE lifnr INTO ls_eord-lifnr
             FROM t001w
             WHERE werks = ls_eord-reswk.
          IF sy-subrc IS INITIAL.
*                ls_eord-lifnr = ls_t001w-lifnr.
          ENDIF.
        ENDIF.
        APPEND ls_eord TO lt_eord.

      ENDLOOP.

      CALL FUNCTION 'ME_UPDATE_SOURCES_OF_SUPPLY'
        EXPORTING
          i_changedocument = abap_true
        TABLES
          xeord            = lt_eord
          yeord            = lt_eordy
        EXCEPTIONS
          error_message    = 1.

      IF sy-subrc EQ 0.
        COMMIT WORK AND WAIT.
      ELSE.
*     On remplit la table de message d'erreur.

        ls_msg-id         = iv_bu.
        ls_msg-reqid      = iv_reqid.
        ls_msg-matnr      = iv_matnr.
        ls_msg-line       = ls_srlist-line.
        ls_msg-viewname   = '07'.
        ls_msg-type       = sy-msgty.
        ls_msg-idmsg      = sy-msgid.
        ls_msg-num        = sy-msgno.
        ls_msg-message_v1      = sy-msgv1.
        ls_msg-message_v2      = sy-msgv2.
        ls_msg-message_v3      = sy-msgv3.
        ls_msg-message_v4      = sy-msgv4.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
                INTO ls_msg-message
                WITH ls_msg-message_v1 ls_msg-message_v2 ls_msg-message_v3 ls_msg-message_v4.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
      ENDIF.

** suppression des erreurs
*      DELETE FROM /dlwupex/tmsg
*              WHERE id = iv_bu AND
*                    reqid = iv_reqid AND
*                    viewname = '07'.

      IF cv_rc IS NOT INITIAL.
*        lv_status = gc_statusinerror.

        CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
          EXPORTING
            it_msg = ct_msg
          CHANGING
            cv_rc  = cv_rc
            ct_msg = ct_msg.

        CALL METHOD /dlwupex/cl_cockpit_article=>change_status
          EXPORTING
            iv_status = gc_statusinerror
          CHANGING
            ct_srlist = lt_srlist
            ct_reqids = lt_reqids
            cv_rc     = cv_rc.


        CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
          EXPORTING
            iv_bu     = iv_bu
            it_srlist = lt_srlist
          CHANGING
            ct_msg    = ct_msg
            cv_rc     = cv_rc
            cv_reqid  = lv_reqid.

        CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
          EXPORTING
            it_reqids        = lt_reqids
            iv_change_reqids = abap_true
          CHANGING
            ct_msg           = ct_msg
            cv_rc            = cv_rc.

      ELSE.
*        lv_status = gc_statuscompleted.
        CALL METHOD /dlwupex/cl_cockpit_article=>change_status
          EXPORTING
            iv_status = gc_statuscompleted
          CHANGING
            ct_srlist = lt_srlist
            cv_rc     = cv_rc.

        lv_reqid = iv_reqid.

        CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
          EXPORTING
            iv_bu     = iv_bu
            it_srlist = lt_srlist
          CHANGING
            ct_msg    = ct_msg
            cv_rc     = cv_rc
            cv_reqid  = lv_reqid.
      ENDIF.


    ENDIF.
  ENDMETHOD.


  METHOD change_status.

    LOOP AT ct_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
      CHECK <fs_gdata>-status < iv_status OR iv_status = gc_statusinerror.
      <fs_gdata>-status = iv_status.
    ENDLOOP.

    LOOP AT ct_unit ASSIGNING FIELD-SYMBOL(<fs_unit>).
      CHECK <fs_unit>-status < iv_status OR iv_status = gc_statusinerror.
      <fs_unit>-status = iv_status.
    ENDLOOP.

    LOOP AT ct_caract ASSIGNING FIELD-SYMBOL(<fs_caract>).
      CHECK <fs_caract>-status < iv_status  OR iv_status = gc_statusinerror.
      <fs_caract>-status = iv_status.
    ENDLOOP.

    LOOP AT ct_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).
      CHECK <fs_bom>-status < iv_status  OR iv_status = gc_statusinerror.
      <fs_bom>-status = iv_status.
    ENDLOOP.

    LOOP AT ct_fia ASSIGNING FIELD-SYMBOL(<fs_fia>).
      CHECK <fs_fia>-status < iv_status OR iv_status = gc_statusinerror.
      <fs_fia>-status = iv_status.
    ENDLOOP.

    LOOP AT ct_list ASSIGNING FIELD-SYMBOL(<fs_list>).
      CHECK <fs_list>-status < iv_status OR iv_status = gc_statusinerror.
      <fs_list>-status = iv_status.
    ENDLOOP.

    LOOP AT ct_srlist ASSIGNING FIELD-SYMBOL(<fs_srlist>).
      CHECK <fs_srlist>-status < iv_status OR iv_status = gc_statusinerror.
      <fs_srlist>-status = iv_status.
    ENDLOOP.

    LOOP AT ct_sale ASSIGNING FIELD-SYMBOL(<fs_sale>).
      CHECK <fs_sale>-status < iv_status OR iv_status = gc_statusinerror.
      <fs_sale>-status = iv_status.
    ENDLOOP.

    LOOP AT ct_logdc ASSIGNING FIELD-SYMBOL(<fs_logdc>).
      CHECK <fs_logdc>-status < iv_status OR iv_status = gc_statusinerror.
      <fs_logdc>-status = iv_status.
    ENDLOOP.

    LOOP AT ct_logsto ASSIGNING FIELD-SYMBOL(<fs_logsto>).
      CHECK <fs_logsto>-status < iv_status OR iv_status = gc_statusinerror.
      <fs_logsto>-status = iv_status.
    ENDLOOP.

    SORT :  ct_unit,
            ct_caract,
            ct_bom,
            ct_fia,
            ct_list,
            ct_srlist,
            ct_sale,
            ct_logdc,
            ct_logsto,
            ct_gdata.

    IF ct_reqids IS SUPPLIED.
      READ TABLE ct_reqids ASSIGNING FIELD-SYMBOL(<fs_reqids>) INDEX 1.
      CHECK <fs_reqids> IS ASSIGNED.
      IF ct_unit IS SUPPLIED AND ct_unit IS NOT INITIAL.
        <fs_reqids>-statunit = iv_status.
      ENDIF.
      IF ct_caract IS SUPPLIED AND ct_caract IS NOT INITIAL.
        <fs_reqids>-statcara = iv_status.
      ENDIF.
      IF ct_bom IS SUPPLIED AND ct_bom IS NOT INITIAL.
        <fs_reqids>-statbom = iv_status.
        IF iv_status = gc_statusinerror.
          IF <fs_reqids>-statcara IS NOT INITIAL.
            <fs_reqids>-statcara = iv_status.
          ENDIF.
          IF <fs_reqids>-statdg IS NOT INITIAL.
            <fs_reqids>-statdg = iv_status.
          ENDIF.
          IF <fs_reqids>-statsale IS NOT INITIAL.
            <fs_reqids>-statsale = iv_status.
          ENDIF.
          IF <fs_reqids>-statdc IS NOT INITIAL.
            <fs_reqids>-statdc = iv_status.
          ENDIF.
          IF <fs_reqids>-statstore IS NOT INITIAL.
            <fs_reqids>-statstore = iv_status.
          ENDIF.
          IF <fs_reqids>-statunit IS NOT INITIAL.
            <fs_reqids>-statunit = iv_status.
          ENDIF.

        ENDIF.
      ENDIF.
      IF ct_fia IS SUPPLIED AND ct_fia IS NOT INITIAL.
        <fs_reqids>-statfia = iv_status.
      ENDIF.
      IF ct_list IS SUPPLIED AND ct_list IS NOT INITIAL.
        <fs_reqids>-statlist = iv_status.
      ENDIF.
      IF ct_srlist IS SUPPLIED AND ct_srlist IS NOT INITIAL.
        <fs_reqids>-statsrlist = iv_status.
      ENDIF.
      IF ct_sale IS SUPPLIED AND ct_sale IS NOT INITIAL.
        <fs_reqids>-statsale = iv_status.
      ENDIF.
      IF ct_logdc IS SUPPLIED AND ct_logdc IS NOT INITIAL.
        <fs_reqids>-statdc = iv_status.
      ENDIF.
      IF ct_logsto IS SUPPLIED AND ct_logsto IS NOT INITIAL.
        <fs_reqids>-statstore = iv_status.
      ENDIF.
      IF ct_gdata IS SUPPLIED AND ct_gdata IS NOT INITIAL.
        <fs_reqids>-statdg = iv_status.
      ENDIF.

      IF iv_status = gc_statusinerror OR iv_status = gc_statuscompleted.
        <fs_reqids>-status = iv_status.
        IF iv_status = gc_statusinerror.
          IF <fs_reqids>-statdg = gc_statusinerror.
            IF <fs_reqids>-statfia IS NOT INITIAL AND  <fs_reqids>-statfia <> gc_statusinerror.
              <fs_reqids>-statfia = gc_statusvalidated.
            ENDIF.
            IF <fs_reqids>-statbom IS NOT INITIAL AND  <fs_reqids>-statbom <> gc_statusinerror.
              <fs_reqids>-statbom = gc_statusvalidated.
            ENDIF.
            IF <fs_reqids>-statsrlist IS NOT INITIAL AND  <fs_reqids>-statsrlist <> gc_statusinerror.
              <fs_reqids>-statsrlist = gc_statusvalidated.
            ENDIF.
            IF <fs_reqids>-statlist IS NOT INITIAL AND  <fs_reqids>-statlist <> gc_statusinerror.
              <fs_reqids>-statlist = gc_statusvalidated.
            ENDIF.

          ENDIF.
          IF <fs_reqids>-statfia = gc_statusinerror.
            IF <fs_reqids>-statbom IS NOT INITIAL AND  <fs_reqids>-statbom <> gc_statusinerror.
              <fs_reqids>-statbom = gc_statusvalidated.
            ENDIF.
            IF <fs_reqids>-statsrlist IS NOT INITIAL AND  <fs_reqids>-statsrlist <> gc_statusinerror.
              <fs_reqids>-statsrlist = gc_statusvalidated.
            ENDIF.
            IF <fs_reqids>-statlist IS NOT INITIAL AND  <fs_reqids>-statlist <> gc_statusinerror.
              <fs_reqids>-statlist = gc_statusvalidated.
            ENDIF.
          ENDIF.
          IF <fs_reqids>-statbom = gc_statusinerror.
            IF <fs_reqids>-statsrlist IS NOT INITIAL AND  <fs_reqids>-statsrlist <> gc_statusinerror.
              <fs_reqids>-statsrlist = gc_statusvalidated.
            ENDIF.
            IF <fs_reqids>-statlist IS NOT INITIAL AND  <fs_reqids>-statlist <> gc_statusinerror.
              <fs_reqids>-statlist = gc_statusvalidated.
            ENDIF.
          ENDIF.
          IF <fs_reqids>-statsrlist = gc_statusinerror.
            IF <fs_reqids>-statlist IS NOT INITIAL AND  <fs_reqids>-statlist <> gc_statusinerror.
              <fs_reqids>-statlist = gc_statusvalidated.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD check_author.

    DATA : ls_matkl TYPE matkl,
           ls_msg   TYPE /dlwupex/tmsg,
           lv_begru TYPE begru.

* INITIALIZATION
    CLEAR : ls_matkl, ls_msg, lv_begru.

    CLEAR ls_matkl.
    LOOP AT it_matkl INTO ls_matkl.
*     On récupère le groupe d'autorisation en fonction du GM
      SELECT SINGLE begru
        FROM t023
        INTO lv_begru
        WHERE matkl = ls_matkl.
      IF sy-subrc EQ 0.
        AUTHORITY-CHECK OBJECT 'M_MATE_WGR'
           ID 'ACTVT' FIELD '03'
           ID 'BEGRU' FIELD lv_begru.
        IF sy-subrc NE 0.
*         Pas d'autorisation pour ce GM
          CLEAR ls_msg.
          ls_msg-viewname   = gc_gdataview.
          ls_msg-field      = gc_matkl.
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = gc_classmsg.
          ls_msg-num        = '048'.
          ls_msg-message_v1 = ls_matkl.
          MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
            INTO ls_msg-message
          WITH ls_msg-message_v1.
          APPEND ls_msg TO ct_msg.

          ev_no_author = abap_true.

        ENDIF.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD constructor.

    me->gv_bu = iv_bu.
    me->read_tfields_custo( ).

  ENDMETHOD.


  METHOD delete_msg_for_deleted_line.

    TYPES : BEGIN OF ty_cond,
              cond(72) TYPE c,
            END OF ty_cond.

    DATA : lv_cond   TYPE ty_cond,
           lt_cond   TYPE TABLE OF ty_cond,
           lv_lineid TYPE /dlwupex/elineid,
           ls_msg    TYPE /dlwupex/tmsg.

    REFRESH lt_cond.
    MOVE 'id = iv_id AND reqid = iv_reqid AND '  TO lv_cond.
    APPEND lv_cond TO lt_cond.
    MOVE 'matnr = iv_matnr AND ( line = iv_line OR line = lv_lineid ) AND' TO lv_cond.
    APPEND lv_cond TO lt_cond.
    MOVE 'viewname = iv_viewname' TO lv_cond.
    APPEND lv_cond TO lt_cond.

    DELETE FROM /dlwupex/tmsg_ch
     WHERE (lt_cond).

    COMMIT WORK AND WAIT.

  ENDMETHOD.


  METHOD delete_msg_for_many_lines.

    TYPES : BEGIN OF ty_cond,
              cond(72) TYPE c,
            END OF ty_cond.

    DATA : lv_cond   TYPE ty_cond,
           lt_cond   TYPE TABLE OF ty_cond,
           lv_lineid TYPE /dlwupex/elineid,
           ls_msg    TYPE /dlwupex/tmsg.

    REFRESH lt_cond.
    MOVE 'id = iv_id AND reqid = iv_reqid '  TO lv_cond.
    APPEND lv_cond TO lt_cond.

*    MOVE 'matnr = iv_matnr AND ( line = iv_line OR line = lv_lineid ) AND' TO lv_cond.
*    APPEND lv_cond TO lt_cond.
    LOOP AT it_lines ASSIGNING FIELD-SYMBOL(<fs_lines>).
      IF sy-tabix = 1.
        CONCATENATE ' AND ( ( art_key = ' <fs_lines>-matnr
                    ' AND ( line = ' <fs_lines>-lineid
                    ' OR  line = lv_lineid ) ) '
                    INTO lv_cond.
      ELSE.
        CONCATENATE ' OR ( art_key = ' <fs_lines>-matnr
                    ' AND ( line =  ' <fs_lines>-lineid
                    ' OR  line = lv_lineid ) ) '
                    INTO lv_cond.
      ENDIF.
      APPEND lv_cond TO lt_cond.

    ENDLOOP.
    MOVE ' ) AND' TO lv_cond.

    MOVE 'viewname = iv_viewname' TO lv_cond.
    APPEND lv_cond TO lt_cond.

    DELETE FROM /dlwupex/tmsg_ch
     WHERE (lt_cond).

    COMMIT WORK AND WAIT.

  ENDMETHOD.


  METHOD delete_msg_in_worklist.

    DATA ls_msg        TYPE /dlwupex/tmsg.

    TRY .
        IF iv_line IS NOT INITIAL.
          DELETE FROM /dlwupex/tmsg_ch WHERE
             id = iv_id AND
             reqid = iv_reqid AND
             matnr = iv_matnr AND
             line = iv_line AND
             viewname = iv_viewname AND
             (
             ( idmsg = gc_classmsg AND
               num <> '068' ) OR
               idmsg <> gc_classmsg ).

          DELETE FROM /dlwupex/tmsg_ch WHERE
              id = iv_id AND
              reqid = iv_reqid AND
              matnr = iv_matnr AND
              line = 00000 AND
              viewname = iv_viewname AND
             (
             ( idmsg = gc_classmsg AND
               num <> '068' ) OR
               idmsg <> gc_classmsg ).
        ELSE.
          DELETE FROM /dlwupex/tmsg_ch WHERE
           id = iv_id AND
           reqid = iv_reqid AND
           matnr = iv_matnr AND
           viewname = iv_viewname AND
            (
            ( idmsg = gc_classmsg AND
               num <> '068' ) OR
               idmsg <> gc_classmsg ).
        ENDIF.

      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '033'.
        ls_msg-message_v1 = '/DLWUPEX/TMSG_CH'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
*        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.

  ENDMETHOD.


  METHOD fill_bom.

    DATA ls_msg        TYPE /dlwupex/tmsg.

    TRY .
        MODIFY /dlwupex/tbom FROM TABLE it_bom.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TBOM'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.
  ENDMETHOD.


  METHOD fill_caract.

    DATA ls_msg        TYPE /dlwupex/tmsg.

    TRY .
        MODIFY /dlwupex/tcaract FROM TABLE it_caract.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TCARACT'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.
  ENDMETHOD.


  METHOD fill_fia.

    DATA : ls_msg     TYPE /dlwupex/tmsg,
           ls_fia     TYPE /dlwupex/tfia,
           ls_fia_tmp TYPE /dlwupex/tfia.

*   INITIALIZATION
    CLEAR : ls_msg, ls_fia, ls_fia_tmp.

    TRY .
*       On boucle sur la table des données à sauvegarder pour supprimer
*       les données déjà existantes afin de ne pas avoir de doublons
*       en cas de modification de(s) donnée(s) en clé.
        LOOP AT it_fia INTO ls_fia.
          SELECT SINGLE *
            FROM /dlwupex/tfia
            INTO ls_fia_tmp
            WHERE id = ls_fia-id
              AND reqid   = ls_fia-reqid
              AND line    = ls_fia-line
              AND art_key = ls_fia-art_key.
          IF sy-subrc EQ 0
            AND ( ls_fia-lifnr <> ls_fia_tmp-lifnr
            OR ls_fia-ekorg <> ls_fia_tmp-ekorg ).
            DELETE FROM /dlwupex/tfia
            WHERE id          = ls_fia-id
                  AND reqid   = ls_fia-reqid
                  AND line    = ls_fia-line
                  AND art_key = ls_fia-art_key.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDLOOP.
        MODIFY /dlwupex/tfia FROM TABLE it_fia.

*        MODIFY /dlwupex/tfia FROM TABLE it_fia.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TFIA'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.
  ENDMETHOD.


  METHOD fill_gdata.

    DATA : ls_msg     TYPE /dlwupex/tmsg.
*           lt_gdata   TYPE /dlwupex/tgdata_tt,
*           lt_tfields TYPE /dlwupex/tfields_tt.

*    READ TABLE it_gdata INTO DATA(ls_gdata) INDEX 1.

*    SELECT * FROM /dlwupex/tfields INTO TABLE lt_tfields
*     WHERE id = ls_gdata-id AND
*           viewname = gc_gdataview.
*
*    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
*      EXPORTING
*        iv_bu    = ls_gdata-id
*        iv_reqid = ls_gdata-reqid
*      CHANGING
*        ct_gdata = lt_gdata
*        cv_rc    = cv_rc.
*    IF lt_gdata IS INITIAL.
*      lt_gdata = it_gdata.
*    ELSE.
*      LOOP AT it_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
*        LOOP AT lt_tfields ASSIGNING FIELD-SYMBOL(<fs_tfields>).
*          ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_gdata> TO FIELD-SYMBOL(<fs_field>).
*          READ TABLE lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata1>)
*            WITH KEY id = <fs_gdata>-id
*                     reqid = <fs_gdata>-reqid
*                     art_key = <fs_gdata>-art_key
*                     BINARY SEARCH.
*          IF sy-subrc IS INITIAL.
*            <fs_gdata1>-status = <fs_gdata>-status.
*            ASSIGN COMPONENT <fs_tfields>-tabfield OF STRUCTURE <fs_gdata1> TO FIELD-SYMBOL(<fs_field1>).
*            CHECK <fs_field1> IS ASSIGNED AND <fs_field> IS ASSIGNED.
*            <fs_field1> = <fs_field>.
*          ENDIF.
*        ENDLOOP.
*      ENDLOOP.
*    ENDIF.

    TRY .
        MODIFY /dlwupex/tgdata FROM TABLE it_gdata.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TGDATA'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.


  ENDMETHOD.


  METHOD fill_list.

    DATA ls_msg        TYPE /dlwupex/tmsg.

    TRY .
        MODIFY /dlwupex/tlist FROM TABLE it_list.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TLIST'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.

  ENDMETHOD.


  METHOD fill_logdc.

    DATA : ls_msg       TYPE /dlwupex/tmsg,
           ls_logdc     TYPE /dlwupex/tlogdc,
           ls_logdc_tmp TYPE /dlwupex/tlogdc.

*   INITIALIZATION
    CLEAR : ls_msg, ls_logdc, ls_logdc_tmp.

    TRY .
*       On boucle sur la table des données à sauvegarder pour supprimer
*       les données déjà existantes afin de ne pas avoir de doublons
*       en cas de modification de(s) donnée(s) en clé.
        LOOP AT it_logdc INTO ls_logdc.
          SELECT SINGLE *
            FROM /dlwupex/tlogdc
            INTO ls_logdc_tmp
            WHERE id      = ls_logdc-id
              AND reqid   = ls_logdc-reqid
              AND line    = ls_logdc-line
              AND art_key = ls_logdc-art_key.
          IF sy-subrc EQ 0
            AND ( ls_logdc-werks <> ls_logdc_tmp-werks ).
            DELETE FROM /dlwupex/tlogdc
            WHERE id          = ls_logdc-id
                  AND reqid   = ls_logdc-reqid
                  AND line    = ls_logdc-line
                  AND art_key = ls_logdc-art_key.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDLOOP.
        MODIFY /dlwupex/tlogdc FROM TABLE it_logdc.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TLOGDC'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.

  ENDMETHOD.


  METHOD fill_logsto.

    DATA : ls_msg        TYPE /dlwupex/tmsg,
           ls_logsto     TYPE /dlwupex/tlogsto,
           ls_logsto_tmp TYPE /dlwupex/tlogsto.

*   INITIALIZATION
    CLEAR : ls_msg, ls_logsto, ls_logsto_tmp.

    TRY .
*       On boucle sur la table des données à sauvegarder pour supprimer
*       les données déjà existantes afin de ne pas avoir de doublons
*       en cas de modification de(s) donnée(s) en clé.
        LOOP AT it_logsto INTO ls_logsto.
          SELECT SINGLE *
            FROM /dlwupex/tlogsto
            INTO ls_logsto_tmp
            WHERE id      = ls_logsto-id
              AND reqid   = ls_logsto-reqid
              AND line    = ls_logsto-line
              AND art_key = ls_logsto-art_key.
          IF sy-subrc EQ 0
            AND ( ls_logsto-werks <> ls_logsto_tmp-werks ).
            DELETE FROM /dlwupex/tlogsto
            WHERE id          = ls_logsto-id
                  AND reqid   = ls_logsto-reqid
                  AND line    = ls_logsto-line
                  AND art_key = ls_logsto-art_key.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDLOOP.
        MODIFY /dlwupex/tlogsto FROM TABLE it_logsto.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TLOGSTO'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.

  ENDMETHOD.


  METHOD fill_reqids.
    DATA ls_msg        TYPE /dlwupex/tmsg.

    TRY .
        MODIFY /dlwupex/treqids FROM TABLE it_reqids.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TREQIDS'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.

  ENDMETHOD.


  METHOD fill_sale.

    DATA : ls_msg      TYPE /dlwupex/tmsg,
           ls_sale     TYPE /dlwupex/tsale,
           ls_sale_tmp TYPE /dlwupex/tsale.

*   INITIALIZATION
    CLEAR : ls_msg, ls_sale, ls_sale_tmp.

    TRY .
*       On boucle sur la table des données à sauvegarder pour supprimer
*       les données déjà existantes afin de ne pas avoir de doublons
*       en cas de modification de(s) donnée(s) en clé.
        LOOP AT it_sale INTO ls_sale.
          SELECT SINGLE *
            FROM /dlwupex/tsale
            INTO ls_sale_tmp
            WHERE id      = ls_sale-id
              AND reqid   = ls_sale-reqid
              AND line    = ls_sale-line
              AND art_key = ls_sale-art_key.
          IF sy-subrc EQ 0
            AND ( ls_sale-vkorg <> ls_sale_tmp-vkorg
            OR ls_sale-vtweg <> ls_sale_tmp-vtweg ).
            DELETE FROM /dlwupex/tsale
            WHERE id          = ls_sale-id
                  AND reqid   = ls_sale-reqid
                  AND line    = ls_sale-line
                  AND art_key = ls_sale-art_key.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDLOOP.
        MODIFY /dlwupex/tsale FROM TABLE it_sale.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TSALE'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.
  ENDMETHOD.


  METHOD fill_srlist.

    DATA : ls_msg        TYPE /dlwupex/tmsg,
           ls_srlist     TYPE /dlwupex/tsrlist,
           ls_srlist_tmp TYPE /dlwupex/tsrlist.

*   INITIALIZATION
    CLEAR : ls_msg, ls_srlist, ls_srlist_tmp.

    TRY .
*       On boucle sur la table des données à sauvegarder pour supprimer
*       les données déjà existantes afin de ne pas avoir de doublons
*       en cas de modification de(s) donnée(s) en clé.
        LOOP AT it_srlist INTO ls_srlist.
          SELECT SINGLE *
            FROM /dlwupex/tsrlist
            INTO ls_srlist_tmp
            WHERE id = ls_srlist-id
              AND reqid = ls_srlist-reqid
              AND line = ls_srlist-line
              AND art_key = ls_srlist-art_key.
          IF sy-subrc EQ 0
            AND ( ls_srlist-WERKS <> ls_srlist_tmp-WERKS ).
            DELETE FROM /dlwupex/tsrlist
            WHERE id = ls_srlist-id
                  AND reqid = ls_srlist-reqid
                  AND line = ls_srlist-line
                  AND art_key = ls_srlist-art_key.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDLOOP.
        MODIFY /dlwupex/tsrlist FROM TABLE it_srlist.
*        MODIFY /dlwupex/tsrlist FROM TABLE it_srlist.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TSRLIST'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.
  ENDMETHOD.


  METHOD fill_unit.
    DATA : ls_msg      TYPE /dlwupex/tmsg,
           ls_unit     TYPE /dlwupex/tunit,
           ls_unit_tmp TYPE /dlwupex/tunit.

*   INITIALIZATION
    CLEAR : ls_msg, ls_unit, ls_unit_tmp.

    TRY .
*       On boucle sur la table des données à sauvegarder pour supprimer
*       les données déjà existantes afin de ne pas avoir de doublons
*       en cas de modification de(s) donnée(s) en clé.
        LOOP AT it_unit INTO ls_unit.
          SELECT SINGLE *
            FROM /dlwupex/tunit
            INTO ls_unit_tmp
            WHERE id = ls_unit-id
              AND reqid = ls_unit-reqid
              AND line = ls_unit-line
              AND art_key = ls_unit-art_key.
          IF sy-subrc EQ 0
            AND ( ls_unit-meinh <> ls_unit_tmp-meinh ).
            DELETE FROM /dlwupex/tunit
            WHERE id = ls_unit-id
                  AND reqid = ls_unit-reqid
                  AND line = ls_unit-line
                  AND art_key = ls_unit-art_key.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDLOOP.
        MODIFY /dlwupex/tunit FROM TABLE it_unit.

*        MODIFY /dlwupex/tunit FROM TABLE it_unit.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TUNIT'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.
  ENDMETHOD.


  METHOD fill_worklist.


    DATA : lt_reqids       TYPE /dlwupex/treqids_tt,
           ls_reqids       TYPE /dlwupex/treqids,
           lv_reqid        TYPE /dlwupex/ereqid,
           lv_line         TYPE /dlwupex/elineid,
           lt_gdata	       TYPE /dlwupex/tgdata_tt,
           lt_unit         TYPE /dlwupex/tunit_tt,
           lt_caract       TYPE /dlwupex/tcaract_tt,
           lt_bom          TYPE /dlwupex/tbom_tt,
           lt_fia          TYPE /dlwupex/tfia_tt,
           lt_list         TYPE /dlwupex/tlist_tt,
           lt_srlist       TYPE /dlwupex/tsrlist_tt,
           lt_sale         TYPE /dlwupex/tsale_tt,
           lt_logdc        TYPE /dlwupex/tlogdc_tt,
           lt_logsto       TYPE /dlwupex/tlogsto_tt,
           lt_gdata_db     TYPE /dlwupex/tgdata_tt,
           lt_unit_db      TYPE /dlwupex/tunit_tt,
           lt_caract_db    TYPE /dlwupex/tcaract_tt,
           lt_bom_db       TYPE /dlwupex/tbom_tt,
           lt_fia_db       TYPE /dlwupex/tfia_tt,
           lt_list_db      TYPE /dlwupex/tlist_tt,
           lt_srlist_db    TYPE /dlwupex/tsrlist_tt,
           lt_sale_db      TYPE /dlwupex/tsale_tt,
           lt_logdc_db     TYPE /dlwupex/tlogdc_tt,
           lt_logsto_db    TYPE /dlwupex/tlogsto_tt,
           lt_dfies_tab    TYPE TABLE OF dfies,
           ls_dfies_tab    TYPE dfies,
           lv_statut       TYPE /dlwupex/elinestatus,
           lv_nbline_test  TYPE i,
           lv_nbline_test2 TYPE i,
           lv_nbline_db_v  TYPE i,
           lv_nbline_db_c  TYPE i,
           lv_err          TYPE xfeld,
           lv_inprog       TYPE xfeld,
           lv_creation     TYPE xfeld.

    DATA : lv_subkey TYPE string.

    FIELD-SYMBOLS : <fs_field> TYPE any.

    REFRESH : lt_dfies_tab.
    CLEAR : ls_dfies_tab.

    IF cv_reqid IS INITIAL.
*     détermination de l'id de requête à créer
      SELECT SINGLE MAX( reqid ) INTO lv_reqid  FROM /dlwupex/treqids.
      lv_reqid = lv_reqid + 1.
      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          input  = lv_reqid
        IMPORTING
          output = lv_reqid.
      lv_creation = abap_true.
      cv_reqid = lv_reqid.
      ls_reqids-zdate = sy-datum.
      ls_reqids-requester = sy-uname.
    ELSE.
      DATA : lv_nbrocc TYPE i.
      CLEAR lv_nbrocc.
      IF iv_lockdb IS NOT INITIAL.
        DO 100 TIMES.
          CALL FUNCTION 'ENQUEUE_/DLWUPEX/REQIDS'
            EXPORTING
              mode_/dlwupex/treqids = 'E'
              mandt                 = sy-mandt
              id                    = iv_bu
              reqid                 = cv_reqid
            EXCEPTIONS
              foreign_lock          = 1
              system_failure        = 2
              OTHERS                = 3.
          IF sy-subrc = 0.
* Implement suitable error handling here
            EXIT.
          ENDIF.
          WAIT UP TO 1 SECONDS.
          ADD 1 TO lv_nbrocc.
          lv_subkey = iv_bu && | | && cv_reqid && | | && 'ENQUEUE_/DLWUPEX/REQIDS WAIT 1s total par reqid'.
          LOG-POINT ID /dlwupex/cockpit_aticle SUBKEY lv_subkey.
        ENDDO.
        lv_subkey = iv_bu && | | && cv_reqid && | | && |ENQUEUE_/DLWUPEX/REQIDS WAIT total par methode | && lv_nbrocc && | s|.
        LOG-POINT ID /dlwupex/cockpit_aticle SUBKEY lv_subkey.
      ENDIF.
      lv_creation = abap_false.
      SELECT SINGLE * INTO ls_reqids FROM /dlwupex/treqids
        WHERE id = iv_bu AND
              reqid = cv_reqid.
      lv_reqid = cv_reqid.

      CALL METHOD /dlwupex/cl_cockpit_article=>get_data
        EXPORTING
          iv_bu     = iv_bu
          iv_reqid  = lv_reqid
        CHANGING
          ct_unit   = lt_unit_db
          ct_caract = lt_caract_db
          ct_bom    = lt_bom_db
          ct_fia    = lt_fia_db
          ct_list   = lt_list_db
          ct_srlist = lt_srlist_db
          ct_sale   = lt_sale_db
          ct_logdc  = lt_logdc_db
          ct_logsto = lt_logsto_db
          ct_gdata  = lt_gdata_db
          cv_rc     = cv_rc.
      IF lt_unit_db IS INITIAL.
        CLEAR ls_reqids-statunit.
      ENDIF.
      IF lt_caract_db IS INITIAL.
        CLEAR ls_reqids-statcara.
      ENDIF.
      IF lt_bom_db IS INITIAL.
        CLEAR ls_reqids-statbom.
      ENDIF.
      IF lt_fia_db IS INITIAL.
        CLEAR ls_reqids-statfia.
      ENDIF.
      IF lt_list_db IS INITIAL.
        CLEAR ls_reqids-statlist.
      ENDIF.
      IF lt_srlist_db IS INITIAL.
        CLEAR ls_reqids-statsrlist.
      ENDIF.
      IF lt_sale_db IS INITIAL.
        CLEAR ls_reqids-statsale.
      ENDIF.
      IF lt_logdc_db IS INITIAL.
        CLEAR ls_reqids-statdc.
      ENDIF.
      IF lt_logsto_db IS INITIAL.
        CLEAR ls_reqids-statstore.
      ENDIF.
    ENDIF.

* alimentation des données dans les tables de vue
    IF it_gdata IS NOT INITIAL.
      lt_gdata = it_gdata.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.

      DESCRIBE TABLE lt_gdata_db LINES DATA(lv_nbline_db).
      LOOP AT lt_gdata_db ASSIGNING FIELD-SYMBOL(<fs_gdata_db>).
        lv_statut = <fs_gdata_db>-status.
        READ TABLE lt_gdata INTO DATA(ls_gdata)
        WITH KEY art_key = <fs_gdata_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_gdata-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_gdata ASSIGNING FIELD-SYMBOL(<fs_gdata>).
        READ TABLE lt_gdata_db INTO ls_gdata
          WITH KEY art_key = <fs_gdata>-art_key.
        IF sy-subrc EQ 0.
          IF <fs_gdata>-ref_art IS INITIAL.
            <fs_gdata>-ref_art = ls_gdata-ref_art.
          ENDIF.
          <fs_gdata>-num_line = ls_gdata-num_line.
          <fs_gdata>-step = ls_gdata-step.
        ELSE.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_gdata>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.

      lv_nbline_test = lv_nbline_db - lv_nbline_db_v.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c.

      CLEAR lv_statut.
      LOOP AT lt_gdata ASSIGNING <fs_gdata>.
        IF lv_creation = abap_true OR iv_flag_copy = abap_true.
          <fs_gdata>-step = '01'.
        ENDIF.
        <fs_gdata>-id = iv_bu.
        <fs_gdata>-reqid = lv_reqid.
        <fs_gdata>-date_modif = sy-datum.
        <fs_gdata>-user_modif = sy-uname.

        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statdg <> gc_statuscompleted.
          IF ( gc_statusvalidated EQ <fs_gdata>-status AND lv_nbline_test <= 0 ) OR
             ( gc_statuscompleted EQ <fs_gdata>-status AND lv_nbline_test2 <= 0 ) OR
               gc_statusinerror EQ <fs_gdata>-status.
            lv_statut = <fs_gdata>-status.
          ELSEIF ls_reqids-statdg < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_gdata>-status.
              lv_statut = <fs_gdata>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statdg >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.

        ENDIF.
      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statdg = lv_statut.
      ENDIF.
    ENDIF.

    IF it_unit IS NOT INITIAL.
      lt_unit = it_unit.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.
      SORT lt_unit_db BY line DESCENDING.
      READ TABLE lt_unit_db INTO DATA(ls_unit) INDEX 1.
      lv_line = ls_unit-line.

      DESCRIBE TABLE lt_unit_db LINES lv_nbline_db.
      LOOP AT lt_unit_db ASSIGNING FIELD-SYMBOL(<fs_unit_db>).
        lv_statut = <fs_unit_db>-status.
        READ TABLE lt_unit INTO ls_unit
        WITH KEY line = <fs_unit_db>-line
                 art_key = <fs_unit_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_unit-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_unit ASSIGNING FIELD-SYMBOL(<fs_unit>).
        READ TABLE lt_unit_db INTO ls_unit
          WITH KEY line = <fs_unit>-line
                   art_key = <fs_unit>-art_key.
        IF sy-subrc NE 0.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_unit>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
      lv_nbline_test = lv_nbline_db - lv_nbline_db_v." - lv_nbline.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c." - lv_nbline.
*
      CLEAR lv_statut.
      LOOP AT lt_unit ASSIGNING <fs_unit>.
        <fs_unit>-id = iv_bu.
        IF iv_flag_copy IS NOT INITIAL.
          lv_line = lv_line + 1.
          <fs_unit>-line = lv_line.
        ENDIF.
        <fs_unit>-reqid = lv_reqid.
        <fs_unit>-date_modif = sy-datum.
        <fs_unit>-user_modif = sy-uname.
        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statunit <> gc_statuscompleted.
          IF ( gc_statusvalidated EQ <fs_unit>-status AND lv_nbline_test <= 0 ) OR
             ( gc_statuscompleted EQ <fs_unit>-status AND lv_nbline_test2 <= 0 ) OR
               gc_statusinerror EQ <fs_unit>-status.
            lv_statut = <fs_unit>-status.
          ELSEIF ls_reqids-statunit < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_unit>-status.
              lv_statut = <fs_unit>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statunit >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.
        ENDIF.

      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statunit = lv_statut.
      ENDIF.
    ENDIF.

    IF it_caract IS NOT INITIAL.
      lt_caract = it_caract.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.
      SORT lt_caract_db BY line DESCENDING.
      READ TABLE lt_caract_db INTO DATA(ls_caract) INDEX 1.
      lv_line = ls_caract-line.
*

      DESCRIBE TABLE lt_caract_db LINES lv_nbline_db.
      LOOP AT lt_caract_db ASSIGNING FIELD-SYMBOL(<fs_caract_db>).
        lv_statut = <fs_caract_db>-status.
        READ TABLE lt_caract INTO ls_caract
        WITH KEY line = <fs_caract_db>-line
                 art_key = <fs_caract_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_caract-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_caract ASSIGNING FIELD-SYMBOL(<fs_caract>).
        READ TABLE lt_caract_db INTO ls_caract
          WITH KEY line = <fs_caract>-line
                   art_key = <fs_caract>-art_key.
        IF sy-subrc NE 0.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_caract>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
      lv_nbline_test = lv_nbline_db - lv_nbline_db_v." - lv_nbline.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c." - lv_nbline.
*
      CLEAR lv_statut.
      LOOP AT lt_caract ASSIGNING <fs_caract>.
        <fs_caract>-id = iv_bu.
        IF iv_flag_copy IS NOT INITIAL.
          lv_line = lv_line + 1.
          <fs_caract>-line = lv_line.
        ENDIF.
        <fs_caract>-reqid = lv_reqid.
        <fs_caract>-date_modif = sy-datum.
        <fs_caract>-user_modif = sy-uname.
        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statcara <> gc_statuscompleted.
          IF  ( gc_statusvalidated EQ <fs_caract>-status AND lv_nbline_test <= 0 ) OR
              ( gc_statuscompleted EQ <fs_caract>-status AND lv_nbline_test2 <= 0 ) OR
                gc_statusinerror EQ <fs_caract>-status.
            lv_statut = <fs_caract>-status.
          ELSEIF ls_reqids-statcara < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_caract>-status.
              lv_statut = <fs_caract>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statcara >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.
        ENDIF.

      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statcara = lv_statut.
      ENDIF.
    ENDIF.

    IF it_bom IS NOT INITIAL.
      lt_bom = it_bom.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.
      SORT lt_bom_db BY line DESCENDING.
      READ TABLE lt_bom_db INTO DATA(ls_bom) INDEX 1.
      lv_line = ls_bom-line.

      DESCRIBE TABLE lt_bom_db LINES lv_nbline_db.
      LOOP AT lt_bom_db ASSIGNING FIELD-SYMBOL(<fs_bom_db>).
        lv_statut = <fs_bom_db>-status.
        READ TABLE lt_bom INTO ls_bom
        WITH KEY line = <fs_bom_db>-line
                 art_key = <fs_bom_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_bom-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_bom ASSIGNING FIELD-SYMBOL(<fs_bom>).
        READ TABLE lt_bom_db INTO ls_bom
          WITH KEY line = <fs_bom>-line
                   art_key = <fs_bom>-art_key.
        IF sy-subrc NE 0.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_bom>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
      lv_nbline_test = lv_nbline_db - lv_nbline_db_v." - lv_nbline.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c." - lv_nbline.
*
      CLEAR lv_statut.
      LOOP AT lt_bom ASSIGNING <fs_bom>.
        <fs_bom>-id = iv_bu.
        IF iv_flag_copy IS NOT INITIAL.
          lv_line = lv_line + 1.
          <fs_bom>-line = lv_line.
        ENDIF.
        <fs_bom>-reqid = lv_reqid.
        <fs_bom>-date_modif = sy-datum.
        <fs_bom>-user_modif = sy-uname.
        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statbom <> gc_statuscompleted.
          IF  ( gc_statusvalidated EQ <fs_bom>-status AND lv_nbline_test <= 0 ) OR
              ( gc_statuscompleted EQ <fs_bom>-status AND lv_nbline_test2 <= 0 ) OR
                gc_statusinerror EQ <fs_bom>-status.
            lv_statut = <fs_bom>-status.
          ELSEIF ls_reqids-statbom < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_bom>-status.
              lv_statut = <fs_bom>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statbom >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.
        ENDIF.
      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statbom = lv_statut.
      ENDIF.
    ENDIF.

    IF it_fia IS NOT INITIAL.
      lt_fia = it_fia.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.
      SORT lt_fia_db BY line DESCENDING.
      READ TABLE lt_fia_db INTO DATA(ls_fia) INDEX 1.
      lv_line = ls_fia-line.

      DESCRIBE TABLE lt_fia_db LINES lv_nbline_db.
      LOOP AT lt_fia_db ASSIGNING FIELD-SYMBOL(<fs_fia_db>).
        lv_statut = <fs_fia_db>-status.
        READ TABLE lt_fia INTO ls_fia
        WITH KEY line = <fs_fia_db>-line
                 art_key = <fs_fia_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_fia-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_fia ASSIGNING FIELD-SYMBOL(<fs_fia>).
        READ TABLE lt_fia_db INTO ls_fia
          WITH KEY line = <fs_fia>-line
                   art_key = <fs_fia>-art_key.
        IF sy-subrc NE 0.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_fia>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
      lv_nbline_test = lv_nbline_db - lv_nbline_db_v." - lv_nbline.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c." - lv_nbline.
*
      CLEAR lv_statut.
      LOOP AT lt_fia ASSIGNING <fs_fia>.
        <fs_fia>-id = iv_bu.
        IF iv_flag_copy IS NOT INITIAL.
          lv_line = lv_line + 1.
          <fs_fia>-line = lv_line.
        ENDIF.
        <fs_fia>-reqid = lv_reqid.
        <fs_fia>-date_modif = sy-datum.
        <fs_fia>-user_modif = sy-uname.
        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statfia <> gc_statuscompleted.
          IF  ( gc_statusvalidated EQ <fs_fia>-status AND lv_nbline_test <= 0 ) OR
              ( gc_statuscompleted EQ <fs_fia>-status AND lv_nbline_test2 <= 0 ) OR
                gc_statusinerror EQ <fs_fia>-status.
            lv_statut = <fs_fia>-status.
          ELSEIF ls_reqids-statfia < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_fia>-status.
              lv_statut = <fs_fia>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statfia >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.
        ENDIF.

      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statfia = lv_statut.
      ENDIF.
    ENDIF.

    IF it_list IS NOT INITIAL.
      lt_list = it_list.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.
      SORT lt_list_db BY line DESCENDING.
      READ TABLE lt_list_db INTO DATA(ls_list) INDEX 1.
      lv_line = ls_list-line.

      DESCRIBE TABLE lt_list_db LINES lv_nbline_db.
      LOOP AT lt_list_db ASSIGNING FIELD-SYMBOL(<fs_list_db>).
        lv_statut = <fs_list_db>-status.
        READ TABLE lt_list INTO ls_list
        WITH KEY line = <fs_list_db>-line
                 art_key = <fs_list_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_list-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_list ASSIGNING FIELD-SYMBOL(<fs_list>).
        READ TABLE lt_list_db INTO ls_list
          WITH KEY line = <fs_list>-line
                   art_key = <fs_list>-art_key.
        IF sy-subrc NE 0.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_list>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
      lv_nbline_test = lv_nbline_db - lv_nbline_db_v." - lv_nbline.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c." - lv_nbline.
*
      CLEAR lv_statut.
      LOOP AT lt_list ASSIGNING <fs_list>.
        <fs_list>-id = iv_bu.
        IF iv_flag_copy IS NOT INITIAL.
          lv_line = lv_line + 1.
          <fs_list>-line = lv_line.
        ENDIF.
        <fs_list>-reqid = lv_reqid.
        <fs_list>-date_modif = sy-datum.
        <fs_list>-user_modif = sy-uname.
        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statlist <> gc_statuscompleted.
          IF  ( gc_statusvalidated EQ <fs_list>-status AND lv_nbline_test <= 0 ) OR
              ( gc_statuscompleted EQ <fs_list>-status AND lv_nbline_test2 <= 0 ) OR
                gc_statusinerror EQ <fs_list>-status.
            lv_statut = <fs_list>-status.
          ELSEIF ls_reqids-statlist < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_list>-status.
              lv_statut = <fs_list>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statlist >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.
        ENDIF.

      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statlist = lv_statut.
      ENDIF.
    ENDIF.

    IF it_srlist IS NOT INITIAL.
      lt_srlist = it_srlist.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.
      SORT lt_srlist_db BY line DESCENDING.
      READ TABLE lt_srlist_db INTO DATA(ls_srlist) INDEX 1.
      lv_line = ls_srlist-line.

      DESCRIBE TABLE lt_srlist_db LINES lv_nbline_db.
      LOOP AT lt_srlist_db ASSIGNING FIELD-SYMBOL(<fs_srlist_db>).
        lv_statut = <fs_srlist_db>-status.
        READ TABLE lt_srlist INTO ls_srlist
        WITH KEY line = <fs_srlist_db>-line
                 art_key = <fs_srlist_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_srlist-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_srlist ASSIGNING FIELD-SYMBOL(<fs_srlist>).
        READ TABLE lt_srlist_db INTO ls_srlist
          WITH KEY line = <fs_srlist>-line
                   art_key = <fs_srlist>-art_key.
        IF sy-subrc NE 0.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_srlist>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
      lv_nbline_test = lv_nbline_db - lv_nbline_db_v." - lv_nbline.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c." - lv_nbline.
*
      CLEAR lv_statut.
      LOOP AT lt_srlist ASSIGNING <fs_srlist>.
        <fs_srlist>-id = iv_bu.
        IF iv_flag_copy IS NOT INITIAL.
          lv_line = lv_line + 1.
          <fs_srlist>-line = lv_line.
        ENDIF.
        <fs_srlist>-reqid = lv_reqid.
        <fs_srlist>-date_modif = sy-datum.
        <fs_srlist>-user_modif = sy-uname.
        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statsrlist <> gc_statuscompleted.
          IF  ( gc_statusvalidated EQ <fs_srlist>-status AND lv_nbline_test <= 0 ) OR
              ( gc_statuscompleted EQ <fs_srlist>-status AND lv_nbline_test2 <= 0 ) OR
                gc_statusinerror EQ <fs_srlist>-status.
            lv_statut = <fs_srlist>-status.
          ELSEIF ls_reqids-statsrlist < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_srlist>-status.
              lv_statut = <fs_srlist>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statsrlist >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.
        ENDIF.
      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statsrlist = lv_statut.
      ENDIF.
    ENDIF.


    IF it_sale IS NOT INITIAL.
      lt_sale = it_sale.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.
      SORT lt_sale_db BY line DESCENDING.
      READ TABLE lt_sale_db INTO DATA(ls_sale) INDEX 1.
      lv_line = ls_sale-line.

      DESCRIBE TABLE lt_sale_db LINES lv_nbline_db.
      LOOP AT lt_sale_db ASSIGNING FIELD-SYMBOL(<fs_sale_db>).
        lv_statut = <fs_sale_db>-status.
        READ TABLE lt_sale INTO ls_sale
        WITH KEY line = <fs_sale_db>-line
                 art_key = <fs_sale_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_sale-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_sale ASSIGNING FIELD-SYMBOL(<fs_sale>).
        READ TABLE lt_sale_db INTO ls_sale
          WITH KEY line = <fs_sale>-line
                   art_key = <fs_sale>-art_key.
        IF sy-subrc NE 0.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_sale>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
      lv_nbline_test = lv_nbline_db - lv_nbline_db_v." - lv_nbline.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c." - lv_nbline.
*
      CLEAR lv_statut.
      LOOP AT lt_sale ASSIGNING <fs_sale>.
        <fs_sale>-id = iv_bu.
        IF iv_flag_copy IS NOT INITIAL.
          lv_line = lv_line + 1.
          <fs_sale>-line = lv_line.
        ENDIF.
        <fs_sale>-reqid = lv_reqid.
        <fs_sale>-date_modif = sy-datum.
        <fs_sale>-user_modif = sy-uname.
        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statsale <> gc_statuscompleted.
          IF  ( gc_statusvalidated EQ <fs_sale>-status AND lv_nbline_test <= 0 ) OR
              ( gc_statuscompleted EQ <fs_sale>-status AND lv_nbline_test2 <= 0 ) OR
                gc_statusinerror EQ <fs_sale>-status.
            lv_statut = <fs_sale>-status.
          ELSEIF ls_reqids-statsale < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_sale>-status.
              lv_statut = <fs_sale>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statsale >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.
        ENDIF.
      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statsale = lv_statut.
      ENDIF.
    ENDIF.

    IF it_logdc IS NOT INITIAL.
      lt_logdc = it_logdc.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.
      SORT lt_logdc_db BY line DESCENDING.
      READ TABLE lt_logdc_db INTO DATA(ls_logdc) INDEX 1.
      lv_line = ls_logdc-line.

      DESCRIBE TABLE lt_logdc_db LINES lv_nbline_db.
      LOOP AT lt_logdc_db ASSIGNING FIELD-SYMBOL(<fs_logdc_db>).
        lv_statut = <fs_logdc_db>-status.
        READ TABLE lt_logdc INTO ls_logdc
        WITH KEY line = <fs_logdc_db>-line
                 art_key = <fs_logdc_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_logdc-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_logdc ASSIGNING FIELD-SYMBOL(<fs_logdc>).
        READ TABLE lt_logdc_db INTO ls_logdc
          WITH KEY line = <fs_logdc>-line
                   art_key = <fs_logdc>-art_key.
        IF sy-subrc NE 0.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_logdc>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
      lv_nbline_test = lv_nbline_db - lv_nbline_db_v." - lv_nbline.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c." - lv_nbline.
*
      CLEAR lv_statut.
      LOOP AT lt_logdc ASSIGNING <fs_logdc>.
        <fs_logdc>-id = iv_bu.
        IF iv_flag_copy IS NOT INITIAL.
          lv_line = lv_line + 1.
          <fs_logdc>-line = lv_line.
        ENDIF.
        <fs_logdc>-reqid = lv_reqid.
        <fs_logdc>-date_modif = sy-datum.
        <fs_logdc>-user_modif = sy-uname.
        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statdc <> gc_statuscompleted.
          IF  ( gc_statusvalidated EQ <fs_logdc>-status AND lv_nbline_test <= 0 ) OR
              ( gc_statuscompleted EQ <fs_logdc>-status AND lv_nbline_test2 <= 0 ) OR
                gc_statusinerror EQ <fs_logdc>-status.
            lv_statut = <fs_logdc>-status.
          ELSEIF ls_reqids-statdc < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_logdc>-status.
              lv_statut = <fs_logdc>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statdc >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.
        ENDIF.
      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statdc = lv_statut.
      ENDIF.
    ENDIF.

    IF it_logsto IS NOT INITIAL.
      lt_logsto = it_logsto.
      CLEAR : lv_line, lv_nbline_db_v, lv_nbline_db_c, lv_err, lv_statut.
      SORT lt_logsto_db BY line DESCENDING.
      READ TABLE lt_logsto_db INTO DATA(ls_logsto) INDEX 1.
      lv_line = ls_logsto-line.

      DESCRIBE TABLE lt_logsto_db LINES lv_nbline_db.
      LOOP AT lt_logsto_db ASSIGNING FIELD-SYMBOL(<fs_logsto_db>).
        lv_statut = <fs_logsto_db>-status.
        READ TABLE lt_logsto INTO ls_logsto
        WITH KEY line = <fs_logsto_db>-line
                 art_key = <fs_logsto_db>-art_key.
        IF sy-subrc IS INITIAL.
          lv_statut = ls_logsto-status.
        ENDIF.
        CASE lv_statut.
          WHEN gc_statusvalidated.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statuscompleted.
            lv_nbline_db_c = lv_nbline_db_c + 1.
            lv_nbline_db_v = lv_nbline_db_v + 1.
          WHEN gc_statusinerror.
            lv_err = abap_true.
          WHEN gc_statusinprogress.
            lv_inprog  = abap_true.
          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

      LOOP AT lt_logsto ASSIGNING FIELD-SYMBOL(<fs_logsto>).
        READ TABLE lt_logsto_db INTO ls_logsto
          WITH KEY line = <fs_logsto>-line
                   art_key = <fs_logsto>-art_key.
        IF sy-subrc NE 0.
          lv_nbline_db = lv_nbline_db + 1.
          CASE <fs_logsto>-status.
            WHEN gc_statusvalidated.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statuscompleted.
              lv_nbline_db_c = lv_nbline_db_c + 1.
              lv_nbline_db_v = lv_nbline_db_v + 1.
            WHEN gc_statusinerror.
              lv_err = abap_true.
            WHEN gc_statusinprogress.
              lv_inprog  = abap_true.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
      lv_nbline_test = lv_nbline_db - lv_nbline_db_v." - lv_nbline.
      lv_nbline_test2 = lv_nbline_db - lv_nbline_db_c." - lv_nbline.
*
      CLEAR lv_statut.
      LOOP AT lt_logsto ASSIGNING <fs_logsto>.
        <fs_logsto>-id = iv_bu.
        IF iv_flag_copy IS NOT INITIAL.
          lv_line = lv_line + 1.
          <fs_logsto>-line = lv_line.
        ENDIF.
        <fs_logsto>-reqid = lv_reqid.
        <fs_logsto>-date_modif = sy-datum.
        <fs_logsto>-user_modif = sy-uname.
        IF lv_err IS NOT INITIAL.
          lv_statut = gc_statusinerror.
        ELSE.
          CHECK ls_reqids-statstore <> gc_statuscompleted.
          IF  ( gc_statusvalidated EQ <fs_logsto>-status AND lv_nbline_test <= 0 ) OR
              ( gc_statuscompleted EQ <fs_logsto>-status AND lv_nbline_test2 <= 0 ) OR
                gc_statusinerror EQ <fs_logsto>-status.
            lv_statut = <fs_logsto>-status.
          ELSEIF ls_reqids-statstore < gc_statusvalidated.
            IF lv_inprog IS INITIAL AND gc_statusvalidated NE <fs_logsto>-status.
              lv_statut = <fs_logsto>-status.
            ELSE.
              lv_statut = gc_statusinprogress.
            ENDIF.
          ELSEIF ls_reqids-statstore >= gc_statusvalidated
            AND lv_err IS INITIAL.
            lv_statut = gc_statusincreation.
          ENDIF.
        ENDIF.

      ENDLOOP.
      IF lv_statut IS NOT INITIAL.
        ls_reqids-statstore = lv_statut.
      ENDIF.
    ENDIF.

***    On contrôle si l'on doit mettre à jour le statut global.
    CLEAR lv_statut.
    CALL FUNCTION 'DDIF_FIELDINFO_GET'
      EXPORTING
        tabname        = '/DLWUPEX/TREQIDS'
        langu          = sy-langu
      TABLES
        dfies_tab      = lt_dfies_tab
      EXCEPTIONS
        not_found      = 1
        internal_error = 2
        OTHERS         = 3.
    IF sy-subrc EQ 0
      AND lt_dfies_tab[] IS NOT INITIAL.

*     On va faire une boucle indexé
      SORT lt_dfies_tab BY position.
      READ TABLE lt_dfies_tab
        TRANSPORTING NO FIELDS
        WITH KEY fieldname = 'STATUS'.
*        BINARY SEARCH.
      CHECK sy-subrc EQ 0.

      CLEAR : ls_dfies_tab.
      LOOP AT lt_dfies_tab INTO ls_dfies_tab FROM sy-tabix + 1.
        CHECK ls_dfies_tab-fieldname CS 'STAT'.

        ASSIGN COMPONENT ls_dfies_tab-fieldname OF STRUCTURE ls_reqids TO <fs_field>.

        IF lv_statut IS INITIAL.
          lv_statut = <fs_field>.
        ELSE.
          CASE <fs_field>.
            WHEN gc_statusnew.
              IF lv_statut = gc_statusvalidated.
                lv_statut = gc_statusinprogress.
              ENDIF.
            WHEN gc_statusinprogress.
              IF lv_statut <= gc_statusvalidated.
                lv_statut = <fs_field>.
              ENDIF.
            WHEN gc_statusvalidated.
              IF lv_statut = gc_statusnew.
                lv_statut = gc_statusinprogress.
              ENDIF.
              IF lv_statut > gc_statusvalidated.
                lv_statut = gc_statusvalidated.
              ENDIF.
            WHEN gc_statusincreation.
              CHECK lv_statut <> gc_statusvalidated.
              IF lv_statut = gc_statuscompleted.
                lv_statut = gc_statusincreation.
              ENDIF.
            WHEN gc_statusinerror.
*              CHECK lv_statut <> gc_statusvalidated.
              lv_statut = <fs_field>.
            WHEN gc_statuscompleted.
              CHECK lv_statut <> gc_statusvalidated.
          ENDCASE.
        ENDIF.
      ENDLOOP.
    ENDIF.

    IF lv_statut EQ gc_statuscompleted.
      ls_reqids-statdg  = ls_reqids-statunit = ls_reqids-statcara = ls_reqids-statbom =
      ls_reqids-statfia = ls_reqids-statlist = ls_reqids-statsrlist = ls_reqids-statsale =
      ls_reqids-statdc = ls_reqids-statstore = gc_statuscompleted.
    ENDIF.

* alimentation de la table de requêtes
    ls_reqids-id = iv_bu.
    ls_reqids-reqid = lv_reqid.
    ls_reqids-status = lv_statut.
    APPEND ls_reqids TO lt_reqids.


    CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
      EXPORTING
        it_gdata           = lt_gdata
        it_unit            = lt_unit
        it_caract          = lt_caract
        it_bom             = lt_bom
        it_fia             = lt_fia
        it_list            = lt_list
        it_srlist          = lt_srlist
        it_sale            = lt_sale
        it_logdc           = lt_logdc
        it_logsto          = lt_logsto
        it_reqids          = lt_reqids
        iv_change_worklist = 'X'
        iv_change_reqids   = iv_change_reqids
      CHANGING
        ct_msg             = ct_msg
        cv_rc              = cv_rc.

    COMMIT WORK AND WAIT.

    CHECK	iv_lockdb IS NOT INITIAL.

    CALL FUNCTION 'DEQUEUE_/DLWUPEX/REQIDS'
      EXPORTING
        mode_/dlwupex/treqids = 'E'
        mandt                 = sy-mandt
        id                    = iv_bu
        reqid                 = cv_reqid
*       X_ID                  = ' '
*       X_REQID               = ' '
*       _SCOPE                = '3'
*       _SYNCHRON             = ' '
*       _COLLECT              = ' '
      .


  ENDMETHOD.


  METHOD get_data.

    IF  ct_gdata IS NOT SUPPLIED AND
        ct_unit IS NOT SUPPLIED AND
        ct_caract IS NOT SUPPLIED AND
        ct_bom IS NOT SUPPLIED AND
        ct_fia IS NOT SUPPLIED AND
        ct_list IS NOT SUPPLIED AND
        ct_srlist IS NOT SUPPLIED AND
        ct_sale IS NOT SUPPLIED AND
        ct_logdc IS NOT SUPPLIED AND
        ct_logsto IS NOT SUPPLIED AND
        ct_msg IS NOT SUPPLIED AND
        ct_msg_ch IS NOT SUPPLIED AND
        ct_reqids IS NOT SUPPLIED.
      cv_rc = 4.
      EXIT.
    ENDIF.



    IF ct_gdata IS SUPPLIED.
      SELECT * FROM /dlwupex/tgdata INTO TABLE ct_gdata
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_unit IS SUPPLIED.
      SELECT * FROM /dlwupex/tunit INTO TABLE ct_unit
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_caract IS SUPPLIED.
      SELECT * FROM /dlwupex/tcaract INTO TABLE ct_caract
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_bom IS SUPPLIED.
      SELECT * FROM /dlwupex/tbom INTO TABLE ct_bom
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_fia IS SUPPLIED.
      SELECT * FROM /dlwupex/tfia INTO TABLE ct_fia
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_list IS SUPPLIED.
      SELECT * FROM /dlwupex/tlist INTO TABLE ct_list
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_srlist IS SUPPLIED.
      SELECT * FROM /dlwupex/tsrlist INTO TABLE ct_srlist
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_sale IS SUPPLIED.
      SELECT * FROM /dlwupex/tsale INTO TABLE ct_sale
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_logdc IS SUPPLIED.
      SELECT * FROM /dlwupex/tlogdc INTO TABLE ct_logdc
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_logsto IS SUPPLIED.
      SELECT * FROM /dlwupex/tlogsto INTO TABLE ct_logsto
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_msg IS SUPPLIED.
      SELECT * FROM /dlwupex/tmsg INTO TABLE ct_msg
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

        IF ct_msg_ch IS SUPPLIED.
      SELECT * FROM /dlwupex/tmsg_ch INTO TABLE ct_msg_ch
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    IF ct_reqids IS SUPPLIED.
      SELECT * FROM /dlwupex/treqids INTO TABLE ct_reqids
       WHERE id = iv_bu AND
             reqid = iv_reqid.
    ENDIF.

    SORT :  ct_unit,
            ct_caract,
            ct_bom,
            ct_fia,
            ct_list,
            ct_srlist,
            ct_sale,
            ct_logdc,
            ct_logsto,
            ct_gdata,
            ct_msg,
            ct_msg_ch,
            ct_reqids.

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
      WHERE name = gc_class_core.
    IF sy-subrc EQ 0
      AND lv_class IS NOT INITIAL.
      CREATE OBJECT rv_object
        TYPE (lv_class)
        EXPORTING iv_bu = iv_bu.
    ELSE.
      lv_class = gc_classname_core.
      CREATE OBJECT rv_object
        TYPE (lv_class)
        EXPORTING iv_bu = iv_bu.
    ENDIF.

  ENDMETHOD.


  METHOD get_next_matnr.

    cv_matnr = cv_matnr + 1.

  ENDMETHOD.


  METHOD get_table_fields.

    CALL FUNCTION 'CACS_GET_TABLE_FIELDS'
      EXPORTING
        i_tabname     = iv_tabname
      TABLES
        t_keyfield    = ct_keyfields
        t_nonkeyfield = ct_nonkeyfields.

  ENDMETHOD.


  METHOD insert_in_worklist.

    DATA(lv_createreqids) = iv_change_reqids.

    READ TABLE it_reqids INTO DATA(ls_reqids) INDEX 1.

    SELECT COUNT(*) UP TO 1 ROWS FROM /dlwupex/treqids
      WHERE id = ls_reqids-id AND
            reqid = ls_reqids-reqid.
    IF sy-subrc IS NOT INITIAL.
      lv_createreqids = abap_true.
    ENDIF.


    IF iv_change_worklist IS NOT INITIAL.
      IF it_gdata IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_gdata
          EXPORTING
            it_gdata = it_gdata
          CHANGING
            ct_msg   = ct_msg
            cv_rc    = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_gdata IS NOT INITIAL OR ls_reqids-statdg IS INITIAL.
          UPDATE /dlwupex/treqids SET statdg = ls_reqids-statdg
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.


      IF it_unit IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_unit
          EXPORTING
            it_unit = it_unit
          CHANGING
            ct_msg  = ct_msg
            cv_rc   = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_unit IS NOT INITIAL OR ls_reqids-statunit IS INITIAL.
          UPDATE /dlwupex/treqids SET statunit = ls_reqids-statunit
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.

      IF it_caract IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_caract
          EXPORTING
            it_caract = it_caract
          CHANGING
            ct_msg    = ct_msg
            cv_rc     = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_caract IS NOT INITIAL OR ls_reqids-statcara IS INITIAL.
          UPDATE /dlwupex/treqids SET statcara = ls_reqids-statcara
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.


      IF it_bom IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_bom
          EXPORTING
            it_bom = it_bom
          CHANGING
            ct_msg = ct_msg
            cv_rc  = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_bom IS NOT INITIAL OR ls_reqids-statbom IS INITIAL.
          UPDATE /dlwupex/treqids SET statbom = ls_reqids-statbom
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.


      IF it_fia IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_fia
          EXPORTING
            it_fia = it_fia
          CHANGING
            ct_msg = ct_msg
            cv_rc  = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_fia IS NOT INITIAL OR ls_reqids-statfia IS INITIAL.
          UPDATE /dlwupex/treqids SET statfia = ls_reqids-statfia
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.

      IF it_list IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_list
          EXPORTING
            it_list = it_list
          CHANGING
            ct_msg  = ct_msg
            cv_rc   = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_list IS NOT INITIAL OR ls_reqids-statlist IS INITIAL.
          UPDATE /dlwupex/treqids SET statlist = ls_reqids-statlist
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.

      IF it_srlist IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_srlist
          EXPORTING
            it_srlist = it_srlist
          CHANGING
            ct_msg    = ct_msg
            cv_rc     = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_srlist IS NOT INITIAL OR ls_reqids-statsrlist IS INITIAL.
          UPDATE /dlwupex/treqids SET statsrlist = ls_reqids-statsrlist
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.

      IF it_sale IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_sale
          EXPORTING
            it_sale = it_sale
          CHANGING
            ct_msg  = ct_msg
            cv_rc   = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_sale IS NOT INITIAL OR ls_reqids-statsale IS INITIAL.
          UPDATE /dlwupex/treqids SET statsale = ls_reqids-statsale
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.

      IF it_logdc IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_logdc
          EXPORTING
            it_logdc = it_logdc
          CHANGING
            ct_msg   = ct_msg
            cv_rc    = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_logdc IS NOT INITIAL OR ls_reqids-statdc IS INITIAL.
          UPDATE /dlwupex/treqids SET statdc = ls_reqids-statdc
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.

      IF it_logsto IS NOT INITIAL.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_logsto
          EXPORTING
            it_logsto = it_logsto
          CHANGING
            ct_msg    = ct_msg
            cv_rc     = cv_rc.
      ENDIF.
      IF iv_change_reqids = abap_true.
        IF it_logsto IS NOT INITIAL OR ls_reqids-statstore IS INITIAL.
          UPDATE /dlwupex/treqids SET statstore = ls_reqids-statstore
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ENDIF.
      ENDIF.
*    ENDIF.
      IF iv_change_reqids IS NOT INITIAL.

*        SELECT COUNT(*) UP TO 1 ROWS FROM /dlwupex/treqids
*              WHERE id = ls_reqids-id                                     AND
*                    reqid = ls_reqids-reqid                               AND
*                    ( statdg = gc_statuscompleted OR statdg = '' )  AND
*                    ( statunit = gc_statuscompleted OR statunit = '' )     AND
*                    ( statcara = gc_statuscompleted OR statcara = '' )     AND
*                    ( statbom = gc_statuscompleted  OR statbom = '' )     AND
*                    ( statfia = gc_statuscompleted OR statfia = '' )     AND
*                    ( statlist = gc_statuscompleted OR statlist = '' )     AND
*                    ( statsrlist = gc_statuscompleted OR statsrlist = '' )     AND
*                    ( statsale = gc_statuscompleted OR statsale = '' )     AND
*                    ( statdc = gc_statuscompleted OR statdc = '' )     AND
*                    ( statstore = gc_statuscompleted   OR statstore = '' ).
**    IF sy-subrc IS NOT INITIAL.
*        IF sy-subrc IS INITIAL.
*          UPDATE /dlwupex/treqids SET status = gc_statuscompleted
*            WHERE id = ls_reqids-id AND
*                  reqid = ls_reqids-reqid.
*        ELSE.
        SELECT COUNT(*) UP TO 1 ROWS FROM /dlwupex/treqids
           WHERE id = ls_reqids-id                                     AND
                 reqid = ls_reqids-reqid                               AND
                 ( ( statdg >= gc_statusvalidated AND statdg <> gc_statusinerror ) OR statdg = '' )  AND
                 ( ( statunit >= gc_statusvalidated AND statunit <> gc_statusinerror )    OR statunit = '' )     AND
                 ( ( statcara >= gc_statusvalidated AND statcara <> gc_statusinerror )    OR statcara = '' )     AND
                 ( ( statbom >= gc_statusvalidated AND statbom <> gc_statusinerror )     OR statbom = '' )     AND
                 ( ( statfia >= gc_statusvalidated AND statfia <> gc_statusinerror )     OR statfia = '' )     AND
                 ( ( statlist >= gc_statusvalidated AND statlist <> gc_statusinerror )    OR statlist = '' )     AND
                 ( ( statsrlist >= gc_statusvalidated AND statsrlist <> gc_statusinerror )  OR statsrlist = '' )     AND
                 ( ( statsale >= gc_statusvalidated AND statsale <> gc_statusinerror )    OR statsale = '' )     AND
                 ( ( statdc >= gc_statusvalidated AND statdc <> gc_statusinerror )      OR statdc = '' )     AND
                 ( ( statstore >= gc_statusvalidated AND statstore <> gc_statusinerror )   OR statstore = '' ).
*    IF sy-subrc IS NOT INITIAL.
        IF sy-subrc IS INITIAL.
          UPDATE /dlwupex/treqids SET status = gc_statusvalidated
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
        ELSE.
*     Selon le statut du header on le met à jour en table.
          IF ls_reqids-status = gc_statusinprogress OR
             ls_reqids-status = gc_statusincreation OR
            ls_reqids-status = gc_statusinerror OR
            ls_reqids-status = gc_statuscompleted.
            UPDATE /dlwupex/treqids SET status = ls_reqids-status
            WHERE id = ls_reqids-id AND
                  reqid = ls_reqids-reqid.
          ELSEIF lv_createreqids = abap_true.
            CALL METHOD /dlwupex/cl_cockpit_article=>fill_reqids
              EXPORTING
                it_reqids = it_reqids
              CHANGING
                ct_msg    = ct_msg
                cv_rc     = cv_rc.
          ENDIF.

        ENDIF.
      ENDIF.
    ELSE.
*  ENDIF.

      IF it_reqids IS NOT INITIAL AND iv_change_reqids = abap_true.
        CALL METHOD /dlwupex/cl_cockpit_article=>fill_reqids
          EXPORTING
            it_reqids = it_reqids
          CHANGING
            ct_msg    = ct_msg
            cv_rc     = cv_rc.
      ENDIF.
    ENDIF.

    COMMIT WORK AND WAIT.

  ENDMETHOD.


  METHOD insert_msg_in_worklist.

    DATA ls_msg        TYPE /dlwupex/tmsg.

    TRY .
        MODIFY /dlwupex/tmsg_ch FROM TABLE it_msg.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TMSG_CH'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
*        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.

  ENDMETHOD.


  METHOD read_data_from_matnr.

    IF  ct_gdata IS NOT SUPPLIED AND
        ct_unit IS NOT SUPPLIED AND
        ct_caract IS NOT SUPPLIED AND
        ct_bom IS NOT SUPPLIED AND
        ct_fia IS NOT SUPPLIED AND
        ct_list IS NOT SUPPLIED AND
        ct_srlist IS NOT SUPPLIED AND
        ct_sale IS NOT SUPPLIED AND
        ct_logdc IS NOT SUPPLIED AND
        ct_logsto IS NOT SUPPLIED AND
        ct_msg_ch IS NOT SUPPLIED.
      cv_rc = 4.
      EXIT.
    ENDIF.



    IF ct_gdata IS SUPPLIED.
      SELECT * FROM /dlwupex/tgdata INTO TABLE ct_gdata
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_unit IS SUPPLIED.
      SELECT * FROM /dlwupex/tunit INTO TABLE ct_unit
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_caract IS SUPPLIED.
      SELECT * FROM /dlwupex/tcaract INTO TABLE ct_caract
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_bom IS SUPPLIED.
      SELECT * FROM /dlwupex/tbom INTO TABLE ct_bom
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_fia IS SUPPLIED.
      SELECT * FROM /dlwupex/tfia INTO TABLE ct_fia
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_list IS SUPPLIED.
      SELECT * FROM /dlwupex/tlist INTO TABLE ct_list
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_srlist IS SUPPLIED.
      SELECT * FROM /dlwupex/tsrlist INTO TABLE ct_srlist
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_sale IS SUPPLIED.
      SELECT * FROM /dlwupex/tsale INTO TABLE ct_sale
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_logdc IS SUPPLIED.
      SELECT * FROM /dlwupex/tlogdc INTO TABLE ct_logdc
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_logsto IS SUPPLIED.
      SELECT * FROM /dlwupex/tlogsto INTO TABLE ct_logsto
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             art_key = iv_art_key.
    ENDIF.

    IF ct_msg_ch IS SUPPLIED.
      SELECT * FROM /dlwupex/tmsg_ch INTO TABLE ct_msg_ch
       WHERE id = iv_bu AND
             reqid = iv_reqid AND
             matnr = iv_art_key.
    ENDIF.

    SORT :  ct_unit,
            ct_caract,
            ct_bom,
            ct_fia,
            ct_list,
            ct_srlist,
            ct_sale,
            ct_logdc,
            ct_logsto,
            ct_gdata,
            ct_msg_ch.

  ENDMETHOD.


  METHOD read_tfields_custo.

    SELECT * FROM /dlwupex/tfields INTO TABLE me->gt_tfields
      WHERE id = me->gv_bu AND
            actif = 'Y'.

    SELECT * FROM /dlwupex/tbuhead INTO TABLE me->gt_tbuhead
      WHERE id = me->gv_bu AND
            ckp_creation = abap_true.

    SELECT * FROM /dlwupex/tbuoa INTO TABLE me->gt_tbuoa
      WHERE id = me->gv_bu AND
            ckp_creation = abap_true.

    SELECT * FROM /dlwupex/tbuoc INTO TABLE me->gt_tbuoc
      WHERE id = me->gv_bu AND
            ckp_creation = abap_true.

    SELECT * FROM /dlwupex/tcusto INTO TABLE me->gt_tcusto.

    SORT : me->gt_tfields,
           me->gt_tbuhead,
           me->gt_tbuoa,
           me->gt_tbuoc,
           me->gt_tcusto.

  ENDMETHOD.


  METHOD set_errors.

    DATA ls_msg        TYPE /dlwupex/tmsg.

    TRY .
        MODIFY /dlwupex/tmsg FROM TABLE it_msg.
      CATCH cx_root.
        ls_msg-type = 'E'.
        ls_msg-idmsg = gc_classmsg.
        ls_msg-num = '032'.
        ls_msg-message_v1 = '/DLWUPEX/TMSG'.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1.
        APPEND ls_msg TO ct_msg.
        cv_rc = 4.
    ENDTRY.

  ENDMETHOD.


  METHOD set_queue_error.
    DATA :
      lt_gdata  TYPE /dlwupex/tgdata_tt,
      lt_reqids TYPE /dlwupex/treqids_tt,
      lv_status TYPE /dlwupex/elinestatus,
      lv_reqid  TYPE /dlwupex/ereqid.

    lv_reqid = iv_reqid.
    CALL METHOD /dlwupex/cl_cockpit_article=>get_data
      EXPORTING
        iv_bu     = iv_bu
        iv_reqid  = iv_reqid
      CHANGING
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

    lv_status = gc_statusinerror. " error

    CALL METHOD /dlwupex/cl_cockpit_article=>read_data_from_matnr
      EXPORTING
        iv_bu      = iv_bu
        iv_reqid   = iv_reqid
        iv_art_key = iv_matnr
      CHANGING
        ct_gdata   = lt_gdata
        cv_rc      = cv_rc.

    CALL METHOD /dlwupex/cl_cockpit_article=>change_status
      EXPORTING
        iv_status = lv_status
      CHANGING
        ct_gdata  = lt_gdata
        ct_reqids = lt_reqids
        cv_rc     = cv_rc.

    CALL METHOD /dlwupex/cl_cockpit_article=>set_errors
      EXPORTING
        it_msg = ct_msg
      CHANGING
        cv_rc  = cv_rc
        ct_msg = ct_msg.

    lv_reqid = iv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>fill_worklist
      EXPORTING
        iv_bu    = iv_bu
        it_gdata = lt_gdata
      CHANGING
        ct_msg   = ct_msg
        cv_rc    = cv_rc
        cv_reqid = lv_reqid.

    CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
      EXPORTING
        it_reqids        = lt_reqids
        iv_change_reqids = abap_true
      CHANGING
        ct_msg           = ct_msg
        cv_rc            = cv_rc.

    COMMIT WORK AND WAIT.
  ENDMETHOD.


  METHOD valid_step.
    DATA : ls_gdata TYPE /dlwupex/tgdata,
           lt_gdata TYPE /dlwupex/tgdata_tt.

    SELECT SINGLE * INTO ls_gdata FROM /dlwupex/tgdata
        WHERE id = iv_bu AND
              reqid = iv_reqid AND
              art_key = iv_artkey.
    IF sy-subrc IS NOT INITIAL.
      cv_rc = 4.
      EXIT.
    ENDIF.
    ls_gdata-step = iv_step + 1.
    APPEND ls_gdata TO lt_gdata.

    CALL METHOD /dlwupex/cl_cockpit_article=>insert_in_worklist
      EXPORTING
        it_gdata           = lt_gdata
        iv_change_worklist = abap_true
      CHANGING
        ct_msg             = ct_msg
        cv_rc              = cv_rc.


  ENDMETHOD.
ENDCLASS.
