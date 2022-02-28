class /DLWUPEX/CL_VARIANT_MAIN definition
  public
  create public .

public section.

*    types : begin of ts_deep_variant,
*              include type /dlwupex/cl_odvariant_mpc=>ts_h_variant.
*    types: i_variant_defset      type standard table of /dlwupex/cl_odvariant_mpc=>ts_i_variant_def with empty key,
*           i_variant_authset     type standard table of /dlwupex/cl_odvariant_mpc=>ts_i_variant_auth with empty key,
*           i_variant_descset     type standard table of /dlwupex/cl_odvariant_mpc=>ts_i_variant_desc with empty key,
*           i_variant_insset      type standard table of /dlwupex/cl_odvariant_mpc=>ts_i_variant_ins with empty key,
*           i_variant_workareaset type standard table of /dlwupex/cl_odvariant_mpc=>ts_i_variant_workarea with empty key,
*           end of ts_deep_variant.
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter is_header | <p class="shorttext synchronized" lang="en"></p>
  methods CREATE_VARIANT
    importing
      !IS_HEADER type /DLWUPEX/CL_ODVARIANT_MPC=>TS_I_VARIANT_DEF
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter is_header | <p class="shorttext synchronized" lang="en"></p>
  methods UPDATE_VARIANT
    importing
      !IS_HEADER type /DLWUPEX/CL_ODVARIANT_MPC=>TS_I_VARIANT_DEF
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter iV_FILTER_STRING | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_header | <p class="shorttext synchronized" lang="en"></p>
  methods GET_VARIANTS
    importing
      !IT_FILTER type /IWBEP/T_MGW_SELECT_OPTION
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
    exporting
      !ET_HEADER type /DLWUPEX/CL_ODVARIANT_MPC=>TT_H_VARIANT .
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter iV_FILTER_STRING | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_header | <p class="shorttext synchronized" lang="en"></p>
  methods GET_VARIANT
    importing
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
    exporting
      !ES_HEADER type /DLWUPEX/CL_ODVARIANT_MPC=>TS_H_VARIANT .
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter is_savevariant | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_messages | <p class="shorttext synchronized" lang="en"></p>
  methods SAVE_VARIANT
    importing
      !IS_SAVEVARIANT type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TS_DEEP_SAVEVARIANT
    exporting
      !ED_DEEP_ENTITY type ref to DATA
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter es_header | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_messages | <p class="shorttext synchronized" lang="en"></p>
  methods UPDATE_HEADER
    importing
      !ES_HEADER type /DLWUPEX/TVAR_TX
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter es_key | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter et_messages | <p class="shorttext synchronized" lang="en"></p>
  methods DELETE_VARIANT
    importing
      !ES_KEY type /IWBEP/S_MGW_NAME_VALUE_PAIR
    exporting
      !ET_MESSAGES type /DLWUPEX/CL_ODVARIANT_DPC_EXT=>TT_SCX .
  methods TRANSPORT_VARIANT
    importing
      !IT_VARIANT type /DLWUPEX/WA_VARIANTS_TT
      !IV_DESCRIPTION type TRORDERTXT
    exporting
      !EV_OTNUM type TRKORR
    changing
      !CV_RC type SYSUBRC .
  protected section.
  private section.


ENDCLASS.



CLASS /DLWUPEX/CL_VARIANT_MAIN IMPLEMENTATION.


  method create_variant.

  endmethod.


  method delete_variant.

    data lv_cond type string.

    lv_cond = es_key-name && ' = ' && '''' && es_key-value && '''' .
