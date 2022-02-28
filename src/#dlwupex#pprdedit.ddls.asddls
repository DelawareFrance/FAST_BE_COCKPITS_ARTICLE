@AbapCatalog.sqlViewName: '/DLWUPEX/PPEDIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Articles'
@VDM.viewType: #CONSUMPTION
//@Analytics.query: true
//@Analytics: {dataExtraction.enabled: true, query: true }
// need to go to FIORI system and run the transaction /IWFND/MAINT_SERVICE to activate the service
@OData.publish: true
define view /DLWUPEX/PPRDEDIT as select from I_Product as Product
  association [0..1] to E_Product                 as _ActiveProductExt      on  $projection.Product = _ActiveProductExt.Product
  association [0..1] to E_Product                 as _DraftProductExt       on  $projection.Product = _DraftProductExt.Product

  association [0..*] to I_ProductDescriptionWD    as _Description           on  $projection.Product = _Description.Product

  association [0..*] to I_ProductWD               as _ConfProductVariant    on  $projection.Product = _ConfProductVariant.CrossPlantConfigurableProduct

  association [0..1] to I_ProductDescriptionWD    as _DescriptionText       on  $projection.Product       = _DescriptionText.Product
                                                                            and _DescriptionText.Language = $session.system_language
  association [0..*] to I_ProductPlantWD          as _Plant                 on  $projection.Product = _Plant.Product
  //                                                                            and _Plant.PlantCategory = '' //standard plant
//  association [0..*] to I_ProductPlantWD          as _Store                 on  $projection.Product  = _Store.Product
//                                                                            and _Store.PlantCategory = 'A' //Store
//  association [0..*] to I_ProductPlantWD          as _DistributionCenter    on  $projection.Product               = _DistributionCenter.Product
//                                                                            and _DistributionCenter.PlantCategory = 'B' //Distribution center
  association [0..1] to I_ProductSalesWD          as _ProductSales          on  $projection.Product = _ProductSales.Product

