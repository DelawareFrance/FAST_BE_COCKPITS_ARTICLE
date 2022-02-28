class /DLWUPEX/CL_PRODUCTMAS_DPC_EXT definition
  public
  inheriting from /DLWUPEX/CL_PRODUCTMAS_DPC
  create public .

public section.

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_CORE_SRV_RUNTIME~READ_ENTITYSET
    redefinition .
protected section.

  methods BOMUPDATESET_GET_ENTITYSET
    redefinition .
  methods CARACUPDATESET_GET_ENTITYSET
    redefinition .
  methods CARATF4SET_GET_ENTITYSET
    redefinition .
  methods CARATVALF4SET_GET_ENTITYSET
    redefinition .
  methods CDF4SET_GET_ENTITYSET
    redefinition .
  methods CONTEXTITEMSSET_GET_ENTITYSET
    redefinition .
  methods CONTEXTSTF4SET_GET_ENTITYSET
    redefinition .
  methods FIAUPDATESET_GET_ENTITYSET
    redefinition .
  methods GENDATAUPDATESET_GET_ENTITYSET
    redefinition .
  methods GETF4VALUESSET_GET_ENTITYSET
    redefinition .
  methods LISTUPDATESET_GET_ENTITYSET
    redefinition .
  methods LOGDCUPDATESET_GET_ENTITYSET
    redefinition .
  methods LOGSTOREUPDATESE_GET_ENTITY
    redefinition .
  methods LOGSTOREUPDATESE_GET_ENTITYSET
    redefinition .
  methods OCCDF4SET_GET_ENTITYSET
    redefinition .
  methods ORGAOCSET_GET_ENTITYSET
    redefinition .
  methods PRODEDITSET_GET_ENTITYSET
    redefinition .
  methods SALEUPDATESET_GET_ENTITYSET
    redefinition .
  methods SH_ARTICLECATEGO_GET_ENTITYSET
    redefinition .
  methods SH_BASEUNITSET_GET_ENTITYSET
    redefinition .
  methods SH_GROSSTSET_GET_ENTITYSET
    redefinition .
  methods SH_PBINDSET_GET_ENTITYSET
    redefinition .
  methods SH_PFLKSSET_GET_ENTITYSET
    redefinition .
  methods SH_PRDHIASET_GET_ENTITYSET
    redefinition .
  methods SH_PRDTYPESET_GET_ENTITYSET
    redefinition .
  methods SH_PRODUCTGROUPS_GET_ENTITYSET
    redefinition .
  methods SH_RNDPRSET_GET_ENTITYSET
    redefinition .
  methods SH_VMSTASET_GET_ENTITYSET
    redefinition .
  methods SH_ZZ1DANGEROSIT_GET_ENTITYSET
    redefinition .
  methods SH_ZZ1TOPECOMMSA_GET_ENTITYSET
    redefinition .
  methods SH_ZZ1UVECOMSALS_GET_ENTITYSET
    redefinition .
  methods SH_ZZ1ZCIRCUIT01_GET_ENTITYSET
    redefinition .
  methods SH_ZZ1ZCIRCUITST_GET_ENTITYSET
    redefinition .
  methods SH_ZZ1ZPALETTEPL_GET_ENTITYSET
    redefinition .
  methods SH_ZZ1ZSTOCKAGEP_GET_ENTITYSET
    redefinition .
  methods SLISTUPDATESET_GET_ENTITYSET
    redefinition .
  methods TCPRODUCTSET_GET_ENTITYSET
    redefinition .
  methods UNITUPDATESET_GET_ENTITYSET
    redefinition .
  methods VARFIELDSSET_GET_ENTITYSET
    redefinition .
  methods VARIANTESET_GET_ENTITYSET
    redefinition .
  methods CARASINGLESET_GET_ENTITYSET
    redefinition .
private section.

  data GO_MIGRATION_MANAGER type ref to LIF_MIGRATION_MANAGER .

  methods CHECKMATLOCKED
    changing
      !PT_ENTITY type /DLWUPEX/CL_PRODUCTMAS_MPC=>TT_PRODEDIT .
  methods GETDYNAMICDATA
    importing
      !IP_VIEW type /DLWUPEX/EVIEWNAME
      !CT_DATA type ANY
    exporting
      !EP_DATA type ref to DATA .
  methods CLEARERRORMSG
    changing
      !CT_DATA type ANY TABLE .
  methods GET_DYN_TABLE
    importing
      !IP_VIEW type /DLWUPEX/EVIEWNAME
    exporting
      value(ET_TABLE) type ref to DATA .
  methods CONVERT_LAND_SPRAS
    importing
      !IP_LAND1 type LAND1
    returning
      value(EP_SPRAS) type SPRAS .
ENDCLASS.



CLASS /DLWUPEX/CL_PRODUCTMAS_DPC_EXT IMPLEMENTATION.


  method /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.

*Data declaration-----------------------------------------------------------------------------------------------------------

    types: ty_tdatacheck          type table of /dlwupex/cl_productmas_mpc=>ts_checkdata with default key.
    types: ty_tdatasave           type table of /dlwupex/cl_productmas_mpc=>ts_gendataupdate with default key.
    types : ty_tchangedfields     type table of /dlwupex/cl_productmas_mpc=>ts_changedfields with default key.
    types : ty_tunitupdate        type table of /dlwupex/cl_productmas_mpc=>ts_unitupdate with default key.
    types : ty_tcaracupdate       type table of /dlwupex/cl_productmas_mpc=>ts_caracupdate with default key.
    types : ty_tsaleupdate        type table of /dlwupex/cl_productmas_mpc=>ts_saleupdate with default key.
    types : ty_tlistupdate        type table of /dlwupex/cl_productmas_mpc=>ts_listupdate with default key.
    types : ty_tslistupdateupdate type table of /dlwupex/cl_productmas_mpc=>ts_slistupdate with default key.
    types : ty_tfiaupdateupdate   type table of /dlwupex/cl_productmas_mpc=>ts_fiaupdate with default key.
    types : ty_tlogdcupdate       type table of /dlwupex/cl_productmas_mpc=>ts_logdcupdate with default key.
    types : ty_tlogstupdate       type table of /dlwupex/cl_productmas_mpc=>ts_logstoreupdate with default key.


    types: begin of ts_tlogstupdate2.

    types: lineid               type /dlwupex/elineid,
           matnr                type marc-matnr,
           spras                type makt-spras,
           maktx                type makt-maktx,
           werks                type marc-werks,
           mmsta                type marc-mmsta,
           mmstd                type marc-mmstd,
           rdprf                type marc-rdprf,
           zz1_modegestion_plt  type marc-zz1_modegestion_plt,
           bwscl                type marc-bwscl,
           zz1_zcircuit_st_plt  type marc-zz1_zcircuit_st_plt,
           zz1_zreappro_st_plt  type marc-zz1_zreappro_st_plt,
           xchpf                type marc-xchpf,
           zz1_topbackorder_plt type marc-zz1_topbackorder_plt,
           zz1_minbackorder_plt type marc-zz1_minbackorder_plt,
           zz1_xmarketing_plt   type marc-zz1_xmarketing_plt,
           zz1_guichet_plt      type marc-zz1_guichet_plt,
           zz1_livrable_plt     type marc-zz1_livrable_plt,
           mtvfp                type marc-mtvfp,
           kautb                type marc-kautb,
           xmcng                type marc-xmcng,
           lgfsb                type marc-lgfsb,
           plifz                type marc-plifz,
           errmessage           type bapi_msg,


           end of  ts_tlogstupdate2.

    types:  ty_tlogstupdate2 type  table of ts_tlogstupdate2 with default key.
    data ls_test type  ts_tlogstupdate2.
    data lt_test like table of ls_test .

*TEst
*    field-symbols: <s_table10> type any  .
*     field-symbols: <s_table11> type any TABLE .
*    data : dataref type ref to data.
*    me->get_dyn_table( exporting ip_view  = '10' importing et_table =  dataref  ).
*    assign dataref->* to <s_table11>. "Dyanmic Structure
*    data lt_test2 like  <s_table10>.
*   "data lt_test2 like table of <s_table10> .
*Fin test


    types: begin of ty_data,
             data type ref to data,
           end of ty_data .
    types: begin of ts_datacheck.

             include type /dlwupex/cl_productmas_mpc=>ts_header.
             types: checkdataset      type ty_tdatacheck,
             gendataupdateset  type ty_tdatasave,
             changedfieldsset  type ty_tchangedfields,
             unitupdateset     type ty_tunitupdate,
             caracupdateset    type ty_tcaracupdate,
             saleupdateset     type ty_tsaleupdate,
             listupdateset     type ty_tlistupdate,
             slistupdateset    type ty_tslistupdateupdate,
             fiaupdateset      type ty_tfiaupdateupdate,
             logdcupdateset    type ty_tlogdcupdate,
             logstoreupdateset type ty_tlogstupdate,

           end of  ts_datacheck.




    types: begin of ty_change_data,
             view    type /dlwupex/eviewname,
             seldata type     /dlwupex/seldata_tt,
             data    type standard table of ty_data with default key,
           end of ty_change_data .

    types: ty_change_data_tt type standard table of ty_change_data with default key .

    data  : ls_data             type ts_datacheck,
            lt_tdatacheck       type  ty_tdatacheck,
            lv_buid             type /dlwupex/ebusunitid,
            lv_varid            type /dlwupex/evariant,
            lv_viewname         type /dlwupex/eviewname,
            lv_fieldname        type tabfldname,
            lv_fieldname_linked type tabfldname,
            lv_value            type /dlwupex/evaluefield,
            lv_value_linked     type /dlwupex/evaluefield,
            lv_rc               type sysubrc,
            lv_msg              type bapi_msg,
            lt_seldata          type /dlwupex/seldata_tt,
            lv_matnr            type matnr,
            lt_all_data         type  ty_change_data_tt,
            lt_tchangedfields   type ty_tchangedfields,
            lt_seldatainit      type ty_tchangedfields,
            lv_data             type ref to data,
            lv_context          type /dlwupex/econtext,
            lv_contextid        type /dlwupex/eidcont,
            lr_exc              type ref to cx_root.


    field-symbols  : <ft_data>   type any table,
                     <ft_data1>  type any table,
                     <ft_data2>  type any table,
                     <ft_data3>  type any table,
                     <ft_data4>  type any table,
                     <ft_data5>  type any table,
                     <ft_data6>  type any table,
                     <ft_data7>  type any table,
                     <ft_data8>  type any table,
                     <ft_data9>  type any table,
                     <ft_data10> type any table.



*Treatment-----------------------------------------------------------------------------------------------------------

    case iv_entity_name.
      when 'Header'.
        call method io_data_provider->read_entry_data( importing es_data = ls_data ).
        lv_buid     = ls_data-buid.
        lv_varid    = ls_data-varid.


        "data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
        data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).


        check gcl_cockpit is bound.

        lv_viewname = ls_data-viewname.

        if ls_data-calltype = 'Check'.
          lt_tdatacheck  = ls_data-checkdataset.
          try .
              lv_fieldname = lt_tdatacheck[ 1 ]-fieldname.
            catch cx_sy_itab_line_not_found.
          endtry.
          try .
              lv_value = lt_tdatacheck[ 1 ]-value.
            catch cx_sy_itab_line_not_found.
          endtry.
          translate lv_fieldname to upper case.
          if lv_fieldname = 'DATABB'.
            lv_fieldname = 'DATAB'.
          endif.
          try .
              lv_matnr = |{ lt_tdatacheck[ 1 ]-product alpha = in }|.
            catch cx_sy_itab_line_not_found.
          endtry.

          call function 'CONVERSION_EXIT_MATN1_INPUT'
            exporting
              input        = lv_matnr
            importing
              output       = lv_matnr
            exceptions
              length_error = 1
              others       = 2.
          if sy-subrc <> 0.
* Implement suitable error handling here
          endif.

          if lv_fieldname = 'ATINN'.
            call function 'CONVERSION_EXIT_ATINN_INPUT'
              exporting
                input  = lv_value
              importing
                output = lv_value.
          endif.
*          if lv_fieldname = 'ZZ1_UVECOM_SAL' or lv_fieldname = 'ZZ1_ZUO_SORTIE_PLT' or lv_fieldname = 'ZZ1_ZUO_ENTREE_PLT'.
*            call function 'CONVERSION_EXIT_CUNIT_INPUT'
*              exporting
*                input          = lv_value
*                language       = sy-langu
*              importing
*                output         = lv_value
*              exceptions
*                unit_not_found = 1
*                others         = 2.
*            if sy-subrc <> 0.
*              "Implement suitable error handling here
*            endif.
*          endif.

          call method gcl_cockpit->/dlwupex/if_cockpit_change_art~check_data
            exporting
              iv_art       = lv_matnr
              iv_viewname  = lv_viewname
              iv_fieldname = lv_fieldname
              iv_value     = lv_value
            changing
              cv_rc        = lv_rc
              cv_msg       = lv_msg.

          ls_data-msgreturn = lv_msg.
          ls_data-subrc = lv_rc.

          copy_data_to_ref(
                   exporting
                       is_data =     ls_data
                   changing
                       cr_data = er_deep_entity ).
        elseif ls_data-calltype = 'Save'.

          sort ls_data-changedfieldsset by   tabname fieldname.
          delete adjacent duplicates from ls_data-changedfieldsset comparing tabname fieldname.
          data(lt_fields) =  gcl_cockpit->gt_tvar_p .
*          if not ( sy-uname = '20009815' or sy-uname = '20007958' ).
*            loop at ls_data-changedfieldsset assigning field-symbol(<f_changedfieldsset>) .
*              translate <f_changedfieldsset>-fieldname to upper case.
*              if <f_changedfieldsset>-fieldname = 'DATABB'.
*                <f_changedfieldsset>-fieldname = 'DATAB'.
*                <f_changedfieldsset>-tabname = '/SAPSLL/MARITC' .
*                continue.
*              endif.
*              try .
*                  data(lv_tabname) = lt_fields[ viewname = <f_changedfieldsset>-tabname fieldname = <f_changedfieldsset>-fieldname ]-tabname.
*                catch cx_sy_itab_line_not_found.
*              endtry.
*              if lv_tabname is not initial.
*                <f_changedfieldsset>-tabname = lv_tabname .
*                clear lv_tabname.
*              endif.
*            endloop.
*            lt_seldata = corresponding #( ls_data-changedfieldsset ).
*          endif.
*          case ls_data-viewname.
*            when '01'.
*              assign  ls_data-gendataupdateset to <ft_data>.
*            when '02'.
*              assign  ls_data-unitupdateset to <ft_data>.
*            when '03'.
*              loop at   ls_data-caracupdateset assigning field-symbol(<f_line>).
*                call function 'CONVERSION_EXIT_ATINN_INPUT'
*                  exporting
*                    input  = <f_line>-atinn
*                  importing
*                    output = <f_line>-atinn.
*              endloop.
*              assign  ls_data-caracupdateset to <ft_data>.
*            when '08'.
*              assign  ls_data-saleupdateset to <ft_data>.
*              loop at ls_data-saleupdateset assigning field-symbol(<f_sale>).
*                call function 'CONVERSION_EXIT_CUNIT_INPUT'
*                  exporting
*                    input          = <f_sale>-zz1_uvecom_sal
*                    language       = sy-langu
*                  importing
*                    output         = <f_sale>-zz1_uvecom_sal
*                  exceptions
*                    unit_not_found = 1
*                    others         = 2.
*                if sy-subrc <> 0.
*                  "Implement suitable error handling here
*                endif.
*              endloop.
*            when '05'.
*              assign  ls_data-listupdateset to <ft_data>.
*            when '06'.
*              assign  ls_data-fiaupdateset to <ft_data>.
*            when '07'.
*              assign  ls_data-slistupdateset to <ft_data>.
*            when '09'.
*              assign  ls_data-logdcupdateset to <ft_data>.
*            when '10'.
*              assign  ls_data-logstoreupdateset to <ft_data>.
*            when others.
*          endcase.
*          if sy-uname = '20009815' or sy-uname = '20007958'.


          lt_tchangedfields[] = ls_data-changedfieldsset.
          sort  lt_tchangedfields by tabname.
          delete adjacent duplicates from lt_tchangedfields comparing tabname.
          loop at   ls_data-caracupdateset assigning field-symbol(<f_line>).
            call function 'CONVERSION_EXIT_ATINN_INPUT'
              exporting
                input  = <f_line>-atinn
              importing
                output = <f_line>-atinn.
          endloop.
          loop at ls_data-saleupdateset assigning field-symbol(<f_sale>).
            call function 'CONVERSION_EXIT_CUNIT_INPUT'
              exporting
                input          = <f_sale>-zz1_uvecom_sal
                language       = sy-langu
              importing
                output         = <f_sale>-zz1_uvecom_sal
              exceptions
                unit_not_found = 1
                others         = 2.
            if sy-subrc <> 0.
              "Implement suitable error handling here
            endif.
          endloop.

