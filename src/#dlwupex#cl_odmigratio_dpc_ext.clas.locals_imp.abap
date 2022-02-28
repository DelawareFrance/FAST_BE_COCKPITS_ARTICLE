*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
*{   INSERT         DS1K901097                                        1
*

CLASS lcl_data_read DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES: lif_data_read .
ENDCLASS.

CLASS lcl_data_read IMPLEMENTATION.
  METHOD lif_data_read~get_busines_unit.
*      select * from /DLWUPEX/TBUUNIT
*               into table  et_itab.
    FIELD-SYMBOLS: <lt_itab>   TYPE table.
    DATA lv_tabname TYPE tabname.
    lv_tabname = '/DLWUPEX/TBUHEAD'."'/DLWUPEX/TBUUNIT'.
    CREATE DATA et_itab TYPE STANDARD TABLE OF (lv_tabname).
    ASSIGN et_itab->* TO <lt_itab>.
    IF  iv_modif IS INITIAL.
      SELECT * FROM (lv_tabname)
               INTO TABLE <lt_itab>
               WHERE ckp_creation = abap_true.
    ELSE.
      SELECT * FROM (lv_tabname)
             INTO TABLE <lt_itab>
             WHERE ckp_modif = abap_true.
    ENDIF.

  ENDMETHOD.

  METHOD lif_data_read~get_march_cat.
    FIELD-SYMBOLS: <lt_itab>   TYPE table.
    DATA lv_tabname TYPE tabname.
    lv_tabname = 'T023T'.
    CREATE DATA et_itab TYPE STANDARD TABLE OF (lv_tabname).
    ASSIGN et_itab->* TO <lt_itab>.
    SELECT  t023~matkl t023t~wgbez  FROM t023 INNER JOIN t023t ON t023~matkl = t023t~matkl
             INTO CORRESPONDING FIELDS OF TABLE <lt_itab>
             WHERE t023~wwgda NE ''
             AND t023t~spras EQ sy-langu
             ORDER BY t023~matkl.







  ENDMETHOD.

  METHOD lif_data_read~get_materials_copy.
    FIELD-SYMBOLS: <lt_itab>   TYPE table.
    DATA lv_tabname TYPE tabname.
    lv_tabname = 'MAKT'.
    CREATE DATA et_itab TYPE STANDARD TABLE OF (lv_tabname).
    ASSIGN et_itab->* TO <lt_itab>.
    SELECT * FROM (lv_tabname)
             INTO TABLE <lt_itab>
             WHERE spras = sy-langu
             ORDER BY matnr.
  ENDMETHOD.

  METHOD lif_data_read~get_requestlist.
    FIELD-SYMBOLS: <lt_itab>   TYPE table.
    DATA lv_tabname TYPE tabname.
    DATA : lv_value TYPE xuval,
           lrt_bu   TYPE RANGE OF /dlwupex/ebusunitid,
           lrs_bu   LIKE LINE OF lrt_bu.

    SELECT id FROM /dlwupex/tbuhead INTO TABLE @DATA(lt_bu).

    lrs_bu-sign = 'I'.
    lrs_bu-option = 'EQ'.

    LOOP AT lt_bu ASSIGNING FIELD-SYMBOL(<fs_bu>).
      lv_value = <fs_bu>.
      CALL FUNCTION 'AUTHORITY_CHECK'
        EXPORTING
*         NEW_BUFFERING       = 3
          user                = sy-uname
          object              = 'Z/DLWUPEX/'
          field1              = 'ZBUID'
          value1              = lv_value
        EXCEPTIONS
          user_dont_exist     = 1
          user_is_authorized  = 2
          user_not_authorized = 3
          user_is_locked      = 4
          OTHERS              = 5.
      IF sy-subrc = 2.
* Implement suitable error handling here
        lrs_bu-low = <fs_bu>.
        APPEND lrs_bu TO lrt_bu.
      ENDIF.

    ENDLOOP.

    lv_tabname = '/DLWUPEX/TREQIDS'.
    CREATE DATA et_itab TYPE STANDARD TABLE OF (lv_tabname).
    ASSIGN et_itab->* TO <lt_itab>.
    SELECT * FROM (lv_tabname)
             INTO TABLE <lt_itab>
             WHERE id IN lrt_bu
             ORDER BY zdate DESCENDING reqid DESCENDING.

  ENDMETHOD.
ENDCLASS.

CLASS  lcl_migration_manager DEFINITION CREATE PRIVATE FINAL.
  PUBLIC SECTION.
    INTERFACES: lif_migration_manager.
    CLASS-METHODS:
      get_instance RETURNING VALUE(obj) TYPE REF TO lcl_migration_manager.

  PRIVATE SECTION.
    CLASS-DATA instance TYPE REF TO  lcl_migration_manager.
    DATA: lo_data_read   TYPE REF TO lif_data_read.
ENDCLASS.
CLASS lcl_migration_manager IMPLEMENTATION.
  METHOD get_instance.
    IF instance IS INITIAL.
      CREATE OBJECT instance.
    ENDIF.
    obj = instance.
  ENDMETHOD.
  METHOD lif_migration_manager~get_requestlist.
    IF lo_data_read IS NOT BOUND.
      CREATE OBJECT lo_data_read TYPE lcl_data_read.
    ENDIF.

    CALL METHOD lo_data_read->get_requestlist
      EXPORTING
        iv_uname = iv_uname
      IMPORTING
        et_itab  = et_itab.
  ENDMETHOD.
  METHOD lif_migration_manager~get_busines_unit.

    IF lo_data_read IS NOT BOUND.
      CREATE OBJECT lo_data_read TYPE lcl_data_read.
    ENDIF.

    CALL METHOD lo_data_read->get_busines_unit
      EXPORTING
        iv_uname = iv_uname
        iv_modif = iv_modif
      IMPORTING
        et_itab  = et_itab.

  ENDMETHOD.

  METHOD lif_migration_manager~get_march_cat.
    IF lo_data_read IS NOT BOUND.
      CREATE OBJECT lo_data_read TYPE lcl_data_read.
    ENDIF.

    CALL METHOD lo_data_read->get_march_cat
      IMPORTING
        et_itab = et_itab.
  ENDMETHOD.

  METHOD lif_migration_manager~get_materials_copy.
    IF lo_data_read IS NOT BOUND.
      CREATE OBJECT lo_data_read TYPE lcl_data_read.
    ENDIF.

    CALL METHOD lo_data_read->get_materials_copy
      IMPORTING
        et_itab = et_itab.
  ENDMETHOD.

ENDCLASS.
*}   INSERT
