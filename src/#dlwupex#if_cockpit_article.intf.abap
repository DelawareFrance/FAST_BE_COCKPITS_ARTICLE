interface /DLWUPEX/IF_COCKPIT_ARTICLE
  public .


  types:
    BEGIN OF ty_lines,
            matnr  TYPE  /dlwupex/ematkey,
            lineid TYPE  /dlwupex/elineid,
          END OF ty_lines .
  types:
    TTY_LINES TYPE STANDARD TABLE OF ty_lines .

  methods CREATE_WORKLIST
    importing
      !IT_MATKL type MGW_MATKL_TT optional
      !IT_ARTICLE type WSD_MATNR_TTY optional
      !IV_FLAG_EXCEL type XFELD optional
      !IV_FLAG_CREATE_EXCEL type XFELD optional
    exporting
      !EV_ID type /DLWUPEX/EREQID
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CT_UNIT type /DLWUPEX/TUNIT_TT optional
      !CT_CARACT type /DLWUPEX/TCARACT_TT optional
      !CT_BOM type /DLWUPEX/TBOM_TT optional
      !CT_FIA type /DLWUPEX/TFIA_TT optional
      !CT_LIST type /DLWUPEX/TLIST_TT optional
      !CT_SRLIST type /DLWUPEX/TSRLIST_TT optional
      !CT_SALE type /DLWUPEX/TSALE_TT optional
      !CT_LOGDC type /DLWUPEX/TLOGDC_TT optional
      !CT_LOGSTO type /DLWUPEX/TLOGSTO_TT optional
      !CT_GDATA type /DLWUPEX/TGDATA_TT optional .
  methods CHECK_VIEWS
    changing
      !CT_TVIEW type /DLWUPEX/TVIEW_TT
      !CT_MSG type /DLWUPEX/TMSG_TT .
  methods EXECUTE_STEP
    importing
      !IV_REQID type /DLWUPEX/EREQID
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods CHECK_F4
    importing
      !IV_TABNAME type TABNAME16
      !IV_TABFIELD type TABFLDNAME
    exporting
      !EV_EXIST type XFELD .
  methods COPY_MATERIAL
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type /DLWUPEX/EMATKEY
      !IV_NBCOPY type INT4
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods DELETE_MATERIAL
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IR_MATNR type PIQ_SELOPT_T
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods DELETE_WORKLIST
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IR_VIEW type PIQ_SELOPT_T optional
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods GET_ERRORS
    importing
      !IV_REQID type /DLWUPEX/EREQID
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  methods SAVE_WORKLIST
    importing
      !IV_REQID type /DLWUPEX/EREQID
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
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods VALIDATED_WORKLIST
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
    changing
      !CT_GDATA type /DLWUPEX/TGDATA_TT optional
      !CT_UNIT type /DLWUPEX/TUNIT_TT optional
      !CT_CARACT type /DLWUPEX/TCARACT_TT optional
      !CT_BOM type /DLWUPEX/TBOM_TT optional
      !CT_FIA type /DLWUPEX/TFIA_TT optional
      !CT_LIST type /DLWUPEX/TLIST_TT optional
      !CT_SRLIST type /DLWUPEX/TSRLIST_TT optional
      !CT_SALE type /DLWUPEX/TSALE_TT optional
      !CT_LOGDC type /DLWUPEX/TLOGDC_TT optional
      !CT_LOGSTO type /DLWUPEX/TLOGSTO_TT optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CV_RC type SYSUBRC .
  methods INSERT_LINE
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type /DLWUPEX/EMATKEY optional
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_NBCOPY type INT4
      !IR_MATNR type PIQ_SELOPT_T optional
      !IV_LINEID type /DLWUPEX/ELINEID
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods DELETE_LINE
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_MATNR type /DLWUPEX/EMATKEY
      !IV_LINEID type /DLWUPEX/ELINEID
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods COPY_LINE
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type /DLWUPEX/EMATKEY
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_NBCOPY type INT4
      !IR_MATNR type PIQ_SELOPT_T
      !IV_LINEID type /DLWUPEX/ELINEID
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods BAPI_MAT_SPECIFIC_FIELDS
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_MATNR type MATNR
      !IV_ART_KEY type MATNR
      !IT_PLANTDATA type BAPIE1MARCRT_TAB
    changing
      !CT_CLIENTEXT type BAPIE1MARAEXTRT_TAB
      !CT_CLIENTEXTX type BAPIE1MARAEXTRTX_TAB
      !CT_PLANTEXT type BAPIE1MARCEXTRT_TAB
      !CT_PLANTEXTX type BAPIE1MARCEXTRTX_TAB
      !CT_STORAGELOCATIONEXT type BAPIE1MARDEXTRT_TAB
      !CT_STORAGELOCATIONEXTX type BAPIE1MARDEXTRTX_TAB
      !CT_VALUATIONEXT type BAPIE1MBEWEXTRT_TAB
      !CT_VALUATIONEXTX type BAPIE1MBEWEXTRTX_TAB
      !CT_WAREHOUSENUMBEREXT type BAPIE1MLGNEXTRT_TAB
      !CT_WAREHOUSENUMBEREXTX type BAPIE1MLGNEXTRTX_TAB
      !CT_STORAGETYPEEXT type BAPIE1MLGTEXTRT_TAB
      !CT_STORAGETYPEEXTX type BAPIE1MLGTEXTRTX_TAB
      !CT_SALESEXT type BAPIE1MVKEEXTRT_TAB
      !CT_SALESEXTX type BAPIE1MVKEEXTRTX_TAB
      !CT_POSEXT type BAPIE1WLK2EXTRT_TAB
      !CT_POSEXTX type BAPIE1WLK2EXTRTX_TAB .
  methods MANAGE_BEFORE_CREATION
    importing
      !IV_BU type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID optional
      !IV_FLAG_INSERT type XFELD optional
    changing
      !CT_GDATA type /DLWUPEX/TGDATA_TT optional
      !CT_UNIT type /DLWUPEX/TUNIT_TT optional
      !CT_CARACT type /DLWUPEX/TCARACT_TT optional
      !CT_BOM type /DLWUPEX/TBOM_TT optional
      !CT_FIA type /DLWUPEX/TFIA_TT optional
      !CT_LIST type /DLWUPEX/TLIST_TT optional
      !CT_SRLIST type /DLWUPEX/TSRLIST_TT optional
      !CT_SALE type /DLWUPEX/TSALE_TT optional
      !CT_LOGDC type /DLWUPEX/TLOGDC_TT optional
      !CT_LOGSTO type /DLWUPEX/TLOGSTO_TT optional
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
  methods MANAGE_DATA_FROM_EXCEL
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CT_UNIT type /DLWUPEX/TUNIT_TT
      !CT_CARACT type /DLWUPEX/TCARACT_TT
      !CT_BOM type /DLWUPEX/TBOM_TT
      !CT_FIA type /DLWUPEX/TFIA_TT
      !CT_LIST type /DLWUPEX/TLIST_TT
      !CT_SRLIST type /DLWUPEX/TSRLIST_TT
      !CT_SALE type /DLWUPEX/TSALE_TT
      !CT_LOGDC type /DLWUPEX/TLOGDC_TT
      !CT_LOGSTO type /DLWUPEX/TLOGSTO_TT
      !CT_GDATA type /DLWUPEX/TGDATA_TT .
  methods ALIM_DATA_SAVE
    changing
      !CT_UNIT type /DLWUPEX/TUNIT_TT
      !CT_CARACT type /DLWUPEX/TCARACT_TT
      !CT_BOM type /DLWUPEX/TBOM_TT
      !CT_FIA type /DLWUPEX/TFIA_TT
      !CT_LIST type /DLWUPEX/TLIST_TT
      !CT_SRLIST type /DLWUPEX/TSRLIST_TT
      !CT_SALE type /DLWUPEX/TSALE_TT
      !CT_LOGDC type /DLWUPEX/TLOGDC_TT
      !CT_LOGSTO type /DLWUPEX/TLOGSTO_TT
      !CT_GDATA type /DLWUPEX/TGDATA_TT .
  methods ALIM_DATA_FOR_EXCEL
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CT_UNIT type /DLWUPEX/TUNIT_TT
      !CT_CARACT type /DLWUPEX/TCARACT_TT
      !CT_BOM type /DLWUPEX/TBOM_TT
      !CT_FIA type /DLWUPEX/TFIA_TT
      !CT_LIST type /DLWUPEX/TLIST_TT
      !CT_SRLIST type /DLWUPEX/TSRLIST_TT
      !CT_SALE type /DLWUPEX/TSALE_TT
      !CT_LOGDC type /DLWUPEX/TLOGDC_TT
      !CT_LOGSTO type /DLWUPEX/TLOGSTO_TT
      !CT_GDATA type /DLWUPEX/TGDATA_TT .
  methods ALIM_MSG_CHECK
    importing
      !IV_INIT type XFELD
    changing
      !CT_TVIEW type /DLWUPEX/TVIEW_TT .
  methods GET_MSG_CHECK
    importing
      !IV_ID type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_NOCHANGE type XFELD optional
    changing
      !CV_RC type SYSUBRC
      !CT_MSG type /DLWUPEX/TMSG_TT .
  methods CONTROL_CHECK_INPROGRESS
    importing
      !IV_ID type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
    exporting
      !EV_INPROGRESS type XFELD
    changing
      !CV_RC type SYSUBRC .
  methods CONTROL_CREATE_INPROGRESS
    importing
      !IV_ID type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
    exporting
      !EV_INPROGRESS type XFELD
    changing
      !CV_RC type SYSUBRC .
  methods MSG_CHECK_TYPE
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IV_ART type MATNR
      !IV_LINE type /DLWUPEX/ELINEID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_FIELDNAME type NAME_FELD
      !IV_VALUE type SYMSGV .
  methods MSG_CHECK_TYPE_GET
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
    exporting
      !ET_MSG type /DLWUPEX/TMSG_TT .
  methods MSG_CHECK_TYPE_DELETE
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IV_ART type MATNR
      !IV_LINE type /DLWUPEX/ELINEID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_FIELDNAME type NAME_FELD .
  methods DELETE_MANY_LINES
    importing
      !IV_REQID type /DLWUPEX/EREQID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IT_LINES type TTY_LINES
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SYSUBRC .
endinterface.
