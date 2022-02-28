class /DLWUPEX/CL_MIGRATION__DPC_EXT definition
  public
  inheriting from /DLWUPEX/CL_MIGRATION__DPC
  create public .

public section.

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS /DLWUPEX/CL_MIGRATION__DPC_EXT IMPLEMENTATION.


  method /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.
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
    data test.
    types: ty_t_gdata    type table of /dlwupex/cl_migration__mpc=>ts_gdata with default key,
           ty_t_units    type table of /dlwupex/cl_migration__mpc=>ts_units with default key,
           ty_t_caracts  type table of /dlwupex/cl_migration__mpc=>ts_caracts with default key,
           ty_t_boms     type table of /dlwupex/cl_migration__mpc=>ts_boms with default key,
           ty_t_linsting type table of /dlwupex/cl_migration__mpc=>ts_linsting with default key,
           ty_t_fia      type table of /dlwupex/cl_migration__mpc=>ts_fia with default key,
           ty_t_srlist   type table of /dlwupex/cl_migration__mpc=>ts_srlist with default key,
           ty_t_sales    type table of /dlwupex/cl_migration__mpc=>ts_sales with default key,
           ty_t_logdc    type table of /dlwupex/cl_migration__mpc=>ts_logdc with default key,
           ty_t_logsto   type table of /dlwupex/cl_migration__mpc=>ts_logsto with default key.
    types: begin of ty_data.
             include type /dlwupex/cl_migration__mpc=>ts_buhead.
             types: gdataset    type ty_t_gdata,
             unitsset    type  ty_t_units,
             caractsset  type  ty_t_caracts,
             bomsset     type  ty_t_boms,
             linstingset type  ty_t_linsting,
             fiaset      type  ty_t_fia,
             srlistset   type  ty_t_srlist,
             salesset    type  ty_t_sales,
             logdcset    type  ty_t_logdc,
             logstoset   type  ty_t_logsto,
           end of ty_data.

    data  ls_data      type ty_data.
    data  lt_gdata     type ty_t_gdata .
    test = 'R'.
    case iv_entity_name.
      when 'Buhead'.
        call method io_data_provider->read_entry_data( importing es_data = ls_data ).
        lt_gdata  = ls_data-gdataset.
        copy_data_to_ref(
          exporting
              is_data =     ls_data
          changing
              cr_data = er_deep_entity ).
      when others.
    endcase.
  endmethod.
ENDCLASS.
