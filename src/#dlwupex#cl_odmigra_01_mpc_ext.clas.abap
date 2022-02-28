class /DLWUPEX/CL_ODMIGRA_01_MPC_EXT definition
  public
  inheriting from /DLWUPEX/CL_ODMIGRA_01_MPC
  create public .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.

  methods DEFINE_MATERIALLIST .
  methods DEFINE_ENTITYTYPE
    importing
      !IV_ENTITY_TYPE_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_VIEWNAME type /DLWUPEX/EVIEWNAME .
ENDCLASS.



CLASS /DLWUPEX/CL_ODMIGRA_01_MPC_EXT IMPLEMENTATION.


  method DEFINE.
*{   INSERT         DS1K901097                                        1
*
     "define_MaterialList( ).
*     define_GeneralDataList( ).
    "super->define( ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_MATERIALLIST IV_VIEWNAME = '00' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_GENRALDATA IV_VIEWNAME = '01' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_UNITEAN IV_VIEWNAME = '02' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_CARACTERISTICS IV_VIEWNAME = '03' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_BOMS IV_VIEWNAME = '04' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_LISTING IV_VIEWNAME = '05' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_FIAPA IV_VIEWNAME = '06' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_SOURCELIST IV_VIEWNAME = '07' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_SALEPV IV_VIEWNAME = '08' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_LOGISTICDC IV_VIEWNAME = '09' ).
     DEFINE_ENTITYTYPE( IV_ENTITY_TYPE_NAME = GC_LOGISTICSTORE IV_VIEWNAME = '10' ).

*}   INSERT
  endmethod.


  method define_entitytype.
*{   INSERT         DS1K901097                                        1
*
    data:
      lo_annotation   type ref to /iwbep/if_mgw_odata_annotation,
      lo_entity_type  type ref to /iwbep/if_mgw_odata_entity_typ,
      lo_complex_type type ref to /iwbep/if_mgw_odata_cmplx_type,
      lo_property     type ref to /iwbep/if_mgw_odata_property,
      lo_entity_set   type ref to /iwbep/if_mgw_odata_entity_set,
      lv_element      type string,
      lv_tabname      type rmdi_name,
      lv_fldname      type rmdi_fienm,
      ls_tabfield_w   type rmdi_tabfld,
      fs_taba         type dd07v,
      it_taba         type standard table of dd07v,
      it_tabb         type standard table of dd07v,
      lv_position     type /dlwupex/efiledsorder.


    constants : lc_yes type char1 value 'Y'.

    types : begin of ltyp_fields ,
              tabname   type tabname16, "char10,
              tabfield  type char40,
              dposition type /dlwupex/efiledsorder,
              noedit    type /dlwupex/eeditcam,
            end of  ltyp_fields.

    data: lt_output type standard table of ltyp_fields,
          ls_output type ltyp_fields.
    data lv_entityset type /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name.
**********************************************************************
*   ENTITY – MATERIALLIST
**********************************************************************

    lo_entity_type = model->create_entity_type( iv_entity_type_name = iv_entity_type_name iv_def_entity_set = lc_yes ).

    "lo_entity_type = model->get_entity_set( iv_entity_SET_name = 'MaterialList' ).



**********************************************************************
*Properties
**********************************************************************
    if iv_viewname = '00'.
      select  distinct tabname tabfield dposition from /dlwupex/tfields
                            into corresponding fields of table lt_output
                            where selection = lc_yes
                            and actif = lc_yes
                            order by  tabfield .

*    CALL FUNCTION 'DD_DOMA_GET'
*          EXPORTING
*            domain_name   = '/DLWUPEX/DVIEWNAME'
*            langu         = sy-langu
*            withtext      = 'X'
*          TABLES
*             dd07v_tab_a   = it_taba
*             dd07v_tab_n   = it_tabb
*          EXCEPTIONS
*             illegal_value = 1
*             op_failure    = 2
*          OTHERS        = 3.
*      IF sy-subrc <> 0.
** MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
**         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
*      ENDIF.
      lv_position = 90.
      ls_output-tabname   = '/DLWUPEX/TREQIDS'.
      ls_output-tabfield  = 'STATDG'.
      ls_output-dposition = lv_position.
      append ls_output to lt_output .
*
*
      ls_output-dposition = ls_output-dposition + 1.
      ls_output-tabfield  = 'STATUNIT'.
      append ls_output to lt_output .
*
      ls_output-dposition = ls_output-dposition + 1.
      ls_output-tabfield  = 'STATCARA'.
      append ls_output to lt_output .
*
      ls_output-dposition = ls_output-dposition + 1.
      ls_output-tabfield  = 'STATBOM'.
      append ls_output to lt_output .

      ls_output-dposition = ls_output-dposition + 1.
      ls_output-tabfield  = 'STATFIA'.
      append ls_output to lt_output .

      ls_output-dposition = ls_output-dposition + 1.
      ls_output-tabfield  = 'STATLIST'.
      append ls_output to lt_output .

      ls_output-dposition = ls_output-dposition + 1.
      ls_output-tabfield  = 'STATSRLIST'.
      append ls_output to lt_output .

      ls_output-dposition = ls_output-dposition + 1.
      ls_output-tabfield  = 'STATSALE'.
      append ls_output to lt_output .

      ls_output-dposition = ls_output-dposition + 1.
      ls_output-tabfield  = 'STATDC'.
      append ls_output to lt_output .

      ls_output-dposition = ls_output-dposition + 1.
      ls_output-tabfield  = 'STATSTORE'.
      append ls_output to lt_output .


    else.
      select distinct tabname tabfield dposition noedit from /dlwupex/tfields
                              into corresponding fields of table lt_output
                              where viewname = iv_viewname
                              and actif = lc_yes
                              order by  tabfield .
    endif.
    sort lt_output by tabname tabfield.
    delete adjacent duplicates from lt_output comparing tabname tabfield.

    loop at lt_output assigning field-symbol(<f_data>).
      if <f_data>-tabname = '/SAPSLL/MARITC' and <f_data>-tabfield = 'DATAB'.
        <f_data>-tabfield = 'DATABB'.
      endif.
    endloop.
    "DELETE ADJACENT DUPLICATES FROM lt_output COMPARING tabfield.
    sort lt_output by  dposition.
*Add status
    if  iv_viewname ne '00'.
      ls_output-tabname   = '/DLWUPEX/TGDATA'.
      ls_output-tabfield  = 'STATUS'.
      insert ls_output into lt_output index 1.
    endif.


    lo_property = lo_entity_type->create_property( iv_property_name = 'BUID' iv_abap_fieldname = 'ID' ).
    lo_property->set_is_key( ).
    lo_property->set_type_edm_string( ).
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_true ).

