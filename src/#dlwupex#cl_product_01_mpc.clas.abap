class /DLWUPEX/CL_PRODUCT_01_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  types:
  begin of TS_PRODUCTS,
     PRODUCT type C length 40,
     PRODUCTEXTERNALID type C length 40,
     PRODUCTTYPE type C length 4,
     CREATIONDATE type TIMESTAMPL,
     CREATEDBYUSER type C length 12,
     LASTCHANGEDATE type TIMESTAMPL,
     LASTCHANGEDBYUSER type C length 12,
     ISMARKEDFORDELETION type FLAG,
     CROSSPLANTSTATUS type C length 2,
     CROSSPLANTSTATUSVALIDITYDATE type TIMESTAMPL,
     PRODUCTOLDID type C length 40,
     GROSSWEIGHT type P length 7 decimals 3,
     PURCHASEORDERQUANTITYUNIT type C length 3,
     SOURCEOFSUPPLY type C length 1,
     WEIGHTUNIT type C length 3,
     COUNTRYOFORIGIN type C length 3,
     COMPETITORID type C length 10,
     PRODUCTGROUP type C length 9,
     BASEUNIT type C length 3,
     ITEMCATEGORYGROUP type C length 4,
     NETWEIGHT type P length 7 decimals 3,
     PRODUCTHIERARCHY type C length 18,
     DIVISION type C length 2,
     VARBLPURORDUNITISACTIVE type C length 1,
     VOLUMEUNIT type C length 3,
     MATERIALVOLUME type P length 7 decimals 3,
     SALESSTATUS type C length 2,
     TRANSPORTATIONGROUP type C length 4,
     SALESSTATUSVALIDITYDATE type TIMESTAMPL,
     AUTHORIZATIONGROUP type C length 4,
     ANPCODE type C length 9,
     PRODUCTCATEGORY type C length 2,
     BRAND type C length 4,
     PROCUREMENTRULE type C length 1,
     VALIDITYSTARTDATE type TIMESTAMPL,
     LOWLEVELCODE type C length 3,
     PRODNOINGENPRODINPREPACKPROD type C length 40,
     SERIALIDENTIFIERASSGMTPROFILE type C length 4,
     SIZEORDIMENSIONTEXT type C length 32,
     INDUSTRYSTANDARDNAME type C length 18,
     PRODUCTSTANDARDID type C length 18,
     INTERNATIONALARTICLENUMBERCAT type C length 2,
     PRODUCTISCONFIGURABLE type FLAG,
     ISBATCHMANAGEMENTREQUIRED type FLAG,
     HASEMPTIESBOM type FLAG,
     EXTERNALPRODUCTGROUP type C length 18,
     CROSSPLANTCONFIGURABLEPRODUCT type C length 40,
     SERIALNOEXPLICITNESSLEVEL type C length 1,
     PRODUCTMANUFACTURERNUMBER type C length 40,
     MANUFACTURERNUMBER type C length 10,
     MANUFACTURERPARTPROFILE type C length 4,
     QLTYMGMTINPROCMTISACTIVE type FLAG,
     ISAPPROVEDBATCHRECORDREQD type FLAG,
     HANDLINGINDICATOR type C length 4,
     WAREHOUSEPRODUCTGROUP type C length 4,
     WAREHOUSESTORAGECONDITION type C length 2,
     STANDARDHANDLINGUNITTYPE type C length 4,
     SERIALNUMBERPROFILE type C length 4,
     ADJUSTMENTPROFILE type C length 3,
     PREFERREDUNITOFMEASURE type C length 3,
     ISPILFERABLE type FLAG,
     ISRELEVANTFORHZDSSUBSTANCES type FLAG,
     QUARANTINEPERIOD type P length 2 decimals 0,
     TIMEUNITFORQUARANTINEPERIOD type C length 3,
     QUALITYINSPECTIONGROUP type C length 4,
     HANDLINGUNITTYPE type C length 4,
     HASVARIABLETAREWEIGHT type FLAG,
     MAXIMUMPACKAGINGLENGTH type P length 8 decimals 3,
     MAXIMUMPACKAGINGWIDTH type P length 8 decimals 3,
     MAXIMUMPACKAGINGHEIGHT type P length 8 decimals 3,
     MAXIMUMCAPACITY type P length 8 decimals 3,
     OVERCAPACITYTOLERANCE type P length 2 decimals 1,
     UNITFORMAXPACKAGINGDIMENSIONS type C length 3,
     BASEUNITSPECIFICPRODUCTLENGTH type P length 7 decimals 3,
     BASEUNITSPECIFICPRODUCTWIDTH type P length 7 decimals 3,
     BASEUNITSPECIFICPRODUCTHEIGHT type P length 7 decimals 3,
     PRODUCTMEASUREMENTUNIT type C length 3,
     PRODUCTVALIDSTARTDATE type TIMESTAMPL,
     ARTICLECATEGORY type C length 2,
     CONTENTUNIT type C length 3,
     NETCONTENT type P length 7 decimals 3,
     COMPARISONPRICEQUANTITY type P length 3 decimals 0,
     GROSSCONTENT type P length 7 decimals 3,
     PRODUCTVALIDENDDATE type TIMESTAMPL,
     ASSORTMENTLISTTYPE type C length 1,
     HASTEXTILEPARTSWTHANIMALORIGIN type FLAG,
     PRODUCTSEASONUSAGECATEGORY type C length 1,
     INDUSTRYSECTOR type C length 1,
     CHANGENUMBER type C length 12,
     MATERIALREVISIONLEVEL type C length 2,
     ISACTIVEENTITY type FLAG,
     LASTCHANGEDATETIME type TIMESTAMPL,
     LASTCHANGETIME type T,
     DANGEROUSGOODSINDPROFILE type C length 3,
     PRODUCTUUID type SYSUUID_X,
     PRODSUPCHNMGMTUUID22 type C length 22,
     PRODUCTDOCUMENTCHANGENUMBER type C length 6,
     PRODUCTDOCUMENTPAGECOUNT type C length 3,
     PRODUCTDOCUMENTPAGENUMBER type C length 3,
     OWNINVENTORYMANAGEDPRODUCT type C length 40,
     DOCUMENTISCREATEDBYCAD type FLAG,
     PRODUCTIONORINSPECTIONMEMOTXT type C length 18,
     PRODUCTIONMEMOPAGEFORMAT type C length 4,
     GLOBALTRADEITEMNUMBERVARIANT type C length 2,
     PRODUCTISHIGHLYVISCOUS type FLAG,
     TRANSPORTISINBULK type FLAG,
     PRODALLOCDETNPROCEDURE type C length 18,
     PRODEFFCTYPARAMVALSAREASSIGNED type FLAG,
     PRODISENVIRONMENTALLYRELEVANT type FLAG,
     LABORATORYORDESIGNOFFICE type C length 3,
     PACKAGINGMATERIALGROUP type C length 4,
     PRODUCTISLOCKED type FLAG,
     DISCOUNTINKINDELIGIBILITY type C length 1,
     SMARTFORMNAME type C length 30,
     PACKINGREFERENCEPRODUCT type C length 40,
     BASICMATERIAL type C length 48,
     PRODUCTDOCUMENTNUMBER type C length 22,
     PRODUCTDOCUMENTVERSION type C length 2,
     PRODUCTDOCUMENTTYPE type C length 3,
     PRODUCTDOCUMENTPAGEFORMAT type C length 4,
     PRODUCTCONFIGURATION type C length 18,
     SEGMENTATIONSTRATEGY type C length 8,
     SEGMENTATIONISRELEVANT type C length 1,
     LOGISTICALPRODUCTCATEGORY type C length 1,
     SALESPRODUCT type C length 40,
     PRODUCTNAME type C length 40,
     ISLOCKED type FLAG,
     ERRMSG type string,
  end of TS_PRODUCTS .
  types:
