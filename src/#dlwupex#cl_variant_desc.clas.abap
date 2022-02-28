class /DLWUPEX/CL_VARIANT_DESC definition
  public
  inheriting from /DLWUPEX/CL_VARIANT_MAIN
  create public .

public section.

    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter iv_filter_string | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_descs | <p class="shorttext synchronized" lang="en"></p>
  methods GET_DESCS
    importing
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
    exporting
      !ET_DESCS type /DLWUPEX/CL_ODVARIANT_MPC=>TT_I_VARIANT_DESC .
  methods GET_DESC
    importing
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
    exporting
      !ES_DESC type /DLWUPEX/CL_ODVARIANT_MPC=>TS_I_VARIANT_DESC .
  methods UPDATE_DESC
    importing
      !IV_VARIANT type /DLWUPEX/EVARIANT
      !IT_DESC type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPDESCUPDATE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  methods REMOVE_DESC
    importing
      !IT_DESC type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPDESCREMOVE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  protected section.
  private section.
ENDCLASS.



CLASS /DLWUPEX/CL_VARIANT_DESC IMPLEMENTATION.


  method get_desc.
    data(ls_key) = value #( it_key_tab[ name = 'Variant' ] optional ).

    select single variant,
        language,
        description,
        languagedesc
    from /dlwupex/ddl_variant_tx
    into @es_desc
    where variant  = @ls_key-value.
*    endselect.

    if sy-subrc = 0.

    endif.
  endmethod.


  method get_descs.

*    data(ls_key_tab) = value #( it_key_tab[ name = 'Variant' ] optional ).
    data(ls_filter) = value #( it_filter_select_options[ property = 'Variant' ] optional ).
    data(ls_filter_option) = value #( ls_filter-select_options[ 1 ] optional ).

    select from /dlwupex/ddl_variant_tx
    fields
        variant,
        language,
        description,
        languagedesc
        where variant = @ls_filter_option-low
    into table @et_descs.

    if sy-subrc = 0.

    endif.

  endmethod.


  method remove_desc.

    data : ls_messages type scx_t100key,
           lt_desc     type table of /dlwupex/tvar_tx,
           ls_desc     type /dlwupex/tvar_tx.

    loop at it_desc assigning field-symbol(<fs_desc>).
      ls_desc-variant = <fs_desc>-variant.
      ls_desc-spras = <fs_desc>-language.
      ls_desc-description = <fs_desc>-description.
      append ls_desc to lt_desc.
    endloop.

    delete /dlwupex/tvar_tx from table lt_desc.
    if sy-subrc is not initial.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '033'.
      ls_messages-attr1 = '/DLWUPEX/TVAR_TX'.
      append ls_messages to et_messages.
    endif.

  endmethod.


  METHOD update_desc.

    DATA : ls_messages TYPE scx_t100key,
           lt_desc     TYPE TABLE OF /dlwupex/tvar_tx,
           ls_desc     TYPE /dlwupex/tvar_tx.


    LOOP AT it_desc ASSIGNING FIELD-SYMBOL(<fs_desc>).
      ls_desc-variant = <fs_desc>-variant.

      CALL FUNCTION 'CONVERSION_EXIT_ISOLA_INPUT'
        EXPORTING
          input  = <fs_desc>-language
        IMPORTING
          output = ls_desc-spras
       EXCEPTIONS
         UNKNOWN_LANGUAGE       = 1
         OTHERS = 2
        .
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.

*      ls_desc-spras = <fs_desc>-language.
      ls_desc-description = <fs_desc>-description.
      APPEND ls_desc TO lt_desc.
    ENDLOOP.

    DELETE FROM /dlwupex/tvar_tx
      WHERE variant = iv_variant.
    MODIFY /dlwupex/tvar_tx FROM TABLE lt_desc.
    IF sy-subrc IS NOT INITIAL.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '032'.
      ls_messages-attr1 = '/DLWUPEX/TVAR_TX'.
      APPEND ls_messages TO et_messages.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