*  /dlwupex/tvar_tx
*
*
*add try catch
    delete from /dlwupex/tvar_tx
    where (lv_cond).
    if sy-subrc = 0.

      commit work.

    else.

      rollback work.

    endif.

    delete from /dlwupex/tvar_h
    where (lv_cond).
    if sy-subrc = 0.

      commit work.

    else.

      rollback work.

    endif.

    delete from /dlwupex/tvar_au
    where (lv_cond).
    if sy-subrc = 0.

      commit work.

    else.

      rollback work.

    endif.

    delete from /dlwupex/tvar_p
    where (lv_cond).
    if sy-subrc = 0.

      commit work.

    else.

      rollback work.

    endif.

    delete from /dlwupex/tvar_in
    where (lv_cond).
    if sy-subrc = 0.

      commit work.

    else.

      rollback work.

    endif.


  endmethod.


  method get_variant.

    data(ls_key) = value #( it_key_tab[ name = 'Variant' ] optional ).

    select variant, description, changedatetime,workarea, descupper
    from /dlwupex/ddl_variant_h
    into @es_header
    where variant  = @ls_key-value.
    endselect.

    if sy-subrc = 0.

    endif.


  endmethod.


  method get_variants.

    data(ls_filter) = value #( it_filter[ property = 'WORKAREA' ] optional ).
    data(lv_filter_string) = iv_filter_string.
    data ls_header type /dlwupex/cl_odvariant_mpc=>ts_h_variant.
    data lt_header type /dlwupex/cl_odvariant_mpc=>tt_h_variant.

    replace all occurrences of 'WORKAREA' in lv_filter_string with 'WORK_AREA'.
*    replace all occurrences of 'like ''''%' in lv_filter_string with 'CP ''''%'.

    select distinct _head~variant, _head~description, _head~changedatetime, _head~descupper , _wa~work_area
    from /dlwupex/ddl_variant_h as _head
    left outer join /dlwupex/tvar_h as _wa on _wa~variant = _head~variant
    into table @data(lt_tmp_header).
    if sy-subrc = 0.


      select from @lt_tmp_header as lt_tmp_header
        fields variant, description, changedatetime, work_area, descupper
        where (lv_filter_string)
        order by variant
        into table @data(lt_tmp_tmp_header).

      if sy-subrc = 0.

        loop at lt_tmp_tmp_header into data(ls_tmp_header).

          insert value #(
             variant = ls_tmp_header-variant
             description = ls_tmp_header-description
             changedatetime = ''
             workarea = ls_tmp_header-work_area
             descupper = ls_tmp_header-descupper
          )
          into table lt_header.


        endloop.

        sort lt_header by variant.
        delete adjacent duplicates from lt_header comparing variant.

        et_header = lt_header.

        if it_order is not initial.

          data(ls_order) = value #( it_order[ 1 ] optional ).
          data lt_dynorder type abap_sortorder_tab.
          data ls_dynorder type abap_sortorder.
          ls_dynorder-name = ls_order-property.
          if ls_order-order eq 'desc'.
            ls_dynorder-descending = abap_true.
          else.

          endif.
          insert value #(
                 name = ls_dynorder-name
                 descending = ls_dynorder-descending
                 astext = ''
         )
         into table lt_dynorder.

          sort et_header by (lt_dynorder).

        endif.

      endif.

    endif.

*      if ls_filter is not initial.
*        data(lv_filter_string) = iv_filter_string.
*        replace all occurrences of 'WORKAREA' in lv_filter_string with 'work_area'.
*        select distinct *
*        from /dlwupex/tvar_h
*        into table @data(lt_wa)
*        where (lv_filter_string).
*        if sy-subrc = 0.
*          select
*              from /dlwupex/ddl_variant_h
*              fields variant, description, changedatetime, workarea, descupper
*              for all entries in @lt_wa
*              where variant = @lt_wa-variant
*              into table @et_header.
*          if sy-subrc = 0.
*
*          endif.
*        endif.
*
*      else.
*        select from /dlwupex/ddl_variant_h
*                fields variant, description, changedatetime, workarea, descupper
*                where (iv_filter_string)
*                order by variant
*                into table @et_header.
*        if sy-subrc = 0.
*
*        endif.
*      endif.

  endmethod.


  METHOD save_variant.

    DATA : lt_waupdate   TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepwaupdate,
           lt_waremove   TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepwaremove,
           lt_insupdate  TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepinsupdate,
           lt_insremove  TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepinsremove,
           lt_descupdate TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepdescupdate,
           lt_descremove TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepdescremove,
           lt_defupdate  TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepdefupdate,
           lt_authremove TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepauthremove,
           lt_authupdate TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepauthupdate,
           lt_defremove  TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_deepdefremove,
           lt_messages   TYPE /dlwupex/cl_odvariant_dpc_ext=>tt_scx,
           lt_messconv   TYPE TABLE OF /dlwupex/cl_odvariant_mpc=>ts_returnmessage,
           lv_langu      TYPE syst_langu.

    DATA : lo_wa_object   TYPE REF TO /dlwupex/cl_variant_wa,
           lo_def_object  TYPE REF TO /dlwupex/cl_variant_def,
           lo_ins_object  TYPE REF TO /dlwupex/cl_variant_ins,
           lo_desc_object TYPE REF TO /dlwupex/cl_variant_desc,
           lo_auth_object TYPE REF TO /dlwupex/cl_variant_auth,
           ls_messages    TYPE scx_t100key.



    DATA :
      ld_s_deep_header TYPE REF TO /dlwupex/cl_odvariant_dpc_ext=>ts_deep_savevariant,
      ld_deep_entity   TYPE REF TO data.


    ed_deep_entity = NEW /dlwupex/cl_odvariant_dpc_ext=>ts_deep_savevariant( ).

    IF ed_deep_entity IS BOUND.

      ld_s_deep_header = CAST #( ed_deep_entity ).

      IF ld_s_deep_header IS BOUND.

        ld_s_deep_header->* = is_savevariant.

      ENDIF.

    ENDIF. "ed_deep_entity is bound.


    DATA(lo_dpc_ext) = NEW /dlwupex/cl_odvariant_dpc_ext( ).