*Get data element for field
    lv_tabname = '/DLWUPEX/TBUHEAD'.
    lv_fldname = 'ID'.
    clear ls_tabfield_w.
    call function 'KL_TABLE_INFO_GET'
      exporting
        i_tabname    = lv_tabname
        i_fieldname  = lv_fldname
*       I_LANGU      =
*       I_READ_TEXTS =
      importing
*       E_TABHEADER  =
        e_tabfield_w = ls_tabfield_w
*       E_IT_TABFIELDS       =
      exceptions
        not_found    = 1
        ddic_error   = 2
        others       = 3.
    if sy-subrc <> 0.
* Implement suitable error handling here
    endif.
    try.
        lv_element = ls_tabfield_w-rollname.

        call method lo_property->bind_data_element
          exporting
            iv_element_name = lv_element.

      catch /iwbep/cx_mgw_med_exception .

    endtry.

    lo_property = lo_entity_type->create_property( iv_property_name = 'REQID' iv_abap_fieldname = 'REQID' ). "#EC NOTEXT
    "lo_property->set_label_from_text_element( iv_text_element_symbol = '002' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
    lo_property->set_is_key( ).
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 10 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_false ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_true ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          exporting
            iv_key      = 'unicode'
            iv_value    = 'false' ).
*Get data element for field
    lv_tabname = '/DLWUPEX/TREQIDS'.
    lv_fldname = 'REQID'.
    clear ls_tabfield_w.
    call function 'KL_TABLE_INFO_GET'
      exporting
        i_tabname    = lv_tabname
        i_fieldname  = lv_fldname
*       I_LANGU      =
*       I_READ_TEXTS =
      importing
*       E_TABHEADER  =
        e_tabfield_w = ls_tabfield_w
*       E_IT_TABFIELDS       =
      exceptions
        not_found    = 1
        ddic_error   = 2
        others       = 3.
    if sy-subrc <> 0.
* Implement suitable error handling here
    endif.
    try.
        lv_element = ls_tabfield_w-rollname.

        call method lo_property->bind_data_element
          exporting
            iv_element_name = lv_element.

      catch /iwbep/cx_mgw_med_exception .
    endtry.


