class /DLWUPEX/CL_VARIANT_AUTH definition
  public
  inheriting from /DLWUPEX/CL_VARIANT_MAIN
  create public .

public section.

  methods UPDATE_AUTH
  final
    importing
      !IV_VARIANT type /DLWUPEX/EVARIANT
      !IT_VARIANT type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPAUTHUPDATE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter iv_filter_string | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_auths | <p class="shorttext synchronized" lang="en"></p>
  methods GET_AUTHS
    importing
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
    exporting
      !ET_AUTHS type /DLWUPEX/CL_ODVARIANT_MPC=>TT_I_VARIANT_AUTH .
  methods GET_AUTH
    importing
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
    exporting
      !ES_AUTH type /DLWUPEX/CL_ODVARIANT_MPC=>TS_I_VARIANT_AUTH .
  methods REMOVE_AUTH
  final
    importing
      !IT_VARIANT type /DLWUPEX/CL_ODVARIANT_MPC=>TT_DEEPAUTHREMOVE
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  protected section.
  private section.
ENDCLASS.



CLASS /DLWUPEX/CL_VARIANT_AUTH IMPLEMENTATION.


  method get_auth.
    data(ls_key) = value #( it_key_tab[ name = 'Variant' ] optional ).

    select single variant,
        line,
        signuser,
        optionuser,
        lowuser,
        highuser,
        groupsignuser,
        groupoptionuser,
        groupuserlow,
        groupuserhigh,
        rolesignuser,
        roleoptionuser,
        rolelow,
        rolehigh,
        signuserdesc,
        signusergdesc,
        signuserroledesc,
        optionuserdesc,
        optionusergdesc,
        optionuserroledesc
    from /dlwupex/ddl_variant_auth
    into @es_auth
    where variant  = @ls_key-value.
*    endselect.

    if sy-subrc = 0.

    endif.
  endmethod.


  METHOD get_auths.
*    data(ls_key_tab) = value #( it_key_tab[ name = 'Variant' ] optional ).
    DATA(ls_filter) = VALUE #( it_filter_select_options[ property = 'Variant' ] OPTIONAL ).
    DATA(ls_filter_option) = VALUE #( ls_filter-select_options[ 1 ] OPTIONAL ).

    SELECT FROM /dlwupex/ddl_variant_auth
    FIELDS
        variant,
        line,
        signuser,
        optionuser,
        lowuser,
        highuser,
        groupsignuser,
        groupoptionuser,
        groupuserlow,
        groupuserhigh,
       rolesignuser,
        roleoptionuser,
        rolelow,
        rolehigh,
        signuserdesc,
        signusergdesc,
        signuserroledesc,
        optionuserdesc,
        optionusergdesc,
        optionuserroledesc
        WHERE variant = @ls_filter_option-low
    INTO TABLE @et_auths.

    IF sy-subrc = 0.


    ENDIF.
  ENDMETHOD.


  method remove_auth.

    data : ls_messages type scx_t100key,
           lt_variant  type table of /dlwupex/tvar_au,
           ls_variant  type /dlwupex/tvar_au.

    loop at it_variant assigning field-symbol(<fs_variant>).
      ls_variant-variant = <fs_variant>-variant.
      ls_variant-line = <fs_variant>-line.
      ls_variant-sign_user = <fs_variant>-signuser.
      ls_variant-option_user = <fs_variant>-optionuser.
      ls_variant-user_low = <fs_variant>-lowuser.
      ls_variant-user_high = <fs_variant>-highuser.
      ls_variant-sign_group_user = <fs_variant>-groupsignuser.
      ls_variant-option_group_user = <fs_variant>-groupoptionuser.
      ls_variant-group_user_low = <fs_variant>-groupuserlow.
      ls_variant-group_user_high = <fs_variant>-groupuserhigh.
      ls_variant-sign_role_user = <fs_variant>-rolesignuser.
      ls_variant-option_role_user = <fs_variant>-roleoptionuser.
      ls_variant-role_low = <fs_variant>-roleuserlow.
      ls_variant-role_high = <fs_variant>-roleuserhigh.
      append ls_variant to lt_variant.
    endloop.

    delete /dlwupex/tvar_au from table lt_variant.
    if sy-subrc is not initial.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '033'.
      ls_messages-attr1 = '/DLWUPEX/TVAR_AU'.
      append ls_messages to et_messages.
    endif.

  endmethod.


  METHOD update_auth.

    DATA : ls_messages TYPE scx_t100key,
           lt_variant  TYPE TABLE OF /dlwupex/tvar_au,
           ls_variant  TYPE /dlwupex/tvar_au.

    LOOP AT it_variant ASSIGNING FIELD-SYMBOL(<fs_variant>).
      ls_variant-variant = <fs_variant>-variant.
      ls_variant-line = <fs_variant>-line.
      ls_variant-sign_user = <fs_variant>-signuser.
      ls_variant-option_user = <fs_variant>-optionuser.
      ls_variant-user_low = <fs_variant>-lowuser.
      ls_variant-user_high = <fs_variant>-highuser.
      ls_variant-sign_group_user = <fs_variant>-groupsignuser.
      ls_variant-option_group_user = <fs_variant>-groupoptionuser.
      ls_variant-group_user_low = <fs_variant>-groupuserlow.
      ls_variant-group_user_high = <fs_variant>-groupuserhigh.
      ls_variant-sign_role_user = <fs_variant>-rolesignuser.
      ls_variant-option_role_user = <fs_variant>-roleoptionuser.
      ls_variant-role_low = <fs_variant>-roleuserlow.
      ls_variant-role_high = <fs_variant>-roleuserhigh.
      APPEND ls_variant TO lt_variant.
    ENDLOOP.

    DELETE FROM /dlwupex/tvar_au
          WHERE variant = iv_variant.
    MODIFY /dlwupex/tvar_au FROM TABLE lt_variant.
    IF sy-subrc IS NOT INITIAL.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '032'.
      ls_messages-attr1 = '/DLWUPEX/TVAR_AU'.
      APPEND ls_messages TO et_messages.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