* Création de variante si vide
    IF is_savevariant-variant IS INITIAL.
      SELECT SINGLE MAX( variant ) INTO @DATA(lv_variant) FROM /dlwupex/tvar_tx.
      lv_variant =  lv_variant + 1.
      lv_variant = |{ lv_variant  ALPHA = IN WIDTH = 10 }|.
      ld_s_deep_header->returnheader-variant = lv_variant.

      DATA: ls_head TYPE /dlwupex/tvar_tx.
      ls_head-variant = lv_variant.
      ls_head-spras = sy-langu.
      ls_head-description = is_savevariant-description.
      me->update_header(
        EXPORTING
          es_header   = ls_head
        IMPORTING
          et_messages = lt_messages
      ).
    ELSE. " modification de variant
      lv_variant = is_savevariant-variant.
    ENDIF.

**********************************************************************
* Manage WA data (header data)
* Retrieve data from sending table
    LOOP AT is_savevariant-deepwaupdate INTO DATA(ls_waupdate).
      ls_waupdate-variant = lv_variant.
      APPEND ls_waupdate TO lt_waupdate.
    ENDLOOP.
*    LOOP AT is_savevariant-deepwaremove INTO DATA(ls_waremove).
*      ls_waremove-variant = lv_variant.
*      APPEND ls_waremove TO lt_waremove.
*    ENDLOOP.

* call of update if needed
    SORT lt_waupdate.
*    IF lt_waremove IS NOT INITIAL OR lt_waupdate IS NOT INITIAL .
    CREATE OBJECT lo_wa_object.

*      IF lt_waupdate IS NOT INITIAL.
    REFRESH lt_messages.
    CALL METHOD lo_wa_object->update_wa
      EXPORTING
        iv_variant  = lv_variant
        it_wa       = lt_waupdate
      IMPORTING
        et_messages = lt_messages.
    APPEND LINES OF lt_messages TO et_messages.
*      ENDIF.

*      IF lt_waremove IS NOT INITIAL.
*        REFRESH lt_messages.
*        CALL METHOD lo_wa_object->remove_wa
*          EXPORTING
*            it_wa       = lt_waremove
*          IMPORTING
*            et_messages = lt_messages.
*        APPEND LINES OF lt_messages TO et_messages.
*      ENDIF.
*    ENDIF.

**********************************************************************
* Manage DEF data (post data)
* Retrieve data from sending table
    LOOP AT is_savevariant-deepdefupdate INTO DATA(ls_defupdate).
      ls_defupdate-variant = lv_variant.
      APPEND ls_defupdate TO lt_defupdate.
    ENDLOOP.
*    LOOP AT is_savevariant-deepdefremove INTO DATA(ls_defremove).
*      ls_defremove-variant = lv_variant.
*      APPEND ls_defremove TO lt_defremove.
*    ENDLOOP.
    SORT lt_defupdate.
* call of update if needed
*    IF lt_defremove IS NOT INITIAL OR lt_defupdate IS NOT INITIAL .
    CREATE OBJECT lo_def_object.

*      IF lt_defupdate IS NOT INITIAL.
    REFRESH lt_messages.
    CALL METHOD lo_def_object->update_def
      EXPORTING
        iv_variant    = lv_variant
        it_definition = lt_defupdate
      IMPORTING
        et_messages   = lt_messages.
    APPEND LINES OF lt_messages TO et_messages.
