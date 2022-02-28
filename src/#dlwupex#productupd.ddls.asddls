@AbapCatalog.sqlViewName: '/DLWUPEX/PRODUPD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Update'
@OData.publish: true
define view /DLWUPEX/PRDUPD as select from I_Product as Product
left outer join marc    as _Plant                 on  Product = _Plant.matnr

//left outer join  I_Plant as _PlantData on _Plant.werks = _PlantData.Plant
left outer join  t001w as _PlantData on _Plant.werks = _PlantData.werks
//inner join t001k as _ValuationAreaData on _Plant.werks = _ValuationAreaData.bwkey
left outer join mvke as _SalesDelivery on Product = _SalesDelivery.matnr
                                  and _PlantData.vkorg = _SalesDelivery.vkorg
                                  and _PlantData.vtweg = _SalesDelivery.vtweg



//inner join mvke    as _SalesDelivery         on  Product = _SalesDelivery.matnr
left outer join M_V_inforecord   as _Infrec   on  Product =    _Infrec.matnr
//                                         and _Infrec .relif = 'X'
//                                         and _Infrec .loekz_a = ''
//                                         and _Infrec.loekz_e  = ''
//  association [0..*] to marc          as _Plant                 on  $projection.Product = _Plant.matnr
//  association [0..*] to mvke  as _SalesDelivery         on  $projection.Product = _SalesDelivery.matnr
//  association [0..*] to M_V_inforecord   as _Infrec   on  $projection.Product =    _Infrec.matnr
{

//Product 
//key Product, 
key cast( Product.Product as matnr  ) as Product,
_Plant.werks as Plant, 
ProductExternalID,  
//ProductType, 
cast( ProductType as mtart  ) as ProductType,
CreationDate, 
CreatedByUser, 
LastChangeDate, 
LastChangedByUser, 
IsMarkedForDeletion, 
CrossPlantStatus, 
CrossPlantStatusValidityDate, 
ProductOldID, 
GrossWeight, 
PurchaseOrderQuantityUnit, 
SourceOfSupply, 
WeightUnit, 
CountryOfOrigin, 
CompetitorID, 
//ProductGroup, 
cast( ProductGroup as matkl  ) as ProductGroup,
BaseUnit, 
ItemCategoryGroup, 
NetWeight, 
ProductHierarchy, 
Division, 
VarblPurOrdUnitIsActive, 
VolumeUnit, 
MaterialVolume, 
SalesStatus, 
TransportationGroup, 
SalesStatusValidityDate, 
AuthorizationGroup, 
ANPCode, 
//ProductCategory, 
Brand, 
ProcurementRule, 
ValidityStartDate, 
LowLevelCode, 
ProdNoInGenProdInPrepackProd, 
SerialIdentifierAssgmtProfile, 
SizeOrDimensionText, 
IndustryStandardName, 
ProductStandardID, 
InternationalArticleNumberCat, 
ProductIsConfigurable, 
IsBatchManagementRequired, 
HasEmptiesBOM, 
ExternalProductGroup, 
CrossPlantConfigurableProduct, 
SerialNoExplicitnessLevel, 
ProductManufacturerNumber, 
ManufacturerNumber, 
ManufacturerPartProfile, 
QltyMgmtInProcmtIsActive, 
IsApprovedBatchRecordReqd, 
HandlingIndicator, 
WarehouseProductGroup, 
WarehouseStorageCondition, 
StandardHandlingUnitType, 
SerialNumberProfile, 
AdjustmentProfile, 
PreferredUnitOfMeasure, 
IsPilferable, 
IsRelevantForHzdsSubstances, 
QuarantinePeriod, 
TimeUnitForQuarantinePeriod, 
QualityInspectionGroup, 
HandlingUnitType, 
HasVariableTareWeight, 
MaximumPackagingLength, 
MaximumPackagingWidth, 
MaximumPackagingHeight, 
MaximumCapacity, 
OvercapacityTolerance, 
UnitForMaxPackagingDimensions, 
BaseUnitSpecificProductLength, 
BaseUnitSpecificProductWidth, 
BaseUnitSpecificProductHeight, 
ProductMeasurementUnit, 
ProductValidStartDate, 
//ArticleCategory, 
cast( ArticleCategory as attyp  ) as ArticleCategory,
ContentUnit, 
NetContent, 
ComparisonPriceQuantity, 
GrossContent, 
ProductValidEndDate, 
AssortmentListType, 
HasTextilePartsWthAnimalOrigin, 
ProductSeasonUsageCategory, 
IndustrySector, 
ChangeNumber, 
MaterialRevisionLevel, 
IsActiveEntity, 
LastChangeDateTime, 
LastChangeTime, 
DangerousGoodsIndProfile, 
ProductUUID, 
ProdSupChnMgmtUUID22, 
ProductDocumentChangeNumber, 
ProductDocumentPageCount, 
ProductDocumentPageNumber, 
OwnInventoryManagedProduct, 
DocumentIsCreatedByCAD, 
ProductionOrInspectionMemoTxt, 
ProductionMemoPageFormat, 
GlobalTradeItemNumberVariant, 
ProductIsHighlyViscous, 
TransportIsInBulk, 
ProdAllocDetnProcedure, 
ProdEffctyParamValsAreAssigned, 
ProdIsEnvironmentallyRelevant, 
LaboratoryOrDesignOffice, 
PackagingMaterialGroup, 
ProductIsLocked, 
DiscountInKindEligibility, 
SmartFormName, 
PackingReferenceProduct, 
BasicMaterial, 
ProductDocumentNumber, 
ProductDocumentVersion, 
ProductDocumentType, 
ProductDocumentPageFormat, 
ProductConfiguration, 
SegmentationStrategy, 
SegmentationIsRelevant, 
LogisticalProductCategory, 
SalesProduct, 
/* Associations */ 
//Product 
_BaseUnitOfMeasure, 
_BaseUnitOfMeasureText, 
_Brand, 
_ContentUnit, 
_CreatedByUser, 
_CrossPlantConfigurableProduct, 
_Division, 
_DivisionText, 
_ExternalProductGroup, 
_ExtProdGrpText, 
_IntArticleNumberText, 
_InternationalArticleNumberCat, 
_LastChangedByUser, 
_MaterialText, 
//Product._MDProductHierarchyNode , 
//_ProductCategory, 
//_ProductCategoryText, 
//_ProductGroup, 
//_ProductGroupText, 
_ProductHierarchy, 
_ProductHierarchyText, 
_ProductMeasurementUnit, 
//_ProductProcurement, 
//_ProductRetail, 
//_ProductSales, 
_ProductStatus, 
_ProductStatusText, 
//_ProductType  , 
//_ProductTypeName , 
_QuantityUnitText, 
_QuantityUnitValueHelp, 
//_Text, 
_TimeUnitForQuarantinePeriod, 
_TimeUnitQuarantinePeriodText, 
_UnitForMaxPackaging, 
_UnitForMaxPackagingText, 
_WeightUnitText, 
_WeightUnitValueHelp,
_Text.ProductName as PRODUCTDESCRIPTION,

//_SalesDelivery.ProductSalesOrg as SALEORG,
//_SalesDelivery.ProductDistributionChnl as DCHANEL,
_SalesDelivery.vkorg as SALEORG,
_SalesDelivery.vtweg as DCHANEL,
//_SalesDelivery.mandt, 
//_SalesDelivery.matnr, 
//_SalesDelivery.vkorg, 
//_SalesDelivery.vtweg, 
_SalesDelivery.lvorm, 
_SalesDelivery.versg, 
_SalesDelivery.bonus, 
_SalesDelivery.provg, 
_SalesDelivery.sktof, 
_SalesDelivery.vmsta, 
_SalesDelivery.vmstd, 
_SalesDelivery.aumng, 
_SalesDelivery.lfmng, 
_SalesDelivery.efmng, 
_SalesDelivery.scmng, 
_SalesDelivery.schme, 
_SalesDelivery.vrkme, 
_SalesDelivery.mtpos, 
_SalesDelivery.dwerk, 
//_SalesDelivery.prodh , 
cast( _SalesDelivery.prodh as prodh_d  ) as prodh,
_SalesDelivery.pmatn, 
_SalesDelivery.kondm, 
_SalesDelivery.ktgrm, 
_SalesDelivery.mvgr1, 
_SalesDelivery.mvgr2, 
_SalesDelivery.mvgr3, 
_SalesDelivery.mvgr4, 
_SalesDelivery.mvgr5, 
_SalesDelivery.sstuf, 
_SalesDelivery.pflks, 
_SalesDelivery.lstfl, 
_SalesDelivery.lstvz, 
_SalesDelivery.lstak, 
_SalesDelivery.ldvfl, 
_SalesDelivery.ldbfl, 
_SalesDelivery.ldvzl, 
_SalesDelivery.ldbzl, 
_SalesDelivery.vdvfl, 
_SalesDelivery.vdbfl, 
_SalesDelivery.vdvzl, 
_SalesDelivery.vdbzl, 
_SalesDelivery.prat1, 
_SalesDelivery.prat2, 
_SalesDelivery.prat3, 
_SalesDelivery.prat4, 
_SalesDelivery.prat5, 
_SalesDelivery.prat6, 
_SalesDelivery.prat7, 
_SalesDelivery.prat8, 
_SalesDelivery.prat9, 
_SalesDelivery.prata, 
_SalesDelivery.rdprf, 
_SalesDelivery.megru, 
_SalesDelivery.lfmax, 
_SalesDelivery.rjart, 
_SalesDelivery.pbind, 
_SalesDelivery.vavme, 
_SalesDelivery.matkc, 
_SalesDelivery.pvmso, 
_SalesDelivery.dummy_sald_incl_eew_ps, 
_SalesDelivery.zz1_dangerosite_sal, 
_SalesDelivery.zz1_dateavs_sal, 
_SalesDelivery.zz1_datemarche_sal, 
_SalesDelivery.zz1_echantillon_sal, 
_SalesDelivery.zz1_empilable_sal, 
_SalesDelivery.zz1_epaisseur_sal, 
_SalesDelivery.zz1_fragile_sal, 
_SalesDelivery.zz1_topecomm_sal, 
_SalesDelivery.zz1_psycho_sal, 
_SalesDelivery.zz1_classement_sal, 
_SalesDelivery.zz1_remiselog_sal, 
_SalesDelivery.zz1_retournable_sal, 
_SalesDelivery.zz1_rfa_sal, 
_SalesDelivery.zz1_superposable_sal, 
_SalesDelivery.zz1_uvecom_sal, 

_SalesDelivery.zz1_top1prix_sal, 
_SalesDelivery.zz1_top2080_sal, 
_SalesDelivery.zz1_topretfour_sal, 

_SalesDelivery./bev1/emlgrp, 
_SalesDelivery./bev1/emdrckspl, 
_SalesDelivery./bev1/rpbezme, 
_SalesDelivery./bev1/rpsns, 
_SalesDelivery./bev1/rpsfa, 
_SalesDelivery./bev1/rpski, 
_SalesDelivery./bev1/rpsco, 
_SalesDelivery./bev1/rpsso, 
_SalesDelivery.nf_flag, 
_SalesDelivery.plgtp,
//_Plant.werks as Plant,
_Plant.matnr as PProduct, 
//_Plant.Plant, 
//_Plant.ProductForEdit, 
//_Plant.PlantForEdit, 
//_Plant.mmsta as ProfileCode, 
//_Plant.ProfileValidityStartDate, 
//_Plant.FiscalYearVariant, 
//_Plant.PeriodType, 
//_Plant.ProfitCenter, 
//_Plant.IsMarkedForDeletion as p, 
//_Plant.ConfigurableProduct, 
_Plant.eprio as StockDeterminationGroup,
//_Plant.IsBatchManagementRequired, 
//_Plant.SerialNumberProfile, 
_Plant.xmcng as IsNegativeStockAllowed,
_Plant.xchar as IsInternalBatchManaged,
_Plant.indus as ProductCFOPCategory, 
//_Plant.ControllingArea, 
//_Plant.SalesOrganization, 
//_Plant.DistributionChannel, 
//_Plant.PlantCategory, 
//_Plant.ReferenceDistributionCenter, 
//_Plant.ReferenceStore, 
//_Plant.IsReferenceDistributionCenter, 
//_Plant.IsReferenceStore, 
//_Plant.ConfigurationSideEffect, 
//_Plant.GoodsIssueUnit, 
_Plant.fprfm                                        as DistrCntrDistributionProfile,
//_Plant.ZZ1_ZCIRCUIT_ST_PLT, 
//_Plant.ZZ1_ZUO_SORTIE_PLT, 
//_Plant.ZZ1_ZCIRCUIT_DC_PLT, 
//_Plant.ZZ1_ZREAPPRO_ST_PLT, 
//_Plant.ZZ1_ZPALETTE_PLT, 
//_Plant.ZZ1_ZUO_ENTREE_PLT, 
//_Plant.ZZ1_ZSTOCKAGE_PLT, 
//_Plant._AdvancedPlanning, 


   _Plant.mmsta                                        as ProfileCode,
   _Plant.mmstd                                        as ProfileValidityStartDate,
   _Plant.mtvfp                                        as AvailabilityCheckType,
   _Plant.periv                                        as FiscalYearVariant,
   _Plant.perkz                                        as PeriodType,
   _Plant.prctr                                        as ProfitCenter,
   cast (_Plant.stawn as stawn)                        as Commodity,
   _Plant.webaz                                        as GoodsReceiptDuration,
   _Plant.pstat                                        as MaintenanceStatusName,
//         _Plant.lvorm                                        as IsMarkedForDeletion,
    _Plant.dismm                                        as MRPType,
    _Plant.dispo                                        as MRPResponsible,
    _Plant.maabc                                        as ABCIndicator,
    _Plant.bstmi                                        as MinimumLotSizeQuantity,
    _Plant.bstma                                        as MaximumLotSizeQuantity,
    _Plant.bstfe                                        as FixedLotSizeQuantity,
    _Plant.steuc                                        as ConsumptionTaxCtrlCode,
    _Plant.kzkup                                        as IsCoProduct,
    _Plant.zz1_zcircuit_st_plt, 
    _Plant.zz1_zuo_sortie_plt, 
    _Plant.zz1_zcircuit_dc_plt, 
    _Plant.zz1_zreappro_st_plt, 
    _Plant.zz1_zpalette_plt, 
    _Plant.zz1_zuo_entree_plt, 
    _Plant.zz1_zstockage_plt, 
    _Plant.plifz, 
    _Plant.xchpf, 
    _Plant.mtvfp, 
    _Plant.bwscl, 
    _Plant.kautb, 
    _Plant.rdprf as Rndpr, 
    _Plant.mrppp,
    _Plant.lgfsb,

//_Plant._ConfigurableProduct, 
//_Plant._ConfigurableProductName, 
//_Plant._FiscalYearVariant, 
//_Plant._FiscalYearVariantDescription, 
//_Plant._GoodsIssueUnit, 
//_Plant._GoodsMovementQuantity, 
//_Plant._MaterialLotSizingProcedure, 
//_Plant._MRPAreaData, 
//_Plant._PlantProcurement, 
//_Plant._PlantQualityMgmt, 
//_Plant._PlantSales, 
//_Plant._PlantStorage, 
//_Plant._PlantText, 
//_Plant._ProdPlantInternationalTrade, 
//_Plant._ProdPlantPurchaseTax, 
//_Plant._ProdPlntFcstParameters, 
//_Plant._Product, 
//_Plant._ProductPlantCosting, 
//_Plant._ProductPlantForecast, 
//_Plant._ProductReplnmtRecipient, 
//_Plant._ProductStatus as pproductstatus, 
////_Plant._ProductStatusText, 
//_Plant._StorageLocation, 
//_Plant._UnitOfMeasureText, 
//_Plant._ZZ1_ZCIRCUIT_DC_PLT, 
//_Plant._ZZ1_ZCIRCUIT_ST_PLT, 
//_Plant._ZZ1_ZPALETTE_PLT, 
//_Plant._ZZ1_ZSTOCKAGE_PLT, 
//_Plant._ZZ1_ZUO_ENTREE_PLT, 
//_Plant._ZZ1_ZUO_SORTIE_PLT,
_Infrec.infnr, 
_Infrec.ekorg, 
_Infrec.esokz, 
_Infrec.werks, 
_Infrec.lifnr, 
_Infrec.name1, 
_Infrec.matnr, 
_Infrec.maktx, 
_Infrec.ekotx, 
_Infrec.name1_p, 
_Infrec.entitystate, 
_Infrec.wgbez, 
_Infrec.matkl, 
_Infrec.loekz_a, 
_Infrec.txz01, 
_Infrec.meins, 
_Infrec.umrez, 
_Infrec.umren, 
_Infrec.idnlf, 
_Infrec.verkf, 
_Infrec.telf1, 
_Infrec.lmein, 
_Infrec.wglif, 
_Infrec.kolif, 
_Infrec.lifab, 
_Infrec.lifbi, 
_Infrec.vabme, 
_Infrec.relif, 
_Infrec.ernam, 
_Infrec.loekz_e, 
_Infrec.ekgrp, 
_Infrec.waers, 
_Infrec.minbm, 
_Infrec.norbm, 
_Infrec.aplfz, 
_Infrec.uebto, 
_Infrec.untto, 
_Infrec.uebtk, 
_Infrec.ebeln, 
_Infrec.ebelp, 
_Infrec.netpr, 
_Infrec.peinh, 
_Infrec.bprme, 
_Infrec.prdat, 
_Infrec.bpumz, 
_Infrec.bpumn, 
_Infrec.webre, 
_Infrec.mwskz, 
_Infrec.inco1, 
_Infrec.inco2, 
_Infrec.bstma, 
_Infrec.aut_source
 
//cast ( _Caract.material as abap.char( 30 ) )   as CaratMaterial 
//      @ObjectModel.readOnly:true
//      @ObjectModel.Hierarchy.association: '_MDProductHierarchyNode'
//  key Product.Product, //Material,
//
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.Product                                   as ProductForEdit, // offen: neuer Eintrag im Feldkatalog: Product
//
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ProductType, //MaterialType,                  // offen: neuer Eintrag im Feldkatalog:ProductType
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.CrossPlantStatus, // offen: Cross-Plant Material Status
//      //      @Semantics.systemDate.createdAt: true
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.CrossPlantStatusValidityDate, // offen: Date from which the cross-plant material status is valid
//      @Search.defaultSearchElement: true
//      @Search.fuzzinessThreshold: 0.8
//      @ObjectModel.readOnly: true
//      @Semantics.systemDate.createdAt: true
//      Product.CreationDate, //CreationDate,
//      @Search.defaultSearchElement: true
//      @Search.fuzzinessThreshold: 0.8
//      @ObjectModel.readOnly: true
//      @Semantics.user.createdBy: true
//      Product.CreatedByUser, //CreatedByUser,
//      @Search.defaultSearchElement: true
//      @Search.fuzzinessThreshold: 0.8
//      @ObjectModel.readOnly: true
//      @Semantics.systemDate.lastChangedAt: true
//      Product.LastChangeDate, //LastChangeDate, // offen: neuer Eintrag im Feldkatalog
//      @Semantics.systemTime.lastChangedAt: true
//      Product.LastChangeTime,
//      @Semantics.systemDateTime.lastChangedAt: true
//      Product.LastChangeDateTime,
//      @Search.defaultSearchElement: true
//      @Search.fuzzinessThreshold: 0.8
//      @ObjectModel.readOnly: true
//      @Semantics.user.lastChangedBy: true
//      Product.LastChangedByUser, //LastChangedByUser,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.IsMarkedForDeletion, //MaterialIsMarkedForDeletion, //no gfn availabe in excel
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ProductOldID, //MaterialOldID,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.GrossWeight, //MaterialGrossWeight,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.WeightUnit, //MaterialWeightUnit,  //erro
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.NetWeight, //MaterialNetWeight,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      //changes as part of incident 1770542072. Country of orgin is displayed for retail,but here it was referring from I_product and not I_productretail.
//      Product._ProductRetail.CountryOfOrigin, //CountryOfOrigin,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.CompetitorID, //Customer,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ProductGroup, //MaterialGroup,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//
//      Product.BaseUnit, //MaterialBaseUnit,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ItemCategoryGroup,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ProductHierarchy, //ProductHierarchy,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.Division, //Division,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.VolumeUnit, ///error
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      //        @Semantics.quantity.unitOfMeasure: 'Voleh'
//      //        @DefaultAggregation: #NONE
//      Product.MaterialVolume,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ANPCode,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.Brand,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ValidityStartDate,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ProdNoInGenProdInPrepackProd,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.SizeOrDimensionText,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.IndustryStandardName,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ProductStandardID,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.InternationalArticleNumberCat,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ProductIsConfigurable,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.IsBatchManagementRequired,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ExternalProductGroup,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.CrossPlantConfigurableProduct,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.SerialNoExplicitnessLevel,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ProductManufacturerNumber,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ManufacturerNumber, //pstat changes
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ManufacturerPartProfile,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ChangeNumber,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.MaterialRevisionLevel,
//
//      //EWM fields------------------------
//      //WM execution
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.HandlingIndicator,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.WarehouseProductGroup,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.WarehouseStorageCondition,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.StandardHandlingUnitType,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.SerialNumberProfile,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.AdjustmentProfile,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.IsPilferable,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.IsRelevantForHzdsSubstances,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.QuarantinePeriod,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.TimeUnitForQuarantinePeriod,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.QualityInspectionGroup,
//
//      //WM packaging
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.HandlingUnitType,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.HasVariableTareWeight,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.MaximumPackagingLength,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.MaximumPackagingWidth,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.MaximumPackagingHeight,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.MaximumCapacity,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.OvercapacityTolerance,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.UnitForMaxPackagingDimensions,
//
//      //      Retail Fields
//      Product.BaseUnitSpecificProductLength,
//      Product.BaseUnitSpecificProductWidth,
//      Product.BaseUnitSpecificProductHeight,
//      Product.ProductMeasurementUnit,
//      Product.ArticleCategory,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ContentUnit,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.NetContent,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ComparisonPriceQuantity,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.GrossContent,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.ProductValidEndDate,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.AssortmentListType,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.HasTextilePartsWthAnimalOrigin,
//      Product.ProductSeasonUsageCategory,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product._ProductRetail.ServiceAgreement           as ServiceAgreement,
//      Product._ProductRetail.ConsumptionValueCategory   as ConsumptionValueCategory,
//      Product._ProductRetail.GoodsIssueUnit             as GoodsIssueUnit,
//      Product._ProductRetail.RegionOfOrigin             as RegionOfOrigin,
//      Product._ProductRetail.AssortmentGrade            as AssortmentGrade,
//      Product._ProductRetail.ProdExtAssortmentPriority  as ProdExtAssortmentPriority,
//      Product._ProductRetail.SalesUnit                  as SalesUnit,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product._ProductRetail.ValuationClass             as ValuationClass,
//
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product._ProductRetail.ValuationMargin            as ValuationMargin,
//
//      Product._ProductRetail.DistrCntrSaleEndDate       as DistrCntrSaleEndDate,
//
//      cast('' as vchclf_side_effect_data)               as ClassificationSideEffect,
//
//      cast('' as vchclf_side_effect_data)               as ConfigurationSideEffect,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      cast('' as referenceproduct)                      as ReferenceProduct,
//
////      _DescriptionText.ProductDescription,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.AuthorizationGroup,
//      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
//      Product.HasEmptiesBOM,
//
//      Product._BaseUnitOfMeasure,

//      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
//      _Description,
//      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
//      _Plant,
//      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
//      _Valuation,
//      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
//      _ProductSales,
//      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
//      _SalesDelivery,
//      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
//      _UnitOfMeasure,
//      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
//      _ProductProcurement,
//      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
//      _ProductStorage,
//      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
//      _ProductSalesTax,
//      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
//      _ProductQualityMgmt,

//      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
//      _ProductBasicText,
//      _ProductInspectionText,
//      _ProductPurchaseText,
//      _ProductInternalNote,
////      _DistributionCenter,
//      _Store,
//      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
//      _SupplyChainManagement,
//      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
//      _ProductVariant,
//      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
//      _ProductSeasons,
//      _DescriptionText,
//      _ConfProductVariant,
//      _MDProductHierarchyNode,
//      _CreatedByUser,
//      _LastChangedByUser,
//      _ProductTypeName,
//      _ProductType,
//      _ContentUnit,
//      _ProductMeasurementUnit,
//      _ExtProdGrpText,
//      _ExternalProductGroup,
//      _Division,
//      _DivisionText,
//      _ProductHierarchy,
//      _ProductHierarchyText,
//      _WeightUnitValueHelp,
//      _WeightUnitText,
//      _QuantityUnitValueHelp,
//      _QuantityUnitText,
//      _ProductStatus,
//      _ProductStatusText,
//      _UnitForMaxPackaging,
//      _UnitForMaxPackagingText,
//      _TimeUnitForQuarantinePeriod,
////      _TimeUnitQuarantinePeriodText,
//      _ProductGroup,
//      _ProductGroupText,
//      _InternationalArticleNumberCat,
//      _IntArticleNumberText,
//      _CrossPlantConfigurableProduct,
//      _MaterialText,
////      _ProductRetail._GoodsIssueUnit                    as _GoodsIssueUnit,
////      _ProductRetail._GoodsIssueText                    as _GoodsIssueText,
////      _ProductRetail._ConsumptionValueCategory          as _ConsumptionValueCategory,
////      _ProductRetail._ConsumptionValueCategoryText      as _ConsumptionValueCategoryText,
//      _BaseUnitOfMeasureText

//      @ObjectModel.association.type:  #TO_COMPOSITION_CHILD
//      _Warehouse,
//      @ObjectModel.association.draft.enabled: true
//      @ObjectModel.association.reverseAssociation: '_ProductWD'
//      @ObjectModel.association.draft.fieldNamePrefix:'Product'
//      _ProductBOM,

//      @ObjectModel.association.type:  #TO_COMPOSITION_CHILD
//      _ProductReplenishment,
//      _ProductRetail._SalesUnit                         as _SalesUnit,
//      _ProductRetail._SalesUnitText                     as _SalesUnitText



}
