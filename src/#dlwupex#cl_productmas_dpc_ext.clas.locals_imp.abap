*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class lcl_data_read definition final.
  public section.
    interfaces: lif_data_read .
endclass.

class lcl_data_read implementation.
  method lif_data_read~get_variante.

    field-symbols: <lt_itab>   type table.
    data lv_tabname type tabname.
    lv_tabname = '/DLWUPEX/TVAR_H'.
    create data et_itab type standard table of (lv_tabname).
    assign et_itab->* to <lt_itab>.
    select * from (lv_tabname)
             into table <lt_itab>
             where work_area = iv_bu.

  endmethod.

  method lif_data_read~get_march_cat.
    field-symbols: <lt_itab>   type table.
    data lv_tabname type tabname.
    lv_tabname = 'T023T'.
    create data et_itab type standard table of (lv_tabname).
    assign et_itab->* to <lt_itab>.
    select  t023~matkl t023t~wgbez  from t023 inner join t023t on t023~matkl = t023t~matkl
             into corresponding fields of table <lt_itab>
             where t023~wwgda ne ''
             and t023t~spras eq sy-langu
             order by t023~matkl.







  endmethod.

  method lif_data_read~get_materials_copy.
    field-symbols: <lt_itab>   type table.
    data lv_tabname type tabname.
    lv_tabname = 'MAKT'.
    create data et_itab type standard table of (lv_tabname).
    assign et_itab->* to <lt_itab>.
    select * from (lv_tabname)
             into table <lt_itab>
             where spras = sy-langu
             order by matnr.
  endmethod.

  method lif_data_read~get_requestlist.
    field-symbols: <lt_itab>   type table.
    data lv_tabname type tabname.
    lv_tabname = '/DLWUPEX/TREQIDS'.
    create data et_itab type standard table of (lv_tabname).
    assign et_itab->* to <lt_itab>.
    select * from (lv_tabname)
             into table <lt_itab>
             order by zdate descending reqid descending.

  endmethod.
endclass.

class  lcl_migration_manager definition create private final.
  public section.
    interfaces: lif_migration_manager.
    class-methods:
      get_instance returning value(obj) type ref to lcl_migration_manager.

  private section.
    class-data instance type ref to  lcl_migration_manager.
    data: lo_data_read   type ref to lif_data_read.
endclass.
class lcl_migration_manager implementation.
  method get_instance.
    if instance is initial.
      create object instance.
    endif.
    obj = instance.
  endmethod.
  method lif_migration_manager~get_requestlist.
    if lo_data_read is not bound.
      create object lo_data_read type lcl_data_read.
    endif.

    call method lo_data_read->get_requestlist
      exporting
        iv_uname = iv_uname
      importing
        et_itab  = et_itab.
  endmethod.
  method lif_migration_manager~get_variante.

    if lo_data_read is not bound.
      create object lo_data_read type lcl_data_read.
    endif.

    call method lo_data_read->get_variante
      exporting
        iv_uname = iv_uname
        iv_bu    = iv_bu
      importing
        et_itab  = et_itab.

  endmethod.

  method lif_migration_manager~get_march_cat.
    if lo_data_read is not bound.
      create object lo_data_read type lcl_data_read.
    endif.

    call method lo_data_read->get_march_cat
      importing
        et_itab = et_itab.
  endmethod.

  method lif_migration_manager~get_materials_copy.
    if lo_data_read is not bound.
      create object lo_data_read type lcl_data_read.
    endif.

    call method lo_data_read->get_materials_copy
      importing
        et_itab = et_itab.
  endmethod.

endclass.