*      ENDIF.

*      IF lt_defremove IS NOT INITIAL.
*        REFRESH lt_messages.
*        CALL METHOD lo_def_object->remove_def
*          EXPORTING
*            it_definition = lt_defremove
*          IMPORTING
*            et_messages   = lt_messages.
*        APPEND LINES OF lt_messages TO et_messages.
*      ENDIF.
*    ENDIF.

**********************************************************************
* Manage AUTH data (Authorisation data)
* Retrieve data from sending table
    DATA lv_line TYPE tvarv_numb.
    LOOP AT is_savevariant-deepauthupdate INTO DATA(ls_authupdate).
      ls_authupdate-variant = lv_variant.
      ls_authupdate-line = lv_line = lv_line + 1.
      APPEND ls_authupdate TO lt_authupdate.
    ENDLOOP.
*    LOOP AT is_savevariant-deepauthremove INTO DATA(ls_authremove).
*      ls_authremove-variant = lv_variant.
*      APPEND ls_authremove TO lt_authremove.
*    ENDLOOP.

* call of update if needed
    SORT lt_authupdate.
*    IF lt_authremove IS NOT INITIAL OR lt_authupdate IS NOT INITIAL .
    CREATE OBJECT lo_auth_object.

*      IF lt_authupdate IS NOT INITIAL.
    REFRESH lt_messages.
    CALL METHOD lo_auth_object->update_auth
      EXPORTING
        iv_variant  = lv_variant
        it_variant  = lt_authupdate
      IMPORTING
        et_messages = lt_messages.
    APPEND LINES OF lt_messages TO et_messages.
*      ENDIF.

*      IF lt_authremove IS NOT INITIAL.
*        REFRESH lt_messages.
*        CALL METHOD lo_auth_object->remove_auth
*          EXPORTING
*            it_variant  = lt_authremove
*          IMPORTING
*            et_messages = lt_messages.
*        APPEND LINES OF lt_messages TO et_messages.
*      ENDIF.
*    ENDIF.

**********************************************************************
* Manage INS data (Insert data)
* Retrieve data from sending table
    LOOP AT is_savevariant-deepinsupdate INTO DATA(ls_insupdate).
      ls_insupdate-variant = lv_variant.
      APPEND ls_insupdate TO lt_insupdate.
    ENDLOOP.
*    LOOP AT is_savevariant-deepinsremove INTO DATA(ls_insremove).
*      ls_insremove-variant = lv_variant.
*      APPEND ls_insremove TO lt_insremove.
*    ENDLOOP.

* call of update if needed
    SORT lt_insupdate.
*    IF lt_insremove IS NOT INITIAL OR lt_insupdate IS NOT INITIAL .
    CREATE OBJECT lo_ins_object.

*      IF lt_insupdate IS NOT INITIAL.
    REFRESH lt_messages.
    CALL METHOD lo_ins_object->update_ins
      EXPORTING
        iv_variant  = lv_variant
        it_insert   = lt_insupdate
      IMPORTING
        et_messages = lt_messages.
    APPEND LINES OF lt_messages TO et_messages.
*      ENDIF.

*        IF lt_insremove IS NOT INITIAL.
*          REFRESH lt_messages.
*          CALL METHOD lo_ins_object->remove_ins
*            EXPORTING
*              it_insert   = lt_insremove
*            IMPORTING
*              et_messages = lt_messages.
*          APPEND LINES OF lt_messages TO et_messages.
*        ENDIF.
*    ENDIF.

**********************************************************************
* Manage DESC data (Description data)
* Retrieve data from sending table
    LOOP AT is_savevariant-deepdescupdate INTO DATA(ls_descupdate).
      ls_descupdate-variant = lv_variant.
      APPEND ls_descupdate TO lt_descupdate.
    ENDLOOP.
    SORT lt_descupdate.
    CALL FUNCTION 'CONVERSION_EXIT_ISOLA_INPUT'
      EXPORTING
        input  = sy-langu
      IMPORTING
        output = lv_langu
