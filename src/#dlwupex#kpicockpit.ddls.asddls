@AbapCatalog.sqlViewName: '/DLWUPEX/KPICPIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vérifier les provisions AS'

@VDM.viewType: #CONSUMPTION
//@Analytics.query: true
@Analytics: {dataExtraction.enabled: true, query: true }
// need to go to FIORI system and run the transaction /IWFND/MAINT_SERVICE to activate the service
@OData.publish: true
define view /DLWUPEX/KPICOCKPIT as select from Z_REQIDS {
    //Z_REQIDS 
    key id, 
    key reqid, 
    status
    
}
