class /DLWUPEX/CL_ODMIGRATIO_DPC_EXT definition
  public
  inheriting from /DLWUPEX/CL_ODMIGRATIO_DPC
  create public .

public section.

  data GT_VIEWS type /DLWUPEX/TVIEW_TT .

  methods GET_TABLE_DESC
    importing
      !IV_TABNAME type TABNAME
    exporting
      !EV_DDTEXT type AS4TEXT .
  methods GET_TABLE_NAME
    importing
      !IP_VIEWNAME type /DLWUPEX/EVIEWNAME
    exporting
      !EV_TABNAME type TABNAME16 .
  methods CONVERT_DATE
    importing
      !IP_INPUT type CHAR10
    exporting
      !EP_OUTPUT type DATS .
  methods GET_CONVEXIT
    importing
      !IS_CONVEXIT type CONVEXIT
      !IS_VALUE type /DLWUPEX/EVALUEFIELD
    exporting
      !ES_XFELD type XFELD
      !EV_OUTPUT type STRING
    changing
      !CV_NO_FUNCTION type XFELD .
  methods CONVERSION_XMLSTR_2_ITAB
    importing
      !IV_XSTRING type /IWBEP/IF_MGW_APPL_TYPES=>TY_S_MEDIA_RESOURCE-VALUE
      !IO_LOG type ref to IF_IDGT_APPLOG optional
    exporting
      !ET_XML_ITAB type CRTG_FILE_DATA_TABLE
      !EP_ID type /DLWUPEX/EREQID
      !EP_SUBRC type SYSUBRC
      !EP_ERRMSG type STRING
    raising
      CX_IDGT_EXCEPTION .
  methods QUAR_CONVERSION
    importing
      !LO_XLSX type ref to CL_XLSX_DOCUMENT
      !IO_LOG type ref to IF_IDGT_APPLOG
    exporting
      !LT_XML_SHARED_STR_ITAB type TABLE
      !LT_XML_SHEET_ITAB type TABLE
    changing
      !LO_IXML_FACTORY type ref to IF_IXML
    raising
      CX_IDGT_EXCEPTION .
  methods READ_AUTIORISATION
    importing
      !IP_VIEWNAME type /DLWUPEX/EVIEWNAME
    exporting
      !EP_RESULT type CHAR1 .
  methods CHECK_VIEW
    importing
      !IP_ID type /DLWUPEX/EBUSUNITID
      !IP_REQID type /DLWUPEX/EREQID
      !IP_NAME type ANY
      !PT_DATA type ANY TABLE
      !IP_VIEWNAME type /DLWUPEX/EVIEWNAME .
  methods GET_CHECK_MSG
    importing
      !IP_ID type /DLWUPEX/EBUSUNITID
      !IP_REQID type /DLWUPEX/EREQID
      !IP_VIEWNAME type /DLWUPEX/EVIEWNAME
      !IP_VALID type BOOLEAN
      !PT_DATA type ANY TABLE optional
    exporting
      !P_RC type SYSUBRC
    changing
      !CT_VIEWS type /DLWUPEX/CL_ODMIGRATIO_MPC=>TT_CHECKITEM .

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_STREAM
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~EXECUTE_ACTION
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_STREAM
    redefinition .
protected section.

  methods BUSINESUNITSET_GET_ENTITYSET
    redefinition .
  methods DATAFILELINESET_GET_ENTITYSET
    redefinition .
  methods DATAFILESET_GET_ENTITY
    redefinition .
  methods DATAFILESET_GET_ENTITYSET
    redefinition .
  methods GETF4VALUESSET_GET_ENTITYSET
    redefinition .
  methods KPIINFOSSET_GET_ENTITY
    redefinition .
  methods MARCHCATEGORYSET_GET_ENTITYSET
    redefinition .
  methods MATERIALSET_GET_ENTITYSET
    redefinition .
  methods REQUESTIDSET_GET_ENTITY
    redefinition .
  methods REQUESTIDSET_GET_ENTITYSET
    redefinition .
  methods TEMPLATEITEMSET_GET_ENTITY
    redefinition .
  methods TEMPLATEITEMSET_GET_ENTITYSET
    redefinition .
  methods TEMPLATESET_GET_ENTITYSET
    redefinition .
  methods XLSSET_GET_ENTITYSET
    redefinition .
  methods AUTORISATIONSET_GET_ENTITY
    redefinition .
private section.

  data GO_MIGRATION_MANAGER type ref to LIF_MIGRATION_MANAGER .
  data GC_GENRALDATA_TAB type TABNAME16 value '/DLWUPEX/TGDATA' ##NO_TEXT.
  data GC_UNITEAN_TAB type TABNAME16 value '/DLWUPEX/TUNIT' ##NO_TEXT.
  data GC_CARACT_TAB type TABNAME16 value '/DLWUPEX/TCARACT' ##NO_TEXT.
  data GC_BOM_TAB type TABNAME16 value '/DLWUPEX/TBOM' ##NO_TEXT.
  data GC_FIAPA_TAB type TABNAME16 value '/DLWUPEX/TFIA' ##NO_TEXT.
  data GC_LISTING_TAB type TABNAME16 value '/DLWUPEX/TLIST' ##NO_TEXT.
  data GC_SOURCELIST_TAB type TABNAME16 value '/DLWUPEX/TSRLIST' ##NO_TEXT.
  data GC_SALEPV_TAB type TABNAME16 value '/DLWUPEX/TSALE' ##NO_TEXT.
  data GC_LOGISTICDC_TAB type TABNAME16 value '/DLWUPEX/TLOGDC' ##NO_TEXT.
  data GC_LOGISTICSTORE_TAB type TABNAME16 value '/DLWUPEX/TLOGSTO' ##NO_TEXT.
  constants GC_CONVEXIT type STRING value ' CONVERSION_EXIT_' ##NO_TEXT.
  constants GC_CONVEXIT2 type STRING value '_INPUT' ##NO_TEXT.
ENDCLASS.



CLASS /DLWUPEX/CL_ODMIGRATIO_DPC_EXT IMPLEMENTATION.


  method /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.

*{   INSERT         DS1K901478                                        1
*
    types: ty_t_crea_items type table of /dlwupex/cl_odmigratio_mpc=>ts_marchcategory with default key.
    types: begin of ts_crea_items.
             include type /dlwupex/cl_odmigratio_mpc=>ts_businesunit.
             types: marchcategoryset type ty_t_crea_items,
           end of ts_crea_items.

    types: ty_t_check_items type table of /dlwupex/cl_odmigratio_mpc=>ts_checkitem with default key.
    types: ty_t_creation_items type table of /dlwupex/cl_odmigratio_mpc=>ts_creationitems with default key.
    types: begin of ts_check_items.
             include type /dlwupex/cl_odmigratio_mpc=>ts_checkheader.
             types: checkitemset type ty_t_check_items,
           end of ts_check_items.

    types: begin of ts_cretion_items.
             include type /dlwupex/cl_odmigratio_mpc=>ts_creationheader.
             types: creationitemsset type ty_t_creation_items,
           end of ts_cretion_items.

    data  : lv_memory(25)      type c,
            lt_return          type bapirettab,
            ls_data            type ts_crea_items,
            lt1_items          type ty_t_crea_items,
            lt_matkl           type mgw_matkl_tt,
            lt_article         type wsd_matnr_tty,
            lv_id              type /dlwupex/ereqid,
            lv_bu              type /dlwupex/ebusunitid,
            lv_rc              type sysubrc,
            lv_rc8             type sysubrc,
            lt_msg             type /dlwupex/tmsg_tt,
            ls_data_check      type ts_check_items,
            ls_data_cretion    type ts_cretion_items,
            lt1_items_check    type ty_t_check_items,
            lt1_items_check2   type ty_t_check_items,
            lt1_items_creation type ty_t_creation_items,
            lt_/dlwupex/tgdata type table of /dlwupex/tgdata,
            lv_tabname         type tabname16,
            lv_tabname_check   type tabname16,
            lv_viewname        type /dlwupex/eviewname,
            lr_matnr           type piq_selopt_t,
            lt_gdata           type table of /dlwupex/tgdata,
            lt_tunit           type table of /dlwupex/tunit,
            lt_tcaract         type table of /dlwupex/tcaract,
            lt_tbom            type table of /dlwupex/tbom,
            lt_tlist           type table of /dlwupex/tlist,
            lt_tfia            type table of /dlwupex/tfia,
            lt_tslist          type table of /dlwupex/tsrlist,
            lt_tsales          type table of /dlwupex/tsale,
            lt_tlogdc          type table of /dlwupex/tlogdc,
            lt_tlogst          type table of /dlwupex/tlogsto,
            lt_gdatac          type table of /dlwupex/tgdata,
            lt_tunitc          type table of /dlwupex/tunit,
            lt_tcaractc        type table of /dlwupex/tcaract,
            lt_tbomc           type table of /dlwupex/tbom,
            lt_tlistc          type table of /dlwupex/tlist,
            lt_tfiac           type table of /dlwupex/tfia,
            lt_tslistc         type table of /dlwupex/tsrlist,
            lt_tsalesc         type table of /dlwupex/tsale,
            lt_tlogdcc         type table of /dlwupex/tlogdc,
            lt_tlogstc         type table of /dlwupex/tlogsto,
            lv_matnr           type matnr,
            lv_table           type ddobjname,
            lv_field           type fieldname,
            lt_dfies_tab       type table of dfies,
            lv_date            type dats,
            lv_dateui          type char10,
            lt_tview           type /dlwupex/tview_tt,
            lt_tviewp          type /dlwupex/tview_tt,
            lt_msg_check       type /dlwupex/tmsg_tt,
            lv_lineid          type /dlwupex/elineid,
            lv_artkey          type /dlwupex/ematkey,
            lv_xfeld           type xfeld,
            lv_no_function     type xfeld,
            lv_line            type /dlwupex/elineid,
            lv_copynb          type int4,
            lt_tfitxls         type table of /dlwupex/tfitxls,
            lv_key             type string,
            lv_cpt             type i,
            lt_table           type ref to data,
            w_dy_line          type ref to data,
            g_field            type ref to data,
            lr_exc             type ref to cx_root,
            lv_dec50(16)       type p decimals 14,
            llv_art            type matnr,
            llv_line           type /dlwupex/elineid,
            llv_fieldname      type name_feld,
            llv_value          type symsgv.




    field-symbols : <t_table>    type  any table,
                    <t_tablep>   type  any table,
                    <ls_workara> type any,
                    <fs_field>   type any.

    constants: lc_valuestate_error(21)   type c value 'Error',
               lc_valuestate_success(21) type c value 'Success'.


    case iv_entity_name.
      when 'BusinesUnit'.
        call method io_data_provider->read_entry_data( importing es_data = ls_data ).
        lt1_items  = ls_data-marchcategoryset.

*Get BE classe instance
*        data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu = ls_data-id  ).
        data(gcl_cockpit) = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = ls_data-id  ).
        check gcl_cockpit is bound.
        loop at lt1_items into data(ls_item).
          if ls_item-matkl is not initial.
            append initial line to lt_matkl assigning field-symbol(<f_matkl>).
            <f_matkl> = ls_item-matkl.
          endif.

          if ls_item-filter is  not initial.
            append initial line to lt_article assigning field-symbol(<f_mat>).
            <f_mat> =  ls_item-filter.
          endif.
        endloop.
        if ls_data-reqid = abap_true or ls_data-reqid is not initial.
          loop at lt_matkl into data(ls_matkl).
            append initial line to lt_tfitxls assigning field-symbol(<f_tfitxls>).
            <f_tfitxls>-id = ls_data-id.
            <f_tfitxls>-uname = sy-uname.
            <f_tfitxls>-isgm = abap_true.
            <f_tfitxls>-value = ls_matkl.
            <f_tfitxls>-ersda = sy-datum.
          endloop.
          loop at lt_article into data(ls_article).
            append initial line to lt_tfitxls assigning <f_tfitxls>.
            <f_tfitxls>-id = ls_data-id.
            <f_tfitxls>-uname = sy-uname.
            <f_tfitxls>-isgm = abap_false.
            <f_tfitxls>-value = ls_article.
            <f_tfitxls>-ersda = sy-datum.
          endloop.
          delete from /dlwupex/tfitxls where uname = sy-uname.
          if ls_data-reqid ne abap_true.
            loop at lt_tfitxls assigning field-symbol(<f_tfitxlss>) .
              <f_tfitxlss>-value =   ls_data-reqid && '/'  && <f_tfitxlss>-value.
            endloop.
          endif.
          modify  /dlwupex/tfitxls from table  lt_tfitxls.

        else.
          call method gcl_cockpit->/dlwupex/if_cockpit_article~create_worklist
            exporting
              it_matkl   = lt_matkl
              it_article = lt_article
            " iv_flag_create_excel = 'X'
            importing
              ev_id      = lv_id
            changing
              cv_rc      = lv_rc
              ct_msg     = lt_msg
              ct_unit    = lt_tunit
              ct_caract  = lt_tcaract
              ct_bom     = lt_tbom
              ct_fia     = lt_tfia
              ct_list    = lt_tlist
              ct_srlist  = lt_tslist
              ct_sale    = lt_tsales
              ct_logdc   = lt_tlogdc
              ct_logsto  = lt_tlogst
              ct_gdata   = lt_gdata.

          ls_data-reqid =  lv_id.

*Insert Fia | Listing by default.

          select art_key as low from /dlwupex/tgdata
                                into corresponding fields of table lr_matnr
                                where id =  ls_data-id
                                and   reqid = lv_id.
          loop at  lr_matnr assigning field-symbol(<f_matnr2>).
            <f_matnr2>-sign = 'I'.
            <f_matnr2>-option = 'EQ'.
          endloop.
          if lr_matnr[] is not initial.
            call method gcl_cockpit->/dlwupex/if_cockpit_article~insert_line
              exporting
                iv_reqid    = lv_id
*               iv_matnr    =
                iv_viewname = '06'
                iv_nbcopy   = 1
                ir_matnr    = lr_matnr
                iv_lineid   = 1
              changing
                ct_msg      = lt_msg
                cv_rc       = lv_rc.

            call method gcl_cockpit->/dlwupex/if_cockpit_article~insert_line
              exporting
                iv_reqid    = lv_id
*               iv_matnr    =
                iv_viewname = '05'
                iv_nbcopy   = 1
                ir_matnr    = lr_matnr
                iv_lineid   = 1
              changing
                ct_msg      = lt_msg
                cv_rc       = lv_rc.
          endif.

        endif.
        if lt_msg[] is not initial and lv_id is initial.
          try .
              ls_data-description = lt_msg[ 1 ]-message.
            catch cx_sy_itab_line_not_found.
          endtry.
        else."Save check error
          sort  lt_gdata by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                    ip_name     = '/dlwupex/tgdata'
                                    pt_data     = lt_gdata
                                    ip_viewname = '01' )
                              .
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.
          sort  lt_tunit by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                 ip_name     = '/dlwupex/tunit'
                                 pt_data     = lt_tunit
                                 ip_viewname = '02' )
                           .
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.
          sort  lt_tcaract by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                 ip_name     = '/dlwupex/tcaract'
                                 pt_data     = lt_tcaract
                                 ip_viewname = '03' )
                           .
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.
          sort  lt_tbom by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                 ip_name     = '/dlwupex/tbom'
                                 pt_data     = lt_tbom
                                 ip_viewname = '04' )
                           .
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.
          sort  lt_tlist by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                 ip_name     = '/dlwupex/tlist'
                                 pt_data     = lt_tlist
                                 ip_viewname = '05' )
                           .
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.
          sort lt_tfia by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                 ip_name     = '/dlwupex/tfia'
                                 pt_data     = lt_tfia
                                 ip_viewname = '06' )
                           .
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.
          sort  lt_tslist by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                 ip_name     = '/dlwupex/tsrlist'
                                 pt_data     = lt_tslist
                                 ip_viewname = '07' )
                           .
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.
          sort lt_tsales by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                 ip_name     = '/dlwupex/tsale'
                                 pt_data     = lt_tsales
                                 ip_viewname = '08' )
                           .
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.
          sort lt_tlogdc by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                    ip_name     = '/dlwupex/tlogdc'
                                    pt_data     = lt_tlogdc
                                    ip_viewname = '09' ).
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.
          sort  lt_tlogst by art_key.
          me->check_view( exporting ip_id       = ls_data-id
                                    ip_reqid    = lv_id
                                    ip_name     = '/dlwupex/tlogsto'
                                    pt_data     = lt_tlogst
                                    ip_viewname = '10' ).
          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = 'X'
            changing
              ct_tview = gt_views.

        endif.

        copy_data_to_ref(
             exporting
                 is_data =     ls_data
             changing
                 cr_data = er_deep_entity ).
      when 'CheckHeader'.
        call method io_data_provider->read_entry_data( importing es_data = ls_data_check ).
        lt1_items_check  = ls_data_check-checkitemset.
        try .
            lv_viewname = lt1_items_check[ 1 ]-viewname.
          catch cx_sy_itab_line_not_found.
        endtry.

        if ls_data_check-isdelete = abap_true.
          loop at lt1_items_check into data(ls_items_check).
            append initial line to lr_matnr assigning field-symbol(<f_matnr>).
            <f_matnr>-sign = 'I'.
            <f_matnr>-option = 'EQ'.
            <f_matnr>-low = ls_items_check-artkey.
          endloop.
          if lr_matnr[] is not initial.
            " gcl_cockpit = new /dlwupex/cl_cockpit_article( iv_bu = ls_data_check-id  ).
            gcl_cockpit = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = ls_data_check-id   ).
            call method gcl_cockpit->/dlwupex/if_cockpit_article~delete_material
              exporting
                iv_reqid = ls_data_check-reqid
                ir_matnr = lr_matnr
              changing
                ct_msg   = lt_msg
                cv_rc    = lv_rc.
            ls_data_check-subrc = lv_rc.
            if lt_msg[] is not initial.
              ls_data_check-message = lt_msg[ 1 ]-message.
            endif.
          else.
            ls_data_check-subrc = 4.
          endif.
          clear lt1_items_check[].
          ls_data_check-checkitemset = lt1_items_check.
          copy_data_to_ref(
                   exporting
                       is_data =     ls_data_check
                   changing
                       cr_data = er_deep_entity ).
        elseif ls_data_check-issave = abap_true.
          "gcl_cockpit = new /dlwupex/cl_cockpit_article( iv_bu = ls_data_check-id  ).
          gcl_cockpit = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = ls_data_check-id   ).
          check gcl_cockpit is bound.


*Get data base data
          call method /dlwupex/cl_cockpit_article=>get_data
            exporting
              iv_bu     = ls_data_check-id
              iv_reqid  = ls_data_check-reqid
            changing
              ct_unit   = lt_tunit
              ct_caract = lt_tcaract
              ct_bom    = lt_tbom
              ct_fia    = lt_tfia
              ct_list   = lt_tlist
              ct_srlist = lt_tslist
              ct_sale   = lt_tsales
              ct_logdc  = lt_tlogdc
              ct_logsto = lt_tlogst
              ct_gdata  = lt_gdata
              cv_rc     = lv_rc.

          sort lt_gdata by  art_key.
          sort : lt_tunit by  art_key line ,
                 lt_tcaract by  art_key line,
                 lt_tbom by  art_key line,
                 lt_tfia by  art_key line,
                 lt_tlist by  art_key line,
                 lt_tslist by art_key line,
                 lt_tsales by art_key line,
                 lt_tlogdc by art_key line,
                 lt_tlogst by art_key line.


          select  tabname,tabfield,viewname from /dlwupex/tfields into table @data(lt_tfields)
                                                                  where    actif    = 'Y'
                                                                  and      viewname =  @lv_viewname.
          sort lt_tfields by tabfield.
*Prepare tables input

          loop at lt1_items_check into data(ls1_items_check) where fieldname ne 'ARTKEY' and fieldname ne 'LINE'.
            refresh lt_dfies_tab.
            lv_viewname = ls1_items_check-viewname.
            data(is_datbb) = abap_false.
            read table  lt1_items_check into data(ls_linenum3)
                                     with key  artkey = ls1_items_check-artkey
                                               rownum =  ls1_items_check-rownum
                                               fieldname = 'LINE'.
            if lv_viewname = '01' and ls1_items_check-fieldname = 'DATABB'.
              ls1_items_check-fieldname = 'DATAB'.
              is_datbb = abap_true.
            endif.
            read table lt_tfields into data(ls_tfields)
                                  with  key  tabfield = ls1_items_check-fieldname binary search.

            if sy-subrc eq 0.
              data(lv_tabname2) = ls_tfields-tabname.
              lv_table = lv_tabname2.
              lv_field = ls1_items_check-fieldname.

              call method gcl_cockpit->get_fieldinfo_field
                exporting
                  iv_tabname   = lv_table
                  iv_fieldname = lv_field
                importing
                  et_dfies_tab = lt_dfies_tab.
              try .
                  data(lv_datatype) = lt_dfies_tab[ 1 ]-datatype.
                  data(lv_convexit) = lt_dfies_tab[ 1 ]-convexit.
                catch cx_sy_itab_line_not_found.
              endtry.
              if lv_convexit is not initial.
                clear lv_xfeld.
                call method me->get_convexit
                  exporting
                    is_convexit    = lv_convexit
                    is_value       = ls1_items_check-value
                  importing
                    es_xfeld       = lv_xfeld
                    ev_output      = ls1_items_check-value
                  changing
                    cv_no_function = lv_no_function.
              elseif lv_field = 'ZZ1_ZUO_ENTREE_PLT' or lv_field = 'ZZ1_ZUO_SORTIE_PLT' or lv_field = 'ZZ1_UVECOM_SAL'.
                call function 'CONVERSION_EXIT_CUNIT_INPUT'
                  exporting
                    input          = ls1_items_check-value
                    language       = sy-langu
                  importing
                    output         = ls1_items_check-value
                  exceptions
                    unit_not_found = 1
                    others         = 2.
                if sy-subrc <> 0.
                  "Implement suitable error handling here
                endif.
              endif.
              if lv_datatype = 'DATS'.
                lv_dateui = ls1_items_check-value.
                call method me->convert_date
                  exporting
                    ip_input  = lv_dateui
                  importing
                    ep_output = lv_date.
                ls1_items_check-value = lv_date.
              endif.
            endif.
            if ls1_items_check-fieldname = 'ATINN'.
              call function 'CONVERSION_EXIT_ATINN_INPUT'
                exporting
                  input  = ls1_items_check-value
                importing
                  output = ls1_items_check-value.
            endif.
            if lv_datatype = 'QUAN' or lv_datatype = 'DEC' or lv_datatype = 'CURR'.
              translate ls1_items_check-value using ',.'.
              condense ls1_items_check-value no-gaps.
*Begin Avoid dump when caratere in dec field
              try .
                  data(lv_dataelement)  = lt_dfies_tab[ 1 ]-rollname.
                catch cx_sy_itab_line_not_found.
              endtry.

              create data g_field type (lv_dataelement).
              assign g_field->* to <fs_field>.
              try .
                  <fs_field> = ls1_items_check-value.
*          catch cx_sy_conversion_no_number into  lref_conversion_no_number.
                catch cx_root into lr_exc.
                  data(lv_msg_error) = lr_exc->get_text( ).
                  ls_data_check-message = lv_msg_error.
                  ls_data_check-subrc = 4.
