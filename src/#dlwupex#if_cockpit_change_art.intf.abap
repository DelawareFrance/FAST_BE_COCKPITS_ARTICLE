interface /DLWUPEX/IF_COCKPIT_CHANGE_ART
  public .


  types:
    BEGIN OF ty_data,
      data TYPE REF TO data,
    END OF ty_data .
  types:
    BEGIN OF ty_change_data,
      view    TYPE /dlwupex/eviewname,
      seldata TYPE     /dlwupex/seldata_tt,
      data    TYPE STANDARD TABLE OF ty_data WITH DEFAULT KEY,
    END OF ty_change_data .
  types:
    ty_change_data_tt TYPE STANDARD TABLE OF ty_change_data WITH DEFAULT KEY .

  methods CHECK_AUTHORIZATION
    importing
      !IT_PLANT type WERKS_TTY
      !IT_OA type WART_T_EKORG
      !IT_OC_CD type /DLWUPEX/OC_CD_TT
      !IV_CHECK_EXIST_ONLY type FLAG
    changing
      !CV_RC type SYSUBRC
      !CV_MSG type BAPI_MSG .
  methods GET_MATERIAL_LIMIT
    exporting
      !ES_LIMIT type /DLWUPEX/TLIM_AR .
  methods CONTROL_CHANGE_INPROGRESS
    importing
      !IV_ID type /DLWUPEX/EREQID
    exporting
      !EV_INPROGRESS type XFELD
    changing
      !CV_RC type SYSUBRC .
  methods CHECK_DATA
    importing
      !IV_ART type MATNR optional
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_RC type SYSUBRC
      !CV_MSG type BAPI_MSG .
  methods GET_TABLE_KEY
    importing
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
    exporting
      !ET_KEYS type /DLWUPEX/TVIEW_K_TT .
  methods CHANGE_DATA
    importing
      !IV_METHOD type SEOCLSNAME
      !IV_VIEW type /DLWUPEX/EVIEWNAME
    changing
      !CT_DATA type ANY TABLE
      !CT_SELDATA type /DLWUPEX/SELDATA_TT .
  methods CHANGE_ALL_DATA
    importing
      !IV_ID type /DLWUPEX/EIDCONT optional
      !IV_CONTEXT type /DLWUPEX/ECONTEXT
    exporting
      !EV_RC type SYSUBRC
    changing
      !CT_ALL_DATA type TY_CHANGE_DATA_TT .
  methods GET_STRUCTURE_ORGA
    exporting
      !ET_BUOA type /DLWUPEX/TBUOA_TT
      !ET_BUOC type /DLWUPEX/TBUOC_TT .
  methods GET_DATA_DISPLAY
    exporting
      !ET_WERKS type TABLE_WERKS .
  methods BAPI_CHANGE_DATA .
  methods SAVE_ERRORS .
  methods MANAGE_STATUS
    importing
      !IV_NEWID type XFELD
      !IV_QNAME type TRFCQNAM .
  methods SET_ID
    importing
      !IV_ID type /DLWUPEX/EIDCONT .
endinterface.
