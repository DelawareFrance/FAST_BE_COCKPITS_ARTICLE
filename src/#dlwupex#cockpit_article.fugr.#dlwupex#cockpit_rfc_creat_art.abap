FUNCTION /dlwupex/cockpit_rfc_creat_art.
*"----------------------------------------------------------------------
*"*"Interface locale :
*"  IMPORTING
*"     VALUE(IV_BU) TYPE  /DLWUPEX/EBUSUNITID
*"     VALUE(IV_REQID) TYPE  /DLWUPEX/EREQID
*"     VALUE(IV_MATNR) TYPE  MATNR
*"----------------------------------------------------------------------

  DATA : lv_step   TYPE /dlwupex/estep,
         lt_steps  TYPE TABLE OF /dlwupex/tsteps,
         lv_method TYPE string,
         lv_class  TYPE /dlwupex/evalue,
         ls_msg    TYPE /dlwupex/tmsg,
         lt_msg    TYPE /dlwupex/tmsg_tt,
         lv_rc     TYPE sysubrc.

  DATA : lv_subkey TYPE string.
  DATA ts_diff TYPE timestampl.
  DATA tsav  TYPE timestampl.
  DATA tsap  TYPE timestampl.
  DATA tseav TYPE timestampl.
  DATA tseap TYPE timestampl.
  DATA : tsaps  TYPE string,
         tsavs  TYPE string,
         tseavs TYPE string,
         tseaps TYPE string.

  GET TIME STAMP FIELD tsav.

  SELECT SINGLE value INTO lv_class FROM /dlwupex/tcusto
      WHERE name = 'CLASSNAME'.
  IF sy-subrc IS NOT INITIAL.
    ls_msg-type       = 'E'.
    ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
    ls_msg-num        = '022'.
    MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num.
  ENDIF.

  SELECT * INTO TABLE lt_steps FROM /dlwupex/tsteps
     WHERE id = iv_bu.
  IF sy-subrc IS NOT INITIAL.
    ls_msg-type       = 'E'.
    ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
    ls_msg-num        = '021'.
    MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num.
  ENDIF.


  SELECT SINGLE step INTO lv_step FROM /dlwupex/tgdata
    WHERE id = iv_bu AND
          reqid = iv_reqid AND
          art_key = iv_matnr.

  SORT  lt_steps BY step DESCENDING.
  READ TABLE lt_steps INTO DATA(ls_steps) INDEX 1.
  IF lv_step > ls_steps-step.
    EXIT.
  ENDIF.

  SORT  lt_steps BY step.
  READ TABLE lt_steps TRANSPORTING NO FIELDS
    WITH KEY step = lv_step
    BINARY SEARCH.
  IF sy-subrc IS NOT INITIAL.
    ls_msg-type       = 'E'.
    ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
    ls_msg-num        = '021'.
    MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num.
  ENDIF.

  LOOP AT lt_steps ASSIGNING FIELD-SYMBOL(<fs_steps>) FROM sy-tabix.
    REFRESH lt_msg.
    GET TIME STAMP FIELD tseav.
    TRY.
        CALL METHOD (lv_class)=>(<fs_steps>-method)
          EXPORTING
            iv_bu    = iv_bu
            iv_reqid = iv_reqid
            iv_matnr = iv_matnr
          CHANGING
            cv_rc    = lv_rc
            ct_msg   = lt_msg.

        IF lv_rc IS NOT INITIAL.
          READ TABLE lt_msg INTO ls_msg INDEX 1.
          IF sy-subrc IS NOT INITIAL.
            ls_msg-id         = iv_bu.
            ls_msg-reqid      = iv_reqid.
            ls_msg-matnr      = iv_matnr.
            ls_msg-viewname   = '01'. "general Data
            ls_msg-type       = 'E'.
            ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
            ls_msg-num        = '020'.
            ls_msg-message_v1 = <fs_steps>-step.
            MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
              INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2
                                       ls_msg-message_v3 ls_msg-message_v4.
          ENDIF.
          EXIT.
        ELSE.
          CALL METHOD (lv_class)=>valid_step
            EXPORTING
              iv_bu     = iv_bu
              iv_reqid  = iv_reqid
              iv_step   = <fs_steps>-step
              iv_artkey = iv_matnr
            CHANGING
              cv_rc     = lv_rc
              ct_msg    = lt_msg.
        ENDIF.
      CATCH cx_sy_dyn_call_illegal_method.