*Alim check table

                  llv_art = ls1_items_check-artkey.
                  llv_line = ls_linenum3-value.
                  llv_fieldname = ls1_items_check-fieldname.
                  llv_value = ls1_items_check-value.
                  call method gcl_cockpit->/dlwupex/if_cockpit_article~msg_check_type
                    exporting
                      iv_reqid     = ls_data_check-reqid
                      iv_art       = llv_art
                      iv_line      = llv_line
                      iv_viewname  = lv_viewname
                      iv_fieldname = llv_fieldname
                      iv_value     = llv_value.

                  continue.
              endtry.
              lv_dec50 = ls1_items_check-value.
              llv_art = ls1_items_check-artkey.
              llv_line = ls_linenum3-value.
              llv_fieldname = ls1_items_check-fieldname.
              if <fs_field> ne  lv_dec50.
                ls_data_check-message = text-004 && | | && ls1_items_check-value && | | && text-005  .
                ls_data_check-subrc = 4.

                llv_value = ls1_items_check-value.
                call method gcl_cockpit->/dlwupex/if_cockpit_article~msg_check_type
                  exporting
                    iv_reqid     = ls_data_check-reqid
                    iv_art       = llv_art
                    iv_line      = llv_line
                    iv_viewname  = lv_viewname
                    iv_fieldname = llv_fieldname
                    iv_value     = llv_value.
              else.
                call method gcl_cockpit->/dlwupex/if_cockpit_article~msg_check_type_delete
                  exporting
                    iv_reqid     = ls_data_check-reqid
                    iv_art       = llv_art
                    iv_line      = llv_line
                    iv_viewname  = lv_viewname
                    iv_fieldname = llv_fieldname.

              endif.
*End Avoid dump when caratere in dec field
            endif.
*            read table  lt1_items_check into data(ls_linenum3)
*                                       with key  artkey = ls1_items_check-artkey
*                                                 rownum =  ls1_items_check-rownum
*                                                 fieldname = 'LINE'.
            if is_datbb = abap_true and ls1_items_check-fieldname = 'DATAB'.
              ls1_items_check-fieldname = 'DATABB'.
            endif.

            case  ls1_items_check-viewname.
              when '01' .
                read table lt_gdata assigning field-symbol(<f_gdata>) with key art_key = ls1_items_check-artkey
                                                                      binary search .
                check sy-subrc eq 0.
                assign component ls1_items_check-fieldname of structure <f_gdata> to field-symbol(<valuechange>).
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.
                read table lt_gdatac assigning field-symbol(<f_dgatac>)  with key art_key = ls1_items_check-artkey
                                                                          binary search .
                if sy-subrc ne 0.
                  append <f_gdata> to  lt_gdatac.
                else.
                  move-corresponding <f_gdata> to <f_dgatac>.
                endif.
              when '02'.
*            lt_tunit[] = <t_table>[].
                read table lt_tunit assigning field-symbol(<f_unit>)  with key art_key = ls1_items_check-artkey
                                                                               line = ls_linenum3-value binary search.
                check sy-subrc eq 0.
                assign component ls1_items_check-fieldname of structure <f_unit> to <valuechange>.
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.

                read table lt_tunitc assigning field-symbol(<f_unitc>)  with key art_key = ls1_items_check-artkey
                                                                                 line = ls_linenum3-value binary search.
                if sy-subrc ne 0.
                  append <f_unit> to  lt_tunitc.
                else.
                  move-corresponding  <f_unit> to <f_unitc>.
                endif.
              when '03'.
*              lt_tcaract[] = <t_table>[].
                read table lt_tcaract assigning field-symbol(<f_tcaract>)  with key art_key = ls1_items_check-artkey
                                                                               line = ls_linenum3-value binary search.
                check sy-subrc eq 0.
                assign component ls1_items_check-fieldname of structure <f_tcaract> to <valuechange>.
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.
                read table lt_tcaractc assigning field-symbol(<f_tcaractc>)  with key art_key = ls1_items_check-artkey
                                                                               line = ls_linenum3-value binary search.
                if sy-subrc ne 0.
                  append <f_tcaract> to   lt_tcaractc.
                else.
                  move-corresponding  <f_tcaract> to <f_tcaractc>.
                endif.
              when '04'.
*              lt_tbom[] = <t_table>[].
                read table lt_tbom assigning field-symbol(<f_tbom>)   with key art_key = ls1_items_check-artkey
                                                                               line = ls_linenum3-value binary search.
                check sy-subrc eq 0.
                assign component ls1_items_check-fieldname of structure <f_tbom> to <valuechange>.
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.
                read table  lt_tbomc assigning field-symbol(<f_tbomc>)  with key art_key = ls1_items_check-artkey
                                                                              line = ls_linenum3-value binary search.
                if sy-subrc ne 0.
                  append <f_tbom> to lt_tbomc.
                else.
                  move-corresponding <f_tbom> to <f_tbomc>.
                endif.

              when '05'.
*              lt_tlist[] = <t_table>[].
                read table lt_tlist assigning field-symbol(<f_tlist>)  with key art_key = ls1_items_check-artkey
                                                                               line = ls_linenum3-value binary search.
                check sy-subrc eq 0..
                assign component ls1_items_check-fieldname of structure <f_tlist> to <valuechange>.
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.
                read table  lt_tlistc assigning field-symbol(<f_tlistc>)  with key art_key = ls1_items_check-artkey
                                                                              line = ls_linenum3-value binary search.
                if sy-subrc ne 0.
                  append <f_tlist> to lt_tlistc.
                else.
                  move-corresponding <f_tlist> to <f_tlistc>.
                endif.
              when '06'.
*              lt_tfia[] = <t_table>[].
                read table lt_tfia assigning field-symbol(<f_tfia>)  with key art_key = ls1_items_check-artkey
                                                                               line = ls_linenum3-value binary search.
                check sy-subrc eq 0.
                assign component ls1_items_check-fieldname of structure <f_tfia> to <valuechange>.
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.
                read table  lt_tfiac assigning field-symbol(<f_tfiac>)  with key art_key = ls1_items_check-artkey
                                                                         line = ls_linenum3-value binary search.
                if sy-subrc ne 0.
                  append <f_tfia> to lt_tfiac.
                else.
                  move-corresponding <f_tfia> to <f_tfiac>.
                endif.
              when '07'.
*              lt_tslist[] = <t_table>[].
                read table lt_tslist assigning field-symbol(<f_tslist>) with key art_key = ls1_items_check-artkey
                                                                              line    = ls_linenum3-value binary search.
                check sy-subrc eq 0.
                assign component ls1_items_check-fieldname of structure <f_tslist> to <valuechange>.
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.
                read table  lt_tslistc assigning field-symbol(<f_tslistc>)  with key art_key = ls1_items_check-artkey
                                                                        line = ls_linenum3-value binary search.
                if sy-subrc ne 0.
                  append <f_tslist> to lt_tslistc.
                else.
                  move-corresponding <f_tslist> to <f_tslistc>.
                endif.
              when '08'.
*              lt_tsales[] = <t_table>[].
                read table lt_tsales assigning field-symbol(<f_tsales>)  with key art_key = ls1_items_check-artkey
                                                                               line = ls_linenum3-value binary search.
                check sy-subrc eq 0.
                assign component ls1_items_check-fieldname of structure <f_tsales> to <valuechange>.
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.
                read table  lt_tsalesc assigning field-symbol(<f_tsalesc>)  with key art_key = ls1_items_check-artkey
                                                                       line = ls_linenum3-value binary search.
                if sy-subrc ne 0.
                  append <f_tsales> to lt_tsalesc.
                else.
                  move-corresponding <f_tsales> to <f_tsalesc>.
                endif.
              when '09'.
*              lt_tlogdc[] = <t_table>[].
                read table lt_tlogdc assigning field-symbol(<f_tlogdc>)  with key art_key = ls1_items_check-artkey
                                                                               line = ls_linenum3-value binary search.
                check sy-subrc eq 0.
                assign component ls1_items_check-fieldname of structure <f_tlogdc> to <valuechange>.
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.
                read table lt_tlogdcc assigning field-symbol(<f_tlogdcc>)  with key art_key = ls1_items_check-artkey
                                                                      line = ls_linenum3-value binary search.
                if sy-subrc ne 0.
                  append <f_tlogdc> to lt_tlogdcc.
                else.
                  move-corresponding <f_tlogdc> to <f_tlogdcc>.
                endif.
              when '10'.
*              lt_tlogst[] = <t_table>[].
                read table lt_tlogst assigning field-symbol(<f_tlogst>)  with key art_key = ls1_items_check-artkey
                                                                               line = ls_linenum3-value binary search.
                check sy-subrc eq 0.
                assign component ls1_items_check-fieldname of structure <f_tlogst> to <valuechange>.
                if <valuechange> is assigned .
                  <valuechange> = ls1_items_check-value.
                endif.
                read table  lt_tlogstc assigning field-symbol(<f_tlogstc>)  with key art_key = ls1_items_check-artkey
                                                                      line = ls_linenum3-value binary search.
                if sy-subrc ne 0.
                  append <f_tlogst> to lt_tlogstc.
                else.
                  move-corresponding <f_tlogst> to <f_tlogstc>.
                endif.
              when others.
            endcase.
            unassign <valuechange>.
            sort : lt_tunitc by  art_key line,
                lt_tcaractc by  art_key line,
                lt_tbomc by  art_key line,
                lt_tfiac by  art_key line,
                lt_tlistc by  art_key line,
                lt_tslistc by art_key line,
                lt_tsalesc by art_key line,
                lt_tlogdcc by art_key line,
                lt_tlogstc by art_key line.

          endloop.
          call method gcl_cockpit->/dlwupex/if_cockpit_article~save_worklist
            exporting
              iv_reqid  = ls_data_check-reqid
              it_gdata  = lt_gdatac
              it_unit   = lt_tunitc
              it_caract = lt_tcaractc
              it_bom    = lt_tbomc
              it_fia    = lt_tfiac
              it_list   = lt_tlistc
              it_srlist = lt_tslistc
              it_sale   = lt_tsalesc
              it_logdc  = lt_tlogdcc
              it_logsto = lt_tlogstc
            changing
              ct_msg    = lt_msg
              cv_rc     = lv_rc.
          if lt_msg[] is initial.
            clear lt1_items_check[].
          endif.
          ls_data_check-checkitemset = lt1_items_check.
          copy_data_to_ref(
                   exporting
                       is_data =     ls_data_check
                   changing
                       cr_data = er_deep_entity ).



          case  ls1_items_check-viewname.
            when '01' .
              sort  lt_gdatac by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                        ip_reqid    = ls_data_check-reqid
                                        ip_name     = '/dlwupex/tgdata'
                                        pt_data     = lt_gdatac
                                        ip_viewname = '01' ).

            when '02'.
              sort  lt_tunitc by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                        ip_reqid    = ls_data_check-reqid
                                        ip_name     = '/dlwupex/tunit'
                                        pt_data     = lt_tunitc
                                        ip_viewname = '02' ).

            when '03'.
              sort  lt_tcaractc by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                      ip_reqid    = ls_data_check-reqid
                                      ip_name     = '/dlwupex/tcaract'
                                      pt_data     = lt_tcaractc
                                      ip_viewname = '03' ).

            when '04'.
              sort  lt_tbomc by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                      ip_reqid    = ls_data_check-reqid
                                      ip_name     = '/dlwupex/tbom'
                                      pt_data     = lt_tbomc
                                      ip_viewname = '04' ).

            when '05'.
              sort  lt_tlistc by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                      ip_reqid    = ls_data_check-reqid
                                      ip_name     = '/dlwupex/tlist'
                                      pt_data     = lt_tlistc
                                      ip_viewname = '05' ).
            when '06'.
              sort  lt_tfiac by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                      ip_reqid    = ls_data_check-reqid
                                      ip_name     = '/dlwupex/tfia'
                                      pt_data     = lt_tfiac
                                      ip_viewname = '06' ).
            when '07'.
              sort  lt_tslistc by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                      ip_reqid    = ls_data_check-reqid
                                      ip_name     = '/dlwupex/tsrlist'
                                      pt_data     = lt_tslistc
                                      ip_viewname = '07' ).
            when '08'.
              sort  lt_tsalesc by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                      ip_reqid    = ls_data_check-reqid
                                      ip_name     = '/dlwupex/tsale'
                                      pt_data     = lt_tsalesc
                                      ip_viewname = '08' ).
            when '09'.
              sort  lt_tlogdcc by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                      ip_reqid    = ls_data_check-reqid
                                      ip_name     = '/dlwupex/tlogdc'
                                      pt_data     = lt_tlogdcc
                                      ip_viewname = '09' ).
            when '10'.
              sort  lt_tlogstc by art_key.
              me->check_view( exporting ip_id       = ls_data_check-id
                                      ip_reqid    = ls_data_check-reqid
                                      ip_name     = '/dlwupex/tlogsto'
                                      pt_data     = lt_tlogstc
                                      ip_viewname = '10' ).

            when others.
          endcase.

          call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
            exporting
              iv_init  = ''
            changing
              ct_tview = gt_views.
        elseif ls_data_check-isvalid = abap_true.

*Prepare tables input
          lt1_items_check2[] =  lt1_items_check[].

          loop at lt1_items_check2 into ls1_items_check where fieldname eq 'ARTKEY' or fieldname eq 'LINE'.

            if lv_tabname is initial.
              call method me->get_table_name
                exporting
                  ip_viewname = lv_viewname
                importing
                  ev_tabname  = lv_tabname.


              create data lt_table type standard table of (lv_tabname).
              assign lt_table->* to <t_table>.
              assign lt_table->* to <t_tablep>.
            endif.

            at new rownum.
              if <ls_workara> is assigned.
                assign component 'LINE' of structure <ls_workara> to field-symbol(<line>).
                if <line> is assigned.
                  lv_line = <line>.
                endif.
                move-corresponding ls_data_check to <ls_workara>.
                if <line> is assigned.
                  <line> =  lv_line .
                endif.
                insert <ls_workara> into table <t_table>.
              endif.
              create data w_dy_line like line of <t_table>.
              assign w_dy_line->* to  <ls_workara>.
            endat.
            assign component ls1_items_check-fieldname of structure <ls_workara> to field-symbol(<value>).
            if <value> is assigned.
              <value> = ls1_items_check-value.
            endif.


            unassign <value>.
            assign component 'ART_KEY' of structure <ls_workara> to <value>.
            if <value> is assigned.
              <value> = ls1_items_check-artkey.
            endif.

          endloop.
          if <ls_workara> is assigned.
            assign component 'LINE' of structure <ls_workara> to <line>.
            if <line> is assigned.
              lv_line = <line>.
            endif.
            move-corresponding ls_data_check to <ls_workara>.
            if <line> is assigned.
              <line> =  lv_line .
            endif.
            insert <ls_workara> into table <t_table>.
          endif.




          if lt1_items_check[] is not initial.
            call method me->get_check_msg
              exporting
                ip_id       = ls_data_check-id
                ip_reqid    = ls_data_check-reqid
                ip_viewname = lv_viewname
                pt_data     = <t_table>
                ip_valid    = abap_true
              importing
                p_rc        = lv_rc8
              changing
                ct_views    = lt1_items_check.
          endif.
          ls_data_check-subrc = lv_rc8.
          ls_data_check-checkitemset = lt1_items_check.
          copy_data_to_ref(
                   exporting
                       is_data =     ls_data_check
                   changing
                       cr_data = er_deep_entity ).


        elseif ls_data_check-iserror = abap_true.
          " gcl_cockpit = new /dlwupex/cl_cockpit_article( iv_bu = ls_data_check-id  ).
          gcl_cockpit = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = ls_data_check-id  ).
          check gcl_cockpit is bound.

          call method gcl_cockpit->/dlwupex/if_cockpit_article~get_errors
            exporting
              iv_reqid = ls_data_check-reqid
            changing
              cv_rc    = lv_rc
              ct_msg   = lt_msg.
          delete from  /dlwupex/tmsg  where id = ls_data_check-id and reqid = 'XLSERROR'.
          loop at lt_msg into data(ls_msg).
            append initial line to lt1_items_check assigning field-symbol(<f_items_error>).
            move-corresponding ls_msg to <f_items_error>.
            <f_items_error>-artkey = ls_msg-matnr.
            <f_items_error>-errormsg = ls_msg-message.
*             <f_items_error>-ARTKEY = ls_msg-MATNR.
          endloop.
          ls_data_check-checkitemset = lt1_items_check.
          copy_data_to_ref(
                   exporting
                       is_data =     ls_data_check
                   changing
                       cr_data = er_deep_entity ).

        elseif ls_data_check-isdeletelines = abap_true.
*Call method delete

*          gcl_cockpit = new /dlwupex/cl_cockpit_article( iv_bu = ls_data_check-id  ).
          gcl_cockpit = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = ls_data_check-id ).
          check gcl_cockpit is bound.
          loop at lt1_items_check into ls1_items_check where fieldname = 'LINE'.
            lv_id       = ls1_items_check-reqid.
            lv_viewname = ls1_items_check-viewname.
            lv_lineid   = ls1_items_check-value.
            lv_artkey   = ls1_items_check-artkey.

            call method gcl_cockpit->/dlwupex/if_cockpit_article~delete_line
              exporting
                iv_reqid    = lv_id
                iv_viewname = lv_viewname
                iv_matnr    = lv_artkey
                iv_lineid   = lv_lineid
              changing
                ct_msg      = lt_msg
                cv_rc       = lv_rc.
            if lv_rc = 8.
              lv_rc8 = lv_rc.
              try .
                  ls_data_check-message = lt_msg[ 1 ]-message.
                catch cx_sy_itab_line_not_found.
              endtry.
            elseif lv_rc = 0 .
              data(lv_isdelete) = abap_true.
            endif.
          endloop.
          if lv_isdelete = abap_true and lv_rc8 eq 8.
            lv_rc8 = 9.
          endif.
          lv_rc = lv_rc8.
          ls_data_check-subrc = lv_rc.
          if lt_msg[] is not initial and lv_rc ne 8 and lv_rc ne 9.
            ls_data_check-message = lt_msg[ 1 ]-message.
          endif.
          clear lt1_items_check[].

          ls_data_check-checkitemset = lt1_items_check.
          copy_data_to_ref(
                   exporting
                       is_data =     ls_data_check
                   changing
                       cr_data = er_deep_entity ).

        elseif ls_data_check-isnewlines = abap_true.
          " gcl_cockpit = new /dlwupex/cl_cockpit_article( iv_bu = ls_data_check-id  ).
          gcl_cockpit = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = ls_data_check-id ).
          check gcl_cockpit is bound.
          loop at lt1_items_check into ls_items_check.
            append initial line to lr_matnr assigning <f_matnr>.
            <f_matnr>-sign = 'I'.
            <f_matnr>-option = 'EQ'.
            <f_matnr>-low = ls_items_check-artkey.
          endloop.
          lv_viewname = ls_items_check-viewname.

          if 	ls_data_check-artkey is initial.
            call method gcl_cockpit->/dlwupex/if_cockpit_article~insert_line
              exporting
                iv_reqid    = ls_data_check-reqid
*               iv_matnr    =
                iv_viewname = lv_viewname
                iv_nbcopy   = 1
                ir_matnr    = lr_matnr
                iv_lineid   = 1
              changing
                ct_msg      = lt_msg
                cv_rc       = lv_rc.
          else.
            lv_line = ls_data_check-line.
            lv_copynb = ls_data_check-nbcopy.
            lv_artkey = ls_data_check-artkey.
            call method gcl_cockpit->/dlwupex/if_cockpit_article~copy_line
              exporting
                iv_reqid    = ls_data_check-reqid
                iv_matnr    = lv_artkey
                iv_viewname = lv_viewname
                iv_nbcopy   = lv_copynb
                ir_matnr    = lr_matnr
                iv_lineid   = lv_line
              changing
                ct_msg      = lt_msg
                cv_rc       = lv_rc.

          endif.
*     IF lt_msg[] IS INITIAL.
          clear lt1_items_check[].
*     ENDIF.
          ls_data_check-subrc = lv_rc.
          if lt_msg[] is not initial.
            ls_data_check-message = lt_msg[ 1 ]-message.
          endif.
          ls_data_check-checkitemset = lt1_items_check.
          copy_data_to_ref(
                   exporting
                       is_data =     ls_data_check
                   changing
                       cr_data = er_deep_entity ).
        else .

*Call check method
          call method me->get_check_msg
            exporting
              ip_id       = ls_data_check-id
              ip_reqid    = ls_data_check-reqid
              ip_viewname = lv_viewname
              ip_valid    = abap_false
            importing
              p_rc        = lv_rc8
            changing
              ct_views    = lt1_items_check.

          ls_data_check-subrc = lv_rc8.
          ls_data_check-checkitemset = lt1_items_check.
          copy_data_to_ref(
                   exporting
                       is_data =     ls_data_check
                   changing
                       cr_data = er_deep_entity ).


        endif.
      when 'CreationHeader'.
        call method io_data_provider->read_entry_data( importing es_data = ls_data_cretion ).
        lt1_items_creation  = ls_data_cretion-creationitemsset.




        loop at lt1_items_creation into data(ls_items_creation).
          lv_bu =  ls_items_creation-id.
          "  gcl_cockpit = new /dlwupex/cl_cockpit_article( iv_bu = lv_bu  ).
          gcl_cockpit = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = lv_bu  ).
          check gcl_cockpit is bound.
          lv_id =  ls_items_creation-reqid.
          if ls_data_cretion-isdelete = abap_false.
            call method gcl_cockpit->/dlwupex/if_cockpit_article~execute_step
              exporting
                iv_reqid = lv_id
              changing
                ct_msg   = lt_msg
                cv_rc    = lv_rc.
          else."Call method deletion
            call method gcl_cockpit->/dlwupex/if_cockpit_article~delete_worklist
              exporting
                iv_reqid = lv_id
              changing
                ct_msg   = lt_msg
                cv_rc    = lv_rc.
          endif.
        endloop.

        ls_data_cretion-subrc = lv_rc.
        ls_data_cretion-creationitemsset = lt1_items_creation.
        copy_data_to_ref(
              exporting
                  is_data =  ls_data_cretion
              changing
                  cr_data = er_deep_entity ).
      when others.
    endcase.


*}   INSERT
  endmethod.


  method /iwbep/if_mgw_appl_srv_runtime~create_stream.
