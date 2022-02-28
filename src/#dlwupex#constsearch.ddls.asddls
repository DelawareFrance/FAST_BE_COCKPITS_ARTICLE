@AbapCatalog.sqlViewName: '/DLWUPEX/CONSTF4'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Update'
@OData.publish: true
define view /DLWUPEX/CONSTSEARCH  as select from dd07t

{
//dd07t 
key domname, 
key ddlanguage, 
key as4local, 
key valpos, 
key as4vers, 
ddtext, 
domval_ld, 
domval_hd, 
domvalue_l

}
where dd07t.domname = '/DLWUPEX/DMODSTATUS'
//and dd07t.ddlanguage = $session.system_language
