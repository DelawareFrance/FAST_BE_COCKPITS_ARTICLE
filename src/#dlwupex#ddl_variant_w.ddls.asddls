@AbapCatalog.sqlViewName: '/DLWUPEX/V_VARTW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cds view get workarea for variant'
define view /DLWUPEX/DDL_VARIANT_W
  as select from /dlwupex/tvar_h
  association [0..1] to /dlwupex/tbuhead as _desc on _desc.id = $projection.WorkArea
{
  key work_area          as WorkArea,
  key variant            as Variant,
      _desc.land1        as Country,
      _desc.description  as WorkareaDesc,
      _desc.ckp_creation as Creator,
      _desc.ckp_modif    as Change,
      etag               as ChangeDateTime

}
