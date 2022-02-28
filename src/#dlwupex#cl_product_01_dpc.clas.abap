class /DLWUPEX/CL_PRODUCT_01_DPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_DATA
  abstract
  create public .

public section.

  interfaces /IWBEP/IF_SB_DPC_COMM_SERVICES .
  interfaces /IWBEP/IF_SB_GEN_DPC_INJECTION .
  interfaces IF_SADL_GW_DPC_UTIL .
  interfaces IF_SADL_GW_EXTENSION_CONTROL .
  interfaces IF_SADL_GW_QUERY_CONTROL .

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~EXECUTE_ACTION
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_IS_CONDITIONAL_IMPLEMENTED
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_IS_CONDI_IMPLE_FOR_ACTION
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~PATCH_ENTITY
    redefinition .
protected section.

  data mo_injection type ref to /IWBEP/IF_SB_GEN_DPC_INJECTION .

  methods GENERALDATASET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type /DLWUPEX/CL_PRODUCT_01_MPC=>TS_GENERALDATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GENERALDATASET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GENERALDATASET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type /DLWUPEX/CL_PRODUCT_01_MPC=>TS_GENERALDATA
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GENERALDATASET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type /DLWUPEX/CL_PRODUCT_01_MPC=>TT_GENERALDATA
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GENERALDATASET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type /DLWUPEX/CL_PRODUCT_01_MPC=>TS_GENERALDATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSSET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type /DLWUPEX/CL_PRODUCT_01_MPC=>TS_PRODUCTS
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSSET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSSET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type /DLWUPEX/CL_PRODUCT_01_MPC=>TS_PRODUCTS
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSSET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type /DLWUPEX/CL_PRODUCT_01_MPC=>TT_PRODUCTS
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSSET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type /DLWUPEX/CL_PRODUCT_01_MPC=>TS_PRODUCTS
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .

  methods CHECK_SUBSCRIPTION_AUTHORITY
    redefinition .
private section.
ENDCLASS.



CLASS /DLWUPEX/CL_PRODUCT_01_DPC IMPLEMENTATION.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY.
    CAST /iwbep/if_mgw_appl_srv_runtime( if_sadl_gw_dpc_util~get_dpc( ) )->create_deep_entity(
                   EXPORTING io_tech_request_context = io_tech_request_context
                             io_data_provider        = io_data_provider
                             io_expand               = io_expand
                   IMPORTING er_deep_entity          = er_deep_entity ).
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_CRT_ENTITY_BASE
*&* This class has been generated on 15.11.2019 21:48:51 in client 030
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - /DLWUPEX/CL_PRODUCT_01_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA productsset_create_entity TYPE /dlwupex/cl_product_01_mpc=>ts_products.
 DATA generaldataset_create_entity TYPE /dlwupex/cl_product_01_mpc=>ts_generaldata.
 DATA lv_entityset_name TYPE string.

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  PRODUCTSSet
*-------------------------------------------------------------------------*
     WHEN 'PRODUCTSSet'.
*     Call the entity set generated method
    productsset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = productsset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = productsset_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  GeneralDataSet
*-------------------------------------------------------------------------*
     WHEN 'GeneralDataSet'.
*     Call the entity set generated method
    generaldataset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = generaldataset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = generaldataset_create_entity
      CHANGING
        cr_data = er_entity
   ).

  when others.
    super->/iwbep/if_mgw_appl_srv_runtime~create_entity(
       EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         io_data_provider   = io_data_provider
         it_key_tab = it_key_tab
         it_navigation_path = it_navigation_path
      IMPORTING
        er_entity = er_entity
  ).
ENDCASE.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_DEL_ENTITY_BASE
*&* This class has been generated on 15.11.2019 21:48:51 in client 030
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - /DLWUPEX/CL_PRODUCT_01_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA lv_entityset_name TYPE string.

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  PRODUCTSSet
*-------------------------------------------------------------------------*
      when 'PRODUCTSSet'.
*     Call the entity set generated method
     productsset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  GeneralDataSet
*-------------------------------------------------------------------------*
      when 'GeneralDataSet'.
