class /DLWUPEX/CL_ODVARIANT_DPC_EXT definition
  public
  inheriting from /DLWUPEX/CL_ODVARIANT_DPC
  create public .

public section.

  types:
    begin of ts_deep_savevariant.
              include type /dlwupex/cl_odvariant_mpc=>ts_header.
              types: deepwaupdate   type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepwaupdate with empty key,
              deepwaremove   type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepwaremove with empty key,
              deepinsupdate  type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepinsupdate with empty key,
              deepinsremove  type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepinsremove with empty key,
              deepdescupdate type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepdescupdate with empty key,
              deepdescremove type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepdescremove with empty key,
              deepdefupdate  type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepdefupdate with empty key,
              deepauthremove type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepauthremove with empty key,
              deepauthupdate type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepauthupdate with empty key,
              deepdefremove  type standard table of /dlwupex/cl_odvariant_mpc=>ts_deepdefremove with empty key,
              returnheader   type /dlwupex/cl_odvariant_mpc=>ts_returnheader,
              returnmessage  type standard table of /dlwupex/cl_odvariant_mpc=>ts_returnmessage with empty key,
            end of ts_deep_savevariant .
  types:
    tt_scx type standard table of scx_t100key .

    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter it_messages | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_messagesconverted | <p class="shorttext synchronized" lang="en"></p>
  methods CONVERT_MESSAGES
    importing
      !IT_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX
    exporting
      !ET_MESSAGESCONVERTED type /DLWUPEX/CL_ODVARIANT_MPC=>TT_RETURNMESSAGE .

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_BEGIN
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_END
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
protected section.

  methods H_VARIANTSET_DELETE_ENTITY
    redefinition .
  methods H_VARIANTSET_GET_ENTITY
    redefinition .
  methods H_VARIANTSET_GET_ENTITYSET
    redefinition .
  methods I_VARIANT_AUTHSE_GET_ENTITY
    redefinition .
  methods I_VARIANT_AUTHSE_GET_ENTITYSET
    redefinition .
  methods I_VARIANT_DEFSET_GET_ENTITY
    redefinition .
  methods I_VARIANT_DEFSET_GET_ENTITYSET
    redefinition .
  methods I_VARIANT_DESCSE_GET_ENTITY
    redefinition .
  methods I_VARIANT_DESCSE_GET_ENTITYSET
    redefinition .
  methods I_VARIANT_INSSET_GET_ENTITY
    redefinition .
  methods I_VARIANT_INSSET_GET_ENTITYSET
    redefinition .
  methods I_VARIANT_WORKAR_GET_ENTITY
    redefinition .
  methods I_VARIANT_WORKAR_GET_ENTITYSET
    redefinition .
  methods SH_EDITABLESET_GET_ENTITYSET
    redefinition .
  methods SYSTEMINOFSET_GET_ENTITY
    redefinition .
  private section.
ENDCLASS.



CLASS /DLWUPEX/CL_ODVARIANT_DPC_EXT IMPLEMENTATION.


  method /iwbep/if_mgw_appl_srv_runtime~changeset_begin.

  endmethod.


  method /iwbep/if_mgw_appl_srv_runtime~changeset_end.

  endmethod.


  method /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.
    data : ls_header_save type ts_deep_savevariant,
           ls_message     type scx_t100key,
           lt_message     type me->tt_scx.
    data(lo_main) = new /dlwupex/cl_variant_main(  ).
    types: ty_items type table of /dlwupex/cl_odvariant_mpc=>ts_transportitems with default key.
    types: begin of ts_transport.
             include type /dlwupex/cl_odvariant_mpc=>ts_transportheader.
             types: transportitemsset type ty_items,
           end of ts_transport.
    data ls_transport type ts_transport.
    case iv_entity_name.
      when 'Header'.
        io_data_provider->read_entry_data(
                      importing
                        es_data = ls_header_save
                    ).
        lo_main->save_variant(
          exporting
            is_savevariant = ls_header_save
          importing
            ed_deep_entity = er_deep_entity
            et_messages    = lt_message
        ).
      when 'TransportHeader'.
        data : lt_variant     type /dlwupex/wa_variants_tt,
               lv_description type trordertxt,
               lv_otnum       type trkorr,
               lv_rc          type sysubrc.
        call method io_data_provider->read_entry_data( importing es_data = ls_transport ).
        loop at ls_transport-transportitemsset into data(ls_transportitems).
          append initial line to lt_variant assigning field-symbol(<f_variant>).
          move-corresponding ls_transportitems to <f_variant>.
        endloop.
        lv_description = ls_transport-otdescrip.
        call method lo_main->transport_variant
          exporting
            it_variant     = lt_variant
            iv_description = lv_description
          importing
            ev_otnum       = lv_otnum
          changing
            cv_rc          = lv_rc.


        ls_transport-subrc = lv_rc.
        ls_transport-otnum = lv_otnum.
        copy_data_to_ref(
          exporting
              is_data = ls_transport
           changing
             cr_data = er_deep_entity ).
      when others.
    endcase.