*Convert Z unit
          loop at   ls_data-logdcupdateset assigning field-symbol(<f_logdc>).
            assign component 'ZZ1_ZUO_ENTREE_PLT' of structure <f_logdc> to field-symbol(<f_zunit>).
            if sy-subrc eq 0 .
              call function 'CONVERSION_EXIT_CUNIT_INPUT'
                exporting
                  input          = <f_zunit>
                  language       = sy-langu
                importing
                  output         = <f_zunit>
                exceptions
                  unit_not_found = 1
                  others         = 2.
              if sy-subrc <> 0.
                "Implement suitable error handling here
              endif.
            endif.
            assign component 'ZZ1_ZUO_SORTIE_PLT' of structure <f_logdc> to <f_zunit>.
            if sy-subrc eq 0 .
              call function 'CONVERSION_EXIT_CUNIT_INPUT'
                exporting
                  input          = <f_zunit>
                  language       = sy-langu
                importing
                  output         = <f_zunit>
                exceptions
                  unit_not_found = 1
                  others         = 2.
              if sy-subrc <> 0.
                "Implement suitable error handling here
              endif.
            endif.
          endloop.

          loop at   ls_data-logstoreupdateset assigning field-symbol(<f_logst>).
            assign component 'ZZ1_ZUO_ENTREE_PLT' of structure <f_logst> to <f_zunit>.
            if sy-subrc eq 0 .
              call function 'CONVERSION_EXIT_CUNIT_INPUT'
                exporting
                  input          = <f_zunit>
                  language       = sy-langu
                importing
                  output         = <f_zunit>
                exceptions
                  unit_not_found = 1
                  others         = 2.
              if sy-subrc <> 0.
                "Implement suitable error handling here
              endif.
            endif.
            assign component 'ZZ1_ZUO_SORTIE_PLT' of structure <f_logst> to <f_zunit>.
            if sy-subrc eq 0 .
              call function 'CONVERSION_EXIT_CUNIT_INPUT'
                exporting
                  input          = <f_zunit>
                  language       = sy-langu
                importing
                  output         = <f_zunit>
                exceptions
                  unit_not_found = 1
                  others         = 2.
              if sy-subrc <> 0.
                "Implement suitable error handling here
              endif.
            endif.
          endloop.


          loop at lt_tchangedfields into data(ls_tchangedfields).
            append initial line to lt_all_data assigning field-symbol(<f_all_data>).
            <f_all_data>-view = ls_tchangedfields-tabname.
            lt_seldatainit[] = ls_data-changedfieldsset[].
            delete lt_seldatainit where tabname ne ls_tchangedfields-tabname.
            loop at lt_seldatainit assigning field-symbol(<f_changedfieldsset>) .
              translate <f_changedfieldsset>-fieldname to upper case.
              if <f_changedfieldsset>-fieldname = 'DATABB'.
                <f_changedfieldsset>-fieldname = 'DATAB'.
                <f_changedfieldsset>-tabname = '/SAPSLL/MARITC' .
                continue.
              endif.
              try .
                  data(lv_tabname) = lt_fields[ viewname = <f_changedfieldsset>-tabname fieldname = <f_changedfieldsset>-fieldname ]-tabname.
                catch cx_sy_itab_line_not_found.
              endtry.
              if lv_tabname is not initial.
                <f_changedfieldsset>-tabname = lv_tabname .
              endif.
              clear lv_tabname.
            endloop.


            if lt_seldatainit[] is not initial.
              lt_seldata = corresponding #( lt_seldatainit ).
              <f_all_data>-seldata[] = lt_seldata.
            endif.
            clear lt_seldatainit[].
            lv_viewname = ls_tchangedfields-tabname.
            append initial line to   <f_all_data>-data assigning field-symbol(<f_data>).
            me->getdynamicdata( exporting ip_view = lv_viewname ct_data = ls_data importing ep_data =  <f_data>-data ).



*              case ls_tchangedfields-tabname.
*                when '01'.
*                  lv_viewname = ls_tchangedfields-tabname.
*                  append initial line to   <f_all_data>-data assigning field-symbol(<f_data>).
*                  me->getdynamicdata( exporting ip_view = lv_viewname ct_data = ls_data importing ep_data =  <f_data>-data ).
*
**                  create data lv_data type standard table of /dlwupex/sgdataup.
**                  assign lv_data->* to <ft_data1>.
**                  <ft_data1>[] =  ls_data-gendataupdateset[].
**                  append initial line to   <f_all_data>-data assigning field-symbol(<f_data>).
**                  <f_data>-data = lv_data.
*                when '02'.
*                  create data lv_data type standard table of /dlwupex/sunitup.
*                  assign lv_data->* to <ft_data2>.
*                  <ft_data2>[] =  ls_data-unitupdateset[].
*                  append initial line to   <f_all_data>-data assigning <f_data>.
*                  <f_data>-data = lv_data.
*                when '03'.
*                  create data lv_data type standard table of /dlwupex/scaractup.
*                  assign lv_data->* to <ft_data3>.
*                  <ft_data3>[] =  ls_data-caracupdateset[].
*                  append initial line to   <f_all_data>-data assigning <f_data>.
*                  <f_data>-data = lv_data.
*
*                when '05'.
*                  create data lv_data type standard table of /dlwupex/slistup.
*                  assign lv_data->* to <ft_data5>.
*                  <ft_data5>[] =  ls_data-listupdateset[].
*                  append initial line to   <f_all_data>-data assigning <f_data>.
*                  <f_data>-data = lv_data.
*                when '06'.
*                  create data lv_data type standard table of /dlwupex/sfiaup.
*                  assign lv_data->* to <ft_data6>.
*                  <ft_data6>[] =  ls_data-fiaupdateset[].
*                  append initial line to   <f_all_data>-data assigning <f_data>.
*                  <f_data>-data = lv_data.
*                when '07'.
*                  create data lv_data type standard table of /dlwupex/sslistup.
*                  assign lv_data->* to <ft_data7>.
*                  <ft_data7>[] =  ls_data-slistupdateset[].
*                  append initial line to   <f_all_data>-data assigning <f_data>.
*                  <f_data>-data = lv_data.
*                when '08'.
*                  create data lv_data type standard table of /dlwupex/ssaleup.
*                  assign lv_data->* to <ft_data8>.
*                  <ft_data8>[] =  ls_data-saleupdateset[].
*                  append initial line to   <f_all_data>-data assigning <f_data>.
*                  <f_data>-data = lv_data.
*                when '09'.
*                  create data lv_data type standard table of /dlwupex/slogdcup.
*                  assign lv_data->* to <ft_data9>.
*                  <ft_data9>[] =  ls_data-logdcupdateset[].
*                  append initial line to   <f_all_data>-data assigning <f_data>.
*                  <f_data>-data = lv_data.
*                when '10'.
*                  create data lv_data type standard table of /dlwupex/slogstoreup.
*                  assign lv_data->* to <ft_data10>.
*                  <ft_data10>[] =  ls_data-logstoreupdateset[].
*                  append initial line to   <f_all_data>-data assigning <f_data>.
*                  <f_data>-data = lv_data.
*                when others.
*              endcase.
          endloop.


*          call method /dlwupex/cl_check_modif=>get_instance
*            exporting
*              iv_variant = lv_varid
*              iv_wa      = lv_buid
*            receiving
*              rv_object  = data(lv_object).
** Check Spécifique BM
*          if lv_object is not initial.
*            try .
*                call method lv_object->('CHECK_MARC_BM')
*                  importing
*                    ev_rc       = lv_rc
*                  changing
*                    ct_all_data = lt_all_data.
*              catch cx_root into lr_exc.
*            endtry.
*          endif.


* Traitement core
*          if lv_rc is initial.
          lv_context = ls_data-msgreturn.
          lv_contextid = ls_data-viewname.
          call method gcl_cockpit->/dlwupex/if_cockpit_change_art~change_all_data
            exporting
              iv_id       = lv_contextid
              iv_context  = lv_context
            importing
              ev_rc       = lv_rc
            changing
              ct_all_data = lt_all_data.
*          endif.

          loop at lt_all_data into data(ls_all_data).
            try .
                data(ls_line) = ls_all_data-data[ 1 ].
              catch cx_sy_itab_line_not_found.
            endtry.
            if ls_line is not initial.
              case ls_all_data-view.
                when  '01'.
                  assign ls_line-data->* to <ft_data1>.
                  ls_data-gendataupdateset[] = <ft_data1>[].
                  me->clearerrormsg( changing ct_data = ls_data-gendataupdateset ).
                when  '02'.
                  assign ls_line-data->* to <ft_data2>.
                  ls_data-unitupdateset[] = <ft_data2>[].
                  me->clearerrormsg( changing ct_data = ls_data-unitupdateset ).
                when  '03'.
                  assign ls_line-data->* to <ft_data3>.
                  ls_data-caracupdateset[] = <ft_data3>[].
                  me->clearerrormsg( changing ct_data = ls_data-caracupdateset ).
                  loop at   ls_data-caracupdateset assigning <f_line>.
                    call function 'CONVERSION_EXIT_ATINN_OUTPUT'
                      exporting
                        input  = <f_line>-atinn
                      importing
                        output = <f_line>-atinn.
                  endloop.
                when  '05'.
                  assign ls_line-data->* to <ft_data5>.
                  ls_data-listupdateset[] = <ft_data5>[].
                  me->clearerrormsg( changing ct_data = ls_data-listupdateset ).
                when  '06'.
                  assign ls_line-data->* to <ft_data6>.
                  ls_data-fiaupdateset[] = <ft_data6>[].
                  me->clearerrormsg( changing ct_data = ls_data-fiaupdateset ).
                when  '07'.
                  assign ls_line-data->* to <ft_data7>.
                  ls_data-slistupdateset[] = <ft_data7>[].
                  me->clearerrormsg( changing ct_data = ls_data-slistupdateset ).
                when  '08'.
                  assign ls_line-data->* to <ft_data8>.
                  ls_data-saleupdateset[] = <ft_data8>[].
                  me->clearerrormsg( changing ct_data = ls_data-saleupdateset ).
                when  '09'.
                  assign ls_line-data->* to <ft_data9>.
                  ls_data-logdcupdateset[] = <ft_data9>[].
*                  me->clearerrormsg( changing ct_data = ls_data-logdcupdateset ).
                when  '10'.
                  assign ls_line-data->* to <ft_data10>.
*                  ls_data-logstoreupdateset[] = <ft_data10>[].
                  ls_data-logstoreupdateset[] = corresponding #( <ft_data10>[] ).
                  "     me->clearerrormsg( changing ct_data = ls_data-logstoreupdateset ).
                when others.
              endcase.
            endif.
            clear ls_line.
          endloop.



          ls_data-subrc = lv_rc.
          copy_data_to_ref(
                exporting
                    is_data =     ls_data
                changing
                    cr_data = er_deep_entity ).

        endif.

      when others.
    endcase.
  endmethod.


  method /iwbep/if_mgw_core_srv_runtime~read_entityset.
    try.
        call method super->/iwbep/if_mgw_core_srv_runtime~read_entityset
          exporting
            iv_entity_name           = iv_entity_name
            iv_source_name           = iv_source_name
            is_paging                = is_paging
            it_order                 = it_order
            it_filter_select_options = it_filter_select_options
            is_request_details       = is_request_details
          changing
            cv_response_body         = cv_response_body
            ct_headers               = ct_headers
            cr_entityset             = cr_entityset
            cr_deleted_entityset     = cr_deleted_entityset
            cs_response_context      = cs_response_context
            ct_inline_info           = ct_inline_info.
      catch /iwbep/cx_mgw_busi_exception .
      catch /iwbep/cx_mgw_tech_exception .
    endtry.
    field-symbols <f_data> type any table.
**CHECK IV_ENTITY_NAME = 'Caracteristics'.
*    assign cr_entityset->* to  <f_data>.
*
**    data : lv_reqid    type /dlwupex/ereqid,
**           lv_viewname type /dlwupex/eviewname,
**           lt_msg      type /dlwupex/tmsg_tt,
**           lv_buid     type /dlwupex/ebusunitid.
**
**    try .
**        lv_buid = it_filter_select_options[ property = 'BUID' ]-select_options[ 1 ]-low.
**      catch cx_sy_itab_line_not_found.
**    endtry.
**    try .
**        lv_reqid = it_filter_select_options[ property = 'REQID' ]-select_options[ 1 ]-low.
**      catch cx_sy_itab_line_not_found.
**    endtry.
**
**
**
**    case iv_entity_name.
**      when gc_genraldata.
**        lv_viewname = '01'.
**      when gc_unitean.
**        lv_viewname = '02'.
**      when gc_caract.
**        lv_viewname = '03'.
**      when gc_bom.
**        lv_viewname = '04'.
**      when gc_listing.
**        lv_viewname = '05'.
**      when gc_fiapa.
**        lv_viewname = '06'.
**      when gc_sourcelist.
**        lv_viewname = '07'.
**      when gc_salepv.
**        lv_viewname = '08'.
**      when gc_logisticdc.
**        lv_viewname = '09'.
**      when gc_logisticstore.
**        lv_viewname = '10'.
**      when others.
**    endcase.
**    check lv_viewname is not initial.
**    data(gcl_cockpit) = new /dlwupex/cl_cockpit_article( iv_bu = lv_buid ).
**    check gcl_cockpit is bound.
**    call method gcl_cockpit->/dlwupex/if_cockpit_article~msg_check_type_get
**      exporting
**        iv_reqid    = lv_reqid
**        iv_viewname = lv_viewname
**      importing
**        et_msg      = lt_msg.
**
*
    check iv_entity_name = 'CaracUpdate'.
    assign cr_entityset->* to  <f_data>.
    loop at  <f_data> assigning field-symbol(<f_line>).



      assign component 'ATINN' of structure <f_line> to field-symbol(<value>).
      check <value> is assigned.

      select single atprt
              from cabn
              into  @data(lv_atprt)
              where atinn = @<value>.

      if lv_atprt = 'T006'.
        assign component 'ATWRT' of structure <f_line> to field-symbol(<valueunit>).
        if <valueunit> is assigned.
          call function 'CONVERSION_EXIT_CUNIT_OUTPUT'
            exporting
              input          = <valueunit>
              language       = sy-langu
            importing
*             LONG_TEXT      =
              output         = <valueunit>
*             SHORT_TEXT     =
            exceptions
              unit_not_found = 1
              others         = 2.
          if sy-subrc <> 0.
* Implement suitable error handling here
          endif.

        endif.
      endif.


      call function 'CONVERSION_EXIT_ATINN_OUTPUT'
        exporting
          input  = <value>
        importing
          output = <value>.


      clear lv_atprt.
    endloop.
  endmethod.


  method bomupdateset_get_entityset.
    data : lv_buid      type /dlwupex/ebusunitid,
           lv_varid     type /dlwupex/evariant,
           lv_tabname   type tabname16,
           ls_selfields type string,
           lv_matnr     type matnr,
           lt_entity    type /dlwupex/cl_productmas_mpc=>tt_saleupdate,
           lt_entityout type /dlwupex/cl_productmas_mpc=>tt_saleupdate,
           lv_vkorg     type vkorg,
           lv_vtweg     type vtweg,
           lr_exc       type ref to cx_root,
           lt_makt      type table of makt.

    field-symbols : <f_entity> type /dlwupex/cl_productmas_mpc=>ts_bomupdate.
    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