*     EXCEPTIONS
*       UNKNOWN_LANGUAGE       = 1
*       OTHERS = 2
      .
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.
    SORT lt_descupdate.
    READ TABLE lt_descupdate ASSIGNING FIELD-SYMBOL(<fs_desc>)
      WITH KEY variant = lv_variant
               language = lv_langu
      BINARY SEARCH.
    IF sy-subrc IS NOT INITIAL.
      ls_descupdate-variant = lv_variant.
      ls_descupdate-language = lv_langu.
      ls_descupdate-description = is_savevariant-description.
      APPEND ls_descupdate TO lt_descupdate.
    ELSEIF is_savevariant-variant IS INITIAL.
      <fs_desc>-description = is_savevariant-description.
    ENDIF.
*    LOOP AT is_savevariant-deepdescremove INTO DATA(ls_descremove).
*      ls_descremove-variant = lv_variant.
*      APPEND ls_descremove TO lt_descremove.
*    ENDLOOP.

* call of update if needed
    SORT lt_descupdate.
*    IF lt_descremove IS NOT INITIAL OR lt_descupdate IS NOT INITIAL .
    CREATE OBJECT lo_desc_object.

*      IF lt_descupdate IS NOT INITIAL.
    REFRESH lt_messages.
*        IF lt_descupdate[] IS NOT INITIAL.
    CALL METHOD lo_desc_object->update_desc
      EXPORTING
        iv_variant  = lv_variant
        it_desc     = lt_descupdate
      IMPORTING
        et_messages = lt_messages.
    APPEND LINES OF lt_messages TO et_messages.
*        ENDIF.
*      ENDIF.

*      IF lt_descremove IS NOT INITIAL.
*        REFRESH lt_messages.
*        CALL METHOD lo_desc_object->remove_desc
*          EXPORTING
*            it_desc     = lt_descremove
*          IMPORTING
*            et_messages = lt_messages.
*        APPEND LINES OF lt_messages TO et_messages.
*      ENDIF.
*    ENDIF.

*Update MAximum number of articles
*Update MAximum number of articles
    DATA ls_tlim_ar TYPE /dlwupex/tlim_ar.
    LOOP AT is_savevariant-deepwaupdate INTO DATA(ls_deepwaupdate).
      IF is_savevariant-iserror = abap_true.
        DATA(lv_type_err) = 'E'.
      ELSE.
        lv_type_err = 'W'.
      ENDIF.
      SELECT SINGLE nb_queue_art FROM  /dlwupex/tlim_ar
                       INTO @DATA(lv_nb_queue_art)
                       WHERE wa       =  @ls_deepwaupdate-workarea
                       AND   variant  =  @ls_deepwaupdate-variant.

      IF sy-subrc NE 0.
        SELECT SINGLE nb_queue_art FROM  /dlwupex/tlim_ar
                                   INTO  lv_nb_queue_art
                                   WHERE wa = ls_deepwaupdate-workarea
                                   .

      ENDIF.

      ls_tlim_ar-wa           = ls_deepwaupdate-workarea.
      ls_tlim_ar-variant      = ls_deepwaupdate-variant.
      ls_tlim_ar-type_err     = lv_type_err.
      ls_tlim_ar-limit        = is_savevariant-maxarticle.
      ls_tlim_ar-nb_queue_art = lv_nb_queue_art.
      MODIFY /dlwupex/tlim_ar FROM ls_tlim_ar.
      DELETE FROM /dlwupex/tlim_ar WHERE wa = ls_deepwaupdate-workarea AND variant  = ''.
    ENDLOOP.

