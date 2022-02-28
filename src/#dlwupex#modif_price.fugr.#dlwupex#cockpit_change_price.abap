FUNCTION /dlwupex/cockpit_change_price.
*"----------------------------------------------------------------------
*"*"Interface locale :
*"  IMPORTING
*"     REFERENCE(IS_COND) TYPE  /DLWUPEX/PRICE_COND
*"  EXPORTING
*"     REFERENCE(ET_MESSAGE) TYPE  BAPIRET2_T
*"----------------------------------------------------------------------


  DATA : ls_e1komg TYPE e1komg,
         ls_e1konh TYPE e1konh,
         ls_e1konp TYPE e1konp.

  DATA : lt_idoc_data          TYPE TABLE OF edidd,
         ls_idoc_data          TYPE          edidd,
         lt_idoc_contrl        TYPE TABLE OF edidc,
         ls_idoc_contrl        TYPE          edidc,
         lt_idoc_status        TYPE TABLE OF bdidocstat,
         lt_return_variables   TYPE TABLE OF bdwfretvar,
         ls_message            TYPE bapiret2,
         lt_serialization_info TYPE TABLE OF bdi_ser.
  DATA : lv_input_method    LIKE  bdwfap_par-inputmethd,
         lv_mass_processing LIKE  bdwfap_par-mass_proc.


  READ TABLE gt_t685a INTO DATA(ls_t685a)
     WITH KEY kappl = is_cond-applicatio
              kschl = is_cond-cond_type
     BINARY SEARCH.
  IF sy-subrc IS NOT INITIAL.
    SELECT * FROM t685a APPENDING TABLE gt_t685a WHERE
      kappl = is_cond-applicatio AND
      kschl = is_cond-cond_type.
    SORT gt_t685a.
    READ TABLE gt_t685a INTO ls_t685a
      WITH KEY kappl = is_cond-applicatio
               kschl = is_cond-cond_type
      BINARY SEARCH.
  ENDIF.

  IF  is_cond-base_uom IS INITIAL OR
      is_cond-condcurr IS INITIAL OR
      is_cond-cond_p_unt IS INITIAL OR
      is_cond-cond_unit IS INITIAL OR
      is_cond-valid_from IS INITIAL OR
      is_cond-valid_to IS INITIAL.
    ls_message-type = 'E'.
    ls_message-id = '/DLWUPEX/COCKPIT_ART'.
    ls_message-number = '80'.
    MESSAGE ID ls_message-id TYPE ls_message-type
        NUMBER ls_message-number INTO ls_message-message.
    APPEND ls_message TO et_message.
    EXIT.
  ENDIF.


  CLEAR ls_e1komg.
  ls_e1komg-kvewe	= is_cond-cond_usage.
  ls_e1komg-kotabnr	= is_cond-table_no.
  ls_e1komg-kappl	= is_cond-applicatio.
  ls_e1komg-kschl	= is_cond-cond_type.
  ls_e1komg-vakey	= is_cond-varkey.
  ls_e1komg-vrkme	= is_cond-cond_unit.
  CLEAR ls_idoc_data.
  ls_idoc_data-docnum = '1'.
  ls_idoc_data-segnam = 'E1KOMG'.
  ls_idoc_data-sdata  = ls_e1komg.
  APPEND ls_idoc_data TO lt_idoc_data.

  CLEAR ls_e1konh.
  ls_e1konh-datab  = is_cond-valid_from.
  ls_e1konh-datbi	= is_cond-valid_to.
  CLEAR ls_idoc_data.
  ls_idoc_data-docnum = '1'.
  ls_idoc_data-segnam = 'E1KONH'.
  ls_idoc_data-sdata  = ls_e1konh.
  APPEND ls_idoc_data TO lt_idoc_data.

  CLEAR ls_e1konp.
  ls_e1konp-kschl	= is_cond-cond_type.
  ls_e1konp-krech	= ls_t685a-krech.
  ls_e1konp-kbetr	= is_cond-cond_value.
  ls_e1konp-konwa	= is_cond-condcurr.
  ls_e1konp-kpein	= is_cond-cond_p_unt.
  ls_e1konp-kmein  = is_cond-cond_unit.
*  ls_e1konp-kumza  = '1'.
*  ls_e1konp-kumne  = '1'.
  ls_e1konp-meins  = is_cond-base_uom.
  ls_e1konp-kznep = ls_t685a-kznep.
  ls_e1konp-vkkal	= ls_t685a-vkkal.
  CLEAR ls_idoc_data.
  ls_idoc_data-docnum = '1'.
  ls_idoc_data-segnam = 'E1KONP'.
  ls_idoc_data-sdata  = ls_e1konp.
  APPEND ls_idoc_data TO lt_idoc_data.

  CLEAR ls_idoc_contrl.
  ls_idoc_contrl-docnum = '1'.
  APPEND ls_idoc_contrl TO lt_idoc_contrl.

  CALL FUNCTION 'IDOC_INPUT_COND_A'
    EXPORTING
      input_method          = lv_input_method
      mass_processing       = lv_mass_processing
    TABLES
      idoc_contrl           = lt_idoc_contrl
      idoc_data             = lt_idoc_data
      idoc_status           = lt_idoc_status
      return_variables      = lt_return_variables
      serialization_info    = lt_serialization_info
    EXCEPTIONS
      wrong_function_called = 1
      OTHERS                = 2.
  IF sy-subrc EQ 0.
    LOOP AT lt_idoc_status ASSIGNING FIELD-SYMBOL(<ls_status>).
      IF <ls_status>-status <> '53'. "Application document posted
        ls_message-type = <ls_status>-msgty.
        ls_message-id = <ls_status>-msgid.
        ls_message-number = <ls_status>-msgno.
        ls_message-message_v1 = <ls_status>-msgv1.
        ls_message-message_v2 = <ls_status>-msgv2.
        ls_message-message_v3 = <ls_status>-msgv3.
        ls_message-message_v4 = <ls_status>-msgv4.
        MESSAGE ID ls_message-id TYPE  <ls_status>-msgty
            NUMBER ls_message-number INTO ls_message-message
           WITH ls_message-message_v1 ls_message-message_v2
                ls_message-message_v3 ls_message-message_v4.

        APPEND ls_message TO et_message.
      ENDIF.
    ENDLOOP.
  ENDIF.




ENDFUNCTION.