*Get WorkArea land
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    check sy-subrc = 0.
    try .
        data(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
      catch cx_sy_itab_line_not_found.
    endtry.
    loop at  lt_range assigning field-symbol(<f_range>).
      <f_range>-option = 'CP'.
      concatenate '*' <f_range>-low into <f_range>-low.
    endloop.
    select matnr,stlnr from mast
             into table @data(lt_stlnr)
             where matnr in @lt_range.
    check sy-subrc eq 0.
    select * from stpo into corresponding fields of table et_entityset
                       for all entries in lt_stlnr"#EC CI_NO_TRANSFORM
                       where stlnr = lt_stlnr-stlnr.
*    sort et_entityset by matnr werks.

                         .
    data(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
    select matnr maktx from makt
                       into corresponding fields of table lt_makt
                       where matnr in lt_range
                       and spras eq lv_spras.
    loop at et_entityset assigning <f_entity> .
      <f_entity>-spras = lv_spras.
      try .
          <f_entity>-matnr = lt_stlnr[ stlnr = <f_entity>-stlnr ]-matnr.
        catch cx_sy_itab_line_not_found.
      endtry.
      check lt_makt[] is not initial.
      try .
          <f_entity>-maktx = lt_makt[ matnr = <f_entity>-matnr ]-maktx.
        catch cx_sy_itab_line_not_found.
      endtry.
    endloop.
    sort   et_entityset by matnr stlnr.
  endmethod.


  method caracupdateset_get_entityset.
    data : lv_buid      type /dlwupex/ebusunitid,
           lv_varid     type /dlwupex/evariant,
           lv_tabname   type tabname16,
           ls_selfields type string,
           lv_maktx     type maktx,
           lineid       type /dlwupex/elineid.

    try .
        data(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
*Get WorkArea land
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    data(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
    loop at  lt_range assigning field-symbol(<f_range>).
      <f_range>-option = 'CP'.
      concatenate '*' <f_range>-low into <f_range>-low.
    endloop.
*
    select  cuobj,objek from inob
                        where objek in @lt_range
                        into table @data(lt_obj).
    check sy-subrc eq 0.
    loop at lt_obj into data(ls_obj).



      select  atinn,atwrt,atzhl,dec_value_from  from ausp
                           into @data(ls_result)
                           where objek eq  @ls_obj-cuobj
                           and   klart = '026'.
        append initial line to et_entityset assigning field-symbol(<f_entity>).
        <f_entity>-matnr = ls_obj-objek.
        "  if lv_maktx is initial.
        select single maktx into lv_maktx from makt
                                          where matnr = <f_entity>-matnr
                                          and spras = lv_spras.
        "  endif.
        if ls_result-atwrt is initial.
          write ls_result-dec_value_from to ls_result-atwrt decimals 4.
          condense ls_result-atwrt no-gaps.
        endif.
        <f_entity>-maktx = lv_maktx.
        <f_entity>-atinn = ls_result-atinn.
        <f_entity>-atwrt = ls_result-atwrt.
        <f_entity>-atzhl = ls_result-atzhl.
        <f_entity>-work_area = lv_buid.
        <f_entity>-variant = lv_varid.

        lineid = lineid + 1.
        <f_entity>-lineid =   lineid.

      endselect.


    endloop.
*
    sort et_entityset by matnr atinn.

  endmethod.


  METHOD carasingleset_get_entityset.

    TYPES : BEGIN OF ltyp_atnam,
              atnam TYPE cabn-atnam,
              atbez TYPE cabnt-atbez,
              atfor TYPE cabn-atfor,
              atein type cabn-atein,
              spras TYPE cabnt-spras,
            END OF   ltyp_atnam .
    DATA lt_atnam_tab TYPE TABLE OF   ltyp_atnam.
    DATA lr_class_tab TYPE RANGE OF klah-class.


    TRY .
        DATA(lr_range) = it_filter_select_options[ property = 'Atnam' ]-select_options.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.


    SELECT DISTINCT atnam atbez atfor atein spras FROM
        ( ( cabn AS c JOIN ksml AS k
        ON c~atinn = k~imerk )
        JOIN klah AS kl
        ON k~clint = kl~clint )
        JOIN cabnt
        ON c~atinn = cabnt~atinn
      INTO  TABLE lt_atnam_tab
      WHERE kl~class IN lr_class_tab
        AND kl~klart EQ '026'
        AND cabnt~spras = sy-langu
        AND  c~atnam IN lr_range.

    LOOP AT lt_atnam_tab INTO DATA(ls_atnam_tab).
      APPEND INITIAL LINE TO et_entityset ASSIGNING FIELD-SYMBOL(<f_entity>).

      <f_entity>-atnam = ls_atnam_tab-atnam.
      <f_entity>-atein = ls_atnam_tab-atein.
    ENDLOOP.
  ENDMETHOD.


  method caratf4set_get_entityset.
    types : begin of ltyp_atnam,
              atnam type cabn-atnam,
              atbez type cabnt-atbez,
              atfor type cabn-atfor,
              spras type cabnt-spras,
            end of   ltyp_atnam .
    data lt_atnam_tab type table of   ltyp_atnam.
    data lr_class_tab type range of klah-class.


    try .
        data(lr_range) = it_filter_select_options[ property = 'Atnam' ]-select_options.
      catch cx_sy_itab_line_not_found.
    endtry.


    select distinct atnam atbez atfor spras from
  ( ( cabn as c join ksml as k
  on c~atinn = k~imerk )
  join klah as kl
  on k~clint = kl~clint )
  join cabnt
  on c~atinn = cabnt~atinn
  into  table lt_atnam_tab
  where kl~class in lr_class_tab
    and kl~klart eq '026'
    and cabnt~spras = sy-langu
    and  c~atnam in lr_range.

    loop at lt_atnam_tab into data(ls_atnam_tab).
      append initial line to et_entityset assigning field-symbol(<f_entity>).

*      call function 'CONVERSION_EXIT_ATINN_INPUT'
*        exporting
*          input  = ls_atnam_tab-atnam
*        importing
*          output = <f_entity>-atinn.

      <f_entity>-atnam = ls_atnam_tab-atnam.
    endloop.
  endmethod.


  method caratvalf4set_get_entityset.

    types : begin of ltyp_atnam,
              atinn type atinn,
            end of   ltyp_atnam .
    data lt_cawn_tab type table of cawn.
    data lr_atinn type range of atinn.
    data lt_atnam_tab type table of   ltyp_atnam.
    data lr_class_tab type range of klah-class.
    data : lv_tabcontrol     type tabname,
           lv_tabcontroltext type tabname,
           lt_dfies_tab      type table of dfies,
           ls_dfies_line     type  dfies,
           lt_dfies_line     type  table of dfies,
           ls_dd01v_wa       type dd01v,
           lv_table          type ddobjname,
           ls_shlp           type  shlp_descr,
           ls_f4string       type string,
           lt_record_tab     type  ddshreslts,
           ls_key            type string,
           lv_field          type fieldname,
           ls_entityset      type /dlwupex/cl_productmas_mpc=>ts_caratvalf4.
           field-symbols:    <lt_itab>     type table,
           <lt_itabtext>     type table.

    data: ls_xfc type lvc_s_fcat.
    data: lt_xfc type lvc_t_fcat.
    data: dy_table  type ref to data,
          dy_line   type ref to data,
          lt_search type table of ddshretval.
    field-symbols: <dyn_table> type standard table,
                   <dyn_wa>    type any.

    try .
        data(lr_range) = it_filter_select_options[ property = 'Atnam' ]-select_options.
      catch cx_sy_itab_line_not_found.
    endtry.

    check lr_range[] is not initial.
*    try .
*        data(lr_atwrt) = it_filter_select_options[ property = 'Atwrt' ]-select_options.
*      catch cx_sy_itab_line_not_found.
*    endtry.
*
    loop at lr_range assigning field-symbol(<f_range>).
      translate <f_range>-low using '# '.

      condense <f_range>-low no-gaps.
      if <f_range>-low cs '*'.
        <f_range>-option = 'CP'.
      endif.

      call function 'CONVERSION_EXIT_ATINN_INPUT'
        exporting
          input  = <f_range>-low
        importing
          output = <f_range>-low.

    endloop.


*    select distinct c~atinn from
*  ( ( cabn as c join ksml as k
*  on c~atinn = k~imerk )
*  join klah as kl
*  on k~clint = kl~clint )
*  join cabnt
*  on c~atinn = cabnt~atinn
*  into  table lt_atnam_tab
*  where kl~class in lr_class_tab
*    and kl~klart eq '026'
*    and cabnt~spras = sy-langu
*    and  c~atnam in lr_range
**    and  c~datub ne '00000000'
**    and  c~datub ne ''
*    and  c~datub >= sy-datum.


    select atinn atwrt atzhl from cawn into corresponding fields of table lt_cawn_tab
               where atinn  in lr_range
                 and datuv  <= sy-datum
                 and techv  = space.


    loop at lt_cawn_tab into data(ls_cawn).
      select single atwtb from cawnt into ls_entityset-atnam where atinn  eq ls_cawn-atinn
                                                             and atzhl = ls_cawn-atzhl
                                                             and spras = sy-langu.
*      ls_entityset-atnam = ls_cawn-atwrt.
      ls_entityset-atwrt = ls_cawn-atwrt.
      append  ls_entityset to et_entityset.
    endloop.


    if sy-subrc ne 0.
      select single atprt
                   from cabn
                   into  @data(lv_atprt)
                   where atinn in @lr_range.
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


        if ls_dfies_line-tabname = 'MARA'.
             select * from (ls_dfies_line-tabname)
             into corresponding fields of table <dyn_table>.
          .
          lv_field = ls_dfies_line-fieldname.
           loop at <dyn_table> assigning field-symbol(<f_line>).
            assign component  lv_field of structure <f_line> to field-symbol(<f_key>).
            if <f_key> is assigned.
              SELECT SINGLE maktx FROM makt INTO ls_entityset-atnam  WHERE matnr = <f_key> AND spras = sy-langu.
*              ls_entityset-atnam = <f_key>.
              ls_entityset-atwrt = <f_key>.
              append  ls_entityset to et_entityset.
            endif.
          endloop.
        elseif not ls_dfies_line-tabname = 'T006'.
          select * from (ls_dfies_line-tabname)
             into corresponding fields of table <dyn_table>.
          .
          lv_field = ls_dfies_line-fieldname.
          loop at <dyn_table> assigning <f_line>.
            assign component  lv_field of structure <f_line> to <f_key>.
            if <f_key> is assigned.
              ls_entityset-atnam = <f_key>.
              ls_entityset-atwrt = <f_key>.
              append  ls_entityset to et_entityset.
            endif.
          endloop.

        else.
          select * from t006a
            into table @data(lt_t006a) where spras = @sy-langu .
          .

          loop at lt_t006a into data(ls_t006a).
            ls_entityset-atnam = ls_t006a-msehl.
            ls_entityset-atwrt = ls_t006a-mseh3.
            append  ls_entityset to et_entityset.
          endloop.
        endif.
      endif.


    endif.

*    select distinct c~atinn from
*    ( ( cabn as c join ksml as k
*    on c~atinn = k~imerk )
*    join klah as kl
*    on k~clint = kl~clint )
*    join cabnt
*    on c~atinn = cabnt~atinn
*    into corresponding fields of table lt_atnam_tab
*    up to 500 rows
*    where kl~class in lr_class_tab
*      and kl~klart = '026'
*       and  c~atnam in lr_range
*      and cabnt~spras =  'E'."sy-langu.
*
*
*
*
*
*    check sy-subrc eq 0.
*    loop at lt_atnam_tab into data(ls_atnam_tab).
*      append initial line to lr_atinn assigning field-symbol(<f_atinn>).
*      <f_atinn>-low = ls_atnam_tab-atinn.
*      <f_atinn>-sign = 'I'.
*      <f_atinn>-option = 'EQ'.
*    endloop.
*
*
*    select atinn atwrt atzhl from cawn into corresponding fields of table  et_entityset
*       where atinn  in lr_atinn
*         and atwrt in lr_atwrt
*         and datuv  <= sy-datum
*         and techv  = space.

*    loop at et_entityset assigning field-symbol(<f_entity>).
*      call function 'CONVERSION_EXIT_ATINN_OUTPUT'
*        exporting
*          input  = <f_entity>-atinn
*        importing
*          output = <f_entity>-atnam.
*
*    endloop.

*    delete  et_entityset where  atwrt is initial.

*    loop at lt_cawn_tab into data(ls_cawn).
**      select single atwtb from cawnt into ls_entityset-desc where atinn  eq lv_atinn and atzhl = ls_cawn-atzhl.
*      append initial line to et_entityset assigning field-symbol(<f_entity>).
*      move-corresponding ls_cawn to <f_entity>.
*    endloop.
*    if sy-subrc ne 0.
*
*
*      select single atprt
*       from cabn
*       into  @data(lv_atprt)
*       where atinn = @lv_atinn.
*      if sy-subrc eq 0 and lv_atprt is not initial.
*        lv_tabcontrol = lv_atprt.
*        call function 'GET_KEY_FIELDS_OF_TABLE'
*          exporting
*            tabname       = lv_tabcontrol
*          tables
*            key_fieldtab  = lt_dfies_line
*          exceptions
*            not_supported = 1
*            others        = 2.
*        try .
**      data(ls_tab) =  lt_dfies_line[ 1 ]-tabname.
**      lv_field =  lt_dfies_line[ 1 ]-fieldname.
*            ls_dfies_line =  lt_dfies_line[ 1 ].
*          catch cx_sy_itab_line_not_found.
*        endtry.
*
*        ls_xfc-fieldname = ls_dfies_line-fieldname.
*        ls_xfc-datatype = ls_dfies_line-datatype.
*        ls_xfc-inttype = ls_dfies_line-inttype.
*        ls_xfc-intlen = ls_dfies_line-intlen.
*        ls_xfc-decimals = ls_dfies_line-decimals.
*        append ls_xfc to lt_xfc.
*        call method cl_alv_table_create=>create_dynamic_table
*          exporting
*            it_fieldcatalog  = lt_xfc
*            i_length_in_byte = 'X'
*          importing
*            ep_table         = dy_table.
*        assign dy_table->* to <dyn_table>.
*        create data dy_line like line of <dyn_table>.
*
*        if not ls_dfies_line-tabname = 'T006'.
*          select * from (ls_dfies_line-tabname)
*             into corresponding fields of table <dyn_table>.
*          .
*          lv_field = ls_dfies_line-fieldname.
*          loop at <dyn_table> assigning field-symbol(<f_line>).
*            assign component  lv_field of structure <f_line> to field-symbol(<f_key>).
*            if <f_key> is assigned.
*              ls_entityset-desc = <f_key>.
*              ls_entityset-key = <f_key>.
*              append  ls_entityset to et_entityset.
*            endif.
*          endloop.
*        else.
*          select * from t006a
*            into table @data(lt_t006a) where spras = @sy-langu .
*          .
*
*          loop at lt_t006a into data(ls_t006a).
*            ls_entityset-desc = ls_t006a-msehl.
*            ls_entityset-key = ls_t006a-mseh3.
*            append  ls_entityset to et_entityset.
*          endloop.
*        endif.
*      endif.
*    endif.
  endmethod.


  method cdf4set_get_entityset.
    try.
        call method super->cdf4set_get_entityset
          exporting
            iv_entity_name           = iv_entity_name
            iv_entity_set_name       = iv_entity_set_name
            iv_source_name           = iv_source_name
            it_filter_select_options = it_filter_select_options
            is_paging                = is_paging
            it_key_tab               = it_key_tab
            it_navigation_path       = it_navigation_path
            it_order                 = it_order
            iv_filter_string         = iv_filter_string
            iv_search_string         = iv_search_string
            io_tech_request_context  = io_tech_request_context
          importing
            et_entityset             = et_entityset
            es_response_context      = es_response_context.
      catch /iwbep/cx_mgw_busi_exception .
      catch /iwbep/cx_mgw_tech_exception .
    endtry.
    sort et_entityset by vtweg.
    delete adjacent duplicates from et_entityset  comparing vtweg.
  endmethod.


  method checkmatlocked.
    data : lv_garg  type seqg3-garg,
           lv_subrc type sy-subrc,
           lt_enq   type table of seqg3,
           lv_matnr type mara-matnr.


    call function 'ENQUEUE_READ'
      exporting
        gclient               = sy-mandt
        guname                = '*'
        gname                 = 'MARA'
        garg                  = lv_garg
      importing
        subrc                 = lv_subrc
      tables
        enq                   = lt_enq
      exceptions
        communication_failure = 2
        others                = 1.
    if sy-subrc = 0.

    endif.
    loop at lt_enq into data(ls_enq).
      lv_matnr = ls_enq-garg+3(*).
      try .
          data(ls_entityset) = pt_entity[ product = lv_matnr ].
        catch cx_sy_itab_line_not_found.
      endtry.
      if ls_entityset is not initial.
        loop at  pt_entity assigning field-symbol(<f_line>) where product = lv_matnr.
          <f_line>-islocked =  abap_true.
          concatenate text-002 ls_enq-guname into <f_line>-errmsg separated by space.
        endloop.
        clear  ls_entityset.
      endif.
    endloop.
  endmethod.


  method clearerrormsg.

    loop at ct_data assigning field-symbol(<f_lineerror>).
      assign component 'ERRMESSAGE' of structure <f_lineerror> to field-symbol(<f_error>).
      if <f_error> is initial and sy-subrc eq 0.
        clear <f_lineerror>.
      endif.
    endloop.
  endmethod.


  METHOD contextitemsset_get_entityset.
    DATA   lv_idcont        TYPE /dlwupex/eidcont.

    TRY .
        lv_idcont = it_filter_select_options[ property = 'Id' ]-select_options[ 1 ]-low.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    SELECT * FROM /dlwupex/tcont_p
             INTO CORRESPONDING FIELDS OF TABLE et_entityset
             WHERE  id = lv_idcont.

  ENDMETHOD.


  method CONTEXTSTF4SET_GET_ENTITYSET.
   SELECT * FROM /DLWUPEX/CONSTF4 INTO CORRESPONDING FIELDS OF TABLE ET_ENTITYSET WHERE DDLANGUAGE = sy-langu.
  endmethod.


  method CONVERT_LAND_SPRAS.
      call function 'CONVERSION_EXIT_ISOLA_INPUT'
        exporting
          input            = IP_LAND1
        importing
          output           = ep_spras
        exceptions
          unknown_language = 1
          others           = 2.
      if sy-subrc <> 0.
* Implement suitable error handling here
      endif.
  endmethod.


  method fiaupdateset_get_entityset.
    data : lv_buid      type /dlwupex/ebusunitid,
           lv_varid     type /dlwupex/evariant,
           lv_tabname   type tabname16,
           ls_selfields type string,
           lv_matnr     type matnr,
           lt_entity    type /dlwupex/cl_productmas_mpc=>tt_fiaupdate,
           lt_entityout type /dlwupex/cl_productmas_mpc=>tt_fiaupdate,
           lv_ekorg     type ekorg,
           lv_vtweg     type vtweg,
           lr_exc       type ref to cx_root,
           lt_makt      type table of makt,
           lineid       type /dlwupex/elineid,
           lt_keys      type /dlwupex/tview_k_tt,
           lv_sort1     type string,
           lv_sort2     type string,
           lv_sort3     type string,
           lv_field     type string.


    field-symbols : <f_entity> type /dlwupex/cl_productmas_mpc=>ts_saleupdate.
    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
*Get WorkArea land
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    if sy-subrc eq 0.
      try .
          data(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
        catch cx_sy_itab_line_not_found.
      endtry.
      loop at  lt_range assigning field-symbol(<f_range>).
        <f_range>-option = 'CP'.
        concatenate '*' <f_range>-low into <f_range>-low.
      endloop.
      select vkorg,vtweg from /dlwupex/tbuoc
                         into table @data(lt_oa)
                         where id = @lv_buid.

*      loop at lt_oa into data(ls_oa).
      select * from eina
                    appending corresponding fields of table et_entityset
                    where matnr in lt_range
*                    and   loekz = ''
                    order by infnr .
*      endloop.

      .
      check sy-subrc eq 0.
      data(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
      select matnr maktx from makt
                     into corresponding fields of table lt_makt
                     where matnr in lt_range
                     and spras eq lv_spras.


*Get Mara miens
      select matnr,meins from mara
                   into  table @data(lt_mara)
                   where matnr in @lt_range.

      "  data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
      data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).
      check gcl_cockpit is bound.

*      delete lt_fields where tabname eq 'EINA'.
      loop at et_entityset  assigning field-symbol(<f_fia>).
        data(lt_fields) =  gcl_cockpit->gt_tvar_p .
        delete lt_fields where viewname ne '06'.
        delete lt_fields where tabname eq 'MARA'.
        delete lt_fields where tabname eq 'MAKT'.
        <f_fia>-work_area = lv_buid.
        <f_fia>-variant = lv_varid.
        <f_fia>-spras = lv_spras.
        <f_fia>-iseina = abap_true.
        <f_fia>-iseditoepneina = abap_true.
        <f_fia>-iseditoepneine = abap_false.
        <f_fia>-iseinadis = 'A'.
        check lt_makt[] is not initial.
        try .
            <f_fia>-maktx = lt_makt[ matnr = <f_fia>-matnr ]-maktx.
          catch cx_sy_itab_line_not_found.
        endtry.

        try .
            <f_fia>-marameins = lt_mara[ matnr = <f_fia>-matnr ]-meins.
          catch cx_sy_itab_line_not_found.
        endtry.

        append initial line to lt_entityout  assigning field-symbol(<f_fia2>).
        <f_fia2> = corresponding #( <f_fia> ).
        sort lt_fields by tabname.
        loop at lt_fields into data(ls_field) where tabname ne 'EINA'.
          clear ls_selfields.
          lv_tabname = ls_field-tabname.
          loop at lt_fields into data(ls_field2) where tabname = ls_field-tabname .
            concatenate ls_selfields ls_field2-fieldname into ls_selfields separated by space.
          endloop.
          clear lt_entity[].
*          append initial line to lt_entityout  assigning field-symbol(<f_fia2>).
*
          case  lv_tabname.
            when 'EINE'.
              concatenate 'ESOKZ' ls_selfields into ls_selfields separated by space.
              concatenate 'WERKS' ls_selfields into ls_selfields separated by space.
              select (ls_selfields) from (lv_tabname)
                             into corresponding fields of table lt_entity
                             where infnr =  <f_fia>-infnr.
*                             and  loekz = ''.
              sort lt_entity by infnr ekorg .
*              delete adjacent duplicates from lt_entity comparing infnr ekorg .
              loop at lt_entity into data(ls_entity) .
                append initial line to lt_entityout  assigning <f_fia2>.
                <f_fia2> = corresponding #( <f_fia> ).
                <f_fia2>-iseina = abap_false.
                <f_fia2>-iseditoepneina = abap_false.
                <f_fia2>-iseditoepneine = abap_true.
                <f_fia2>-iseinadis = 'E'.
                loop at lt_fields into ls_field2 ."where tabname = ls_field-tabname .
                  if ls_field2-tabname = ls_field-tabname .
                    assign component ls_field2-fieldname of structure <f_fia2> to field-symbol(<f_target>).
                    assign component ls_field2-fieldname of structure ls_entity to field-symbol(<f_source>).
                    <f_target> = <f_source>.
                  elseif ls_field2-tabname = 'EINA' and ls_field2-fieldname ne 'MATNR' and ls_field2-fieldname ne 'LIFNR'.
                    assign component ls_field2-fieldname of structure <f_fia2> to <f_target>.
                    clear <f_target>.
                  endif.
                endloop.
                assign component 'ESOKZ' of structure ls_entity to <f_source>.
                assign component  'ESOKZ'  of structure  <f_fia2> to <f_target>.
                <f_target> = <f_source>.
                assign component 'WERKS' of structure ls_entity to <f_source>.
                assign component  'WERKS'  of structure  <f_fia2> to <f_target>.
                <f_target> = <f_source>.
              endloop.
            when others.
          endcase.
          delete lt_fields where  tabname eq lv_tabname.
        endloop.
      endloop.
      if lt_entityout[] is not initial.
        et_entityset = corresponding #(  lt_entityout ).
      endif.
*Price

      delete gcl_cockpit->gt_tvar_p where tabname ne 'KONP'.
      clear ls_selfields .
      loop at  gcl_cockpit->gt_tvar_p into ls_field2 .
        concatenate ls_selfields ls_field2-fieldname into ls_selfields separated by space.
      endloop.
      concatenate 'KOPOS' ls_selfields into ls_selfields separated by space.
      loop at et_entityset assigning <f_fia>.
        lineid = lineid + 1.
        <f_fia>-lineid =   lineid.
*Price
        check <f_fia>-iseina eq abap_false.
        select single knumh,datbi,datab into @data(ls_knumhw)
                        from a018
                        where kappl = 'M'
                        and   kschl = 'PB00'
                        and   lifnr =    @<f_fia>-lifnr
                        and   matnr =   @<f_fia>-matnr
                        and   ekorg =  @<f_fia>-ekorg
                        and   esokz = '0'
                        and   datbi >= @sy-datum
                        and   datab <= @sy-datum.
        if sy-subrc eq 0.
          select single (ls_selfields) from (lv_tabname)
                     into corresponding fields of <f_fia>
                     where knumh = ls_knumhw-knumh and loevm_ko = ''.
          <f_fia>-knumh =  ls_knumhw-knumh.
          <f_fia>-datbi =  ls_knumhw-datbi.
          <f_fia>-datab =  ls_knumhw-datab.
        endif.
      endloop.

*Sort by key
*      call method gcl_cockpit->/dlwupex/if_cockpit_change_art~get_table_key
*        exporting
*          iv_viewname = '06'
*        importing
*          et_keys     = lt_keys.
*
*      delete lt_keys where keyfield = ''.
*      loop at lt_keys into data(ls_keys) where keyfield = abap_true.
*        check sy-tabix < 4.
*        lv_field = 'lv_sort' && sy-tabix.
*        assign (lv_field) to field-symbol(<f_field>).
*        <f_field> = ls_keys-fieldname.
*      endloop.
*      if lv_sort1 is initial .
*        lv_sort1 = 'MATNR'.
*      endif.
      sort et_entityset by matnr infnr iseinadis .

    endif.
  endmethod.


  method gendataupdateset_get_entityset.
    types: begin of ts_maritc.
             include type /sapsll/maritc.
             types: databb type /sapsll/datab,
           end of  ts_maritc.

    data : lv_buid      type /dlwupex/ebusunitid,
           lv_varid     type /dlwupex/evariant,
           lv_tabname   type tabname16,
           ls_selfields type string,
           lineid       type /dlwupex/elineid,
           lt_makt      type table of makt,
           lt_maritc    type table of ts_maritc,
           lt_maw1      type table of maw1,
           lt_mlan      type table of mlan,
           et_itab      type ref to data,
           lt_keys      type /dlwupex/tview_k_tt,
           lv_sort1     type string,
           lv_sort2     type string,
           lv_sort3     type string,
           lv_field     type string..

    field-symbols: <lt_itab>   type table.

    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
*Get WorkArea land
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    check sy-subrc eq 0.
    try .
        data(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
      catch cx_sy_itab_line_not_found.
    endtry.
    loop at  lt_range assigning field-symbol(<f_range>).
      <f_range>-option = 'CP'.
      concatenate '*' <f_range>-low into <f_range>-low.
    endloop.
    select * from mara
             into corresponding fields of table et_entityset
             where matnr in lt_range.
    check sy-subrc eq 0.
    data(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
    select matnr maktx from makt
                       into corresponding fields of table lt_makt
                       where matnr in lt_range
                       and spras eq lv_spras.

*Custo
    "data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
    data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).
    check gcl_cockpit is bound.
    data(lt_fields) =  gcl_cockpit->gt_tvar_p .
    delete lt_fields where viewname ne '01'.
    delete lt_fields where tabname eq 'MARA'.
    delete lt_fields where tabname eq 'MAKT'.
    sort lt_fields by tabname.

*/SAPSLL/MARITC
    loop at lt_fields into data(ls_field2) where tabname = '/SAPSLL/MARITC' .
      if ls_field2-fieldname = 'DATAB'.
        concatenate ls_selfields ls_field2-fieldname 'AS DATABB' into ls_selfields separated by space.
      else.
        concatenate ls_selfields ls_field2-fieldname into ls_selfields separated by space.
      endif.
    endloop.
    concatenate 'MATNR' ls_selfields into ls_selfields separated by space.
    select  (ls_selfields) from /sapsll/maritc
                           into corresponding fields of table lt_maritc
                           where matnr in lt_range
                           and   datab <= sy-datum
                           and   datbi >= sy-datum .
    delete lt_fields where tabname eq '/SAPSLL/MARITC'.


*MAW1
    clear ls_selfields.
    loop at lt_fields into ls_field2 where tabname = 'MAW1' .
      concatenate ls_selfields ls_field2-fieldname into ls_selfields separated by space.
    endloop.
    concatenate 'MATNR' ls_selfields into ls_selfields separated by space.
    select  (ls_selfields) from maw1
                           into corresponding fields of table lt_maw1
                           where matnr in lt_range.
    delete lt_fields where tabname eq 'MAW1'.


*MLAN
    clear ls_selfields.
    loop at lt_fields into ls_field2 where tabname = 'MLAN' .
      concatenate ls_selfields ls_field2-fieldname into ls_selfields separated by space.
    endloop.
    concatenate 'MATNR' ls_selfields into ls_selfields separated by space.
    select  (ls_selfields) from mlan
                           into corresponding fields of table lt_mlan
                           where matnr in lt_range
                           and aland = lv_land1.
    delete lt_fields where tabname eq 'MLAN'.


    loop at et_entityset  assigning field-symbol(<f_gdata>).
      if sy-tabix eq 5.
        <f_gdata>-stoff = 'Information'.
      else.
        <f_gdata>-stoff = 'None'.
      endif.
      try .
          data(ls_mlan) = lt_mlan[ matnr = <f_gdata>-matnr ].
        catch cx_sy_itab_line_not_found.
      endtry.
      if ls_mlan is not initial.
        move-corresponding  ls_mlan to <f_gdata>.
      endif.
      clear ls_mlan.
      try .
          data(ls_maritc) = lt_maritc[ matnr = <f_gdata>-matnr ].
        catch cx_sy_itab_line_not_found.
      endtry.
      if ls_maritc is not initial.
        data(lv_datab) = <f_gdata>-datab.
        move-corresponding ls_maritc to <f_gdata>.
        <f_gdata>-datab = lv_datab.
      endif.
      clear ls_maritc.

      try .
          data(ls_maw1) = lt_maw1[ matnr = <f_gdata>-matnr ].
        catch cx_sy_itab_line_not_found.
      endtry.
      if ls_maw1 is not initial.
        move-corresponding ls_maw1 to <f_gdata>.
      endif.
      clear ls_maw1.

      try .
          <f_gdata>-maktx = lt_makt[ matnr = <f_gdata>-matnr ]-maktx.
        catch cx_sy_itab_line_not_found.
      endtry.

      loop at lt_fields into data(ls_field).
        clear ls_selfields.
        lv_tabname = ls_field-tabname.
        loop at lt_fields into ls_field2 where tabname = ls_field-tabname .
          concatenate ls_selfields ls_field2-fieldname into ls_selfields separated by space.
        endloop.
        concatenate 'MATNR' ls_selfields into ls_selfields separated by space.

        select single (ls_selfields) from (lv_tabname) into corresponding fields of <f_gdata>
                              where matnr = <f_gdata>-matnr .

        unassign <lt_itab>.
      endloop.


      <f_gdata>-spras =  lv_spras.
      <f_gdata>-work_area = lv_buid.
      <f_gdata>-variant = lv_varid.
      lineid = lineid + 1.
      <f_gdata>-lineid =   lineid.
    endloop.
*Sort by key

    lv_sort1 = 'MATNR'.
    sort et_entityset by (lv_sort1) .
  endmethod.


  method getdynamicdata.

    data lv_data             type ref to data.

    field-symbols  : <ft_data> type any table,
                     <f_table> type any table,
                     <ft_data1>  type any table,
                     <ft_data2>  type any table,
                     <ft_data3>  type any table,
                     <ft_data4>  type any table,
                     <ft_data5>  type any table,
                     <ft_data6>  type any table,
                     <ft_data7>  type any table,
                     <ft_data8>  type any table,
                     <ft_data9>  type any table,
                     <ft_data10> type any table.

    case ip_view.
      when '01'.
        create data lv_data type standard table of /dlwupex/sgdataup.
        assign lv_data->* to <ft_data>.
        assign component 'GENDATAUPDATESET' of structure ct_data to <f_table>.
        check sy-subrc eq 0.
        <ft_data>[] =  <f_table>[].

      when '02'.

        create data lv_data type standard table of /dlwupex/sunitup.
        assign lv_data->* to <ft_data>.
        assign component 'UNITUPDATESET' of structure ct_data to <f_table>.
        check sy-subrc eq 0.
        <ft_data>[] =  <f_table>[].


      when '03'.

        create data lv_data type standard table of /dlwupex/scaractup.
        assign lv_data->* to <ft_data>.
        assign component 'CARACUPDATESET' of structure ct_data to <f_table>.
        check sy-subrc eq 0.
        <ft_data>[] =  <f_table>[].


      when '05'.

        create data lv_data type standard table of /dlwupex/slistup.
        assign lv_data->* to <ft_data>.
        assign component 'LISTUPDATESET' of structure ct_data to <f_table>.
        check sy-subrc eq 0.
        <ft_data>[] =  <f_table>[].


      when '06'.

        create data lv_data type standard table of /dlwupex/sfiaup.
        assign lv_data->* to <ft_data>.
        assign component 'FIAUPDATESET' of structure ct_data to <f_table>.
        check sy-subrc eq 0.
        <ft_data>[] =  <f_table>[].


      when '07'.

        create data lv_data type standard table of /dlwupex/sslistup.
        assign lv_data->* to <ft_data>.
        assign component 'SLISTUPDATESET' of structure ct_data to <f_table>.
        check sy-subrc eq 0.
        <ft_data>[] =  <f_table>[].


      when '08'.

        create data lv_data type standard table of /dlwupex/ssaleup.
        assign lv_data->* to <ft_data>.
        assign component 'SALEUPDATESET' of structure ct_data to <f_table>.
        check sy-subrc eq 0.
        <ft_data>[] =  <f_table>[].


      when '09'.

        create data lv_data type standard table of /dlwupex/slogdcup.
        assign lv_data->* to <ft_data>.
        assign component 'LOGDCUPDATESET' of structure ct_data to <f_table>.
        check sy-subrc eq 0.
        <ft_data>[] =  <f_table>[].


      when '10'.

        create data lv_data type standard table of /dlwupex/slogstoreup.
        assign lv_data->* to <ft_data>.
        assign component 'LOGSTOREUPDATESET' of structure ct_data to <f_table>.
        check sy-subrc eq 0.
*        <ft_data>[] =  <f_table>[].
         <ft_data>[] = corresponding #( <f_table>[] ).


      when others.
    endcase.
    ep_data = lv_data.
  endmethod.


  method getf4valuesset_get_entityset.

    types : begin of ty_s_condtab.
              include type hrcond.
            types : end of ty_s_condtab.
    types: begin of ty_s_clause.
    types:   line(72)  type c.
    types: end of ty_s_clause.
    types : begin of ltyp_atnam,
              atnam type cabn-atnam,
              atbez type cabnt-atbez,
              atfor type cabn-atfor,
              spras type cabnt-spras,
            end of   ltyp_atnam .
    data lt_atnam_tab type table of   ltyp_atnam.
    data lr_class_tab type range of klah-class.
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
           lv_reqid                 type /dlwupex/ereqid,
           lr_artkey                like range of ls_converted_keys-artkey,
           ls_artkey                like line of lr_artkey,
           lv_artkey                type matnr,
           lr_atinn                 like range of ls_converted_keys-atinn,
           ls_atinn                 like line of lr_atinn,
           lv_atinn                 type /dlwupex/eatinn,
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
           ls_entityset             type /dlwupex/cl_productmas_mpc=>ts_getf4values,
           lt_itab                  type ref to data,
           lt_itabtext              type ref to data,
           ls_condition             type string,
           ls_where                 type edpline,
           lt_where                 type table of edpline,
           lv_tabnam                type tabname16,
           lv_exist                 type xfeld,
           ls_tabfield_w            type rmdi_tabfld,
           lv_buid                  type /dlwupex/ebusunitid,
           lv_varid                 type /dlwupex/evariant,
           lv_lifnr                 type lifnr,
           indx1                    type sy-tabix value 100,
           indx2                    type sy-tabix.

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


    try .
        lv_viewname = it_filter_select_options[ property = 'ViewName' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_fieldname  = it_filter_select_options[ property = 'FieldName' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.

    try .
        lv_value  = it_filter_select_options[ property = 'Value' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_artkey  = it_filter_select_options[ property = 'ArtKey' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_atinn  = it_filter_select_options[ property = 'Atinn' ]-select_options[ 1 ]-low.
        if lv_atinn is not initial.
          call function 'CONVERSION_EXIT_ATINN_INPUT'
            exporting
              input  = lv_atinn
            importing
              output = lv_atinn.

        endif.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_buid  = it_filter_select_options[ property = 'Id' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid  = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    "   data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
    data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).
    check gcl_cockpit is bound.
    if  lv_fieldname  = '*'.


      data(gcl_cockpitcrea) = new /dlwupex/cl_cockpit_article( iv_bu = lv_buid   ).
      check gcl_cockpitcrea is bound.
      data(lt_fields) =  gcl_cockpit->gt_tvar_p .

      loop at lt_fields into data(ls_fields) where viewname = lv_viewname.
        clear  ls_entityset.
        lv_fieldname = ls_fields-fieldname.
        lv_tabnam    = ls_fields-tabname .
        if ls_fields-fieldname = 'TAXM1' or ls_fields-fieldname = 'CCNGN' or  ls_fields-fieldname = 'ZZ1_DANGEROSITE_SAL'
          or ls_fields-fieldname = 'ZZ1_DATEAVS_SAL' or ls_fields-fieldname = 'ZZ1_DATEMARCHE_SAL' or ls_fields-fieldname = 'ZZ1_ECHANTILLON_SAL'
          or ls_fields-fieldname = 'ZZ1_EMPILABLE_SAL'  or ls_fields-fieldname = 'ZZ1_FRAGILE_SAL'
          or ls_fields-fieldname = 'ZZ1_PSYCHO_SAL'  or ls_fields-fieldname = 'ZZ1_RETOURNABLE_SAL'
          or ls_fields-fieldname = 'ZZ1_RFA_SAL' or ls_fields-fieldname = 'ZZ1_SUPERPOSABLE_SAL' or ls_fields-fieldname = 'ZZ1_TOPECOMM_SAL'
          or ls_fields-fieldname = 'ZZ1_UVECOM_SAL' or ls_fields-fieldname = 'ZZ1_ZUO_ENTREE_PLT' or ls_fields-fieldname = 'ZZ1_ZUO_SORTIE_PLT'
          .
          ls_entityset-exist = abap_true.
        else.
          clear lv_exist.
          call method gcl_cockpitcrea->/dlwupex/if_cockpit_article~check_f4
            exporting
              iv_tabname  = lv_tabnam
              iv_tabfield = lv_fieldname
            importing
              ev_exist    = lv_exist.
          if lv_exist eq abap_true.
            ls_entityset-exist = abap_true.
          endif.
        endif.




        if  lv_tabnam  = '/SAPSLL/MARITC' and lv_fieldname = 'DATAB'.
          lv_fieldname = 'DATABB'.
        endif.

        ls_entityset-viewname = lv_viewname.
        ls_entityset-fieldname = lv_fieldname.
        append  ls_entityset to et_entityset.
      endloop.
    else.
      concatenate '%' lv_value '%' into lv_value.
      translate lv_fieldname to upper case .
      case lv_fieldname.
        when 'ATINN'.


          if lv_artkey is not initial.
            call function 'CONVERSION_EXIT_MATN1_INPUT'
              exporting
                input        = lv_artkey
              importing
                output       = lv_artkey
              exceptions
                length_error = 1
                others       = 2.
            if sy-subrc <> 0.
* Implement suitable error handling here
            endif.

            select single matkl from mara
                                into @data(lv_matkl)
                                where matnr = @lv_artkey.
            append initial line to  lr_class_tab assigning field-symbol(<f_class>).
            <f_class>-sign = 'I'.
            <f_class>-option = 'EQ'.
            <f_class>-low = lv_matkl.
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
            select single atwtb from cawnt into ls_entityset-desc where atinn  eq lv_atinn and atzhl = ls_cawn-atzhl and spras = sy-langu.
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
          select distinct ccngn from /sapsll/clsnr into table @data(lt_ccngn). "#EC CI_NOWHERE.
          loop at lt_ccngn into data(ls_ccngn).
            clear ls_entityset.
            ls_entityset-key = ls_ccngn-ccngn.
            select single text from /sapsll/clsnrt into  ls_entityset-desc where ccngn = ls_ccngn-ccngn and langu = sy-langu.
            append  ls_entityset to et_entityset.
          endloop.
        when 'REGIO'.
          data(lv_pays) = lv_atinn.
          select bland,bezei from t005u into table @data(lt_t005u) where land1 = @lv_pays and spras eq @sy-langu.
          loop at lt_t005u into data(ls_t005u).
            clear ls_entityset.
            ls_entityset-key = ls_t005u-bland.
            ls_entityset-desc = ls_t005u-bezei.
            append  ls_entityset to et_entityset.
          endloop.
        when 'LTSNR'.
          lv_lifnr = lv_atinn.
          lv_lifnr = |{ lv_lifnr alpha = in }|.
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
          elseif lv_fieldname =  'TAXM1'.
            lv_table = 'MARA'.
            lv_field = 'TAKLV'.
          else.
*            select single tabname from /dlwupex/tfields into  @data(lv_tabname)
*                                                   where viewname = @lv_viewname
*                                                   and   tabfield = @lv_fieldname
*                                                   and   actif    = 'Y'.

*   find table control
            lt_fields =  gcl_cockpit->gt_tvar_p .
            translate lv_fieldname to upper case.
            try .
                lv_table = lt_fields[ fieldname = lv_fieldname ]-tabname.
              catch cx_sy_itab_line_not_found.
            endtry.


*            lv_table = lv_tabname.
            lv_field = lv_fieldname.
          endif.



          call function 'F4IF_FIELD_VALUE_REQUEST'
            exporting
              tabname             = lv_table
              fieldname           = lv_field
              suppress_recordlist = 'X'
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
      condense lv_value  no-gaps.
      append initial line to  lr_valuefilter assigning field-symbol(<f_filervalue>).
      <f_filervalue>-sign = 'I'.
      <f_filervalue>-option = 'CP'.
      <f_filervalue>-low   = lv_value.
        try .
          data(lv_value2)  = it_filter_select_options[ property = 'Value' ]-select_options[ 2 ]-low.
        catch cx_sy_itab_line_not_found.
      endtry.
       if not ( lv_field = 'PRODH' and lv_table = 'MVKE' and lv_value2 eq 'F4' ).
         delete et_entityset where key not in lr_valuefilter.
      endif.
    endif.
    sort et_entityset by key.
    if lv_field eq 'TAXIM'.
      delete adjacent duplicates from et_entityset comparing key.
    endif.
    if lv_field = 'PRODH' and lv_table = 'MVKE'.

      check lv_value2 is initial.
      indx2 = lines( et_entityset ).
      if indx2 > indx1 and lv_value ne '**'.
        delete et_entityset from indx1 to indx2.
      endif.
    endif.



  endmethod.


  method GET_DYN_TABLE.
  endmethod.


  METHOD listupdateset_get_entityset.
    DATA : lv_buid      TYPE /dlwupex/ebusunitid,
           lv_varid     TYPE /dlwupex/evariant,
           lv_tabname   TYPE tabname16,
           ls_selfields TYPE string,
           lv_matnr     TYPE matnr,
           lt_entity    TYPE /dlwupex/cl_productmas_mpc=>tt_saleupdate,
           lt_entityout TYPE /dlwupex/cl_productmas_mpc=>tt_saleupdate,
           lv_vkorg     TYPE vkorg,
           lv_vtweg     TYPE vtweg,
           lr_exc       TYPE REF TO cx_root,
           lt_makt      TYPE TABLE OF makt,
           lrt_asort    TYPE RANGE OF asort,
           lrs_asort    LIKE LINE OF lrt_asort,
           lineid       TYPE /dlwupex/elineid.

    FIELD-SYMBOLS : <f_entity> TYPE /dlwupex/cl_productmas_mpc=>ts_listupdate.
    TRY .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
    TRY .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
*Get WorkArea land
    SELECT SINGLE land1 FROM /dlwupex/tbuhead INTO @DATA(lv_land1) WHERE id = @lv_buid .
    CHECK sy-subrc = 0.
*Get Gamme from OC of WorkArea
    REFRESH : lrt_asort.
    SELECT asort FROM /dlwupex/tbuoc INNER JOIN wrs1
      ON /dlwupex/tbuoc~vkorg = wrs1~vkorg
      INTO TABLE @DATA(lt_asort)
      WHERE id = @lv_buid .
    CHECK sy-subrc = 0.
    SORT lt_asort.
    DELETE ADJACENT DUPLICATES FROM lt_asort.
    lrs_asort-sign = 'I'.
    lrs_asort-option = 'EQ'.
    LOOP AT lt_asort ASSIGNING FIELD-SYMBOL(<fs_asort>).
      lrs_asort-low = <fs_asort>-asort.
      APPEND lrs_asort TO lrt_asort.
    ENDLOOP.
    REFRESH lt_asort.
    TRY .
        DATA(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
    LOOP AT  lt_range ASSIGNING FIELD-SYMBOL(<f_range>).
      <f_range>-option = 'CP'.
      CONCATENATE '*' <f_range>-low INTO <f_range>-low.
    ENDLOOP.
*Restrict select on Filia from WorkArea
    IF  lrt_asort IS NOT INITIAL.
      SELECT * FROM wlk1
               INTO CORRESPONDING FIELDS OF TABLE et_entityset
               WHERE filia IN lrt_asort
               AND  artnr IN lt_range
               AND  datbi >= sy-datum
               AND  strli NE 'X'.
    ELSE.
      SELECT * FROM wlk1
       INTO CORRESPONDING FIELDS OF TABLE et_entityset
       WHERE artnr IN lt_range
       AND  datbi >= sy-datum
       AND  strli NE 'X'.
    ENDIF.
    CHECK sy-subrc EQ 0.
    SORT et_entityset BY artnr filia.
    DATA(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
    SELECT matnr maktx FROM makt
                       INTO CORRESPONDING FIELDS OF TABLE lt_makt
                       WHERE matnr IN lt_range
                       AND spras EQ lv_spras.


    LOOP AT et_entityset ASSIGNING <f_entity> .
      lineid = lineid + 1.
      <f_entity>-lineid = lineid.
      <f_entity>-work_area = lv_buid.
      <f_entity>-variant = lv_varid.
      <f_entity>-spras = lv_spras.
      <f_entity>-matnr = <f_entity>-artnr.
      CHECK lt_makt[] IS NOT INITIAL.
      TRY .
          <f_entity>-maktx = lt_makt[ matnr = <f_entity>-artnr ]-maktx.
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
    ENDLOOP.
    SORT et_entityset BY artnr filia.
  ENDMETHOD.


  method logdcupdateset_get_entityset.
    data : lv_buid           type /dlwupex/ebusunitid,
           lv_varid          type /dlwupex/evariant,
           lv_tabname        type tabname16,
           ls_selfields(400) type c,
           lv_matnr          type matnr,
           lt_entity         type /dlwupex/cl_productmas_mpc=>tt_logstoreupdate,
           lt_entityout      type /dlwupex/cl_productmas_mpc=>tt_logstoreupdate,
           lv_vkorg          type vkorg,
           lv_vtweg          type vtweg,
           lr_exc            type ref to cx_root,
           lt_makt           type table of makt,
           lineid            type /dlwupex/elineid,
           lt_buoa           type   /dlwupex/tbuoa_tt,
           lt_buoc           type /dlwupex/tbuoc_tt,
           lt_werks          type table_werks,
           lt_keys           type /dlwupex/tview_k_tt,
           lv_sort1          type string,
           lv_sort2          type string,
           lv_sort3          type string,
           lv_field          type string,
           lt_usvalues       type table of usvalues,
           lr_werks_aut      type range of werks_d.



    types: begin of ts_werks.
    types: werks type werks_d,
           end of  ts_werks.
    data lr_werks type range of werks_d.

    field-symbols : <f_entity> type  /dlwupex/cl_productmas_mpc=>ts_logdcupdate.
    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
*Get WorkArea land
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    if sy-subrc eq 0.
      "   data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
      data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).
      check gcl_cockpit is bound.
      try .
          data(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
        catch cx_sy_itab_line_not_found.
      endtry.
      loop at  lt_range assigning field-symbol(<f_range>).
        <f_range>-option = 'CP'.
        concatenate '*' <f_range>-low into <f_range>-low.
      endloop.
      data(lt_fields) =  gcl_cockpit->gt_tvar_p .
      delete lt_fields where viewname ne '09'.
      delete lt_fields where tabname eq 'MARA'.
      delete lt_fields where tabname eq 'MAKT'.
      sort lt_fields by tabname.

*Description
      data(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
      select matnr maktx from makt
                         into corresponding fields of table lt_makt
                         where matnr in lt_range
                         and spras eq lv_spras.
*Get Struct Orga for BU
      call method gcl_cockpit->/dlwupex/if_cockpit_change_art~get_structure_orga
        importing
          et_buoa = lt_buoa
          et_buoc = lt_buoc.
      check lt_buoc[] is not initial.
      select werks as low from t001w
                          into corresponding fields of table lr_werks
                          for all entries in lt_buoc
                          where vlfkz = 'B'
                          and vkorg = lt_buoc-vkorg.
      "   and vtweg = lt_buoc-vtweg.
      select single vlgvz  from twpa into @data(lv_vlgvz).
      if sy-subrc eq 0.
        append initial line to lr_werks assigning field-symbol(<fr_werks>).
        <fr_werks>-low = lv_vlgvz.
      endif.
      loop at  lr_werks assigning field-symbol(<f_werks>).
        <f_werks>-option = 'EQ'.
        <f_werks>-sign   = 'I'.
      endloop.

*Read autorisation

      call function 'EFG_USER_AUTH_FOR_OBJ_GET'
        exporting
          x_client       = sy-mandt
          x_uname        = sy-uname
          x_object       = 'Z/DLWMAM/'
        tables
          yt_usvalues    = lt_usvalues
        exceptions
          user_not_found = 1
          not_authorized = 2
          internal_error = 3
          others         = 4.
      if sy-subrc <> 0.
* Implement suitable error handling here
      endif.

      loop at lt_usvalues into data(ls_usvalues) where field = 'WERKS'.
        append initial line to  lr_werks_aut assigning field-symbol(<f_werks_aut>).
        <f_werks_aut>-sign   = 'I'.
        <f_werks_aut>-low = ls_usvalues-von .
        if ls_usvalues-von cs '*'.
          <f_werks_aut>-option = 'CP'.
        elseif  ls_usvalues-bis is not initial .
          <f_werks_aut>-option = 'BT'.
          <f_werks_aut>-high = ls_usvalues-bis.
        else.
          <f_werks_aut>-option = 'EQ'.
        endif.
      endloop.
      check sy-subrc eq 0.
      select werks as low from t001w
                          into corresponding fields of table lr_werks_aut
                          where vlfkz = 'B'
                          and werks in lr_werks_aut.
      check lr_werks_aut[] is not initial.
      loop at lr_werks_aut assigning <f_werks_aut>.
        <f_werks_aut>-option = 'EQ'.
        <f_werks_aut>-sign   = 'I'.
      endloop.
      delete  lr_werks where low not in lr_werks_aut.
      check  lr_werks[] is not initial.


      loop at lt_fields into data(ls_field) where tabname eq 'MARC'.
        concatenate ls_selfields ls_field-fieldname into ls_selfields separated by space.
      endloop.
      select (ls_selfields) from nsdm_v_marc
                            into corresponding fields of table et_entityset
                            where matnr in lt_range
                            and   werks in lr_werks.
      call method gcl_cockpit->/dlwupex/if_cockpit_change_art~get_data_display
        importing
          et_werks = lt_werks.

      sort lt_makt by matnr.
      loop at et_entityset assigning <f_entity> .
        try .
            data(ls_werks) = lt_werks[ werks = <f_entity>-werks ].
          catch cx_sy_itab_line_not_found.
        endtry.
        if ls_werks is initial.
          <f_entity>-isedit = abap_true.
        endif.
        clear ls_werks.
        lineid = lineid + 1.
        <f_entity>-lineid = lineid.
        <f_entity>-work_area = lv_buid.
        <f_entity>-variant = lv_varid.
        <f_entity>-spras = lv_spras.
        check lt_makt[] is not initial.
        try .
            <f_entity>-maktx = lt_makt[ matnr = <f_entity>-matnr ]-maktx.
          catch cx_sy_itab_line_not_found.
        endtry.
        call function 'CONVERSION_EXIT_CUNIT_OUTPUT'
          exporting
            input          = <f_entity>-zz1_zuo_sortie_plt
            language       = sy-langu
          importing
            output         = <f_entity>-zz1_zuo_sortie_plt
          exceptions
            unit_not_found = 1
            others         = 2.
        if sy-subrc <> 0.
          "Implement suitable error handling here
        endif.
        call function 'CONVERSION_EXIT_CUNIT_OUTPUT'
          exporting
            input          = <f_entity>-zz1_zuo_entree_plt
            language       = sy-langu
          importing
            output         = <f_entity>-zz1_zuo_entree_plt
          exceptions
            unit_not_found = 1
            others         = 2.
        if sy-subrc <> 0.
          "Implement suitable error handling here
        endif.
      endloop.
    endif.
*Sort by key

    lv_sort1 = 'MATNR'.
    lv_sort2 = 'WERKS'.
    sort et_entityset by (lv_sort1) (lv_sort2) .
  endmethod.


  method LOGSTOREUPDATESE_GET_ENTITY.
 DATA: ls_salesorder TYPE bapi_epm_so_header,

        ls_key_tab    TYPE /iwbep/s_mgw_name_value_pair,

        lv_soid       TYPE bapi_epm_so_id.

*Get the key property values

  READ TABLE it_key_tab WITH KEY name = 'Werks' INTO ls_key_tab.

  er_entity-Werks = ls_key_tab-value.


  endmethod.


  method logstoreupdatese_get_entityset.
    data : lv_buid      type /dlwupex/ebusunitid,
           lv_varid     type /dlwupex/evariant,
           lv_tabname   type tabname16,
           ls_selfields type string,
           lv_matnr     type matnr,
           lt_entity    type /dlwupex/cl_productmas_mpc=>tt_logstoreupdate,
           lt_entityout type /dlwupex/cl_productmas_mpc=>tt_logstoreupdate,
           lv_vkorg     type vkorg,
           lv_vtweg     type vtweg,
           lr_exc       type ref to cx_root,
           lt_makt      type table of makt,
           lineid       type /dlwupex/elineid,
           lt_buoa      type   /dlwupex/tbuoa_tt,
           lt_buoc      type /dlwupex/tbuoc_tt,
           lt_werks     type table_werks,
           lt_usvalues  type table of usvalues,
           lr_werks_aut type range of werks_d.



    types: begin of ts_werks.
    types: werks type werks_d,
           end of  ts_werks.
    data lr_werks type range of werks_d.

    field-symbols : <f_entity> type  /dlwupex/cl_productmas_mpc=>ts_logstoreupdate.
    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
*Get WorkArea land
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    if sy-subrc eq 0.
      " data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
      data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).
      check gcl_cockpit is bound.
      try .
          data(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
        catch cx_sy_itab_line_not_found.
      endtry.
      loop at  lt_range assigning field-symbol(<f_range>).
        <f_range>-option = 'CP'.
        concatenate '*' <f_range>-low into <f_range>-low.
      endloop.
      data(lt_fields) =  gcl_cockpit->gt_tvar_p .
      delete lt_fields where viewname ne '10'.
      delete lt_fields where tabname eq 'MARA'.
      delete lt_fields where tabname eq 'MAKT'.
      sort lt_fields by tabname.
      data(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
      select matnr maktx from makt
                         into corresponding fields of table lt_makt
                         where matnr in lt_range
                         and spras eq lv_spras.
*Get Struct Orga for BU
      call method gcl_cockpit->/dlwupex/if_cockpit_change_art~get_structure_orga
        importing
          et_buoa = lt_buoa
          et_buoc = lt_buoc.
      check lt_buoc[] is not initial.


      select * from tvkov into table @data(lt_tvkov) .

      loop at lt_fields into data(ls_field) where tabname eq 'MARC'.
        concatenate 'NSDM_V_MARC~' ls_field-fieldname into data(lv_field) .
        concatenate ls_selfields lv_field into ls_selfields separated by space.
      endloop.
      concatenate ls_selfields 'T001W~VKORG'  into ls_selfields separated by space.
      concatenate  ls_selfields 'T001W~VTWEG' into ls_selfields separated by space.
      select (ls_selfields) from nsdm_v_marc inner join t001w on nsdm_v_marc~werks = t001w~werks
                            into corresponding fields of table et_entityset
         for all entries in lt_buoc
                            where matnr in lt_range
                            and   t001w~vlfkz = 'A'
                            and  t001w~werks in lr_werks
                            and   t001w~vkorg = lt_buoc-vkorg.




*Read autorisation
      call function 'EFG_USER_AUTH_FOR_OBJ_GET'
        exporting
          x_client       = sy-mandt
          x_uname        = sy-uname
          x_object       = 'Z/DLWMAM/'
        tables
          yt_usvalues    = lt_usvalues
        exceptions
          user_not_found = 1
          not_authorized = 2
          internal_error = 3
          others         = 4.
      if sy-subrc <> 0.
* Implement suitable error handling here
      endif.

      loop at lt_usvalues into data(ls_usvalues) where field = 'WERKS'.
        append initial line to  lr_werks_aut assigning field-symbol(<f_werks_aut>).
        <f_werks_aut>-sign   = 'I'.
        <f_werks_aut>-low = ls_usvalues-von .
        if ls_usvalues-von cs '*'.
          <f_werks_aut>-option = 'CP'.
        elseif  ls_usvalues-bis is not initial .
          <f_werks_aut>-option = 'BT'.
          <f_werks_aut>-high = ls_usvalues-bis.
        else.
          <f_werks_aut>-option = 'EQ'.
        endif.
      endloop.
      check sy-subrc eq 0.
      select werks as low from t001w
                          into corresponding fields of table lr_werks_aut
                          where vlfkz = 'A'
                          and werks in lr_werks_aut.
      if lr_werks_aut[] is initial.
        clear et_entityset[].
        exit.
      endif.
      loop at lr_werks_aut assigning <f_werks_aut>.
        <f_werks_aut>-option = 'EQ'.
        <f_werks_aut>-sign   = 'I'.
      endloop.
      loop at lt_tvkov into data(ls_tvkoaut) where vlgfi is not initial .
        append initial line to  lr_werks_aut assigning <f_werks_aut>.
        <f_werks_aut>-sign   = 'I'.
        <f_werks_aut>-low =  ls_tvkoaut-vlgfi .
        <f_werks_aut>-option = 'EQ'.
      endloop.
      delete  et_entityset where werks not in lr_werks_aut.
      check   et_entityset[] is not initial.

      call method gcl_cockpit->/dlwupex/if_cockpit_change_art~get_data_display
        importing
          et_werks = lt_werks.
      sort lt_makt by matnr.
      loop at et_entityset assigning <f_entity> .
        try .
            data(ls_werks) = lt_werks[ werks = <f_entity>-werks ].
          catch cx_sy_itab_line_not_found.
        endtry.
        if ls_werks is initial.
          <f_entity>-isedit = abap_true.
        endif.
        clear ls_werks.
        try .
            <f_entity>-parentid = lt_tvkov[ vkorg = <f_entity>-vkorg vtweg = <f_entity>-vtweg ]-vlgfi.
          catch cx_sy_itab_line_not_found.
        endtry.
        if  <f_entity>-parentid = <f_entity>-werks.
          clear <f_entity>-parentid .
        endif.

        lineid = lineid + 1.
        <f_entity>-lineid = lineid.

        <f_entity>-work_area = lv_buid.
        <f_entity>-variant = lv_varid.
        <f_entity>-spras = lv_spras.
        check lt_makt[] is not initial.
        try .
            <f_entity>-maktx = lt_makt[ matnr = <f_entity>-matnr ]-maktx.
          catch cx_sy_itab_line_not_found.
        endtry.
        call function 'CONVERSION_EXIT_CUNIT_OUTPUT'
          exporting
            input          = <f_entity>-zz1_zuo_sortie_plt
            language       = sy-langu
          importing
            output         = <f_entity>-zz1_zuo_sortie_plt
          exceptions
            unit_not_found = 1
            others         = 2.
        if sy-subrc <> 0.
          "Implement suitable error handling here
        endif.
        call function 'CONVERSION_EXIT_CUNIT_OUTPUT'
          exporting
            input          = <f_entity>-zz1_zuo_entree_plt
            language       = sy-langu
          importing
            output         = <f_entity>-zz1_zuo_entree_plt
          exceptions
            unit_not_found = 1
            others         = 2.
        if sy-subrc <> 0.
          "Implement suitable error handling here
        endif.
      endloop.
    endif.
    sort et_entityset by matnr parentid  werks .

  endmethod.


  method occdf4set_get_entityset.
    try.
        call method super->occdf4set_get_entityset
          exporting
            iv_entity_name           = iv_entity_name
            iv_entity_set_name       = iv_entity_set_name
            iv_source_name           = iv_source_name
            it_filter_select_options = it_filter_select_options
            is_paging                = is_paging
            it_key_tab               = it_key_tab
            it_navigation_path       = it_navigation_path
            it_order                 = it_order
            iv_filter_string         = iv_filter_string
            iv_search_string         = iv_search_string
            io_tech_request_context  = io_tech_request_context
          importing
            et_entityset             = et_entityset
            es_response_context      = es_response_context.
      catch /iwbep/cx_mgw_busi_exception .
      catch /iwbep/cx_mgw_tech_exception .
    endtry.
    sort et_entityset by vkorg.
    delete adjacent duplicates from et_entityset  comparing vkorg.
  endmethod.


  method orgaocset_get_entityset.
    data : lv_buid      type  /dlwupex/ebusunitid.
    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    select * from /dlwupex/tbuoa into  table @data(lt_buoa)
       where id = @lv_buid
       and ckp_modif = @abap_true.
    select * from /dlwupex/tbuoc into table @data(lt_buoc)
       where id = @lv_buid
       and ckp_modif = @abap_true.
    loop at lt_buoa into data(ls_buoa).
      append initial line to et_entityset assigning field-symbol(<f_entity>).
      <f_entity>-fieldname = 'Ekorg'.
      <f_entity>-value = ls_buoa-ekorg.
    endloop.
    loop at lt_buoc into data(ls_buoc).
      append initial line to et_entityset assigning <f_entity>.
      <f_entity>-fieldname = 'Saleorg'.
      <f_entity>-value = ls_buoc-vkorg.

      append initial line to et_entityset assigning <f_entity>.
      <f_entity>-fieldname = 'Dchanel'.
      <f_entity>-value = ls_buoc-vtweg.
    endloop.
*Bu Languge
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    check sy-subrc = 0.
    append initial line to et_entityset assigning <f_entity>.
    <f_entity>-fieldname = 'LAND'.
    <f_entity>-value = lv_land1.
  endmethod.


  METHOD prodeditset_get_entityset.
    TYPES : BEGIN OF ty_s_condtab.
              INCLUDE TYPE hrcond.
            TYPES : END OF ty_s_condtab.
    TYPES: BEGIN OF ty_s_clause.
    TYPES:   line(72)  TYPE c.
    TYPES: END OF ty_s_clause.
    DATA : lv_garg          TYPE seqg3-garg,
           lv_subrc         TYPE sy-subrc,
           lt_enq           TYPE TABLE OF seqg3,
           lv_buid          TYPE /dlwupex/ebusunitid,
           lv_varid         TYPE /dlwupex/evariant,
           lt_plant         TYPE werks_tty,
           lt_oa            TYPE wart_t_ekorg,
           lt_oc_cd         TYPE /dlwupex/oc_cd_tt,
           lv_rc            TYPE sysubrc,
           ls_msg           TYPE bapi_msg,
           lv_matnr         TYPE mara-matnr,
           ls_order_by      TYPE string,
           lv_id(12)        TYPE c,
           lv_idcont        TYPE /dlwupex/eidcont,
           lt_tech_order    TYPE /iwbep/t_mgw_tech_order,
           lt_otab          TYPE abap_sortorder_tab,
           ls_otab          TYPE abap_sortorder,
           ls_order         LIKE LINE OF it_order,
           gt_where_clauses TYPE STANDARD TABLE OF ty_s_clause WITH DEFAULT KEY,
           gt_condtab       TYPE STANDARD TABLE OF ty_s_condtab
                                    WITH DEFAULT KEY,
           gs_condtab       TYPE  ty_s_condtab,
           lv_matnrconv     TYPE matnr,
           lv_product       TYPE string,
           lt_split         TYPE TABLE OF char40,
           lt_entity        TYPE /dlwupex/cl_productmas_mpc=>tt_prodedit,
           itab_order       TYPE TABLE OF  char_72,
           wa_order         LIKE LINE OF   itab_order.

    CHECK it_filter_select_options IS NOT INITIAL.
    DATA(lv_filter_string) = iv_filter_string.
    TRY .
        lv_idcont = it_filter_select_options[ property = 'Errmsg' ]-select_options[ 1 ]-low.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF lv_idcont IS NOT INITIAL."Context management
      SELECT material AS product FROM /dlwupex/tcont_p
                                 INTO TABLE @DATA(lt_products)
                                 WHERE id = @lv_idcont.
      IF lt_products[] IS NOT INITIAL.
        SELECT * FROM iproductwd  INTO CORRESPONDING FIELDS OF TABLE  et_entityset
                                  FOR ALL ENTRIES IN lt_products
                                  WHERE product EQ lt_products-product. "#EC CI_NO_TRANSFORM
        me->checkmatlocked( CHANGING pt_entity =  et_entityset ).

        LOOP AT et_entityset ASSIGNING FIELD-SYMBOL(<f_entity>).
          <f_entity>-iserror = abap_true.
        ENDLOOP.

        EXIT.
      ENDIF.
    ENDIF.

    TRY .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
    TRY .
        lv_varid = it_filter_select_options[ property = 'Varid' ]-select_options[ 1 ]-low.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
    TRY .
        DATA(lr_atwrt) = it_filter_select_options[ property = 'Atwrt' ]-select_options.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    TRY .
        DATA(lr_range) = it_filter_select_options[ property = 'Atnam' ]-select_options.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    LOOP AT lr_range ASSIGNING FIELD-SYMBOL(<f_range>).

      CALL FUNCTION 'CONVERSION_EXIT_ATINN_INPUT'
        EXPORTING
          input  = <f_range>-low
        IMPORTING
          output = <f_range>-low.

    ENDLOOP.

*Get article
    DATA  lt_materials TYPE RANGE OF /dlwupex/caract-material.

    IF lr_range[] IS NOT INITIAL OR lr_atwrt[] IS NOT INITIAL.
      SELECT objek FROM ausp INTO TABLE @DATA(lt_objek)
                             WHERE atinn IN @lr_range
                             AND   klart = '026'
                             AND   atwrt IN @lr_atwrt
                          .
      IF sy-subrc EQ 0.
        LOOP AT lt_objek INTO DATA(ls_objek).
          APPEND INITIAL LINE TO lt_materials ASSIGNING FIELD-SYMBOL(<f_mat>).
          SELECT SINGLE  objek AS low FROM inob
                                  INTO <f_mat>-low
                                  WHERE cuobj = ls_objek-objek.
          <f_mat>-sign = 'I'.
          <f_mat>-option = 'EQ'.
          APPEND INITIAL LINE TO et_entityset ASSIGNING <f_entity>.
          <f_entity>-product = <f_mat>-low.
        ENDLOOP.
      ENDIF.
      IF lt_materials[] IS INITIAL.
        APPEND INITIAL LINE TO lt_materials ASSIGNING <f_mat>.
        <f_mat>-low = '##################'.
        <f_mat>-sign = 'I'.
        <f_mat>-option = 'EQ'.
      ENDIF.
    ENDIF.

    lv_id = sy-uname.
    IF lv_buid IS NOT INITIAL.
      DATA lv_land1 TYPE land1.
      SELECT SINGLE land1 FROM /dlwupex/tbuhead INTO lv_land1 WHERE id = lv_buid .
      EXPORT lv_land1 = lv_land1 TO DATABASE indx(ar) ID lv_id.

      SORT et_entityset BY product.
      DELETE ADJACENT DUPLICATES FROM et_entityset COMPARING  product.
      "  export lt_materials = lt_materials to database indx(ar) id lv_id.

      "  data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
      DATA(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).
      CHECK gcl_cockpit IS BOUND.
      TRY .
          DATA(lt_range) = it_filter_select_options[ property = 'Plant' ]-select_options.
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
      IF lt_range[] IS NOT INITIAL.
        SELECT werks FROM t001w INTO TABLE lt_plant
                                WHERE werks
                                IN lt_range.
      ENDIF.
      CLEAR lt_range[].
      TRY .
          lt_range = it_filter_select_options[ property = 'Ekorg' ]-select_options.
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
      IF lt_range[] IS NOT INITIAL.
        LOOP AT lt_range INTO DATA(ls_range).
          APPEND INITIAL LINE TO lt_oa ASSIGNING FIELD-SYMBOL(<f_oa>).
          <f_oa> = ls_range-low.
        ENDLOOP.
      ENDIF.
      CLEAR lt_range[].
      TRY .
          lt_range = it_filter_select_options[ property = 'Saleorg' ]-select_options.
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.

      TRY .
          DATA(lt_rangecd) = it_filter_select_options[ property = 'Dchanel' ]-select_options.
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.

      IF lt_range[] IS NOT INITIAL.
        LOOP AT lt_range INTO ls_range.
          APPEND INITIAL LINE TO lt_oc_cd ASSIGNING FIELD-SYMBOL(<f_oc>).
          <f_oc>-vkorg = ls_range-low.
          LOOP AT lt_rangecd INTO DATA(ls_rangecd).
            <f_oc>-vtweg = ls_rangecd-low.
          ENDLOOP.
        ENDLOOP.
      ELSE.
        LOOP AT lt_rangecd INTO ls_rangecd.
          APPEND INITIAL LINE TO lt_oc_cd ASSIGNING <f_oc>.
          <f_oc>-vtweg = ls_rangecd-low.
        ENDLOOP.
      ENDIF.

      CALL METHOD gcl_cockpit->/dlwupex/if_cockpit_change_art~check_authorization
        EXPORTING
          it_plant            = lt_plant
          it_oa               = lt_oa
          it_oc_cd            = lt_oc_cd
          iv_check_exist_only = abap_true
        CHANGING
          cv_msg              = ls_msg
          cv_rc               = lv_rc.

      " if  lv_rc ne 0.
      IF et_entityset[] IS INITIAL.
        APPEND INITIAL LINE TO et_entityset ASSIGNING <f_entity>.
        <f_entity>-subrc = lv_rc.
        <f_entity>-errmsg = ls_msg."text-001.
      ELSE.
        ASSIGN et_entityset[ 1 ] TO <f_entity>.
        <f_entity>-subrc = lv_rc.
      ENDIF.
*      else.
*        if et_entityset[] is initial.
*          append initial line to et_entityset assigning <f_entity>.
*          <f_entity>-subrc = lv_rc.
*        else.
*          assign et_entityset[ 1 ] to <f_entity>.
*          <f_entity>-subrc = lv_rc.
*        endif.
*      endif.
      EXIT.
    ENDIF.
    "  import  lt_materials = lt_materials from database indx(ar) id lv_id.





    CALL FUNCTION 'ENQUEUE_READ'
      EXPORTING
        gclient               = sy-mandt
        guname                = '*'
        gname                 = 'MARA'
        garg                  = lv_garg
      IMPORTING
        subrc                 = lv_subrc
      TABLES
        enq                   = lt_enq
      EXCEPTIONS
        communication_failure = 2
        OTHERS                = 1.
    IF sy-subrc = 0.

    ENDIF.



    IF iv_filter_string IS NOT INITIAL.
      if_sadl_gw_dpc_util~get_dpc( )->get_entityset( EXPORTING io_tech_request_context = io_tech_request_context
                                                     IMPORTING et_data                 = lt_entity
                                                              es_response_context     = es_response_context ).
      IF lt_entity[] IS NOT INITIAL.
        SELECT * FROM iproductwd  INTO CORRESPONDING FIELDS OF TABLE  et_entityset
                                 FOR ALL ENTRIES IN lt_entity
                                 WHERE product = lt_entity-product
                                 AND product IN lt_materials
                                 .

      ENDIF.

    ELSE.
      SELECT * FROM iproductwd  INTO CORRESPONDING FIELDS OF TABLE  et_entityset
                           WHERE product IN lt_materials.

    ENDIF.
*Bu designation fro product
    IF et_entityset[] IS NOT INITIAL.
      IMPORT lv_land1 = lv_land1 FROM DATABASE indx(ar) ID lv_id.
      DATA(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
      SELECT product,productdescription FROM iprddescrwd
                                        INTO TABLE @DATA(lt_iprddescrwd)
                                        FOR ALL ENTRIES IN @et_entityset
                                        WHERE product = @et_entityset-product
                                        AND    language = @lv_spras. "#EC CI_NO_TRANSFORM
      LOOP AT et_entityset ASSIGNING FIELD-SYMBOL(<f_budesc>).
        TRY .
            <f_budesc>-productdescription = lt_iprddescrwd[ product = <f_budesc>-product ]-productdescription .
          CATCH cx_sy_itab_line_not_found.
        ENDTRY.

      ENDLOOP.
    ENDIF.


    lt_tech_order = io_tech_request_context->get_orderby( ).
    LOOP AT lt_tech_order INTO DATA(ls_tech_order).
      ls_otab-name = ls_tech_order-property.
      CASE ls_tech_order-order.
        WHEN 'asc'.
          ls_otab-descending = abap_false.
        WHEN 'desc'.
          ls_otab-descending = abap_true.
        WHEN OTHERS.
      ENDCASE.
      APPEND ls_otab TO lt_otab.
    ENDLOOP.
    SORT et_entityset BY (lt_otab).


    LOOP AT lt_enq INTO DATA(ls_enq).
      lv_matnr = ls_enq-garg+3(*).
      TRY .
          DATA(ls_entityset) = et_entityset[ product = lv_matnr ].
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
      IF ls_entityset IS NOT INITIAL.
        LOOP AT  et_entityset ASSIGNING FIELD-SYMBOL(<f_line>) WHERE product = lv_matnr.
          <f_line>-islocked =  abap_true.
          CONCATENATE TEXT-002 ls_enq-guname INTO <f_line>-errmsg SEPARATED BY space.
        ENDLOOP.
        CLEAR  ls_entityset.
      ENDIF.
    ENDLOOP.
*  sort et_entityset by product.
*    clear lt_materials[].
*    export lt_materials = lt_materials to database indx(ar) id lv_id.
  ENDMETHOD.


  method saleupdateset_get_entityset.
    data : lv_buid      type /dlwupex/ebusunitid,
           lv_varid     type /dlwupex/evariant,
           lv_tabname   type tabname16,
           ls_selfields type string,
           lv_matnr     type matnr,
           lt_entity    type /dlwupex/cl_productmas_mpc=>tt_saleupdate,
           lt_entityout type /dlwupex/cl_productmas_mpc=>tt_saleupdate,
           lv_vkorg     type vkorg,
           lv_vtweg     type vtweg,
           lr_exc       type ref to cx_root,
           lineid       type /dlwupex/elineid,
           lt_makt      type table of makt,
           lt_keys      type /dlwupex/tview_k_tt,
           lv_sort1     type string,
           lv_sort2     type string,
           lv_sort3     type string,
           lv_field     type string.

    field-symbols : <f_entity> type /dlwupex/cl_productmas_mpc=>ts_saleupdate.
    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
*Get WorkArea land
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    if sy-subrc eq 0.
      try .
          data(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
        catch cx_sy_itab_line_not_found.
      endtry.
      loop at  lt_range assigning field-symbol(<f_range>).
        <f_range>-option = 'CP'.
        concatenate '*' <f_range>-low into <f_range>-low.
      endloop.
      select vkorg,vtweg from /dlwupex/tbuoc
                         into table @data(lt_oa)
                         where id = @lv_buid
                         and   ckp_modif = @abap_true.



      check lt_oa[] is not initial.
      select * from mvke
                     into corresponding fields of table et_entityset
                     for all entries in lt_oa
                     where matnr in lt_range
                     and vkorg = lt_oa-vkorg
                     and vtweg = lt_oa-vtweg.      "#EC CI_NO_TRANSFORM



*Description
      data(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
      select matnr maktx from makt
                      into corresponding fields of table lt_makt
                      where matnr in lt_range
                      and spras eq lv_spras.

      .
      check sy-subrc eq 0.
      data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
      check gcl_cockpit is bound.
      loop at et_entityset  assigning field-symbol(<f_sale>).
        call function 'CONVERSION_EXIT_CUNIT_OUTPUT'
          exporting
            input          = <f_sale>-zz1_uvecom_sal
            language       = sy-langu
          importing
            output         = <f_sale>-zz1_uvecom_sal
          exceptions
            unit_not_found = 1
            others         = 2.
        if sy-subrc <> 0.
          "Implement suitable error handling here
        endif.
        clear : lv_vkorg, lv_vtweg.
        data(lt_fields) =  gcl_cockpit->gt_tvar_p .
        delete lt_fields where viewname ne '08'.
        delete lt_fields where tabname eq 'MARA'.
        delete lt_fields where tabname eq 'MAKT'.
        delete lt_fields where tabname eq 'MVKE'.
        sort lt_fields by tabname.
        lv_matnr =  <f_sale>-matnr .

        try .
            <f_sale>-maktx = lt_makt[ matnr = <f_sale>-matnr ]-maktx.
          catch cx_sy_itab_line_not_found.
        endtry.
*

        <f_sale>-work_area = lv_buid.
        <f_sale>-variant = lv_varid.
        <f_sale>-spras = lv_spras.

        loop at lt_fields into data(ls_field).
          clear ls_selfields.
          lv_tabname = ls_field-tabname.
          loop at lt_fields into data(ls_field2) where tabname = ls_field-tabname .
            concatenate ls_selfields ls_field2-fieldname into ls_selfields separated by space.
          endloop.
          clear lt_entity[].
          case  lv_tabname.

            when 'WLK2'.
              sort  lt_entityout by matnr vkorg vtweg.
              concatenate 'MATNR' ls_selfields into ls_selfields separated by space.
              concatenate 'VKORG' ls_selfields into ls_selfields separated by space.
              concatenate 'VTWEG' ls_selfields into ls_selfields separated by space.
              select (ls_selfields) from (lv_tabname)
                             into corresponding fields of table lt_entity
                             where matnr = lv_matnr
                              and  vkorg = <f_sale>-vkorg
                              and   vtweg = <f_sale>-vtweg.
              sort lt_entity by matnr vkorg vtweg.
              loop at lt_entity into data(ls_entity) .
                if lv_vkorg = ls_entity-vkorg and lv_vtweg = ls_entity-vtweg.
                  append initial line to lt_entityout  assigning field-symbol(<f_sale2>).

                  read table  lt_entityout assigning field-symbol(<f_sale3>)
                                       with  key  matnr = ls_entity-matnr
                                                  vkorg = ls_entity-vkorg
                                                  vtweg = ls_entity-vtweg.
                  if sy-subrc eq 0.
                    <f_sale2> = corresponding #( <f_sale3> ).
                  endif.
                else.
                  read table  lt_entityout assigning <f_sale2>
                                       with  key  matnr = ls_entity-matnr
                                                  vkorg = ls_entity-vkorg
                                                  vtweg = ls_entity-vtweg.

                  if sy-subrc ne 0.
                    append initial line to lt_entityout  assigning <f_sale2>.
                    <f_sale2> = corresponding #( <f_sale> ).
                  endif.
                endif.


                loop at lt_fields into ls_field2 where tabname = ls_field-tabname .
                  assign component ls_field2-fieldname of structure <f_sale2> to field-symbol(<f_target>).
                  assign component ls_field2-fieldname of structure ls_entity to field-symbol(<f_source>).
                  <f_target> = <f_source>.
                endloop.
                <f_target> = <f_source>.
                lv_vkorg = ls_entity-vkorg.
                lv_vtweg = ls_entity-vtweg.
              endloop.
            when 'KONP'.
              concatenate 'KOPOS' ls_selfields into ls_selfields separated by space.
              select single meins from mara into @data(lv_meins) where matnr = @<f_sale>-matnr.
              <f_sale>-marameins = lv_meins.

              select single wvrkm from maw1 into @data(lv_vrkme) where matnr = @<f_sale>-matnr.
              if not ( sy-subrc eq 0 and lv_vrkme is not initial ).
                lv_vrkme = lv_meins.
              endif.

              select single knumh into @data(lv_knumhw)
                     from a073
                     where kappl = 'V'
                     and   kschl = 'PR00'
                     and   vkorg = @<f_sale>-vkorg
                     and   vtweg = @<f_sale>-vtweg
                     and   matnr =  @<f_sale>-matnr
                     and   vrkme =  @lv_vrkme
                     and   datbi >= @sy-datum
                     and   datab <= @sy-datum.
              if sy-subrc eq 0.
                select single (ls_selfields) from (lv_tabname)
                           into corresponding fields of <f_sale>
                           where knumh = lv_knumhw and loevm_ko = ''.
                <f_sale>-knumh = lv_knumhw.
              endif.
            when others.
          endcase.
          delete lt_fields where  tabname eq lv_tabname.
        endloop.

      endloop.
      if lt_entityout[] is not initial.
        et_entityset = corresponding #(  lt_entityout ).
      endif.
    endif.
    sort et_entityset by matnr vkorg vtweg.
    loop at et_entityset assigning <f_sale>.
      lineid = lineid + 1.
      <f_sale>-lineid =   lineid.
      if <f_sale>-zz1_datemarche_sal = '' . <f_sale>-zz1_datemarche_sal = '00000000'.endif.
    endloop.


    lv_sort1 = 'MATNR'.
    lv_sort2 = 'VKORG'.
    lv_sort3 = 'VTWEG'.
    sort et_entityset by (lv_sort1) (lv_sort2) (lv_sort3).
  endmethod.


  method sh_articlecatego_get_entityset.

  data(lv_filter) = '%' && iv_search_string  && '%'.
    select domvalue_l as articlecategory ddtext as desc from dd07t into table et_entityset
                 where domname = 'ATTYP'
                   and as4local = 'A'
                   and ddlanguage = sy-langu
                   and  domvalue_l  like lv_filter.
  endmethod.


  method sh_baseunitset_get_entityset.
     data(lv_filter) = '%' && iv_search_string  && '%'.
    select distinct msehi as baseunit from t006
                                       into corresponding fields of table et_entityset
                                       WHERE msehi like lv_filter.
                 .
  endmethod.


  method sh_grosstset_get_entityset.
    data(lv_filter) = '%' && iv_search_string  && '%'.
    select mmsta as crossplantstatus mtstb as desc
                 from t141t into table et_entityset
                 where spras = sy-langu
                 and ( mtstb like lv_filter or mmsta like lv_filter ).
  endmethod.


  method sh_pbindset_get_entityset.
    data(lv_filter) = '%' && iv_search_string  && '%'.
    select domvalue_l as pbind ddtext as desc from dd07t into table et_entityset
                 where domname = 'PBIND'
                   and as4local = 'A'
                   and ddlanguage = sy-langu
                   and  domvalue_l  like lv_filter.
  endmethod.


  method sh_pflksset_get_entityset.
    data(lv_filter) = iv_search_string(1).
    data(lv_filterdes) = '%' && iv_search_string  && '%'.
    select pflks  vtext as desc
                 from twspt into table et_entityset
                 where spras = sy-langu
                 and ( pflks like lv_filter or  vtext like lv_filterdes ).
  endmethod.


  method SH_PRDHIASET_GET_ENTITYSET.
    data(lv_filter) = '%' && IV_SEARCH_STRING  && '%'.
    SELECT PRODH as Prodh VTEXT as desc
                 FROM T179T INto TABLE ET_ENTITYSET
                 WHERE SPRAS = sy-langu
                 and ( VTEXT LIKE lv_filter or Prodh like lv_filter ).
  endmethod.


  method sh_prdtypeset_get_entityset.
    data(lv_filter) = '%' && IV_SEARCH_STRING  && '%'.
    select mtart as producttype MTBEZ
                      as desc from t134t
                      into TABLE ET_ENTITYSET
                      WHERE spras = sy-langu
                      and ( mtart like lv_filter or MTBEZ like lv_filter ).

  endmethod.


  method sh_productgroups_get_entityset.
     data(lv_filter) = '%' && iv_search_string  && '%'.
    select matkl as productgroup wgbez as desc from t023t into table et_entityset
                  where  spras = sy-langu
                   and ( matkl  like lv_filter or wgbez like lv_filter ) .
  endmethod.


  method sh_rndprset_get_entityset.
    data(lv_filter) = '%' && iv_search_string  && '%'.
    select rdprf  as rndpr text40 as desc
                 from rdtx into table et_entityset
                 where spras = sy-langu
                 and ( rdprf like lv_filter or text40 like lv_filter ).
  endmethod.


  method sh_vmstaset_get_entityset.
    data(lv_filter) = '%' && iv_search_string  && '%'.
    select vmsta vmstb as desc
                 from tvmst into table et_entityset
                 where spras = sy-langu
                 and ( vmsta like lv_filter or vmstb like lv_filter ).
  endmethod.


  method sh_zz1dangerosit_get_entityset.
    data(lv_filter) = '%' && iv_search_string  && '%'.
    select code as zz1dangerositesal description as desc
                 from zz1_c1bc758cdc9e into table et_entityset
                 where language = sy-langu
                 and ( code like lv_filter or description like lv_filter ).
  endmethod.


  method sh_zz1topecommsa_get_entityset.
    data(lv_filter) = '%' && iv_search_string  && '%'.
    select code as zz1topecommsal description as desc
                 from zz1_a811abfbc228 into table et_entityset
                 where language = sy-langu
                 and ( code like lv_filter or description like lv_filter ).
  endmethod.


  method SH_ZZ1UVECOMSALS_GET_ENTITYSET.
   data(lv_filter) = '%' && iv_search_string  && '%'.
    select distinct msehi as Zz1UvecomSal from t006
                                       into corresponding fields of table et_entityset
                                       WHERE msehi like lv_filter.
  endmethod.


  method SH_ZZ1ZCIRCUIT01_GET_ENTITYSET.
    data(lv_filter) = '%' && iv_search_string  && '%'.
    select code as zz1zstockageplt description as desc
                 from ZZ1_EE144A30695A into table et_entityset
                 where language = sy-langu
                 and ( code like lv_filter or description like lv_filter ).
  endmethod.


  method SH_ZZ1ZCIRCUITST_GET_ENTITYSET.
data(lv_filter) = '%' && iv_search_string  && '%'.
    select code as zz1zstockageplt description as desc
                 from ZZ1_25A0CCAA4B30 into table et_entityset
                 where language = sy-langu
                 and ( code like lv_filter or description like lv_filter ).


  endmethod.


  method SH_ZZ1ZPALETTEPL_GET_ENTITYSET.
  data(lv_filter) = '%' && iv_search_string  && '%'.
    select code as zz1zstockageplt description as desc
                 from ZZ1_0396EE2E85E1 into table et_entityset
                 where language = sy-langu
                 and ( code like lv_filter or description like lv_filter ).
  endmethod.


  method sh_zz1zstockagep_get_entityset.
    data(lv_filter) = '%' && iv_search_string  && '%'.
    select code as zz1zstockageplt description as desc
                 from zz1_ed6847bb5b6b into table et_entityset
                 where language = sy-langu
                 and ( code like lv_filter or description like lv_filter ).
  endmethod.


  method slistupdateset_get_entityset.
    data : lv_buid      type /dlwupex/ebusunitid,
           lv_varid     type /dlwupex/evariant,
           lv_tabname   type tabname16,
           ls_selfields type string,
           lv_matnr     type matnr,
           lt_entity    type /dlwupex/cl_productmas_mpc=>tt_saleupdate,
           lt_entityout type /dlwupex/cl_productmas_mpc=>tt_saleupdate,
           lv_vkorg     type vkorg,
           lv_vtweg     type vtweg,
           lr_exc       type ref to cx_root,
           lt_makt      type table of makt,
           lineid       type /dlwupex/elineid.

    field-symbols : <f_entity> type /dlwupex/cl_productmas_mpc=>ts_slistupdate.
    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
*Get WorkArea land
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    check sy-subrc = 0.
    try .
        data(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
      catch cx_sy_itab_line_not_found.
    endtry.
    loop at  lt_range assigning field-symbol(<f_range>).
      <f_range>-option = 'CP'.
      concatenate '*' <f_range>-low into <f_range>-low.
    endloop.
    select * from eord
             into corresponding fields of table et_entityset
             where matnr in lt_range.
    check sy-subrc eq 0.
    sort et_entityset by matnr werks.
    data(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
    select matnr maktx from makt
                       into corresponding fields of table lt_makt
                       where matnr in lt_range
                       and spras eq lv_spras.
    loop at et_entityset assigning <f_entity> .
      <f_entity>-work_area = lv_buid.
      <f_entity>-variant = lv_varid.
      <f_entity>-spras = lv_spras.
      lineid = lineid + 1.
      <f_entity>-lineid = lineid.
      check lt_makt[] is not initial.
      try .
          <f_entity>-maktx = lt_makt[ matnr = <f_entity>-matnr ]-maktx.
        catch cx_sy_itab_line_not_found.
      endtry.
    endloop.
    sort et_entityset by matnr werks.
  endmethod.


  method tcproductset_get_entityset.
    try.
        call method super->tcproductset_get_entityset
          exporting
            iv_entity_name           = iv_entity_name
            iv_entity_set_name       = iv_entity_set_name
            iv_source_name           = iv_source_name
            it_filter_select_options = it_filter_select_options
            is_paging                = is_paging
            it_key_tab               = it_key_tab
            it_navigation_path       =  it_navigation_path
            it_order                 = it_order
            iv_filter_string         = iv_filter_string
            iv_search_string         = iv_search_string
            io_tech_request_context  = io_tech_request_context
          importing
            et_entityset             = et_entityset
            es_response_context      = es_response_context.
      catch /iwbep/cx_mgw_busi_exception .
      catch /iwbep/cx_mgw_tech_exception .
    endtry.
*    loop at et_entityset assigning field-symbol(<f_entity>).
*      select single maktx into <f_entity>-productdescription
*                          from makt
*                          where matnr eq <f_entity>-product
*                          and spras eq sy-langu.
*    endloop.
  endmethod.


  method unitupdateset_get_entityset.
    data : lv_buid      type /dlwupex/ebusunitid,
           lv_varid     type /dlwupex/evariant,
           lv_tabname   type tabname16,
           ls_selfields type string,
           lv_matnr     type matnr,
           lt_entity    type /dlwupex/cl_productmas_mpc=>tt_unitupdate,
           lt_entityout type /dlwupex/cl_productmas_mpc=>tt_unitupdate,
           lv_meinh     type meinh,
           lineid       type /dlwupex/elineid,
           lt_makt      type table of makt,
           lt_marm      type table of marm,
           lt_mean      type table of mean,
           lt_keys      type /dlwupex/tview_k_tt,
           lv_sort1     type string,
           lv_sort2     type string,
           lv_sort3     type string,
           lv_field     type string.


    field-symbols : <f_entity> type /dlwupex/cl_productmas_mpc=>ts_unitupdate.
    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
*Get WorkArea land
    select single land1 from /dlwupex/tbuhead into @data(lv_land1) where id = @lv_buid .
    if sy-subrc eq 0.
      try .
          data(lt_range) = it_filter_select_options[ property = 'Matnr' ]-select_options.
        catch cx_sy_itab_line_not_found.
      endtry.
      loop at  lt_range assigning field-symbol(<f_range>).
        <f_range>-option = 'CP'.
        concatenate '*' <f_range>-low into <f_range>-low.
      endloop.
      select * from mara
               into corresponding fields of table et_entityset
               where matnr in lt_range.
      check sy-subrc eq 0.

      data(lv_spras) = me->convert_land_spras( ip_land1 = lv_land1 ).
      select matnr maktx from makt
                   into corresponding fields of table lt_makt
                   where matnr in lt_range
                   and spras eq lv_spras.


      data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).
      check gcl_cockpit is bound.

      loop at et_entityset  assigning field-symbol(<f_unit>).
        data(lt_fields) =  gcl_cockpit->gt_tvar_p .
        delete lt_fields where viewname ne '02'.
        delete lt_fields where tabname eq 'MARA'.
        delete lt_fields where tabname eq 'MAKT'.
        sort lt_fields by tabname.
        lv_matnr =  <f_unit>-matnr .
        clear lv_meinh.
        loop at lt_fields into data(ls_field).
          clear ls_selfields.
          lv_tabname = ls_field-tabname.
          loop at lt_fields into data(ls_field2) where tabname = ls_field-tabname .
            concatenate ls_selfields ls_field2-fieldname into ls_selfields separated by space.
          endloop.
          clear lt_entity[].

          case  lv_tabname.
            when 'MARM'.
              concatenate 'MATNR' ls_selfields into ls_selfields separated by space.
              select (ls_selfields) from (lv_tabname)
                               into corresponding fields of table lt_entity
                               where matnr = lv_matnr.
              loop at lt_entity into data(ls_entity) .
                try .
                    data(ls_entityout) = lt_entityout[ matnr = ls_entity-matnr meinh = ls_entity-meinh ].
                  catch cx_sy_itab_line_not_found.
                endtry.
                if ls_entityout is initial.
                  append initial line to lt_entityout  assigning field-symbol(<f_unit2>).
                endif.
*                clear ls_entityout.
                <f_unit2> = corresponding #( <f_unit> ).
                <f_unit2> = corresponding #( ls_entity ).

                try .
                    data(lv_maktx) = lt_makt[ matnr = <f_unit2>-matnr ]-maktx.
                  catch cx_sy_itab_line_not_found.
                endtry.
                <f_unit2>-maktx = lv_maktx.
                <f_unit2>-work_area = lv_buid.
                <f_unit2>-variant = lv_varid.
              endloop.
            when 'MEAN'.
              concatenate 'MATNR' ls_selfields into ls_selfields separated by space.
              concatenate 'MEINH' ls_selfields into ls_selfields separated by space.
              concatenate 'LFNUM' ls_selfields into ls_selfields separated by space.

              select (ls_selfields) from (lv_tabname)
                             into corresponding fields of table lt_entity
                             where matnr = lv_matnr.
              sort lt_entity by matnr meinh.
              loop at lt_entity into ls_entity .
                if lv_meinh = ls_entity-meinh.
                  append initial line to lt_entityout  assigning <f_unit2>.
                  read table  lt_entityout assigning field-symbol(<f_unit3>)
                                       with  key  matnr = ls_entity-matnr
                                                  meinh = ls_entity-meinh.
                  if sy-subrc eq 0.
                    <f_unit2> = corresponding #( <f_unit3> ).
                  endif.
                else.
                  read table  lt_entityout assigning <f_unit2>
                                       with  key  matnr = ls_entity-matnr
                                                  meinh = ls_entity-meinh.

                  if sy-subrc ne 0.
                    append initial line to lt_entityout  assigning <f_unit2>.
                    <f_unit2> = corresponding #( <f_unit> ).
                  endif.
                endif.
                loop at lt_fields into ls_field2 where tabname = ls_field-tabname .
                  assign component ls_field2-fieldname of structure <f_unit2> to field-symbol(<f_target>).
                  assign component ls_field2-fieldname of structure ls_entity to field-symbol(<f_source>).
                  <f_target> = <f_source>.
                endloop.
                assign component 'LFNUM' of structure ls_entity to <f_source>.
                assign component 'LFNUM'  of structure <f_unit2> to <f_target>.
                <f_target> = <f_source>.
                lv_meinh = ls_entity-meinh.
              endloop.
            when others.
          endcase.
          delete lt_fields where  tabname eq lv_tabname.
        endloop.
      endloop.
      et_entityset = corresponding #(  lt_entityout ).
      loop at et_entityset assigning <f_unit>.
        lineid = lineid + 1.
        <f_unit>-lineid =   lineid.
      endloop.
*Sort by key

      lv_sort1 = 'MATNR'.
      lv_sort2 = 'MEINH'.
      sort et_entityset by (lv_sort1) (lv_sort2) .
    endif.
  endmethod.


  method varfieldsset_get_entityset.
    data : lv_buid  type /dlwupex/ebusunitid,
           lv_varid type /dlwupex/evariant.

    types: begin of ts_viewname.
    types: viewname type /dlwupex/eviewname,
           end of  ts_viewname.
    data lt_viewname type table of ts_viewname.
    data lt_entity type /dlwupex/cl_productmas_mpc=>tt_varfields.
    data lt_entity2 type /dlwupex/cl_productmas_mpc=>tt_varfields.


    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    try .
        lv_varid = it_filter_select_options[ property = 'Variant' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.




    if lv_buid is not initial and  lv_varid  is not initial.
      " data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
      data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).
      check gcl_cockpit is bound.
      et_entityset = corresponding #( gcl_cockpit->gt_tvar_p ).
      sort et_entityset by dposition.
    endif.

    read table et_entityset with  key tabname = '/SAPSLL/MARITC'
                                      fieldname = 'DATAB'
                           assigning field-symbol(<f_field>).

    if  <f_field>  is assigned .
      <f_field>-fieldname = 'DATABB'.
    endif.
*    select viewname,insert_line into table @data(lt_insert)
*                              from /dlwupex/tvar_in
*                              where variant = @lv_varid.
    loop at gcl_cockpit->gt_tvar_in into data(ls_insert).
      loop at et_entityset assigning field-symbol(<f_entity>) where viewname = ls_insert-viewname.
        <f_entity>-insert =  ls_insert-insert_line.
      endloop.
    endloop.
*Key leys
    data : lv_viewname type /dlwupex/eviewname,
           lt_keys     type /dlwupex/tview_k_tt.
    lt_viewname = corresponding #( et_entityset ).
    sort lt_viewname  by viewname.
    delete adjacent duplicates from lt_viewname  comparing viewname.
    loop at lt_viewname into  data(ls_viewname) .
      clear lt_keys[].
      call method gcl_cockpit->/dlwupex/if_cockpit_change_art~get_table_key
        exporting
          iv_viewname = ls_viewname-viewname
        importing
          et_keys     = lt_keys.
      if ls_viewname-viewname = '03'.
        append initial line to lt_keys assigning field-symbol(<f_keys>).
        <f_keys>-tabname   = 'AUSP'.
        <f_keys>-fieldname = 'ATINN'.
        <f_keys>-viewname = '03'.
      endif.

      loop at lt_keys into data(ls_keys) ."where viewkey = abap_true.
        read table et_entityset assigning  <f_entity> with key  viewname = ls_keys-viewname
                                                                tabname = ls_keys-tabname
                                                                fieldname = ls_keys-fieldname .
        check sy-subrc eq 0.
        <f_entity>-keys = ls_keys-keyfield.
        <f_entity>-iskey = ls_keys-viewkey.
        <f_entity>-key_duplicate = ls_keys-key_duplicate.
      endloop.
    endloop.

    loop at  et_entityset assigning <f_entity> where viewname = '06' and ( tabname = 'KONP' or  tabname = 'A018').
      <f_entity>-tabname = 'EINE'.
    endloop.

  endmethod.


  method varianteset_get_entityset.
*------------------------------------------------
*  Data declaration
*-------------------------------------------------------------
    data :lt_variante              type ref to data,
          lv_exc_msg               type /iwbep/mgw_bop_rfc_excep_text,
          lo_filter                type  ref to /iwbep/if_mgw_req_filter,
          lt_filter_select_options type /iwbep/t_mgw_select_option,
          lv_filter_str            type string,
          lv_bu                    type /dlwupex/ebusunitid,
          ls_filter                type /iwbep/s_mgw_select_option,
          ls_filter_range          type /iwbep/s_cod_select_option, "##NEEDED.
          lr_bu                    type rseloption,
          ls_converted_keys        like line of et_entityset,
          ls_tlim_ar               type /dlwupex/tlim_ar,
          lv_buid                  type  /dlwupex/ebusunitid,
          lv_varid                 type /dlwupex/evariant,
          lt_variantes             type /dlwupex/var_tt.



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



    try .
        lv_buid = it_filter_select_options[ property = 'WorkArea' ]-select_options[ 1 ]-low.
      catch cx_sy_itab_line_not_found.
    endtry.
    call method /dlwupex/cl_cockpit_change_art=>available_variant
      exporting
        iv_wa      = lv_buid
        iv_user    = sy-uname
      importing
        et_variant = lt_variantes.



*Get Limit number of materials to be updated.
*    try .
*        lv_varid = lt_variantes[ 1 ].
*      catch cx_sy_itab_line_not_found.
*    endtry.
*
*    if  lv_varid is not initial.
*      "   data(gcl_cockpit) = new /dlwupex/cl_cockpit_change_art( iv_wa = lv_buid iv_variant = lv_varid ).
*      data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant = lv_varid ).
*
*
*      call method gcl_cockpit->/dlwupex/if_cockpit_change_art~get_material_limit
*        importing
*          es_limit = ls_tlim_ar.
*    endif.


    if  lt_variantes[] is not initial.
      loop at  lt_variantes into data(ls_variante).
        clear ls_tlim_ar.
        data(gcl_cockpit) = /dlwupex/cl_cockpit_change_art=>get_instance( iv_wa = lv_buid iv_variant =  ls_variante ).
        call method gcl_cockpit->/dlwupex/if_cockpit_change_art~get_material_limit
          importing
            es_limit = ls_tlim_ar.
        append initial line to  et_entityset assigning field-symbol(<f_itab>).
        <f_itab>-variant = ls_variante.
        select single description into <f_itab>-description
                          from /dlwupex/tvar_tx
                          where variant = <f_itab>-variant
                          and spras = sy-langu.
        if  <f_itab>-description is initial .  <f_itab>-description =  <f_itab>-variant.endif.
        <f_itab>-limit   = ls_tlim_ar-limit.
        <f_itab>-typeerr = ls_tlim_ar-type_err.
*        if <f_itab>-limit is initial.
*          <f_itab>-limit = 9999.
*          <f_itab>-typeerr = 'E'.
*        endif.
      endloop.
    else.

*-------------------------------------------------------------
*  Map the RFC response to the caller interface - Only mapped attributes
*-------------------------------------------------------------
*-------------------------------------------------------------
* Error and exception handling
*-------------------------------------------------------------

* Execute the RFC exception handling process
*      me->/iwbep/if_sb_dpc_comm_services~rfc_exception_handling(
*        exporting
*          iv_subrc            = sy-subrc
*          iv_exp_message_text = lv_exc_msg ).
    endif.
  endmethod.
ENDCLASS.
