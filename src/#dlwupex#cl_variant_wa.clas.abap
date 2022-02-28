class /DLWUPEX/CL_VARIANT_WA definition
  public
  inheriting from /DLWUPEX/CL_VARIANT_MAIN
  create public .

public section.

    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter iv_filter_string | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_was | <p class="shorttext synchronized" lang="en"></p>
  methods GET_WAS
    importing
      !IV_FILTER_STR type STRING
    exporting
      !ET_WAS type /DLWUPEX/CL_ODVARIANT_MPC=>TT_I_VARIANT_WORKAREA .
  methods GET_WA
    importing
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
    exporting
      !ES_WA type /DLWUPEX/CL_ODVARIANT_MPC=>TS_I_VARIANT_WORKAREA .
  methods UPDATE_WA
    importing
      !IV_VARIANT type /DLWUPEX/EVARIANT
      !IT_WA type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPWAUPDATE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  methods REMOVE_WA
    importing
      !IT_WA type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPWAREMOVE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  protected section.
  private section.
ENDCLASS.



CLASS /DLWUPEX/CL_VARIANT_WA IMPLEMENTATION.


  method get_wa.
    data(ls_key) = value #( it_key_tab[ name = 'Variant' ] optional ).

    select single workarea,
        variant,
        country,
        workareadesc,
        creator,
        change,
        changedatetime
    from /dlwupex/ddl_variant_w
    into @es_wa
    where variant  = @ls_key-value.
*    endselect.

    if sy-subrc = 0.

    endif.
  endmethod.


  method get_was.
*    data(ls_key_tab) = value #( it_key_tab[ name = 'Variant' ] optional ).
*    data(ls_filter) = value #( it_filter_select_options[ property = 'Variant' ] optional ).
*    data(ls_filter_option) = value #( ls_filter-select_options[ 1 ] optional ).

    select from /dlwupex/ddl_variant_w
    fields
        workarea,
        variant,
        country,
        workareadesc,
        creator,
        change,
        changedatetime
        where (iv_filter_str)
    into table @et_was.

    if sy-subrc = 0.


    endif.
  endmethod.


  method remove_wa.

    data : ls_messages type scx_t100key,
           lt_wa       type table of /dlwupex/tvar_h,
           ls_wa       type /dlwupex/tvar_h.

    loop at it_wa assigning field-symbol(<fs_wa>).
      ls_wa-work_area = <fs_wa>-workarea.
      ls_wa-variant = <fs_wa>-variant.
      append ls_wa to lt_wa.
    endloop.

    delete /dlwupex/tvar_h from table lt_wa.
    if sy-subrc is not initial.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '033'.
      ls_messages-attr1 = '/DLWUPEX/TVAR_H'.
      append ls_messages to et_messages.
    endif.

  endmethod.


  METHOD update_wa.

    DATA : ls_messages TYPE scx_t100key,
           lt_wa       TYPE TABLE OF /dlwupex/tvar_h,
           ls_wa       TYPE /dlwupex/tvar_h.

    LOOP AT it_wa ASSIGNING FIELD-SYMBOL(<fs_wa>).
      ls_wa-work_area = <fs_wa>-workarea.
      ls_wa-variant = <fs_wa>-variant.
      APPEND ls_wa TO lt_wa.
    ENDLOOP.

    DELETE FROM /dlwupex/tvar_h
      WHERE variant = iv_variant.
    MODIFY /dlwupex/tvar_h FROM TABLE lt_wa.
    IF sy-subrc IS NOT INITIAL.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '032'.
      ls_messages-attr1 = '/DLWUPEX/TVAR_H'.
      APPEND ls_messages TO et_messages.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
