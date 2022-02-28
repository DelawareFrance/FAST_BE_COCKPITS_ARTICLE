*&---------------------------------------------------------------------*
*& Report /DLWUPEX/CAM_ARCHIVE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT /dlwupex/cam_archive.

TABLES :/dlwupex/treqids.

SELECTION-SCREEN BEGIN OF BLOCK bloc1  WITH FRAME TITLE TEXT-t01.
PARAMETERS:  p_arch  RADIOBUTTON GROUP gr1 USER-COMMAND za.
PARAMETERS:  p_recup  RADIOBUTTON GROUP gr1.
SELECTION-SCREEN END OF BLOCK bloc1.


SELECTION-SCREEN BEGIN OF BLOCK bloc2  WITH FRAME.
PARAMETERS:  p_status TYPE /dlwupex/ereqstatus DEFAULT '06' MODIF ID sp1.
PARAMETERS:  p_test TYPE xfeld DEFAULT abap_true.
SELECTION-SCREEN END OF BLOCK bloc2.


SELECTION-SCREEN BEGIN OF BLOCK bloc3  WITH FRAME TITLE TEXT-t02.
SELECT-OPTIONS : s_date FOR /dlwupex/treqids-zdate.
SELECT-OPTIONS : s_reqid FOR /dlwupex/treqids-reqid.
SELECTION-SCREEN END OF BLOCK bloc3.


AT SELECTION-SCREEN OUTPUT.

  IF p_recup IS NOT INITIAL.
    LOOP AT SCREEN INTO DATA(screen_wa).
      IF screen_wa-name CP '*S_REQID*'.
        screen_wa-invisible    = '0'.
        screen_wa-active    = '1'.
      ENDIF.
      IF screen_wa-group1 = 'SP1'.
        screen_wa-input = '0'.
      ENDIF.
      MODIFY SCREEN FROM screen_wa.
    ENDLOOP.
  ELSE.
    LOOP AT SCREEN INTO screen_wa.
      IF screen_wa-name CP '*S_REQID*'.
        screen_wa-invisible    = '1'.
        screen_wa-active    = '0'.
      ENDIF.
      IF screen_wa-group1 = 'SP1'.
        screen_wa-input = '0'.
      ENDIF.
      MODIFY SCREEN FROM screen_wa.
    ENDLOOP.
  ENDIF.


START-OF-SELECTION.

  IF p_arch IS NOT INITIAL. "Archivage
    IF s_date IS INITIAL.
      MESSAGE TEXT-s01 TYPE 'S' DISPLAY LIKE 'E'.
      EXIT.
    ENDIF.
    PERFORM archive_data.
  ELSE. "Récupération
    IF s_date IS INITIAL AND s_reqid IS INITIAL.
      MESSAGE TEXT-s02 TYPE 'S' DISPLAY LIKE 'E'.
      EXIT.
    ENDIF.

    PERFORM recup_data.
  ENDIF.

**************************** Routines de Traitement *******************

FORM archive_data.

  DATA : lv_msg      TYPE string,
         lv_count_st TYPE string.

  SELECT COUNT(*) FROM /dlwupex/treqids INTO @DATA(lv_count)
     WHERE zdate IN @s_date AND
            status = @p_status.
  IF p_test IS NOT INITIAL.
    lv_count_st = lv_count.
    CONCATENATE TEXT-t03 lv_count_st INTO DATA(lv_result) SEPARATED BY space.
    WRITE lv_result.
    EXIT.
  ENDIF.

  CLEAR : lv_count, lv_count_st.

  SELECT reqid FROM /dlwupex/treqids INTO TABLE @DATA(lt_reqids_list)
     WHERE zdate IN @s_date AND
            status = @p_status.

  LOOP AT lt_reqids_list ASSIGNING FIELD-SYMBOL(<fs_reqid>).

* select data
    SELECT * FROM /dlwupex/treqids INTO TABLE @DATA(lt_reqids)
       WHERE reqid = @<fs_reqid>-reqid.

    CHECK lt_reqids IS NOT INITIAL.

    SELECT * FROM /dlwupex/tgdata INTO TABLE @DATA(lt_gdata)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/tbom INTO TABLE @DATA(lt_bom)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/tcaract INTO TABLE @DATA(lt_caract)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/tfia INTO TABLE @DATA(lt_fia)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/tlogdc INTO TABLE @DATA(lt_logdc)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/tlogsto INTO TABLE @DATA(lt_logst)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/tlist INTO TABLE @DATA(lt_list)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/tsale INTO TABLE @DATA(lt_sale)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/tsrlist INTO TABLE @DATA(lt_srlist)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/tunit INTO TABLE @DATA(lt_unit)
       WHERE reqid = @<fs_reqid>-reqid.