*Material Key
    lo_property = lo_entity_type->create_property( iv_property_name = 'ARTKEY' iv_abap_fieldname = 'ART_KEY' ). "#EC NOTEXT
    "lo_property->set_label_from_text_element( iv_text_element_symbol = '002' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
    lo_property->set_is_key( ).
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 10 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_true ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_true ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          exporting
            iv_key      = 'unicode'
            iv_value    = 'false' ).
*Get data element for field
    lv_tabname = '/DLWUPEX/TGDATA'.
    lv_fldname = 'ART_KEY'.
    clear ls_tabfield_w.
    call function 'KL_TABLE_INFO_GET'
      exporting
        i_tabname    = lv_tabname
        i_fieldname  = lv_fldname
*       I_LANGU      =
*       I_READ_TEXTS =
      importing
*       E_TABHEADER  =
        e_tabfield_w = ls_tabfield_w
*       E_IT_TABFIELDS       =
      exceptions
        not_found    = 1
        ddic_error   = 2
        others       = 3.
    if sy-subrc <> 0.
* Implement suitable error handling here
    endif.
    try.
        lv_element = ls_tabfield_w-rollname.

        call method lo_property->bind_data_element
          exporting
            iv_element_name = lv_element.

      catch /iwbep/cx_mgw_med_exception .
    endtry.

*Matnr is opened
*  IF  IV_VIEWNAME eq '01' .
*     lo_property = lo_entity_type->create_property( iv_property_name = 'ISMATNROPEN' iv_abap_fieldname = 'ISMATNROPEN' ). "#EC NOTEXT
*lo_property->set_is_key( ).
*lo_property->set_type_edm_string( ).
*lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
*lo_property->set_creatable( abap_false ).
*lo_property->set_updatable( abap_false ).
*lo_property->set_sortable( abap_true ).
*lo_property->set_nullable( abap_false ).
*lo_property->set_filterable( abap_true ).
*lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
*      EXPORTING
*        iv_key      = 'unicode'
*        iv_value    = 'false' ).
*
* TRY.
*        lv_element = 'FLAG'.
*
*        CALL METHOD lo_property->bind_data_element
*          EXPORTING
*            iv_element_name = lv_element.
*
*      CATCH /iwbep/cx_mgw_med_exception .
*    ENDTRY.
*
*  ENDIF.

    if  iv_viewname eq '10' .
      lo_property = lo_entity_type->create_property( iv_property_name = 'XCHPFOPEN' iv_abap_fieldname = 'XCHPFOPEN' ). "#EC NOTEXT
      lo_property->set_is_key( ).
      lo_property->set_type_edm_string( ).
      lo_property->set_maxlength( iv_max_length = 10 ).     "#EC NOTEXT
      lo_property->set_creatable( abap_false ).
      lo_property->set_updatable( abap_false ).
      lo_property->set_sortable( abap_true ).
      lo_property->set_nullable( abap_false ).
      lo_property->set_filterable( abap_true ).
      lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
            exporting
              iv_key      = 'unicode'
              iv_value    = 'false' ).

      try.
          lv_element = 'XFLAG'.

          call method lo_property->bind_data_element
            exporting
              iv_element_name = lv_element.

        catch /iwbep/cx_mgw_med_exception .
      endtry.
    endif.


*Status de check

    if  iv_viewname ne '00' .
      lo_property = lo_entity_type->create_property( iv_property_name = 'CHECKSTAT' iv_abap_fieldname = 'CHECKSTAT' ). "#EC NOTEXT
      lo_property->set_is_key( ).
      lo_property->set_type_edm_string( ).
      lo_property->set_maxlength( iv_max_length = 10 ).     "#EC NOTEXT
      lo_property->set_creatable( abap_false ).
      lo_property->set_updatable( abap_false ).
      lo_property->set_sortable( abap_true ).
      lo_property->set_nullable( abap_false ).
      lo_property->set_filterable( abap_true ).
      lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
            exporting
              iv_key      = 'unicode'
              iv_value    = 'false' ).
*Get data element for field
      lv_tabname = '/DLWUPEX/TGDATA'.
      lv_fldname = 'STATUS'.
      clear ls_tabfield_w.
      call function 'KL_TABLE_INFO_GET'
        exporting
          i_tabname    = lv_tabname
          i_fieldname  = lv_fldname
*         I_LANGU      =
*         I_READ_TEXTS =
        importing
*         E_TABHEADER  =
          e_tabfield_w = ls_tabfield_w