*    lo_main->create_variant(
*      exporting
*        is_header   = ls_header
*      importing
*        et_messages = lt_message
*    ).

*      raise exception type /iwbep/cx_mgw_busi_exception
*        exporting
*          textid = ls_message.

*    copy_data_to_ref(
*    exporting
*      is_data = ls_header
*    changing
*      cr_data = er_deep_entity ).

  endmethod.


  method convert_messages.
    data lv_message type string.
    loop at it_messages into data(ls_messages).

      clear lv_message.

*      call function 'MESSAGE_TEXT_BUILD'
*        exporting
*          msgid               =
*          msgnr               =
*          msgv1               =
*          msgv2               = ls_messages-attr2
*          msgv3               = ls_messages-attr3
*          msgv4               = ls_messages-attr4
*        importing
*          message_text_output = lv_message.
      message id    ls_messages-msgid
                    type 'E'
                    number ls_messages-msgno
                    with
                    ls_messages-attr1
                    ls_messages-attr2
                    ls_messages-attr3
                    ls_messages-attr4
                    into lv_message.

      insert value #(
             type = 'E'
             message = ls_messages-msgid && ls_messages-msgno
             description = lv_message
             technicalinformation = ''
     )
     into table et_messagesconverted.
    endloop.
  endmethod.


  method h_variantset_delete_entity.

    data(ls_key_tab) = it_key_tab[ 1 ].
    data(lo_main) = new /dlwupex/cl_variant_main(  ).
    data lt_message     type me->tt_scx.

    lo_main->delete_variant(
      exporting
        es_key      = ls_key_tab
      importing
        et_messages = lt_message
    ).
*name
*value
  endmethod.


  method h_variantset_get_entity.
    data(lo_main) = new /dlwupex/cl_variant_main(  ).

* If navigation property used in URL, get key values from it_navigation_path importing parameter with path: SalesOrderItem
* Else use it_key_tab from importing parameter
    if it_navigation_path[] is not initial.
      data(it_key) = it_navigation_path[ nav_prop = 'Variant' ]-key_tab.
    else.
      it_key = it_key_tab.
    endif.

    lo_main->get_variant(
      exporting
        it_key_tab = it_key_tab
      importing
        es_header  = er_entity
    ).


*Add Max article
    check  er_entity-variant is not initial.
    select single type_err,limit from /dlwupex/tlim_ar into @data(ls_limit)
                                 where variant = @er_entity-variant.
    check sy-subrc eq 0.
    er_entity-maxarticle = ls_limit-limit.
    if ls_limit-type_err = 'E'.
      er_entity-iserror = abap_true.
    endif.


  endmethod.


  method h_variantset_get_entityset.
    data(lo_main) = new /dlwupex/cl_variant_main(  ).
* Get filter or select option information
    data(lo_filter) = io_tech_request_context->get_filter( ).
    data(lt_filter_select_options) = lo_filter->get_filter_select_options( ).
    data(lv_filter_str) = lo_filter->get_filter_string( ).
    data lt_header type /dlwupex/cl_odvariant_mpc=>tt_h_variant.


    lo_main->get_variants(
      exporting
        it_filter = lt_filter_select_options
        it_order = it_order
        iv_filter_string = lv_filter_str
      importing
        et_header        = et_entityset
    ).