* Update existing WA non used
    SELECT * FROM  /dlwupex/tlim_ar
                 INTO TABLE @DATA(lt_tlim_ar)
                 WHERE variant  =  @lv_variant.
    LOOP AT lt_tlim_ar INTO DATA(ls_tlim_ar_db).
      READ TABLE is_savevariant-deepwaupdate TRANSPORTING NO FIELDS
        WITH KEY workarea = ls_tlim_ar_db-wa
                 variant  = ls_tlim_ar_db-variant.
      CHECK sy-subrc IS NOT INITIAL.
      IF is_savevariant-iserror = abap_true.
        lv_type_err = 'E'.
      ELSE.
        lv_type_err = 'W'.
      ENDIF.
      SELECT SINGLE nb_queue_art FROM  /dlwupex/tlim_ar
                       INTO @lv_nb_queue_art
                       WHERE wa       =  @ls_tlim_ar_db-wa
                       AND   variant  =  @ls_tlim_ar_db-variant.

      IF sy-subrc NE 0.
        SELECT SINGLE nb_queue_art FROM  /dlwupex/tlim_ar
                                   INTO  lv_nb_queue_art
                                   WHERE wa = ls_tlim_ar_db-wa
                                   .

      ENDIF.

      ls_tlim_ar-wa           = ls_tlim_ar_db-wa.
      ls_tlim_ar-variant      = ls_tlim_ar_db-variant.
      ls_tlim_ar-type_err     = lv_type_err.
      ls_tlim_ar-limit        = is_savevariant-maxarticle.
      ls_tlim_ar-nb_queue_art = lv_nb_queue_art.
      MODIFY /dlwupex/tlim_ar FROM ls_tlim_ar.
      DELETE FROM /dlwupex/tlim_ar WHERE wa = ls_tlim_ar_db-wa AND variant  = ''.
    ENDLOOP.

    IF is_savevariant-deepwaupdate[] IS INITIAL AND is_savevariant-maxarticle IS NOT INITIAL.
      ls_messages-msgid = '/DLWUPEX/COCKPIT_ART'.
      ls_messages-msgno = '086'.
      APPEND ls_messages TO et_messages.
    ENDIF.
    lo_dpc_ext->convert_messages(
      EXPORTING
        it_messages          = et_messages
      IMPORTING
        et_messagesconverted = ld_s_deep_header->returnmessage
    ).

    IF et_messages IS NOT INITIAL.
      ROLLBACK WORK.
    ELSE.
      COMMIT WORK.
    ENDIF.
  ENDMETHOD.


  METHOD transport_variant.


    DATA : lt_users          TYPE TABLE OF scts_users,
           ls_users          TYPE scts_users,
           ls_request_header TYPE trwbo_request_header,
           lt_task_headers   TYPE TABLE OF trwbo_request_header,
           lt_varh           TYPE TABLE OF /dlwupex/tvar_h,
           lt_varau          TYPE TABLE OF /dlwupex/tvar_au,
           lt_varin          TYPE TABLE OF /dlwupex/tvar_in,
           lt_varp           TYPE TABLE OF /dlwupex/tvar_p,
           lt_vartx          TYPE TABLE OF /dlwupex/tvar_tx,
           lt_e071           TYPE tr_objects,
           ls_e071           TYPE e071,
           lt_e071k          TYPE tr_keys,
           ls_e071k          TYPE e071k,
           lv_position       TYPE ddposition.


    SELECT * FROM /dlwupex/tvar_h INTO TABLE lt_varh
      FOR ALL ENTRIES IN it_variant
      WHERE variant = it_variant-variant.
    IF sy-subrc IS NOT INITIAL.
      cv_rc = 4.
      EXIT.
    ENDIF.
    IF lt_varh IS NOT INITIAL.
      SELECT * FROM /dlwupex/tvar_au INTO TABLE lt_varau "#EC CI_NO_TRANSFORM
       FOR ALL ENTRIES IN lt_varh
       WHERE variant = lt_varh-variant.

      SELECT * FROM /dlwupex/tvar_in INTO TABLE lt_varin "#EC CI_NO_TRANSFORM
       FOR ALL ENTRIES IN lt_varh
       WHERE variant = lt_varh-variant.

      SELECT * FROM /dlwupex/tvar_p INTO TABLE lt_varp "#EC CI_NO_TRANSFORM
       FOR ALL ENTRIES IN lt_varh
       WHERE variant = lt_varh-variant.

      SELECT * FROM /dlwupex/tvar_tx INTO TABLE lt_vartx "#EC CI_NO_TRANSFORM
       FOR ALL ENTRIES IN lt_varh
       WHERE variant = lt_varh-variant.
    ENDIF.

*    CALL FUNCTION '/DLWUPEX/VG_TRANSPORT'
*      EXPORTING
*        iv_desc  = iv_description
*      IMPORTING
*        ev_otnum = ev_otnum
*      TABLES
*        it_varh  = lt_varh
*        it_varau = lt_varau
*        it_varin = lt_varin
*        it_varp  = lt_varp
*        it_vartx = lt_vartx
*      CHANGING
*        cv_rc    = cv_rc.