**try.
*CALL METHOD SUPER->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_STREAM
*  EXPORTING
**    iv_entity_name          =
**    iv_entity_set_name      =
**    iv_source_name          =
*    IS_MEDIA_RESOURCE       =
**    it_key_tab              =
**    it_navigation_path      =
*    IV_SLUG                 =
**    io_tech_request_context =
**  importing
**    er_entity               =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
    data: lt_file_data_table type crtg_file_data_table,
          lv_template_found  type /dlwupex/fi_template,
          lv_match_perc(3)   type n,
          lv_language        type spras,
          ls_out             type /dlwupex/cl_fi_load_po_mpc=>ts_datafile,
          lv_id              type /dlwupex/ereqid,
          lv_rc              type sysubrc,
          ls_errmessage      type string.

    try.
        lv_match_perc = 90.
        me->conversion_xmlstr_2_itab(
           exporting iv_xstring  = is_media_resource-value
           importing et_xml_itab = lt_file_data_table
                     ep_id       =   lv_id
                     ep_subrc    =   lv_rc
                     ep_errmsg   =   ls_errmessage ).
        if lv_id is not initial.
          ls_out-template = lv_id.
        elseif ls_errmessage is not initial.
        "  ls_out-mimetype = ls_errmessage.
          ls_out-action = 'E'.
        endif.
        me->copy_data_to_ref( exporting is_data = ls_out changing cr_data = er_entity ).
      catch cx_uuid_error ##NO_HANDLER.

      catch cx_mdif_unsupported_format into data(lr_exception).
        raise exception type cx_mdif_unsupported_format
          exporting
            textid  = /iwbep/cx_mgw_busi_exception=>business_error
            message = lr_exception->message.
      catch cx_idgt_exception ##NO_HANDLER.
    endtry.



  endmethod.


  method /iwbep/if_mgw_appl_srv_runtime~execute_action.
**try.
*CALL METHOD SUPER->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~EXECUTE_ACTION
**  exporting
**    iv_action_name          =
**    it_parameter            =
**    io_tech_request_context =
**  importing
**    er_data                 =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
    data: ls_parameter type /iwbep/s_mgw_name_value_pair,
          ls_entity    type /dlwupex/cl_odmigratio_mpc=>ts_returnmsg,
          lv_matnr     type /dlwupex/ematkey,
          lv_nbcopy    type int4,
          lv_reqid     type /dlwupex/ereqid,
          lv_buid      type /dlwupex/ebusunitid,
          lv_line      type /dlwupex/elineid,
          lt_msg       type /dlwupex/tmsg_tt,
          lv_rc        type sysubrc,
          lv_veiwname  type /dlwupex/eviewname.

    read table it_parameter into ls_parameter with key name = 'ArtKey'.
    if sy-subrc = 0.
      lv_matnr  = ls_parameter-value.
    endif.
    read table it_parameter into ls_parameter with key name = 'NbCopy'.
    if sy-subrc = 0.
      lv_nbcopy  = ls_parameter-value.
    endif.
    read table it_parameter into ls_parameter with key name = 'ReqId'.
    if sy-subrc = 0.
      lv_reqid  = ls_parameter-value.
    endif.
    read table it_parameter into ls_parameter with key name = 'BuId'.
    if sy-subrc = 0.
      lv_buid   = ls_parameter-value.
    endif.
    " data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu = lv_buid   ).
    data(gcl_cockpit) = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = lv_buid    ).
    check gcl_cockpit is bound.
    case iv_action_name.
      when 'CopyMaterial'.

        call method gcl_cockpit->/dlwupex/if_cockpit_article~copy_material
          exporting
            iv_reqid  = lv_reqid
            iv_matnr  = lv_matnr
            iv_nbcopy = lv_nbcopy
          changing
            ct_msg    = lt_msg
            cv_rc     = lv_rc.
        ls_entity-okcode = lv_rc.
        if lt_msg[] is not initial.
          ls_entity-message = lt_msg[ 1 ]-message.
        endif.

        copy_data_to_ref( exporting is_data = ls_entity changing cr_data = er_data ).
      when 'InsertLine'.
        read table it_parameter into ls_parameter with key name = 'Line'.
        if sy-subrc = 0.
          lv_line  = ls_parameter-value.
        endif.
        read table it_parameter into ls_parameter with key name = 'VeiwName'.
        if sy-subrc = 0.
          lv_veiwname  = ls_parameter-value.
        endif.
        if lv_matnr is initial.
          data lv_tabname type tabname.
          case  lv_veiwname.
            when '02'. "Données Unités et EAN
              lv_tabname = '/dlwupex/tunit'.
            when '03'. "Caractéristiques
              lv_tabname = '/dlwupex/tcaract'.
            when '04'. "BOM
              lv_tabname = '/dlwupex/tbom'.
            when '06'. "FIA
              lv_tabname = '/dlwupex/tfia'.
            when '05'. "Source lists
              lv_tabname = '/dlwupex/tlist'.
            when '07'. "Référencement listing
              lv_tabname = '/dlwupex/tsrlist'.
            when '08'. "Données Ventes
              lv_tabname = '/dlwupex/tsale'.
            when '09'. "Log Site ref DC
              lv_tabname = '/dlwupex/tlogdc'.
            when '10'. "Log Site ref Store
              lv_tabname = '/dlwupex/tlogsto'.
            when others.
          endcase.
          field-symbols: <lt_itab> type table,
                         <l_line>  type any,
                         <l_value> type any.
          data lt_itab    type ref to data.
          create data lt_itab type standard table of (lv_tabname).
          assign lt_itab->* to <lt_itab>.

          data lv_lineid type /dlwupex/elineid.

          select art_key from /dlwupex/tgdata into lv_matnr where id = lv_buid and reqid = lv_reqid.
            clear lv_lineid.
            do lv_nbcopy  times.
              append initial line to <lt_itab> assigning <l_line>.
              assign component 'ID' of structure <l_line> to <l_value> .
              <l_value> = lv_buid.
              assign component 'REQID' of structure <l_line> to <l_value> .
              <l_value> = lv_reqid.
              assign component 'ART_KEY' of structure <l_line> to <l_value> .
              <l_value> =  lv_matnr.
              assign component 'LINE' of structure <l_line> to <l_value> .
              lv_lineid = lv_lineid  + 1.
              <l_value> =  lv_lineid .
              assign component 'STATUS' of structure <l_line> to <l_value> .
              <l_value> = '01'.
            enddo.
          endselect.

          modify (lv_tabname) from  table <lt_itab> .

        else.
          call method gcl_cockpit->/dlwupex/if_cockpit_article~insert_line
            exporting
              iv_reqid    = lv_reqid
              iv_matnr    = lv_matnr
              iv_viewname = lv_veiwname
              iv_nbcopy   = lv_nbcopy
              iv_lineid   = lv_line
            changing
              ct_msg      = lt_msg
              cv_rc       = lv_rc.
        endif.
        ls_entity-okcode = lv_rc.
        if lt_msg[] is not initial.
          ls_entity-message = lt_msg[ 1 ]-message.
        endif.

        copy_data_to_ref( exporting is_data = ls_entity changing cr_data = er_data ).
      when others.

    endcase.
*}   INSERT
  endmethod.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_stream.
**try.
*CALL METHOD SUPER->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_STREAM
**  exporting
**    iv_entity_name          =
**    iv_entity_set_name      =
**    iv_source_name          =
**    it_key_tab              =
**    it_navigation_path      =
**    io_tech_request_context =
**  importing
**    er_stream               =
**    es_response_context     =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
*Multisheet
    TYPE-POOLS: ixml.

* Structure for final output table
    TYPES:

* Structure for xml line
      BEGIN OF gty_xml_line,
        data(255) TYPE x,
      END OF gty_xml_line.
    DATA: ls_stream          TYPE ty_s_media_resource,
          header             TYPE ihttpnvp,
          ls_lheader         TYPE ihttpnvp,
          lv_filename        TYPE string,
          gt_return          TYPE TABLE OF bapiret2,
          gv_date            TYPE d,
          gref_ixml          TYPE REF TO if_ixml,
          gref_streamfactory TYPE REF TO if_ixml_stream_factory,
          gref_ostream       TYPE REF TO if_ixml_ostream,
          gref_renderer      TYPE REF TO if_ixml_renderer,
          gref_document      TYPE REF TO if_ixml_document,
          gref_element_root  TYPE REF TO if_ixml_element,
          gref_ns_attribute  TYPE REF TO if_ixml_attribute,
          gref_element_pro   TYPE REF TO if_ixml_element,
          gref_worksheet     TYPE REF TO if_ixml_element,
          gref_table         TYPE REF TO if_ixml_element,
          gref_column        TYPE REF TO if_ixml_element,
          gref_row           TYPE REF TO if_ixml_element,
          gref_cell          TYPE REF TO if_ixml_element,
          gref_data          TYPE REF TO if_ixml_element,
          gv_value           TYPE string,
          gref_styles        TYPE REF TO if_ixml_element,
          gref_style         TYPE REF TO if_ixml_element,
          gref_style1        TYPE REF TO if_ixml_element,
          gref_format        TYPE REF TO if_ixml_element,
          gref_border        TYPE REF TO if_ixml_element,
          gt_xml_table       TYPE TABLE OF gty_xml_line,
          gs_xml             TYPE gty_xml_line,
          lv_buid            TYPE /dlwupex/ebusunitid,
          it_taba            TYPE STANDARD TABLE OF dd07v,
          it_tabb            TYPE STANDARD TABLE OF dd07v,
          lv_tab_desc        TYPE dd02t-ddtext,
          lv_tab_name        TYPE dd02t-tabname,
          lv_viewname        TYPE /dlwupex/eviewname,
          lv_tabname1        TYPE tabname16,
          lt_table           TYPE REF TO data,
          w_dy_line          TYPE REF TO data,
          lv_desc            TYPE string,
          lv_tabname         TYPE rmdi_name,
          lv_fldname         TYPE rmdi_fienm,
          ls_tabfield_w      TYPE rmdi_tabfld,
          lt_objbin          TYPE TABLE OF solix,
          ls_objbin          TYPE solix,
          ev_xstring_content TYPE xstring,
          lv_length          TYPE i,
          lt_tfitxls         TYPE TABLE OF /dlwupex/tfitxls,
          lt_matkl           TYPE mgw_matkl_tt,
          lt_article         TYPE wsd_matnr_tty,
          lt_gdata           TYPE TABLE OF /dlwupex/tgdata,
          lt_tunit           TYPE TABLE OF /dlwupex/tunit,
          lt_tcaract         TYPE TABLE OF /dlwupex/tcaract,
          lt_tbom            TYPE TABLE OF /dlwupex/tbom,
          lt_tlist           TYPE TABLE OF /dlwupex/tlist,
          lt_tfia            TYPE TABLE OF /dlwupex/tfia,
          lt_tslist          TYPE TABLE OF /dlwupex/tsrlist,
          lt_tsales          TYPE TABLE OF /dlwupex/tsale,
          lt_tlogdc          TYPE TABLE OF /dlwupex/tlogdc,
          lt_tlogst          TYPE TABLE OF /dlwupex/tlogsto,
          lv_matnr           TYPE matnr,
          lv_rc              TYPE sysubrc,
          lt_msg             TYPE /dlwupex/tmsg_tt,
          lt_dfies_tab       TYPE TABLE OF dfies,
          lv_xfeld           TYPE xfeld,
          lv_no_function     TYPE xfeld,
          lv_table           TYPE rmdi_name,
          lv_field           TYPE rmdi_fienm,
          lv_export_rt       TYPE xfeld,               " + DLW/MBU - Jira 35921 01/2022
          lv_reqid           TYPE /dlwupex/ereqid,     " + DLW/MBU - Jira 35921 01/2022
          lr_matnr           TYPE RANGE OF matnr,      " + DLW/MBU - Jira 35921 01/2022
          lsr_matnr          LIKE LINE OF lr_matnr.    " + DLW/MBU - Jira 35921 01/2022


    FIELD-SYMBOLS : <t_table>    TYPE  ANY TABLE,
                    <ls_workara> TYPE any.

    CASE iv_entity_name.
      WHEN 'Xls' .
*Get Busines unit
        TRY .
            DATA(ls_key) = it_key_tab[ name = 'BuId' ].
          CATCH cx_sy_itab_line_not_found .
        ENDTRY.
        lv_buid = ls_key-value.
        DATA(lv_len) = strlen( lv_buid ).
        WHILE  lv_len < 5.
          lv_buid = |0{  lv_buid }|.
          ADD 1 TO lv_len.
        ENDWHILE.

*Get remplate from custo table
        SELECT tabname,tabfield,dposition,viewname  FROM /dlwupex/tfields
                             INTO TABLE @DATA(lt_template)
                             WHERE id = @lv_buid
                             AND   gabarit EQ 'Y'
                             AND   actif   EQ 'Y'.

*Get criterai
        SELECT * FROM /dlwupex/tfitxls INTO TABLE lt_tfitxls
                                       WHERE uname = sy-uname
                                       AND    ersda = sy-datum.
        CLEAR : lv_export_rt, lv_reqid.  " + DLW/MBU - Jira 35921 01/2022
        LOOP AT lt_tfitxls INTO DATA(ls_tfitxls).
*--<< insert DLW/MBU - Jira 35921 01/2022
          IF ls_tfitxls-value CA '/'.
            lv_export_rt = 'X'.
            SPLIT ls_tfitxls-value AT '/' INTO lv_reqid lv_matnr.
            lsr_matnr-sign = 'I'.
            lsr_matnr-option = 'EQ'.
            lsr_matnr-low = lv_matnr.
            APPEND lsr_matnr TO lr_matnr.
          ENDIF.
*-->> insert DLW/MBU - Jira 35921 01/2022
          IF ls_tfitxls-isgm = abap_true.
            APPEND INITIAL LINE TO lt_matkl ASSIGNING FIELD-SYMBOL(<f_matkl>).
            <f_matkl> = ls_tfitxls-value.
          ELSE.
            APPEND INITIAL LINE TO lt_article ASSIGNING FIELD-SYMBOL(<f_mat>).
            <f_mat> =  ls_tfitxls-value.
          ENDIF.
        ENDLOOP.
        IF sy-subrc EQ 0.

          IF lv_export_rt IS INITIAL.  " + DLW/MBU - Jira 35921 01/2022

            "   data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu = ls_tfitxls-id  ).
            DATA(gcl_cockpit) = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = ls_tfitxls-id    ).
            CHECK gcl_cockpit IS BOUND.

            CALL METHOD gcl_cockpit->/dlwupex/if_cockpit_article~create_worklist
              EXPORTING
                it_matkl      = lt_matkl
                it_article    = lt_article
                iv_flag_excel = 'X'
*                  importing
*               ev_id         =
              CHANGING
                cv_rc         = lv_rc
                ct_msg        = lt_msg
                ct_unit       = lt_tunit
                ct_caract     = lt_tcaract
                ct_bom        = lt_tbom
                ct_fia        = lt_tfia
                ct_list       = lt_tlist
                ct_srlist     = lt_tslist
                ct_sale       = lt_tsales
                ct_logdc      = lt_tlogdc
                ct_logsto     = lt_tlogst
                ct_gdata      = lt_gdata.

*--<< insert + DLW/MBU - Jira 35921 01/2022
          ELSE.

            CALL METHOD /dlwupex/cl_cockpit_article=>get_data
              EXPORTING
                iv_bu     = ls_tfitxls-id
                iv_reqid  = lv_reqid
              CHANGING
                ct_unit   = lt_tunit
                ct_caract = lt_tcaract
                ct_bom    = lt_tbom
                ct_fia    = lt_tfia
                ct_list   = lt_tlist
                ct_srlist = lt_tslist
                ct_sale   = lt_tsales
                ct_logdc  = lt_tlogdc
                ct_logsto = lt_tlogst
                ct_gdata  = lt_gdata
                cv_rc     = lv_rc.

            IF sy-subrc = 0.
              DELETE lt_tunit WHERE art_key NOT IN lr_matnr.
              DELETE lt_tcaract WHERE art_key NOT IN lr_matnr.
              DELETE lt_tbom WHERE art_key NOT IN lr_matnr.
              DELETE lt_tfia WHERE art_key NOT IN lr_matnr.
              DELETE lt_tlist WHERE art_key NOT IN lr_matnr.
              DELETE lt_tslist WHERE art_key NOT IN lr_matnr.
              DELETE lt_tsales WHERE art_key NOT IN lr_matnr.
              DELETE lt_tlogdc WHERE art_key NOT IN lr_matnr.
              DELETE lt_tlogst WHERE art_key NOT IN lr_matnr.
              DELETE lt_gdata WHERE art_key NOT IN lr_matnr.
            ENDIF.

          ENDIF.
*-->> insert + DLW/MBU - Jira 35921 01/2022

        ENDIF.

*Get View names
        CALL FUNCTION 'DD_DOMA_GET'
          EXPORTING
            domain_name   = '/DLWUPEX/DVIEWNAME'
            langu         = sy-langu
            withtext      = 'X'
          TABLES
            dd07v_tab_a   = it_taba
            dd07v_tab_n   = it_tabb
          EXCEPTIONS
            illegal_value = 1
            op_failure    = 2
            OTHERS        = 3.
        IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
        ENDIF.

        lv_filename     = 'Template_Migration_ART.xls'.
        ls_lheader-name = 'Content-Disposition'.
        ls_lheader-value = 'attachment; filename="' && lv_filename && '"'.
        set_header( is_header =  ls_lheader ).
*        ls_stream-mime_type = 'APPLICATION/MSEXCEL'.
        ls_stream-mime_type = 'application/vnd.ms-excel'.
        gv_date = sy-datum - 1.

* Creating a ixml Factory
        gref_ixml = cl_ixml=>create( ).
* Creating the DOM Object Model for Excel file
        gref_document = gref_ixml->create_document( ).

* Create Root Node Excel 'Workbook'
        gref_element_root  = gref_document->create_simple_element( name = 'Workbook'  parent = gref_document ).
        gref_element_root->set_attribute( name = 'xmlns'  value ='urn:schemas-microsoft-com:office:spreadsheet' ).
        gref_ns_attribute = gref_document->create_namespace_decl( name = 'ss' prefix = 'xmlns'  uri = 'urn:schemas-microsoft-com:office:spreadsheet').
        gref_element_root->set_attribute_node( gref_ns_attribute ).
        gref_ns_attribute = gref_document->create_namespace_decl( name = 'x'  prefix = 'xmlns'  uri = 'urn:schemas-microsoft-com:office:excel' ).
        gref_element_root->set_attribute_node( gref_ns_attribute ).

* Create node for document properties.
        gref_element_pro = gref_document->create_simple_element( name = 'TEST_PROGRAM'  parent = gref_element_root ).
        gv_value = sy-uname.

* Excel file author
        gref_document->create_simple_element( name = 'Author'  value = gv_value parent = gref_element_pro  ).

* Excel Styles
        gref_styles = gref_document->create_simple_element( name = 'Styles' parent = gref_element_root  ).

* Style, alignment and font for Header
        gref_style  = gref_document->create_simple_element( name = 'Style' parent = gref_styles  ).
        gref_style->set_attribute_ns( name = 'ID'  prefix = 'ss'  value = 'Header' ).
        gref_format  = gref_document->create_simple_element( name = 'Font'  parent = gref_style  ).
        gref_format->set_attribute_ns( name = 'Bold'  prefix = 'ss'  value = '1' ).
        gref_format  = gref_document->create_simple_element( name = 'NumberFormat' parent = gref_style ).
        gref_format->set_attribute_ns( name = 'Format'  prefix = 'ss'  value = '@' ).
        gref_format  = gref_document->create_simple_element( name = 'Interior' parent = gref_style  ).
        gref_format->set_attribute_ns( name = 'Color'  prefix = 'ss'  value = '#00BFFF' )."'#92D050' ).
        gref_format->set_attribute_ns( name = 'Pattern' prefix = 'ss'  value = 'Solid' ).
        gref_format  = gref_document->create_simple_element( name = 'Alignment' parent = gref_style  ).
        gref_format->set_attribute_ns( name = 'Vertical'  prefix = 'ss'  value = 'Center' ).
        gref_format->set_attribute_ns( name = 'WrapText'  prefix = 'ss'  value = '1' ).



* Border Setting
        gref_border  = gref_document->create_simple_element( name = 'Borders' parent = gref_style ).
        gref_format  = gref_document->create_simple_element( name = 'Border' parent = gref_border  ).
        gref_format->set_attribute_ns( name = 'Position'  prefix = 'ss'  value = 'Bottom' ).
        gref_format->set_attribute_ns( name = 'LineStyle'  prefix = 'ss'  value = 'Continuous' ).
        gref_format->set_attribute_ns( name = 'Weight'  prefix = 'ss'  value = '1' ).
        gref_format  = gref_document->create_simple_element( name = 'Border' parent = gref_border  ).
        gref_format->set_attribute_ns( name = 'Position'  prefix = 'ss'  value = 'Left' ).
        gref_format->set_attribute_ns( name = 'LineStyle'  prefix = 'ss'  value = 'Continuous' ).
        gref_format->set_attribute_ns( name = 'Weight'  prefix = 'ss'  value = '1' ).
        gref_format  = gref_document->create_simple_element( name = 'Border' parent = gref_border  ).
        gref_format->set_attribute_ns( name = 'Position'  prefix = 'ss'  value = 'Top' ).
        gref_format->set_attribute_ns( name = 'LineStyle'  prefix = 'ss'  value = 'Continuous' ).
        gref_format->set_attribute_ns( name = 'Weight'  prefix = 'ss'  value = '1' ).
        gref_format  = gref_document->create_simple_element( name = 'Border' parent = gref_border  ).
        gref_format->set_attribute_ns( name = 'Position'  prefix = 'ss'  value = 'Right' ).
        gref_format->set_attribute_ns( name = 'LineStyle'  prefix = 'ss'  value = 'Continuous' ).
        gref_format->set_attribute_ns( name = 'Weight'  prefix = 'ss'  value = '1' ).

* Style for Data in Excel file
        gref_style1  = gref_document->create_simple_element( name = 'Style' parent = gref_styles  ).
        gref_style1->set_attribute_ns( name = 'ID'  prefix = 'ss'  value = 'Data' ).
        gref_border  = gref_document->create_simple_element( name = 'Borders' parent = gref_style1 ).
        gref_format  = gref_document->create_simple_element( name = 'Border' parent = gref_border  ).
        gref_format->set_attribute_ns( name = 'Position'  prefix = 'ss'  value = 'Bottom' ).
        gref_format->set_attribute_ns( name = 'LineStyle'  prefix = 'ss'  value = 'Continuous' ).
        gref_format->set_attribute_ns( name = 'Weight'  prefix = 'ss'  value = '1' ).
        gref_format  = gref_document->create_simple_element( name = 'Border' parent = gref_border  ).
        gref_format->set_attribute_ns( name = 'Position'  prefix = 'ss'  value = 'Left' ).
        gref_format->set_attribute_ns( name = 'LineStyle'  prefix = 'ss'  value = 'Continuous' ).
        gref_format->set_attribute_ns( name = 'Weight'  prefix = 'ss'  value = '1' ).
        gref_format  = gref_document->create_simple_element( name = 'Border' parent = gref_border  ).
        gref_format->set_attribute_ns( name = 'Position'  prefix = 'ss'  value = 'Top' ).
        gref_format->set_attribute_ns( name = 'LineStyle'  prefix = 'ss'  value = 'Continuous' ).
        gref_format->set_attribute_ns( name = 'Weight'  prefix = 'ss'  value = '1' ).
        gref_format  = gref_document->create_simple_element( name = 'Border' parent = gref_border  ).
        gref_format->set_attribute_ns( name = 'Position'  prefix = 'ss'  value = 'Right' ).
        gref_format->set_attribute_ns( name = 'LineStyle'  prefix = 'ss'  value = 'Continuous' ).
        gref_format->set_attribute_ns( name = 'Weight'  prefix = 'ss'  value = '1' ).
        gref_format  = gref_document->create_simple_element( name = 'NumberFormat' parent = gref_style1 ).
        gref_format->set_attribute_ns( name = 'Format'  prefix = 'ss'  value = '@' ).








        SORT lt_template BY viewname dposition.
        LOOP AT it_taba INTO DATA(ls_taba1) .
          READ TABLE lt_template WITH KEY viewname = ls_taba1-domvalue_l TRANSPORTING NO FIELDS.
          CHECK sy-subrc EQ 0.
          lv_desc = ls_taba1-ddtext.
          TRANSLATE lv_desc USING '/-'.