*     Call the entity set generated method
     generaldataset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

   when others.
     super->/iwbep/if_mgw_appl_srv_runtime~delete_entity(
        EXPORTING
          iv_entity_name = iv_entity_name
          iv_entity_set_name = iv_entity_set_name
          iv_source_name = iv_source_name
          it_key_tab = it_key_tab
          it_navigation_path = it_navigation_path
 ).
 ENDCASE.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~EXECUTE_ACTION.
    if_sadl_gw_dpc_util~get_dpc( )->execute_action( EXPORTING io_tech_request_context = io_tech_request_context
                                                    IMPORTING er_data                 = er_data ).
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY.
*&-----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_GETENTITY_BASE
*&* This class has been generated  on 15.11.2019 21:48:51 in client 030
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - /DLWUPEX/CL_PRODUCT_01_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA productsset_get_entity TYPE /dlwupex/cl_product_01_mpc=>ts_products.
 DATA generaldataset_get_entity TYPE /dlwupex/cl_product_01_mpc=>ts_generaldata.
 DATA lv_entityset_name TYPE string.
 DATA lr_entity TYPE REF TO data.       "#EC NEEDED

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  PRODUCTSSet
*-------------------------------------------------------------------------*
      WHEN 'PRODUCTSSet'.
*     Call the entity set generated method
          productsset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = productsset_get_entity
                         es_response_context = es_response_context
          ).

        IF productsset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = productsset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  GeneralDataSet
*-------------------------------------------------------------------------*
      WHEN 'GeneralDataSet'.
*     Call the entity set generated method
          generaldataset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = generaldataset_get_entity
                         es_response_context = es_response_context
          ).

        IF generaldataset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = generaldataset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.

      WHEN OTHERS.
        super->/iwbep/if_mgw_appl_srv_runtime~get_entity(
           EXPORTING
             iv_entity_name = iv_entity_name
             iv_entity_set_name = iv_entity_set_name
             iv_source_name = iv_source_name
             it_key_tab = it_key_tab
             it_navigation_path = it_navigation_path
          IMPORTING
            er_entity = er_entity
    ).
 ENDCASE.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TMP_ENTITYSET_BASE
*&* This class has been generated on 15.11.2019 21:48:51 in client 030
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - /DLWUPEX/CL_PRODUCT_01_DPC_EXT
*&-----------------------------------------------------------------------------------------------*
 DATA productsset_get_entityset TYPE /dlwupex/cl_product_01_mpc=>tt_products.
 DATA generaldataset_get_entityset TYPE /dlwupex/cl_product_01_mpc=>tt_generaldata.
 DATA lv_entityset_name TYPE string.

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  PRODUCTSSet
*-------------------------------------------------------------------------*
   WHEN 'PRODUCTSSet'.
*     Call the entity set generated method
      productsset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = productsset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = productsset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  GeneralDataSet
*-------------------------------------------------------------------------*
   WHEN 'GeneralDataSet'.
*     Call the entity set generated method
      generaldataset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = generaldataset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = generaldataset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

    WHEN OTHERS.
      super->/iwbep/if_mgw_appl_srv_runtime~get_entityset(
        EXPORTING
          iv_entity_name = iv_entity_name
          iv_entity_set_name = iv_entity_set_name
          iv_source_name = iv_source_name
          it_filter_select_options = it_filter_select_options
          it_order = it_order
          is_paging = is_paging
          it_navigation_path = it_navigation_path
          it_key_tab = it_key_tab
          iv_filter_string = iv_filter_string
          iv_search_string = iv_search_string
          io_tech_request_context = io_tech_request_context
       IMPORTING
         er_entityset = er_entityset ).
 ENDCASE.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_IS_CONDITIONAL_IMPLEMENTED.
    TRY.
        rv_conditional_active = if_sadl_gw_dpc_util~get_dpc( )->get_is_conditional_implemented(
                                               iv_operation_type  = iv_operation_type
                                               iv_entity_set_name = iv_entity_set_name ).
      CATCH /iwbep/cx_mgw_tech_exception /iwbep/cx_mgw_busi_exception.
        rv_conditional_active = super->/iwbep/if_mgw_appl_srv_runtime~get_is_conditional_implemented(
                                       iv_operation_type     = iv_operation_type
                                       iv_entity_set_name    = iv_entity_set_name ).
    ENDTRY.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_IS_CONDI_IMPLE_FOR_ACTION.
    TRY.
        rv_conditional_active = if_sadl_gw_dpc_util~get_dpc( )->get_is_condi_imple_for_action( iv_action_name ).
      CATCH /iwbep/cx_mgw_tech_exception /iwbep/cx_mgw_busi_exception.
        rv_conditional_active = super->/iwbep/if_mgw_appl_srv_runtime~get_is_condi_imple_for_action( iv_action_name ).
    ENDTRY.
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~PATCH_ENTITY.
        super->/iwbep/if_mgw_appl_srv_runtime~patch_entity(
                       EXPORTING io_tech_request_context = io_tech_request_context
                                 io_data_provider        = io_data_provider
                                 iv_entity_name          = iv_entity_name
                                 iv_entity_set_name      = iv_entity_set_name
                                 iv_source_name          = iv_source_name
                                 it_key_tab              = it_key_tab
                                 it_navigation_path      = it_navigation_path
                       IMPORTING er_entity               = er_entity  ).
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_UPD_ENTITY_BASE
*&* This class has been generated on 15.11.2019 21:48:51 in client 030
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - /DLWUPEX/CL_PRODUCT_01_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA productsset_update_entity TYPE /dlwupex/cl_product_01_mpc=>ts_products.
 DATA generaldataset_update_entity TYPE /dlwupex/cl_product_01_mpc=>ts_generaldata.
 DATA lv_entityset_name TYPE string.
 DATA lr_entity TYPE REF TO data. "#EC NEEDED

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  PRODUCTSSet
*-------------------------------------------------------------------------*
      WHEN 'PRODUCTSSet'.