*         E_IT_TABFIELDS       =
        exceptions
          not_found    = 1
          ddic_error   = 2
          others       = 3.
      if sy-subrc <> 0.
* Implement suitable error handling here
      endif.
      try.
          lv_element = ls_tabfield_w-rollname.

          call method lo_property->bind_data_element
            exporting
              iv_element_name = lv_element.

        catch /iwbep/cx_mgw_med_exception .
      endtry.
    endif.
    lo_property = lo_entity_type->create_property( iv_property_name = 'NUM_LINE' iv_abap_fieldname = 'NUM_LINE' ). "#EC NOTEXT
    lo_property->set_is_key( ).
    lo_property->set_type_edm_string( ).
    lo_property->set_maxlength( iv_max_length = 10 ).       "#EC NOTEXT
    lo_property->set_creatable( abap_false ).
    lo_property->set_updatable( abap_false ).
    lo_property->set_sortable( abap_true ).
    lo_property->set_nullable( abap_false ).
    lo_property->set_filterable( abap_true ).
    lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
          exporting
            iv_key      = 'unicode'
            iv_value    = 'false' ).
*Get data element for field
    lv_tabname = '/DLWUPEX/TGDATA'.
    lv_fldname = 'NUM_LINE'.
    clear ls_tabfield_w.
    call function 'KL_TABLE_INFO_GET'
      exporting
        i_tabname    = lv_tabname
        i_fieldname  = lv_fldname
*       I_LANGU      =
*       I_READ_TEXTS =
      importing
*       E_TABHEADER  =
        e_tabfield_w = ls_tabfield_w
*       E_IT_TABFIELDS       =
      exceptions
        not_found    = 1
        ddic_error   = 2
        others       = 3.
    if sy-subrc <> 0.
* Implement suitable error handling here
    endif.
    try.
        lv_element = ls_tabfield_w-rollname.

        call method lo_property->bind_data_element
          exporting
            iv_element_name = lv_element.

      catch /iwbep/cx_mgw_med_exception .
    endtry.










*Add line id
    if  iv_viewname ne '00' and iv_viewname ne '01' .
      lo_property = lo_entity_type->create_property( iv_property_name = 'LINE' iv_abap_fieldname = 'LINE' ). "#EC NOTEXT
      "lo_property->set_label_from_text_element( iv_text_element_symbol = '002' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
      lo_property->set_is_key( ).
      lo_property->set_type_edm_string( ).
      lo_property->set_maxlength( iv_max_length = 5 ).      "#EC NOTEXT
      lo_property->set_creatable( abap_false ).
      lo_property->set_updatable( abap_false ).
      lo_property->set_sortable( abap_false ).
      lo_property->set_nullable( abap_false ).
      lo_property->set_filterable( abap_true ).
      lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
            exporting
              iv_key      = 'unicode'
              iv_value    = 'false' ).
*Get data element for field
      lv_tabname = '/DLWUPEX/TUNIT'.
      lv_fldname = 'LINE'.
      clear ls_tabfield_w.
      call function 'KL_TABLE_INFO_GET'
        exporting
          i_tabname    = lv_tabname
          i_fieldname  = lv_fldname
*         I_LANGU      =
*         I_READ_TEXTS =
        importing
*         E_TABHEADER  =
          e_tabfield_w = ls_tabfield_w
*         E_IT_TABFIELDS       =
        exceptions
          not_found    = 1
          ddic_error   = 2
          others       = 3.
      if sy-subrc <> 0.
* Implement suitable error handling here
      endif.
      try.
          lv_element = ls_tabfield_w-rollname.

          call method lo_property->bind_data_element
            exporting
              iv_element_name = lv_element.

        catch /iwbep/cx_mgw_med_exception .
      endtry.
    endif.


    loop at lt_output into ls_output.
      data(lv_updatable) = abap_true.
      if  ls_output-noedit is not initial.
        clear lv_updatable.
      endif.
      lo_property = lo_entity_type->create_property( iv_property_name = ls_output-tabfield ).
      lo_property->set_is_key( ).
      lo_property->set_type_edm_string( ).
      lo_property->set_nullable( abap_false ).
      lo_property->set_updatable( lv_updatable ).
      " lo_property->set_label_from_text_element( 'toto' ).  "#EC NOTEXT