*      raise exception type /iwbep/cx_mgw_busi_exception
*        exporting
*          textid = ls_message.

*    copy_data_to_ref(
*    exporting
*      is_data = lt_header
*    changing
*      cr_data = er_deep_entity ).


  endmethod.


  method i_variant_authse_get_entity.
    data(lo_auth) = new /dlwupex/cl_variant_auth(  ).
* If navigation property used in URL, get key values from it_navigation_path importing parameter with path: SalesOrderItem
* Else use it_key_tab from importing parameter
    if it_navigation_path[] is not initial.
      data(it_key) = it_navigation_path[ nav_prop = 'XXXXX' ]-key_tab.
    else.
      it_key = it_key_tab.
    endif.

    lo_auth->get_auth(
      exporting
        it_key_tab = it_key_tab
      importing
        es_auth     = er_entity
    ).
  endmethod.


  method i_variant_authse_get_entityset.

    data(lo_auth) = new /dlwupex/cl_variant_auth(  ).
* Get filter or select option information
    data(lo_filter) = io_tech_request_context->get_filter( ).
    data(lt_filter_select_options) = lo_filter->get_filter_select_options( ).
    data(lv_filter_str) = lo_filter->get_filter_string( ).
    data lt_auth type /dlwupex/cl_odvariant_mpc=>tt_i_variant_auth.


    lo_auth->get_auths(
      exporting
        it_filter_select_options = it_filter_select_options
      importing
        et_auths        = lt_auth
    ).
    et_entityset = lt_auth.
*      raise exception type /iwbep/cx_mgw_busi_exception
*        exporting
*          textid = ls_message.

*    copy_data_to_ref(
*    exporting
*      is_data = lt_auth
*    changing
*      cr_data = er_deep_entity ).

  endmethod.


  method i_variant_defset_get_entity.

    data(lo_def) = new /dlwupex/cl_variant_def(  ).

* If navigation property used in URL, get key values from it_navigation_path importing parameter with path: SalesOrderItem
* Else use it_key_tab from importing parameter
    if it_navigation_path[] is not initial.
      data(it_key) = it_navigation_path[ nav_prop = 'Variant' ]-key_tab.
    else.
      it_key = it_key_tab.
    endif.

    lo_def->get_def(
      exporting
        it_key_tab = it_key_tab
      importing
        es_def  = er_entity
    ).

  endmethod.


  method i_variant_defset_get_entityset.

    data(lo_def) = new /dlwupex/cl_variant_def(  ).
* Get filter or select option information
    data(lo_filter) = io_tech_request_context->get_filter( ).
    data(lt_filter_select_options) = lo_filter->get_filter_select_options( ).
    data(lv_filter_str) = lo_filter->get_filter_string( ).
    data lt_defs type /dlwupex/cl_odvariant_mpc=>tt_i_variant_def.


    lo_def->get_defs(
      exporting
        it_filter_select_options = it_filter_select_options
      importing
        et_defs        = lt_defs
    ).
    et_entityset = lt_defs.
    sort et_entityset by viewname positionno.
*      raise exception type /iwbep/cx_mgw_busi_exception
*        exporting
*          textid = ls_message.

*    copy_data_to_ref(
*    exporting
*      is_data = lt_wa
*    changing
*      cr_data = er_deep_entity ).



  endmethod.


  method i_variant_descse_get_entity.
    data(lo_desc) = new /dlwupex/cl_variant_desc(  ).
* If navigation property used in URL, get key values from it_navigation_path importing parameter with path: SalesOrderItem
* Else use it_key_tab from importing parameter
    if it_navigation_path[] is not initial.
      data(it_key) = it_navigation_path[ nav_prop = 'XXXXX' ]-key_tab.
    else.
      it_key = it_key_tab.
    endif.

    lo_desc->get_desc(
      exporting
        it_key_tab = it_key_tab
      importing
        es_desc     = er_entity
    ).
  endmethod.


  method i_variant_descse_get_entityset.

    data(lo_desc) = new /dlwupex/cl_variant_desc(  ).
