interface /DLWUPEX/IF_CHECK_MODIF
  public .


  methods CHECK
    importing
      !IV_ART type MATNR
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
    changing
      !CV_RC type SYSUBRC
      !CV_MSG type BAPI_MSG .
  methods CHECK_FIELDS
    importing
      !IV_ART type MATNR
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IV_FIELDNAME type TABFLDNAME
      !IV_VALUE type /DLWUPEX/EVALUEFIELD
      !IV_VALUE_LINKED type /DLWUPEX/EVALUEFIELD
      !IV_FIELDNAME_LINKED type TABFLDNAME
      !IV_WERKS type WERKS_D optional
    changing
      !CV_RC type SYSUBRC
      !CV_MSG type BAPI_MSG .
endinterface.