* Archive data
    INSERT /dlwupex/archreq FROM TABLE lt_reqids.
    IF sy-subrc <> 0.
      DATA(lv_error) = abap_true.
    ENDIF.
    DELETE /dlwupex/treqids FROM TABLE lt_reqids.
    IF sy-subrc <> 0.
      lv_error = abap_true.
    ENDIF.

    IF lt_bom IS NOT INITIAL.
      INSERT /dlwupex/archbom FROM TABLE lt_bom.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tbom FROM TABLE lt_bom.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_caract IS NOT INITIAL.
      INSERT /dlwupex/archcar FROM TABLE lt_caract.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tcaract FROM TABLE lt_caract.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_fia IS NOT INITIAL.
      INSERT /dlwupex/archfia FROM TABLE lt_fia.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tfia FROM TABLE lt_fia.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_gdata IS NOT INITIAL.
      INSERT /dlwupex/archgda FROM TABLE lt_gdata.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tgdata FROM TABLE lt_gdata.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_logdc IS NOT INITIAL.
      INSERT /dlwupex/archldc FROM TABLE lt_logdc.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tlogdc FROM TABLE lt_logdc.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_logst IS NOT INITIAL.
      INSERT /dlwupex/archlst FROM TABLE lt_logst.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tlogsto FROM TABLE lt_logst.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_list IS NOT INITIAL.
      INSERT /dlwupex/archlis FROM TABLE lt_list.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tlist FROM TABLE lt_list.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_sale IS NOT INITIAL.
      INSERT /dlwupex/archsal FROM TABLE lt_sale.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tsale FROM TABLE lt_sale.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_srlist IS NOT INITIAL.
      INSERT /dlwupex/archsrl FROM TABLE lt_srlist.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tsrlist FROM TABLE lt_srlist.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_unit IS NOT INITIAL.
      INSERT /dlwupex/archuni FROM TABLE lt_unit.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/tunit FROM TABLE lt_unit.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.


    IF lv_error = abap_true.
      lv_msg = TEXT-e01.
      REPLACE ALL OCCURRENCES OF '&' IN lv_msg WITH <fs_reqid>-reqid.
      WRITE lv_msg.
      ROLLBACK WORK.
    ELSE.
      lv_count = lv_count + 1.
      COMMIT WORK AND WAIT.
    ENDIF.

    REFRESH : lt_reqids, lt_fia, lt_sale, lt_gdata, lt_list,
              lt_srlist, lt_unit, lt_logdc, lt_logst, lt_caract, lt_bom.

  ENDLOOP.

  lv_count_st = lv_count.
  lv_msg = TEXT-s03.
  REPLACE ALL OCCURRENCES OF '&' IN lv_msg WITH lv_count_st.

  WRITE lv_msg.

ENDFORM.

FORM recup_data.

  DATA : lv_msg      TYPE string,
         lv_count_st TYPE string.

  IF s_date IS NOT INITIAL.
    SELECT COUNT(*) FROM /dlwupex/archreq INTO @DATA(lv_count)
       WHERE reqid IN @s_reqid AND
             zdate  IN @s_date AND
              status = @p_status.
  ELSE.
    SELECT COUNT(*) FROM /dlwupex/archreq INTO lv_count
     WHERE reqid IN s_reqid AND
              status = p_status.
  ENDIF.

  IF p_test IS NOT INITIAL.
    lv_count_st = lv_count.
    CONCATENATE TEXT-t04 lv_count_st INTO DATA(lv_result) SEPARATED BY space.
    WRITE lv_result.
    EXIT.
  ENDIF.

  CLEAR : lv_count, lv_count_st.

  IF s_date IS NOT INITIAL.
    SELECT reqid FROM /dlwupex/archreq INTO TABLE @DATA(lt_reqids_list)
       WHERE reqid IN @s_reqid AND
             zdate  IN @s_date AND
              status = @p_status.
  ELSE.
    SELECT reqid FROM /dlwupex/archreq INTO TABLE lt_reqids_list
     WHERE reqid IN s_reqid AND
              status = p_status.
  ENDIF.

  LOOP AT lt_reqids_list ASSIGNING FIELD-SYMBOL(<fs_reqid>).

