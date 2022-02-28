class /DLWUPEX/CL_ODMIGRA_01_DPC_EXT definition
  public
  inheriting from /DLWUPEX/CL_ODMIGRA_01_DPC
  create public .

public section.

  constants GC_GENRALDATA type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'GenralData' ##NO_TEXT.
  constants GC_MATERIALLIST type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'MaterialList' ##NO_TEXT.
  constants GC_GENRALDATA_TAB type TABNAME16 value '/DLWUPEX/TGDATA' ##NO_TEXT.
  constants GC_UNITEAN type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'UnitEan' ##NO_TEXT.
  constants GC_UNITEAN_TAB type TABNAME16 value '/DLWUPEX/TUNIT' ##NO_TEXT.
  constants GC_CARACT type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Caracteristics' ##NO_TEXT.
  constants GC_CARACT_TAB type TABNAME16 value '/DLWUPEX/TCARACT' ##NO_TEXT.
  constants GC_BOM type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'BOMs' ##NO_TEXT.
  constants GC_BOM_TAB type TABNAME16 value '/DLWUPEX/TBOM' ##NO_TEXT.
  constants GC_FIAPA type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'FIAPA' ##NO_TEXT.
  constants GC_FIAPA_TAB type TABNAME16 value '/DLWUPEX/TFIA' ##NO_TEXT.
  constants GC_LISTING type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Listing' ##NO_TEXT.
  constants GC_LISTING_TAB type TABNAME16 value '/DLWUPEX/TLIST' ##NO_TEXT.
  constants GC_SOURCELIST type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SourceList' ##NO_TEXT.
  constants GC_SOURCELIST_TAB type TABNAME16 value '/DLWUPEX/TSRLIST' ##NO_TEXT.
  constants GC_SALEPV type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SalePV' ##NO_TEXT.
  constants GC_SALEPV_TAB type TABNAME16 value '/DLWUPEX/TSALE' ##NO_TEXT.
  constants GC_LOGISTICDC type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'LogisticDC' ##NO_TEXT.
  constants GC_LOGISTICDC_TAB type TABNAME16 value '/DLWUPEX/TLOGDC' ##NO_TEXT.
  constants GC_LOGISTICSTORE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'LogisticStore' ##NO_TEXT.
  constants GC_LOGISTICSTORE_TAB type TABNAME16 value '/DLWUPEX/TLOGSTO' ##NO_TEXT.

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
    redefinition .
  methods /IWBEP/IF_MGW_CORE_SRV_RUNTIME~READ_ENTITYSET
    redefinition .
protected section.

  methods CHECKHEADERSET_GET_ENTITYSET
    redefinition .
private section.

  methods DYNAMIC_GET_ENTITYSET
    importing
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET
      !IV_TABNAME type TABNAME16
    exporting
      !ER_ENTITYSET type ref to DATA .
  methods GET_VIEW_STATUS
    importing
      !IP_FIELDNAME type CHAR10
      !IP_ID type /DLWUPEX/EBUSUNITID
      !IP_REQID type /DLWUPEX/EREQID
      !IP_MATKEY type /DLWUPEX/EMATKEY
    returning
      value(EP_STATUS) type /DLWUPEX/EREQSTATUS .
  methods CHECK_XCHPF_OPEN
    importing
      !IP_WERKS type WERKS_D
      !IP_BUID type /DLWUPEX/EBUSUNITID
      !IP_REQID type /DLWUPEX/EREQID
    exporting
      !EP_XCHPF type XFLAG .
ENDCLASS.



CLASS /DLWUPEX/CL_ODMIGRA_01_DPC_EXT IMPLEMENTATION.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY.
**try.
*CALL METHOD SUPER->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
*  EXPORTING
**    iv_entity_name          =
**    iv_entity_set_name      =
**    iv_source_name          =
*    IO_DATA_PROVIDER        =
**    it_key_tab              =
**    it_navigation_path      =
*    IO_EXPAND               =
**    io_tech_request_context =
**  importing
**    er_deep_entity          =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
    data test.
    test = 'r'.

*}   INSERT
  endmethod.


  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET.