*           Erreur lors de l'appel de la méthode. Celle-ci n'existe pas
        CLEAR ls_msg.
        ls_msg-id         = iv_bu.
        ls_msg-reqid      = iv_reqid.
        ls_msg-matnr      = iv_matnr.
        ls_msg-viewname   = '01'. "general Data
        ls_msg-type       = 'E'.
        ls_msg-idmsg      = '/DLWUPEX/COCKPIT_ART'.
        ls_msg-num        = '001'.
        ls_msg-message_v1 = <fs_steps>-method.
        ls_msg-message_v2 = lv_class.
        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          INTO ls_msg-message WITH ls_msg-message_v1 ls_msg-message_v2
                                   ls_msg-message_v3 ls_msg-message_v4.

        APPEND ls_msg TO lt_msg.

        CALL METHOD (lv_class)=>set_queue_error
          EXPORTING
            iv_bu    = iv_bu
            iv_reqid = iv_reqid
            iv_matnr = iv_matnr
          CHANGING
            cv_rc    = lv_rc
            ct_msg   = lt_msg.

        MESSAGE ID ls_msg-idmsg TYPE ls_msg-type NUMBER ls_msg-num
          WITH ls_msg-message_v1 ls_msg-message_v2.
    ENDTRY.


    GET TIME STAMP FIELD tseap.
    tseaps = tseap.
    tseavs = tseav.

    ts_diff = ( ( tseaps+8(2) * 3600 ) + ( tseaps+10(2) * 60 ) + tseaps+12(9) ) -
              ( ( tseavs+8(2) * 3600 ) + ( tseavs+10(2) * 60 ) + tseavs+12(9) ).

    lv_subkey = iv_bu && | | && iv_reqid && | | && <fs_steps>-method && | | && lv_rc.
    IF ts_diff < '1'."en seconde
      lv_subkey = lv_subkey && | <1s|.
    ELSEIF ts_diff < '2'."en seconde
      lv_subkey = lv_subkey && | <2s|.
    ELSEIF ts_diff < '3'."en seconde
      lv_subkey = lv_subkey && | <3s|.
    ELSEIF ts_diff < '4'."en seconde
      lv_subkey = lv_subkey && | <4s|.
    ELSEIF ts_diff < '5'."en seconde
      lv_subkey = lv_subkey && | <5s|.

    ELSEIF ts_diff < '6'."en seconde
      lv_subkey = lv_subkey && | <6s|.
    ELSEIF ts_diff < '7'."en seconde
      lv_subkey = lv_subkey && | <7s|.
    ELSEIF ts_diff < '8'."en seconde
      lv_subkey = lv_subkey && | <8s|.
    ELSEIF ts_diff < '9'."en seconde
      lv_subkey = lv_subkey && | <9s|.

    ELSEIF ts_diff < '10'."en seconde
      lv_subkey = lv_subkey && | <10s|.

    ELSEIF ts_diff < '11'."en seconde
      lv_subkey = lv_subkey && | <11s|.
    ELSEIF ts_diff < '12'."en seconde
      lv_subkey = lv_subkey && | <12s|.
    ELSEIF ts_diff < '13'."en seconde
      lv_subkey = lv_subkey && | <13s|.
    ELSEIF ts_diff < '14'."en seconde
      lv_subkey = lv_subkey && | <14s|.
    ELSEIF ts_diff < '15'."en seconde
      lv_subkey = lv_subkey && | <15s|.
    ELSEIF ts_diff < '16'."en seconde
      lv_subkey = lv_subkey && | <16s|.
    ELSEIF ts_diff < '17'."en seconde
      lv_subkey = lv_subkey && | <17s|.
    ELSEIF ts_diff < '18'."en seconde
      lv_subkey = lv_subkey && | <18s|.
    ELSEIF ts_diff < '19'."en seconde
      lv_subkey = lv_subkey && | <19s|.


    ELSEIF ts_diff < '20'."en seconde
      lv_subkey = lv_subkey && | <20s|.
    ELSEIF ts_diff < '30'."en seconde
      lv_subkey = lv_subkey && | <30s|.
    ELSEIF ts_diff < '40'."en seconde
      lv_subkey = lv_subkey && | <40s|.
    ELSEIF ts_diff < '50'."en seconde
      lv_subkey = lv_subkey && | <50s|.
    ELSEIF ts_diff < '60'."en seconde
      lv_subkey = lv_subkey && | <60s|.
    ELSEIF ts_diff < '70'."en seconde
      lv_subkey = lv_subkey && | <70s|.
    ELSEIF ts_diff < '80'."en seconde
      lv_subkey = lv_subkey && | <80s|.
    ELSEIF ts_diff < '90'."en seconde
      lv_subkey = lv_subkey && | <90s|.
    ELSEIF ts_diff < '100'."en seconde
      lv_subkey = lv_subkey && | <100s|.
    ELSEIF ts_diff < '110'."en seconde
      lv_subkey = lv_subkey && | <110s|.
    ELSEIF ts_diff < '120'."en seconde
      lv_subkey = lv_subkey && | <120s|.
    ELSEIF ts_diff < '130'."en seconde
      lv_subkey = lv_subkey && | <130s|.
    ELSEIF ts_diff < '140'."en seconde
      lv_subkey = lv_subkey && | <140s|.
    ELSEIF ts_diff < '150'."en seconde
      lv_subkey = lv_subkey && | <150s|.
    ELSEIF ts_diff < '160'."en seconde
      lv_subkey = lv_subkey && | <160s|.
    ELSEIF ts_diff < '170'."en seconde
      lv_subkey = lv_subkey && | <170s|.
    ELSEIF ts_diff < '180'."en seconde
      lv_subkey = lv_subkey && | <180s|.
    ELSEIF ts_diff < '190'."en seconde
      lv_subkey = lv_subkey && | <190s|.
    ELSEIF ts_diff < '200'."en seconde
      lv_subkey = lv_subkey && | <200s|.
    ELSE.
      lv_subkey = lv_subkey && ts_diff && |s|.
    ENDIF.
    LOG-POINT ID /dlwupex/cockpit_aticle SUBKEY lv_subkey.

