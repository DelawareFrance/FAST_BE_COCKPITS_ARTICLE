@AbapCatalog.sqlViewName: '/DLWUPEX/CDSLIST'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Material list for Request ID'

define view /DLWUPEX/CDS_MLIST as select from /dlwupex/tgdata


{

  matnr,
  matkl
}
