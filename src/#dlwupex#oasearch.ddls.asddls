@AbapCatalog.sqlViewName: '/DLWUPEX/OAF4'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Update'
@OData.publish: true
define view /DLWUPEX/OASEARCH  as select from t024e 

{
key ekorg, 
//T024E 
ekotx, 
bukrs, 
txadr, 
txkop, 
txfus, 
txgru, 
kalse, 
mkals, 
bpeff, 
bukrs_ntr
}
