@AbapCatalog.sqlViewName: '/DLWUPEX/PROF4'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Update'
@OData.publish: true
define view /DLWUPEX/PRODF4  as select from mara 
  association [0..1] to I_ProductText            as _Text                          on  $projection.matnr = _Text.Product
 
{
key matnr, 
_Text.ProductName ,
 mtart,
 matkl,
 meins
}
where _Text.Language = $session.system_language
