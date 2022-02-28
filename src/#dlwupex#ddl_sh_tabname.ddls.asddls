@AbapCatalog.sqlViewName: '/DLWUPEX/V_SH_TN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cds for SH tabname'
define view /DLWUPEX/DDL_SH_TABNAME
  as select distinct from /dlwupex/tlink as _head
  association [1..1] to dd02t            as _tabdesc on  _tabdesc.tabname    = _head.tabname
                                                     and _tabdesc.ddlanguage = $session.system_language
  association [1..1] to /dlwupex/tview_k as _k       on  _k.viewname = _head.viewname
                                                     and _k.tabname  = _head.tabname
{
  key viewname        as ViewName,
  key tabname         as Tabname,
      _tabdesc.ddtext as TabDesc,
      _k.display_only as OnlyDisplay
}
//where
//  _k.var_def = 'X'
