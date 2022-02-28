@AbapCatalog.sqlViewName: '/DLWUPEX/V_VARTH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view get header variant data'
define view /DLWUPEX/DDL_VARIANT_H
  as select from /dlwupex/tvar_tx
{
  key variant            as Variant,
      description        as Description,
      etag               as ChangeDateTime,
      ''                 as WorkArea,
      upper(description) as DescUpper

}
where
  spras = $session.system_language
