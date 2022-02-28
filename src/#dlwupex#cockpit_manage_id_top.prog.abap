*&---------------------------------------------------------------------*
*& Include          /DLWUPEX/COCKPIT_MANAGE_ID_TOP
*&---------------------------------------------------------------------*

*---------------------------------------------------------------------*
* Tables standards                                                    *
*---------------------------------------------------------------------*

TABLES: /dlwupex/treqids,
        /dlwupex/tcont_h.

DATA :
  gt_reqids        TYPE TABLE OF /dlwupex/treqids,
  gt_cont_h        TYPE TABLE OF /dlwupex/tcont_h,
  gt_fieldcat_mod  TYPE STANDARD TABLE OF lvc_s_fcat, "Fieldcatalog
  gt_fieldcat_crea TYPE STANDARD TABLE OF lvc_s_fcat, "Fieldcatalog
  gs_variant       TYPE disvariant,
  gs_layout        TYPE lvc_s_layo,
  gs_print         TYPE lvc_s_prnt,
  gv_custom_crea   TYPE REF TO cl_gui_custom_container, "Docking Container
  gv_grid_crea     TYPE REF TO cl_gui_alv_grid, "Grid
  gv_dock_crea     TYPE REF TO cl_gui_docking_container,
  gv_custom_mod    TYPE REF TO cl_gui_custom_container, "Docking Container
  gv_grid_mod      TYPE REF TO cl_gui_alv_grid, "Grid
  gv_dock_mod      TYPE REF TO cl_gui_docking_container.

DATA ok_code TYPE sy-ucomm.
**** SELECTION SCREEN

SELECTION-SCREEN BEGIN OF BLOCK b00 WITH FRAME TITLE TEXT-b00.
PARAMETERS : p_crea  AS CHECKBOX DEFAULT 'X' USER-COMMAND us1.

SELECT-OPTIONS : s_idcre FOR /dlwupex/treqids-reqid,
                 s_stcre FOR /dlwupex/treqids-status,
                 s_uscre FOR /dlwupex/treqids-requester,
                 s_datcre FOR /dlwupex/treqids-zdate.

PARAMETERS : p_tstcre AS CHECKBOX DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK b00.


SELECTION-SCREEN BEGIN OF BLOCK b01 WITH FRAME TITLE TEXT-b01.
PARAMETERS : p_modif AS CHECKBOX DEFAULT 'X' USER-COMMAND us2.

SELECT-OPTIONS : s_idmod FOR /dlwupex/tcont_h-id,
                 s_stmod FOR /dlwupex/tcont_h-statut,
                 s_usmod FOR /dlwupex/tcont_h-user_creation,
                 s_datmod FOR /dlwupex/tcont_h-date_creation.

PARAMETERS : p_tstmod AS CHECKBOX DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK b01.
