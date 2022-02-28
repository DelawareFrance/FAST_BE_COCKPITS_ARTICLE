*&---------------------------------------------------------------------*
*& Include          /DLWUPEX/COCKPIT_MANAGE_ID_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form CLEAN_CREATION
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM clean_creation.

  SELECT * FROM /dlwupex/treqids INTO TABLE gt_reqids
      WHERE reqid IN s_idcre AND
            requester IN s_uscre AND
            zdate IN s_datcre AND
            status IN s_stcre.

  IF p_tstcre IS INITIAL.
    DELETE FROM /dlwupex/treqids
    WHERE reqid IN s_idcre AND
          requester IN s_uscre AND
          zdate IN s_datcre AND
          status IN s_stcre.

    PERFORM delete_creation_queue.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form CLEAN_MODIFICATION
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM clean_modification.

  SELECT * FROM /dlwupex/tcont_h INTO TABLE gt_cont_h
      WHERE id IN s_idmod AND
            statut IN s_stmod AND
            date_creation IN s_datmod AND
            user_creation IN s_usmod.

  IF p_tstmod IS INITIAL.
    DELETE FROM  /dlwupex/tcont_h
      WHERE id IN s_idmod AND
            statut IN s_stmod AND
            date_creation IN s_datmod AND
            user_creation IN s_usmod.

    PERFORM delete_modif_queue.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form manage_ALV_creation
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM manage_alv_creation .

  CLEAR : gs_variant, gs_layout, gs_print.

  IF sy-batch IS INITIAL.
    CREATE OBJECT gv_custom_crea
      EXPORTING
        container_name = 'CONTAINER_CREA'.
    IF sy-subrc EQ 0.
*     Creating Grid
      CREATE OBJECT gv_grid_crea
        EXPORTING
          i_parent = gv_custom_crea.
    ENDIF.

  ELSE.
    CREATE OBJECT gv_grid_crea
      EXPORTING
        i_parent = gv_dock_crea.
    gs_print-print = 'X'.
    gs_print-prnt_info  = 'X'.
  ENDIF.

* Clearing the contents of the fieldcatalog
  REFRESH gt_fieldcat_crea.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = '/DLWUPEX/SREQIDS'
    CHANGING
      ct_fieldcat            = gt_fieldcat_crea
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  IF sy-subrc = 0.

  ENDIF.

  gs_layout-zebra      = 'X'.
  gs_layout-cwidth_opt = 'X'.
  gs_layout-info_fname = 'ROWCOLOR'.

*  gs_variant-report = sy-repid.

*   Displaying the output
  CALL METHOD gv_grid_crea->set_table_for_first_display
    EXPORTING
*     is_variant                    = gs_variant
      is_layout                     = gs_layout
      is_print                      = gs_print
      i_save                        = 'A'
    CHANGING
      it_outtab                     = gt_reqids
      it_fieldcatalog               = gt_fieldcat_crea
    EXCEPTIONS
      invalid_parameter_combination = 1
      program_error                 = 2
      too_many_lines                = 3
      OTHERS                        = 4.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form MANAGE_ALV_MODIF
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM manage_alv_modif .

  CLEAR : gs_variant, gs_layout, gs_print.

  IF sy-batch IS INITIAL.
    CREATE OBJECT gv_custom_mod
      EXPORTING
        container_name = 'CONTAINER_MODIF'.
    IF sy-subrc EQ 0.
*     modting Grid
      CREATE OBJECT gv_grid_mod
        EXPORTING
          i_parent = gv_custom_mod.
    ENDIF.

  ELSE.
    CREATE OBJECT gv_grid_mod
      EXPORTING
        i_parent = gv_dock_mod.
    gs_print-print = 'X'.
    gs_print-prnt_info  = 'X'.
  ENDIF.

* Clearing the contents of the fieldcatalog
  REFRESH gt_fieldcat_mod.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = '/DLWUPEX/SCONT_H'
    CHANGING
      ct_fieldcat            = gt_fieldcat_mod
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  IF sy-subrc = 0.

  ENDIF.

  gs_layout-zebra      = 'X'.
  gs_layout-cwidth_opt = 'X'.
  gs_layout-info_fname = 'ROWCOLOR'.

  gs_variant-report = sy-repid.

*   Displaying the output
  CALL METHOD gv_grid_mod->set_table_for_first_display
    EXPORTING
*     is_variant                    = gs_variant
      is_layout                     = gs_layout
      is_print                      = gs_print
      i_save                        = 'A'
    CHANGING
      it_outtab                     = gt_cont_h
      it_fieldcatalog               = gt_fieldcat_mod
    EXCEPTIONS
      invalid_parameter_combination = 1
      program_error                 = 2
      too_many_lines                = 3
      OTHERS                        = 4.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form DELETE_CREATION_QUEUE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM delete_creation_queue .

  DATA : lv_qname TYPE trfcqnam,
         lt_queue TYPE TABLE OF trfcqview.

  SELECT SINGLE value FROM /dlwupex/tcusto INTO @DATA(lv_value)
           WHERE name = 'QUEUE_PREFIXE'.

  LOOP AT gt_reqids ASSIGNING FIELD-SYMBOL(<fs_reqids>).
    CLEAR lv_qname.
    REFRESH lt_queue.

    CONCATENATE lv_value <fs_reqids>-reqid '*' INTO lv_qname.

    CALL FUNCTION 'TRFC_QIN_GET_CURRENT_QUEUES'
      EXPORTING
        qname = lv_qname
      TABLES
        qview = lt_queue.
    LOOP AT lt_queue ASSIGNING FIELD-SYMBOL(<fs_queue>).
      CALL FUNCTION 'TRFC_QIN_DELETE_QUEUE'
        EXPORTING
          qname = <fs_queue>-qname.
    ENDLOOP.
  ENDLOOP.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form DELETE_MODIF_QUEUE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM delete_modif_queue .

  DATA : lv_qname   TYPE trfcqnam,
         lv_idqueue TYPE char10,
         lt_queue   TYPE TABLE OF trfcqview.

  SELECT SINGLE value FROM /dlwupex/tcusto INTO @DATA(lv_value)
           WHERE name = 'QUEUE_MOD_PREFIXE'.

  LOOP AT gt_cont_h ASSIGNING FIELD-SYMBOL(<fs_cont_h>).
    CLEAR lv_qname.
    REFRESH lt_queue.

    lv_idqueue = <fs_cont_h>-id.
    SHIFT lv_idqueue LEFT DELETING LEADING '0'.

    CONCATENATE lv_value lv_idqueue '*' INTO lv_qname.

    CALL FUNCTION 'TRFC_QIN_GET_CURRENT_QUEUES'
      EXPORTING
        qname = lv_qname
      TABLES
        qview = lt_queue.
    LOOP AT lt_queue ASSIGNING FIELD-SYMBOL(<fs_queue>).
      CALL FUNCTION 'TRFC_QIN_DELETE_QUEUE'
        EXPORTING
          qname = <fs_queue>-qname.
    ENDLOOP.
  ENDLOOP.

ENDFORM.
