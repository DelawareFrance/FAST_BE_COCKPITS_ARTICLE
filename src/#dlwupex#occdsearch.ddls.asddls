@AbapCatalog.sqlViewName: '/DLWUPEX/OCCDF4'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Update'
@OData.publish: true
define view /DLWUPEX/OCCDSEARCH  as select from tvkov

{
//TVKOV 
key vkorg, 
key vtweg, 
vtwko, 
vtwau, 
vtwku, 
vlgfi, 
vltyp, 
vlkeb
}