TT_PRODUCTS type standard table of TS_PRODUCTS .
  types:
   begin of ts_text_element,
      artifact_name  type c length 40,       " technical name
      artifact_type  type c length 4,
      parent_artifact_name type c length 40, " technical name
      parent_artifact_type type c length 4,
      text_symbol    type textpoolky,
   end of ts_text_element .
  types:
         tt_text_elements type standard table of ts_text_element with key text_symbol .
  types:
     TS_GENERALDATA type /DLWUPEX/GD_CDS .
  types:
TT_GENERALDATA type standard table of TS_GENERALDATA .

  constants GC_GENERALDATA type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'GeneralData' ##NO_TEXT.
  constants GC_PRODUCTS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'PRODUCTS' ##NO_TEXT.

  methods LOAD_TEXT_ELEMENTS
  final
    returning
      value(RT_TEXT_ELEMENTS) type TT_TEXT_ELEMENTS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  constants GC_INCL_NAME type STRING value '/DLWUPEX/CL_PRODUCT_01_MPC====CP' ##NO_TEXT.

  methods DEFINE_PRODUCTS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_GENERALDATA
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
ENDCLASS.



CLASS /DLWUPEX/CL_PRODUCT_01_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'DLWUPEX.PRODUCTMASSMANAG_SRV' ).

