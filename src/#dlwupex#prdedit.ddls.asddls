@AbapCatalog.sqlViewName: '/DLWUPEX/PREDIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
//@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@EndUserText.label: 'CDS to fill General data tab in modif cockpit'
@OData.publish: true
define view /DLWUPEX/PRDEDIT  as select from I_ProductWD
   association [0..*] to M_V_inforecord   as _Infrec   on  $projection.Product =    _Infrec.matnr
                                                      
{

 key Product, 
 ProductForEdit, 
 ProductType, 
 CrossPlantStatus, 
 CrossPlantStatusValidityDate, 
 CreationDate, 
 CreatedByUser, 
 LastChangeDate, 
 LastChangeTime, 
 LastChangeDateTime, 
 LastChangedByUser, 
// IsMarkedForDeletion, 
 ProductOldID, 
 GrossWeight, 
 WeightUnit, 
 NetWeight, 
 CountryOfOrigin, 
 CompetitorID, 
 ProductGroup, 
 BaseUnit, 
 ItemCategoryGroup, 
 ProductHierarchy, 
 Division, 
 VolumeUnit, 
 MaterialVolume, 
 ANPCode, 
 Brand, 
 ValidityStartDate, 
 ProdNoInGenProdInPrepackProd, 
 SizeOrDimensionText, 
 IndustryStandardName, 
 ProductStandardID, 
 InternationalArticleNumberCat, 
 ProductIsConfigurable, 
 IsBatchManagementRequired, 
 ExternalProductGroup, 
 CrossPlantConfigurableProduct, 
 SerialNoExplicitnessLevel, 
 ProductManufacturerNumber, 
 ManufacturerNumber, 
 ManufacturerPartProfile, 
 ChangeNumber, 
 MaterialRevisionLevel, 
 HandlingIndicator, 
 WarehouseProductGroup, 
 WarehouseStorageCondition, 
 StandardHandlingUnitType, 
// SerialNumberProfile, 
 AdjustmentProfile, 
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
 ArticleCategory, 
 ContentUnit, 
 NetContent, 
 ComparisonPriceQuantity, 
 GrossContent, 
 ProductValidEndDate, 
 AssortmentListType, 
 HasTextilePartsWthAnimalOrigin, 
 ProductSeasonUsageCategory, 
 ServiceAgreement, 
 ConsumptionValueCategory, 
 GoodsIssueUnit as MGoodsIssueUnit, 
 RegionOfOrigin, 
 AssortmentGrade, 
 ProdExtAssortmentPriority, 
 SalesUnit, 
 ValuationClass, 
 ValuationMargin, 
 DistrCntrSaleEndDate, 
 ClassificationSideEffect, 
// ConfigurationSideEffect, 
 ReferenceProduct, 
 ProductDescription, 
 AuthorizationGroup, 
 HasEmptiesBOM, 

 /* Associations */ 
 //I_ProductWD 
 _BaseUnitOfMeasure, 
 _BaseUnitOfMeasureText, 
 _ConfProductVariant, 
 _ConsumptionValueCategory, 
 _ConsumptionValueCategoryText, 
 _ContentUnit, 
 _CreatedByUser, 
 _CrossPlantConfigurableProduct, 
 _Description, 
 _DescriptionText, 
 _DistributionCenter, 
 _Division, 
 _DivisionText, 
 _ExternalProductGroup, 
 _ExtProdGrpText, 
 _GoodsIssueText, 
// _GoodsIssueUnit, 
 _IntArticleNumberText, 
 _InternationalArticleNumberCat, 
 _LastChangedByUser, 
 _MaterialText, 
 _MDProductHierarchyNode, 
 _Plant, 
 _ProductBasicText, 
 _ProductBOM, 
 _ProductGroup, 
 _ProductGroupText, 
 _ProductHierarchy, 
 _ProductHierarchyText, 
 _ProductInspectionText, 
 _ProductInternalNote, 
 _ProductMeasurementUnit, 
 _ProductProcurement, 
 _ProductPurchaseText, 
 _ProductQualityMgmt, 
 _ProductReplenishment, 
 _ProductSales, 
 _ProductSalesTax, 
 _ProductSeasons, 
 _ProductStatus, 
 _ProductStatusText, 
 _ProductStorage, 
 _ProductType, 
 _ProductTypeName, 
 _ProductVariant, 
 _QuantityUnitText, 
 _QuantityUnitValueHelp, 
 _SalesDelivery, 
 _SalesUnit, 
 _SalesUnitText, 
 _Store, 
 _SupplyChainManagement, 
 _TimeUnitForQuarantinePeriod, 
 _TimeUnitQuarantinePeriodText, 
 _UnitForMaxPackaging, 
 _UnitForMaxPackagingText, 
 _UnitOfMeasure, 
 _Valuation, 
 _Warehouse, 
 _WeightUnitText, 
 _WeightUnitValueHelp,
 _SalesDelivery.ProductSalesOrg as SaleOrg,
  _SalesDelivery.ProductDistributionChnl as DChanel,
  _SalesDelivery.Product as SProduct, 
//  _SalesDelivery.ProductSalesOrg, 
//  _SalesDelivery.ProductDistributionChnl, 
//  _SalesDelivery.ProductForEdit, 
  _SalesDelivery.ProductSalesOrgForEdit, 
  _SalesDelivery.ProductDistributionChnlForEdit, 
  _SalesDelivery.MinimumOrderQuantity, 
  _SalesDelivery.SupplyingPlant, 
  _SalesDelivery.PriceSpecificationProductGroup, 
  _SalesDelivery.AccountDetnProductGroup, 
  _SalesDelivery.DeliveryNoteProcMinDelivQty, 
//  _SalesDelivery.ItemCategoryGroup, 
  _SalesDelivery.DeliveryQuantityUnit, 
  _SalesDelivery.DeliveryQuantity, 
  _SalesDelivery.ProductSalesStatus, 
  _SalesDelivery.ProductSalesStatusValidityDate, 
  _SalesDelivery.SalesMeasureUnit, 
  _SalesDelivery.IsMarkedForDeletion, 
//  _SalesDelivery.ProductHierarchy, 
  _SalesDelivery.FirstSalesSpecProductGroup, 
  _SalesDelivery.SecondSalesSpecProductGroup, 
  _SalesDelivery.ThirdSalesSpecProductGroup, 
  _SalesDelivery.FourthSalesSpecProductGroup, 
  _SalesDelivery.FifthSalesSpecProductGroup, 
  _SalesDelivery.MinimumMakeToOrderOrderQty, 
  _SalesDelivery.LogisticsStatisticsGroup, 
  _SalesDelivery.VolumeRebateGroup, 
  _SalesDelivery.ProductCommissionGroup, 
  _SalesDelivery.CashDiscountIsDeductible, 
  _SalesDelivery.PricingReferenceProduct, 
//  _SalesDelivery.AssortmentGrade, 
  _SalesDelivery.StoreListingProcedure, 
  _SalesDelivery.DistrCntrListingProcedure, 
  _SalesDelivery.StoreListingStartDate, 
//  _SalesDelivery.StoreListingEndDate, 
  _SalesDelivery.DistrCntrListingStartDate, 
//  _SalesDelivery.DistrCntrListingEndDate, 
  _SalesDelivery.StoreSaleStartDate, 
  _SalesDelivery.StoreSaleEndDate, 
  _SalesDelivery.DistrCntrSaleStartDate, 
//  _SalesDelivery.DistrCntrSaleEndDate, 
  _SalesDelivery.RoundingProfile, 
  _SalesDelivery.ProductUnitGroup, 
  _SalesDelivery.MaxDeliveryQtyStoreOrder, 
  _SalesDelivery.PriceFixingCategory, 
  _SalesDelivery.VariableSalesUnitIsNotAllowed, 
  _SalesDelivery.CompetitionPressureCategory, 
//  _SalesDelivery.ProdExtAssortmentPriority, 
//  _SalesDelivery._ProdExtAssortmentPriority, 
//  _SalesDelivery._ProdExtAssortmentPriorityText, 
//  _SalesDelivery._Product, 
  _SalesDelivery._SalesDeliveryPointOfSale, 
  _SalesDelivery._SalesTax, 
  _SalesDelivery._SalesText,
  _Plant.Plant,
  _Infrec,
    _Infrec.lifnr,
    _Infrec.ekorg,
    _Infrec.esokz, 
    _Infrec.werks, 
//    _Infrec.lifnr, 
    _Infrec.name1, 
//    _Infrec.matnr, 
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
    _Infrec.aut_source,
    _Plant.Product as test, 
//    _Plant.ProductForEdit, 
    _Plant.PlantForEdit, 
    _Plant.ProfileCode, 
    _Plant.ProfileValidityStartDate, 
    _Plant.FiscalYearVariant, 
    _Plant.PeriodType, 
    _Plant.ProfitCenter, 
//    _Plant.IsMarkedForDeletion, 
    _Plant.ConfigurableProduct, 
    _Plant.StockDeterminationGroup, 
//    _Plant.IsBatchManagementRequired, 
    _Plant.SerialNumberProfile, 
    _Plant.IsNegativeStockAllowed, 
    _Plant.IsInternalBatchManaged, 
    _Plant.ProductCFOPCategory, 
    _Plant.ControllingArea, 
    _Plant.SalesOrganization, 
    _Plant.DistributionChannel, 
    _Plant.PlantCategory, 
    _Plant.ReferenceDistributionCenter, 
    _Plant.ReferenceStore, 
    _Plant.IsReferenceDistributionCenter, 
    _Plant.IsReferenceStore, 
//    _Plant.ConfigurationSideEffect, 
    _Plant.GoodsIssueUnit as PGoodsIssueUnit, 
    _Plant.DistrCntrDistributionProfile, 
    _Plant.ZZ1_ZCIRCUIT_ST_PLT, 
    _Plant.ZZ1_ZUO_SORTIE_PLT, 
    _Plant.ZZ1_ZCIRCUIT_DC_PLT, 
    _Plant.ZZ1_ZREAPPRO_ST_PLT, 
    _Plant.ZZ1_ZPALETTE_PLT, 
    _Plant.ZZ1_ZUO_ENTREE_PLT, 
    _Plant.ZZ1_ZSTOCKAGE_PLT, 
    _Plant._AdvancedPlanning, 
    _Plant._ConfigurableProduct, 
    _Plant._ConfigurableProductName, 
    _Plant._FiscalYearVariant, 
    _Plant._FiscalYearVariantDescription, 
    _Plant._GoodsIssueUnit, 
    _Plant._GoodsMovementQuantity, 
    _Plant._MaterialLotSizingProcedure, 
    _Plant._MRPAreaData, 
    _Plant._PlantProcurement, 
    _Plant._PlantQualityMgmt, 
    _Plant._PlantSales, 
    _Plant._PlantStorage, 
    _Plant._PlantText, 
    _Plant._ProdPlantInternationalTrade, 
    _Plant._ProdPlantPurchaseTax, 
    _Plant._ProdPlntFcstParameters, 
    _Plant._Product, 
    _Plant._ProductPlantCosting, 
    _Plant._ProductPlantForecast, 
    _Plant._ProductReplnmtRecipient, 
    _Plant._ProductStatus as Pproductstatus, 
    _Plant._ProductStatusText as PProductStatusText, 
    _Plant._StorageLocation, 
    _Plant._UnitOfMeasureText, 
    _Plant._ZZ1_ZCIRCUIT_DC_PLT, 
    _Plant._ZZ1_ZCIRCUIT_ST_PLT, 
    _Plant._ZZ1_ZPALETTE_PLT, 
    _Plant._ZZ1_ZSTOCKAGE_PLT, 
    _Plant._ZZ1_ZUO_ENTREE_PLT, 
    _Plant._ZZ1_ZUO_SORTIE_PLT
    
}
