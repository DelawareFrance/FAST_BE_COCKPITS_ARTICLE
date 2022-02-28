FUNCTION /dlwupex/cockpit_rfc_modif_art.
*"----------------------------------------------------------------------
*"*"Interface locale :
*"  IMPORTING
*"     VALUE(IV_ID) TYPE  /DLWUPEX/EIDCONT
*"     VALUE(IV_VARIANT) TYPE  /DLWUPEX/EVARIANT
*"     VALUE(IV_DATA) TYPE  STRING
*"     VALUE(IV_WA) TYPE  /DLWUPEX/EBUSUNITID
*"     VALUE(IV_NEWID) TYPE  XFELD
*"     VALUE(IV_QNAME) TYPE  TRFCQNAM
*"----------------------------------------------------------------------


  CONSTANTS : lc_modif_mat  TYPE /dlwupex/eaction VALUE 'MODIF_MAT',
              lc_modif_fia  TYPE /dlwupex/eaction VALUE 'MODIF_FIA',
              lc_modif_srli TYPE /dlwupex/eaction VALUE 'MODIF_SRLI',
              lc_modif_list TYPE /dlwupex/eaction VALUE 'MODIF_LIST',
              lc_modif_sale TYPE /dlwupex/eaction VALUE 'MODIF_SALE'.

  DATA : lv_action  TYPE /dlwupex/eaction,
         lv_data    TYPE REF TO data,
         lv_data2   TYPE REF TO data,
         lv_string  TYPE string,
         lv_tabname TYPE tabname,
         lt_struct  TYPE TABLE OF dfies,
         lt_data    TYPE ty_change_data_tt.

  FIELD-SYMBOLS : <ft_data>        TYPE ANY TABLE,
                  <ft_data1>       TYPE  table,
                  <fs_data2>       TYPE  any,
                  <fs_data3>       TYPE  any,
                  <fs_field>       TYPE  any,
                  <fs_field2>      TYPE  any,
                  <fs_change_data> TYPE  any.

  /ui2/cl_json=>deserialize( EXPORTING json = iv_data CHANGING data = lt_data ).


  SELECT * FROM /dlwupex/tst_mod INTO TABLE @DATA(lt_step).
  CHECK sy-subrc IS INITIAL.
  SORT lt_step BY step.

*  lt_data = ct_data.
  SELECT SINGLE value INTO @DATA(lv_class) FROM /dlwupex/tcusto
       WHERE name = 'CLASSNAME_MOD'.
  IF sy-subrc IS NOT INITIAL.

    MESSAGE ID '/DLWUPEX/COCKPIT_ART' TYPE 'E' NUMBER '022'.
  ENDIF.

  CALL METHOD /dlwupex/cl_cockpit_change_art=>get_instance
    EXPORTING
      iv_wa      = iv_wa
      iv_variant = iv_variant
    RECEIVING
      rv_object  = DATA(lv_object).

  CALL METHOD lv_object->/dlwupex/if_cockpit_change_art~set_id
    EXPORTING
      iv_id = iv_id.

  LOOP AT lt_step ASSIGNING FIELD-SYMBOL(<fs_step>).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<fs_data>).
      CHECK <fs_data>-view = <fs_step>-viewname.
