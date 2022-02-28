@AbapCatalog.sqlViewName: '/DLWUPEX/GD_CDS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS to fill General data tab in modif cockpit'
@OData.publish: true
define view /DLWUPEX/GDATACDS  as select from I_Product {
  //I_Product 
  key Product, 
  ProductExternalID, 
  ProductType, 
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
  ProductGroup, 
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
  ProductCategory, 
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
  ArticleCategory, 
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
  //I_Product 
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
  _MDProductHierarchyNode, 
  _ProductCategory, 
  _ProductCategoryText, 
  _ProductGroup, 
  _ProductGroupText, 
  _ProductHierarchy, 
  _ProductHierarchyText, 
  _ProductMeasurementUnit, 
  _ProductProcurement, 
  _ProductRetail, 
  _ProductSales, 
  _ProductStatus, 
  _ProductStatusText, 
  _ProductType, 
  _ProductTypeName, 
  _QuantityUnitText, 
  _QuantityUnitValueHelp, 
  _Text, 
  _TimeUnitForQuarantinePeriod, 
  _TimeUnitQuarantinePeriodText, 
  _UnitForMaxPackaging, 
  _UnitForMaxPackagingText, 
  _WeightUnitText, 
  _WeightUnitValueHelp  
}

