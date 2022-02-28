@AbapCatalog.sqlViewName: '/DLWUPEX/V_SH_WA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cds for SH Work Area'
define view /DLWUPEX/DDL_SH_WORKA
  as select from /dlwupex/tbuhead
{
  key id          as WorkArea,
      description as Description

}
where
  ckp_modif = 'X'