*Get data element for field
      lv_tabname = ls_output-tabname   .
      lv_fldname = ls_output-tabfield.


      if lv_tabname = '/SAPSLL/MARITC' and lv_fldname = 'DATABB'.
        lv_fldname = 'DATAB'.
      endif.

      clear ls_tabfield_w.
      call function 'KL_TABLE_INFO_GET'
        exporting
          i_tabname    = lv_tabname
          i_fieldname  = lv_fldname
*         I_LANGU      =
*         I_READ_TEXTS =
        importing
*         E_TABHEADER  =
          e_tabfield_w = ls_tabfield_w
*         E_IT_TABFIELDS       =
        exceptions
          not_found    = 1
          ddic_error   = 2
          others       = 3.
      if sy-subrc <> 0.
* Implement suitable error handling here
      endif.
      case ls_tabfield_w-datatype.
        when 'DATS'.
          lo_property->set_as_author( iv_keep_in_content = abap_true ).
        when 'UNIT'.
          lo_property->set_conversion_exit( 'CUNIT' ).
        when 'LANG'.
          lo_property->set_conversion_exit( 'ISOLA' ).      "#EC NOTEXT
        when 'DEC'.
          data lv_output_len type i.
          lv_output_len = ls_tabfield_w-position + 1.
          if lv_tabname = 'MARM' and  ( lv_fldname = 'UMREN' or lv_fldname = 'UMREZ' ) .
            lo_property->set_maxlength( iv_max_length = 6  ). "#EC NOTEXT
          endif.
        when others.
          if lv_fldname = 'ZZ1_ZUO_ENTREE_PLT' or lv_fldname = 'ZZ1_ZUO_SORTIE_PLT' or lv_fldname = 'ZZ1_UVECOM_SAL'.
            lo_property->set_conversion_exit( 'CUNIT' ).
          elseif lv_fldname = 'LIFNR'.
            lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
            lo_property->set_conversion_exit( 'ALPHA' ).    "#EC NOTEXT
          endif.
      endcase.


      try.

          if ls_output-tabfield = 'ATINN'.
            lv_element = '/DLWUPEX/EATINN'.
          else.
            lv_element = ls_tabfield_w-rollname.
          endif.


          if lv_element = '/SAPSLL/CCNGN'.
            lv_element = '/DLWUPEX/ENOMDOUANE'.
          endif.
          call method lo_property->bind_data_element
            exporting
              iv_element_name = lv_element.

        catch /iwbep/cx_mgw_med_exception .
      endtry.

    endloop.

*
***********************************************************************
**   ENTITY SETS
***********************************************************************

    lv_entityset =  |{ iv_entity_type_name }Set |.
    lo_entity_set = lo_entity_type->create_entity_set( lv_entityset ).
    lo_entity_set->set_has_ftxt_search( abap_false ).
    lo_entity_set->set_subscribable( abap_false ).
    lo_entity_set->set_filter_required( abap_false ).
*}   INSERT
  endmethod.


  method DEFINE_MATERIALLIST.
*{   INSERT         DS1K901097                                        1
*
     DATA:
lo_annotation     TYPE REF TO /iwbep/if_mgw_odata_annotation,
lo_entity_type    TYPE REF TO /iwbep/if_mgw_odata_entity_typ,
lo_complex_type   TYPE REF TO /iwbep/if_mgw_odata_cmplx_type,
lo_property       TYPE REF TO /iwbep/if_mgw_odata_property,
lo_entity_set     TYPE REF TO /iwbep/if_mgw_odata_entity_set,
lv_element        TYPE string,
lv_tabname        TYPE RMDI_NAME,
lv_fldname        TYPE RMDI_FIENM,
Ls_TABFIELD_W    TYPE RMDI_TABFLD.

    CONSTANTS : lc_yes TYPE char1 VALUE 'Y'.

TYPES : BEGIN OF ltyp_fields ,
          TABNAME  TYPE CHAR10,
          TABFIELD TYPE CHAR40,
          DPOSITION  TYPE /DLWUPEX/EFILEDSORDER,
        END OF  ltyp_fields.

DATA: lt_output TYPE STANDARD TABLE OF ltyp_fields,
      ls_output TYPE ltyp_fields.
**********************************************************************
*   ENTITY – MATERIALLIST
**********************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'MaterialList' iv_def_entity_set = lc_yes ).

"lo_entity_type = model->get_entity_set( iv_entity_SET_name = 'MaterialList' ).



**********************************************************************
*Properties
**********************************************************************

SELECT TABNAME TABFIELD DPOSITION FROM /DLWUPEX/TFIELDS
                        INTO TABLE lt_output
                        WHERE SELECTION = lc_yes
                        AND ACTIF = lc_yes
                        ORDER BY DPOSITION.
