*&---------------------------------------------------------------------*
*& Include          /DLWUPEX/VG_IMPORT_EXPORT_F01
*&---------------------------------------------------------------------*

FORM select_data.

  SELECT * FROM /dlwupex/tvar_h INTO TABLE gt_tvar_h
    WHERE work_area IN s_wa AND
          variant IN s_var.
  CHECK gt_tvar_h IS NOT INITIAL.

  SELECT * FROM /dlwupex/tvar_au INTO TABLE gt_tvar_au "#EC CI_NO_TRANSFORM
    FOR ALL ENTRIES IN gt_tvar_h
       WHERE variant = gt_tvar_h-variant.

  SELECT * FROM /dlwupex/tvar_in INTO TABLE gt_tvar_in "#EC CI_NO_TRANSFORM
    FOR ALL ENTRIES IN gt_tvar_h
       WHERE variant = gt_tvar_h-variant.

  SELECT * FROM /dlwupex/tvar_p INTO TABLE gt_tvar_p "#EC CI_NO_TRANSFORM
    FOR ALL ENTRIES IN gt_tvar_h
       WHERE variant = gt_tvar_h-variant.

  SELECT * FROM /dlwupex/tvar_tx INTO TABLE gt_tvar_tx "#EC CI_NO_TRANSFORM
    FOR ALL ENTRIES IN gt_tvar_h
       WHERE variant = gt_tvar_h-variant.

  SELECT * FROM /dlwupex/tlim_ar INTO TABLE gt_tlim_ar "#EC CI_NO_TRANSFORM
    FOR ALL ENTRIES IN gt_tvar_h
       WHERE wa = gt_tvar_h-work_area.

  SORT : gt_tvar_h, gt_tvar_au, gt_tvar_in, gt_tvar_p, gt_tvar_tx, gt_tlim_ar.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form EXPORT_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM export_data .

  PERFORM create_excel.

* create sheets and save
  PERFORM add_sheet USING gt_tvar_p 'Post' 1.
  PERFORM add_sheet USING gt_tvar_au 'Auth' 2.
  PERFORM add_sheet USING gt_tvar_in 'Insert' 3.
  PERFORM add_sheet USING gt_tvar_tx 'Text' 4.
  PERFORM add_sheet USING gt_tvar_h 'Header' 5.
  PERFORM add_sheet USING gt_tlim_ar 'Limit' 6.


  PERFORM save_book.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form CREATE_EXCEL
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM create_excel.

  CREATE OBJECT go_excel 'EXCEL.APPLICATION'.

  IF sy-subrc NE 0.
    WRITE: / 'No EXCEL creation possible'.
    STOP.
  ENDIF.

  SET PROPERTY OF go_excel 'DisplayAlerts' = 0.

  CALL METHOD OF go_excel 'WORKBOOKS' = go_workbook .
* Put Excel in background

  SET PROPERTY OF go_excel 'VISIBLE' = 0.

* Create worksheet
  SET PROPERTY OF go_excel 'SheetsInNewWorkbook' = 1.
  CALL METHOD OF go_workbook 'ADD'.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form ADD_SHEET
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM add_sheet USING pt_table
                     pv_name
                     pv_id.


  IF pv_id GT 1.
    CALL METHOD OF go_excel 'WORKSHEETS' = go_sheet.
    CALL METHOD OF go_sheet 'ADD'.
    FREE OBJECT go_sheet.
  ENDIF.
  gv_scnt = 1.
  CALL METHOD OF go_excel 'WORKSHEETS' = go_sheet EXPORTING #1 = gv_scnt.
  CALL METHOD OF go_sheet 'ACTIVATE'.
  SET PROPERTY OF go_sheet 'NAME' = pv_name.
  FREE OBJECT go_sheet. "OK


  PERFORM fill_sheet USING pt_table.
