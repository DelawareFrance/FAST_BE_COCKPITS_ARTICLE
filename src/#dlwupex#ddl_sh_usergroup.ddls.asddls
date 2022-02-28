@AbapCatalog.sqlViewName: '/DLWUPEX/V_SH_UG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cds for SH usergroup'
define view /DLWUPEX/DDL_SH_USERGROUP
  as select from /dlwupex/tusergr
{

  key group_user as UserGroup,
      username   as UserName

}
