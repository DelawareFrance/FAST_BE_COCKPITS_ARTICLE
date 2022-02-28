class /DLWUPEX/CL_VARIANT_INS definition
  public
  inheriting from /DLWUPEX/CL_VARIANT_MAIN
  create public .

public section.

    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter iv_filter_string | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_inserts | <p class="shorttext synchronized" lang="en"></p>
  methods GET_INSERTS
    importing
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
    exporting
      !ET_INSERTS type /DLWUPEX/CL_ODVARIANT_MPC=>TT_I_VARIANT_INS .
  methods GET_INSERT
    importing
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
    exporting
      !ES_INSERT type /DLWUPEX/CL_ODVARIANT_MPC=>TS_I_VARIANT_INS .
  methods UPDATE_INS
    importing
      !IV_VARIANT type /DLWUPEX/EVARIANT
      !IT_INSERT type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPINSUPDATE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  methods REMOVE_INS
    importing
      !IT_INSERT type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPINSREMOVE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  protected section.
  private section.
ENDCLASS.



CLASS /DLWUPEX/CL_VARIANT_INS IMPLEMENTATION.


  method get_insert.

    data(ls_key) = value #( it_key_tab[ name = 'Variant' ] optional ).

    select single variant,
        viewname,
        toinsert,
        viewnamedesc
    from /dlwupex/ddl_variant_in
    into @es_insert
    where variant  = @ls_key-value.
*    endselect.

    if sy-subrc = 0.

    endif.
  endmethod.


  method get_inserts.

*    data(ls_key_tab) = value #( it_key_tab[ name = 'Variant' ] optional ).
    data(ls_filter) = value #( it_filter_select_options[ property = 'Variant' ] optional ).
    data(ls_filter_option) = value #( ls_filter-select_options[ 1 ] optional ).

    select from /dlwupex/ddl_variant_in
    fields
        variant,
        viewname,
        toinsert,
        viewnamedesc
        where variant = @ls_filter_option-low
    into table @et_inserts.

    if sy-subrc = 0.


    endif.

  endmethod.


  method remove_ins.

    data : ls_messages type scx_t100key,
           lt_insert   type table of /dlwupex/tvar_in,
           ls_insert   type /dlwupex/tvar_in.

    loop at it_insert assigning field-symbol(<fs_insert>).
      ls_insert-variant = <fs_insert>-variant.
      ls_insert-viewname = <fs_insert>-viewname.
      case <fs_insert>-toinsert.
        when abap_true.
          ls_insert-insert_line = 'Y'.
        when others.
          ls_insert-insert_line = 'N'.
      endcase.
      append ls_insert to lt_insert.
    endloop.

    delete /dlwupex/tvar_in from table lt_insert.
    if sy-subrc is not initial.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '033'.
      ls_messages-attr1 = '/DLWUPEX/TVAR_IN'.
      append ls_messages to et_messages.
    endif.

  endmethod.


  METHOD update_ins.

    DATA : ls_messages TYPE scx_t100key,
           lt_insert   TYPE TABLE OF /dlwupex/tvar_in,
           ls_insert   TYPE /dlwupex/tvar_in.

    LOOP AT it_insert ASSIGNING FIELD-SYMBOL(<fs_insert>).
      ls_insert-variant = <fs_insert>-variant.
      ls_insert-viewname = <fs_insert>-viewname.
*      case <fs_insert>-toinsert.
*        when abap_true.
      ls_insert-insert_line = 'Y'.
*        when others.
*          ls_insert-insert_line = 'N'.
*      endcase.
      APPEND ls_insert TO lt_insert.
    ENDLOOP.

    DELETE FROM /dlwupex/tvar_in
      WHERE variant = iv_variant.
    MODIFY /dlwupex/tvar_in FROM TABLE lt_insert.
    IF sy-subrc IS NOT INITIAL.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '032'.
      ls_messages-attr1 = '/DLWUPEX/TVAR_IN'.
      APPEND ls_messages TO et_messages.
    ENDIF.
    COMMIT WORK.
  ENDMETHOD.
ENDCLASS.
