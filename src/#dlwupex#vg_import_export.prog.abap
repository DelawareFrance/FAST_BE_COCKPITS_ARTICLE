*&---------------------------------------------------------------------*
*& Report /DLWUPEX/VG_IMPORT_EXPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT /dlwupex/vg_import_export.

INCLUDE /dlwupex/vg_import_export_top.
INCLUDE /dlwupex/vg_import_export_f01.

AT SELECTION-SCREEN OUTPUT.

  IF p_import IS NOT INITIAL.

    LOOP AT SCREEN INTO DATA(screen_wa).
      IF screen_wa-name CP '*S_WA*' OR screen_wa-name CP '*S_VAR*'.
        screen_wa-invisible    = '1'.
        screen_wa-active    = '0'.
      ENDIF.
      IF screen_wa-name CP '*P_FEXP*'.
        screen_wa-invisible    = '1'.
        screen_wa-active    = '0'.
      ENDIF.

      IF screen_wa-name CP '*P_FIMP*'.
        screen_wa-invisible    = '0'.
        screen_wa-active    = '1'.
      ENDIF.
      MODIFY SCREEN FROM screen_wa.
    ENDLOOP.

  ELSE.
    LOOP AT SCREEN INTO screen_wa.
      IF screen_wa-name CP '*S_WA*' OR screen_wa-name CP '*S_VAR*'.
        screen_wa-invisible    = '0'.
        screen_wa-active    = '1'.
      ENDIF.
      IF screen_wa-name CP '*P_FEXP*'.
        screen_wa-invisible    = '0'.
        screen_wa-active    = '1'.
      ENDIF.

      IF screen_wa-name CP '*P_FIMP*'.
        screen_wa-invisible    = '0'.
        screen_wa-active    = '0'.
      ENDIF.
      MODIFY SCREEN FROM screen_wa.
    ENDLOOP.
  ENDIF.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_fexp.

  CALL METHOD cl_gui_frontend_services=>file_save_dialog
    EXPORTING
*     window_title      = ' '
      default_extension = 'xls'
*     default_file_name =
      initial_directory = p_fexp
    CHANGING
      filename          = gv_pathname
      path              = gv_path
      fullpath          = p_fexp
      user_action       = gv_result.
* Check user did not cancel request
  CHECK gv_result EQ '0'.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_fimp.
  DATA :
    lt_file  TYPE filetable,
    ls_file  TYPE file_table,
    lv_fname TYPE string,
    lv_rc    TYPE i.
  CALL METHOD cl_gui_frontend_services=>file_open_dialog
    EXPORTING
      default_extension = 'xls'
    CHANGING
      file_table        = lt_file
      rc                = lv_rc.
  IF lv_rc = 1.
    READ TABLE lt_file INTO ls_file INDEX 1.
    p_fimp = ls_file-filename.
  ENDIF.


START-OF-SELECTION.

  IF p_export IS NOT INITIAL. "Export
    IF p_fexp IS INITIAL.
      MESSAGE 'Fichier obligatoire' TYPE 'S' DISPLAY LIKE 'E'.
      EXIT.
    ENDIF.
    PERFORM select_data.
    PERFORM export_data.
  ELSE. "Import
    IF p_fimp IS INITIAL.
      MESSAGE 'Fichier obligatoire' TYPE 'S' DISPLAY LIKE 'E'.
      EXIT.
    ENDIF.
    PERFORM import_data.
  ENDIF.