*    COMMIT WORK."pose problème pour le listing

  ENDLOOP.

  GET TIME STAMP FIELD tsap.

  tsaps = tsap.
  tsavs = tsav.
  ts_diff = ( ( tsaps+8(2) * 3600 ) + ( tsaps+10(2) * 60 ) + tsaps+12(9) ) -
            ( ( tsavs+8(2) * 3600 ) + ( tsavs+10(2) * 60 ) + tsavs+12(9) ).


  lv_subkey = iv_bu && | | && iv_reqid && | | && lv_rc.
  IF ts_diff < '1'."en seconde
    lv_subkey = lv_subkey && | <1s|.
  ELSEIF ts_diff < '2'."en seconde
    lv_subkey = lv_subkey && | <2s|.
  ELSEIF ts_diff < '3'."en seconde
    lv_subkey = lv_subkey && | <3s|.
  ELSEIF ts_diff < '4'."en seconde
    lv_subkey = lv_subkey && | <4s|.
  ELSEIF ts_diff < '5'."en seconde
    lv_subkey = lv_subkey && | <5s|.

  ELSEIF ts_diff < '6'."en seconde
    lv_subkey = lv_subkey && | <6s|.
  ELSEIF ts_diff < '7'."en seconde
    lv_subkey = lv_subkey && | <7s|.
  ELSEIF ts_diff < '8'."en seconde
    lv_subkey = lv_subkey && | <8s|.
  ELSEIF ts_diff < '9'."en seconde
    lv_subkey = lv_subkey && | <9s|.

  ELSEIF ts_diff < '10'."en seconde
    lv_subkey = lv_subkey && | <10s|.

  ELSEIF ts_diff < '11'."en seconde
    lv_subkey = lv_subkey && | <11s|.
  ELSEIF ts_diff < '12'."en seconde
    lv_subkey = lv_subkey && | <12s|.
  ELSEIF ts_diff < '13'."en seconde
    lv_subkey = lv_subkey && | <13s|.
  ELSEIF ts_diff < '14'."en seconde
    lv_subkey = lv_subkey && | <14s|.
  ELSEIF ts_diff < '15'."en seconde
    lv_subkey = lv_subkey && | <15s|.
  ELSEIF ts_diff < '16'."en seconde
    lv_subkey = lv_subkey && | <16s|.
  ELSEIF ts_diff < '17'."en seconde
    lv_subkey = lv_subkey && | <17s|.
  ELSEIF ts_diff < '18'."en seconde
    lv_subkey = lv_subkey && | <18s|.
  ELSEIF ts_diff < '19'."en seconde
    lv_subkey = lv_subkey && | <19s|.

  ELSEIF ts_diff < '20'."en seconde
    lv_subkey = lv_subkey && | <20s|.
  ELSEIF ts_diff < '30'."en seconde
    lv_subkey = lv_subkey && | <30s|.
  ELSEIF ts_diff < '40'."en seconde
    lv_subkey = lv_subkey && | <40s|.
  ELSEIF ts_diff < '50'."en seconde
    lv_subkey = lv_subkey && | <50s|.
  ELSEIF ts_diff < '60'."en seconde
    lv_subkey = lv_subkey && | <60s|.
  ELSEIF ts_diff < '70'."en seconde
    lv_subkey = lv_subkey && | <70s|.
  ELSEIF ts_diff < '80'."en seconde
    lv_subkey = lv_subkey && | <80s|.
  ELSEIF ts_diff < '90'."en seconde
    lv_subkey = lv_subkey && | <90s|.
  ELSEIF ts_diff < '100'."en seconde
    lv_subkey = lv_subkey && | <100s|.
  ELSEIF ts_diff < '110'."en seconde
    lv_subkey = lv_subkey && | <110s|.
  ELSEIF ts_diff < '120'."en seconde
    lv_subkey = lv_subkey && | <120s|.
  ELSEIF ts_diff < '130'."en seconde
    lv_subkey = lv_subkey && | <130s|.
  ELSEIF ts_diff < '140'."en seconde
    lv_subkey = lv_subkey && | <140s|.
  ELSEIF ts_diff < '150'."en seconde
    lv_subkey = lv_subkey && | <150s|.
  ELSEIF ts_diff < '160'."en seconde
    lv_subkey = lv_subkey && | <160s|.
  ELSEIF ts_diff < '170'."en seconde
    lv_subkey = lv_subkey && | <170s|.
  ELSEIF ts_diff < '180'."en seconde
    lv_subkey = lv_subkey && | <180s|.
  ELSEIF ts_diff < '190'."en seconde
    lv_subkey = lv_subkey && | <190s|.
  ELSEIF ts_diff < '200'."en seconde
    lv_subkey = lv_subkey && | <200s|.
  ELSE.
    lv_subkey = lv_subkey && ts_diff && |s|.
  ENDIF.
  LOG-POINT ID /dlwupex/cockpit_aticle SUBKEY lv_subkey.


ENDFUNCTION.
