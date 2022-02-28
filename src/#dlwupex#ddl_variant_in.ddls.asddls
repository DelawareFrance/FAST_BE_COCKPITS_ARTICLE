@AbapCatalog.sqlViewName: '/DLWUPEX/V_VARTN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view get view variant data'
define view /DLWUPEX/DDL_VARIANT_IN
  as select from /dlwupex/tvar_in
  association [0..1] to dd07t as _desc on  _desc.domname    = '/DLWUPEX/DVIEWNAME'
                                       and _desc.ddlanguage = $session.system_language
                                       and _desc.domvalue_l = $projection.ViewName
{
  key variant                   as Variant,
  key viewname                  as ViewName,
      cast( case insert_line
            when 'Y' then 'X'
            else ''
          end  as boole_d     ) as ToInsert,
      _desc.ddtext              as ViewnameDesc

      //      insert_line
}
