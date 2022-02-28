function /dlwupex/xlsupload.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IP_STREAM) TYPE  XSTRING
*"  EXPORTING
*"     REFERENCE(ET_XML_SHARED_STR_ITAB) TYPE  TABLE
*"     REFERENCE(ET_XML_SHEET_ITAB) TYPE  TABLE
*"     REFERENCE(ET_GDATA) TYPE  /DLWUPEX/TGDATA_TT
*"     REFERENCE(ET_UNIT) TYPE  /DLWUPEX/TUNIT_TT
*"     REFERENCE(ET_CARAC) TYPE  /DLWUPEX/TCARACT_TT
*"     REFERENCE(ET_BOM) TYPE  /DLWUPEX/TBOM_TT
*"     REFERENCE(ET_LIST) TYPE  /DLWUPEX/TLIST_TT
*"     REFERENCE(ET_FIA) TYPE  /DLWUPEX/TFIA_TT
*"     REFERENCE(ET_SLIST) TYPE  /DLWUPEX/TSRLIST_TT
*"     REFERENCE(ET_SALE) TYPE  /DLWUPEX/TSALE_TT
*"     REFERENCE(ET_LOGDC) TYPE  /DLWUPEX/TLOGDC_TT
*"     REFERENCE(ET_LOGSTORE) TYPE  /DLWUPEX/TLOGSTO_TT
*"     REFERENCE(EP_EROOR) TYPE  FLAG
*"     REFERENCE(EP_ERRMESSAGE) TYPE  STRING
*"  CHANGING
*"     REFERENCE(CO_IXML_FACTORY) TYPE REF TO  IF_IXML
*"----------------------------------------------------------------------

*{   INSERT         DS1K901359                                        1
*
  data   : gt_gdatai     type /dlwupex/tgdata_tt,
           gt_tuniti     type /dlwupex/tunit_tt,
           gt_tcaracti   type /dlwupex/tcaract_tt,
           gt_tbomi      type /dlwupex/tbom_tt,
           gt_tlisti     type /dlwupex/tlist_tt,
           gt_tfiai      type /dlwupex/tfia_tt,
           gt_tslisti    type /dlwupex/tsrlist_tt,
           gt_tsalesi    type /dlwupex/tsale_tt,
           gt_tlogdci    type /dlwupex/tlogdc_tt,
           gt_tlogsti    type /dlwupex/tlogsto_tt,
           lv_error      type flag,
           ls_errmessage type string.
  data lv_index_sheet     type i.
  data lv_task   type string.
  lv_index_sheet = 1.

  while lv_index_sheet < 11.
    call function '/DLWUPEX/XLSUPLOADSHEET'
      exporting
        ip_stream     = ip_stream
        ip_sheet      = lv_index_sheet
      importing
        ep_sheet      = lv_sheet
        et_gdata      = gt_gdatai
        et_unit       = gt_tuniti
        et_carac      = gt_tcaracti
        et_bom        = gt_tbomi
        et_list       = gt_tlisti
        et_fia        = gt_tfiai
        et_slist      = gt_tslisti
        et_sale       = gt_tsalesi
        et_logdc      = gt_tlogdci
        et_logstore   = gt_tlogsti
        ep_eroor      = lv_error
        ep_errmessage = ls_errmessage.
    if lv_error is not initial.
      ep_eroor = abap_true.
     " ep_errmessage = ls_errmessage.
     " exit.
    endif.
    lv_index_sheet = lv_index_sheet + 1.

    case lv_sheet.
      when 1.
        gt_gdata[] = gt_gdatai[].
      when 2.
        gt_tunit[] = gt_tuniti[].
      when 3.
        gt_tcaract[] = gt_tcaracti[].
      when 4.
        gt_tbom[]   = gt_tbomi[].
      when 5.
        gt_tlist[] = gt_tlisti[].
      when 6.
        gt_tfia[] = gt_tfiai[].
      when 7.
        gt_tslist[] = gt_tslisti[].
      when 8.
        gt_tsales[] = gt_tsalesi[].
      when 9.
        gt_tlogdc[] = gt_tlogdci[].
      when 10.
        gt_tlogst[] = gt_tlogsti[].
      when others.
    endcase.
  endwhile.

  et_gdata = gt_gdata.
  et_unit  = gt_tunit.
  et_carac = gt_tcaract.
  et_bom   = gt_tbom.
  et_list  = gt_tlist.
  et_fia   = gt_tfia.
  et_slist = gt_tslist.
  et_sale  = gt_tsales.
  et_logdc = gt_tlogdc.
  et_logstore = gt_tlogst.





  "OLd

*lv_index_sheet = 1.
*
*WHILE lv_index_sheet < 11.
*  lv_task = lv_index_sheet.
*  CONCATENATE 'FUNC' lv_task INTO lv_task .
*  CONDENSE lv_task NO-GAPS.
*  call function '/DLWUPEX/XLSUPLOADSHEET'
*   starting new task lv_task
*             destination 'NONE'
*              performing set_result_done on end of task
*        exporting
*          IP_STREAM =  IP_STREAM
*          IP_SHEET  = lv_index_sheet.
*  lv_index_sheet = lv_index_sheet + 1.
*ENDWHILE.
*
*
*    wait until gv_gendata = 'X'.
**    et_xml_shared_str_itab = gt_xml_shared_str_itab.
**    et_xml_sheet_itab      = gt_xml_sheet_itab.
*    co_ixml_factory        =  go_ixml_factory.
*     ET_GDATA = gt_gdata.
*     ET_UNIT  = gt_TUNIT.
*     ET_CARAC = gt_TCARACT.
*     ET_BOM   = gt_TBOM.
*     ET_LIST  = gt_TList.
*     ET_FIA   = gt_TFIA.
*     ET_SLIST = gt_TSlist.
*     ET_SALE  = gt_TSales.
*     ET_LOGDC = gt_TLogdc.
*     ET_LOGSTORE = gt_TLogst.

  "Endold


*     call function '/DLWUPEX/XLSUPLOADSHEET'
*        exporting
*          io_xlsx                      = io_xlsx
*          io_log                       = io_log
*       IMPORTING
*         eT_XML_SHARED_STR_ITAB       = et_xml_shared_str_itab
*         eT_XML_SHEET_ITAB            = et_xml_sheet_itab
*        changing
*          co_ixml_factory              = co_ixml_factory
*                .




* IMPORTING
*   LT_XML_SHARED_STR_ITAB       = Et_xml_shared_str_itab
*   LT_XML_SHEET_ITAB            = Et_xml_sheet_itab
*  changing
*    lo_ixml_factory              =  co_ixml_factory
  .
*form set_function1_done using taskname.
*
*
*
*endform.
*}   INSERT




endfunction.