* Worksheet Name
          gref_worksheet = gref_document->create_simple_element( name = 'Worksheet' parent = gref_element_root ).
          gref_worksheet->set_attribute_ns( name = 'Name'  prefix = 'ss'  value = lv_desc ).
* Table
          gref_table = gref_document->create_simple_element( name = 'Table'  parent = gref_worksheet ).
          gref_table->set_attribute_ns( name = 'FullColumns'  prefix = 'x'  value = '1' ).
          gref_table->set_attribute_ns( name = 'FullRows'    prefix = 'x'  value = '1' ).

          LOOP AT lt_template INTO DATA(ls_template1) WHERE viewname = ls_taba1-domvalue_l.
            gref_column = gref_document->create_simple_element( name = 'Column' parent = gref_table ).
            gref_column->set_attribute_ns( name = 'Width'  prefix = 'ss'  value = '120' ).
          ENDLOOP.
*          gref_row = gref_document->create_simple_element( name = 'Row'  parent = gref_table ).
* Column Headers Row logic
          gref_row = gref_document->create_simple_element( name = 'Row'  parent = gref_table ).
          gref_row->set_attribute_ns( name = 'AutoFitHeight'  prefix = 'ss' value = '1' ).


          LOOP AT lt_template INTO ls_template1 WHERE viewname = ls_taba1-domvalue_l.
            CLEAR lv_desc.
            IF ls_template1-tabfield = 'CCNGN'.
              SELECT SINGLE scrtext_m FROM dd04t INTO  lv_desc
                                      WHERE rollname = '/DLWUPEX/ENOMDOUANE'
                                      AND ddlanguage = sy-langu.
            ELSE.
              CALL FUNCTION 'MG_FIELDNAME_TEXT'
                EXPORTING
                  tabname   = ls_template1-tabname
                  fieldname = ls_template1-tabfield
                IMPORTING
                  scrtext_l = lv_desc.
            ENDIF.


            gref_cell = gref_document->create_simple_element( name = 'Cell'  parent = gref_row ).
            gref_cell->set_attribute_ns( name = 'StyleID'  prefix = 'ss'  value = 'Header' ).
            gref_data = gref_document->create_simple_element( name = 'Data'  value = lv_desc  parent = gref_cell ).
            gref_data->set_attribute_ns( name = 'Type'  prefix = 'ss' value = 'String' ).
          ENDLOOP.








* Blank Row after Headers columns
*            gref_row = gref_document->create_simple_element( name = 'Row'  parent = gref_table ).
**            gref_row = gref_document->create_simple_element( name = 'Row'  parent = gref_table ).
*            gref_row->set_attribute_ns( name = 'AutoFitHeight'  prefix = 'ss' value = '1' ).
*            LOOP AT lt_template INTO ls_template1 WHERE viewname = ls_taba1-DOMVALUE_L.
*              gref_cell = gref_document->create_simple_element( name = 'Cell'  parent = gref_row ).
*              gref_cell->set_attribute_ns( name = 'StyleID'  prefix = 'ss'  value = 'Data' ).
*            ENDLOOP.
*Add data ti rows
          lv_viewname = ls_taba1-domvalue_l.
          CALL METHOD me->get_table_name
            EXPORTING
              ip_viewname = lv_viewname
            IMPORTING
              ev_tabname  = lv_tabname1.
          CREATE DATA lt_table TYPE STANDARD TABLE OF (lv_tabname1).
          ASSIGN lt_table->* TO <t_table>.
          CASE ls_taba1-domvalue_l.
            WHEN 01.
              ASSIGN lt_gdata TO <t_table>.
            WHEN 02.
              ASSIGN lt_tunit TO <t_table>.
            WHEN 03.
              ASSIGN lt_tcaract TO <t_table>.
            WHEN 04.
              ASSIGN lt_tbom TO <t_table>.
            WHEN 05.
              ASSIGN lt_tlist TO <t_table>.
            WHEN 06.
              ASSIGN  lt_tfia TO <t_table>.
            WHEN 07.
              ASSIGN lt_tslist TO <t_table>.
            WHEN 08.
              ASSIGN  lt_tsales TO <t_table>.
            WHEN 09.
              ASSIGN lt_tlogdc TO <t_table>.
            WHEN 010.
              ASSIGN  lt_tlogst TO <t_table>.
            WHEN OTHERS.
          ENDCASE.
          CHECK  <t_table> IS ASSIGNED.


          LOOP AT  <t_table> ASSIGNING FIELD-SYMBOL(<f_dataline>).

            gref_row = gref_document->create_simple_element( name = 'Row'  parent = gref_table ).
            gref_row->set_attribute_ns( name = 'AutoFitHeight'  prefix = 'ss' value = '1' ).
            LOOP AT lt_template INTO ls_template1 WHERE viewname = ls_taba1-domvalue_l.
              IF ls_template1-tabname = '/SAPSLL/MARITC' AND ls_template1-tabfield = 'DATAB'.
                ls_template1-tabfield = 'DATABB'.
              ENDIF.
              IF ls_template1-tabname = 'T023' AND ls_template1-tabfield = 'WWGDA'.
                ls_template1-tabfield = 'REF_ART'.
              ENDIF.
              ASSIGN COMPONENT ls_template1-tabfield OF STRUCTURE <f_dataline> TO FIELD-SYMBOL(<f_data>).
              CHECK sy-subrc EQ 0.
              lv_desc = <f_data>.
              lv_table = ls_template1-tabname.
              lv_field =  ls_template1-tabfield .
              CALL FUNCTION 'KL_TABLE_INFO_GET'
                EXPORTING
                  i_tabname    = lv_table
                  i_fieldname  = lv_field
*                 I_LANGU      =
*                 I_READ_TEXTS =
                IMPORTING
*                 E_TABHEADER  =
                  e_tabfield_w = ls_tabfield_w
*                 E_IT_TABFIELDS       =
                EXCEPTIONS
                  not_found    = 1
                  ddic_error   = 2
                  OTHERS       = 3.

              IF ls_tabfield_w-datatype = 'UNIT' OR
                ls_template1-tabfield = 'ZZ1_ZUO_ENTREE_PLT'
                OR ls_template1-tabfield = 'ZZ1_ZUO_SORTIE_PLT'
                OR ls_template1-tabfield = 'ZZ1_UVECOM_SAL'.
                CALL FUNCTION 'CONVERSION_EXIT_CUNIT_OUTPUT'
                  EXPORTING
                    input          = lv_desc
                    language       = sy-langu
                  IMPORTING
*                   LONG_TEXT      =
                    output         = lv_desc
*                   SHORT_TEXT     =
                  EXCEPTIONS
                    unit_not_found = 1
                    OTHERS         = 2.
                IF sy-subrc <> 0.
* Implement suitable error handling here
                ENDIF.
              ENDIF.
              gref_cell = gref_document->create_simple_element( name = 'Cell'  parent = gref_row ).
              gref_cell->set_attribute_ns( name = 'StyleID'  prefix = 'ss'  value = 'Data' ).
              gref_data = gref_document->create_simple_element( name = 'Data'  value =  lv_desc  parent = gref_cell ).
              gref_data->set_attribute_ns( name = 'Type'  prefix = 'ss' value = 'String' ).
            ENDLOOP.
          ENDLOOP.
          UNASSIGN  <t_table> .
        ENDLOOP.


* Creating a Stream Factory for XML
        gref_streamfactory = gref_ixml->create_stream_factory( ).

* Connect Internal XML Table to Stream Factory for Excel data
        gref_ostream = gref_streamfactory->create_ostream_itable( table = gt_xml_table ).

* Rendering the Document
        gref_renderer = gref_ixml->create_renderer( ostream  = gref_ostream  document = gref_document ).
        gref_renderer->render( ).

* Saving the XML Document
        gref_ostream->get_num_written_raw( ).

*Prepare Xstring
        LOOP AT gt_xml_table INTO gs_xml.
          CLEAR ls_objbin.
          ls_objbin-line = gs_xml-data.
          APPEND ls_objbin TO lt_objbin.
        ENDLOOP.
        lv_length = 1000000000.
        CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
          EXPORTING
            input_length = lv_length
          IMPORTING
            buffer       = ev_xstring_content
          TABLES
            binary_tab   = lt_objbin
          EXCEPTIONS
            failed       = 1
            OTHERS       = 2.



        ls_stream-value = ev_xstring_content.
        copy_data_to_ref( EXPORTING is_data = ls_stream
                          CHANGING  cr_data = er_stream ).
        header-name = 'Cache-Control'.                      "#EC NOTEXT

        set_header( EXPORTING is_header = header ).
      WHEN OTHERS.
    ENDCASE.

*}   INSERT
  ENDMETHOD.


  method autorisationset_get_entity.
**try.
*CALL METHOD SUPER->AUTORISATIONSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  importing
**    er_entity               =
**    es_response_context     =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
    data lv_result type char1.

    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '01'
      importing
        ep_result   = lv_result.
    er_entity-gendata = lv_result.


    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '02'
      importing
        ep_result   = lv_result.
    er_entity-unitean = lv_result.

    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '03'
      importing
        ep_result   = lv_result.
    er_entity-caract = lv_result.

    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '04'
      importing
        ep_result   = lv_result.
    er_entity-bom = lv_result.


    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '05'
      importing
        ep_result   = lv_result.
    er_entity-listing = lv_result.

    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '06'
      importing
        ep_result   = lv_result.
    er_entity-fia = lv_result.

    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '07'
      importing
        ep_result   = lv_result.
    er_entity-slist = lv_result.

    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '08'
      importing
        ep_result   = lv_result.
    er_entity-sales = lv_result.

    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '09'
      importing
        ep_result   = lv_result.
    er_entity-logdc = lv_result.

    clear  lv_result.
    call method me->read_autiorisation
      exporting
        ip_viewname = '10'
      importing
        ep_result   = lv_result.
    er_entity-logstore = lv_result.


*Check autorosation all valid

*Provisoire
    er_entity-bu = 'X'.

  authority-check object 'Z/DLWUPEX/'
     id 'ZSUPP_ALL' FIELD 'Y'.
     check sy-subrc eq 0.

    er_entity-sel = 'X'.



*}   INSERT
  endmethod.


  method businesunitset_get_entityset.
**try.
*CALL METHOD SUPER->BUSINESUNITSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901097                                        1
*
    data lv_exc_msg type /iwbep/mgw_bop_rfc_excep_text.
    field-symbols : <t_bus_unit> type any table.
    data lt_bus_unit type ref to data.
    data lv_modif type boolean.

*-------------------------------------------------------------
*  Get data
*-------------------------------------------------------------
    if go_migration_manager is not bound.
      go_migration_manager = lcl_migration_manager=>get_instance( ).
    endif.

    try .
        lv_modif = it_filter_select_options[ property = 'Id' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    call method go_migration_manager->get_busines_unit(
      exporting
        iv_uname = sy-uname
        iv_modif = lv_modif
      importing
        et_itab  = lt_bus_unit ).
    assign lt_bus_unit->* to <t_bus_unit>.


    if sy-subrc = 0.
      et_entityset = corresponding #( <t_bus_unit> ).
      sort  et_entityset by id.
      delete adjacent duplicates from  et_entityset comparing id.

      check lv_modif eq abap_true.
      loop at et_entityset assigning field-symbol(<f_itab>).
        assign component 'ID' of structure <f_itab> to   field-symbol(<value1>).
        authority-check object 'Z/DLWMAM/'
         id 'ZBUID' field <value1>.
        if sy-subrc <> 0.
         delete et_entityset.
        endif.
      endloop.


    else.

*-------------------------------------------------------------
*  Map the RFC response to the caller interface - Only mapped attributes
*-------------------------------------------------------------
*-------------------------------------------------------------
* Error and exception handling
*-------------------------------------------------------------

* Execute the RFC exception handling process
      me->/iwbep/if_sb_dpc_comm_services~rfc_exception_handling(
        exporting
          iv_subrc            = sy-subrc
          iv_exp_message_text = lv_exc_msg ).
    endif.
*}   INSERT
  endmethod.


  method check_view.
*    statics : lt_tview           type /dlwupex/tview_tt.
    data:  lc_tdes            type ref to cl_abap_typedescr .
    data:  ref_struct         type ref to cl_abap_structdescr.
    data : lt_ddic_info       type ddfields.
    field-symbols <f_data>    type any table.

    ref_struct   ?= cl_abap_typedescr=>describe_by_name( ip_name ).
    lt_ddic_info = ref_struct->get_ddic_field_list( ).
    CLEAR gt_views[].

    loop at pt_data assigning field-symbol(<f_line>).
      data(lv_row) = sy-tabix - 1.
      loop at lt_ddic_info into data(ls_ddic_info).
        check sy-tabix > 3.
        append initial line to gt_views assigning field-symbol(<f_view>).
        <f_view>-id = ip_id .
        <f_view>-reqid = ip_reqid.
        <f_view>-rownb = lv_row.
        <f_view>-viewname = ip_viewname.
        <f_view>-fieldname = ls_ddic_info-fieldname.

        assign component ls_ddic_info-fieldname of structure <f_line> to field-symbol(<f_value>).
        if sy-subrc eq 0.
          <f_view>-value = <f_value>.
        endif.
        if  <f_view>-fieldname = 'ART_KEY'.  <f_view>-fieldname = 'ARTKEY'.endif.

        assign component 'ART_KEY' of structure <f_line> to <f_value>.
        if sy-subrc eq 0.
          <f_view>-matnr = <f_value>.
        endif.

        assign component 'LINE' of structure <f_line> to <f_value>.
        if sy-subrc eq 0.
          <f_view>-line  = <f_value>.
        endif.
      endloop.
    endloop.
  endmethod.


  method conversion_xmlstr_2_itab.
*{   INSERT         DS1K901478                                        1
*
    types:
      begin of ty_xml_sheet_itab,
        row   type i,
        cell  type string,
        type  type string,
        index type i,
        value type string,
        view  type /dlwupex/eviewname,
      end of ty_xml_sheet_itab .
    types:
      begin of ty_xml_shared_str_itab,
        index type i,
        value type string,
      end of ty_xml_shared_str_itab .
    types: ty_i_xml_sheet_itab type standard table of ty_xml_sheet_itab initial size 0 .
    types:   ty_i_xml_shared_str_itab type standard table of ty_xml_shared_str_itab initial size 0.


    types:
      begin of ty_xml_itab,
        row    type i,
        column type string,
        cell   type string,
        value  type string,
        index  type i,
        view   type /dlwupex/eviewname,
      end of ty_xml_itab .
    data : lt_xml_itab  type table of ty_xml_itab,
           lt_xml_itab0 type table of ty_xml_itab,
           ls_xml_itab  type  ty_xml_itab.


    data:
      "xlsx
      lv_xstring             type xstring,
      lo_xlsx                type ref to cl_xlsx_document,
      lo_ixml_factory        type ref to if_ixml,
      ls_xml_itab2           type crtg_ty_xml_itab,
      lt_xml_sheet_itab      type ty_i_xml_sheet_itab,
      ls_xml_sheet           type ty_xml_sheet_itab,
      ls_xml_shared_str      type ty_xml_shared_str_itab,
      lt_xml_shared_str_itab type ty_i_xml_shared_str_itab,
      lv_row_str             type string,
      lv_flag                type string,
      lv_initialrow          type i,
      lv_currentrow          type i,
      lv_view                type /dlwupex/eviewname,
      lv_field               type i,
      lv_tabname             type tabname16,
      lt_table               type ref to data,
      w_dy_line              type ref to data,
      lt_gdata               type table of /dlwupex/tgdata,
      lt_tunit               type table of /dlwupex/tunit,
      lt_tcaract             type table of /dlwupex/tcaract,
      lt_tbom                type table of /dlwupex/tbom,
      lt_tlist               type table of /dlwupex/tlist,
      lt_tfia                type table of /dlwupex/tfia,
      lt_tslist              type table of /dlwupex/tsrlist,
      lt_tsales              type table of /dlwupex/tsale,
      lt_tlogdc              type table of /dlwupex/tlogdc,
      lt_tlogst              type table of /dlwupex/tlogsto,
      lv_id                  type /dlwupex/ereqid,
      lv_rc                  type sysubrc,
      lt_msg                 type /dlwupex/tmsg_tt,
      lv_error               type flag,
      ls_errmessage          type string.
    field-symbols : <t_table>    type  any table,
                    <ls_workara> type any.

    if iv_xstring is not initial .
      lv_xstring = iv_xstring.
    else.
      raise exception type cx_idgt_exception.
    endif.

    check lv_xstring is not initial.
    test-seam t1.
      try.
          lo_xlsx = cl_xlsx_document=>load_document( lv_xstring ).
        catch cx_openxml_format.
          raise exception type cx_idgt_exception.
      endtry.
    end-test-seam.


    if lv_flag is initial.


      lo_ixml_factory = cl_ixml=>create( ).


      call function '/DLWUPEX/XLSUPLOAD'
        exporting
          ip_stream              = lv_xstring
        importing
          et_xml_shared_str_itab = lt_xml_shared_str_itab
          et_xml_sheet_itab      = lt_xml_sheet_itab
          et_gdata               = lt_gdata
          et_unit                = lt_tunit
          et_carac               = lt_tcaract
          et_bom                 = lt_tbom
          et_list                = lt_tlist
          et_fia                 = lt_tfia
          et_slist               = lt_tslist
          et_sale                = lt_tsales
          et_logdc               = lt_tlogdc
          et_logstore            = lt_tlogst
          ep_eroor               = lv_error
          ep_errmessage          = ls_errmessage
        changing
          co_ixml_factory        = lo_ixml_factory.
*                .

      " ep_errmsg = ls_errmessage.
      check lv_error is initial.


*
*
**Get remplate from custo table
      select single id from /dlwupex/tfitxls into @data(lv_buid)
                                          where uname = @sy-uname
                                          and   ersda = @sy-datum.

      " data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu = lv_buid ).
      data(gcl_cockpit) = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  =  lv_buid   ).
      check gcl_cockpit is bound.


      call method gcl_cockpit->/dlwupex/if_cockpit_article~create_worklist
        exporting
          iv_flag_create_excel = 'X'
        importing
          ev_id                = ep_id
        changing
          cv_rc                = ep_subrc
          ct_msg               = lt_msg
          ct_unit              = lt_tunit
          ct_caract            = lt_tcaract
          ct_bom               = lt_tbom
          ct_fia               = lt_tfia
          ct_list              = lt_tlist
          ct_srlist            = lt_tslist
          ct_sale              = lt_tsales
          ct_logdc             = lt_tlogdc
          ct_logsto            = lt_tlogst
          ct_gdata             = lt_gdata.
    endif.

*Save check error
    check ep_id is not initial.
    sort  lt_gdata by art_key.
    me->check_view( exporting ip_id       = lv_buid
                              ip_reqid    = ep_id
                              ip_name     = '/dlwupex/tgdata'
                              pt_data     = lt_gdata
                              ip_viewname = '01' )
                        .
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.
    sort  lt_tunit by art_key.
    me->check_view( exporting ip_id       = lv_buid
                           ip_reqid    = ep_id
                           ip_name     = '/dlwupex/tunit'
                           pt_data     = lt_tunit
                           ip_viewname = '02' )
                     .
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.
    sort  lt_tcaract by art_key.
    me->check_view( exporting ip_id       = lv_buid
                           ip_reqid    = ep_id
                           ip_name     = '/dlwupex/tcaract'
                           pt_data     = lt_tcaract
                           ip_viewname = '03' )
                     .
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.
    sort  lt_tbom by art_key.
    me->check_view( exporting ip_id       = lv_buid
                           ip_reqid    = ep_id
                           ip_name     = '/dlwupex/tbom'
                           pt_data     = lt_tbom
                           ip_viewname = '04' )
                     .
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.
    sort  lt_tlist by art_key.
    me->check_view( exporting ip_id       = lv_buid
                           ip_reqid    = ep_id
                           ip_name     = '/dlwupex/tlist'
                           pt_data     = lt_tlist
                           ip_viewname = '05' )
                     .
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.
    sort lt_tfia by art_key.
    me->check_view( exporting ip_id       = lv_buid
                           ip_reqid    = ep_id
                           ip_name     = '/dlwupex/tfia'
                           pt_data     = lt_tfia
                           ip_viewname = '06' )
                     .
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.
    sort  lt_tslist by art_key.
    me->check_view( exporting ip_id       = lv_buid
                           ip_reqid    = ep_id
                           ip_name     = '/dlwupex/tsrlist'
                           pt_data     = lt_tslist
                           ip_viewname = '07' )
                     .
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.
    sort lt_tsales by art_key.
    me->check_view( exporting ip_id       = lv_buid
                           ip_reqid    = ep_id
                           ip_name     = '/dlwupex/tsale'
                           pt_data     = lt_tsales
                           ip_viewname = '08' )
                     .
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.
    sort lt_tlogdc by art_key.
    me->check_view( exporting ip_id    = lv_buid
                           ip_reqid    = ep_id
                           ip_name     = '/dlwupex/tlogdc'
                           pt_data     = lt_tlogdc
                           ip_viewname = '09' ).
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.
    sort  lt_tlogst by art_key.
    me->check_view( exporting ip_id       = lv_buid
                              ip_reqid    = ep_id
                              ip_name     = '/dlwupex/tlogsto'
                              pt_data     = lt_tlogst
                              ip_viewname = '10' ).
    call method gcl_cockpit->/dlwupex/if_cockpit_article~alim_msg_check
      exporting
        iv_init  = 'X'
      changing
        ct_tview = gt_views.





*}   INSERT
  endmethod.


  method CONVERT_DATE.
*{   INSERT         DS1K901478                                        1
*
    Data lv_date TYPE string.
    "CONCATENATE ip_input(4) ip_input+5(2) ip_input+8(2) INTO lv_date.
    lv_date = ip_input.
    TRANSLATE lv_date USING '- '.
    CONDENSE lv_date NO-GAPS.
    ep_output = lv_date.

*    call function 'CONVERT_DATE_TO_INTERNAL'
*      exporting
*        date_external                  = lv_date
**       ACCEPT_INITIAL_DATE            =
*     IMPORTING
*       DATE_INTERNAL                  = lv_date
*     EXCEPTIONS
*       DATE_EXTERNAL_IS_INVALID       = 1
*       OTHERS                         = 2
*              .
*    if sy-subrc <> 0.
** Implement suitable error handling here
*    endif.
*    if lv_date IS NOT INITIAL.
*      ep_output = lv_date.
*    ENDIF.

*}   INSERT
  endmethod.


  method DATAFILELINESET_GET_ENTITYSET.
**try.
*CALL METHOD SUPER->DATAFILELINESET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
    data lo_filter                type  ref to /iwbep/if_mgw_req_filter.
    data lt_file_data_table       type crtg_file_data_table.
    data lt_filter_select_options type /iwbep/t_mgw_select_option.
    data lv_filter_str            type string.
    data ls_converted_keys        like line of et_entityset.