define_products( ).
define_generaldata( ).
  endmethod.


  method DEFINE_GENERALDATA.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - GeneralData
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'GeneralData' iv_def_entity_set = abap_false ). "#EC NOTEXT

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'Product' iv_abap_fieldname = 'PRODUCT' ). "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'MATN1' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productexternalid' iv_abap_fieldname = 'PRODUCTEXTERNALID' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Producttype' iv_abap_fieldname = 'PRODUCTTYPE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Creationdate' iv_abap_fieldname = 'CREATIONDATE' ). "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Createdbyuser' iv_abap_fieldname = 'CREATEDBYUSER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 12 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lastchangedate' iv_abap_fieldname = 'LASTCHANGEDATE' ). "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lastchangedbyuser' iv_abap_fieldname = 'LASTCHANGEDBYUSER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 12 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Ismarkedfordeletion' iv_abap_fieldname = 'ISMARKEDFORDELETION' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Crossplantstatus' iv_abap_fieldname = 'CROSSPLANTSTATUS' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Crossplantstatusvaliditydate' iv_abap_fieldname = 'CROSSPLANTSTATUSVALIDITYDATE' ). "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productoldid' iv_abap_fieldname = 'PRODUCTOLDID' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Grossweight' iv_abap_fieldname = 'GROSSWEIGHT' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Purchaseorderquantityunit' iv_abap_fieldname = 'PURCHASEORDERQUANTITYUNIT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Sourceofsupply' iv_abap_fieldname = 'SOURCEOFSUPPLY' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Weightunit' iv_abap_fieldname = 'WEIGHTUNIT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Countryoforigin' iv_abap_fieldname = 'COUNTRYOFORIGIN' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Competitorid' iv_abap_fieldname = 'COMPETITORID' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'ALPHA' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productgroup' iv_abap_fieldname = 'PRODUCTGROUP' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 9 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Baseunit' iv_abap_fieldname = 'BASEUNIT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Itemcategorygroup' iv_abap_fieldname = 'ITEMCATEGORYGROUP' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Netweight' iv_abap_fieldname = 'NETWEIGHT' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Producthierarchy' iv_abap_fieldname = 'PRODUCTHIERARCHY' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Division' iv_abap_fieldname = 'DIVISION' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Varblpurordunitisactive' iv_abap_fieldname = 'VARBLPURORDUNITISACTIVE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Volumeunit' iv_abap_fieldname = 'VOLUMEUNIT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Materialvolume' iv_abap_fieldname = 'MATERIALVOLUME' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Salesstatus' iv_abap_fieldname = 'SALESSTATUS' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Transportationgroup' iv_abap_fieldname = 'TRANSPORTATIONGROUP' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Salesstatusvaliditydate' iv_abap_fieldname = 'SALESSTATUSVALIDITYDATE' ). "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Authorizationgroup' iv_abap_fieldname = 'AUTHORIZATIONGROUP' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Anpcode' iv_abap_fieldname = 'ANPCODE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 9 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productcategory' iv_abap_fieldname = 'PRODUCTCATEGORY' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Brand' iv_abap_fieldname = 'BRAND' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Procurementrule' iv_abap_fieldname = 'PROCUREMENTRULE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Validitystartdate' iv_abap_fieldname = 'VALIDITYSTARTDATE' ). "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lowlevelcode' iv_abap_fieldname = 'LOWLEVELCODE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodnoingenprodinprepackprod' iv_abap_fieldname = 'PRODNOINGENPRODINPREPACKPROD' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'MATN1' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Serialidentifierassgmtprofile' iv_abap_fieldname = 'SERIALIDENTIFIERASSGMTPROFILE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Sizeordimensiontext' iv_abap_fieldname = 'SIZEORDIMENSIONTEXT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 32 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Industrystandardname' iv_abap_fieldname = 'INDUSTRYSTANDARDNAME' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productstandardid' iv_abap_fieldname = 'PRODUCTSTANDARDID' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'EAN11' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Internationalarticlenumbercat' iv_abap_fieldname = 'INTERNATIONALARTICLENUMBERCAT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productisconfigurable' iv_abap_fieldname = 'PRODUCTISCONFIGURABLE' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Isbatchmanagementrequired' iv_abap_fieldname = 'ISBATCHMANAGEMENTREQUIRED' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Hasemptiesbom' iv_abap_fieldname = 'HASEMPTIESBOM' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Externalproductgroup' iv_abap_fieldname = 'EXTERNALPRODUCTGROUP' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Crossplantconfigurableproduct' iv_abap_fieldname = 'CROSSPLANTCONFIGURABLEPRODUCT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'MATN1' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Serialnoexplicitnesslevel' iv_abap_fieldname = 'SERIALNOEXPLICITNESSLEVEL' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productmanufacturernumber' iv_abap_fieldname = 'PRODUCTMANUFACTURERNUMBER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Manufacturernumber' iv_abap_fieldname = 'MANUFACTURERNUMBER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'ALPHA' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Manufacturerpartprofile' iv_abap_fieldname = 'MANUFACTURERPARTPROFILE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Qltymgmtinprocmtisactive' iv_abap_fieldname = 'QLTYMGMTINPROCMTISACTIVE' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Isapprovedbatchrecordreqd' iv_abap_fieldname = 'ISAPPROVEDBATCHRECORDREQD' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Handlingindicator' iv_abap_fieldname = 'HANDLINGINDICATOR' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Warehouseproductgroup' iv_abap_fieldname = 'WAREHOUSEPRODUCTGROUP' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Warehousestoragecondition' iv_abap_fieldname = 'WAREHOUSESTORAGECONDITION' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Standardhandlingunittype' iv_abap_fieldname = 'STANDARDHANDLINGUNITTYPE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Serialnumberprofile' iv_abap_fieldname = 'SERIALNUMBERPROFILE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Adjustmentprofile' iv_abap_fieldname = 'ADJUSTMENTPROFILE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Preferredunitofmeasure' iv_abap_fieldname = 'PREFERREDUNITOFMEASURE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Ispilferable' iv_abap_fieldname = 'ISPILFERABLE' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Isrelevantforhzdssubstances' iv_abap_fieldname = 'ISRELEVANTFORHZDSSUBSTANCES' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Quarantineperiod' iv_abap_fieldname = 'QUARANTINEPERIOD' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Timeunitforquarantineperiod' iv_abap_fieldname = 'TIMEUNITFORQUARANTINEPERIOD' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Qualityinspectiongroup' iv_abap_fieldname = 'QUALITYINSPECTIONGROUP' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Handlingunittype' iv_abap_fieldname = 'HANDLINGUNITTYPE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Hasvariabletareweight' iv_abap_fieldname = 'HASVARIABLETAREWEIGHT' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Maximumpackaginglength' iv_abap_fieldname = 'MAXIMUMPACKAGINGLENGTH' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 15 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Maximumpackagingwidth' iv_abap_fieldname = 'MAXIMUMPACKAGINGWIDTH' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 15 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Maximumpackagingheight' iv_abap_fieldname = 'MAXIMUMPACKAGINGHEIGHT' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 15 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Maximumcapacity' iv_abap_fieldname = 'MAXIMUMCAPACITY' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 15 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Overcapacitytolerance' iv_abap_fieldname = 'OVERCAPACITYTOLERANCE' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 1 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Unitformaxpackagingdimensions' iv_abap_fieldname = 'UNITFORMAXPACKAGINGDIMENSIONS' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Baseunitspecificproductlength' iv_abap_fieldname = 'BASEUNITSPECIFICPRODUCTLENGTH' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Baseunitspecificproductwidth' iv_abap_fieldname = 'BASEUNITSPECIFICPRODUCTWIDTH' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Baseunitspecificproductheight' iv_abap_fieldname = 'BASEUNITSPECIFICPRODUCTHEIGHT' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productmeasurementunit' iv_abap_fieldname = 'PRODUCTMEASUREMENTUNIT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productvalidstartdate' iv_abap_fieldname = 'PRODUCTVALIDSTARTDATE' ). "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Articlecategory' iv_abap_fieldname = 'ARTICLECATEGORY' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Contentunit' iv_abap_fieldname = 'CONTENTUNIT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Netcontent' iv_abap_fieldname = 'NETCONTENT' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Comparisonpricequantity' iv_abap_fieldname = 'COMPARISONPRICEQUANTITY' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_maxlength( iv_max_length = 5 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Grosscontent' iv_abap_fieldname = 'GROSSCONTENT' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productvalidenddate' iv_abap_fieldname = 'PRODUCTVALIDENDDATE' ). "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Assortmentlisttype' iv_abap_fieldname = 'ASSORTMENTLISTTYPE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Hastextilepartswthanimalorigin' iv_abap_fieldname = 'HASTEXTILEPARTSWTHANIMALORIGIN' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productseasonusagecategory' iv_abap_fieldname = 'PRODUCTSEASONUSAGECATEGORY' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Industrysector' iv_abap_fieldname = 'INDUSTRYSECTOR' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Changenumber' iv_abap_fieldname = 'CHANGENUMBER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 12 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'AENNR' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Materialrevisionlevel' iv_abap_fieldname = 'MATERIALREVISIONLEVEL' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'NUMCV' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Isactiveentity' iv_abap_fieldname = 'ISACTIVEENTITY' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lastchangedatetime' iv_abap_fieldname = 'LASTCHANGEDATETIME' ). "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lastchangetime' iv_abap_fieldname = 'LASTCHANGETIME' ). "#EC NOTEXT
lo_property->set_type_edm_time( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Dangerousgoodsindprofile' iv_abap_fieldname = 'DANGEROUSGOODSINDPROFILE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productuuid' iv_abap_fieldname = 'PRODUCTUUID' ). "#EC NOTEXT
lo_property->set_type_edm_guid( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodsupchnmgmtuuid22' iv_abap_fieldname = 'PRODSUPCHNMGMTUUID22' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 22 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentchangenumber' iv_abap_fieldname = 'PRODUCTDOCUMENTCHANGENUMBER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 6 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentpagecount' iv_abap_fieldname = 'PRODUCTDOCUMENTPAGECOUNT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentpagenumber' iv_abap_fieldname = 'PRODUCTDOCUMENTPAGENUMBER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Owninventorymanagedproduct' iv_abap_fieldname = 'OWNINVENTORYMANAGEDPRODUCT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'MATN1' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Documentiscreatedbycad' iv_abap_fieldname = 'DOCUMENTISCREATEDBYCAD' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productionorinspectionmemotxt' iv_abap_fieldname = 'PRODUCTIONORINSPECTIONMEMOTXT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productionmemopageformat' iv_abap_fieldname = 'PRODUCTIONMEMOPAGEFORMAT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Globaltradeitemnumbervariant' iv_abap_fieldname = 'GLOBALTRADEITEMNUMBERVARIANT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productishighlyviscous' iv_abap_fieldname = 'PRODUCTISHIGHLYVISCOUS' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Transportisinbulk' iv_abap_fieldname = 'TRANSPORTISINBULK' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodallocdetnprocedure' iv_abap_fieldname = 'PRODALLOCDETNPROCEDURE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodeffctyparamvalsareassigned' iv_abap_fieldname = 'PRODEFFCTYPARAMVALSAREASSIGNED' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodisenvironmentallyrelevant' iv_abap_fieldname = 'PRODISENVIRONMENTALLYRELEVANT' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Laboratoryordesignoffice' iv_abap_fieldname = 'LABORATORYORDESIGNOFFICE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Packagingmaterialgroup' iv_abap_fieldname = 'PACKAGINGMATERIALGROUP' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productislocked' iv_abap_fieldname = 'PRODUCTISLOCKED' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Discountinkindeligibility' iv_abap_fieldname = 'DISCOUNTINKINDELIGIBILITY' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Smartformname' iv_abap_fieldname = 'SMARTFORMNAME' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 30 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Packingreferenceproduct' iv_abap_fieldname = 'PACKINGREFERENCEPRODUCT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'MATN1' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Basicmaterial' iv_abap_fieldname = 'BASICMATERIAL' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 48 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentnumber' iv_abap_fieldname = 'PRODUCTDOCUMENTNUMBER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 22 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentversion' iv_abap_fieldname = 'PRODUCTDOCUMENTVERSION' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumenttype' iv_abap_fieldname = 'PRODUCTDOCUMENTTYPE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentpageformat' iv_abap_fieldname = 'PRODUCTDOCUMENTPAGEFORMAT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productconfiguration' iv_abap_fieldname = 'PRODUCTCONFIGURATION' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Segmentationstrategy' iv_abap_fieldname = 'SEGMENTATIONSTRATEGY' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 8 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Segmentationisrelevant' iv_abap_fieldname = 'SEGMENTATIONISRELEVANT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Logisticalproductcategory' iv_abap_fieldname = 'LOGISTICALPRODUCTCATEGORY' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Salesproduct' iv_abap_fieldname = 'SALESPRODUCT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'MATN1' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'true' ).

lo_entity_type->bind_structure( iv_structure_name   = '/DLWUPEX/GD_CDS'
                                iv_bind_conversions = 'X' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'GeneralDataSet' ). "#EC NOTEXT

lo_entity_set->set_creatable( abap_false ).
lo_entity_set->set_updatable( abap_false ).
lo_entity_set->set_deletable( abap_false ).

lo_entity_set->set_pageable( abap_false ).
lo_entity_set->set_addressable( abap_true ).
lo_entity_set->set_has_ftxt_search( abap_false ).
lo_entity_set->set_subscribable( abap_false ).
lo_entity_set->set_filter_required( abap_false ).
  endmethod.


  method DEFINE_PRODUCTS.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - PRODUCTS
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'PRODUCTS' iv_def_entity_set = abap_false ). "#EC NOTEXT

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'Product' iv_abap_fieldname = 'PRODUCT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '001' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productexternalid' iv_abap_fieldname = 'PRODUCTEXTERNALID' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '002' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Producttype' iv_abap_fieldname = 'PRODUCTTYPE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '003' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Creationdate' iv_abap_fieldname = 'CREATIONDATE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '004' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Createdbyuser' iv_abap_fieldname = 'CREATEDBYUSER' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '005' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 12 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lastchangedate' iv_abap_fieldname = 'LASTCHANGEDATE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '006' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lastchangedbyuser' iv_abap_fieldname = 'LASTCHANGEDBYUSER' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '007' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 12 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Ismarkedfordeletion' iv_abap_fieldname = 'ISMARKEDFORDELETION' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '008' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Crossplantstatus' iv_abap_fieldname = 'CROSSPLANTSTATUS' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '009' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Crossplantstatusvaliditydate' iv_abap_fieldname = 'CROSSPLANTSTATUSVALIDITYDATE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '010' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productoldid' iv_abap_fieldname = 'PRODUCTOLDID' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '011' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Grossweight' iv_abap_fieldname = 'GROSSWEIGHT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '012' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Purchaseorderquantityunit' iv_abap_fieldname = 'PURCHASEORDERQUANTITYUNIT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '013' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Sourceofsupply' iv_abap_fieldname = 'SOURCEOFSUPPLY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '014' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Weightunit' iv_abap_fieldname = 'WEIGHTUNIT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '015' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Countryoforigin' iv_abap_fieldname = 'COUNTRYOFORIGIN' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '016' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Competitorid' iv_abap_fieldname = 'COMPETITORID' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '017' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productgroup' iv_abap_fieldname = 'PRODUCTGROUP' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '018' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 9 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Baseunit' iv_abap_fieldname = 'BASEUNIT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '019' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Itemcategorygroup' iv_abap_fieldname = 'ITEMCATEGORYGROUP' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '020' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Netweight' iv_abap_fieldname = 'NETWEIGHT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '021' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Producthierarchy' iv_abap_fieldname = 'PRODUCTHIERARCHY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '022' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Division' iv_abap_fieldname = 'DIVISION' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '023' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Varblpurordunitisactive' iv_abap_fieldname = 'VARBLPURORDUNITISACTIVE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '024' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Volumeunit' iv_abap_fieldname = 'VOLUMEUNIT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '025' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Materialvolume' iv_abap_fieldname = 'MATERIALVOLUME' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '026' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Salesstatus' iv_abap_fieldname = 'SALESSTATUS' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '027' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Transportationgroup' iv_abap_fieldname = 'TRANSPORTATIONGROUP' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '028' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Salesstatusvaliditydate' iv_abap_fieldname = 'SALESSTATUSVALIDITYDATE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '029' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Authorizationgroup' iv_abap_fieldname = 'AUTHORIZATIONGROUP' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '030' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Anpcode' iv_abap_fieldname = 'ANPCODE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '031' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 9 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productcategory' iv_abap_fieldname = 'PRODUCTCATEGORY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '032' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Brand' iv_abap_fieldname = 'BRAND' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '033' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Procurementrule' iv_abap_fieldname = 'PROCUREMENTRULE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '034' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Validitystartdate' iv_abap_fieldname = 'VALIDITYSTARTDATE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '035' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lowlevelcode' iv_abap_fieldname = 'LOWLEVELCODE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '036' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodnoingenprodinprepackprod' iv_abap_fieldname = 'PRODNOINGENPRODINPREPACKPROD' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '037' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Serialidentifierassgmtprofile' iv_abap_fieldname = 'SERIALIDENTIFIERASSGMTPROFILE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '038' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Sizeordimensiontext' iv_abap_fieldname = 'SIZEORDIMENSIONTEXT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '039' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 32 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Industrystandardname' iv_abap_fieldname = 'INDUSTRYSTANDARDNAME' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '040' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productstandardid' iv_abap_fieldname = 'PRODUCTSTANDARDID' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '041' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Internationalarticlenumbercat' iv_abap_fieldname = 'INTERNATIONALARTICLENUMBERCAT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '042' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productisconfigurable' iv_abap_fieldname = 'PRODUCTISCONFIGURABLE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '043' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Isbatchmanagementrequired' iv_abap_fieldname = 'ISBATCHMANAGEMENTREQUIRED' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '044' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Hasemptiesbom' iv_abap_fieldname = 'HASEMPTIESBOM' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '045' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Externalproductgroup' iv_abap_fieldname = 'EXTERNALPRODUCTGROUP' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '046' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Crossplantconfigurableproduct' iv_abap_fieldname = 'CROSSPLANTCONFIGURABLEPRODUCT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '047' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Serialnoexplicitnesslevel' iv_abap_fieldname = 'SERIALNOEXPLICITNESSLEVEL' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '048' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productmanufacturernumber' iv_abap_fieldname = 'PRODUCTMANUFACTURERNUMBER' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '049' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Manufacturernumber' iv_abap_fieldname = 'MANUFACTURERNUMBER' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '050' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Manufacturerpartprofile' iv_abap_fieldname = 'MANUFACTURERPARTPROFILE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '051' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Qltymgmtinprocmtisactive' iv_abap_fieldname = 'QLTYMGMTINPROCMTISACTIVE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '052' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Isapprovedbatchrecordreqd' iv_abap_fieldname = 'ISAPPROVEDBATCHRECORDREQD' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '053' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Handlingindicator' iv_abap_fieldname = 'HANDLINGINDICATOR' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '054' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Warehouseproductgroup' iv_abap_fieldname = 'WAREHOUSEPRODUCTGROUP' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '055' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Warehousestoragecondition' iv_abap_fieldname = 'WAREHOUSESTORAGECONDITION' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '056' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Standardhandlingunittype' iv_abap_fieldname = 'STANDARDHANDLINGUNITTYPE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '057' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Serialnumberprofile' iv_abap_fieldname = 'SERIALNUMBERPROFILE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '058' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Adjustmentprofile' iv_abap_fieldname = 'ADJUSTMENTPROFILE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '059' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Preferredunitofmeasure' iv_abap_fieldname = 'PREFERREDUNITOFMEASURE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '060' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Ispilferable' iv_abap_fieldname = 'ISPILFERABLE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '061' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Isrelevantforhzdssubstances' iv_abap_fieldname = 'ISRELEVANTFORHZDSSUBSTANCES' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '062' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Quarantineperiod' iv_abap_fieldname = 'QUARANTINEPERIOD' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '063' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Timeunitforquarantineperiod' iv_abap_fieldname = 'TIMEUNITFORQUARANTINEPERIOD' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '064' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Qualityinspectiongroup' iv_abap_fieldname = 'QUALITYINSPECTIONGROUP' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '065' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Handlingunittype' iv_abap_fieldname = 'HANDLINGUNITTYPE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '066' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Hasvariabletareweight' iv_abap_fieldname = 'HASVARIABLETAREWEIGHT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '067' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Maximumpackaginglength' iv_abap_fieldname = 'MAXIMUMPACKAGINGLENGTH' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '068' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 15 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Maximumpackagingwidth' iv_abap_fieldname = 'MAXIMUMPACKAGINGWIDTH' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '069' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 15 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Maximumpackagingheight' iv_abap_fieldname = 'MAXIMUMPACKAGINGHEIGHT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '070' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 15 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Maximumcapacity' iv_abap_fieldname = 'MAXIMUMCAPACITY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '071' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 15 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Overcapacitytolerance' iv_abap_fieldname = 'OVERCAPACITYTOLERANCE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '072' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 1 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Unitformaxpackagingdimensions' iv_abap_fieldname = 'UNITFORMAXPACKAGINGDIMENSIONS' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '073' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Baseunitspecificproductlength' iv_abap_fieldname = 'BASEUNITSPECIFICPRODUCTLENGTH' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '074' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Baseunitspecificproductwidth' iv_abap_fieldname = 'BASEUNITSPECIFICPRODUCTWIDTH' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '075' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Baseunitspecificproductheight' iv_abap_fieldname = 'BASEUNITSPECIFICPRODUCTHEIGHT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '076' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productmeasurementunit' iv_abap_fieldname = 'PRODUCTMEASUREMENTUNIT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '077' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productvalidstartdate' iv_abap_fieldname = 'PRODUCTVALIDSTARTDATE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '078' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Articlecategory' iv_abap_fieldname = 'ARTICLECATEGORY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '079' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Contentunit' iv_abap_fieldname = 'CONTENTUNIT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '080' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Netcontent' iv_abap_fieldname = 'NETCONTENT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '081' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Comparisonpricequantity' iv_abap_fieldname = 'COMPARISONPRICEQUANTITY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '082' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_maxlength( iv_max_length = 5 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Grosscontent' iv_abap_fieldname = 'GROSSCONTENT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '083' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productvalidenddate' iv_abap_fieldname = 'PRODUCTVALIDENDDATE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '084' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Assortmentlisttype' iv_abap_fieldname = 'ASSORTMENTLISTTYPE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '085' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Hastextilepartswthanimalorigin' iv_abap_fieldname = 'HASTEXTILEPARTSWTHANIMALORIGIN' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '086' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productseasonusagecategory' iv_abap_fieldname = 'PRODUCTSEASONUSAGECATEGORY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '087' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Industrysector' iv_abap_fieldname = 'INDUSTRYSECTOR' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '088' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Changenumber' iv_abap_fieldname = 'CHANGENUMBER' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '089' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 12 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Materialrevisionlevel' iv_abap_fieldname = 'MATERIALREVISIONLEVEL' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '090' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Isactiveentity' iv_abap_fieldname = 'ISACTIVEENTITY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '091' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lastchangedatetime' iv_abap_fieldname = 'LASTCHANGEDATETIME' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '092' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Lastchangetime' iv_abap_fieldname = 'LASTCHANGETIME' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '093' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_time( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Dangerousgoodsindprofile' iv_abap_fieldname = 'DANGEROUSGOODSINDPROFILE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '094' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productuuid' iv_abap_fieldname = 'PRODUCTUUID' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '095' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_guid( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodsupchnmgmtuuid22' iv_abap_fieldname = 'PRODSUPCHNMGMTUUID22' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '096' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 22 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentchangenumber' iv_abap_fieldname = 'PRODUCTDOCUMENTCHANGENUMBER' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '097' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 6 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentpagecount' iv_abap_fieldname = 'PRODUCTDOCUMENTPAGECOUNT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '098' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentpagenumber' iv_abap_fieldname = 'PRODUCTDOCUMENTPAGENUMBER' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '099' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Owninventorymanagedproduct' iv_abap_fieldname = 'OWNINVENTORYMANAGEDPRODUCT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '100' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Documentiscreatedbycad' iv_abap_fieldname = 'DOCUMENTISCREATEDBYCAD' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '101' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productionorinspectionmemotxt' iv_abap_fieldname = 'PRODUCTIONORINSPECTIONMEMOTXT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '102' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productionmemopageformat' iv_abap_fieldname = 'PRODUCTIONMEMOPAGEFORMAT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '103' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Globaltradeitemnumbervariant' iv_abap_fieldname = 'GLOBALTRADEITEMNUMBERVARIANT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '104' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productishighlyviscous' iv_abap_fieldname = 'PRODUCTISHIGHLYVISCOUS' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '105' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Transportisinbulk' iv_abap_fieldname = 'TRANSPORTISINBULK' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '106' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodallocdetnprocedure' iv_abap_fieldname = 'PRODALLOCDETNPROCEDURE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '107' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodeffctyparamvalsareassigned' iv_abap_fieldname = 'PRODEFFCTYPARAMVALSAREASSIGNED' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '108' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Prodisenvironmentallyrelevant' iv_abap_fieldname = 'PRODISENVIRONMENTALLYRELEVANT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '109' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Laboratoryordesignoffice' iv_abap_fieldname = 'LABORATORYORDESIGNOFFICE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '110' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Packagingmaterialgroup' iv_abap_fieldname = 'PACKAGINGMATERIALGROUP' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '111' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productislocked' iv_abap_fieldname = 'PRODUCTISLOCKED' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '112' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Discountinkindeligibility' iv_abap_fieldname = 'DISCOUNTINKINDELIGIBILITY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '113' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Smartformname' iv_abap_fieldname = 'SMARTFORMNAME' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '114' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 30 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Packingreferenceproduct' iv_abap_fieldname = 'PACKINGREFERENCEPRODUCT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '115' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Basicmaterial' iv_abap_fieldname = 'BASICMATERIAL' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '116' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 48 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentnumber' iv_abap_fieldname = 'PRODUCTDOCUMENTNUMBER' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '117' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 22 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentversion' iv_abap_fieldname = 'PRODUCTDOCUMENTVERSION' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '118' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 2 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumenttype' iv_abap_fieldname = 'PRODUCTDOCUMENTTYPE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '119' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productdocumentpageformat' iv_abap_fieldname = 'PRODUCTDOCUMENTPAGEFORMAT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '120' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productconfiguration' iv_abap_fieldname = 'PRODUCTCONFIGURATION' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '121' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 18 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Segmentationstrategy' iv_abap_fieldname = 'SEGMENTATIONSTRATEGY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '122' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 8 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Segmentationisrelevant' iv_abap_fieldname = 'SEGMENTATIONISRELEVANT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '123' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Logisticalproductcategory' iv_abap_fieldname = 'LOGISTICALPRODUCTCATEGORY' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '124' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Salesproduct' iv_abap_fieldname = 'SALESPRODUCT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '125' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Productname' iv_abap_fieldname = 'PRODUCTNAME' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '126' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'IsLocked' iv_abap_fieldname = 'ISLOCKED' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '127' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'ErrMsg' iv_abap_fieldname = 'ERRMSG' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '128' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).

lo_entity_type->bind_structure( iv_structure_name  = '/DLWUPEX/CL_PRODUCT_01_MPC=>TS_PRODUCTS' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'PRODUCTSSet' ). "#EC NOTEXT

lo_entity_set->set_creatable( abap_false ).
lo_entity_set->set_updatable( abap_false ).
lo_entity_set->set_deletable( abap_false ).

lo_entity_set->set_pageable( abap_false ).
lo_entity_set->set_addressable( abap_true ).
lo_entity_set->set_has_ftxt_search( abap_false ).
lo_entity_set->set_subscribable( abap_false ).
lo_entity_set->set_filter_required( abap_false ).
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20191115204849'.                  "#EC NOTEXT
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
  endmethod.


  method LOAD_TEXT_ELEMENTS.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


DATA:
     ls_text_element TYPE ts_text_element.                                 "#EC NEEDED
CLEAR ls_text_element.


clear ls_text_element.
ls_text_element-artifact_name          = 'Product'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '001'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productexternalid'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '002'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Producttype'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '003'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Creationdate'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '004'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Createdbyuser'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '005'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Lastchangedate'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '006'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Lastchangedbyuser'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '007'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Ismarkedfordeletion'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '008'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Crossplantstatus'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '009'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Crossplantstatusvaliditydate'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '010'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productoldid'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '011'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Grossweight'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '012'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Purchaseorderquantityunit'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '013'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Sourceofsupply'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '014'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Weightunit'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '015'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Countryoforigin'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '016'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Competitorid'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '017'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productgroup'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '018'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Baseunit'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '019'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Itemcategorygroup'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '020'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Netweight'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '021'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Producthierarchy'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '022'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Division'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '023'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Varblpurordunitisactive'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '024'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Volumeunit'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '025'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Materialvolume'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '026'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Salesstatus'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '027'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Transportationgroup'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '028'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Salesstatusvaliditydate'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '029'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Authorizationgroup'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '030'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Anpcode'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '031'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productcategory'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '032'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Brand'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '033'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Procurementrule'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '034'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Validitystartdate'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '035'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Lowlevelcode'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '036'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Prodnoingenprodinprepackprod'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '037'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Serialidentifierassgmtprofile'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '038'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Sizeordimensiontext'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '039'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Industrystandardname'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '040'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productstandardid'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '041'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Internationalarticlenumbercat'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '042'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productisconfigurable'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '043'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Isbatchmanagementrequired'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '044'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Hasemptiesbom'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '045'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Externalproductgroup'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '046'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Crossplantconfigurableproduct'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '047'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Serialnoexplicitnesslevel'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '048'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productmanufacturernumber'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '049'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Manufacturernumber'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '050'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Manufacturerpartprofile'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '051'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Qltymgmtinprocmtisactive'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '052'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Isapprovedbatchrecordreqd'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '053'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Handlingindicator'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '054'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Warehouseproductgroup'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '055'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Warehousestoragecondition'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '056'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Standardhandlingunittype'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '057'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Serialnumberprofile'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '058'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Adjustmentprofile'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '059'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Preferredunitofmeasure'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '060'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Ispilferable'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '061'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Isrelevantforhzdssubstances'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '062'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Quarantineperiod'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '063'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Timeunitforquarantineperiod'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '064'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Qualityinspectiongroup'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '065'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Handlingunittype'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '066'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Hasvariabletareweight'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '067'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Maximumpackaginglength'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '068'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Maximumpackagingwidth'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '069'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Maximumpackagingheight'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '070'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Maximumcapacity'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '071'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Overcapacitytolerance'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '072'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Unitformaxpackagingdimensions'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '073'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Baseunitspecificproductlength'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '074'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Baseunitspecificproductwidth'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '075'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Baseunitspecificproductheight'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '076'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productmeasurementunit'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '077'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productvalidstartdate'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '078'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Articlecategory'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '079'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Contentunit'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '080'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Netcontent'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '081'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Comparisonpricequantity'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '082'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Grosscontent'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '083'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productvalidenddate'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '084'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Assortmentlisttype'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '085'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Hastextilepartswthanimalorigin'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '086'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productseasonusagecategory'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '087'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Industrysector'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '088'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Changenumber'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '089'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Materialrevisionlevel'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '090'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Isactiveentity'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '091'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Lastchangedatetime'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '092'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Lastchangetime'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '093'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Dangerousgoodsindprofile'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '094'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productuuid'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '095'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Prodsupchnmgmtuuid22'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '096'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productdocumentchangenumber'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '097'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productdocumentpagecount'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '098'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productdocumentpagenumber'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '099'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Owninventorymanagedproduct'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '100'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Documentiscreatedbycad'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '101'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productionorinspectionmemotxt'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '102'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productionmemopageformat'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '103'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Globaltradeitemnumbervariant'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '104'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productishighlyviscous'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '105'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Transportisinbulk'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '106'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Prodallocdetnprocedure'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '107'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Prodeffctyparamvalsareassigned'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '108'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Prodisenvironmentallyrelevant'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '109'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Laboratoryordesignoffice'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '110'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Packagingmaterialgroup'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '111'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productislocked'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '112'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Discountinkindeligibility'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '113'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Smartformname'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '114'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Packingreferenceproduct'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '115'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Basicmaterial'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '116'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productdocumentnumber'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '117'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productdocumentversion'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '118'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productdocumenttype'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '119'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productdocumentpageformat'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '120'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productconfiguration'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '121'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Segmentationstrategy'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '122'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Segmentationisrelevant'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '123'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Logisticalproductcategory'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '124'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Salesproduct'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '125'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Productname'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '126'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'IsLocked'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '127'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'ErrMsg'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'PRODUCTS'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '128'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
  endmethod.
ENDCLASS.