*
  CALL METHOD OF go_excel 'Columns' = go_column.
  CALL METHOD OF go_column 'Autofit'.
  FREE OBJECT go_column.
*

  FREE OBJECT go_button.
  FREE OBJECT go_font.
  FREE OBJECT go_int.
  FREE OBJECT go_cell.
  FREE OBJECT: go_cell1.
  FREE OBJECT go_range.
  FREE OBJECT go_borders.
  FREE OBJECT: go_column, go_row.

  FREE OBJECT go_font.
  FREE OBJECT go_int.
  FREE OBJECT go_cell.
  FREE OBJECT go_cell1.
  FREE OBJECT go_range.
  FREE OBJECT go_borders.
  FREE OBJECT go_column.
  FREE OBJECT go_row.
  FREE OBJECT go_sheet.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form SAVE_BOOK
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM save_book .
  GET PROPERTY OF go_excel 'ActiveSheet' = go_sheet.
  FREE OBJECT go_sheet.
  FREE OBJECT go_workbook.

  GET PROPERTY OF go_excel 'ActiveWorkbook' = go_workbook.
  CALL METHOD OF go_workbook 'SAVEAS' EXPORTING #1 = p_fexp #2 = 1.
  CALL METHOD OF go_workbook 'CLOSE'.
  CALL METHOD OF go_excel 'QUIT'.

  FREE OBJECT go_sheet.
  FREE OBJECT go_workbook.
  FREE OBJECT go_excel.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form FILL_SHEET
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> PT_TABLE
*&---------------------------------------------------------------------*
FORM fill_sheet USING pt_table TYPE ANY TABLE.

  DATA : lv_number TYPE i.
  DATA : lv_letter(1) TYPE c.
  DATA : lv_cell(4) TYPE c.

  FIELD-SYMBOLS : <fs_value> TYPE any.
  DATA : lt_return TYPE abap_compdescr_tab.

  DATA:
    oref_table TYPE REF TO cl_abap_tabledescr,
    oref_struc TYPE REF TO cl_abap_structdescr,
    oref_error TYPE REF TO cx_root,
    text       TYPE string.
*Get the description of data object type
  TRY.
      oref_table ?=
      cl_abap_tabledescr=>describe_by_data( pt_table ).
    CATCH cx_root INTO oref_error.
      text = oref_error->get_text( ).
      WRITE: / text.
      EXIT.
  ENDTRY.
*Get the line type
  TRY.
      oref_struc ?= oref_table->get_table_line_type( ).
    CATCH cx_root INTO oref_error.
      text = oref_error->get_text( ).
      WRITE: / text.
      EXIT.
  ENDTRY.

  APPEND LINES OF oref_struc->components TO lt_return.

  lv_letter = 'Z'.
  LOOP AT lt_return ASSIGNING FIELD-SYMBOL(<fs_return>).
    IF lv_letter EQ 'Z'.
      lv_letter = 'A'.
    ELSE.
      SEARCH sy-abcde FOR lv_letter.
      lv_number = sy-fdpos + 1.
      lv_letter = sy-abcde+lv_number(1).
    ENDIF.
    CONCATENATE lv_letter '1' INTO lv_cell.

    CALL METHOD OF go_excel 'RANGE' = go_cell EXPORTING #1 = lv_cell.
    PERFORM font USING 1 '14'.
    SET PROPERTY OF go_cell 'VALUE' = <fs_return>-name.
    PERFORM fill_cell USING '15' '1'.
    PERFORM border USING '3'.
    FREE OBJECT go_cell.

  ENDLOOP.

  c_row = 2.
  LOOP AT pt_table ASSIGNING FIELD-SYMBOL(<fs_table>).

    lv_letter = 'Z'.
    LOOP AT lt_return ASSIGNING <fs_return>.
      IF lv_letter EQ 'Z'.
        lv_letter = 'A'.
      ELSE.
        SEARCH sy-abcde FOR lv_letter.
        lv_number = sy-fdpos + 1.
        lv_letter = sy-abcde+lv_number(1).
      ENDIF.
      gv_row = c_row.
      SHIFT gv_row LEFT DELETING LEADING '0'.
      CONCATENATE lv_letter gv_row INTO lv_cell.

      CALL METHOD OF go_excel 'RANGE' = go_cell EXPORTING #1 = lv_cell.
