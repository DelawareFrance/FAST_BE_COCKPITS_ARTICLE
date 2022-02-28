@AbapCatalog.sqlViewName: '/DLWUPEX/CARAF4'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Update'
@OData.publish: true
define view /DLWUPEX/CARASEARCH  
with parameters 
@Consumption.hidden: true 
@Environment.systemField: #SYSTEM_DATE 
P_KeyDate : syst_datum ,
@Consumption.hidden: true 
@Environment.systemField: #SYSTEM_LANGUAGE 
P_Language : syst_langu 
as select from /DLWUPEX/CARA ( P_KeyDate : :P_KeyDate, P_Language : :P_Language)

{
///DLWUPEX/CARA
key Material,  
ClassType, 
ClassificationStatus, 
ProductConfiguration, 
ZZ_BM_TYPETARIF, 
ZZ_BM_TYPETARIF_Desc, 
ZZ_BM_UMCLIENT, 
ZZ_BM_UMCLIENT_Desc, 
ZZ_BM_INTERFACE, 
ZZ_BM_INTERFACE_Desc, 
ZZ_BM_LICENCE, 
ZZ_BM_LICENCE_Desc


}