**try.
*CALL METHOD SUPER->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
**  exporting
**    iv_entity_name           =
**    iv_entity_set_name       =
**    iv_source_name           =
**    it_filter_select_options =
**    it_order                 =
**    is_paging                =
**    it_navigation_path       =
**    it_key_tab               =
**    iv_filter_string         =
**    iv_search_string         =
**    io_tech_request_context  =
**  importing
**    er_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901097                                        1
*

CASE  iv_entity_name.
  WHEN GC_MATERIALLIST.
     DYNAMIC_GET_ENTITYSET( EXPORTING  IV_VIEWNAME = '00'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_GENRALDATA_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).
  WHEN GC_GENRALDATA.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '01'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_GENRALDATA_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).
  WHEN GC_UNITEAN.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '02'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_UNITEAN_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).


   WHEN GC_CARACT.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '03'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_CARACT_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).
   WHEN GC_BOM.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '04'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_BOM_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).

   WHEN GC_LISTING.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '05'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_LISTING_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).


   WHEN GC_FIAPA.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '06'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_FIAPA_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).


   WHEN GC_SOURCELIST.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '07'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_SOURCELIST_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).

   WHEN GC_SALEPV.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '08'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_SALEPV_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).

    WHEN GC_LOGISTICDC.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '09'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_LOGISTICDC_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).



     WHEN GC_LOGISTICSTORE.
      DYNAMIC_GET_ENTITYSET( EXPORTING IV_VIEWNAME = '10'
                                       IO_TECH_REQUEST_CONTEXT = IO_TECH_REQUEST_CONTEXT
                                       IV_TABNAME              = GC_LOGISTICSTORE_TAB
                             IMPORTING ER_ENTITYSET = ER_ENTITYSET ).



  WHEN OTHERS.
ENDCASE.


*}   INSERT
  endmethod.


  method /iwbep/if_mgw_core_srv_runtime~read_entityset.
**try.
*CALL METHOD SUPER->/IWBEP/IF_MGW_CORE_SRV_RUNTIME~READ_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_SOURCE_NAME           =
*    IS_PAGING                =
*    IT_ORDER                 =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_REQUEST_DETAILS       =
*  CHANGING
**    cv_response_body         =
*    CT_HEADERS               =
*    CR_ENTITYSET             =
**    cr_deleted_entityset     =
**    cs_response_context      =
**    ct_inline_info           =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
*{   INSERT         DS1K901478                                        1
*
    try.
        call method super->/iwbep/if_mgw_core_srv_runtime~read_entityset
          exporting
            iv_entity_name           = iv_entity_name
            iv_source_name           = iv_source_name
            is_paging                = is_paging
            it_order                 = it_order
            it_filter_select_options = it_filter_select_options
            is_request_details       = is_request_details
          changing
            cv_response_body         = cv_response_body
            ct_headers               = ct_headers
            cr_entityset             = cr_entityset
            cr_deleted_entityset     = cr_deleted_entityset
            cs_response_context      = cs_response_context
            ct_inline_info           = ct_inline_info.
      catch /iwbep/cx_mgw_busi_exception .
      catch /iwbep/cx_mgw_tech_exception .
    endtry.
    field-symbols <f_data> type any table.
*CHECK IV_ENTITY_NAME = 'Caracteristics'.
    assign cr_entityset->* to  <f_data>.

    data : lv_reqid    type /dlwupex/ereqid,
           lv_viewname type /dlwupex/eviewname,
           lt_msg      type /dlwupex/tmsg_tt,
           lv_buid     type /dlwupex/ebusunitid.

    try .
        lv_buid = it_filter_select_options[ property = 'BUID' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_reqid = it_filter_select_options[ property = 'REQID' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.



    case iv_entity_name.
      when gc_genraldata.
        lv_viewname = '01'.
      when gc_unitean.
        lv_viewname = '02'.
      when gc_caract.
        lv_viewname = '03'.
      when gc_bom.
        lv_viewname = '04'.
      when gc_listing.
        lv_viewname = '05'.
      when gc_fiapa.
        lv_viewname = '06'.
      when gc_sourcelist.
        lv_viewname = '07'.
      when gc_salepv.
        lv_viewname = '08'.
      when gc_logisticdc.
        lv_viewname = '09'.
      when gc_logisticstore.
        lv_viewname = '10'.
      when others.
    endcase.
    check lv_viewname is not initial.
    data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu = lv_buid ).
    check gcl_cockpit is bound.
    call method gcl_cockpit->/dlwupex/if_cockpit_article~msg_check_type_get
      exporting
        iv_reqid    = lv_reqid
        iv_viewname = lv_viewname
      importing
        et_msg      = lt_msg.



    loop at  <f_data> assigning field-symbol(<f_line>).
      assign component 'LINE' of structure <f_line> to field-symbol(<line>).
      assign component 'ART_KEY' of structure <f_line> to field-symbol(<art_key>).

      if sy-subrc eq 0.
        if lv_viewname ne '01'.
          loop at lt_msg into data(ls_msg) where matnr = <art_key> and line = <line>.
            assign component  ls_msg-field of structure <f_line> to field-symbol(<f_errmsg>).
            check <f_errmsg> is assigned.
            <f_errmsg> = ls_msg-message_v1.
            delete lt_msg.
          endloop.
        else.
          loop at lt_msg into ls_msg where matnr = <art_key> .
            assign component  ls_msg-field of structure <f_line> to <f_errmsg>.
            check <f_errmsg> is assigned.
            <f_errmsg> = ls_msg-message_v1.
            delete lt_msg.
          endloop.
        endif.
      endif.

      assign component 'ATINN' of structure <f_line> to field-symbol(<value>).
      check <value> is assigned.
      call function 'CONVERSION_EXIT_ATINN_OUTPUT'
        exporting
          input  = <value>
        importing
          output = <value>.

    endloop.
*}   INSERT
**endtry.
  endmethod.


  method CHECKHEADERSET_GET_ENTITYSET.
**try.
*CALL METHOD SUPER->CHECKHEADERSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
    data test.
    test = 'r'.
*}   INSERT
  endmethod.


  method CHECK_XCHPF_OPEN.