IF sy-subrc = 0.


   lo_property = lo_entity_type->create_property( iv_property_name = 'BusnesUnitId' ).
   lo_property->set_is_key( ).
   lo_property->set_type_edm_string( ).
   lo_property->set_nullable( abap_false ).

*Get data element for field
      lv_tabname = '/DLWUPEX/TBUHEAD'.
      lv_fldname = 'ID'.
      CLear Ls_TABFIELD_W.
      call function 'KL_TABLE_INFO_GET'
        exporting
          i_tabname            =  lv_tabname
         I_FIELDNAME           =  lv_fldname
*         I_LANGU              =
*         I_READ_TEXTS         =
       IMPORTING
*         E_TABHEADER          =
          E_TABFIELD_W         =  Ls_TABFIELD_W
*         E_IT_TABFIELDS       =
       EXCEPTIONS
         NOT_FOUND            = 1
         DDIC_ERROR           = 2
         OTHERS               = 3
                .
      if sy-subrc <> 0.
* Implement suitable error handling here
      endif.
TRY.
      lv_element = Ls_TABFIELD_W-ROLLNAME.

     CALL METHOD lo_property->bind_data_element
          EXPORTING
           iv_element_name = lv_element.

      CATCH /iwbep/cx_mgw_med_exception .

 ENDTRY.

   lo_property = lo_entity_type->create_property( iv_property_name = 'RequestNum' ).
   lo_property->set_is_key( ).
   lo_property->set_type_edm_string( ).
   lo_property->set_nullable( abap_false ).

*Get data element for field
      lv_tabname = '/DLWUPEX/TREQIDS'.
      lv_fldname = 'REQID'.
      CLear Ls_TABFIELD_W.
      call function 'KL_TABLE_INFO_GET'
        exporting
          i_tabname            =  lv_tabname
         I_FIELDNAME           =  lv_fldname
*         I_LANGU              =
*         I_READ_TEXTS         =
       IMPORTING
*         E_TABHEADER          =
          E_TABFIELD_W         =  Ls_TABFIELD_W
*         E_IT_TABFIELDS       =
       EXCEPTIONS
         NOT_FOUND            = 1
         DDIC_ERROR           = 2
         OTHERS               = 3
                .
      if sy-subrc <> 0.
* Implement suitable error handling here
      endif.
TRY.
      lv_element = Ls_TABFIELD_W-ROLLNAME.

     CALL METHOD lo_property->bind_data_element
          EXPORTING
           iv_element_name = lv_element.

      CATCH /iwbep/cx_mgw_med_exception .

 ENDTRY.


LOOP AT lt_output INTO ls_output.
   lo_property = lo_entity_type->create_property( iv_property_name = ls_output-TABFIELD ).
   lo_property->set_is_key( ).
   lo_property->set_type_edm_string( ).
   lo_property->set_nullable( abap_false ).
  " lo_property->set_label_from_text_element( 'toto' ).  "#EC NOTEXT



*Get data element for field
      lv_tabname = ls_output-TABNAME   .
      lv_fldname = ls_output-TABFIELD.
      CLear Ls_TABFIELD_W.
      call function 'KL_TABLE_INFO_GET'
        exporting
          i_tabname            =  lv_tabname
         I_FIELDNAME           =  lv_fldname
*         I_LANGU              =
*         I_READ_TEXTS         =
       IMPORTING
*         E_TABHEADER          =
          E_TABFIELD_W         =  Ls_TABFIELD_W
*         E_IT_TABFIELDS       =
       EXCEPTIONS
         NOT_FOUND            = 1
         DDIC_ERROR           = 2
         OTHERS               = 3
                .
      if sy-subrc <> 0.
* Implement suitable error handling here
      endif.
TRY.
      lv_element = Ls_TABFIELD_W-ROLLNAME.

     CALL METHOD lo_property->bind_data_element
          EXPORTING
           iv_element_name = lv_element.

      CATCH /iwbep/cx_mgw_med_exception .
ENDTRY.
ENDLOOP.
ENDIF.
*
***********************************************************************
**   ENTITY SETS
***********************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'MaterialListSet' ).
lo_entity_set->set_has_ftxt_search( abap_false ).
lo_entity_set->set_subscribable( abap_false ).
lo_entity_set->set_filter_required( abap_false ).
*}   INSERT
  endmethod.
ENDCLASS.