*      PERFORM font USING 1 '14'.
      ASSIGN COMPONENT <fs_return>-name OF STRUCTURE <fs_table> TO <fs_value>.
      IF <fs_value> IS ASSIGNED.
        SET PROPERTY OF go_cell 'VALUE' = <fs_value>.
      ENDIF.
      FREE OBJECT go_cell.
    ENDLOOP.
    c_row = c_row + 1.


  ENDLOOP.

*
*  gv_val = 'ROW-Count'.
*
*  DO 19 TIMES.
*    c_row = sy-index + 1.
*    UNPACK c_row TO gv_val+12(4).
*    CALL METHOD OF go_excel 'CELLS' = go_cell1 EXPORTING #1 = c_row #2 = 2.
*    SET PROPERTY OF go_cell1 'VALUE' = gv_val.
*    FREE OBJECT go_cell1.
*    CALL METHOD OF go_excel 'CELLS' = go_cell1 EXPORTING #1 = c_row #2 = 4.
*    SET PROPERTY OF go_cell1 'VALUE' = gv_val.
*    FREE OBJECT go_cell1.
*  ENDDO.
ENDFORM.

FORM font USING bold size.
  CALL METHOD OF go_cell 'FONT' = go_font.
  SET PROPERTY OF go_font 'BOLD' = bold.
  SET PROPERTY OF go_font 'SIZE' = size.
  FREE OBJECT go_font.
ENDFORM.

FORM fill_cell USING color pattern.
  CALL METHOD OF go_cell 'INTERIOR' = go_int.
  SET PROPERTY OF go_int 'ColorIndex' = color.
  SET PROPERTY OF go_int 'Pattern' = pattern.
  FREE OBJECT go_int.
ENDFORM.

FORM border USING we.
*left
  CALL METHOD OF go_cell 'BORDERS' = go_borders EXPORTING #1 = '1'.
  SET PROPERTY OF go_borders 'LineStyle' = '1'.
  SET PROPERTY OF go_borders 'WEIGHT' = we. "4=max
  FREE OBJECT go_borders.
* right
  CALL METHOD OF go_cell 'BORDERS' = go_borders EXPORTING #1 = '2'.
  SET PROPERTY OF go_borders 'LineStyle' = '2'.
  SET PROPERTY OF go_borders 'WEIGHT' = we.
  FREE OBJECT go_borders.
* top
  CALL METHOD OF go_cell 'BORDERS' = go_borders EXPORTING #1 = '3'.
  SET PROPERTY OF go_borders 'LineStyle' = '3'.
  SET PROPERTY OF go_borders 'WEIGHT' = we.
  FREE OBJECT go_borders.
* bottom
  CALL METHOD OF go_cell 'BORDERS' = go_borders EXPORTING #1 = '4'.
  SET PROPERTY OF go_borders 'LineStyle' = '4'.
  SET PROPERTY OF go_borders 'WEIGHT' = we.