* create the request Order
    CALL FUNCTION 'TR_INSERT_REQUEST_WITH_TASKS'
      EXPORTING
        iv_type           = 'K'
        iv_text           = iv_description
        iv_owner          = sy-uname
      IMPORTING
        es_request_header = ls_request_header
        et_task_headers   = lt_task_headers
      EXCEPTIONS
        insert_failed     = 1
        enqueue_failed    = 2
        OTHERS            = 3.
    IF sy-subrc <> 0.
      cv_rc = 4.
      EXIT.
    ENDIF.

* alim data to be added in request order

* data from /DLWUPEX/TVAR_H

    ls_e071-trkorr = ls_request_header-trkorr.
    ls_e071-as4pos = 1.
    ls_e071-pgmid = 'R3TR'.
    ls_e071-object = 'TABU'.
    ls_e071-obj_name = '/DLWUPEX/TVAR_H'.
    ls_e071-objfunc = 'K'.
    ls_e071-lang = sy-langu.
    APPEND ls_e071 TO lt_e071.

    CLEAR lv_position.
    LOOP AT lt_varh ASSIGNING FIELD-SYMBOL(<fs_varh>).
      lv_position = lv_position + 1.

      ls_e071k-trkorr = ls_request_header-trkorr.
      ls_e071k-pgmid = 'R3TR'.
      ls_e071k-object = 'TABU'.
      ls_e071k-objname = '/DLWUPEX/TVAR_H'.
      ls_e071k-as4pos = lv_position.
      ls_e071k-mastertype = 'TABU'.
      ls_e071k-mastername = '/DLWUPEX/TVAR_H'.
      ls_e071k-lang = sy-langu.
      ls_e071k-tabkey = <fs_varh>-mandt && <fs_varh>-work_area && <fs_varh>-variant.
      APPEND ls_e071k TO lt_e071k.

      CLEAR ls_e071k.

    ENDLOOP.


* data from /DLWUPEX/TVAR_AU

    IF lt_varau IS  NOT INITIAL.

      CLEAR ls_e071.
      ls_e071-trkorr = ls_request_header-trkorr.
      ls_e071-as4pos = 2.
      ls_e071-pgmid = 'R3TR'.
      ls_e071-object = 'TABU'.
      ls_e071-obj_name = '/DLWUPEX/TVAR_AU'.
      ls_e071-objfunc = 'K'.
      ls_e071-lang = sy-langu.
      APPEND ls_e071 TO lt_e071.

      SORT lt_varau.
      DELETE ADJACENT DUPLICATES FROM lt_varau COMPARING variant.
      CLEAR lv_position.
      LOOP AT lt_varau ASSIGNING FIELD-SYMBOL(<fs_varau>).
        lv_position = lv_position + 1.

        ls_e071k-trkorr = ls_request_header-trkorr.
        ls_e071k-pgmid = 'R3TR'.
        ls_e071k-object = 'TABU'.
        ls_e071k-objname = '/DLWUPEX/TVAR_AU'.
        ls_e071k-as4pos = lv_position.
        ls_e071k-mastertype = 'TABU'.
        ls_e071k-mastername = '/DLWUPEX/TVAR_AU'.
        ls_e071k-lang = sy-langu.
        ls_e071k-tabkey = <fs_varau>-mandt && <fs_varau>-variant && '*'.
        APPEND ls_e071k TO lt_e071k.

        CLEAR ls_e071k.

      ENDLOOP.

    ENDIF.


* data from /DLWUPEX/TVAR_IN
    IF lt_varin IS  NOT INITIAL.
      CLEAR ls_e071.
      ls_e071-trkorr = ls_request_header-trkorr.
      ls_e071-as4pos = 2.
      ls_e071-pgmid = 'R3TR'.
      ls_e071-object = 'TABU'.
      ls_e071-obj_name = '/DLWUPEX/TVAR_IN'.
      ls_e071-objfunc = 'K'.
      ls_e071-lang = sy-langu.
      APPEND ls_e071 TO lt_e071.

      SORT lt_varin.
      DELETE ADJACENT DUPLICATES FROM lt_varin COMPARING variant.
      CLEAR lv_position.
      LOOP AT lt_varin ASSIGNING FIELD-SYMBOL(<fs_varin>).
        lv_position = lv_position + 1.

        ls_e071k-trkorr = ls_request_header-trkorr.
        ls_e071k-pgmid = 'R3TR'.
        ls_e071k-object = 'TABU'.
        ls_e071k-objname = '/DLWUPEX/TVAR_IN'.
        ls_e071k-as4pos = lv_position.
        ls_e071k-mastertype = 'TABU'.
        ls_e071k-mastername = '/DLWUPEX/TVAR_IN'.
        ls_e071k-lang = sy-langu.
        ls_e071k-tabkey = <fs_varin>-mandt && <fs_varin>-variant && '*'.
        APPEND ls_e071k TO lt_e071k.

        CLEAR ls_e071k.

      ENDLOOP.
    ENDIF.


