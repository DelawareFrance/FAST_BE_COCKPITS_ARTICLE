class /DLWUPEX/CL_VARIANT_DEF definition
  public
  inheriting from /DLWUPEX/CL_VARIANT_MAIN
  create public .

public section.

    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter iv_filter_string | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_defs | <p class="shorttext synchronized" lang="en"></p>
  methods GET_DEFS
    importing
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
    exporting
      !ET_DEFS type /DLWUPEX/CL_ODVARIANT_MPC=>TT_I_VARIANT_DEF .
  methods GET_DEF
    importing
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
    exporting
      !ES_DEF type /DLWUPEX/CL_ODVARIANT_MPC=>TS_I_VARIANT_DEF .
  methods UPDATE_DEF
    importing
      !IV_VARIANT type /DLWUPEX/EVARIANT
      !IT_DEFINITION type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPDEFUPDATE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  methods REMOVE_DEF
    importing
      !IT_DEFINITION type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPDEFREMOVE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  protected section.
  private section.
ENDCLASS.



CLASS /DLWUPEX/CL_VARIANT_DEF IMPLEMENTATION.


  method get_def.

    data(ls_key) = value #( it_key_tab[ name = 'Variant' ] optional ).

    select single variant,
      viewname,
      tabname,
      fieldname,
      positionno,
      iseditable,
      isactive,
      ismandatory,
      isdefaultvalue,
      isbackinsert,
      changedatetime,
      viewdesc,
      mandatorydesc,
      tabnamedesc,
      fieldnamedesc,
      displayonly,
      mandatoryfield
    from /dlwupex/ddl_variant_i
    into @es_def
    where variant  = @ls_key-value.
*    endselect.

    if sy-subrc = 0.

    endif.

  endmethod.


  method get_defs.

*    data(ls_key_tab) = value #( it_filter_select_options[ name = 'Variant' ] optional ).
    data(ls_filter) = value #( it_filter_select_options[ property = 'Variant' ] optional ).
    data(ls_filter_option) = value #( ls_filter-select_options[ 1 ] optional ).

    select from /dlwupex/ddl_variant_i
    fields
        variant,
        viewname,
        tabname,
        fieldname,
        positionno,
        iseditable,
        isactive,
        ismandatory,
        isdefaultvalue,
        isbackinsert,
        changedatetime,
        viewdesc,
        mandatorydesc,
        tabnamedesc,
        fieldnamedesc,
      displayonly,
      mandatoryfield,
      IsEditableDesc
        where variant = @ls_filter_option-low
    into table @et_defs.

    if sy-subrc = 0.


    endif.



  endmethod.


  METHOD remove_def.

    DATA : ls_messages   TYPE scx_t100key,
           lt_definition TYPE TABLE OF /dlwupex/tvar_p,
           ls_definition TYPE /dlwupex/tvar_p.


* vérification des champs obligatoire
    SELECT viewname, tabname, fieldname FROM /dlwupex/tview_k INTO TABLE @DATA(lt_view_k)
      FOR ALL ENTRIES IN @it_definition
      WHERE viewname = @it_definition-viewname AND
          var_def = @abap_true.

    SELECT viewname, tabname, fieldname FROM /dlwupex/tvar_p INTO TABLE @DATA(lt_var_p)
      FOR ALL ENTRIES IN @it_definition
      WHERE variant = @it_definition-variant AND
            viewname = @it_definition-viewname.

    SORT : lt_view_k BY viewname tabname fieldname,
           lt_var_p BY viewname tabname fieldname.

    LOOP AT it_definition ASSIGNING FIELD-SYMBOL(<fs_definition>).
      READ TABLE lt_var_p TRANSPORTING NO FIELDS
          WITH KEY viewname = <fs_definition>-viewname
               tabname = <fs_definition>-tabname
               fieldname = <fs_definition>-fieldname
               BINARY SEARCH.
      IF sy-subrc IS INITIAL.
        DELETE lt_var_p INDEX sy-tabix.
      ENDIF.
    ENDLOOP.

    IF lt_var_p IS NOT INITIAL.
      LOOP AT lt_view_k ASSIGNING FIELD-SYMBOL(<fs_view_k>).
        READ TABLE lt_var_p TRANSPORTING NO FIELDS
          WITH KEY viewname = <fs_view_k>-viewname
       tabname = <fs_view_k>-tabname
       BINARY SEARCH.
        CHECK sy-subrc IS INITIAL.
        READ TABLE lt_var_p TRANSPORTING NO FIELDS
          WITH KEY viewname = <fs_view_k>-viewname
               tabname = <fs_view_k>-tabname
               fieldname = <fs_view_k>-fieldname
               BINARY SEARCH.
        IF sy-subrc IS NOT INITIAL.
          ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
          ls_messages-msgno = '082'.
          ls_messages-attr1 = <fs_view_k>-fieldname.
          ls_messages-attr2 = <fs_view_k>-tabname.
          ls_messages-attr3 = <fs_view_k>-viewname.
          APPEND ls_messages TO et_messages.
        ENDIF.
      ENDLOOP.
    ENDIF.
    CHECK et_messages IS INITIAL.

    LOOP AT it_definition ASSIGNING <fs_definition>.
      ls_definition-variant = <fs_definition>-variant.
      ls_definition-viewname = <fs_definition>-viewname.
      ls_definition-tabname = <fs_definition>-tabname.
      ls_definition-fieldname = <fs_definition>-fieldname.
      ls_definition-dposition = <fs_definition>-positionno.
      CASE <fs_definition>-iseditable.
        WHEN abap_true.
          ls_definition-edit = 'Y'.
        WHEN OTHERS.
          ls_definition-edit = 'N'.
      ENDCASE.
      CASE <fs_definition>-isactive.
        WHEN abap_true.
          ls_definition-active = 'Y'.
        WHEN OTHERS.
          ls_definition-active = 'N'.
      ENDCASE.

      ls_definition-obligatory = <fs_definition>-ismandatory.
      ls_definition-default_val = <fs_definition>-isdefaultvalue.
      ls_definition-take_back_insert = <fs_definition>-isbackinsert.
      ls_definition-etag = <fs_definition>-changedatetime.

      APPEND ls_definition TO lt_definition.
    ENDLOOP.

    DELETE /dlwupex/tvar_p FROM TABLE lt_definition.