* set property of borders 'ColorIndex' = 'xlAutomatic'.
  FREE OBJECT go_borders.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form IMPORT_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM import_data .

  DATA: excel         TYPE ole2_object,
        workbook      TYPE ole2_object,
        sheet         TYPE ole2_object,
        book          TYPE ole2_object,
        application   TYPE ole2_object,
        cell          TYPE ole2_object,
        cell_start    TYPE ole2_object,
        cell_end      TYPE ole2_object,
        columnobj     TYPE ole2_object,
        range         TYPE ole2_object,
        g_sheet_count TYPE i,
        g_name(10)    TYPE c,
        lv_line       TYPE string.

  DATA : ls_tvar_h  TYPE /dlwupex/tvar_h,
         ls_tvar_au TYPE /dlwupex/tvar_au,
         ls_tvar_in TYPE /dlwupex/tvar_in,
         ls_tvar_p  TYPE /dlwupex/tvar_p,
         ls_tlim_ar TYPE /dlwupex/tlim_ar,
         ls_tvar_tx TYPE /dlwupex/tvar_tx.
  TYPES: BEGIN OF ty_datatab,
           col(999) TYPE c,
         END OF ty_datatab.

  DATA: itab_datatab   TYPE STANDARD TABLE OF ty_datatab.


  CREATE OBJECT excel 'excel.application'.
  IF sy-subrc <> 0.
    WRITE:/ 'Excel cannot be started'.
  ELSE.

* Open the file
    CALL METHOD OF excel 'workbooks' = workbook.
    IF sy-subrc <> 0.
      WRITE:/ 'Excel cannot be started'.
    ENDIF.

    CALL METHOD OF workbook 'open'
      EXPORTING
        #1 = p_fimp.
    IF sy-subrc <> 0.
      WRITE:/ 'File cannot be opened'.
    ENDIF.
  ENDIF.

* Read data from sheets
  DO.
    g_sheet_count = g_sheet_count + 1.
    CALL METHOD OF excel 'worksheets' = sheet
    EXPORTING
    #1 = g_sheet_count.
    IF sy-subrc = 0.
      REFRESH itab_datatab.
* Activate current sheet
      CALL METHOD OF sheet 'activate'.

      GET PROPERTY OF sheet 'Name' = g_name.

* Select the specified range
      CALL METHOD OF sheet 'Cells' = cell_start
      EXPORTING
      #1 = 1
      #2 = 1.
      CALL METHOD OF sheet 'Cells' = cell_end
      EXPORTING
      #1 = 999
      #2 = 20.
      CALL METHOD OF sheet 'RANGE' = range
      EXPORTING
      #1 = cell_start
      #2 = cell_end.
      CALL METHOD OF range 'SELECT'.

* Copy the range to clipboard
      CALL METHOD OF range 'COPY'.


      FIELD-SYMBOLS: <fs>    TYPE any,
                     <field> TYPE any.

* Populate internal table
      CASE g_name.
        WHEN 'Header'.
          CALL METHOD cl_gui_frontend_services=>clipboard_import
            IMPORTING
              data                 = itab_datatab
*             LENGTH               = l_length
            EXCEPTIONS
              cntl_error           = 1
              error_no_gui         = 2
              not_supported_by_gui = 3
              OTHERS               = 4.

          LOOP AT itab_datatab ASSIGNING <fs>.
            IF sy-tabix = 1.
              CONTINUE.
            ENDIF.
            lv_line = <fs>.
            SPLIT lv_line AT cl_abap_char_utilities=>horizontal_tab INTO TABLE DATA(lt_data).
            CLEAR ls_tvar_h.
            LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<fs_data>).
              UNASSIGN <field>.
              ASSIGN COMPONENT sy-tabix OF STRUCTURE ls_tvar_h TO <field>.
              CHECK <field> IS ASSIGNED.
              <field> = <fs_data>.
            ENDLOOP.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tvar_h-variant
              IMPORTING
                output = ls_tvar_h-variant.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tvar_h-work_area
              IMPORTING
                output = ls_tvar_h-work_area.


            APPEND ls_tvar_h TO gt_tvar_h.
          ENDLOOP.
        WHEN 'Text'.
          CALL METHOD cl_gui_frontend_services=>clipboard_import
            IMPORTING
              data                 = itab_datatab