//  association [0..1] to I_Productprocurementwd    as _ProductProcurement    on  $projection.Product = _ProductProcurement.Product
//
//  association [0..1] to I_ProductStorageWD        as _ProductStorage        on  $projection.Product = _ProductStorage.Product
//
//  association [0..1] to I_ProductQMwd             as _ProductQualityMgmt    on  $projection.Product = _ProductQualityMgmt.Product
//

  association [0..*] to I_ProductSalesDeliveryWD  as _SalesDelivery         on  $projection.Product = _SalesDelivery.Product

  association [0..*] to I_ProductUnitsOfMeasureWD as _UnitOfMeasure         on  $projection.Product = _UnitOfMeasure.Product

  association [0..*] to I_ProductValuationWD      as _Valuation             on  $projection.Product = _Valuation.Product

  association [0..*] to I_ProductSalesTaxWD       as _ProductSalesTax       on  $projection.Product = _ProductSalesTax.Product

  association [0..*] to I_Producttextwd           as _ProductBasicText      on  $projection.Product = _ProductBasicText.Product
  //                                                                            and _ProductBasicText.LongTextID = 'GRUN'
  association [0..*] to I_Producttextwd           as _ProductPurchaseText   on  $projection.Product             = _ProductPurchaseText.Product
                                                                            and _ProductPurchaseText.LongTextID = 'BEST'
  association [0..*] to I_Producttextwd           as _ProductInspectionText on  $projection.Product               = _ProductInspectionText.Product
                                                                            and _ProductInspectionText.LongTextID = 'PRUE'
  association [0..*] to I_Producttextwd           as _ProductInternalNote   on  $projection.Product             = _ProductInternalNote.Product
                                                                            and _ProductInternalNote.LongTextID = 'IVER'
  association [0..1] to I_Productscmwd            as _SupplyChainManagement on  $projection.Product = _SupplyChainManagement.Product
  association [0..1] to I_ProductVariantMatrixWD  as _ProductVariant        on  $projection.Product = _ProductVariant.Product

  association [0..*] to I_MDProductHierarchyNode  as _MDProductHierarchyNode -- Not part of 1705
                                                                            on  $projection.Product = _MDProductHierarchyNode.Product
  association [0..*] to I_ProductSeasonsTP        as _ProductSeasons        on  $projection.Product = _ProductSeasons.Product

  association [0..*] to I_ProdEWMWarehouseTP      as _Warehouse             on  $projection.Product = _Warehouse.Product

  association [0..*] to I_BillOfMaterialTP        as _ProductBOM            on  $projection.Product = _ProductBOM.Material

  association [0..*] to I_ProductReplenishmentTP  as _ProductReplenishment  on  $projection.Product = _ProductReplenishment.Product

  //  association [0..*] to I_ProdReplnmtRecipientTP  as _ProductReplnmtRecipient on  $projection.Product = _ProductReplnmtRecipient.Product
{
      @ObjectModel.readOnly:true
      @ObjectModel.Hierarchy.association: '_MDProductHierarchyNode'
  key Product.Product, //Material,


      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.Product                                   as ProductForEdit, // offen: neuer Eintrag im Feldkatalog: Product


      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ProductType, //MaterialType,                  // offen: neuer Eintrag im Feldkatalog:ProductType
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.CrossPlantStatus, // offen: Cross-Plant Material Status
      //      @Semantics.systemDate.createdAt: true
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.CrossPlantStatusValidityDate, // offen: Date from which the cross-plant material status is valid
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.readOnly: true
      @Semantics.systemDate.createdAt: true
      Product.CreationDate, //CreationDate,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.readOnly: true
      @Semantics.user.createdBy: true
      Product.CreatedByUser, //CreatedByUser,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.readOnly: true
      @Semantics.systemDate.lastChangedAt: true
      Product.LastChangeDate, //LastChangeDate, // offen: neuer Eintrag im Feldkatalog
      @Semantics.systemTime.lastChangedAt: true
      Product.LastChangeTime,
      @Semantics.systemDateTime.lastChangedAt: true
      Product.LastChangeDateTime,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.readOnly: true
      @Semantics.user.lastChangedBy: true
      Product.LastChangedByUser, //LastChangedByUser,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.IsMarkedForDeletion, //MaterialIsMarkedForDeletion, //no gfn availabe in excel
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ProductOldID, //MaterialOldID,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.GrossWeight, //MaterialGrossWeight,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.WeightUnit, //MaterialWeightUnit,  //erro
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.NetWeight, //MaterialNetWeight,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      //changes as part of incident 1770542072. Country of orgin is displayed for retail,but here it was referring from I_product and not I_productretail.
      Product._ProductRetail.CountryOfOrigin, //CountryOfOrigin,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.CompetitorID, //Customer,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ProductGroup, //MaterialGroup,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'

      Product.BaseUnit, //MaterialBaseUnit,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ItemCategoryGroup,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ProductHierarchy, //ProductHierarchy,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.Division, //Division,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.VolumeUnit, ///error
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      //        @Semantics.quantity.unitOfMeasure: 'Voleh'
      //        @DefaultAggregation: #NONE
      Product.MaterialVolume,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ANPCode,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.Brand,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ValidityStartDate,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ProdNoInGenProdInPrepackProd,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.SizeOrDimensionText,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.IndustryStandardName,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ProductStandardID,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.InternationalArticleNumberCat,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ProductIsConfigurable,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.IsBatchManagementRequired,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ExternalProductGroup,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.CrossPlantConfigurableProduct,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.SerialNoExplicitnessLevel,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ProductManufacturerNumber,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ManufacturerNumber, //pstat changes
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ManufacturerPartProfile,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ChangeNumber,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.MaterialRevisionLevel,

      //EWM fields------------------------
      //WM execution
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.HandlingIndicator,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.WarehouseProductGroup,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.WarehouseStorageCondition,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.StandardHandlingUnitType,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.SerialNumberProfile,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.AdjustmentProfile,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.IsPilferable,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.IsRelevantForHzdsSubstances,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.QuarantinePeriod,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.TimeUnitForQuarantinePeriod,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.QualityInspectionGroup,

      //WM packaging
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.HandlingUnitType,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.HasVariableTareWeight,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.MaximumPackagingLength,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.MaximumPackagingWidth,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.MaximumPackagingHeight,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.MaximumCapacity,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.OvercapacityTolerance,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.UnitForMaxPackagingDimensions,

      //      Retail Fields
      Product.BaseUnitSpecificProductLength,
      Product.BaseUnitSpecificProductWidth,
      Product.BaseUnitSpecificProductHeight,
      Product.ProductMeasurementUnit,
      Product.ArticleCategory,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ContentUnit,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.NetContent,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ComparisonPriceQuantity,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.GrossContent,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.ProductValidEndDate,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.AssortmentListType,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.HasTextilePartsWthAnimalOrigin,
      Product.ProductSeasonUsageCategory,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product._ProductRetail.ServiceAgreement           as ServiceAgreement,
      Product._ProductRetail.ConsumptionValueCategory   as ConsumptionValueCategory,
      Product._ProductRetail.GoodsIssueUnit             as GoodsIssueUnit,
      Product._ProductRetail.RegionOfOrigin             as RegionOfOrigin,
      Product._ProductRetail.AssortmentGrade            as AssortmentGrade,
      Product._ProductRetail.ProdExtAssortmentPriority  as ProdExtAssortmentPriority,
      Product._ProductRetail.SalesUnit                  as SalesUnit,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product._ProductRetail.ValuationClass             as ValuationClass,

      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product._ProductRetail.ValuationMargin            as ValuationMargin,

      Product._ProductRetail.DistrCntrSaleEndDate       as DistrCntrSaleEndDate,

      cast('' as vchclf_side_effect_data)               as ClassificationSideEffect,

      cast('' as vchclf_side_effect_data)               as ConfigurationSideEffect,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      cast('' as referenceproduct)                      as ReferenceProduct,

      _DescriptionText.ProductDescription,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.AuthorizationGroup,
      @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
      Product.HasEmptiesBOM,

      Product._BaseUnitOfMeasure,

      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Description,
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Plant,
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Valuation,
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _ProductSales,
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _SalesDelivery,
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _UnitOfMeasure,
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _ProductProcurement,
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
//      _ProductStorage,
//      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
      _ProductSalesTax,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
//      _ProductQualityMgmt,

//      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
      _ProductBasicText,
      _ProductInspectionText,
      _ProductPurchaseText,
      _ProductInternalNote,
//      _DistributionCenter,
//      _Store,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
      _SupplyChainManagement,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
      _ProductVariant,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD ]
      _ProductSeasons,
      _DescriptionText,
      _ConfProductVariant,
      _MDProductHierarchyNode,
      _CreatedByUser,
      _LastChangedByUser,
      _ProductTypeName,
      _ProductType,
      _ContentUnit,
      _ProductMeasurementUnit,
      _ExtProdGrpText,
      _ExternalProductGroup,
      _Division,
      _DivisionText,
      _ProductHierarchy,
      _ProductHierarchyText,
      _WeightUnitValueHelp,
      _WeightUnitText,
      _QuantityUnitValueHelp,
      _QuantityUnitText,
      _ProductStatus,
      _ProductStatusText,
      _UnitForMaxPackaging,
      _UnitForMaxPackagingText,
      _TimeUnitForQuarantinePeriod,