*{   INSERT         DS1K901478                                        1
*

    data :  lrt_vkorg        TYPE RANGE OF vkorg,
            lrs_vkorg        LIKE LINE OF lrt_vkorg,
            lrt_vtweg        TYPE RANGE OF vtweg,
            lrs_vtweg        LIKE LINE OF lrt_vtweg,
            lrt_sitesto      TYPE RANGE OF werks_d,
            lrs_sitesto      LIKE LINE OF lrt_sitesto.

      SELECT * FROM /dlwupex/tbuoc INTO TABLE @data(lt_OC)
      WHERE id = @IP_BUID.
      check sy-subrc eq 0.
      lrs_vkorg-sign = 'I'.
      lrs_vkorg-option = 'EQ'.
      lrs_vtweg-sign = 'I'.
      lrs_vtweg-option = 'EQ'.
       LOOP AT lt_OC ASSIGNING FIELD-SYMBOL(<fs_tbuoc>).
        lrs_vkorg-low = <fs_tbuoc>-vkorg.
        APPEND lrs_vkorg TO lrt_vkorg.
        lrs_vtweg-low = <fs_tbuoc>-vtweg.
        APPEND lrs_vtweg TO lrt_vtweg.
      ENDLOOP.


       SELECT * INTO TABLE @data(lt_tvkov) FROM tvkov
          WHERE vkorg IN @lrt_vkorg AND
                vtweg IN @lrt_vtweg AND
                vlgfi = @IP_WERKS.
       IF sy-subrc eq 0.
         EP_XCHPF = abap_true.
       ELSE.
*        SELECT SINGLE VKORG,VTWEG FROM T001W INTO @data(ls_result) WHERE werks =  @IP_WERKS.
*        CHECK sy-subrc eq 0.
*        SELECT WERKS FROM /DLWUPEX/TLOGSTO
*                     INTO TABLE @data(lt_werks)
*                     WHERE ID = @IP_BUID
*                     AND   REQID = @IP_REQID.
*        CHECK sy-subrc eq 0.
*        LOOP AT lt_werks INTO data(ls_werks).
*          SELECT SINGLE
*        ENDLOOP.
       ENDIF.
*       ENDIF.
*        LOOP AT lt_tvkov ASSIGNING FIELD-SYMBOL(<fs_tvkov>).
*          CHECK <fs_tvkov>-vlgfi IS NOT INITIAL.
*          lrs_sitesto-low = <fs_tvkov>-vlgfi.
*          APPEND lrs_sitesto TO lrt_sitesto.
*        ENDLOOP.


*}   INSERT
  endmethod.


  method dynamic_get_entityset.