*    IF sy-subrc IS NOT INITIAL.
*      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
*      ls_messages-msgno = '033'.
*      ls_messages-attr1 = '/DLWUPEX/TVAR_P'.
*      APPEND ls_messages TO et_messages.
*    ENDIF.

  ENDMETHOD.


  METHOD update_def.

    DATA : ls_messages   TYPE scx_t100key,
           lt_definition TYPE TABLE OF /dlwupex/tvar_p,
           ls_definition TYPE /dlwupex/tvar_p.

* vérification des champs obligatoire
    SELECT viewname, tabname, fieldname FROM /dlwupex/tview_k INTO TABLE @DATA(lt_view_k)
      FOR ALL ENTRIES IN @it_definition
      WHERE viewname = @it_definition-viewname AND
          var_def = @abap_true.

    SORT : lt_view_k BY viewname tabname fieldname.

    LOOP AT lt_view_k ASSIGNING FIELD-SYMBOL(<fs_view_k>).
      READ TABLE it_definition TRANSPORTING NO FIELDS
              WITH KEY viewname = <fs_view_k>-viewname
                       tabname = <fs_view_k>-tabname
                       BINARY SEARCH.

      CHECK sy-subrc IS INITIAL.

      IF  <fs_view_k>-viewname = '01' AND <fs_view_k>-fieldname = 'MATNR'.
        READ TABLE it_definition TRANSPORTING NO FIELDS
          WITH KEY viewname = <fs_view_k>-viewname
                   fieldname = <fs_view_k>-fieldname.
      ELSE.
        READ TABLE it_definition TRANSPORTING NO FIELDS
          WITH KEY viewname = <fs_view_k>-viewname
                   tabname = <fs_view_k>-tabname
                   fieldname = <fs_view_k>-fieldname
                   BINARY SEARCH.
      ENDIF.
      IF sy-subrc IS NOT INITIAL.
        ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
        ls_messages-msgno = '082'.
        ls_messages-attr1 = <fs_view_k>-fieldname.
        ls_messages-attr2 = <fs_view_k>-tabname.
        ls_messages-attr3 = <fs_view_k>-viewname.
        APPEND ls_messages TO et_messages.
      ENDIF.
    ENDLOOP.
    CHECK et_messages IS INITIAL.

    LOOP AT it_definition ASSIGNING FIELD-SYMBOL(<fs_definition>).
      ls_definition-variant = <fs_definition>-variant.
      ls_definition-viewname = <fs_definition>-viewname.
      ls_definition-tabname = <fs_definition>-tabname.
      ls_definition-fieldname = <fs_definition>-fieldname.
      ls_definition-dposition = <fs_definition>-positionno.
      ls_definition-edit = <fs_definition>-iseditable.
*      CASE <fs_definition>-iseditable.
*        WHEN abap_true.
*          ls_definition-edit = '3'.
*        WHEN OTHERS.
*          CLEAR ls_definition-edit.
*      ENDCASE.
      CASE <fs_definition>-isactive.
        WHEN abap_true.
          ls_definition-active = 'Y'.
        WHEN OTHERS.
          ls_definition-active = 'N'.
      ENDCASE.

      ls_definition-obligatory = <fs_definition>-ismandatory.
      ls_definition-default_val = <fs_definition>-isdefaultvalue.
      ls_definition-take_back_insert = <fs_definition>-isbackinsert.
      ls_definition-etag = <fs_definition>-changedatetime.

      APPEND ls_definition TO lt_definition.
    ENDLOOP.

    DELETE FROM /dlwupex/tvar_p
         WHERE variant = iv_variant.
    MODIFY /dlwupex/tvar_p FROM TABLE lt_definition.
    IF sy-subrc IS NOT INITIAL.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '032'.
      ls_messages-attr1 = '/DLWUPEX/TVAR_P'.
      APPEND ls_messages TO et_messages.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
