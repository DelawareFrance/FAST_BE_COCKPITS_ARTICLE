*&---------------------------------------------------------------------*
*& Include          /DLWUPEX/VG_IMPORT_EXPORT_TOP
*&---------------------------------------------------------------------*
  INCLUDE ole2incl.
  TABLES : /dlwupex/tvar_h.

  SELECTION-SCREEN BEGIN OF BLOCK bloc1  WITH FRAME TITLE TEXT-t01.
  PARAMETERS:  p_export  RADIOBUTTON GROUP gr1 USER-COMMAND za.
  PARAMETERS:  p_import  RADIOBUTTON GROUP gr1.

  PARAMETERS:  p_fexp    TYPE string.
  PARAMETERS:  p_fimp    TYPE rlgrap-filename.

  SELECTION-SCREEN END OF BLOCK bloc1.

  SELECTION-SCREEN BEGIN OF BLOCK bloc2.
  SELECT-OPTIONS : s_wa FOR /dlwupex/tvar_h-work_area.
  SELECT-OPTIONS : s_var FOR /dlwupex/tvar_h-variant.
  SELECTION-SCREEN END OF BLOCK bloc2.

  DATA : gt_tvar_h  TYPE /dlwupex/tvar_h_tt,
         gt_tvar_au TYPE /dlwupex/tvar_au_tt,
         gt_tvar_in TYPE /dlwupex/tvar_in_tt,
         gt_tvar_p  TYPE /dlwupex/tvar_p_tt,
         gt_tlim_ar TYPE /dlwupex/tlim_ar_tt,
         gt_tvar_tx TYPE /dlwupex/tvar_tx_tt.
  DATA : gv_result   TYPE i,
         gv_pathname TYPE string,
         gv_path     TYPE string,
         gv_val(20),
         c_row(6)    TYPE n,
         gv_row      TYPE string,
         gv_scnt     TYPE i.



  DATA: go_excel    TYPE ole2_object,
        go_workbook TYPE ole2_object,
        go_sheet    TYPE ole2_object,
        go_cell     TYPE ole2_object,
        go_cell1    TYPE ole2_object,
        go_column   TYPE ole2_object,
        go_range    TYPE ole2_object,
        go_borders  TYPE ole2_object,
        go_button   TYPE ole2_object,
        go_int      TYPE ole2_object,
        go_font     TYPE ole2_object,
        go_row      TYPE ole2_object.

  DATA: go_application TYPE ole2_object,
        go_book        TYPE ole2_object,
        go_books       TYPE ole2_object.
  DATA: go_ole_book TYPE ole2_object.