* data from /DLWUPEX/TVAR_P
    IF lt_varp IS  NOT INITIAL.
      CLEAR ls_e071.
      ls_e071-trkorr = ls_request_header-trkorr.
      ls_e071-as4pos = 2.
      ls_e071-pgmid = 'R3TR'.
      ls_e071-object = 'TABU'.
      ls_e071-obj_name = '/DLWUPEX/TVAR_P'.
      ls_e071-objfunc = 'K'.
      ls_e071-lang = sy-langu.
      APPEND ls_e071 TO lt_e071.

      SORT lt_varp.
      DELETE ADJACENT DUPLICATES FROM lt_varp COMPARING variant.
      CLEAR lv_position.
      LOOP AT lt_varp ASSIGNING FIELD-SYMBOL(<fs_varp>).
        lv_position = lv_position + 1.

        ls_e071k-trkorr = ls_request_header-trkorr.
        ls_e071k-pgmid = 'R3TR'.
        ls_e071k-object = 'TABU'.
        ls_e071k-objname = '/DLWUPEX/TVAR_P'.
        ls_e071k-as4pos = lv_position.
        ls_e071k-mastertype = 'TABU'.
        ls_e071k-mastername = '/DLWUPEX/TVAR_P'.
        ls_e071k-lang = sy-langu.
        ls_e071k-tabkey = <fs_varp>-mandt && <fs_varp>-variant && '*'.
        APPEND ls_e071k TO lt_e071k.

        CLEAR ls_e071k.

      ENDLOOP.
    ENDIF.


* data from /DLWUPEX/TVAR_TX
    IF lt_vartx IS  NOT INITIAL.
      CLEAR ls_e071.
      ls_e071-trkorr = ls_request_header-trkorr.
      ls_e071-as4pos = 2.
      ls_e071-pgmid = 'R3TR'.
      ls_e071-object = 'TABU'.
      ls_e071-obj_name = '/DLWUPEX/TVAR_TX'.
      ls_e071-objfunc = 'K'.
      ls_e071-lang = sy-langu.
      APPEND ls_e071 TO lt_e071.

      SORT lt_vartx.
      DELETE ADJACENT DUPLICATES FROM lt_vartx COMPARING variant.
      CLEAR lv_position.
      LOOP AT lt_vartx ASSIGNING FIELD-SYMBOL(<fs_vartx>).
        lv_position = lv_position + 1.

        ls_e071k-trkorr = ls_request_header-trkorr.
        ls_e071k-pgmid = 'R3TR'.
        ls_e071k-object = 'TABU'.
        ls_e071k-objname = '/DLWUPEX/TVAR_TX'.
        ls_e071k-as4pos = lv_position.
        ls_e071k-mastertype = 'TABU'.
        ls_e071k-mastername = '/DLWUPEX/TVAR_TX'.
        ls_e071k-lang = sy-langu.
        ls_e071k-tabkey = <fs_vartx>-mandt && <fs_vartx>-variant && '*'.
        APPEND ls_e071k TO lt_e071k.

        CLEAR ls_e071k.

      ENDLOOP.
    ENDIF.

    CALL FUNCTION 'TR_REQUEST_CHOICE'
      EXPORTING
        iv_suppress_dialog   = 'X'
        iv_request           = ls_request_header-trkorr
        it_e071              = lt_e071
        it_e071k             = lt_e071k
      EXCEPTIONS
        invalid_request      = 1
        invalid_request_type = 2
        user_not_owner       = 3
        no_objects_appended  = 4
        enqueue_error        = 5
        cancelled_by_user    = 6
        recursive_call       = 7
        OTHERS               = 8.
    IF sy-subrc <> 0.
      cv_rc = 4.
      EXIT.
    ELSE.
      ev_otnum = ls_request_header-trkorr.
    ENDIF.


  ENDMETHOD.


  method update_header.


    modify /dlwupex/tvar_tx from es_header.

  endmethod.


  method update_variant.

  endmethod.
ENDCLASS.