//      _TimeUnitQuarantinePeriodText,
      _ProductGroup,
      _ProductGroupText,
      _InternationalArticleNumberCat,
      _IntArticleNumberText,
      _CrossPlantConfigurableProduct,
      _MaterialText,
      _ProductRetail._GoodsIssueUnit                    as _GoodsIssueUnit,
      _ProductRetail._GoodsIssueText                    as _GoodsIssueText,
      _ProductRetail._ConsumptionValueCategory          as _ConsumptionValueCategory,
      _ProductRetail._ConsumptionValueCategoryText      as _ConsumptionValueCategoryText,
      _BaseUnitOfMeasureText,

      @ObjectModel.association.type:  #TO_COMPOSITION_CHILD
      _Warehouse,
      @ObjectModel.association.draft.enabled: true
      @ObjectModel.association.reverseAssociation: '_ProductWD'
      @ObjectModel.association.draft.fieldNamePrefix:'Product'
      _ProductBOM,

      @ObjectModel.association.type:  #TO_COMPOSITION_CHILD
      _ProductReplenishment,
      _ProductRetail._SalesUnit                         as _SalesUnit,
      _ProductRetail._SalesUnitText                     as _SalesUnitText



}

//   association [0..*] to M_V_inforecord   as _Infrec   on  $projection.Product =    _Infrec.matnr
                                                      
