FUNCTION /dlwupex/vg_transport.
*"----------------------------------------------------------------------
*"*"Interface locale :
*"  IMPORTING
*"     VALUE(IV_DESC) TYPE  TRORDERTXT
*"  EXPORTING
*"     VALUE(EV_OTNUM) TYPE  TRKORR
*"  TABLES
*"      IT_VARH TYPE  /DLWUPEX/TVAR_H_TT
*"      IT_VARAU TYPE  /DLWUPEX/TVAR_AU_TT
*"      IT_VARIN TYPE  /DLWUPEX/TVAR_IN_TT
*"      IT_VARP TYPE  /DLWUPEX/TVAR_P_TT
*"      IT_VARTX TYPE  /DLWUPEX/TVAR_TX_TT
*"  CHANGING
*"     VALUE(CV_RC) TYPE  SYSUBRC
*"----------------------------------------------------------------------
  DATA : lt_users          TYPE TABLE OF scts_users,
         ls_users          TYPE scts_users,
         ls_request_header TYPE trwbo_request_header,
         lt_task_headers   TYPE TABLE OF trwbo_request_header,
         lt_e071           TYPE tr_objects,
         ls_e071           TYPE e071,
         lt_e071k          TYPE tr_keys,
         ls_e071k          TYPE e071k,
         lv_position       TYPE ddposition.


* Modif data of Mandant 030 with data of 020

  CHECK it_varh IS NOT INITIAL.

  LOOP AT it_varh ASSIGNING FIELD-SYMBOL(<fs_varh>).
    DELETE FROM /dlwupex/tvar_h WHERE work_area = <fs_varh>-work_area AND
                                      variant = <fs_varh>-variant.

    DELETE FROM /dlwupex/tvar_au WHERE variant = <fs_varh>-variant.
    DELETE FROM /dlwupex/tvar_in WHERE variant = <fs_varh>-variant.
    DELETE FROM /dlwupex/tvar_p WHERE variant = <fs_varh>-variant.
    DELETE FROM /dlwupex/tvar_tx WHERE variant = <fs_varh>-variant.

  ENDLOOP.

  INSERT /dlwupex/tvar_h FROM TABLE it_varh.

  IF it_varau IS NOT INITIAL.
    INSERT /dlwupex/tvar_au FROM TABLE it_varau.
  ENDIF.
  IF it_varin IS NOT INITIAL.
    INSERT /dlwupex/tvar_in FROM TABLE it_varin.
  ENDIF.
  IF it_varp IS NOT INITIAL.
    INSERT /dlwupex/tvar_p FROM TABLE it_varp.
  ENDIF.
  IF it_vartx IS NOT INITIAL.
    INSERT /dlwupex/tvar_tx FROM TABLE it_vartx.
  ENDIF.


* create the request Order
  CALL FUNCTION 'TR_INSERT_REQUEST_WITH_TASKS'
    EXPORTING
      iv_type           = 'K'
      iv_text           = iv_desc
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
  LOOP AT it_varh ASSIGNING <fs_varh>.
    lv_position = lv_position + 1.

    ls_e071k-trkorr = ls_request_header-trkorr.
    ls_e071k-pgmid = 'R3TR'.
    ls_e071k-object = 'TABU'.
    ls_e071k-objname = '/DLWUPEX/TVAR_H'.
    ls_e071k-as4pos = lv_position.
    ls_e071k-mastertype = 'TABU'.
    ls_e071k-mastername = '/DLWUPEX/TVAR_H'.
    ls_e071k-lang = sy-langu.
    ls_e071k-tabkey = <fs_varh>-work_area && <fs_varh>-variant.
    APPEND ls_e071k TO lt_e071k.

    CLEAR ls_e071k.

  ENDLOOP.


* DATA from /DLWUPEX/TVAR_AU

  CLEAR ls_e071.
  ls_e071-trkorr = ls_request_header-trkorr.
  ls_e071-as4pos = 2.
  ls_e071-pgmid = 'R3TR'.
  ls_e071-object = 'TABU'.
  ls_e071-obj_name = '/DLWUPEX/TVAR_AU'.
  ls_e071-objfunc = 'K'.
  ls_e071-lang = sy-langu.
  APPEND ls_e071 TO lt_e071.

  CLEAR lv_position.
  LOOP AT it_varau ASSIGNING FIELD-SYMBOL(<fs_varau>).
    lv_position = lv_position + 1.

    ls_e071k-trkorr = ls_request_header-trkorr.
    ls_e071k-pgmid = 'R3TR'.
    ls_e071k-object = 'TABU'.
    ls_e071k-objname = '/DLWUPEX/TVAR_AU'.
    ls_e071k-as4pos = lv_position.
    ls_e071k-mastertype = 'TABU'.
    ls_e071k-mastername = '/DLWUPEX/TVAR_AU'.
    ls_e071k-lang = sy-langu.
    ls_e071k-tabkey = <fs_varau>-variant.
    APPEND ls_e071k TO lt_e071k.

    CLEAR ls_e071k.

  ENDLOOP.


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



ENDFUNCTION.