*-------------------------------------------------------------
*  Map the runtime request to the RFC - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get filter or select option information
*    try .
*
*        lo_filter = io_tech_request_context->get_filter( ).
*        lt_filter_select_options = lo_filter->get_filter_select_options( ).
*        lv_filter_str = lo_filter->get_filter_string( ).
*
** Check if the supplied filter is supported by standard gateway runtime process
*        if  lv_filter_str            is not initial
*        and lt_filter_select_options is initial.
*          " If the string of the Filter System Query Option is not automatically converted into
*          " filter option table (lt_filter_select_options), then the filtering combination is not supported
*          " Log message in the application log
*          me->/iwbep/if_sb_dpc_comm_services~log_message(
*            exporting
*              iv_msg_type   = 'E'
*              iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
*              iv_msg_number = 025 ).
*          " Raise Exception
*          raise exception type /iwbep/cx_mgw_tech_exception
*            exporting
*              textid = /iwbep/cx_mgw_tech_exception=>internal_error.
*        endif.
*
** Get key table information
*        io_tech_request_context->get_converted_source_keys(
*          importing
*            es_key_values  = ls_converted_keys ).
*
*      catch cx_root ##CATCH_ALL.
*        ls_converted_keys-guid      = it_key_tab[ name = 'GUID' ]-value.
*        ls_converted_keys-template  = it_key_tab[ name = 'TEMPLATE' ]-value.
*        ls_converted_keys-language  = it_key_tab[ name = 'LANGUAGE' ]-value.
*    endtry.

*    if go_upload_manager is not bound.
*      go_upload_manager = lcl_upload_manager=>get_instance( ).
*    endif.
*
*    go_upload_manager->get_file_table_data( importing et_data = lt_file_data_table ).

*    loop at lt_file_data_table assigning field-symbol(<newline>).
*      append initial line to et_entityset assigning field-symbol(<out>).
*      if <out> is assigned.
*        <out>-guid      = ls_converted_keys-guid.
*        if <newline>-row = 1.
*          <out>-template  = ls_converted_keys-template.
*        endif.
*        <out>-column    = <newline>-column.
*        <out>-row       = <newline>-row.
*        <out>-cell      = <newline>-cell.
*        <out>-value     = <newline>-value.
*        unassign: <out>.
*      endif.
*    endloop.


**-------------------------------------------------------------
**  Map the RFC response to the caller interface - Only mapped attributes
**-------------------------------------------------------------
**-------------------------------------------------------------
** Error and exception handling
**-------------------------------------------------------------
*
** Execute the RFC exception handling process
*      me->/iwbep/if_sb_dpc_comm_services~rfc_exception_handling(
*        exporting
*          iv_subrc            = sy-subrc
*          iv_exp_message_text = lv_exc_msg ).
*    endif.
*}   INSERT
  endmethod.


  method DATAFILESET_GET_ENTITY.
**try.
*CALL METHOD SUPER->DATAFILESET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  importing
**    er_entity               =
**    es_response_context     =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
*     data: ls_file                 type /dlwupex/fi_file.
*    data: lt_file_data_table      type crtg_file_data_table.
*    data: ls_msg                  type scx_t100key.
*
*    try .
*        ls_file-guid      = it_key_tab[ name = 'Guid' ]-value ##no_text.
*        ls_file-template  = it_key_tab[ name = 'template' ]-value ##no_text.
*        ls_file-language  = it_key_tab[ name = 'Language' ]-value ##no_text.
*      catch cx_sy_itab_line_not_found into data(lr_exc) ##NEEDED.
*        raise exception type /iwbep/cx_mgw_tech_exception
*          exporting
*            textid = /iwbep/cx_mgw_tech_exception=>internal_error.
*    endtry.
*
*    select single guid, template, language, content
*      from /dlwupex/fi_file
*      where guid = @ls_file-guid
*      and template = @ls_file-template
*      and language = @ls_file-language
*      into corresponding fields of @ls_file.
*    if sy-subrc = 0.
*      "We don't need to keep the file in the table any more...
*      delete from /dlwupex/fi_file
*        where guid = @ls_file-guid
*        and template = @ls_file-template
*        and language = @ls_file-language.
*      commit work.
*      "Only return the key fields...
*      er_entity-guid      = ls_file-guid.
*      er_entity-template  = ls_file-template.
*      er_entity-language  = ls_file-language.
*    else.
*      ls_msg-msgid = '/DLWUPEX/FI'.
*      ls_msg-msgno = 000.
*      raise exception type /iwbep/cx_mgw_busi_exception
*        exporting
*          textid           = ls_msg
*          http_status_code = /iwbep/cx_mgw_busi_exception=>gcs_http_status_codes-not_found.
*    endif.

    "Get singleton upload manager
*    if go_upload_manager is not bound.
*      go_upload_manager = lcl_upload_manager=>get_instance( ).
*    endif.

*--------------------------------------------------------------------*
* Important notice!
* Due to the dynamic behaviour of the application, it is required that
* errormessages are linked to the header data, which is called here.
* Unfortunately, we cannot control the sequence of $expand processing.
* So it's possible the ErrorMessageSet get triggered before DataFileLineSet is triggered
* To solve this, we initiate the process here (data transformation, bapi call,...)
*--------------------------------------------------------------------*
*    try.
*        "Convert data chunck to table
**        go_upload_manager->conversion_xmlstr_2_itab(
*         exporting iv_xstring  = ls_file-content
*         importing et_xml_itab = lt_file_data_table ).
*
*      catch cx_idgt_exception ##NO_HANDLER.
*
*    endtry.

    "load data into memory
*    go_upload_manager->load_memory( exporting is_file = ls_file
*                                              it_data = lt_file_data_table ).
    "Call bapi (test data)
*{   INSERT         DS1K900743                                        1
*

*     check not go_upload_manager->check_duplicate_from_memory( p_add_tax = abap_true ) = abap_true.

*}   INSERT
*    go_upload_manager->test_bapi_from_memory( ).

*}   INSERT
  endmethod.


  method DATAFILESET_GET_ENTITYSET.
**try.
*CALL METHOD SUPER->DATAFILESET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
    data :  lo_filter type  ref to /iwbep/if_mgw_req_filter,
            lt_filter_select_options type /iwbep/t_mgw_select_option,
            lv_filter_str type string,
            ls_filter type /iwbep/s_mgw_select_option,
            ls_converted_keys like line of et_entityset,
            ls_filter_range type /iwbep/s_cod_select_option,
            lr_template like range of ls_converted_keys-template,
            ls_template like line of lr_template,
            lv_buid     TYPE /DLWUPEX/EBUSUNITID,
            lt_TFITXLS TYPE TABLE OF /DLWUPEX/TFITXLS.



            lo_filter = io_tech_request_context->get_filter( ).
            lt_filter_select_options = lo_filter->get_filter_select_options( ).
            lv_filter_str = lo_filter->get_filter_string( ).

 loop at lt_filter_select_options into ls_filter.
      loop at ls_filter-select_options into ls_filter_range.
        case ls_filter-property.
          when 'TEMPLATE'.
            lo_filter->convert_select_option(
              exporting
                is_select_option = ls_filter
              importing
                et_select_option = lr_template ).

            read table lr_template into ls_template index 1.
            if sy-subrc = 0.
              lv_buid = ls_template-low.
               append initial line to lt_TFITXLS assigning FIELD-SYMBOL(<f_TFITXLS>).
                <f_TFITXLS>-ID = lv_buid.
                <f_TFITXLS>-UNAME = sy-uname.
                <f_TFITXLS>-ERSDA = sy-datum.
                Delete FROM /DLWUPEX/TFITXLS WHERE UNAME = sy-uname..
                MODIFY  /DLWUPEX/TFITXLS FROM TABLE  lt_TFITXLS.
            endif.
            EXIT.
         when OTHERS.
       ENDCASE.
     ENDLOOP.
     EXIT.
    ENDLOOP.
     APPEND INITIAL LINE TO et_entityset ASSIGNING FIELD-SYMBOL(<f_entityset>).
*}   INSERT
  endmethod.


  method getf4valuesset_get_entityset.
**try.
*CALL METHOD SUPER->GETF4VALUESSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*


    types : begin of ty_s_condtab.
              include type hrcond.
            types : end of ty_s_condtab.
    types: begin of ty_s_clause.
    types:   line(72)  type c.
    types: end of ty_s_clause.
    data: gt_where_clauses type standard table of ty_s_clause with default key,
          gt_condtab       type standard table of ty_s_condtab
                      with default key,
          gs_condtab       type  ty_s_condtab.
    data : lo_filter                type  ref to /iwbep/if_mgw_req_filter,
           lt_filter_select_options type /iwbep/t_mgw_select_option,
           lv_filter_str            type string,
           ls_filter                type /iwbep/s_mgw_select_option,
           ls_converted_keys        like line of et_entityset,
           ls_filter_range          type /iwbep/s_cod_select_option,
           lr_viewname              like range of ls_converted_keys-viewname,
           ls_viewname              like line of lr_viewname,
           lv_viewname              type /dlwupex/eviewname,
           lr_fieldname             like range of ls_converted_keys-fieldname,
           ls_fieldname             like line of lr_fieldname,
           lr_id                    like range of ls_converted_keys-id,
           ls_id                    like line of lr_id,


           lr_reqid                 like range of ls_converted_keys-reqid,
           ls_reqid                 like line of lr_reqid,
           lv_reqid                 type /dlwupex/ereqid,

           lr_artkey                like range of ls_converted_keys-artkey,
           ls_artkey                like line of lr_artkey,
           lv_artkey                type /dlwupex/ematkey,

           lr_atinn                 like range of ls_converted_keys-atinn,
           ls_atinn                 like line of lr_atinn,
           lv_atinn                 type atinn,

           lv_id                    type /dlwupex/ebusunitid,
           lv_fieldname             type tabfldname,
           lr_value                 like range of ls_converted_keys-value,
           ls_value                 like line of lr_value,
           lv_value                 type string,
           lr_valuefilter           type range of string,
           lt_dfies_tab             type table of dfies,
           ls_dfies_line            type  dfies,
           lt_dfies_line            type  table of dfies,
           ls_dd01v_wa              type dd01v,
           lv_tabcontrol            type tabname,
           lv_tabcontroltext        type tabname,
           lv_table                 type ddobjname,
           ls_shlp                  type  shlp_descr,
           ls_f4string              type string,
           lt_record_tab            type  ddshreslts,
           ls_key                   type string,
           lv_field                 type fieldname,
           ls_entityset             type /dlwupex/cl_odmigratio_mpc=>ts_getf4values,
           lt_itab                  type ref to data,
           lt_itabtext              type ref to data,
           ls_condition             type string,
           ls_where                 type edpline,
           lt_where                 type table of edpline,
           lv_tabnam                type tabname16,
           lv_exist                 type xfeld,
           ls_tabfield_w            type rmdi_tabfld.

    field-symbols: <lt_itab>     type table,
                   <lt_itabtext> type table.

    data: ls_xfc type lvc_s_fcat.
    data: lt_xfc type lvc_t_fcat.
    data: dy_table  type ref to data,
          dy_line   type ref to data,
          lt_search type table of ddshretval.
    field-symbols: <dyn_table> type standard table,
                   <dyn_wa>    type any.


    lo_filter = io_tech_request_context->get_filter( ).
    lt_filter_select_options = lo_filter->get_filter_select_options( ).
    lv_filter_str = lo_filter->get_filter_string( ).

* Check if the supplied filter is supported by standard gateway runtime process
    if  lv_filter_str            is not initial
     and lt_filter_select_options is initial.
      " If the string of the Filter System Query Option is not automatically converted into
      " filter option table (lt_filter_select_options), then the filtering combination is not supported
      " Log message in the application log
      me->/iwbep/if_sb_dpc_comm_services~log_message(
        exporting
          iv_msg_type   = 'E'
          iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
          iv_msg_number = 025 ).
      " Raise Exception
      raise exception type /iwbep/cx_mgw_tech_exception
        exporting
          textid = /iwbep/cx_mgw_tech_exception=>internal_error.
    endif.

* Maps filter table lines to function module parameters
    loop at lt_filter_select_options into ls_filter.
      loop at ls_filter-select_options into ls_filter_range.
        case ls_filter-property.
          when 'VIEWNAME'.
            lo_filter->convert_select_option(
              exporting
                is_select_option = ls_filter
              importing
                et_select_option = lr_viewname ).

            read table lr_viewname into ls_viewname index 1.
            if sy-subrc = 0.
              lv_viewname = ls_viewname-low.
            endif.
          when 'FIELDNAME'.
            lo_filter->convert_select_option(
              exporting
                is_select_option = ls_filter
              importing
                et_select_option = lr_fieldname ).

            read table lr_fieldname into ls_fieldname index 1.
            if sy-subrc = 0.
              lv_fieldname = ls_fieldname-low.
            endif.
          when 'ID'.
            lo_filter->convert_select_option(
            exporting
              is_select_option = ls_filter
            importing
              et_select_option = lr_id ).

            read table lr_id into ls_id index 1.
            if sy-subrc = 0.
              lv_id = ls_id-low.
            endif.
          when 'VALUE'.
            lo_filter->convert_select_option(
              exporting
                is_select_option = ls_filter
              importing
                et_select_option = lr_value ).

            read table lr_value into ls_value index 1.
            if sy-subrc = 0.
              lv_value = ls_value-low.
            endif.

          when 'REQID'.
            lo_filter->convert_select_option(
              exporting
                is_select_option = ls_filter
              importing
                et_select_option = lr_reqid ).

            read table lr_reqid into ls_reqid index 1.
            if sy-subrc = 0.
              lv_reqid = ls_reqid-low.
            endif.
          when 'ARTKEY'.
            lo_filter->convert_select_option(
             exporting
               is_select_option = ls_filter
             importing
               et_select_option = lr_artkey ).

            read table lr_artkey into ls_artkey index 1.
            if sy-subrc = 0.
              lv_artkey = ls_artkey-low.
            endif.
          when 'ATINN'.
            lo_filter->convert_select_option(
              exporting
                is_select_option = ls_filter
              importing
                et_select_option = lr_atinn ).

            read table lr_atinn into ls_atinn index 1.
            call function 'CONVERSION_EXIT_ATINN_INPUT'
              exporting
                input  = ls_atinn-low
              importing
                output = lv_atinn.

          when others.
            " Log message in the application log
            me->/iwbep/if_sb_dpc_comm_services~log_message(
              exporting
                iv_msg_type   = 'E'
                iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
                iv_msg_number = 020
                iv_msg_v1     = ls_filter-property ).
            " Raise Exception
            raise exception type /iwbep/cx_mgw_tech_exception
              exporting
                textid = /iwbep/cx_mgw_tech_exception=>internal_error.
        endcase.
      endloop.
    endloop.

    if  lv_fieldname  = '*'.
      " data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu =  lv_id  ).
      data(gcl_cockpit) = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = lv_id    ).
      check gcl_cockpit is bound.

      select  tabname,tabfield,dposition from /dlwupex/tfields into table @data(lt_result)
                                                 where id = @lv_id
                                                 and   viewname = @lv_viewname
                                                 and   actif    = 'Y'.

      loop at lt_result into data(ls_result).
        clear  ls_entityset.
        lv_fieldname = ls_result-tabfield.
        lv_tabnam    = ls_result-tabname .
        clear lv_exist.
        call method gcl_cockpit->/dlwupex/if_cockpit_article~check_f4
          exporting
            iv_tabname  = lv_tabnam
            iv_tabfield = lv_fieldname
          importing
            ev_exist    = lv_exist.
        if lv_exist eq abap_true.
          ls_entityset-exist = abap_true.
        endif.

        if  lv_tabnam  = '/SAPSLL/MARITC' and lv_fieldname = 'DATAB'.
          lv_fieldname = 'DATABB'.
        endif.
        ls_entityset-position = ls_result-dposition.
        ls_entityset-viewname = lv_viewname.
        ls_entityset-fieldname = lv_fieldname.
        append  ls_entityset to et_entityset.
      endloop.
    else.
      concatenate '%' lv_value '%' into lv_value.
      case lv_fieldname.
        when 'ATINN'.
          types : begin of ltyp_atnam,
                    atnam type cabn-atnam,
                    atbez type cabnt-atbez,
                    atfor type cabn-atfor,
                    spras type cabnt-spras,
                  end of   ltyp_atnam .
          data lt_atnam_tab type table of   ltyp_atnam.
          data lr_class_tab type range of klah-class.

          if lv_artkey is not initial.
            select single matkl from /dlwupex/tgdata
                                into @data(lv_matkl)
                                where id = @lv_id
                                and   reqid = @lv_reqid
                                and   art_key = @lv_artkey.
            append initial line to  lr_class_tab assigning field-symbol(<f_class>).
            <f_class>-sign = 'I'.
            <f_class>-option = 'EQ'.
            <f_class>-low = lv_matkl.
          else.
            select  matkl from /dlwupex/tgdata
                              into table @data(lt_matkl)
                              where id = @lv_id
                              and   reqid = @lv_reqid
                              and   art_key = @lv_artkey.
            loop at lt_matkl into data(ls_matkl).
              append initial line to  lr_class_tab assigning <f_class>.
              <f_class>-sign = 'I'.
              <f_class>-option = 'EQ'.
              <f_class>-low = ls_matkl-matkl .
            endloop.

          endif.


          select distinct atnam atbez atfor spras from
        ( ( cabn as c join ksml as k
        on c~atinn = k~imerk )
        join klah as kl
        on k~clint = kl~clint )
        join cabnt
        on c~atinn = cabnt~atinn
        into corresponding fields of table lt_atnam_tab
        where kl~class in lr_class_tab
          and kl~klart eq '026'
          and cabnt~spras = sy-langu.

          loop at lt_atnam_tab into data(ls_atnam_tab).
            ls_entityset-desc = ls_atnam_tab-atbez.
            ls_entityset-key = ls_atnam_tab-atnam.
            append  ls_entityset to et_entityset.
          endloop.
        when 'ATWRT'.
          data lt_cawn_tab type table of cawn.

          select atwrt atzhl from cawn into corresponding fields of table lt_cawn_tab
             where atinn  eq lv_atinn
               and datuv  <= sy-datum
               and techv  = space.

          loop at lt_cawn_tab into data(ls_cawn).
            select single atwtb from cawnt into ls_entityset-desc where atinn  eq lv_atinn
                                                                  and atzhl = ls_cawn-atzhl
                                                                  and spras = sy-langu.
            ls_entityset-key = ls_cawn-atwrt.
            append  ls_entityset to et_entityset.
          endloop.
          if sy-subrc ne 0.


            select single atprt
             from cabn
             into  @data(lv_atprt)
             where atinn = @lv_atinn.
            if sy-subrc eq 0 and lv_atprt is not initial.
              lv_tabcontrol = lv_atprt.
              call function 'GET_KEY_FIELDS_OF_TABLE'
                exporting
                  tabname       = lv_tabcontrol
                tables
                  key_fieldtab  = lt_dfies_line
                exceptions
                  not_supported = 1
                  others        = 2.
              try .
*      data(ls_tab) =  lt_dfies_line[ 1 ]-tabname.
*      lv_field =  lt_dfies_line[ 1 ]-fieldname.
                  ls_dfies_line =  lt_dfies_line[ 1 ].
                catch cx_sy_itab_line_not_found.
              endtry.

              ls_xfc-fieldname = ls_dfies_line-fieldname.
              ls_xfc-datatype = ls_dfies_line-datatype.
              ls_xfc-inttype = ls_dfies_line-inttype.
              ls_xfc-intlen = ls_dfies_line-intlen.
              ls_xfc-decimals = ls_dfies_line-decimals.
              append ls_xfc to lt_xfc.
              call method cl_alv_table_create=>create_dynamic_table
                exporting
                  it_fieldcatalog  = lt_xfc
                  i_length_in_byte = 'X'
                importing
                  ep_table         = dy_table.
              assign dy_table->* to <dyn_table>.
              create data dy_line like line of <dyn_table>.

              if not ls_dfies_line-tabname = 'T006'.
                select * from (ls_dfies_line-tabname)
                   into corresponding fields of table <dyn_table>.
                .
                lv_field = ls_dfies_line-fieldname.
                loop at <dyn_table> assigning field-symbol(<f_line>).
                  assign component  lv_field of structure <f_line> to field-symbol(<f_key>).
                  if <f_key> is assigned.
                    ls_entityset-desc = <f_key>.
                    ls_entityset-key = <f_key>.
                    append  ls_entityset to et_entityset.
                  endif.
                endloop.
              else.
                select * from t006a
                  into table @data(lt_t006a) where spras = @sy-langu .
                .

                loop at lt_t006a into data(ls_t006a).
                  ls_entityset-desc = ls_t006a-msehl.
                  ls_entityset-key = ls_t006a-mseh3.
                  append  ls_entityset to et_entityset.
                endloop.
              endif.
            endif.
          endif.
        when 'LIFNR'." OR 'FLIFN'.
          if lv_value ne '%%'.
            select lifnr,name1 up to 50 rows into table @data(lt_lifnr) from lfa1 where lifnr like @lv_value and sperm = ''  .
          else.
            select lifnr name1 into table lt_lifnr from lfa1 where  sperm = ''  .
          endif.
          loop at lt_lifnr into data(ls_lifnr).
            ls_entityset-desc = ls_lifnr-name1.
            ls_entityset-key = ls_lifnr-lifnr."|{ ls_lifnr-lifnr ALPHA = OUT }|."ls_lifnr-lifnr.
            append  ls_entityset to et_entityset.
          endloop.
        when 'IDNRK' or 'MATNR'.
          if lv_value ne '%%'.
            select matnr up to 50 rows into table @data(lt_idnrk) from mara where matnr like @lv_value and attyp = '00'.
          else.
            select matnr into table lt_idnrk from mara where matnr like lv_value and attyp = '00'.
          endif.
          loop at lt_idnrk into data(ls_idnrk).
            select single maktx from makt into @data(lv_maktx) where matnr = @ls_idnrk-matnr and spras = @sy-langu.
            ls_entityset-desc = lv_maktx.
            ls_entityset-key = ls_idnrk-matnr.
            append  ls_entityset to et_entityset.
            clear lv_maktx.
          endloop.
        when 'CCNGN'.
          select distinct ccngn from /sapsll/clsnr into table @data(lt_ccngn). "#EC CI_NOWHERE
          loop at lt_ccngn into data(ls_ccngn).
            clear ls_entityset.
            ls_entityset-key = ls_ccngn-ccngn.
            select single text from /sapsll/clsnrt into  ls_entityset-desc where ccngn = ls_ccngn-ccngn and langu = sy-langu.
            append  ls_entityset to et_entityset.
          endloop.
        when 'LTSNR'.
          data(lv_lifnr) = lv_atinn.
          if lv_lifnr is not initial.
            select  ltsnr,lifnr from wyt1 into table @data(lt_ltsnr)
                                   where wyt1~lifnr = @lv_lifnr.

          else.
            select distinct ltsnr lifnr from wyt1 into table lt_ltsnr.
          endif.
          sort lt_ltsnr by ltsnr.
          delete adjacent duplicates from lt_ltsnr comparing ltsnr.
          loop at lt_ltsnr into data(ls_ltsnr).
            clear ls_entityset.
            ls_entityset-key = ls_ltsnr-ltsnr.
            select single ltsbz from wyt1t into ls_entityset-desc
                                           where ltsnr = ls_ltsnr-ltsnr
                                           and lifnr = ls_ltsnr-lifnr
                                           and spras = sy-langu.
            append  ls_entityset to et_entityset.
          endloop.
        when others.
          if lv_fieldname =  'ZZ1_ZUO_ENTREE_PLT' or lv_fieldname = 'ZZ1_ZUO_SORTIE_PLT' or lv_fieldname = 'ZZ1_UVECOM_SAL'.
            lv_table = 'MARA'.
            lv_field = 'MEINS'.
          elseif lv_fieldname =  'ZZ1_ZREAPPRO_ST_PLT'.
            lv_table = 'T001W'.
            lv_field = 'WERKS'.
          else.
            select single tabname from /dlwupex/tfields into  @data(lv_tabname)
                                                   where viewname = @lv_viewname
                                                   and   tabfield = @lv_fieldname
                                                   and   actif    = 'Y'.