* Get filter or select option information
    data(lo_filter) = io_tech_request_context->get_filter( ).
    data(lt_filter_select_options) = lo_filter->get_filter_select_options( ).
    data(lv_filter_str) = lo_filter->get_filter_string( ).
    data lt_desc type /dlwupex/cl_odvariant_mpc=>tt_i_variant_desc.


    lo_desc->get_descs(
      exporting
        it_filter_select_options = it_filter_select_options
      importing
        et_descs        = lt_desc
    ).
    et_entityset = lt_desc.
*      raise exception type /iwbep/cx_mgw_busi_exception
*        exporting
*          textid = ls_message.

*    copy_data_to_ref(
*    exporting
*      is_data = lt_desc
*    changing
*      cr_data = er_deep_entity ).

  endmethod.


  method i_variant_insset_get_entity.
    data(lo_ins) = new /dlwupex/cl_variant_ins(  ).
* If navigation property used in URL, get key values from it_navigation_path importing parameter with path: SalesOrderItem
* Else use it_key_tab from importing parameter
    if it_navigation_path[] is not initial.
      data(it_key) = it_navigation_path[ nav_prop = 'XXXXX' ]-key_tab.
    else.
      it_key = it_key_tab.
    endif.

    lo_ins->get_insert(
      exporting
        it_key_tab = it_key_tab
      importing
        es_insert     = er_entity
    ).
  endmethod.


  method i_variant_insset_get_entityset.

    data(lo_ins) = new /dlwupex/cl_variant_ins(  ).
* Get filter or select option information
    data(lo_filter) = io_tech_request_context->get_filter( ).
    data(lt_filter_select_options) = lo_filter->get_filter_select_options( ).
    data(lv_filter_str) = lo_filter->get_filter_string( ).
    data lt_ins type /dlwupex/cl_odvariant_mpc=>tt_i_variant_ins.


    lo_ins->get_inserts(
      exporting
        it_filter_select_options = it_filter_select_options
      importing
        et_inserts        = lt_ins
    ).
    et_entityset = lt_ins.
*      raise exception type /iwbep/cx_mgw_busi_exception
*        exporting
*          textid = ls_message.

*    copy_data_to_ref(
*    exporting
*      is_data = lt_ins
*    changing
*      cr_data = er_deep_entity ).

  endmethod.


  method i_variant_workar_get_entity.
    data(lo_wa) = new /dlwupex/cl_variant_wa(  ).
* If navigation property used in URL, get key values from it_navigation_path importing parameter with path: SalesOrderItem
* Else use it_key_tab from importing parameter
    if it_navigation_path[] is not initial.
      data(it_key) = it_navigation_path[ nav_prop = 'XXXXX' ]-key_tab.
    else.
      it_key = it_key_tab.
    endif.

    lo_wa->get_wa(
      exporting
        it_key_tab = it_key_tab
      importing
        es_wa     = er_entity
    ).
  endmethod.


  method i_variant_workar_get_entityset.

    data(lo_wa) = new /dlwupex/cl_variant_wa(  ).
* Get filter or select option information
    data(lo_filter) = io_tech_request_context->get_filter( ).
    data(lt_filter_select_options) = lo_filter->get_filter_select_options( ).
    data(lv_filter_str) = lo_filter->get_filter_string( ).
    data lt_wa type /dlwupex/cl_odvariant_mpc=>tt_i_variant_workarea.


    lo_wa->get_was(
      exporting
        iv_filter_str = lv_filter_str
      importing
        et_was        = lt_wa
    ).
    et_entityset = lt_wa.
*      raise exception type /iwbep/cx_mgw_busi_exception
*        exporting
*          textid = ls_message.

*    copy_data_to_ref(
*    exporting
*      is_data = lt_wa
*    changing
*      cr_data = er_deep_entity ).

  endmethod.


  method sh_editableset_get_entityset.
    select * from /dlwupex/v_sh_ed into table et_entityset.

  endmethod.


  method systeminofset_get_entity.
    er_entity-systid = sy-sysid.
    select single cccategory from t000 into @data(lv_cccategory) where mandt eq @sy-mandt.
    if lv_cccategory eq 'C'.
      er_entity-isdevsyst = abap_true.
    endif.
  endmethod.
ENDCLASS.