*{   INSERT         DS1K901097                                        1
    types : begin of ltyp_fields ,
              tabname  type tabname16, "CHAR10,
              tabfield type char40,
            end of  ltyp_fields.
    types: begin of ty_s_clause.
    types:   line(72)  type c.
    types: end of ty_s_clause.

    types : begin of ty_s_condtab.
              include type hrcond.
            types : end of ty_s_condtab.
    data lo_filter type  ref to /iwbep/if_mgw_req_filter.
    data lt_filter_select_options type /iwbep/t_mgw_select_option.
    data lv_filter_str type string.
    data ls_filter type /iwbep/s_mgw_select_option.
    data ls_filter_range type /iwbep/s_cod_select_option.
    data lv_reqid   type /dlwupex/ereqid.
    data lv_artkey   type /dlwupex/ematkey.
    data lv_buid    type /dlwupex/ebusunitid.
    data lr_reqid type range of /dlwupex/ereqid.
    data lr_artkey type range of /dlwupex/ematkey.
    data lr_buid type range of /dlwupex/ebusunitid.
    data lv_fieldname type char10.
    data lv_status type /dlwupex/ereqstatus.
    data lv_matkey  type /dlwupex/ematkey.
    data order_by  type string.
    data lv_sort type string.
    data lv_sort2 type string.
    data lv_sort3 type string.
    data lv_werks type werks_d.
    data: lt_output type standard table of ltyp_fields,
          ls_output type ltyp_fields.
    data: lt_cat type table of lvc_s_fcat,
          ls_cat like line of lt_cat,
          d_ref  type ref to data.
    data: gt_where_clauses type standard table of ty_s_clause with default key,
          gt_condtab       type standard table of ty_s_condtab
                      with default key,
          gs_condtab       type  ty_s_condtab.

    data : lt_gdata   type table of /dlwupex/tgdata,
           lt_tunit   type table of /dlwupex/tunit,
           lt_tcaract type table of /dlwupex/tcaract,
           lt_tbom    type table of /dlwupex/tbom,
           lt_tlist   type table of /dlwupex/tlist,
           lt_tfia    type table of /dlwupex/tfia,
           lt_tslist  type table of /dlwupex/tsrlist,
           lt_tsales  type table of /dlwupex/tsale,
           lt_tlogdc  type table of /dlwupex/tlogdc,
           lt_tlogst  type table of /dlwupex/tlogsto,
           lv_rc      type sysubrc,
           lt_msg     type /dlwupex/tmsg_tt.


    constants : lc_yes type char1 value 'Y'.
    field-symbols : <f_fs> type table.

    if iv_viewname = '00'.
      select distinct tabname tabfield from /dlwupex/tfields
                                       into table lt_output
                                       where selection = lc_yes.
    else.
      select distinct tabname tabfield  from /dlwupex/tfields
                                        into table lt_output
                                        where viewname = iv_viewname
                                        and actif = lc_yes.
    endif.

    ls_output-tabname  = '/DLWUPEX/TBUHEAD'.
    ls_output-tabfield = 'ID'.
    append ls_output to lt_output.

    ls_output-tabname  = '/DLWUPEX/TREQIDS'.
    ls_output-tabfield = 'REQID'.
    append ls_output to lt_output.

    ls_output-tabname  = '/DLWUPEX/TGDATA'.
    ls_output-tabfield = 'ART_KEY'.
    append ls_output to lt_output.


    if iv_viewname ne '00' and iv_viewname ne '01' .
      ls_output-tabname  = '/DLWUPEX/TUNIT'.
      ls_output-tabfield = 'LINE'.
      append ls_output to lt_output.
      ls_output-tabname  = '/DLWUPEX/TGDATA'.
      ls_output-tabfield = 'NUM_LINE'.
      append ls_output to lt_output.
    else.
      ls_output-tabname  = '/DLWUPEX/TGDATA'.
      ls_output-tabfield = 'NUM_LINE'.
      append ls_output to lt_output.
    endif.


    sort lt_output by tabfield.


    loop at lt_output assigning field-symbol(<f_data>) where tabname = '/SAPSLL/MARITC' and tabfield = 'DATAB'.
      <f_data>-tabfield = 'DATABB'.
      <f_data>-tabname = '/DLWUPEX/TGDATA'.
    endloop.


*Add status
    if  iv_viewname ne '00'.
      ls_output-tabname   = '/DLWUPEX/TGDATA'.
      ls_output-tabfield  = 'STATUS'.
      insert ls_output into lt_output index 1.
    else.
      ls_output-tabname   = '/DLWUPEX/TREQIDS'.
      ls_output-tabfield  = 'STATDG'.
      append ls_output to lt_output.
*
      ls_output-tabfield  = 'STATUNIT'.
      append ls_output to lt_output .

      ls_output-tabfield  = 'STATCARA'.
      append ls_output to lt_output .


      ls_output-tabfield  = 'STATBOM'.
      append ls_output to lt_output .


      ls_output-tabfield  = 'STATFIA'.
      append ls_output to lt_output .


      ls_output-tabfield  = 'STATLIST'.
      append ls_output to lt_output .


      ls_output-tabfield  = 'STATSRLIST'.
      append ls_output to lt_output .


      ls_output-tabfield  = 'STATSALE'.
      append ls_output to lt_output .


      ls_output-tabfield  = 'STATDC'.
      append ls_output to lt_output .


      ls_output-tabfield  = 'STATSTORE'.
      append ls_output to lt_output .
    endif.
    check lt_output[] is not initial.
    loop at lt_output into ls_output.
      ls_cat-tabname = ls_output-tabname.
      ls_cat-fieldname =  ls_output-tabfield.
      ls_cat-ref_field = ls_output-tabfield.
      ls_cat-ref_table = ls_output-tabname.
      append ls_cat to lt_cat.
    endloop.
    if  iv_viewname eq '10'.
      ls_cat-fieldname =  'XCHPFOPEN'.
      ls_cat-ref_field = 'ACTIVE'.
      ls_cat-ref_table = 'TRGC_TR_SWITCH'.
      append ls_cat to lt_cat.
    endif.
    "create a dynamic internal table
    call method cl_alv_table_create=>create_dynamic_table
      exporting
        it_fieldcatalog = lt_cat
      importing
        ep_table        = d_ref.

    assign d_ref->* to <f_fs>.


*Get Filter
    lo_filter = io_tech_request_context->get_filter( ).
    lt_filter_select_options = lo_filter->get_filter_select_options( ).
    lv_filter_str = lo_filter->get_filter_string( ).

* Check if the supplied filter is supported by standard gateway runtime process
    if  lv_filter_str            is not initial
    and lt_filter_select_options is initial.
      me->/iwbep/if_sb_dpc_comm_services~log_message(
        exporting
          iv_msg_type   = 'E'
          iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
          iv_msg_number = 025 ).
      " Raise Exception
      raise exception type /iwbep/cx_mgw_tech_exception
        exporting
          textid = /iwbep/cx_mgw_tech_exception=>internal_error.
    endif.

    loop at lt_filter_select_options into ls_filter.
      loop at ls_filter-select_options into ls_filter_range.

        gs_condtab-field = ls_filter-property.
        try .
            gs_condtab-opera = ls_filter-select_options[ 1 ]-option.
          catch cx_sy_itab_line_not_found.
        endtry.

        try .
            gs_condtab-low = ls_filter-select_options[ 1 ]-low.
          catch cx_sy_itab_line_not_found.
        endtry.
        if ls_filter-property = 'REQID'.
          lv_reqid = ls_filter-select_options[ 1 ]-low.
        endif.
        if ls_filter-property = 'ID'.
          lv_buid = ls_filter-select_options[ 1 ]-low.
        endif.

        if  gs_condtab-opera = 'CP'.
          translate gs_condtab-low using '*%'.
          gs_condtab-opera = '||'.
        endif.
        append  gs_condtab to  gt_condtab.
*ENDCASE.
      endloop.
    endloop.
    call function 'RH_DYNAMIC_WHERE_BUILD'
      exporting
        dbtable         = space " can be empty
      tables
        condtab         = gt_condtab
        where_clause    = gt_where_clauses
      exceptions
        empty_condtab   = 01
        no_db_field     = 02
        unknown_db      = 03
        wrong_condition = 04.

    loop at gt_where_clauses assigning field-symbol(<f_where>) where line ca '%'.
*      if <f_where>-line ca '%'.
      replace all occurrences of '||'  in <f_where>-line with 'LIKE'.
*      endif.
    endloop.


    if iv_viewname ne '01' and iv_viewname ne '00'.
      select * from (iv_tabname)
          into corresponding fields of table <f_fs>
          where   (gt_where_clauses).

      loop at <f_fs> assigning field-symbol(<f_field>) .
        assign component 'ART_KEY' of structure <f_field> to field-symbol(<art_key>).
        check sy-subrc eq 0.
        select single num_line from /dlwupex/tgdata
                               into corresponding fields of <f_field>
                               where art_key = <art_key>.
      endloop.
      lv_sort = 'NUM_LINE'.
      case iv_viewname .
        when '02'.
          lv_sort2 =  'MEINH' .
          try .
              sort <f_fs> by (lv_sort) (lv_sort2).
            catch cx_sy_create_data_error.
          endtry.
        when '08'.
          lv_sort2 =  'VKORG' .
          lv_sort3 =  'VTWEG' .
          try .
              sort <f_fs> by (lv_sort) (lv_sort2) (lv_sort3).
            catch cx_sy_create_data_error.
          endtry.
        when '09' or '10'.
          lv_sort2 =  'WERKS' .
          try .
              sort <f_fs> by (lv_sort) (lv_sort2).
            catch cx_sy_create_data_error.
          endtry.
        when others.
          try .
              sort <f_fs> by (lv_sort).
            catch cx_sy_create_data_error.
          endtry.
      endcase.


    else.
      select * from (iv_tabname)
            into corresponding fields of table <f_fs>
           where   (gt_where_clauses)
           order by num_line .

    endif.
    data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu = lv_buid ).
    check gcl_cockpit is bound.
    if iv_viewname = '00'.
      call method /dlwupex/cl_cockpit_article=>get_data
        exporting
          iv_bu     = lv_buid
          iv_reqid  = lv_reqid
        changing
          ct_unit   = lt_tunit
          ct_caract = lt_tcaract
          ct_bom    = lt_tbom
          ct_fia    = lt_tfia
          ct_list   = lt_tlist
          ct_srlist = lt_tslist
          ct_sale   = lt_tsales
          ct_logdc  = lt_tlogdc
          ct_logsto = lt_tlogst
          ct_gdata  = lt_gdata
          cv_rc     = lv_rc.
      sort lt_gdata by art_key.
      sort : lt_tunit, lt_tcaract,lt_tbom,lt_tfia,lt_tlist,lt_tslist,lt_tsales,lt_tlogdc,lt_tlogst by art_key ascending status descending.
    endif.


    loop at <f_fs> assigning <f_field> .
      assign component 'MATNR' of structure <f_field> to field-symbol(<value>).
      if <value> is assigned.
        shift <value> left deleting leading '0'.
        unassign <value>.
      endif.
      check iv_viewname = '00'.

      assign component 'ART_KEY' of structure <f_field> to <value>.
      if <value> is assigned.
        lv_matkey = <value>.
      endif.



      assign component 'STATDG' of structure <f_field> to <value>.
      if <value> is assigned.
        read table lt_gdata into data(ls_gdata) with  key art_key = lv_matkey binary search transporting status.