*   find table control
            lv_table = lv_tabname.
            lv_field = lv_fieldname.
          endif.



          call function 'F4IF_FIELD_VALUE_REQUEST'
            exporting
              tabname             = lv_table
              fieldname           = lv_field
*             SEARCHHELP          = ' '
*             SHLPPARAM           = ' '
*             DYNPPROG            = ' '
*             DYNPNR              = ' '
*             DYNPROFIELD         = ' '
*             STEPL               = 0
*             VALUE               = ' '
*             MULTIPLE_CHOICE     = ' '
*             DISPLAY             = ' '
              suppress_recordlist = 'X'
*             CALLBACK_PROGRAM    = ' '
*             CALLBACK_FORM       = ' '
*             CALLBACK_METHOD     =
*             SELECTION_SCREEN    = ' '
*   IMPORTING
*             USER_RESET          =
            tables
              return_tab          = lt_search
            exceptions
              field_not_found     = 1
              no_help_for_field   = 2
              inconsistent_help   = 3
              no_values_found     = 4
              others              = 5.
          if sy-subrc <> 0.
* Implement suitable error handling here
          endif.


* ENDIF.
          data lv_recordpos type ddshreccnt.
          data lv_reffield type string.
          concatenate  lv_table '-' lv_field into lv_reffield.

          call function 'KL_TABLE_INFO_GET'
            exporting
              i_tabname    = lv_table
              i_fieldname  = lv_field
*             I_LANGU      =
*             I_READ_TEXTS =
            importing
*             E_TABHEADER  =
              e_tabfield_w = ls_tabfield_w
*             E_IT_TABFIELDS       =
            exceptions
              not_found    = 1
              ddic_error   = 2
              others       = 3.

          if ls_tabfield_w-datatype = 'UNIT'.
            data(lv_unit) = abap_true.
          endif.
          loop at lt_search into data(ls_search) .
            if lv_recordpos ne ls_search-recordpos.
              append initial line to et_entityset assigning field-symbol(<f_entity>).
            endif.
            if ls_search-retfield = lv_reffield.
              <f_entity>-key = ls_search-fieldval.
              if lv_unit = abap_true.
                loop at lt_search into data(ls_search2) where recordpos = ls_search-recordpos and fieldname eq 'MSEHL' .
                  <f_entity>-desc = ls_search2-fieldval.
                endloop.
              elseif lv_table = 'MARC' and lv_field = 'RDPRF'.
                loop at lt_search into ls_search2 where recordpos = ls_search-recordpos and fieldname eq 'TEXT40' .
                  <f_entity>-desc = ls_search2-fieldval.
                  if <f_entity>-desc is not initial and ls_search2-retfield is initial.
                    exit.
                  endif.
                endloop.
              else.
                loop at lt_search into ls_search2 where recordpos = ls_search-recordpos and fieldname ne  ls_search-fieldname .
                  <f_entity>-desc = ls_search2-fieldval.
                  if <f_entity>-desc is not initial and ls_search2-retfield is initial.
                    exit.
                  endif.
                endloop.
              endif.
            endif.
            lv_recordpos = ls_search-recordpos.
          endloop.
      endcase.
    endif.
    if lv_value is not initial.
      translate lv_value using '%*'.
      append initial line to  lr_valuefilter assigning field-symbol(<f_filervalue>).
      <f_filervalue>-sign = 'I'.
      <f_filervalue>-option = 'CP'.
      <f_filervalue>-low   = lv_value.
      delete et_entityset where key not in lr_valuefilter.
    endif.
    sort et_entityset by key.


*}   INSERT
  endmethod.


  method get_check_msg.
    types: ty_t_check_items type table of /dlwupex/cl_odmigratio_mpc=>ts_checkitem with default key.

    data : lv_rc            type sysubrc,
           lt_msg           type /dlwupex/tmsg_tt,
           lt1_items_check2 type ty_t_check_items,
           lt_gdata         type table of /dlwupex/tgdata,
           lt_tunit         type table of /dlwupex/tunit,
           lt_tcaract       type table of /dlwupex/tcaract,
           lt_tbom          type table of /dlwupex/tbom,
           lt_tlist         type table of /dlwupex/tlist,
           lt_tfia          type table of /dlwupex/tfia,
           lt_tslist        type table of /dlwupex/tsrlist,
           lt_tsales        type table of /dlwupex/tsale,
           lt_tlogdc        type table of /dlwupex/tlogdc,
           lt_tlogst        type table of /dlwupex/tlogsto.
    " data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu = ip_id  ).
    data(gcl_cockpit) = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  =  ip_id  ).
    check gcl_cockpit is bound.

    if ip_valid = abap_true.
      case  ip_viewname.
        when '01' .
          append lines of  pt_data to lt_gdata.
*                insert <f_table> into table lt_gdata.
        when '02'.
*                insert <f_table> into table lt_tunit.
          append lines of  pt_data to lt_tunit.
        when '03'.
          " insert <f_table> into table lt_tcaract.
          append lines of  pt_data to lt_tcaract.
        when '04'.
          "insert <f_table> into table lt_tbom .
          append lines of  pt_data to  lt_tbom .
        when '05'.
          " insert <f_table> into table lt_tlist.
          append lines of  pt_data to lt_tlist.
        when '06'.
          "insert <f_table> into table lt_tfia.
          append lines of  pt_data to lt_tfia.
        when '07'.
          "insert <f_table> into table lt_tslist .
          append lines of  pt_data to lt_tslist.
        when '08'.
          " insert <f_table> into table lt_tsales.
          append lines of  pt_data to lt_tsales.
        when '09'.
*          insert IP_VIE into table lt_tlogdc.
          append lines of  pt_data to lt_tlogdc.
        when '10'.
          "insert <f_table> into table lt_tlogst.
          append lines of pt_data to lt_tlogst.
        when others.
      endcase.
      call method gcl_cockpit->/dlwupex/if_cockpit_article~validated_worklist
        exporting
          iv_reqid    = ip_reqid
          iv_viewname = ip_viewname
        changing
          ct_gdata    = lt_gdata
          ct_unit     = lt_tunit
          ct_caract   = lt_tcaract
          ct_bom      = lt_tbom
          ct_fia      = lt_tfia
          ct_list     = lt_tlist
          ct_srlist   = lt_tslist
          ct_sale     = lt_tsales
          ct_logdc    = lt_tlogdc
          ct_logsto   = lt_tlogst
          ct_msg      = lt_msg
          cv_rc       = lv_rc.
          p_rc =  lv_rc.
    else.
      call method gcl_cockpit->/dlwupex/if_cockpit_article~get_msg_check
        exporting
          iv_id       = ip_id
          iv_reqid    = ip_reqid
          iv_viewname = ip_viewname
        changing
          cv_rc       = lv_rc
          ct_msg      = lt_msg.
          p_rc =  lv_rc.
    endif.
*    if lt_msg[] is not initial.
*      lt1_items_check2[] =  ct_views[].
*      sort ct_views by artkey fieldname rownum .
*      sort  lt1_items_check2 by artkey fieldname  value.
*      loop at lt_msg assigning field-symbol(<f_msgcheck>) where type = 'E'.
*        data(lv_fieldname)  =  <f_msgcheck>-field.
*        if ip_viewname = '01'.
*          read table  ct_views assigning  field-symbol(<f_return>) with key  artkey     =   <f_msgcheck>-matnr
*                                                                            fieldname  =   lv_fieldname
*                                                                             binary search.
*          if sy-subrc eq 0.
*            <f_return>-errormsg = <f_msgcheck>-message.
*            <f_return>-line = <f_msgcheck>-line.
*          endif.
*        else.
*
*          read table  lt1_items_check2 assigning <f_return> with key artkey     =   <f_msgcheck>-matnr
*                                                                     fieldname  =  'LINE'
*                                                                     value      =   <f_msgcheck>-line binary search.
*          .
*          if sy-subrc eq 0.
*
*            if lv_fieldname = 'ART_KEY'.lv_fieldname = 'ARTKEY'.endif.
*            read table  ct_views assigning <f_return> with key  artkey     =   <f_msgcheck>-matnr
*                                                                fieldname  =   lv_fieldname
*                                                                rownum     =  <f_return>-rownum binary search.
*            if sy-subrc eq 0.
*              <f_return>-errormsg = <f_msgcheck>-message.
*              <f_return>-line = <f_msgcheck>-line.
*            endif.                   .
*          endif.
*        endif.
*      endloop.
*      delete ct_views where errormsg is initial.
*    else.
*      clear ct_views[].
*    endif.

    clear ct_views[].
    loop at lt_msg assigning field-symbol(<f_msgcheck>) where type = 'E'.
      append initial line to ct_views assigning field-symbol(<f_return>).
      <f_return>-id         = ip_id.
      <f_return>-reqid      = ip_reqid.
      <f_return>-viewname   = ip_viewname.
      <f_return>-rownum     = 0.
      <f_return>-artkey     =  <f_msgcheck>-matnr.
      <f_return>-line       = <f_msgcheck>-line.
      <f_return>-fieldname  =  <f_msgcheck>-field.
      <f_return>-value      = <f_msgcheck>-message_v1.
      <f_return>-errormsg   = <f_msgcheck>-message.
    endloop.

  endmethod.


  method get_convexit.
*{   INSERT         DS1K901478                                        1
*
*}   INSERT
*{   INSERT         DS1K901478                                        2
*
    data : lv_function type tdsfname,
           lv_input    type string,
           lv_fm_name  type rs38l_fnam.
    data lr_exc type ref to cx_root.
    data lv_msg_error type string.

*   INITIALIZATION
    clear : lv_function, lv_input, lv_fm_name.

* On appel la fonction en dynamic avec le nom de la routine de conversion trouvé
* en amont

    concatenate gc_convexit is_convexit gc_convexit2
    into lv_function.
    condense lv_function.
    lv_fm_name = lv_function.
    try.
        call function lv_fm_name
          exporting
            input  = is_value
          importing
            output = ev_output
          exceptions
            others = 2.
      catch cx_root into lr_exc.
        lv_msg_error = lr_exc->get_text( ).
        if sy-subrc eq 0
          and is_value ne ev_output
          and ev_output is not initial.
          es_xfeld = abap_true.
        endif.
*      CATCH   cx_sy_dyn_call_illegal_func.
*        cv_no_function = abap_true.

    endtry.
*}   INSERT
  endmethod.


  method GET_TABLE_DESC.
*{   INSERT         DS1K901478                                        1
*

      CALL FUNCTION 'ISU_M_TABL_READ_TEXT'
        EXPORTING
          x_tabname = IV_TABNAME
        IMPORTING
          y_ddtext  = EV_DDTEXT.
*}   INSERT
  endmethod.


  method GET_TABLE_NAME.
*{   INSERT         DS1K901478                                        1
*
    CASE ip_VIEWNAME.
      WHEN '01'.
        ev_tabname = GC_GENRALDATA_TAB.
      WHEN '02'.
        ev_tabname = GC_UNITEAN_TAB.
      WHEN '03'.
        ev_tabname = GC_CARACT_TAB.
      WHEN '04'.
        ev_tabname = GC_BOM_TAB.
      WHEN '05'.
        ev_tabname = GC_LISTING_TAB.
      WHEN '06'.
        ev_tabname = GC_FIAPA_TAB.
      WHEN '07'.
        ev_tabname = GC_SOURCELIST_TAB.
      WHEN '08'.
        ev_tabname = GC_SALEPV_TAB.
      WHEN '09'.
        ev_tabname = GC_LOGISTICDC_TAB.
      WHEN '10'.
        ev_tabname = GC_LOGISTICSTORE_TAB.

      WHEN OTHERS.
    ENDCASE.
*}   INSERT
  endmethod.


  method kpiinfosset_get_entity.
**try.
*CALL METHOD SUPER->KPIINFOSSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  importing
**    er_entity               =
**    es_response_context     =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
    data : lv_lines type i,
           ls_info  type string.



    select /dlwupex/tgdata~reqid,/dlwupex/tgdata~art_key from /dlwupex/tgdata
                         inner join /dlwupex/treqids
                          on /dlwupex/tgdata~reqid = /dlwupex/treqids~reqid
                         into table @data(lt_gdata)
                         where /dlwupex/treqids~status ne '06'.

    describe table lt_gdata lines lv_lines.
    ls_info =  lv_lines.
    concatenate  ls_info text-003 into  ls_info separated by space.

    sort lt_gdata by reqid.
    delete adjacent duplicates from lt_gdata comparing reqid.
    describe table lt_gdata lines lv_lines.
    er_entity-number = lv_lines.

    er_entity-numberstate = 'Positive'.
    er_entity-infostate = 'Positive'.
    er_entity-icon = 'sap-icon://add-document'.
    er_entity-info =  ls_info.
    er_entity-infostate = 'Positive'.

    er_entity-numberdigits = '2'.
    er_entity-numberfactor = ''.
    er_entity-numberunit = ''.
    er_entity-subtitle =  text-002.
    er_entity-targetparams = ''.
    er_entity-title = text-001.
*}   INSERT
  endmethod.


  method marchcategoryset_get_entityset.
**try.
*CALL METHOD SUPER->MARCHCATEGORYSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901097                                        1
*
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
    data lv_exc_msg               type /iwbep/mgw_bop_rfc_excep_text.
    data lo_filter                type  ref to /iwbep/if_mgw_req_filter.
    data ls_converted_keys like line of et_entityset.
    data lt_filter_select_options type /iwbep/t_mgw_select_option.
    data lv_filter_str            type string.
    data lr_filter                like range of ls_converted_keys-filter.

*-------------------------------------------------------------
*  Get data
*-------------------------------------------------------------
* lo_filter = io_tech_request_context->get_filter( ).
* lt_filter_select_options = lo_filter->get_filter_select_options( ).
*  lv_filter_str = lo_filter->get_filter_string( ).
** Check if the supplied filter is supported by standard gateway runtime process
* IF  lv_filter_str            IS NOT INITIAL
* AND lt_filter_select_options IS INITIAL.
*   " If the string of the Filter System Query Option is not automatically converted into
*   " filter option table (lt_filter_select_options), then the filtering combination is not supported
*   " Log message in the application log
*   me->/iwbep/if_sb_dpc_comm_services~log_message(
*     EXPORTING
*       iv_msg_type   = 'E'
*       iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
*       iv_msg_number = 025 ).
*   " Raise Exception
*   RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
*     EXPORTING
*       textid = /iwbep/cx_mgw_tech_exception=>internal_error.
* ENDIF.
*  LOOP AT lt_filter_select_options INTO data(ls_filter).
*     CASE ls_filter-property.
*       WHEN 'FILTER'.
*        lo_filter->convert_select_option(
*           EXPORTING
*             is_select_option = ls_filter
*           IMPORTING
*             et_select_option = lr_filter ).
*         READ TABLE  lr_filter INTO data(ls_value) INDEX 1.
*         IF sy-subrc = 0.
*           data(lv_gm) = ls_value-low.
*         ENDIF.
*        WHEN OTHERS.
*      ENDCASE.
*  ENDLOOP.
*if lv_gm IS NOT INITIAL.
*  CONCATENATE '%' lv_gm '%' INTO lv_gm.
*   select * from T023T
*            into table @data(LT_T023T)
*            WHERE spras = @sy-langu
*            and ( MATKL LIKE @lv_gm or WGBEZ like @lv_gm ).
*else.
    field-symbols : <t_march_cat> type any table.
    data lt_march_cat type ref to data.
    if go_migration_manager is not bound.
      go_migration_manager = lcl_migration_manager=>get_instance( ).
    endif.

    call method go_migration_manager->get_march_cat( importing et_itab = lt_march_cat ).
    assign lt_march_cat->* to <t_march_cat>.


    if sy-subrc = 0.
      et_entityset = corresponding #( <t_march_cat> ).
    else.
*-------------------------------------------------------------
*  Map the RFC response to the caller interface - Only mapped attributes
*-------------------------------------------------------------
*-------------------------------------------------------------
* Error and exception handling
*-------------------------------------------------------------

* Execute the RFC exception handling process
      me->/iwbep/if_sb_dpc_comm_services~rfc_exception_handling(
        exporting
          iv_subrc            = sy-subrc
          iv_exp_message_text = lv_exc_msg ).
    endif.
*}   INSERT
  endmethod.


  method MATERIALSET_GET_ENTITYSET.
**try.
*CALL METHOD SUPER->MATERIALSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901097                                        1
*
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
 data lv_exc_msg               type /iwbep/mgw_bop_rfc_excep_text.
 FIELD-SYMBOLS : <t_materials> TYPE ANY TABLE.
 DATA lt_materials TYPE REF TO data.
*-------------------------------------------------------------
*  Get data
*-------------------------------------------------------------


    if go_migration_manager is not bound.
      go_migration_manager = lcl_migration_manager=>get_instance( ).
    endif.

    call method  go_migration_manager->get_materials_copy( IMPORTING  et_itab = lt_materials ).
    ASSIGN lt_materials->* TO <t_materials>.


    if sy-subrc = 0.
       et_entityset = corresponding #( <t_materials> ).
    else.



*-------------------------------------------------------------
*  Map the RFC response to the caller interface - Only mapped attributes
*-------------------------------------------------------------
*-------------------------------------------------------------
* Error and exception handling
*-------------------------------------------------------------

* Execute the RFC exception handling process
      me->/iwbep/if_sb_dpc_comm_services~rfc_exception_handling(
        exporting
          iv_subrc            = sy-subrc
          iv_exp_message_text = lv_exc_msg ).
     endif.
*}   INSERT
  endmethod.


  method QUAR_CONVERSION.
