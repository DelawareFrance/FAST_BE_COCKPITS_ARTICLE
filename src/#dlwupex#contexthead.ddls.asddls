@AbapCatalog.sqlViewName: '/DLWUPEX/CONTH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Update'
@OData.publish: true
define view /DLWUPEX/CONTEXTHEAD  as select from /dlwupex/tcont_h 

  association [0..1] to /dlwupex/tvar_tx  as _Text   on  $projection.variant_gestion  = _Text.variant
{
///DLWUPEX/TCONT_H 
key mandt, 
key id, 
work_area, 
context, 
statut, 
date_creation, 
user_creation, 
date_treatment, 
user_treatment, 
variant_gestion,
_Text.description
}

where _Text.spras = $session.system_language
