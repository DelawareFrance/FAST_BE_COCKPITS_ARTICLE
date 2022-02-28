FUNCTION /dlwupex/cockpit_rfc_art_list.
*"----------------------------------------------------------------------
*"*"Interface locale :
*"  IMPORTING
*"     VALUE(IV_BU) TYPE  /DLWUPEX/EBUSUNITID
*"     VALUE(IV_REQID) TYPE  /DLWUPEX/EREQID
*"----------------------------------------------------------------------

  DATA :lv_method TYPE string,
        lv_class  TYPE /dlwupex/evalue,
        ls_msg    TYPE /dlwupex/tmsg,
        lt_msg    TYPE /dlwupex/tmsg_tt,
        lv_rc     TYPE sysubrc.

  SELECT SINGLE value INTO lv_class FROM /dlwupex/tcusto
      WHERE name = 'CLASSNAME'.
  IF sy-subrc IS NOT INITIAL.
    ls_msg-type       = 'E'.
    ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
    ls_msg-num        = '022'.
    MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num.
  ENDIF.

  TRY.
      CALL METHOD (lv_class)=>bapi_create_bom_listing
        EXPORTING
          iv_bu    = iv_bu
          iv_reqid = iv_reqid
        CHANGING
          cv_rc    = lv_rc
          ct_msg   = lt_msg.

      IF lv_rc IS NOT INITIAL.
        READ TABLE lt_msg INTO ls_msg INDEX 1.
        IF sy-subrc IS NOT INITIAL.
          ls_msg-id         = iv_bu.
          ls_msg-reqid      = iv_reqid.
*          ls_msg-matnr      = iv_matnr.
          ls_msg-viewname   = '01'. "general Data
          ls_msg-type       = 'E'.
          ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
          ls_msg-num        = '020'.
          ls_msg-message_v1 = 'BOM/LISTING'.
        ENDIF.
*        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
*          INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2
*                                   ls_msg-message_v3 ls_msg-message_v4.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          WITH ls_msg-message_v1 ls_msg-message_v2
               ls_msg-message_v3 ls_msg-message_v4.
*        EXIT.
*      ELSE.
*        CALL METHOD (lv_class)=>valid_step
*          EXPORTING
*            iv_bu     = iv_bu
*            iv_reqid  = iv_reqid
*            iv_step   = <fs_steps>-step
*            iv_artkey = iv_matnr
*          CHANGING
*            cv_rc     = lv_rc
*            ct_msg    = lt_msg.
      ENDIF.
    CATCH cx_sy_dyn_call_illegal_method.
*           Erreur lors de l'appel de la méthode. Celle-ci n'existe pas
      CLEAR ls_msg.
      ls_msg-id         = iv_bu.
      ls_msg-reqid      = iv_reqid.
*      ls_msg-matnr      = iv_matnr.
      ls_msg-viewname   = '01'. "general Data
      ls_msg-type       = 'E'.
      ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
      ls_msg-num        = '001'.
      ls_msg-message_v1 = 'BAPI_CREATE_BOM_LISTING'.
      ls_msg-message_v2 = lv_class.
      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2
                                 ls_msg-message_v3 ls_msg-message_v4.

      APPEND ls_msg TO lt_msg.
*
*      CALL METHOD (lv_class)=>set_queue_error
*        EXPORTING
*          iv_bu    = iv_bu
*          iv_reqid = iv_reqid
*          iv_matnr = iv_matnr
*        CHANGING
*          cv_rc    = lv_rc
*          ct_msg   = lt_msg.

      MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
        WITH ls_msg-message_v1 ls_msg-message_v2.
  ENDTRY.

ENDFUNCTION.
