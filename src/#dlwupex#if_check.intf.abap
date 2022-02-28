interface /DLWUPEX/IF_CHECK
  public .


  methods CHECK
    importing
      !IT_TABLE type /DLWUPEX/TVIEW_TT optional
      !IS_TFIELDS type /DLWUPEX/TFIELDS optional
      !IV_TABIX type SYST_TABIX optional
    changing
      !CS_TVIEW type /DLWUPEX/TVIEW optional
      !CT_MSG type /DLWUPEX/TMSG_TT optional
      !CT_TABLE type /DLWUPEX/TVIEW_TT optional
      !CV_RC type SY-SUBRC optional .
  methods CHECK_DUPLICATE_LINE_DB
    importing
      !IV_ID type /DLWUPEX/EBUSUNITID
      !IV_REQID type /DLWUPEX/EREQID
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
    changing
      !CT_MSG type /DLWUPEX/TMSG_TT
      !CV_RC type SY-SUBRC optional
      !CT_TABLE type /DLWUPEX/TVIEW_TT optional .
endinterface.