//{
//
// key Product , 
// ProductForEdit, 
// ProductType, 
// CrossPlantStatus, 
// CrossPlantStatusValidityDate, 
// CreationDate, 
// CreatedByUser, 
// LastChangeDate, 
// LastChangeTime, 
// LastChangeDateTime, 
// LastChangedByUser, 
//// IsMarkedForDeletion, 
// ProductOldID, 
// GrossWeight, 
// WeightUnit, 
// NetWeight, 
// CountryOfOrigin, 
// CompetitorID, 
// ProductGroup, 
// BaseUnit, 
// ItemCategoryGroup, 
// ProductHierarchy, 
// Division, 
// VolumeUnit, 
// MaterialVolume, 
// ANPCode, 
// Brand, 
// ValidityStartDate, 
// ProdNoInGenProdInPrepackProd, 
// SizeOrDimensionText, 
// IndustryStandardName, 
// ProductStandardID, 
// InternationalArticleNumberCat, 
// ProductIsConfigurable, 
// IsBatchManagementRequired, 
// ExternalProductGroup, 
// CrossPlantConfigurableProduct, 
// SerialNoExplicitnessLevel, 
// ProductManufacturerNumber, 
// ManufacturerNumber, 
// ManufacturerPartProfile, 
// ChangeNumber, 
// MaterialRevisionLevel, 
// HandlingIndicator, 
// WarehouseProductGroup, 
// WarehouseStorageCondition, 
// StandardHandlingUnitType, 
//// SerialNumberProfile, 
// AdjustmentProfile, 
// IsPilferable, 
// IsRelevantForHzdsSubstances, 
// QuarantinePeriod, 
// TimeUnitForQuarantinePeriod, 
// QualityInspectionGroup, 
// HandlingUnitType, 
// HasVariableTareWeight, 
// MaximumPackagingLength, 
// MaximumPackagingWidth, 
// MaximumPackagingHeight, 
// MaximumCapacity, 
// OvercapacityTolerance, 
// UnitForMaxPackagingDimensions, 
// BaseUnitSpecificProductLength, 
// BaseUnitSpecificProductWidth, 
// BaseUnitSpecificProductHeight, 
// ProductMeasurementUnit, 
// ArticleCategory, 
// ContentUnit, 
// NetContent, 
// ComparisonPriceQuantity, 
// GrossContent, 
// ProductValidEndDate, 
// AssortmentListType, 
// HasTextilePartsWthAnimalOrigin, 
// ProductSeasonUsageCategory, 
// ServiceAgreement, 
// ConsumptionValueCategory, 
// GoodsIssueUnit as MGoodsIssueUnit, 
// RegionOfOrigin, 
// AssortmentGrade, 
// ProdExtAssortmentPriority, 
// SalesUnit, 
// ValuationClass, 
// ValuationMargin, 
// DistrCntrSaleEndDate, 
// ClassificationSideEffect, 
//// ConfigurationSideEffect, 
// ReferenceProduct, 
// ProductDescription, 
// AuthorizationGroup, 
// HasEmptiesBOM, 
//
// /* Associations */ 
// //I_ProductWD 
////////////// _BaseUnitOfMeasure, 
////////////// _BaseUnitOfMeasureText, 
////////////// _ConfProductVariant, 
////////////// _ConsumptionValueCategory, 
////////////// _ConsumptionValueCategoryText, 
////////////// _ContentUnit, 
////////////// _CreatedByUser, 
////////////// _CrossPlantConfigurableProduct, 
////////////// _Description, 
////////////// _DescriptionText, 
////////////// _DistributionCenter, 
////////////// _Division, 
////////////// _DivisionText, 
////////////// _ExternalProductGroup, 
////////////// _ExtProdGrpText, 
////////////// _GoodsIssueText, 
//////////////// _GoodsIssueUnit, 
////////////// _IntArticleNumberText, 
////////////// _InternationalArticleNumberCat, 
////////////// _LastChangedByUser, 
////////////// _MaterialText, 
////////////// _MDProductHierarchyNode, 
////////////// _Plant, 
////////////// _ProductBasicText, 
////////////// _ProductBOM, 
////////////// _ProductGroup, 
////////////// _ProductGroupText, 
////////////// _ProductHierarchy, 
////////////// _ProductHierarchyText, 
////////////// _ProductInspectionText, 
////////////// _ProductInternalNote, 
////////////// _ProductMeasurementUnit, 
////////////// _ProductProcurement, 
////////////// _ProductPurchaseText, 
////////////// _ProductQualityMgmt, 
////////////// _ProductReplenishment, 
////////////// _ProductSales, 
////////////// _ProductSalesTax, 
////////////// _ProductSeasons, 
////////////// _ProductStatus, 
////////////// _ProductStatusText, 
////////////// _ProductStorage, 
////////////// _ProductType, 
////////////// _ProductTypeName, 
////////////// _ProductVariant, 
////////////// _QuantityUnitText, 
////////////// _QuantityUnitValueHelp, 
////////////// _SalesDelivery, 
////////////// _SalesUnit, 
////////////// _SalesUnitText, 
////////////// _Store, 
////////////// _SupplyChainManagement, 
////////////// _TimeUnitForQuarantinePeriod, 
////////////// _TimeUnitQuarantinePeriodText, 
////////////// _UnitForMaxPackaging, 
////////////// _UnitForMaxPackagingText, 
////////////// _UnitOfMeasure, 
////////////// _Valuation, 
////////////// _Warehouse, 
////////////// _WeightUnitText, 
////////////// _WeightUnitValueHelp,
// _SalesDelivery.ProductSalesOrg as SaleOrg,
//  _SalesDelivery.ProductDistributionChnl as DChanel,
//  _SalesDelivery.Product as SProduct, 
////  _SalesDelivery.ProductSalesOrg, 
////  _SalesDelivery.ProductDistributionChnl, 
////  _SalesDelivery.ProductForEdit, 
//  _SalesDelivery.ProductSalesOrgForEdit, 
//  _SalesDelivery.ProductDistributionChnlForEdit, 
//  _SalesDelivery.MinimumOrderQuantity, 
//  _SalesDelivery.SupplyingPlant, 
//  _SalesDelivery.PriceSpecificationProductGroup, 
//  _SalesDelivery.AccountDetnProductGroup, 
//  _SalesDelivery.DeliveryNoteProcMinDelivQty, 
////  _SalesDelivery.ItemCategoryGroup, 
//  _SalesDelivery.DeliveryQuantityUnit, 
//  _SalesDelivery.DeliveryQuantity, 
//  _SalesDelivery.ProductSalesStatus, 
//  _SalesDelivery.ProductSalesStatusValidityDate, 
//  _SalesDelivery.SalesMeasureUnit, 
//  _SalesDelivery.IsMarkedForDeletion, 
////  _SalesDelivery.ProductHierarchy, 
//  _SalesDelivery.FirstSalesSpecProductGroup, 
//  _SalesDelivery.SecondSalesSpecProductGroup, 
//  _SalesDelivery.ThirdSalesSpecProductGroup, 
//  _SalesDelivery.FourthSalesSpecProductGroup, 
//  _SalesDelivery.FifthSalesSpecProductGroup, 
//  _SalesDelivery.MinimumMakeToOrderOrderQty, 
//  _SalesDelivery.LogisticsStatisticsGroup, 
//  _SalesDelivery.VolumeRebateGroup, 
//  _SalesDelivery.ProductCommissionGroup, 
//  _SalesDelivery.CashDiscountIsDeductible, 
//  _SalesDelivery.PricingReferenceProduct, 
////  _SalesDelivery.AssortmentGrade, 
//  _SalesDelivery.StoreListingProcedure, 
//  _SalesDelivery.DistrCntrListingProcedure, 
//  _SalesDelivery.StoreListingStartDate, 
////  _SalesDelivery.StoreListingEndDate, 
//  _SalesDelivery.DistrCntrListingStartDate, 
////  _SalesDelivery.DistrCntrListingEndDate, 
//  _SalesDelivery.StoreSaleStartDate, 
//  _SalesDelivery.StoreSaleEndDate, 
//  _SalesDelivery.DistrCntrSaleStartDate, 
////  _SalesDelivery.DistrCntrSaleEndDate, 
//  _SalesDelivery.RoundingProfile, 
//  _SalesDelivery.ProductUnitGroup, 
//  _SalesDelivery.MaxDeliveryQtyStoreOrder, 
//  _SalesDelivery.PriceFixingCategory, 
//  _SalesDelivery.VariableSalesUnitIsNotAllowed, 
//  _SalesDelivery.CompetitionPressureCategory, 
////  _SalesDelivery.ProdExtAssortmentPriority, 
////  _SalesDelivery._ProdExtAssortmentPriority, 
////  _SalesDelivery._ProdExtAssortmentPriorityText, 
////  _SalesDelivery._Product, 
//  _SalesDelivery._SalesDeliveryPointOfSale, 
//  _SalesDelivery._SalesTax, 
//  _SalesDelivery._SalesText,
//  _Plant.Plant,
////  _Infrec,
//    _Infrec.lifnr,
//    _Infrec.ekorg,
//    _Infrec.esokz, 
//    _Infrec.werks, 
////    _Infrec.lifnr, 
//    _Infrec.name1, 
////    _Infrec.matnr, 
//    _Infrec.maktx, 
//    _Infrec.ekotx, 
//    _Infrec.name1_p, 
//    _Infrec.entitystate, 
//    _Infrec.wgbez, 
//    _Infrec.matkl, 
//    _Infrec.loekz_a, 
//    _Infrec.txz01, 
//    _Infrec.meins, 
//    _Infrec.umrez, 
//    _Infrec.umren, 
//    _Infrec.idnlf, 
//    _Infrec.verkf, 
//    _Infrec.telf1, 
//    _Infrec.lmein, 
//    _Infrec.wglif, 
//    _Infrec.kolif, 
//    _Infrec.lifab, 
//    _Infrec.lifbi, 
//    _Infrec.vabme, 
//    _Infrec.relif, 
//    _Infrec.ernam, 
//    _Infrec.loekz_e, 
//    _Infrec.ekgrp, 
//    _Infrec.waers, 
//    _Infrec.minbm, 
//    _Infrec.norbm, 
//    _Infrec.aplfz, 
//    _Infrec.uebto, 
//    _Infrec.untto, 
//    _Infrec.uebtk, 
//    _Infrec.ebeln, 
//    _Infrec.ebelp, 
//    _Infrec.netpr, 
//    _Infrec.peinh, 
//    _Infrec.bprme, 
//    _Infrec.prdat, 
//    _Infrec.bpumz, 
//    _Infrec.bpumn, 
//    _Infrec.webre, 
//    _Infrec.mwskz, 
//    _Infrec.inco1, 
//    _Infrec.inco2, 
//    _Infrec.bstma, 
//    _Infrec.aut_source
//////////    _Plant.Product as test, 
////////////    _Plant.ProductForEdit, 
//////////    _Plant.PlantForEdit, 
//////////    _Plant.ProfileCode, 
//////////    _Plant.ProfileValidityStartDate, 
//////////    _Plant.FiscalYearVariant, 
//////////    _Plant.PeriodType, 
//////////    _Plant.ProfitCenter, 
////////////    _Plant.IsMarkedForDeletion, 
//////////    _Plant.ConfigurableProduct, 
//////////    _Plant.StockDeterminationGroup, 
////////////    _Plant.IsBatchManagementRequired, 
//////////    _Plant.SerialNumberProfile, 
//////////    _Plant.IsNegativeStockAllowed, 
//////////    _Plant.IsInternalBatchManaged, 
//////////    _Plant.ProductCFOPCategory, 
//////////    _Plant.ControllingArea, 
//////////    _Plant.SalesOrganization, 
//////////    _Plant.DistributionChannel, 
//////////    _Plant.PlantCategory, 
//////////    _Plant.ReferenceDistributionCenter, 
//////////    _Plant.ReferenceStore,
////    _Plant.IsReferenceDistributionCenter, 
////    _Plant.IsReferenceStore, 
////    _Plant.ConfigurationSideEffect, 
////   _Plant.GoodsIssueUnit as PGoodsIssueUnit, 
////    _Plant.DistrCntrDistributionProfile, 
////    _Plant.ZZ1_ZCIRCUIT_ST_PLT, 
////    _Plant.ZZ1_ZUO_SORTIE_PLT, 
////    _Plant.ZZ1_ZCIRCUIT_DC_PLT, 
////    _Plant.ZZ1_ZREAPPRO_ST_PLT, 
////    _Plant.ZZ1_ZPALETTE_PLT, 
////    _Plant.ZZ1_ZUO_ENTREE_PLT, 
////    _Plant.ZZ1_ZSTOCKAGE_PLT, 
//////////    _Plant._AdvancedPlanning, 
//////////    _Plant._ConfigurableProduct, 
//////////    _Plant._ConfigurableProductName, 
//////////    _Plant._FiscalYearVariant, 
//////////    _Plant._FiscalYearVariantDescription, 
////////////    _Plant._GoodsIssueUnit, 
//////////    _Plant._GoodsMovementQuantity, 
//////////    _Plant._MaterialLotSizingProcedure, 
//////////    _Plant._MRPAreaData, 
//////////    _Plant._PlantProcurement, 
//////////    _Plant._PlantQualityMgmt, 
//////////    _Plant._PlantSales, 
//////////    _Plant._PlantStorage, 
//////////    _Plant._PlantText, 
//////////    _Plant._ProdPlantInternationalTrade, 
//////////    _Plant._ProdPlantPurchaseTax, 
//////////    _Plant._ProdPlntFcstParameters, 
//////////    _Plant._Product, 
//////////    _Plant._ProductPlantCosting, 
//////////    _Plant._ProductPlantForecast, 
//////////    _Plant._ProductReplnmtRecipient, 
//////////    _Plant._ProductStatus as Pproductstatus, 
//////////    _Plant._ProductStatusText as PProductStatusText, 
//////////    _Plant._StorageLocation
////    _Plant._UnitOfMeasureText
////    _Plant._ZZ1_ZCIRCUIT_DC_PLT, 
////    _Plant._ZZ1_ZCIRCUIT_ST_PLT, 
////    _Plant._ZZ1_ZPALETTE_PLT, 
////    _Plant._ZZ1_ZSTOCKAGE_PLT, 
////    _Plant._ZZ1_ZUO_ENTREE_PLT, 
////    _Plant._ZZ1_ZUO_SORTIE_PLT
//    
//}