* construction des types de données en fonction de la vue
      CASE <fs_data>-view.
        WHEN '01'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sgdataup.
          ASSIGN lv_data->* TO <ft_data1>.
          CREATE DATA lv_data2 TYPE /dlwupex/sgdataup.
          lv_tabname = '/DLWUPEX/SGDATAUP'.
        WHEN '02'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sunitup.
          ASSIGN lv_data->* TO <ft_data1>.
          CREATE DATA lv_data2 TYPE /dlwupex/sunitup.
          lv_tabname = '/DLWUPEX/SUNITUP'.
        WHEN '03'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/scaractup.
          ASSIGN lv_data->* TO <ft_data1>.
          CREATE DATA lv_data2 TYPE /dlwupex/scaractup.
          lv_tabname = '/DLWUPEX/SCARACTUP'.
        WHEN '05'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slistup.
          ASSIGN lv_data->* TO <ft_data1>.
          CREATE DATA lv_data2 TYPE /dlwupex/slistup.
          lv_tabname = '/DLWUPEX/SLISTUP'.
        WHEN '06'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sfiaup.
          ASSIGN lv_data->* TO <ft_data1>.
          CREATE DATA lv_data2 TYPE /dlwupex/sfiaup.
          lv_tabname = '/DLWUPEX/SFIAUP'.
        WHEN '07'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/sslistup.
          ASSIGN lv_data->* TO <ft_data1>.
          CREATE DATA lv_data2 TYPE /dlwupex/sslistup.
          lv_tabname = '/DLWUPEX/SSLISTUP'.
        WHEN '08'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/ssaleup.
          ASSIGN lv_data->* TO <ft_data1>.
          CREATE DATA lv_data2 TYPE /dlwupex/ssaleup.
          lv_tabname = '/DLWUPEX/SSALEUP'.
        WHEN '09'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slogdcup.
          ASSIGN lv_data->* TO <ft_data1>.
          CREATE DATA lv_data2 TYPE /dlwupex/slogdcup.
          lv_tabname = '/DLWUPEX/SLOGDCUP'.
        WHEN '10'.
          CREATE DATA lv_data TYPE STANDARD TABLE OF /dlwupex/slogstoreup.
          ASSIGN lv_data->* TO <ft_data1>.
          CREATE DATA lv_data2 TYPE /dlwupex/slogstoreup.
          lv_tabname = '/DLWUPEX/SLOGSTOREUP'.
        WHEN OTHERS.
      ENDCASE.
      CALL FUNCTION 'DDIF_FIELDINFO_GET'
        EXPORTING
          tabname   = lv_tabname
        TABLES
          dfies_tab = lt_struct.
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.

      ASSIGN lv_data2->* TO <fs_change_data>.

      TRY .
          DATA(ls_all_data) = <fs_data>-data[ 1 ].
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
      IF ls_all_data IS NOT INITIAL.
        ASSIGN ls_all_data-data->* TO <ft_data>.
      ENDIF.
      CLEAR ls_all_data.

* On remet les données au bon format (la déserialisation met tout en objet)
      LOOP AT <ft_data> ASSIGNING FIELD-SYMBOL(<fs_data1>).

        ASSIGN <fs_data1>->* TO <fs_data2>.
        LOOP AT lt_struct INTO DATA(ls_struct).
          ASSIGN COMPONENT ls_struct-fieldname OF STRUCTURE <fs_data2> TO <fs_data3>.
          CHECK sy-subrc IS INITIAL AND <fs_data3> IS ASSIGNED.
          ASSIGN <fs_data3>->* TO <fs_field>.
          CHECK sy-subrc IS INITIAL AND <fs_field> IS ASSIGNED.

          IF  ls_struct-datatype = 'DATS'.
            REPLACE ALL OCCURRENCES OF '-' IN <fs_field> WITH ''.
          ENDIF.

          ASSIGN COMPONENT ls_struct-fieldname OF STRUCTURE <fs_change_data> TO <fs_field2>.
          CHECK sy-subrc IS INITIAL AND <fs_field2> IS ASSIGNED.
          <fs_field2> = <fs_field>.
        ENDLOOP.

        APPEND <fs_change_data> TO <ft_data1>.
      ENDLOOP.

* appel des méthodes de modification pour chaque step
      CALL METHOD lv_object->/dlwupex/if_cockpit_change_art~change_data
        EXPORTING
          iv_view    = <fs_data>-view
          iv_method  = <fs_step>-methode
        CHANGING
          ct_data    = <ft_data1>
          ct_seldata = <fs_data>-seldata.

    ENDLOOP.

    IF lv_action <> <fs_step>-action AND lv_action = lc_modif_mat.
* modification des données BAPI (alimentées pour chacune des vues)
      CALL METHOD lv_object->/dlwupex/if_cockpit_change_art~bapi_change_data.
    ENDIF.
    lv_action = <fs_step>-action.
  ENDLOOP.
  IF lv_action = lc_modif_mat.
* modification des données BAPI (alimentées pour chacune des vues)
    CALL METHOD lv_object->/dlwupex/if_cockpit_change_art~bapi_change_data.
  ENDIF.

* gestion des erreurs
  CALL METHOD lv_object->/dlwupex/if_cockpit_change_art~save_errors.

* mise à jours du status
  CALL METHOD lv_object->/dlwupex/if_cockpit_change_art~manage_status
    EXPORTING
      iv_newid = iv_newid
      iv_qname = iv_qname.



ENDFUNCTION.