*             LENGTH               = l_length
            EXCEPTIONS
              cntl_error           = 1
              error_no_gui         = 2
              not_supported_by_gui = 3
              OTHERS               = 4.
          LOOP AT itab_datatab ASSIGNING <fs>.
            IF sy-tabix = 1.
              CONTINUE.
            ENDIF.
            lv_line = <fs>.
            SPLIT lv_line AT cl_abap_char_utilities=>horizontal_tab INTO TABLE lt_data.
            CLEAR ls_tvar_h.
            LOOP AT lt_data ASSIGNING <fs_data>.
              UNASSIGN <field>.
              ASSIGN COMPONENT sy-tabix OF STRUCTURE ls_tvar_tx TO <field>.
              CHECK <field> IS ASSIGNED.
              <field> = <fs_data>.
            ENDLOOP.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tvar_tx-variant
              IMPORTING
                output = ls_tvar_tx-variant.
            APPEND ls_tvar_tx TO gt_tvar_tx.
          ENDLOOP.
        WHEN 'Insert'.
          CALL METHOD cl_gui_frontend_services=>clipboard_import
            IMPORTING
              data                 = itab_datatab
*             LENGTH               = l_length
            EXCEPTIONS
              cntl_error           = 1
              error_no_gui         = 2
              not_supported_by_gui = 3
              OTHERS               = 4.
          LOOP AT itab_datatab ASSIGNING <fs>.
            IF sy-tabix = 1.
              CONTINUE.
            ENDIF.
            lv_line = <fs>.
            SPLIT lv_line AT cl_abap_char_utilities=>horizontal_tab INTO TABLE lt_data.
            CLEAR ls_tvar_h.
            LOOP AT lt_data ASSIGNING <fs_data>.
              UNASSIGN <field>.
              ASSIGN COMPONENT sy-tabix OF STRUCTURE ls_tvar_in TO <field>.
              CHECK <field> IS ASSIGNED.
              <field> = <fs_data>.
            ENDLOOP.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tvar_in-variant
              IMPORTING
                output = ls_tvar_in-variant.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tvar_in-viewname
              IMPORTING
                output = ls_tvar_in-viewname.
            APPEND ls_tvar_in TO gt_tvar_in.
          ENDLOOP.
        WHEN 'Auth'.
          CALL METHOD cl_gui_frontend_services=>clipboard_import
            IMPORTING
              data                 = itab_datatab
*             LENGTH               = l_length
            EXCEPTIONS
              cntl_error           = 1
              error_no_gui         = 2
              not_supported_by_gui = 3
              OTHERS               = 4.
          LOOP AT itab_datatab ASSIGNING <fs>.
            IF sy-tabix = 1.
              CONTINUE.
            ENDIF.
            lv_line = <fs>.
            SPLIT lv_line AT cl_abap_char_utilities=>horizontal_tab INTO TABLE lt_data.
            CLEAR ls_tvar_h.
            LOOP AT lt_data ASSIGNING <fs_data>.
              UNASSIGN <field>.
              ASSIGN COMPONENT sy-tabix OF STRUCTURE ls_tvar_au TO <field>.
              CHECK <field> IS ASSIGNED.
              <field> = <fs_data>.
            ENDLOOP.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tvar_au-variant
              IMPORTING
                output = ls_tvar_au-variant.
            APPEND ls_tvar_au TO gt_tvar_au.
          ENDLOOP.
        WHEN 'Post'.
          CALL METHOD cl_gui_frontend_services=>clipboard_import
            IMPORTING
              data                 = itab_datatab