*{   INSERT         DS1K901478                                        1
*
      types:
      begin of ty_xml_sheet_itab,
        row   type i,
        cell  type string,
        type  type string,
        index type i,
        value type string,
        view  TYPE /DLWUPEX/EVIEWNAME,
      end of ty_xml_sheet_itab .

    types:
      begin of ty_xml_shared_str_itab,
        index type i,
        value type string,
      end of ty_xml_shared_str_itab .

    data:

      lo_workbook        type ref to cl_xlsx_workbookpart,
      lo_collection      type ref to cl_openxml_partcollection,
      lo_worksheet       type ref to cl_xlsx_worksheetpart,
      lo_shared_st       type ref to cl_xlsx_sharedstringspart,
      "ixml
      lo_streamfactory   type ref to if_ixml_stream_factory,
      lo_stream          type ref to if_ixml_istream,
      lo_document        type ref to if_ixml_document,
      lo_parser          type ref to if_ixml_parser,
      lo_node            type ref to if_ixml_node,
      lo_node_r          type ref to if_ixml_node,
      lo_att_child       type ref to if_ixml_node,
      lo_ref_ixml_elem   type ref to if_ixml_element,
      lo_nodes           type ref to if_ixml_node_collection,
      lo_node_iterator   type ref to if_ixml_node_iterator,
      lo_node_iterator_r type ref to if_ixml_node_iterator,
      lo_att             type ref to if_ixml_named_node_map,
      lo_parseerror      type ref to if_ixml_parse_error  ##NEEDED,
      lv_count           type i,
      lv_count_sheet     type i,
      lv_index           type i,
      lv_index_sheet     type i,
      ls_xml_sheet       type ty_xml_sheet_itab,
      lv_cell            TYPE c,
      lt_xml_sheet       type TABLE OF ty_xml_sheet_itab,
      lt_xml_sheetf       type TABLE OF ty_xml_sheet_itab,
      lt_xml_sheetr       type TABLE OF ty_xml_sheet_itab,
      ls_xml_sheet1       type ty_xml_sheet_itab,
      ls_xml_sheet2       type ty_xml_sheet_itab,
      ls_xml_shared_str  type ty_xml_shared_str_itab,
      lv_viewname        TYPE /DLWUPEX/EVIEWNAME,
      lv_firstrow        TYPE i,
      lv_secondrow       TYPE i,
      lv_rowc            TYPE string,
      lv_exist           TYPE boolean.

    try.
        lo_workbook    = lo_xlsx->get_workbookpart( ).
        lo_collection  = lo_workbook->get_worksheetparts( ).
        lv_count_sheet = lo_collection->get_count( ).
        lv_index_sheet = 0.


        while lv_index_sheet < lv_count_sheet.

          CLEAR : lv_firstrow , lv_exist, lv_cell.
          CLEAR : lt_xml_sheet[],lt_xml_sheetf[].
          lo_worksheet ?= lo_collection->get_part( lv_index_sheet ).
          call method LO_WORKSHEET->PARTURI->get_file
            receiving
               re_file = data(lv_file)
           .
          split lv_file at 'sheet' INTO lv_file lv_viewname.
          TRANSLATE lv_viewname USING '. '.
          CONDENSE lv_viewname NO-GAPS.
          IF strlen( lv_viewname ) = 1.
           CONCATENATE '0' lv_viewname INTO lv_viewname .
           CONDENSE lv_viewname NO-GAPS.
          endif.


          if lo_worksheet is bound.
*            lo_ixml_factory  = cl_ixml=>create( ).
            lo_streamfactory = lo_ixml_factory->create_stream_factory( ).
            lo_stream        = lo_streamfactory->create_istream_xstring( lo_worksheet->get_data( ) ).

            lo_document = lo_ixml_factory->create_document( ).
            lo_parser   = lo_ixml_factory->create_parser( stream_factory = lo_streamfactory
                                                          istream        = lo_stream
                                                          document       = lo_document ).
            if lo_parser->parse( ) ne 0.
              if lo_parser->num_errors( ) ne 0
              and io_log is bound.
                lv_count = lo_parser->num_errors( ).
                lv_index = 0.
                while lv_index < lv_count.
                  lo_parseerror = lo_parser->get_error( index = lv_index ).
                  io_log->add_message( ).
                  lv_index = lv_index + 1.
                endwhile.
              endif.
            else.
              lo_ref_ixml_elem = lo_document->get_root_element( ).
              lo_nodes         = lo_ref_ixml_elem->get_elements_by_tag_name( name = 'row' ).
              lo_node_iterator = lo_nodes->create_iterator( ).
              lo_node          = lo_node_iterator->get_next( ).
              while lo_node is not initial.
                lo_att       = lo_node->get_attributes( ).

                lo_att_child = lo_att->get_named_item( 'r' ).
                ls_xml_sheet-row = lo_att_child->get_value( ).

                "node
                lo_node_iterator_r = lo_node->get_children( )->create_iterator( ).
                lo_node_r          = lo_node_iterator_r->get_next( ).
                while lo_node_r is not initial.

                  lo_att            = lo_node_r->get_attributes( ).
                  lo_att_child      = lo_att->get_named_item( 'r' ).
                  ls_xml_sheet-cell = lo_att_child->get_value( ).

                  lo_att_child = lo_att->get_named_item( 't' ).
                  if lo_att_child is bound.
                    ls_xml_sheet-type = lo_att_child->get_value( ).
                  endif.

                  if lo_node_r is bound.
                    if ls_xml_sheet-type is initial.
                      ls_xml_sheet-value = lo_node_r->get_value( ).
                    else.
                      ls_xml_sheet-index = lo_node_r->get_value( ).

                    endif.
                    ls_xml_sheet-view  = lv_viewname.


         if lv_cell IS NOT INITIAL.
           lt_xml_sheetr[] = lt_xml_sheetf[].
           DELETE lt_xml_sheetr WHERE row ne LS_XML_SHEET-row.
           if lt_xml_sheetr[] IS NOT INITIAL.
          loop at lt_xml_sheet into ls_xml_sheet1 .
             CLEAR :  lv_exist.
             data(lv_lent) = strlen( ls_xml_sheet1-CELL ).
              loop at lt_xml_sheetr into ls_xml_sheet2 WHERE row = LS_XML_SHEET-row.
              IF lv_lent = 2.
                IF ls_xml_sheet2-CELL(1) = ls_xml_sheet1-CELL(1).
                  lv_exist = abap_true.
                  EXIT.
                ENDIF.
             ELSEIF lv_lent = 3.
                   IF ls_xml_sheet2-CELL(2) = ls_xml_sheet1-CELL(2).
                   lv_exist = abap_true.
                   EXIT.
                ENDIF.
              ENDIF.
              ENDLOOP.
              IF sy-subrc eq 0 and lv_exist is INITIAL .
              IF lv_lent = 2.
                IF ls_xml_sheet1-CELL(1) eq LS_XML_SHEET-CELL(1).
                  exit.
                endif.
              ELSEIF lv_lent = 3.
                IF ls_xml_sheet1-CELL(2) eq LS_XML_SHEET-CELL(2).
                  exit.
                endif.
              ENDIF.




                CLEAR: ls_xml_sheet2-index, ls_xml_sheet2-value, ls_xml_sheet2-type.
                lv_rowc = ls_xml_sheet2-ROW.
                 IF lv_lent = 2.
                  CONCATENATE ls_xml_sheet1-CELL(1) lv_rowc INTO ls_xml_sheet2-CELL.
                 ELSEIF lv_lent = 3.
                   CONCATENATE ls_xml_sheet1-CELL(2) lv_rowc INTO ls_xml_sheet2-CELL.
                 ENDIF.
                CONDENSE ls_xml_sheet2-CELL NO-GAPS.
                append ls_xml_sheet2 to lt_xml_sheet_itab.
                append ls_xml_sheet2 to lt_xml_sheetf.
              ENDIF.
           ENDLOOP.
           endif.
         endif.
         if lv_firstrow IS INITIAL.
           lv_firstrow = ls_xml_sheet-row.
         endif.
                   lv_cell =  ls_xml_sheet-cell(1).
                   append ls_xml_sheet to lt_xml_sheet_itab.
                   if ls_xml_sheet-row = 2.
                     append ls_xml_sheet to lt_xml_sheet.
                   else.
                     append ls_xml_sheet to lt_xml_sheetf.
                   endif.
                  endif.
                  clear: ls_xml_sheet-cell,
                         ls_xml_sheet-index,
                         ls_xml_sheet-type,
                         ls_xml_sheet-value.

                  lo_node_r = lo_node_iterator_r->get_next( ).
                endwhile.
                lo_node = lo_node_iterator->get_next( ).

              endwhile.
            endif.
             CLEAR : lv_viewname,
                     lv_file.
          endif.
*          if lt_xml_sheet_itab is not initial.                  "stop after get first content
*            exit.
*          endif.
          lv_index_sheet = lv_index_sheet + 1.
        endwhile.
        lo_shared_st  = lo_workbook->get_sharedstringspart( ).

      catch cx_openxml_not_found
            cx_openxml_format.
        raise exception type cx_idgt_exception.
    endtry.


    if lo_shared_st is bound.
      lo_ixml_factory  = cl_ixml=>create( ).
      lo_streamfactory = lo_ixml_factory->create_stream_factory( ).
      lo_stream        = lo_streamfactory->create_istream_xstring( lo_shared_st->get_data( ) ).

      lo_document      = lo_ixml_factory->create_document( ).
      lo_parser        = lo_ixml_factory->create_parser( stream_factory = lo_streamfactory
                                                         istream        = lo_stream
                                                         document       = lo_document ).
      if lo_parser->parse( ) ne 0.
        if  lo_parser->num_errors( ) ne 0
        and io_log is bound.
          lv_count = lo_parser->num_errors( ).
          lv_index = 0.
          while lv_index < lv_count.
            lo_parseerror = lo_parser->get_error( index = lv_index ).
*            lv_line       = lo_parseerror->get_line( ).                    "error line
*            lv_column     = lo_parseerror->get_column( ).                  "error column
*            lv_str        = lo_parseerror->get_reason( ).                  "reson
*              MESSAGE i109
*                 WITH lv_line
*                      lv_column
*                      lv_str
*                 INTO lv_dummy.
            io_log->add_message( ).
            lv_index = lv_index + 1.
          endwhile.
        endif.
      else.
        lo_ref_ixml_elem = lo_document->get_root_element( ).
        lo_nodes         = lo_ref_ixml_elem->get_elements_by_tag_name( name = 'si' ).
        "lo_nodes         = lo_ref_ixml_elem->get_elements_by_tag_name( name = 'row').
        lo_node_iterator = lo_nodes->create_iterator( ).

        lo_node = lo_node_iterator->get_next( ).
********************************************
*** Changed by Thomas                   ****
********************************************
        sy-tabix = 0.
********************************************
        while lo_node is not initial.
          ls_xml_shared_str-index = sy-tabix.
          ls_xml_shared_str-value = lo_node->get_value( ).
          append ls_xml_shared_str to lt_xml_shared_str_itab.
          clear ls_xml_shared_str.
*          lo_node_iterator->RESET( ).
          lo_node = lo_node_iterator->get_next( ).
        endwhile.
      endif.
    endif.
*}   INSERT
  endmethod.


  method read_autiorisation.
*{   INSERT         DS1K901478                                        1
*µ





*}   INSERT
*{   INSERT         DS1K901478                                        2
*

    ep_result = 'F'.
    authority-check object 'Z/DLWUPEX/'
        id 'ACTVT' field '01'
        id 'ZVIEW_ID' field ip_viewname.
    check sy-subrc ne 0.
    ep_result = 'O'.
    authority-check object 'Z/DLWUPEX/'
       id 'ACTVT' field '03'
       id 'ZVIEW_ID' field ip_viewname.
    check sy-subrc ne 0.
    ep_result = 'H'.




*}   INSERT
  endmethod.


  method requestidset_get_entity.
**try.
*CALL METHOD SUPER->REQUESTIDSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  importing
**    er_entity               =
**    es_response_context     =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
    data : ls_key_tab like line of it_key_tab.
    data : lv_rc type sysubrc.
    data : lv_inprogress type xfeld.
    data : lv_id type /dlwupex/ebusunitid.
    data : lv_reqid type /dlwupex/ereqid.


    read table it_key_tab into ls_key_tab with key name = 'BuId'.
    er_entity-id = ls_key_tab-value.

    read table it_key_tab into ls_key_tab with key name = 'ReqId'.
    er_entity-reqid = ls_key_tab-value.

*Check Queue check is finished

    "data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu =  er_entity-id  ).
    data(gcl_cockpit) = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  =  er_entity-id    ).
    check gcl_cockpit is bound.
    lv_id = er_entity-id.
    lv_reqid = er_entity-reqid.
    call method gcl_cockpit->/dlwupex/if_cockpit_article~control_check_inprogress
      exporting
        iv_id         = lv_id
        iv_reqid      = lv_reqid
      importing
        ev_inprogress = lv_inprogress
      changing
        cv_rc         = lv_rc.
    check  lv_inprogress is initial.
    call method gcl_cockpit->/dlwupex/if_cockpit_article~control_create_inprogress
      exporting
        iv_id         = lv_id
        iv_reqid      = lv_reqid
      importing
        ev_inprogress = lv_inprogress
      changing
        cv_rc         = lv_rc.


    check  lv_inprogress is initial.
    select single status statdg statunit statcara
                  statbom statfia statlist statsrlist
                   statsale statdc statstore from /dlwupex/treqids into corresponding fields of er_entity
                    where id =  er_entity-id
                    and   reqid = er_entity-reqid.
*}   INSERT
  endmethod.


  method requestidset_get_entityset.
**try.
*CALL METHOD SUPER->REQUESTIDSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901097                                        1
*
*-------------------------------------------------------------
*  Data declaration
*-------------------------------------------------------------

    data lv_exc_msg type /iwbep/mgw_bop_rfc_excep_text.
    field-symbols : <t_requestlist> type any table.
    data lt_requestlist  type ref to data.
    data: lv_time_stamp type timestamp,
          lv_date       type d,
          lv_time       type t,
          lv_tz         type ttzz-tzone,
          lv_nbremat    type i,
          lv_component  type i.
    data : lv_rc type sysubrc.
    data : lv_inprogress type xfeld.
    data : lv_id type /dlwupex/ebusunitid.
    data : lv_reqid type /dlwupex/ereqid.


*-------------------------------------------------------------
*  Get data
*-------------------------------------------------------------
    if go_migration_manager is not bound.
      go_migration_manager = lcl_migration_manager=>get_instance( ).
    endif.

    call method go_migration_manager->get_requestlist(
      exporting
        iv_uname = sy-uname
      importing
        et_itab  = lt_requestlist ).
    assign lt_requestlist->* to <t_requestlist>.

*Add Article numbers

    if sy-subrc = 0.
      lv_tz   = 'AUSVIC'.
      lv_time = '230000'.



      loop at <t_requestlist> assigning field-symbol(<f_reqlist>).

        assign component 'STATUS' of structure <f_reqlist> to field-symbol(<f_stat>).
        check <f_stat> is assigned.
        if <f_stat> = '01'.
          assign component 'ID' of structure <f_reqlist> to field-symbol(<f_id>).
          check <f_id> is assigned.
          lv_id = <f_id>.
         " data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu =  lv_id ).
          data(gcl_cockpit) = /dlwupex/cl_cockpit_article=>get_instance( iv_bu  = lv_id   ).
          check gcl_cockpit is bound.
*Check if check queue is finished
          assign component 'REQID' of structure <f_reqlist> to field-symbol(<f_reqid>).
          check <f_reqid> is assigned.
          lv_reqid = <f_reqid>.
          clear lv_inprogress.
          call method gcl_cockpit->/dlwupex/if_cockpit_article~control_check_inprogress
            exporting
              iv_id         = lv_id
              iv_reqid      = lv_reqid
            importing
              ev_inprogress = lv_inprogress
            changing
              cv_rc         = lv_rc.
          if lv_inprogress is not initial .
            <f_stat>  = '07'.
          else.
            call method gcl_cockpit->/dlwupex/if_cockpit_article~control_create_inprogress
              exporting
                iv_id         = lv_id
                iv_reqid      = lv_reqid
              importing
                ev_inprogress = lv_inprogress
              changing
                cv_rc         = lv_rc.
            if lv_inprogress is not initial .
              <f_stat>  = '07'.
            endif.
          endif.
        endif.

        lv_component = 6.
        append initial line to et_entityset assigning field-symbol(<f_requestlist>).
        if   <f_requestlist> is assigned.
          move-corresponding <f_reqlist> to <f_requestlist>.
        endif.
*Convert date
        assign component 'ZDATE' of structure  <f_requestlist> to field-symbol(<zdate>).
        if <zdate> is assigned.
          assign component 'ZDATE' of structure  <f_reqlist> to field-symbol(<zdateo>).
          if <zdateo> is assigned.
            lv_date = <zdateo>.
            convert date lv_date time lv_time into time stamp lv_time_stamp time zone lv_tz.
            <zdate> = lv_time_stamp .
          endif.
        endif.
        data lv_dateformat(10) type c.
        write lv_date to lv_dateformat.
        assign component 'DATEFORMAT' of structure  <f_requestlist> to field-symbol(<dateformat>).
        if <dateformat> is assigned.
          <dateformat> = lv_dateformat.
        endif.
*Get articles numbers
        clear  lv_nbremat.
        select count(*) from /dlwupex/tgdata
                              into  lv_nbremat
                              where id = <f_requestlist>-id
                              and   reqid =   <f_requestlist>-reqid.
        assign component 'NBREMAT' of structure <f_requestlist> to field-symbol(<nbremat>).
        if <nbremat> is assigned.
          <nbremat> = lv_nbremat.
          condense <nbremat> no-gaps.
        endif.
*Status
        while lv_component < 18.
          assign component lv_component of structure <f_requestlist> to field-symbol(<status>).
          if <status> is assigned .
            if <status> is initial. <status> = '00'.endif.
            unassign <status>.
          endif.
          lv_component =  lv_component + 1.
        endwhile.
*Bu desc
        select single description from /dlwupex/tbuhead
                                  into <f_requestlist>-description
                                  where id = <f_requestlist>-id.
      endloop.
*         LOOP AT   et_entityset ASSIGNING FIELD-SYMBOL(<f_requestlist>).
*           ASSIGN COMPONENT 'NBREMAT' OF STRUCTURE <f_requestlist> to FIELD-SYMBOL(<NBREMAT>).
*           if <NBREMAT> IS ASSIGNED.
*            <NBREMAT> = '14'.
*           endif.
*         ENDLOOP.
      "  Sort et_entityset by zDate .
    else.

*-------------------------------------------------------------
*  Map the RFC response to the caller interface - Only mapped attributes
*-------------------------------------------------------------
*-------------------------------------------------------------
* Error and exception handling
*-------------------------------------------------------------

* Execute the RFC exception handling process
      me->/iwbep/if_sb_dpc_comm_services~rfc_exception_handling(
        exporting
          iv_subrc            = sy-subrc
          iv_exp_message_text = lv_exc_msg ).
    endif.
*}   INSERT
  endmethod.


  method TEMPLATEITEMSET_GET_ENTITY.
**try.
*CALL METHOD SUPER->TEMPLATEITEMSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  importing
**    er_entity               =
**    es_response_context     =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*

*}   INSERT
  endmethod.


  method TEMPLATEITEMSET_GET_ENTITYSET.
**try.
*CALL METHOD SUPER->TEMPLATEITEMSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
*------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
    data lr_template              type rseloption.
    data lv_exc_msg               type /iwbep/mgw_bop_rfc_excep_text.
    data lo_filter                type  ref to /iwbep/if_mgw_req_filter.
    data lt_filter_select_options type /iwbep/t_mgw_select_option.
    data lv_filter_str            type string.
    data ls_converted_keys        like line of et_entityset.
    data ls_filter                type /iwbep/s_mgw_select_option.
    data ls_filter_range          type /iwbep/s_cod_select_option ##NEEDED.
    data lv_/DLWUPEX/EVIEWNAME    TYPE /DLWUPEX/EVIEWNAME.

*-------------------------------------------------------------
*  Map the runtime request to the RFC - Only mapped attributes
*-------------------------------------------------------------
* Get all input information from the technical request context object
* Since DPC works with internal property names and runtime API interface holds external property names
* the process needs to get the all needed input information from the technical request context object
* Get filter or select option information
    lo_filter = io_tech_request_context->get_filter( ).
    lt_filter_select_options = lo_filter->get_filter_select_options( ).
    lv_filter_str = lo_filter->get_filter_string( ).

* Check if the supplied filter is supported by standard gateway runtime process
    if  lv_filter_str            is not initial
    and lt_filter_select_options is initial.
      " If the string of the Filter System Query Option is not automatically converted into
      " filter option table (lt_filter_select_options), then the filtering combination is not supported
      " Log message in the application log
      me->/iwbep/if_sb_dpc_comm_services~log_message(
        exporting
          iv_msg_type   = 'E'
          iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
          iv_msg_number = 025 ).
      " Raise Exception
      raise exception type /iwbep/cx_mgw_tech_exception
        exporting
          textid = /iwbep/cx_mgw_tech_exception=>internal_error.
    endif.

* Get key table information
    io_tech_request_context->get_converted_source_keys(
      importing
        es_key_values  = ls_converted_keys ).

* Maps filter table lines to function module parameters
    loop at lt_filter_select_options into ls_filter.

      loop at ls_filter-select_options into ls_filter_range.
        case ls_filter-property.
          when 'TEMPLATE'.              " Equivalent to 'Template' property in the service
            lo_filter->convert_select_option(
              exporting
                is_select_option = ls_filter
              importing
                et_select_option = lr_template ).

            " Log message in the application log
            me->/iwbep/if_sb_dpc_comm_services~log_message(
              exporting
                iv_msg_type   = 'E'
                iv_msg_id     = '/IWBEP/MC_SB_DPC_ADM'
                iv_msg_number = 020
                iv_msg_v1     = ls_filter-property ).
            " Raise Exception
            raise exception type /iwbep/cx_mgw_tech_exception
              exporting
                textid = /iwbep/cx_mgw_tech_exception=>internal_error.
        endcase.
      endloop.

    endloop.

    if ls_converted_keys-template is not initial.
      append initial line to lr_template assigning field-symbol(<t>).
      if <t> is assigned.
        <t>-option  = 'EQ'.
        <t>-sign    = 'I'.
        <t>-low     = ls_converted_keys-template.."'GL_POSTING'."
        unassign: <t>.
      endif.
    endif.


*-------------------------------------------------------------
*  Get data
*-------------------------------------------------------------
    SELECT TABNAME,TABFIELD,DPOSITION,VIEWNAME  FROM /DLWUPEX/TFIELDS
                            into table @data(lt_template)
                            WHERE GABARIT eq 'Y'
                            AND   ACTIF  eq 'Y'
                            AND   VIEWNAME = '01'
                           .

   sort lt_template by VIEWNAME DPOSITION.
   LOOP AT lt_template INTO data(ls_template).
     if lv_/DLWUPEX/EVIEWNAME ne ls_template-VIEWNAME and lv_/DLWUPEX/EVIEWNAME IS NOT INITIAL.
      do 3 TIMES.
      APPEND INITIAL LINE TO et_entityset ASSIGNING FIELD-SYMBOL(<f_entityset>).
      <f_entityset>-TEXT = ''.
      ENDDO.
     endif.
     APPEND INITIAL LINE TO et_entityset ASSIGNING <f_entityset>.
*     <f_entityset>-TAB_COLUMN =
*     <f_entityset>-FIELD_NAME = ls_template-
     call function 'MG_FIELDNAME_TEXT'
       exporting
         tabname         = ls_template-TABNAME
         fieldname       = ls_template-TABFIELD
      IMPORTING
        SCRTEXT_S       =   <f_entityset>-TEXT
*        SCRTEXT_M       =
*        SCRTEXT_L       =
*        REPTEXT         =
*        DDTEXT          =
               .
     lv_/DLWUPEX/EVIEWNAME = ls_template-VIEWNAME.
   ENDLOOP.
*    select /dlwupex/fi_adt~template,
*           /dlwupex/fi_adi~tab_column,
*           /dlwupex/fi_adi~field_name,
*           /dlwupex/fi_adp~text
*      from /dlwupex/fi_adt
*      join /dlwupex/fi_adi
*      on /dlwupex/fi_adt~template = /dlwupex/fi_adi~template
*      join /dlwupex/fi_adp
*      on /dlwupex/fi_adi~field_name = /dlwupex/fi_adp~id
*      where /dlwupex/fi_adt~template in @lr_template
*      and /dlwupex/fi_adp~language eq 'F'"@sy-langu
*      order by tab_column
*      into table @data(templatedata).


    if sy-subrc = 0.
*      et_entityset = corresponding #( templatedata ).
    else.
*-------------------------------------------------------------
*  Map the RFC response to the caller interface - Only mapped attributes
*-------------------------------------------------------------
*-------------------------------------------------------------
* Error and exception handling
*-------------------------------------------------------------

* Execute the RFC exception handling process
      me->/iwbep/if_sb_dpc_comm_services~rfc_exception_handling(
        exporting
          iv_subrc            = sy-subrc
          iv_exp_message_text = lv_exc_msg ).
    endif.

    INCLUDE ole2incl.
 TYPE-POOLS: truxs,
            slis.

TYPES : BEGIN OF s_bkpf,
          bukrs type bkpf-bukrs,
          belnr type bkpf-belnr,
          gjahr type bkpf-gjahr,
          bldat type bkpf-bldat,
        END OF s_bkpf.

TYPES : BEGIN OF s_bseg,
          bukrs type bkpf-bukrs,
          belnr type bkpf-belnr,
          gjahr type bkpf-gjahr,
          buzei type bseg-buzei,
          dmbtr type bseg-dmbtr,
          ebeln type ekpo-ebeln,
          ebelp type ekpo-ebelp,
          werks type ekpo-werks,
          netpr type ekpo-netpr,
        END OF s_bseg.

TYPES : BEGIN OF s_ekpo,
          ebeln type ekpo-ebeln,
          ebelp type ekpo-ebelp,
          werks type ekpo-werks,
          netpr type ekpo-netpr,
          matnr type mara-matnr,
        END OF s_ekpo.

TYPES : BEGIN OF s_tipp_ong1,
          matnr type mara-matnr,  "Code  article
          maktx type makt-maktx,  "Libellé
          lfimg type lips-lfimg,  "???Nbre de qte Recue
*          inhme LIKE mara-inhme, "prix achat unitaire
          netpr type ekpo-netpr,  "prix achat unitaire
        essence type mara-inhbr,  "essence
         diesel type mara-inhbr,  "diesel
         totess type mara-inhbr,  "total essence
         totdsl type mara-inhbr,  "total diesel
         taxess type mara-inhbr,  "taxe  essence
         taxdsl type mara-inhbr,  "taxe  diesel
         matkl  type mara-matkl,                            "pour ongl2
         zztipp type mara-mtart, "essence ou diesel
         inhbr  type mara-inhbr,  "qté
         inhme  type mara-inhme,  "pour calculer vol_ess, vol_fuel
         meins  type mara-meins,
        END OF s_tipp_ong1.

TYPES : BEGIN OF s_tipp_ong2,
          matkl type mara-matkl,  "groupe marchandise
          matnr type mara-matnr,  "Code article
          maktx type makt-maktx,  "Libellé
        vol_ess type mara-inhbr,  "Vol. taxable essence (ml)
       vol_fuel type mara-inhbr,  "Vol. taxable diesel (ml)
        END OF s_tipp_ong2.

TYPES : BEGIN OF s_tipp_ong3,
          werks type ekpo-werks,  "Code entrepôt
          vbeln type ekes-vbeln,  "N° de bordereau
          lichn type lips-lichn,  "N° de BL fournisseur
          lifnr type ekko-lifnr,  "Code fournisseur
          ebeln type ekpo-ebeln,  "N° de commande
          matnr type ekpo-matnr,  "Code article
          maktx type makt-maktx,  "Libellé
          lfimg type lips-lfimg,  "Nb de qté reçue
          netpr type ekpo-netpr,  "Prix d'achat
          bldat type bkpf-bldat,  "Date réception
          vbelp type ekes-vbelp,
        END OF s_tipp_ong3.

