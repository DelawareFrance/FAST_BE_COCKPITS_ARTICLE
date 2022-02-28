function /dlwupex/xlsuploadsheet.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IP_STREAM) TYPE  XSTRING
*"     VALUE(IP_SHEET) TYPE  INT4 OPTIONAL
*"  EXPORTING
*"     VALUE(EP_SHEET) TYPE  INT4
*"     VALUE(ET_XML_SHEET_ITAB) TYPE  /DLWUPEX/TXML_SHEET
*"     VALUE(ET_XML_SHARED_STR_ITAB) TYPE  /DLWUPEX/TXML_SHARED
*"     VALUE(ET_GDATA) TYPE  /DLWUPEX/TGDATA_TT
*"     VALUE(ET_UNIT) TYPE  /DLWUPEX/TUNIT_TT
*"     VALUE(ET_CARAC) TYPE  /DLWUPEX/TCARACT_TT
*"     VALUE(ET_BOM) TYPE  /DLWUPEX/TBOM_TT
*"     VALUE(ET_LIST) TYPE  /DLWUPEX/TLIST_TT
*"     VALUE(ET_FIA) TYPE  /DLWUPEX/TFIA_TT
*"     VALUE(ET_SLIST) TYPE  /DLWUPEX/TSRLIST_TT
*"     VALUE(ET_SALE) TYPE  /DLWUPEX/TSALE_TT
*"     VALUE(ET_LOGDC) TYPE  /DLWUPEX/TLOGDC_TT
*"     VALUE(ET_LOGSTORE) TYPE  /DLWUPEX/TLOGSTO_TT
*"     VALUE(EP_EROOR) TYPE  FLAG
*"     VALUE(EP_ERRMESSAGE) TYPE  STRING
*"----------------------------------------------------------------------
*{   INSERT         DS1K901359                                        1


*EP_SHEET = IP_SHEET.
  types : begin of ltyp_fields ,
            tabname   type tabname16, "CHAR10,
            tabfield  type char40,
            dposition type /dlwupex/elineid,
          end of  ltyp_fields.
  data  lt_output type standard table of ltyp_fields.
  data: lt_cat    type table of lvc_s_fcat,
        ls_cat    like line of lt_cat,
        d_ref     type ref to data,
        ls_tmp    type ref to data,
        ls_output type ltyp_fields.
  data im_filename type string.
  data im_media_resource type xstringval.
  data im_mime_type type char100.
  data   ls_td  type sydes_desc.
* * Internal tables declaration
  statics: lt_worksheets type standard table of string,
           lref_excel    type ref to cl_fdt_xl_spreadsheet.
  data: lt_contents   type string_table.
* Local variables declaration
  data:
    lv_name   type string,
    lv_string type string,
* lv_msg TYPE string,
    lv_flag   type boolean.
* References declarations
  data:
*    lref_excel                type ref to cl_fdt_xl_spreadsheet,
    lref_excel_core           type ref to cx_fdt_excel_core,
    lref_conversion_no_number type ref to cx_sy_conversion_no_number,
    lref_data                 type ref to data.
* Field symbols declarations
  field-symbols:
    <fs_table>    type table,
    <fs_data>     type any,
    <fs_data_str> type any,
    <fs_comp>     type any,
    <fs_output>   type string.

  data: begin of ltab occurs 0,
          line(40),
        end of ltab.


  data lo_tech_read_request_context type ref to /iwbep/cl_sb_gen_read_aftr_crt.
  data ls_key type /iwbep/s_mgw_tech_pair.
  data lt_keys type /iwbep/t_mgw_tech_pairs.
  data lv_msg_success type string.
  data lv_msg_error type string.
  data lv_entityset_name type string.
  field-symbols: <ls_data> type any.
  field-symbols : <f_fs>         type table,
                  <ls_dyn_table> type any.
  data ls_entity   type ref to data.
  data lv_viewname type /dlwupex/eviewname.
  data   lv_ddtext   type dd07v-ddtext.
  data lt_tmsg type table of /dlwupex/tmsg.
  statics lv_buid type /dlwupex/ebusunitid.
*  data lv_viewname        type /dlwupex/eviewname.
*
*  select single id from /dlwupex/tfitxls into @data(lv_buid)
*                                         where uname = @sy-uname
*                                         and   ersda = @sy-datum.
  if lv_buid is initial.
    select single id from /dlwupex/tfitxls into lv_buid
                                       where uname = sy-uname
                                       and   ersda = sy-datum.
  endif.



*IF iv_entity_name = 'DataFile'.
* Map request input fields to function module parameters
  im_mime_type = 'XLSX'.
  im_media_resource = ip_stream.
  im_filename = 'iv_slug'.
* im_filename = ‘ew Microsoft Excel Worksheet.xlsx’.
  if lref_excel is not bound.
    try.
* Create object of class to read .xlsx file contents
        create object lref_excel
          exporting
            document_name = im_filename
            xdocument     = im_media_resource.

      catch cx_fdt_excel_core into lref_excel_core.
* CLEAR lv_msg.
* Call method to get error message text
        call method lref_excel_core->if_message~get_text
          receiving
            result = lv_msg_error.
*<< Display error message returned in lv_msg >>
        return.
    endtry.

* Call method to get list of worksheets in the .xlsx file
    lref_excel->if_fdt_doc_spreadsheet~get_worksheet_names(
    importing
    worksheet_names = lt_worksheets ).
  endif.
* Condition to check whether .xlsx file has any active worksheets
  if lt_worksheets is not initial.
* Read active worksheet
    read table lt_worksheets index ip_sheet into lv_name.
  else.
*<< Display error message >>
    return.
  endif.
* Get reference of .xlsx file contents in the active worksheet
  lref_data = lref_excel->if_fdt_doc_spreadsheet~get_itab_from_worksheet( lv_name ).
* Fetch all records in the active worksheet
  assign lref_data->* to <fs_table>.
* Prepare exporting table with .xlsx file contents
  if <fs_table> is not assigned.
*<< Display error message >>
    return.
  endif.
* Loop dynamic table to prepare final table contents to pass in exporting parameter
*  loop at <fs_table> assigning <fs_data>.
** Initialize flag
*    lv_flag = abap_true.
*    while lv_flag = abap_true.
** Read columnwise entries
*      assign component sy-index of structure <fs_data> to <fs_comp>.
*      if <fs_comp> is not assigned.
*        lv_flag = abap_false.
** Exit the loop when a row ends
*        exit.
*      else.
** Concatenate each cell data in a row into string seperated by ‘||’
*        concatenate lv_string <fs_comp> into lv_string separated by '||'.
*      endif.
** Unassign field symbol
*      unassign <fs_comp>.
*    endwhile.
** Shift final string having a row left by 2 places to remove leading ‘||’
*    shift lv_string left by 2 places.
** Append prepared row data to exporting parameter
*    append lv_string to lt_contents.
** Clear variable having row data
*    clear lv_string.
*  endloop.


  if ip_sheet < 10.
    lv_viewname = ip_sheet.
    concatenate '0' lv_viewname into lv_viewname.
  else.
    lv_viewname = ip_sheet.
  endif.

  select tabname tabfield dposition from /dlwupex/tfields
                             into table lt_output
                             where id = lv_buid
                             and   gabarit eq 'Y'
                             and   actif   eq 'Y'
                             and  viewname = lv_viewname
                             order by dposition.


  loop at lt_output assigning field-symbol(<f_data>).
    if <f_data>-tabname = '/SAPSLL/MARITC' and <f_data>-tabfield = 'DATAB'.
      <f_data>-tabfield = 'DATABB'.
      <f_data>-tabname = '/DLWUPEX/TGDATA'.
*      exit.
    elseif <f_data>-tabname = 'T023' and <f_data>-tabfield = 'WWGDA'.
      <f_data>-tabfield = 'REF_ART'.
      <f_data>-tabname = '/DLWUPEX/TGDATA'.
    endif.

    ls_cat-tabname = <f_data>-tabname.
    ls_cat-fieldname =  <f_data>-tabfield.
    ls_cat-ref_field = <f_data>-tabfield.
    ls_cat-ref_table = <f_data>-tabname.
    append ls_cat to lt_cat.
  endloop.
  check lt_output[] is not initial.
*  loop at lt_output into ls_output.
*    ls_cat-tabname = ls_output-tabname.
*    ls_cat-fieldname =  ls_output-tabfield.
*    ls_cat-ref_field = ls_output-tabfield.
*    ls_cat-ref_table = ls_output-tabname.
*    append ls_cat to lt_cat.
*  endloop.
  call method cl_alv_table_create=>create_dynamic_table
    exporting
      it_fieldcatalog = lt_cat
    importing
      ep_table        = d_ref.

  assign d_ref->* to <f_fs>.
  create data ls_tmp like line of <f_fs>.
  assign ls_tmp->* to <ls_dyn_table>.

  data lv_valuedomain  type dd07v-domvalue_l .
  lv_valuedomain = lv_viewname.
  call function 'DOMAIN_VALUE_GET'
    exporting
      i_domname  = '/DLWUPEX/DVIEWNAME'
      i_domvalue = lv_valuedomain
    importing
      e_ddtext   = lv_ddtext
    exceptions
      not_exist  = 1
      others     = 2.
  if sy-subrc <> 0.
* Implement suitable error handling here
  endif.
  data lv_row type i.
  data lv_cpt type i.



*New code
  " data(lv_fields) = Lines( lt_output ).
  describe table lt_output lines data(lv_fields).
  loop at <fs_table> assigning <fs_data>.
    check sy-tabix > 1.
    clear :<ls_dyn_table>,lv_cpt.

    do lv_fields times.
      lv_cpt = lv_cpt + 1.
      assign component lv_cpt of structure <ls_dyn_table> to field-symbol(<f_value2>).
      assign component lv_cpt of structure <fs_data> to field-symbol(<f_value3>).
      check <f_value2> is assigned and <f_value3> is assigned.
      try .
          <f_value2> = <f_value3>.
*          catch cx_sy_conversion_no_number into  lref_conversion_no_number.
          data lr_exc type ref to cx_root.
        catch cx_root into lr_exc.
          lv_msg_error = lr_exc->get_text( ).
          ep_errmessage =  lv_ddtext .
          concatenate ep_errmessage  '-' lv_msg_error into ep_errmessage separated by space.
          append initial line to lt_tmsg assigning field-symbol(<f_tmsg>).
          <f_tmsg>-id = lv_buid.
          <f_tmsg>-reqid = 'XLSERROR'.
          <f_tmsg>-rownb = lv_row.
          <f_tmsg>-viewname = lv_viewname.
          <f_tmsg>-message = ep_errmessage.
          <f_tmsg>-type = 'E'.
          <f_tmsg>-idmsg = 'MG'.
          <f_tmsg>-num = '144'.
          ep_eroor = abap_true.
          lv_row = lv_row + 1.
      endtry.

      describe field <f_value2>  into ls_td.
      try .
          data(lv_type) = ls_td-types[ 1 ]-type.
        catch cx_sy_itab_line_not_found.
      endtry.
      if lv_type = 'P' and <f_value2> is not initial.
        data : lv_dec50(16)       type p decimals 3.
        lv_dec50 = <f_value3>.
        if <f_value2> ne  lv_dec50.
          lv_msg_error = lv_dec50.
          data(lv_len) = strlen( lv_msg_error ) - 1.
          lv_len = lv_len - 1.
          if lv_msg_error+lv_len(1) = '0'.
            lv_msg_error = lv_msg_error(lv_len).
          endif.
          concatenate text-010  lv_msg_error  text-011 into  lv_msg_error separated by space.
          ep_errmessage =  lv_ddtext .
          concatenate ep_errmessage  '-' lv_msg_error into ep_errmessage separated by space.
          append initial line to lt_tmsg assigning <f_tmsg>.
          <f_tmsg>-id = lv_buid.
          <f_tmsg>-reqid = 'XLSERROR'.
          <f_tmsg>-rownb = lv_row.
          <f_tmsg>-viewname = lv_viewname.
          <f_tmsg>-message = ep_errmessage.
          <f_tmsg>-type = 'E'.
          <f_tmsg>-idmsg = 'MG'.
          <f_tmsg>-num = '144'.
          ep_eroor = abap_true.
          lv_row = lv_row + 1.
        endif.
      endif.
      try .
          data(lv_convert) = ls_td-names[ 3 ]-name.
        catch cx_sy_itab_line_not_found.
      endtry.
      if lv_convert = '==CUNIT' or ls_td-names[ 2 ] cs 'ZZ1_UVECOM'
                                or ls_td-names[ 2 ] cs 'ZZ1_ZUO_EN'
                                or ls_td-names[ 2 ] cs 'ZZ1_ZUO_SO'.

        .
        call function 'CONVERSION_EXIT_CUNIT_INPUT'
          exporting
            input          = <f_value2>
            language       = sy-langu
          importing
            output         = <f_value2>
          exceptions
            unit_not_found = 1
            others         = 2.
        if sy-subrc <> 0.
* Implement suitable error handling here
        endif.
      elseif  lv_convert = '==ATINN'.
        call function 'CONVERSION_EXIT_ATINN_INPUT'
          exporting
            input  = <f_value3>
          importing
            output = <f_value2>.
      elseif  lv_convert = '==ISOLA'.
        call function 'CONVERSION_EXIT_ISOLA_INPUT'
          exporting
            input            = <f_value3>
          importing
            output           = <f_value2>
          exceptions
            unknown_language = 1
            others           = 2.
        if sy-subrc <> 0.
* Implement suitable error handling here
        endif.
      endif.
      clear lv_convert.
    enddo.
    check <ls_dyn_table> is not initial.
    case  lv_viewname.
      when '01'.
        append initial line to et_gdata assigning field-symbol(<f_gdata>).
        move-corresponding <ls_dyn_table> to <f_gdata>.
      when '02'.
        append initial line to et_unit assigning field-symbol(<f_unit>).
        move-corresponding <ls_dyn_table> to <f_unit>.
      when '03'.
        append initial line to et_carac assigning field-symbol(<f_cara>).
        move-corresponding <ls_dyn_table> to <f_cara>.
      when '04'.
        append initial line to et_bom assigning field-symbol(<f_bom>).
        move-corresponding <ls_dyn_table> to <f_bom>.
      when '05'.
        append initial line to et_list assigning field-symbol(<f_list>).
        move-corresponding <ls_dyn_table> to <f_list>.
      when '06'.
        append initial line to et_fia assigning field-symbol(<f_fia>).
        move-corresponding <ls_dyn_table> to <f_fia>.
      when '07'.
        append initial line to et_slist assigning field-symbol(<f_slist>).
        move-corresponding <ls_dyn_table> to <f_slist>.
      when '08'.
        append initial line to et_sale assigning field-symbol(<f_sale>).
        move-corresponding <ls_dyn_table> to <f_sale>.
      when '09'.
        append initial line to et_logdc assigning field-symbol(<f_logdc>).
        move-corresponding <ls_dyn_table> to <f_logdc>.
      when '10'.
        append initial line to et_logstore assigning field-symbol(<f_logstore>).
        move-corresponding <ls_dyn_table> to <f_logstore>.
      when others.
    endcase.
  endloop.
*End new code.






*  loop at lt_contents assigning <fs_output> .
**    if ep_errmessage is not initial.
**      exit.
**    endif.
*    check sy-tabix > 1.
*    clear ltab[].
*    split  <fs_output> at '||' into table ltab.
*    clear <ls_dyn_table>.
*    loop at ltab into data(ls_tab).
*      data(lv_index) = sy-tabix.
*      if lv_index = 1 and ls_tab-line = ''.
*        exit.
*      endif.
*      assign component lv_index of structure <ls_dyn_table> to field-symbol(<f_value>).
*      if sy-subrc eq 0.
*        try .
*            <f_value> = ls_tab-line.
**          catch cx_sy_conversion_no_number into  lref_conversion_no_number.
*
*          catch cx_root into lr_exc.
*            lv_msg_error = lr_exc->get_text( ).
*
** CLEAR lv_msg.
** Call method to get error message text
**            call method lref_conversion_no_number->if_message~get_text
**              receiving
**                result = lv_msg_error.
*            ep_errmessage =  lv_ddtext .
*            concatenate ep_errmessage  '-' lv_msg_error into ep_errmessage separated by space.
*            append initial line to lt_tmsg assigning <f_tmsg>.
*            <f_tmsg>-id = lv_buid.
*            <f_tmsg>-reqid = 'XLSERROR'.
*            <f_tmsg>-rownb = lv_row.
*            <f_tmsg>-viewname = lv_viewname.
*            <f_tmsg>-message = ep_errmessage.
*            <f_tmsg>-type = 'E'.
*            <f_tmsg>-idmsg = 'MG'.
*            <f_tmsg>-num = '144'.
*            ep_eroor = abap_true.
*            lv_row = lv_row + 1.
**            exit.
*        endtry.
*
*      endif.
*
*      describe field <f_value> into ls_td.
*
*      try .
*          lv_convert = ls_td-names[ 3 ]-name.
*        catch cx_sy_itab_line_not_found.
*      endtry.
*      if lv_convert = '==CUNIT'.
*        call function 'CONVERSION_EXIT_CUNIT_INPUT'
*          exporting
*            input          = <f_value>
*            language       = sy-langu
*          importing
*            output         = <f_value>
*          exceptions
*            unit_not_found = 1
*            others         = 2.
*        if sy-subrc <> 0.
** Implement suitable error handling here
*        endif.
*      elseif  lv_convert = '==ATINN'.
*        call function 'CONVERSION_EXIT_ATINN_INPUT'
*          exporting
*            input  = ls_tab-line
*          importing
*            output = <f_value>.
*      endif.
*      clear lv_convert.
*    endloop.
**    check <ls_dyn_table> is not initial.
**    case  lv_viewname.
**      when '01'.
**        append initial line to et_gdata assigning field-symbol(<f_gdata>).
**        move-corresponding <ls_dyn_table> to <f_gdata>.
**      when '02'.
**        append initial line to et_unit assigning field-symbol(<f_unit>).
**        move-corresponding <ls_dyn_table> to <f_unit>.
**      when '03'.
**        append initial line to et_carac assigning field-symbol(<f_cara>).
**        move-corresponding <ls_dyn_table> to <f_cara>.
**      when '04'.
**        append initial line to et_bom assigning field-symbol(<f_bom>).
**        move-corresponding <ls_dyn_table> to <f_bom>.
**      when '05'.
**        append initial line to et_list assigning field-symbol(<f_list>).
**        move-corresponding <ls_dyn_table> to <f_list>.
**      when '06'.
**        append initial line to et_fia assigning field-symbol(<f_fia>).
**        move-corresponding <ls_dyn_table> to <f_fia>.
**      when '07'.
**        append initial line to et_slist assigning field-symbol(<f_slist>).
**        move-corresponding <ls_dyn_table> to <f_slist>.
**      when '08'.
**        append initial line to et_sale assigning field-symbol(<f_sale>).
**        move-corresponding <ls_dyn_table> to <f_sale>.
**      when '09'.
**        append initial line to et_logdc assigning field-symbol(<f_logdc>).
**        move-corresponding <ls_dyn_table> to <f_logdc>.
**      when '10'.
**        append initial line to et_logstore assigning field-symbol(<f_logstore>).
**        move-corresponding <ls_dyn_table> to <f_logstore>.
**      when others.
**    endcase.
*
*
*
*
*
*
*
*
*
*
*    " APPEND <ls_dyn_table> to <f_fs>.
**SPLIT <fs_output>
**AT '||'
**INTO ls_contents-vkey.
**ls_contents-vdesc
**ls_contents-video
**ls_contents-test.
**ls_contents-mandt = sy-mandt.
*** Append split records in internal table
**APPEND ls_contents TO lt_final_contents.
*  endloop.


  ep_sheet = ip_sheet.

  check lt_tmsg[] is not initial.

  modify /dlwupex/tmsg from table lt_tmsg.
*IF lt_final_contents IS NOT INITIAL.
*delete lt_final_contents INDEX 1.
*MODIFY zvtest1 FROM TABLE lt_final_contents.
*IF sy-subrc EQ 0.
*lv_msg_success = 'Data updated successfully'.
*ELSE.
*lv_msg_error = 'Unable to update Table'.
*ENDIF.
*ENDIF.
*}   INSERT
endfunction.