*     Call the entity set generated method
          productsset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = productsset_update_entity
          ).
       IF productsset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = productsset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  GeneralDataSet
*-------------------------------------------------------------------------*
      WHEN 'GeneralDataSet'.
*     Call the entity set generated method
          generaldataset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = generaldataset_update_entity
          ).
       IF generaldataset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = generaldataset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
      WHEN OTHERS.
        super->/iwbep/if_mgw_appl_srv_runtime~update_entity(
           EXPORTING
             iv_entity_name = iv_entity_name
             iv_entity_set_name = iv_entity_set_name
             iv_source_name = iv_source_name
             io_data_provider   = io_data_provider
             it_key_tab = it_key_tab
             it_navigation_path = it_navigation_path
          IMPORTING
            er_entity = er_entity
    ).
 ENDCASE.
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~COMMIT_WORK.
* Call RFC commit work functionality
DATA lt_message      TYPE bapiret2. "#EC NEEDED
DATA lv_message_text TYPE BAPI_MSG.
DATA lo_logger       TYPE REF TO /iwbep/cl_cos_logger.
DATA lv_subrc        TYPE syst-subrc.

lo_logger = /iwbep/if_mgw_conv_srv_runtime~get_logger( ).

  IF iv_rfc_dest IS INITIAL OR iv_rfc_dest EQ 'NONE'.
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      EXPORTING
      wait   = abap_true
    IMPORTING
      return = lt_message.
  ELSE.
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      DESTINATION iv_rfc_dest
    EXPORTING
      wait                  = abap_true
    IMPORTING
      return                = lt_message
    EXCEPTIONS
      communication_failure = 1000 MESSAGE lv_message_text
      system_failure        = 1001 MESSAGE lv_message_text
      OTHERS                = 1002.

  IF sy-subrc <> 0.
    lv_subrc = sy-subrc.
    /iwbep/cl_sb_gen_dpc_rt_util=>rfc_exception_handling(
        EXPORTING
          iv_subrc            = lv_subrc
          iv_exp_message_text = lv_message_text
          io_logger           = lo_logger ).
  ENDIF.
  ENDIF.
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~GET_GENERATION_STRATEGY.
* Get generation strategy
  rv_generation_strategy = '1'.
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~LOG_MESSAGE.
* Log message in the application log
DATA lo_logger TYPE REF TO /iwbep/cl_cos_logger.
DATA lv_text TYPE /iwbep/sup_msg_longtext.

  MESSAGE ID iv_msg_id TYPE iv_msg_type NUMBER iv_msg_number
    WITH iv_msg_v1 iv_msg_v2 iv_msg_v3 iv_msg_v4 INTO lv_text.

  lo_logger = mo_context->get_logger( ).
  lo_logger->log_message(
    EXPORTING
     iv_msg_type   = iv_msg_type
     iv_msg_id     = iv_msg_id
     iv_msg_number = iv_msg_number
     iv_msg_text   = lv_text
     iv_msg_v1     = iv_msg_v1
     iv_msg_v2     = iv_msg_v2
     iv_msg_v3     = iv_msg_v3
     iv_msg_v4     = iv_msg_v4
     iv_agent      = 'DPC' ).
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~RFC_EXCEPTION_HANDLING.
* RFC call exception handling
DATA lo_logger  TYPE REF TO /iwbep/cl_cos_logger.

