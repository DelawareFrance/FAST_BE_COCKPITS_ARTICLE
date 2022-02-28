FUNCTION /dlwupex/cockpit_rfc_check.
*"----------------------------------------------------------------------
*"*"Interface locale :
*"  IMPORTING
*"     VALUE(IV_BU) TYPE  /DLWUPEX/EBUSUNITID
*"     VALUE(IV_REQID) TYPE  /DLWUPEX/EREQID
*"  CHANGING
*"     VALUE(CT_VIEWS) TYPE  /DLWUPEX/TVIEW_TT
*"----------------------------------------------------------------------

  DATA : lv_step   TYPE /dlwupex/estep,
         lt_steps  TYPE TABLE OF /dlwupex/tsteps,
         lv_method TYPE string,
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

  REFRESH lt_msg.

  CALL METHOD /dlwupex/cl_cockpit_article=>get_instance
    EXPORTING
      iv_bu     = iv_bu
    RECEIVING
      rv_object = data(lv_object).
  IF lv_object IS NOT INITIAL.
    CALL METHOD lv_object->/dlwupex/if_cockpit_article~check_views
      CHANGING
        ct_tview = ct_views
        ct_msg   = lt_msg.
  ENDIF.

  CALL METHOD (lv_class)=>insert_msg_in_worklist
    EXPORTING
      it_msg = lt_msg
    CHANGING
      cv_rc  = lv_rc.


ENDFUNCTION.
