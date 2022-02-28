@AbapCatalog.sqlViewName: '/DLWUPEX/V_SH_TB'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cds for SH fieldname, tabname'
define view /DLWUPEX/DDL_SH_TABLE
  as select from /dlwupex/tlink as _head
  association [1..1] to dd02t as _tabdesc   on  _tabdesc.tabname    = _head.tabname
                                            and _tabdesc.ddlanguage = $session.system_language
  association [1..1] to dd03t as _fielddesc on  _fielddesc.tabname    = _head.tabname
                                            and _fielddesc.fieldname  = _head.fieldname
                                            and _fielddesc.ddlanguage = $session.system_language
{
  key viewname          as ViewName,
  key tabname           as Tabname,
  key fieldname         as FieldName,
      _tabdesc.ddtext   as TabDesc,
      _fielddesc.ddtext as FieldDesc

}