lo_logger = /iwbep/if_mgw_conv_srv_runtime~get_logger( ).

/iwbep/cl_sb_gen_dpc_rt_util=>rfc_exception_handling(
  EXPORTING
    iv_subrc            = iv_subrc
    iv_exp_message_text = iv_exp_message_text
    io_logger           = lo_logger ).
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~RFC_SAVE_LOG.
  DATA lo_logger  TYPE REF TO /iwbep/cl_cos_logger.
  DATA lo_message_container TYPE REF TO /iwbep/if_message_container.

  lo_logger = /iwbep/if_mgw_conv_srv_runtime~get_logger( ).
  lo_message_container = /iwbep/if_mgw_conv_srv_runtime~get_message_container( ).

  " Save the RFC call log in the application log
  /iwbep/cl_sb_gen_dpc_rt_util=>rfc_save_log(
    EXPORTING
      is_return            = is_return
      iv_entity_type       = iv_entity_type
      it_return            = it_return
      it_key_tab           = it_key_tab
      io_logger            = lo_logger
      io_message_container = lo_message_container ).
  endmethod.


  method /IWBEP/IF_SB_DPC_COMM_SERVICES~SET_INJECTION.
* Unit test injection
  IF io_unit IS BOUND.
    mo_injection = io_unit.
  ELSE.
    mo_injection = me.
  ENDIF.
  endmethod.


  method CHECK_SUBSCRIPTION_AUTHORITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'CHECK_SUBSCRIPTION_AUTHORITY'.
  endmethod.


  method GENERALDATASET_CREATE_ENTITY.
    if_sadl_gw_dpc_util~get_dpc( )->create_entity( EXPORTING io_data_provider        = io_data_provider
                                                             io_tech_request_context = io_tech_request_context
                                                   IMPORTING es_data                 = er_entity ).
  endmethod.


  method GENERALDATASET_DELETE_ENTITY.
    if_sadl_gw_dpc_util~get_dpc( )->delete_entity( io_tech_request_context ).
  endmethod.


  method GENERALDATASET_GET_ENTITY.
    if_sadl_gw_dpc_util~get_dpc( )->get_entity( EXPORTING io_tech_request_context = io_tech_request_context
                                                IMPORTING es_data                 = er_entity ).
  endmethod.


  method GENERALDATASET_GET_ENTITYSET.
    if_sadl_gw_dpc_util~get_dpc( )->get_entityset( EXPORTING io_tech_request_context = io_tech_request_context
                                                   IMPORTING et_data                 = et_entityset
                                                             es_response_context     = es_response_context ).
  endmethod.


  method GENERALDATASET_UPDATE_ENTITY.
    if_sadl_gw_dpc_util~get_dpc( )->update_entity( EXPORTING io_tech_request_context = io_tech_request_context
                                                             io_data_provider        = io_data_provider
                                                   IMPORTING es_data                 = er_entity ).
  endmethod.


  method IF_SADL_GW_DPC_UTIL~GET_DPC.
    TYPES ty_/dlwupex/gdatacds_1 TYPE /dlwupex/gdatacds ##NEEDED. " reference for where-used list

    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>| &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="V2" >| &
               | <sadl:dataSource type="CDS" name="GeneralDataSet" binding="/DLWUPEX/GDATACDS" />| &
               |<sadl:resultSet>| &
               |<sadl:structure name="GeneralDataSet" dataSource="GeneralDataSet" maxEditMode="RO" >| &
               | <sadl:query name="EntitySetDefault">| &
               | </sadl:query>| &
               | <sadl:attribute name="PRODUCTISHIGHLYVISCOUS" binding="PRODUCTISHIGHLYVISCOUS" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="BASEUNITSPECIFICPRODUCTLENGTH" binding="BASEUNITSPECIFICPRODUCTLENGTH" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="BASEUNITSPECIFICPRODUCTWIDTH" binding="BASEUNITSPECIFICPRODUCTWIDTH" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="BASEUNITSPECIFICPRODUCTHEIGHT" binding="BASEUNITSPECIFICPRODUCTHEIGHT" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTMEASUREMENTUNIT" binding="PRODUCTMEASUREMENTUNIT" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTVALIDSTARTDATE" binding="PRODUCTVALIDSTARTDATE" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="ARTICLECATEGORY" binding="ARTICLECATEGORY" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="ISMARKEDFORDELETION" binding="ISMARKEDFORDELETION" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="CONTENTUNIT" binding="CONTENTUNIT" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="NETCONTENT" binding="NETCONTENT" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="COMPARISONPRICEQUANTITY" binding="COMPARISONPRICEQUANTITY" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="TRANSPORTISINBULK" binding="TRANSPORTISINBULK" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="GROSSCONTENT" binding="GROSSCONTENT" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTVALIDENDDATE" binding="PRODUCTVALIDENDDATE" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="ASSORTMENTLISTTYPE" binding="ASSORTMENTLISTTYPE" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="HASTEXTILEPARTSWTHANIMALORIGIN" binding="HASTEXTILEPARTSWTHANIMALORIGIN" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTSEASONUSAGECATEGORY" binding="PRODUCTSEASONUSAGECATEGORY" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="INDUSTRYSECTOR" binding="INDUSTRYSECTOR" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="CHANGENUMBER" binding="CHANGENUMBER" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="CROSSPLANTSTATUS" binding="CROSSPLANTSTATUS" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="MATERIALREVISIONLEVEL" binding="MATERIALREVISIONLEVEL" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="ISACTIVEENTITY" binding="ISACTIVEENTITY" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODALLOCDETNPROCEDURE" binding="PRODALLOCDETNPROCEDURE" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="LASTCHANGEDATETIME" binding="LASTCHANGEDATETIME" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="LASTCHANGETIME" binding="LASTCHANGETIME" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="DANGEROUSGOODSINDPROFILE" binding="DANGEROUSGOODSINDPROFILE" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTUUID" binding="PRODUCTUUID" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODSUPCHNMGMTUUID22" binding="PRODSUPCHNMGMTUUID22" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTDOCUMENTCHANGENUMBER" binding="PRODUCTDOCUMENTCHANGENUMBER" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTDOCUMENTPAGECOUNT" binding="PRODUCTDOCUMENTPAGECOUNT" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTDOCUMENTPAGENUMBER" binding="PRODUCTDOCUMENTPAGENUMBER" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODEFFCTYPARAMVALSAREASSIGNED" binding="PRODEFFCTYPARAMVALSAREASSIGNED" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODISENVIRONMENTALLYRELEVANT" binding="PRODISENVIRONMENTALLYRELEVANT" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTOLDID" binding="PRODUCTOLDID" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="LABORATORYORDESIGNOFFICE" binding="LABORATORYORDESIGNOFFICE" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PACKAGINGMATERIALGROUP" binding="PACKAGINGMATERIALGROUP" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTISLOCKED" binding="PRODUCTISLOCKED" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="DISCOUNTINKINDELIGIBILITY" binding="DISCOUNTINKINDELIGIBILITY" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="SMARTFORMNAME" binding="SMARTFORMNAME" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PACKINGREFERENCEPRODUCT" binding="PACKINGREFERENCEPRODUCT" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="BASICMATERIAL" binding="BASICMATERIAL" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTDOCUMENTNUMBER" binding="PRODUCTDOCUMENTNUMBER" isOutput="TRUE" isKey="FALSE" />| &
               | <sadl:attribute name="PRODUCTDOCUMENTVERSION" binding="PRODUCTDOCUMENTVERSION" isOutput="TRUE" isKey="FALSE" />| .
    lv_sadl_xml = |{ lv_sadl_xml }| &
             | <sadl:attribute name="PRODUCTDOCUMENTTYPE" binding="PRODUCTDOCUMENTTYPE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="GROSSWEIGHT" binding="GROSSWEIGHT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTDOCUMENTPAGEFORMAT" binding="PRODUCTDOCUMENTPAGEFORMAT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTCONFIGURATION" binding="PRODUCTCONFIGURATION" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="SEGMENTATIONSTRATEGY" binding="SEGMENTATIONSTRATEGY" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCT" binding="PRODUCT" isOutput="TRUE" isKey="TRUE" />| &
             | <sadl:attribute name="SEGMENTATIONISRELEVANT" binding="SEGMENTATIONISRELEVANT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="LOGISTICALPRODUCTCATEGORY" binding="LOGISTICALPRODUCTCATEGORY" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="SALESPRODUCT" binding="SALESPRODUCT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PURCHASEORDERQUANTITYUNIT" binding="PURCHASEORDERQUANTITYUNIT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="SOURCEOFSUPPLY" binding="SOURCEOFSUPPLY" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="WEIGHTUNIT" binding="WEIGHTUNIT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="COUNTRYOFORIGIN" binding="COUNTRYOFORIGIN" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="COMPETITORID" binding="COMPETITORID" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTGROUP" binding="PRODUCTGROUP" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="BASEUNIT" binding="BASEUNIT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="CROSSPLANTSTATUSVALIDITYDATE" binding="CROSSPLANTSTATUSVALIDITYDATE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTEXTERNALID" binding="PRODUCTEXTERNALID" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="ITEMCATEGORYGROUP" binding="ITEMCATEGORYGROUP" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="NETWEIGHT" binding="NETWEIGHT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTHIERARCHY" binding="PRODUCTHIERARCHY" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="DIVISION" binding="DIVISION" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="VARBLPURORDUNITISACTIVE" binding="VARBLPURORDUNITISACTIVE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="VOLUMEUNIT" binding="VOLUMEUNIT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="MATERIALVOLUME" binding="MATERIALVOLUME" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="SALESSTATUS" binding="SALESSTATUS" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="TRANSPORTATIONGROUP" binding="TRANSPORTATIONGROUP" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="OWNINVENTORYMANAGEDPRODUCT" binding="OWNINVENTORYMANAGEDPRODUCT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="SALESSTATUSVALIDITYDATE" binding="SALESSTATUSVALIDITYDATE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTTYPE" binding="PRODUCTTYPE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="AUTHORIZATIONGROUP" binding="AUTHORIZATIONGROUP" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="ANPCODE" binding="ANPCODE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTCATEGORY" binding="PRODUCTCATEGORY" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="BRAND" binding="BRAND" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PROCUREMENTRULE" binding="PROCUREMENTRULE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="VALIDITYSTARTDATE" binding="VALIDITYSTARTDATE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="LOWLEVELCODE" binding="LOWLEVELCODE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODNOINGENPRODINPREPACKPROD" binding="PRODNOINGENPRODINPREPACKPROD" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="DOCUMENTISCREATEDBYCAD" binding="DOCUMENTISCREATEDBYCAD" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="SERIALIDENTIFIERASSGMTPROFILE" binding="SERIALIDENTIFIERASSGMTPROFILE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="SIZEORDIMENSIONTEXT" binding="SIZEORDIMENSIONTEXT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="CREATIONDATE" binding="CREATIONDATE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="INDUSTRYSTANDARDNAME" binding="INDUSTRYSTANDARDNAME" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTSTANDARDID" binding="PRODUCTSTANDARDID" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="INTERNATIONALARTICLENUMBERCAT" binding="INTERNATIONALARTICLENUMBERCAT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTISCONFIGURABLE" binding="PRODUCTISCONFIGURABLE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="ISBATCHMANAGEMENTREQUIRED" binding="ISBATCHMANAGEMENTREQUIRED" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="HASEMPTIESBOM" binding="HASEMPTIESBOM" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="EXTERNALPRODUCTGROUP" binding="EXTERNALPRODUCTGROUP" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTIONORINSPECTIONMEMOTXT" binding="PRODUCTIONORINSPECTIONMEMOTXT" isOutput="TRUE" isKey="FALSE" />| .
    lv_sadl_xml = |{ lv_sadl_xml }| &
             | <sadl:attribute name="CROSSPLANTCONFIGURABLEPRODUCT" binding="CROSSPLANTCONFIGURABLEPRODUCT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="SERIALNOEXPLICITNESSLEVEL" binding="SERIALNOEXPLICITNESSLEVEL" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTMANUFACTURERNUMBER" binding="PRODUCTMANUFACTURERNUMBER" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="CREATEDBYUSER" binding="CREATEDBYUSER" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="MANUFACTURERNUMBER" binding="MANUFACTURERNUMBER" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="MANUFACTURERPARTPROFILE" binding="MANUFACTURERPARTPROFILE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="QLTYMGMTINPROCMTISACTIVE" binding="QLTYMGMTINPROCMTISACTIVE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="ISAPPROVEDBATCHRECORDREQD" binding="ISAPPROVEDBATCHRECORDREQD" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="HANDLINGINDICATOR" binding="HANDLINGINDICATOR" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="WAREHOUSEPRODUCTGROUP" binding="WAREHOUSEPRODUCTGROUP" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PRODUCTIONMEMOPAGEFORMAT" binding="PRODUCTIONMEMOPAGEFORMAT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="WAREHOUSESTORAGECONDITION" binding="WAREHOUSESTORAGECONDITION" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="STANDARDHANDLINGUNITTYPE" binding="STANDARDHANDLINGUNITTYPE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="SERIALNUMBERPROFILE" binding="SERIALNUMBERPROFILE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="ADJUSTMENTPROFILE" binding="ADJUSTMENTPROFILE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="LASTCHANGEDATE" binding="LASTCHANGEDATE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="PREFERREDUNITOFMEASURE" binding="PREFERREDUNITOFMEASURE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="ISPILFERABLE" binding="ISPILFERABLE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="ISRELEVANTFORHZDSSUBSTANCES" binding="ISRELEVANTFORHZDSSUBSTANCES" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="QUARANTINEPERIOD" binding="QUARANTINEPERIOD" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="TIMEUNITFORQUARANTINEPERIOD" binding="TIMEUNITFORQUARANTINEPERIOD" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="GLOBALTRADEITEMNUMBERVARIANT" binding="GLOBALTRADEITEMNUMBERVARIANT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="QUALITYINSPECTIONGROUP" binding="QUALITYINSPECTIONGROUP" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="HANDLINGUNITTYPE" binding="HANDLINGUNITTYPE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="HASVARIABLETAREWEIGHT" binding="HASVARIABLETAREWEIGHT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="MAXIMUMPACKAGINGLENGTH" binding="MAXIMUMPACKAGINGLENGTH" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="MAXIMUMPACKAGINGWIDTH" binding="MAXIMUMPACKAGINGWIDTH" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="LASTCHANGEDBYUSER" binding="LASTCHANGEDBYUSER" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="MAXIMUMPACKAGINGHEIGHT" binding="MAXIMUMPACKAGINGHEIGHT" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="MAXIMUMCAPACITY" binding="MAXIMUMCAPACITY" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="OVERCAPACITYTOLERANCE" binding="OVERCAPACITYTOLERANCE" isOutput="TRUE" isKey="FALSE" />| &
             | <sadl:attribute name="UNITFORMAXPACKAGINGDIMENSIONS" binding="UNITFORMAXPACKAGINGDIMENSIONS" isOutput="TRUE" isKey="FALSE" />| &
             |</sadl:structure>| &
             |</sadl:resultSet>| &
             |</sadl:definition>| .
    ro_dpc = cl_sadl_gw_dpc_factory=>create_for_sadl( iv_sadl_xml   = lv_sadl_xml
               iv_timestamp         = 20191115204854
               iv_uuid              = '/DLWUPEX/PRODUCTMASSMANAG'
               io_query_control     = me
               io_extension_control = me
               io_context           = me->mo_context ).
  endmethod.


  method IF_SADL_GW_EXTENSION_CONTROL~SET_EXTENSION_MAPPING.
" Intended to be overwritten
RETURN.
  endmethod.


  method IF_SADL_GW_QUERY_CONTROL~SET_QUERY_OPTIONS.
" Intended to be overwritten
RETURN.
  endmethod.


  method PRODUCTSSET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSSET_CREATE_ENTITY'.
  endmethod.


  method PRODUCTSSET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSSET_DELETE_ENTITY'.
  endmethod.


  method PRODUCTSSET_GET_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSSET_GET_ENTITY'.
  endmethod.


  method PRODUCTSSET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSSET_GET_ENTITYSET'.
  endmethod.


  method PRODUCTSSET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSSET_UPDATE_ENTITY'.
  endmethod.
ENDCLASS.
