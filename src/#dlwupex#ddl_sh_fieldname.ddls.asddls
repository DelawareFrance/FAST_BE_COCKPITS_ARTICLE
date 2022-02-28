@AbapCatalog.sqlViewName: '/DLWUPEX/V_SH_FN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cds for SH tabname'
define view /DLWUPEX/DDL_SH_FIELDNAME
  as select distinct from /dlwupex/tlink   as _head
    inner join            dd03l            as _rollname  on  _rollname.tabname   = _head.tabname
                                                         and _rollname.fieldname = _head.fieldname
    inner join            dd04t            as _fielddesc on  _fielddesc.rollname   = _rollname.rollname
                                                         and _fielddesc.ddlanguage = $session.system_language
    left outer join       /dlwupex/tview_k as _k         on  _k.viewname  = _head.viewname
                                                         and _k.tabname   = _head.tabname
                                                         and _k.fieldname = _head.fieldname
{
  key _head.viewname                 as ViewName,
  key _head.tabname                  as Tabname,
  key _head.fieldname                as FieldName,
      _fielddesc.ddtext              as FieldDesc,
      _k.display_only                as OnlyDisplay,
      cast( case _k.var_def
            when 'X' then 'X'
            else ''
          end  as abap.char( 1 )   ) as KeyField

}
//where
//  _k.var_def = 'X'