DATA git_bkpf TYPE STANDARD TABLE OF s_bkpf.
DATA git_bseg TYPE STANDARD TABLE OF s_bseg.
DATA git_ekpo TYPE STANDARD TABLE OF s_ekpo.

DATA git_tipp1 TYPE STANDARD TABLE OF s_tipp_ong1.
DATA git_tipp2 TYPE STANDARD TABLE OF s_tipp_ong2.
DATA git_tipp3 TYPE STANDARD TABLE OF s_tipp_ong3.

DATA wa_tipp1 LIKE LINE OF git_tipp1.
DATA wa_tipp2 LIKE LINE OF git_tipp2.
DATA wa_tipp3 LIKE LINE OF git_tipp3.
DATA wa_ekpo LIKE LINE OF git_ekpo.
DATA wa_bseg  LIKE LINE OF git_bseg.
DATA wa_bkpf  LIKE LINE OF git_bkpf.

DATA :    l_convfld TYPE f.                       "Gleitkommahilfsfeld
DATA      l_dmbtr TYPE dmbtr. "taxe
DATA :    l_taxdsl TYPE dmbtr,  "taxe diesel
          l_taxess TYPE dmbtr.  "taxe essence

DATA: it_datatab         TYPE TABLE OF mara ,
      we_datatab         TYPE mara,
      it_raw             TYPE truxs_t_text_data,
      gt_fieldcat        TYPE slis_t_fieldcat_alv,
      ls_fieldcat        TYPE slis_fieldcat_alv,
      gs_layout          TYPE slis_layout_alv,
      gs_keyinfo         TYPE slis_keyinfo_alv,
      gt_sp_group        TYPE slis_t_sp_group_alv,
      gt_sort            TYPE slis_t_sortinfo_alv,
      g_tabname_item     TYPE slis_tabname,
      gt_events          TYPE slis_t_event,
      g_logsyst(10)      TYPE c,
      ws_edidc           TYPE edidc,
      ls_cellcolour      TYPE lvc_s_scol,
      w_color            TYPE int4,
      w_message_2131(220) TYPE c,
      w_message_v1(50)   TYPE c,
      w_message_v2(50)   TYPE c,
      w_message_v3(50)   TYPE c,
      w_message_v4(50)   TYPE c.
*
DATA: g_repid LIKE sy-repid.

CONSTANTS: wc_separator(3) TYPE c VALUE ' , '.

DATA: application TYPE ole2_object,
      workbook    TYPE ole2_object,
      sheet       TYPE ole2_object,
      cells       TYPE ole2_object,
      font        TYPE ole2_object,
      rows        TYPE ole2_object,
      columns     TYPE ole2_object,
      ranges      TYPE ole2_object.

DATA l_cpt_sheet TYPE i.     " Cpteur NoSheet
DATA l_cpt_line  TYPE i.     " Cpteur NoLine
DATA l_cells     TYPE i.     " NoCells

DATA l_row TYPE i.
DATA l_rowc(3) TYPE n.
DATA l_formula(30) TYPE c.

  CREATE OBJECT application 'excel.application'.
  IF sy-subrc NE 0.
    WRITE: / 'Error creating EXCEL' , sy-msgli.
  ENDIF.

* Setting properties
* Rendre invisible EXCEL
  SET PROPERTY OF application 'Visible' = 1.
  IF sy-subrc NE 0.
*    break jcasier.
  ENDIF.

* Calling methods

* Boucle pour savoir le nbre de Sheet à créer
*  LOOP AT git_tipp1 INTO wa_tipp1.
**    AT NEW werks.
**     l_cpt_sheet = l_cpt_sheet + 1.
**    ENDAT.
*  ENDLOOP.
  l_cpt_sheet = 9.

* Creation du Workbook
  CALL METHOD OF application 'Workbooks' = workbook.
  IF sy-subrc NE 0.
*    break jcasier.
  ENDIF.

* Nbre de Sheet dans le workbook
  SET PROPERTY OF application 'SheetsInNewWorkbook' = l_cpt_sheet.
  IF sy-subrc NE 0.
*    break jcasier.
  ENDIF.

  CALL METHOD OF workbook 'Add' = sheet.
  IF sy-subrc NE 0.
*    break jcasier.
  ENDIF.
  DATA l_style TYPE char30.
* 'xlR1C1' = 2 ; 'xlA1' = 1.
  SET PROPERTY OF application 'ReferenceStyle' = 1. "'xlR1C1' ." 'xlA1'.

*    POUR AJOUTER UNE SHEET dans Le Workbook
*    CALL METHOD OF application 'WORKSHEETS' = sheet.
*    CALL METHOD OF sheet 'ADD' .

* Boucle d'édition
  CLEAR l_cpt_sheet.
  DATA l_lang TYPE flag.

  LOOP AT git_tipp1 INTO wa_tipp1.

    AT FIRST.
*     Initialisations
      l_cpt_line = 1. " Nbre de ligne
      l_cells    = 1. " Cellule

*     Se positionne sur 1 Sheet
      l_cpt_sheet = l_cpt_sheet + 1.
      CALL METHOD OF application 'Worksheets' = sheet
        EXPORTING
        #1 = l_cpt_sheet.

*     Renomme la Sheet
      SET PROPERTY OF sheet 'Name' =  'déclaration'.

*     Ecrit l'en-tête et les noms des colonnes
**-   se positionne sur une cellule
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

*     Détermine la langue de l'Excel de façon empirique:
      IF l_lang = space.
        l_lang = 'X'.
        DATA l_value TYPE string.
        CLEAR l_formula .

*       Essai en anglais
        MOVE '=SUM(B2:B3)' TO l_formula.
        SET PROPERTY OF cells 'Value' = l_formula.

        GET PROPERTY OF cells 'Value' = l_value.
*       Si pas de valeur dans cette zone, la formule n'était pas
*       comprise par l'Excel, il n'est donc pas en EN.
        IF l_value EQ space.

*         Essai en francais
          CLEAR l_formula .
          MOVE '=SOMME(A1:A3)' TO l_formula.
          SET PROPERTY OF cells 'Value' = l_formula.

          GET PROPERTY OF cells 'Value' = l_value.
*         Si pas de valeur dans cette zone, la formule n'était pas
*         comprise par l'Excel, il n'est donc pas en FR.

          IF l_value EQ space.

          ELSE.
*       C'est en français, donc, on va chercher les textes (avec les
*       formules) en Francais (Text element traduit dans les différentes
*       langues possibles).
            SET LANGUAGE 'FR'.
          ENDIF.

        ELSE.
*       C'est en anglais, donc, on va chercher les textes (avec les
*       formules) en anglais (Text element traduit dans les différentes
*       langues possibles).
          SET LANGUAGE 'EN'.
        ENDIF.

        SET PROPERTY OF cells 'Value' = ''.

      ENDIF.


*     Donne la valeur dans une Cellule
      SET PROPERTY OF cells 'Value' = 'Déclaration TIPP'.
*
*      CALL METHOD OF cells 'Font' = font.
*      SET PROPERTY OF font 'Bold' = 1.
*      SET PROPERTY OF font 'Size' = '14'.
*      SET PROPERTY OF font 'ColorIndex' = '46' . "Color text en orange
*      SET PROPERTY OF font 'Underline' = 2.     " CA MARCHE
*      SET PROPERTY OF font 'Name' = 'AvantGarde'.


*--   se positionne sur une cellule
      l_cells = l_cells + 1.
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

*     Donne la valeur dans une cellule
*      SET PROPERTY OF cells 'Value' = wa_tipp1-matnr.
*      CALL METHOD OF cells 'Font' = font.
*      SET PROPERTY OF font 'Italic' = 1.
*      SET PROPERTY OF font 'Size' = '14'.
*      SET PROPERTY OF font 'Strikethrough' = 1.

*--   Titres Colonnes
      l_cpt_line = 2 + l_cpt_line.
      l_cells = 1.

*     -
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Code article' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Libellé' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Nbre de qte Recue' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'prix achat unitaire' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'essence' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'diesel' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'total essence' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'total diesel' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'taxe essence' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'taxe diesel' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .


*     -

*      Sélection des lignes pour les cacher CA MARCHE
*      CALL METHOD OF sheet 'ROWS' = rows
*                    EXPORTING #1 = '4:6'  . " n°dela(des)ligne(s)
*      SET PROPERTY OF rows 'hidden' = 1.

      CALL METHOD OF sheet 'Range' = ranges
        EXPORTING
        #1 = 'A4'
        #2 = 'J4'.
      GET PROPERTY OF ranges 'Interior' = ranges.
      SET PROPERTY OF ranges 'ColorIndex' = '8'.

      l_cpt_line = 1 + l_cpt_line.

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

    ENDAT.

    l_cpt_line = 1 + l_cpt_line.
    l_cells = 1.


*     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-matnr.

    l_cells = l_cells + 1 .

    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-maktx.

    l_cells = l_cells + 1 .
**     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-lfimg.

    l_cells = l_cells + 1 .

**     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-netpr.
    l_cells = l_cells + 1 .

**     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-essence.

    l_cells = l_cells + 1 .

**     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-diesel.
    l_cells = l_cells + 1 .

**     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-totess.
    l_cells = l_cells + 1 .

**     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-totdsl.
    l_cells = l_cells + 1 .

**     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-taxess.
    l_cells = l_cells + 1 .

**     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp1-taxdsl.



*    CLEAR l_formula .
*    CONCATENATE '=A' l_cpt_line_c INTO l_formula.
    l_cpt_line = 1 + l_cpt_line.
*
**     -
    AT LAST.
      DATA l_cpt_line_c TYPE c.
*    l_cpt_line_c = l_cpt_line.
*
      CALL METHOD OF sheet 'Columns' = columns.
      SET PROPERTY OF columns 'AutoFit' = 1.

      l_cells = 7.

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

      CLEAR l_formula .
      l_formula = 'Cumul'.
      SET PROPERTY OF cells 'Value' = l_formula.
      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.
*
*      l_cpt_line = l_cpt_line + 1.
      l_cells = 9.

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

      l_cpt_line_c = l_cpt_line - 1. "jusqu'à la ligne précédente
      CLEAR l_formula .
*      CONCATENATE '=SOMME(I5:I' l_cpt_line_c ')' INTO l_formula.
      CONCATENATE '=SUM(I5:I' l_cpt_line_c ')' INTO l_formula.
      " doit être 'sum', 'somme' ne fonctionne pas
      SET PROPERTY OF cells 'Value' = l_formula.
      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .


      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

      CLEAR l_formula .

      CONCATENATE '=SUM(J5:J' l_cpt_line_c ')' INTO l_formula.
      " doit être 'sum', 'somme' ne fonctionne pas
      SET PROPERTY OF cells 'Value' = l_formula.
      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cpt_line = 2 + l_cpt_line.

      l_cells = 7.

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

      CLEAR l_formula .
      l_formula = 'Montant à payer'.
      SET PROPERTY OF cells 'Value' = l_formula.
      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = 9.

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

      CLEAR l_formula .

      CONCATENATE '=SUM(I' l_cpt_line_c ':J' l_cpt_line_c ')' INTO l_formula.
      " doit être 'sum', 'somme' ne fonctionne pas
      SET PROPERTY OF cells 'Value' = l_formula.
      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

    ENDAT.

  ENDLOOP.
*
  LOOP AT git_tipp2 INTO wa_tipp2.

    AT FIRST.
*     Initialisations
      l_cpt_line = 1. " Nbre de ligne
      l_cells    = 1. " Cellule

*     Se positionne sur 1 Sheet
      l_cpt_sheet = l_cpt_sheet + 1.
      CALL METHOD OF application 'Worksheets' = sheet
        EXPORTING
        #1 = l_cpt_sheet.

*     Renomme la Sheet
      SET PROPERTY OF sheet 'Name' =  'article soumis'.

*     Ecrit l'en-tête et les noms des colonnes
**-   se positionne sur une cellule
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

*     Détermine la langue de l'Excel de façon empirique:
      IF l_lang = space.
        l_lang = 'X'.
        CLEAR l_formula .

*       Essai en anglais
*        MOVE '=SUM(B2:B3)' TO l_formula.
*        SET PROPERTY OF cells 'Value' = l_formula.
*
*        GET PROPERTY OF cells 'Value' = l_value.
*       Si pas de valeur dans cette zone, la formule n'était pas
*       comprise par l'Excel, il n'est donc pas en EN.
        IF l_value EQ space.

*         Essai en francais
          CLEAR l_formula .
*          MOVE '=SOMME(A1:A3)' TO l_formula.
          SET PROPERTY OF cells 'Value' = l_formula.

          GET PROPERTY OF cells 'Value' = l_value.
*         Si pas de valeur dans cette zone, la formule n'était pas
*         comprise par l'Excel, il n'est donc pas en FR.

          IF l_value EQ space.

          ELSE.
*       C'est en français, donc, on va chercher les textes (avec les
*       formules) en Francais (Text element traduit dans les différentes
*       langues possibles).
            SET LANGUAGE 'FR'.
          ENDIF.

        ELSE.
*       C'est en anglais, donc, on va chercher les textes (avec les
*       formules) en anglais (Text element traduit dans les différentes
*       langues possibles).
          SET LANGUAGE 'EN'.
        ENDIF.

        SET PROPERTY OF cells 'Value' = ''.

      ENDIF.


*     Donne la valeur dans une Cellule
      SET PROPERTY OF cells 'Value' = 'Article soumis'.

*--   se positionne sur une cellule
      l_cells = l_cells + 1.
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

*     Donne la valeur dans une cellule
*      SET PROPERTY OF cells 'Value' = wa_tipp1-matnr.
*      CALL METHOD OF cells 'Font' = font.
*      SET PROPERTY OF font 'Italic' = 1.
*      SET PROPERTY OF font 'Size' = '14'.
*      SET PROPERTY OF font 'Strikethrough' = 1.


*
*--   Titres Colonnes
      l_cpt_line = 2 + l_cpt_line.
      l_cells = 1.

*     -
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Groupe marchandise'.
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Code article' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Libellé' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Vol. taxable essence (ml)' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Vol. taxable diesel (ml)' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .

*     -

*      Sélection des lignes pour les cacher CA MARCHE
*      CALL METHOD OF sheet 'ROWS' = rows
*                    EXPORTING #1 = '4:6'  . " n°dela(des)ligne(s)
*      SET PROPERTY OF rows 'hidden' = 1.

      CALL METHOD OF sheet 'Range' = ranges
        EXPORTING
        #1 = 'A4'
        #2 = 'E4'.
      GET PROPERTY OF ranges 'Interior' = ranges.
      SET PROPERTY OF ranges 'ColorIndex' = '8'.
      l_cpt_line = 1 + l_cpt_line.

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

    ENDAT.

    l_cpt_line = 1 + l_cpt_line.
    l_cells = 1.


*     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp2-matkl.

    l_cells = l_cells + 1 .

**     -
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.

    l_cpt_line_c = l_cpt_line.
    CLEAR l_formula .
*    CONCATENATE '=A' l_cpt_line_c INTO l_formula.
    SET PROPERTY OF cells 'Value' = wa_tipp2-matnr.

    l_cells = l_cells + 1 .

    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.

    l_cpt_line_c = l_cpt_line.
    CLEAR l_formula .
*    CONCATENATE '=A' l_cpt_line_c INTO l_formula.
    SET PROPERTY OF cells 'Value' = wa_tipp2-maktx.

    l_cells = l_cells + 1 .
*
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp2-vol_ess.
    l_cells = l_cells + 1 .

    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp2-vol_fuel.
    l_cells = l_cells + 1 .

**     -

**     -
    AT END OF matnr.

      CALL METHOD OF sheet 'Columns' = columns.
      SET PROPERTY OF columns 'AutoFit' = 1.
*
*      l_cpt_line = l_cpt_line + 1.
*
*      CALL METHOD OF sheet 'Cells' = cells
*        EXPORTING
*        #1 = l_cpt_line
*        #2 = l_cells.
*
*      l_cpt_line_c = l_cpt_line - 1.
*      CLEAR l_formula .
**      CONCATENATE '=SOMME(B4:B' l_cpt_line_c ')' INTO l_formula.
*      CONCATENATE '=SUM(B4:B' l_cpt_line_c ')' INTO l_formula.
*      SET PROPERTY OF cells 'Value' = l_formula.

* =SUM(B4:B7)

    ENDAT.

  ENDLOOP.


  LOOP AT git_tipp3 INTO wa_tipp3.

    AT FIRST.
*     Initialisations
      l_cpt_line = 1. " Nbre de ligne
      l_cells    = 1. " Cellule

*     Se positionne sur 1 Sheet
      l_cpt_sheet = l_cpt_sheet + 1.
      CALL METHOD OF application 'Worksheets' = sheet
        EXPORTING
        #1 = l_cpt_sheet.

*     Renomme la Sheet
      SET PROPERTY OF sheet 'Name' =  'entrée'.

*     Ecrit l'en-tête et les noms des colonnes
**-   se positionne sur une cellule
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

*     Détermine la langue de l'Excel de façon empirique:
      IF l_lang = space.
        l_lang = 'X'.
        CLEAR l_formula .

*       Essai en anglais
        MOVE '=SUM(B2:B3)' TO l_formula.
        SET PROPERTY OF cells 'Value' = l_formula.

        GET PROPERTY OF cells 'Value' = l_value.
*       Si pas de valeur dans cette zone, la formule n'était pas
*       comprise par l'Excel, il n'est donc pas en EN.
        IF l_value EQ space.

*         Essai en francais
          CLEAR l_formula .
          MOVE '=SOMME(A1:A3)' TO l_formula.
          SET PROPERTY OF cells 'Value' = l_formula.

          GET PROPERTY OF cells 'Value' = l_value.
*         Si pas de valeur dans cette zone, la formule n'était pas
*         comprise par l'Excel, il n'est donc pas en FR.

          IF l_value EQ space.

          ELSE.
*       C'est en français, donc, on va chercher les textes (avec les
*       formules) en Francais (Text element traduit dans les différentes
*       langues possibles).
            SET LANGUAGE 'FR'.
          ENDIF.

        ELSE.
*       C'est en anglais, donc, on va chercher les textes (avec les
*       formules) en anglais (Text element traduit dans les différentes
*       langues possibles).
          SET LANGUAGE 'EN'.
        ENDIF.

        SET PROPERTY OF cells 'Value' = ''.

      ENDIF.


*     Donne la valeur dans une Cellule
      SET PROPERTY OF cells 'Value' = 'Entrée'.

*--   se positionne sur une cellule
      l_cells = l_cells + 1.
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.

*     Donne la valeur dans une cellule
*      SET PROPERTY OF cells 'Value' = wa_tipp1-matnr.
      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Italic' = 1.
      SET PROPERTY OF font 'Size' = '14'.
      SET PROPERTY OF font 'Strikethrough' = 1.

*--   Titres Colonnes
      l_cpt_line = 2 + l_cpt_line.
      l_cells = 1.

*     -
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Code entrepôt' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Numéro de bordereau' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Numero BL/Facture fournisseur' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Code fournisseur' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Numéro de commande' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Code article' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Libellé' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Nbre de qte Recue' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Prix d''''achat devise système' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .
      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.
      SET PROPERTY OF cells 'Value' = 'Date réception effective' .
      SET PROPERTY OF cells 'HorizontalAlignment' = 3 .

      CALL METHOD OF cells 'Font' = font.
      SET PROPERTY OF font 'Bold' = 1.

      l_cells = l_cells + 1 .

*     -

*      Sélection des lignes pour les cacher CA MARCHE
*      CALL METHOD OF sheet 'ROWS' = rows
*                    EXPORTING #1 = '4:6'  . " n°dela(des)ligne(s)
*      SET PROPERTY OF rows 'hidden' = 1.

      CALL METHOD OF sheet 'Range' = ranges
        EXPORTING
        #1 = 'A4'
        #2 = 'J4'.
      GET PROPERTY OF ranges 'Interior' = ranges.
      SET PROPERTY OF ranges 'ColorIndex' = '8'.

      l_cpt_line = 1 + l_cpt_line.

      CALL METHOD OF sheet 'Cells' = cells
        EXPORTING
        #1 = l_cpt_line
        #2 = l_cells.


    ENDAT.

    l_cpt_line = 1 + l_cpt_line.
    l_cells = 1.

    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp3-werks.

    l_cells = l_cells + 1 .
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp3-vbeln.

    l_cells = l_cells + 1 .
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp3-lichn.
    l_cells = l_cells + 1 .
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp3-lifnr.
    l_cells = l_cells + 1 .
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp3-ebeln.
    l_cells = l_cells + 1 .
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp3-matnr.
    l_cells = l_cells + 1 .
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp3-maktx.
    l_cells = l_cells + 1 .
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp3-lfimg.
    l_cells = l_cells + 1 .
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.
    SET PROPERTY OF cells 'Value' = wa_tipp3-netpr.
    l_cells = l_cells + 1 .
    CALL METHOD OF sheet 'Cells' = cells
      EXPORTING
      #1 = l_cpt_line
      #2 = l_cells.

    SET PROPERTY OF cells 'Value' = wa_tipp3-bldat.
    l_cells = l_cells + 1 .
*     -
*    CALL METHOD OF sheet 'Cells' = cells
*      EXPORTING
*      #1 = l_cpt_line
*      #2 = l_cells.
**    SET PROPERTY OF cells 'Value' = wa_tipp1-maktx.
*
*    l_cells = l_cells + 1 .
*
***     -
*    CALL METHOD OF sheet 'Cells' = cells
*      EXPORTING
*      #1 = l_cpt_line
*      #2 = l_cells.
*
*    l_cpt_line_c = l_cpt_line.
**    CLEAR l_formula .
**    CONCATENATE '=A' l_cpt_line_c INTO l_formula.
**    SET PROPERTY OF cells 'Value' = l_formula.
*
*    l_cells = l_cells + 1 .
*
**     -
    AT END OF matnr.

      CALL METHOD OF sheet 'Columns' = columns.
      SET PROPERTY OF columns 'AutoFit' = 1.

*      l_cpt_line = l_cpt_line + 1.

*      CALL METHOD OF sheet 'Cells' = cells
*        EXPORTING
*        #1 = l_cpt_line
*        #2 = l_cells.


    ENDAT.

  ENDLOOP.


  CALL METHOD OF sheet 'SAVEAS'
    EXPORTING
    #1 = 'C:\Users\AlouatA\Desktop\Abap\testowi.xls'.


  SET PROPERTY OF application 'Visible' = 1.
  CALL METHOD OF sheet 'Activate'.
  FREE :
   application,
   cells,
   sheet ,
   workbook .


*}   INSERT
  endmethod.


  method TEMPLATESET_GET_ENTITYSET.
**try.
*CALL METHOD SUPER->TEMPLATESET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
    data test.
    test = 'r'.
*}   INSERT
  endmethod.


  method XLSSET_GET_ENTITYSET.
**try.
*CALL METHOD SUPER->XLSSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
*{   INSERT         DS1K901478                                        1
*
*}   INSERT
  endmethod.
ENDCLASS.