*          lv_fieldname = 'STATDG'.
*          lv_status = get_view_status( exporting ip_id = lv_buid ip_reqid = lv_reqid ip_fieldname = lv_fieldname ip_matkey   =  lv_matkey ).
        if sy-subrc eq 0.
          <value> = ls_gdata-status .
        endif.
      endif.

      assign component 'STATUNIT' of structure <f_field> to <value>.
      if <value> is assigned.
        loop at lt_tunit into data(ls_tunit) where art_key = lv_matkey .
          exit.
        endloop.
        if sy-subrc eq 0.
          <value> = ls_tunit-status .
        endif.

      endif.
*
      assign component 'STATCARA' of structure <f_field> to <value>.
      loop at lt_tcaract into data(ls_tcaract) where art_key = lv_matkey .
        exit.
      endloop.
      if sy-subrc eq 0.
        <value> = ls_tcaract-status .
      endif.



      assign component 'STATBOM' of structure <f_field> to <value>.
      loop at lt_tbom into data(ls_tbom) where art_key = lv_matkey .
        exit.
      endloop.
      if sy-subrc eq 0.
        <value> = ls_tbom-status .
      endif.



      assign component 'STATFIA' of structure <f_field> to <value>.
      loop at lt_tfia into data(ls_tfia) where art_key = lv_matkey .
        exit.
      endloop.
      if sy-subrc eq 0.
        <value> = ls_tfia-status .
      endif.



      assign component 'STATLIST' of structure <f_field> to <value>.
      loop at lt_tlist into data(ls_tlist) where art_key = lv_matkey .
        exit.
      endloop.
      if sy-subrc eq 0.
        <value> = ls_tlist-status .
      endif.

      assign component 'STATSRLIST' of structure <f_field> to <value>.
      loop at lt_tslist into data(ls_tslist) where art_key = lv_matkey .
        exit.
      endloop.
      if sy-subrc eq 0.
        <value> = ls_tslist-status .
      endif.


      assign component 'STATSALE' of structure <f_field> to <value>.
      loop at lt_tsales into data(ls_tsales) where art_key = lv_matkey .
        exit.
      endloop.
      if sy-subrc eq 0.
        <value> = ls_tsales-status .
      endif.


      assign component 'STATDC' of structure <f_field> to <value>.
      loop at lt_tlogdc into data(ls_tlogdc) where art_key = lv_matkey .
        exit.
      endloop.
      if sy-subrc eq 0.
        <value> = ls_tlogdc-status .
      endif.


      assign component 'STATSTORE' of structure <f_field> to <value>.
      loop at lt_tlogst into data(ls_tlogst) where art_key = lv_matkey .
        exit.
      endloop.
      if sy-subrc eq 0.
        <value> = ls_tlogst-status .
      endif.

    endloop.

