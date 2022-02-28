*&---------------------------------------------------------------------*
*& Report /DLWUPEX/COCKPIT_MANAGE_IDS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT /dlwupex/cockpit_manage_ids.


INCLUDE /dlwupex/cockpit_manage_id_top.
INCLUDE /dlwupex/cockpit_manage_id_f01.
INCLUDE /dlwupex/cockpit_manage_id_pbo.
INCLUDE /dlwupex/cockpit_manage_id_pai.


AT SELECTION-SCREEN.
  DATA(gd_ucomm) = sy-ucomm.

************************************************************************
AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF screen-name CP 'S_DATCRE-LOW'.
      IF NOT p_crea IS INITIAL.
        screen-required = 2.
      ELSE.
        screen-required = 0.
      ENDIF.
    ENDIF.
    IF screen-name CP 'S_DATMOD-LOW'.
      IF NOT p_modif IS INITIAL.
        screen-required = 2.
      ELSE.
        screen-required = 0.
      ENDIF.
    ENDIF.
    MODIFY SCREEN.
  ENDLOOP.

START-OF-SELECTION.
  IF NOT p_crea IS INITIAL AND s_datcre IS INITIAL.
    MESSAGE TEXT-e01 TYPE 'I' DISPLAY LIKE 'E'.
    LEAVE LIST-PROCESSING.
  ENDIF.
  IF NOT p_modif IS INITIAL AND s_datmod IS INITIAL.
    MESSAGE TEXT-e02 TYPE 'I' DISPLAY LIKE 'E'.
    LEAVE LIST-PROCESSING.
  ENDIF.

  IF NOT p_crea IS INITIAL.
    PERFORM clean_creation.
  ENDIF.

  IF NOT p_modif IS INITIAL.
    PERFORM clean_modification.
  ENDIF.

  CALL SCREEN 0100.