*             LENGTH               = l_length
            EXCEPTIONS
              cntl_error           = 1
              error_no_gui         = 2
              not_supported_by_gui = 3
              OTHERS               = 4.
          LOOP AT itab_datatab ASSIGNING <fs>.
            IF sy-tabix = 1.
              CONTINUE.
            ENDIF.
            lv_line = <fs>.
            SPLIT lv_line AT cl_abap_char_utilities=>horizontal_tab INTO TABLE lt_data.
            CLEAR ls_tvar_h.
            LOOP AT lt_data ASSIGNING <fs_data>.
              UNASSIGN <field>.
              ASSIGN COMPONENT sy-tabix OF STRUCTURE ls_tvar_p TO <field>.
              CHECK <field> IS ASSIGNED.
              <field> = <fs_data>.
            ENDLOOP.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tvar_p-variant
              IMPORTING
                output = ls_tvar_p-variant.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tvar_p-viewname
              IMPORTING
                output = ls_tvar_p-viewname.
            APPEND ls_tvar_p TO gt_tvar_p.
          ENDLOOP.
        WHEN 'Limit'.
          CALL METHOD cl_gui_frontend_services=>clipboard_import
            IMPORTING
              data                 = itab_datatab
*             LENGTH               = l_length
            EXCEPTIONS
              cntl_error           = 1
              error_no_gui         = 2
              not_supported_by_gui = 3
              OTHERS               = 4.
          LOOP AT itab_datatab ASSIGNING <fs>.
            IF sy-tabix = 1.
              CONTINUE.
            ENDIF.
            lv_line = <fs>.
            SPLIT lv_line AT cl_abap_char_utilities=>horizontal_tab INTO TABLE lt_data.
            CLEAR ls_tlim_ar.
            LOOP AT lt_data ASSIGNING <fs_data>.
              UNASSIGN <field>.
              ASSIGN COMPONENT sy-tabix OF STRUCTURE ls_tlim_ar TO <field>.
              CHECK <field> IS ASSIGNED.
              <field> = <fs_data>.
            ENDLOOP.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tlim_ar-wa
              IMPORTING
                output = ls_tlim_ar-wa.
            CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
              EXPORTING
                input  = ls_tlim_ar-variant
              IMPORTING
                output = ls_tlim_ar-variant.
            APPEND ls_tlim_ar TO gt_tlim_ar.
          ENDLOOP.
        WHEN OTHERS.
      ENDCASE.

    ELSE.
      EXIT.
    ENDIF.
  ENDDO.

  IF gt_tvar_h IS NOT INITIAL.
    LOOP AT gt_tvar_h ASSIGNING FIELD-SYMBOL(<fs_tvar_h>).

      DELETE FROM /dlwupex/tvar_h WHERE variant = <fs_tvar_h>-variant.
      DELETE FROM /dlwupex/tvar_au WHERE variant = <fs_tvar_h>-variant.
      DELETE FROM /dlwupex/tvar_in WHERE variant = <fs_tvar_h>-variant.
      DELETE FROM /dlwupex/tvar_p WHERE variant = <fs_tvar_h>-variant.
      DELETE FROM /dlwupex/tvar_tx WHERE variant = <fs_tvar_h>-variant.

    ENDLOOP.
    INSERT /dlwupex/tvar_h FROM TABLE gt_tvar_h.
  ENDIF.

  IF gt_tvar_au IS NOT INITIAL.
    MODIFY /dlwupex/tvar_au FROM TABLE gt_tvar_au.
  ENDIF.

  IF gt_tvar_in IS NOT INITIAL.
    MODIFY /dlwupex/tvar_in FROM TABLE gt_tvar_in.
  ENDIF.

  IF gt_tvar_p IS NOT INITIAL.
    MODIFY /dlwupex/tvar_p FROM TABLE gt_tvar_p.
  ENDIF.

  IF gt_tvar_tx IS NOT INITIAL.
    MODIFY /dlwupex/tvar_tx FROM TABLE gt_tvar_tx.
  ENDIF.

  IF gt_tlim_ar IS NOT INITIAL.
    MODIFY /dlwupex/tlim_ar FROM TABLE gt_tlim_ar.
  ENDIF.

  FREE OBJECT  :  excel,
                  workbook,
                  sheet,
                  book,
                  application,
                  cell,
                  cell_start,
                  cell_end,
                  columnobj,
                  range.

ENDFORM.