** Call methos copy_data_to_ref and export entity set data
    copy_data_to_ref( exporting is_data = <f_fs>
                      changing cr_data = er_entityset ).



*}   INSERT
  endmethod.


  method GET_VIEW_STATUS.
*{   INSERT         DS1K901478                                        1
*
       FIELD-SYMBOLS: <lt_itab>   TYPE table.
      data lv_tabname TYPE tabname.
      data lt_itab TYPE REF TO data.

      TYPES : BEGIN OF ltyp_status,
               status TYPE /DLWUPEX/ELINESTATUS,
              END OF ltyp_status.
      data lt_status TYPE TABLE OF ltyp_status.

    CASE ip_fieldname.
      WHEN 'STATDG'.
        lv_tabname = '/DLWUPEX/TGDATA'.
      WHEN 'STATUNIT'.
         lv_tabname = '/DLWUPEX/TUNIT'.
      WHEN 'STATCARA'.
         lv_tabname = '/DLWUPEX/TCARACT'.
      WHEN 'STATBOM'.
         lv_tabname = '/DLWUPEX/TBOM'.
      WHEN 'STATFIA'.
         lv_tabname = '/DLWUPEX/TFIA'.
      WHEN 'STATLIST'.
         lv_tabname = '/DLWUPEX/TLIST'.
      WHEN 'STATSRLIST'.
         lv_tabname = '/DLWUPEX/TSRLIST'.
      WHEN 'STATSALE'.
         lv_tabname = '/DLWUPEX/TSALE'.
      WHEN 'STATDC'.
         lv_tabname = '/DLWUPEX/TLOGDC'.
      WHEN 'STATSTORE'.
         lv_tabname = '/DLWUPEX/TLOGSTO'.
      WHEN OTHERS.
    ENDCASE.
     CREATE DATA lt_itab TYPE STANDARD TABLE OF (lv_tabname).
      ASSIGN lt_itab->* TO <lt_itab>.
*      select SINGLE STATUS from (lv_tabname)
*                           into ep_status
*                           WHERE ID = IP_ID
*                           AND   REQID = IP_REQID
*                           AND   ART_KEY = ip_matkey.

        select  STATUS from (lv_tabname)
                           into TABLE lt_status
                           WHERE ID = IP_ID
                           AND   REQID = IP_REQID
                           AND   ART_KEY = ip_matkey
                          ORDER BY STATUS DESCENDING.
           TRY .
                 ep_status = lt_status[ 1 ]-STATUS.
                 CATCH cx_sy_itab_line_not_found.
           ENDTRY.
*}   INSERT
  endmethod.
ENDCLASS.
