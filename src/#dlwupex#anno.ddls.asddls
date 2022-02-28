@AbapCatalog.sqlViewName: '/DLWUPEX/ANO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'test'
define view /DLWUPEX/ANNO as select from mara {
  //mara 
  key mandt, 
  key matnr, 
  ersda, 
  ernam, 
  laeda, 
  aenam, 
  vpsta, 
  pstat, 
  lvorm, 
  fashgrd  
}



//@AbapCatalog.sqlViewName: '/DLWUPEX/ANO'
//@AccessControl.authorizationCheck:#NOT_REQUIRED
//@EndUserText.label: 'ZTESTEXCAGGR'
//@AbapCatalog.compiler.compareFilter: true
//@VDM.viewType: #COMPOSITE
//@Analytics.dataCategory: #CUBE
//@OData.publish: true
//@Metadata.allowExtensions: true
////@Analytics.query: true
////@VDM.viewType: #CONSUMPTION
//
////@Search.searchable: true
//define view /DLWUPEX/ANNO /*as select from ZC_LRDETAILRDV 
//define view ZQ_LPPALETTES_JOIN  */ 
// as select from ZTST_PAL_CUMULSTOCK 
//
//       association [1..1] to I_Plant as _PLANT on $projection.Site = _PLANT.Plant
//
//       association [1..*] to ZQ_OPPALETTES as _ObjectPage_palettes
//
//                                      on $projection.Site           = _ObjectPage_palettes.site
//
//                                      and $projection.Supplier      = _ObjectPage_palettes.lifnr
//
//                                      and $projection.HUType        = _ObjectPage_palettes.letyp
//
//                                      and $projection.CalendarDate  = _ObjectPage_palettes.Datestart
//
//{
//
//     key HUType,
//@Consumption.filter: { selectionType: #SINGLE,mandatory: true}
//@Search: { defaultSearchElement: true, ranking : #HIGH, fuzzinessThreshold: 0.8 }
//     @ObjectModel.foreignKey.association: '_PLANT'
//
//
//     key Site,
//
//     key Supplier,
//
//     CalendarDate,
//
////    StockInitial,
//
////    Received,
//
////    Returned,
//
//    
//
//    @Aggregation.default:#MIN
//
//    //@Aggregation.exception: #FIRST
//
//    //@Aggregation.referenceElement: 'Datestart'
//
//    StockStartofDay,
//
//    @Aggregation.default:#MAX
//
//    //@Aggregation.exception: #LAST
//
//    //@Aggregation.referenceElement: 'Datestart'
//
//    StockEndofDay,
//
//    /* Associations */
//
//    _PLANT,
//
//    _ObjectPage_palettes
//
//}                                      


 
    

 