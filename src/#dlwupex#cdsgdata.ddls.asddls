@AbapCatalog.sqlViewName: '/DLWUPEX/CDSGDAT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View for View General Data'



define view /DLWUPEX/CDS_GDATA
  as select from    /dlwupex/tgdata
   

{

       matnr,
       matkl
}

  