* select data
    SELECT * FROM /dlwupex/archreq INTO TABLE @DATA(lt_reqids_arch)
       WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archbom INTO TABLE @DATA(lt_bom_arch)
         WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archcar INTO TABLE @DATA(lt_caract_arch)
         WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archfia INTO TABLE @DATA(lt_fia_arch)
         WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archgda INTO TABLE @DATA(lt_gdata_arch)
         WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archldc INTO TABLE @DATA(lt_logdc_arch)
         WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archlst INTO TABLE @DATA(lt_logst_arch)
         WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archlis INTO TABLE @DATA(lt_list_arch)
         WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archsal INTO TABLE @DATA(lt_sale_arch)
         WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archsrl INTO TABLE @DATA(lt_srlist_arch)
         WHERE reqid = @<fs_reqid>-reqid.

    SELECT * FROM /dlwupex/archuni INTO TABLE @DATA(lt_unit_arch)
         WHERE reqid = @<fs_reqid>-reqid.


* Retrieve data
    INSERT /dlwupex/treqids FROM TABLE lt_reqids_arch.
    IF sy-subrc <> 0.
      DATA(lv_error) = abap_true.
    ENDIF.
    DELETE /dlwupex/archreq FROM TABLE lt_reqids_arch.
    IF sy-subrc <> 0.
      lv_error = abap_true.
    ENDIF.

    IF lt_bom_arch IS NOT INITIAL.
      INSERT /dlwupex/tbom FROM TABLE lt_bom_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archbom FROM TABLE lt_bom_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_caract_arch IS NOT INITIAL.
      INSERT /dlwupex/tcaract FROM TABLE lt_caract_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archcar FROM TABLE lt_caract_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_fia_arch IS NOT INITIAL.
      INSERT /dlwupex/tfia FROM TABLE lt_fia_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archfia FROM TABLE lt_fia_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_gdata_arch IS NOT INITIAL.
      INSERT /dlwupex/tgdata FROM TABLE lt_gdata_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archgda FROM TABLE lt_gdata_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_logdc_arch IS NOT INITIAL.
      INSERT /dlwupex/tlogdc FROM TABLE lt_logdc_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archldc FROM TABLE lt_logdc_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_logst_arch IS NOT INITIAL.
      INSERT /dlwupex/tlogsto FROM TABLE lt_logst_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archlst FROM TABLE lt_logst_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_list_arch IS NOT INITIAL.
      INSERT /dlwupex/tlist FROM TABLE lt_list_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archlis FROM TABLE lt_list_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_sale_arch IS NOT INITIAL.
      INSERT /dlwupex/tsale FROM TABLE lt_sale_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archsal FROM TABLE lt_sale_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_srlist_arch IS NOT INITIAL.
      INSERT /dlwupex/tsrlist FROM TABLE lt_srlist_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archsrl FROM TABLE lt_srlist_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lt_unit_arch IS NOT INITIAL.
      INSERT /dlwupex/tunit FROM TABLE lt_unit_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
      DELETE /dlwupex/archuni FROM TABLE lt_unit_arch.
      IF sy-subrc <> 0.
        lv_error = abap_true.
      ENDIF.
    ENDIF.

    IF lv_error = abap_true.
      lv_msg = TEXT-e02.
      REPLACE ALL OCCURRENCES OF '&' IN lv_msg WITH <fs_reqid>-reqid.
      WRITE lv_msg.
      ROLLBACK WORK.
    ELSE.
      lv_count = lv_count + 1.
      COMMIT WORK AND WAIT.
    ENDIF.

    REFRESH : lt_reqids_arch, lt_fia_arch, lt_sale_arch, lt_gdata_arch, lt_list_arch,
              lt_srlist_arch, lt_unit_arch, lt_logdc_arch, lt_logst_arch, lt_caract_arch, lt_bom_arch.
  ENDLOOP.

  lv_count_st = lv_count.
  lv_msg = TEXT-s04.

  REPLACE ALL OCCURRENCES OF '&' IN lv_msg WITH lv_count_st.

  WRITE lv_msg.

ENDFORM.
