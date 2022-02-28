FUNCTION /DLWUPEX/CONVERT_MATERIAL_DATA .
*"----------------------------------------------------------------------
*"*"Interface locale :
*"  IMPORTING
*"     VALUE(HEADDATA) TYPE  BAPIE1MATHEAD
*"     VALUE(OBJ_TYPE) TYPE  SERIAL-OBJ_TYPE DEFAULT 'BUS1001001'
*"     VALUE(SERIAL_ID) TYPE  SERIAL-CHNUM DEFAULT '0'
*"  TABLES
*"      VARIANTSKEYS STRUCTURE  BAPIE1VARKEY OPTIONAL
*"      CHARACTERISTICVALUE STRUCTURE  BAPIE1AUSPRT OPTIONAL
*"      CHARACTERISTICVALUEX STRUCTURE  BAPIE1AUSPRTX OPTIONAL
*"      CLIENTDATA STRUCTURE  BAPIE1MARART OPTIONAL
*"      CLIENTDATAX STRUCTURE  BAPIE1MARARTX OPTIONAL
*"      CLIENTEXT STRUCTURE  BAPIE1MARAEXTRT OPTIONAL
*"      CLIENTEXTX STRUCTURE  BAPIE1MARAEXTRTX OPTIONAL
*"      ADDNLCLIENTDATA STRUCTURE  BAPIE1MAW1RT OPTIONAL
*"      ADDNLCLIENTDATAX STRUCTURE  BAPIE1MAW1RTX OPTIONAL
*"      MATERIALDESCRIPTION STRUCTURE  BAPIE1MAKTRT OPTIONAL
*"      PLANTDATA STRUCTURE  BAPIE1MARCRT OPTIONAL
*"      PLANTDATAX STRUCTURE  BAPIE1MARCRTX OPTIONAL
*"      PLANTEXT STRUCTURE  BAPIE1MARCEXTRT OPTIONAL
*"      PLANTEXTX STRUCTURE  BAPIE1MARCEXTRTX OPTIONAL
*"      FORECASTPARAMETERS STRUCTURE  BAPIE1MPOPRT OPTIONAL
*"      FORECASTPARAMETERSX STRUCTURE  BAPIE1MPOPRTX OPTIONAL
*"      FORECASTVALUES STRUCTURE  BAPIE1MPRWRT OPTIONAL
*"      TOTALCONSUMPTION STRUCTURE  BAPIE1MVEGRT OPTIONAL
*"      UNPLNDCONSUMPTION STRUCTURE  BAPIE1MVEURT OPTIONAL
*"      PLANNINGDATA STRUCTURE  BAPIE1MPGDRT OPTIONAL
*"      PLANNINGDATAX STRUCTURE  BAPIE1MPGDRTX OPTIONAL
*"      STORAGELOCATIONDATA STRUCTURE  BAPIE1MARDRT OPTIONAL
*"      STORAGELOCATIONDATAX STRUCTURE  BAPIE1MARDRTX OPTIONAL
*"      STORAGELOCATIONEXT STRUCTURE  BAPIE1MARDEXTRT OPTIONAL
*"      STORAGELOCATIONEXTX STRUCTURE  BAPIE1MARDEXTRTX OPTIONAL
*"      UNITSOFMEASURE STRUCTURE  BAPIE1MARMRT OPTIONAL
*"      UNITSOFMEASUREX STRUCTURE  BAPIE1MARMRTX OPTIONAL
*"      UNITOFMEASURETEXTS STRUCTURE  BAPIE1MAMTRT OPTIONAL
*"      INTERNATIONALARTNOS STRUCTURE  BAPIE1MEANRT OPTIONAL
*"      VENDOREAN STRUCTURE  BAPIE1MLEART OPTIONAL
*"      LAYOUTMODULEASSGMT STRUCTURE  BAPIE1MALGRT OPTIONAL
*"      LAYOUTMODULEASSGMTX STRUCTURE  BAPIE1MALGRTX OPTIONAL
*"      TAXCLASSIFICATIONS STRUCTURE  BAPIE1MLANRT OPTIONAL
*"      VALUATIONDATA STRUCTURE  BAPIE1MBEWRT OPTIONAL
*"      VALUATIONDATAX STRUCTURE  BAPIE1MBEWRTX OPTIONAL
*"      VALUATIONEXT STRUCTURE  BAPIE1MBEWEXTRT OPTIONAL
*"      VALUATIONEXTX STRUCTURE  BAPIE1MBEWEXTRTX OPTIONAL
*"      WAREHOUSENUMBERDATA STRUCTURE  BAPIE1MLGNRT OPTIONAL
*"      WAREHOUSENUMBERDATAX STRUCTURE  BAPIE1MLGNRTX OPTIONAL
*"      WAREHOUSENUMBEREXT STRUCTURE  BAPIE1MLGNEXTRT OPTIONAL
*"      WAREHOUSENUMBEREXTX STRUCTURE  BAPIE1MLGNEXTRTX OPTIONAL
*"      STORAGETYPEDATA STRUCTURE  BAPIE1MLGTRT OPTIONAL
*"      STORAGETYPEDATAX STRUCTURE  BAPIE1MLGTRTX OPTIONAL
*"      STORAGETYPEEXT STRUCTURE  BAPIE1MLGTEXTRT OPTIONAL
*"      STORAGETYPEEXTX STRUCTURE  BAPIE1MLGTEXTRTX OPTIONAL
*"      SALESDATA STRUCTURE  BAPIE1MVKERT OPTIONAL
*"      SALESDATAX STRUCTURE  BAPIE1MVKERTX OPTIONAL
*"      SALESEXT STRUCTURE  BAPIE1MVKEEXTRT OPTIONAL
*"      SALESEXTX STRUCTURE  BAPIE1MVKEEXTRTX OPTIONAL
*"      POSDATA STRUCTURE  BAPIE1WLK2RT OPTIONAL
*"      POSDATAX STRUCTURE  BAPIE1WLK2RTX OPTIONAL
*"      POSEXT STRUCTURE  BAPIE1WLK2EXTRT OPTIONAL
*"      POSEXTX STRUCTURE  BAPIE1WLK2EXTRTX OPTIONAL
*"      MATERIALLONGTEXT STRUCTURE  BAPIE1MLTXRT OPTIONAL
*"      PLANTKEYS STRUCTURE  BAPIE1WRKKEY OPTIONAL
*"      STORAGELOCATIONKEYS STRUCTURE  BAPIE1LGOKEY OPTIONAL
*"      DISTRCHAINKEYS STRUCTURE  BAPIE1VTLKEY OPTIONAL
*"      WAREHOUSENOKEYS STRUCTURE  BAPIE1LGNKEY OPTIONAL
*"      STORAGETYPEKEYS STRUCTURE  BAPIE1LGTKEY OPTIONAL
*"      VALUATIONTYPEKEYS STRUCTURE  BAPIE1BWAKEY OPTIONAL
*"      TEXTILECOMPONENTS STRUCTURE  BAPITEXTLCOMP OPTIONAL
*"      FIBERCODES STRUCTURE  BAPITEXTLFIBR OPTIONAL
*"      SEGSALESSTATUS STRUCTURE  BAPISGTMVKE OPTIONAL
*"      SEGWEIGHTVOLUME STRUCTURE  BAPISGTMARM OPTIONAL
*"      SEGVALUATIONTYPE STRUCTURE  BAPISGTMADKA OPTIONAL
*"      SEASONS STRUCTURE  BAPIFSHSEASONS OPTIONAL
*"      SEGWAREHOUSENUMBERDATA STRUCTURE  BAPISGTMLGN OPTIONAL
*"      SEGSTORAGETYPEDATA STRUCTURE  BAPISGTMLGT OPTIONAL
*"      SEGMRPGENERALDATA STRUCTURE  BAPISGTMRPGN OPTIONAL
*"      SEGMRPQUANTITYDATA STRUCTURE  BAPISGTMRP OPTIONAL
*"      RECEIVERS STRUCTURE  BDI_LOGSYS
*"      COMMUNICATION_DOCUMENTS STRUCTURE  SWOTOBJID OPTIONAL
*"      APPLICATION_OBJECTS STRUCTURE  SWOTOBJID OPTIONAL
*"  EXCEPTIONS
*"      ERROR_CREATING_IDOCS
*"----------------------------------------------------------------------
*{   INSERT         DS1K901359                                        1
*----------------------------------------------------------------------*
*  this function module is generated                                   *
*          never change it manually, please!        18.10.2018         *
*----------------------------------------------------------------------*

* context-of-insertion
  DATA: "IDOC_CONTROL  LIKE BDICONTROL,
    idoc_data     LIKE edidd      OCCURS 0 WITH HEADER LINE,
    idoc_receiver LIKE bdi_logsys OCCURS 0 WITH HEADER LINE,
    idoc_comm     LIKE edidc      OCCURS 0 WITH HEADER LINE,
    syst_info     LIKE syst.

  DATA : ls_receivers TYPE bdi_logsys.

  DATA: filtered_table_entries
                       LIKE bdi_btabix OCCURS 0 WITH HEADER LINE.

* create IDoc control-record                                           *
*  IDOC_CONTROL-MESTYP = 'ARTMAS'.
*  IDOC_CONTROL-IDOCTP = 'ARTMAS09'.
*  IDOC_CONTROL-SERIAL = SY-DATUM.
*  IDOC_CONTROL-SERIAL+8 = SY-UZEIT.

* begin-of-insertion
* FLE MATNR BAPI Changes
  DATA: lv_return     TYPE bapireturn1.

  CALL METHOD cl_matnr_chk_mapper=>convert_on_output
    EXPORTING
      iv_matnr40               = headdata-material_long
    IMPORTING
      ev_matnr18               = headdata-material
      ev_guid                  = headdata-material_guid
      ev_version               = headdata-material_version
      ev_matnr40               = headdata-material_long
      ev_matnr_ext             = headdata-material_external
    EXCEPTIONS
      excp_matnr_invalid_input = 1
      excp_matnr_not_found     = 2.

  IF sy-subrc <> 0.
    RAISE error_creating_idocs.
  ENDIF.

  PERFORM fle_matnr_convertion(sapl1001)
  TABLES
     variantskeys
     characteristicvalue
     characteristicvaluex
     clientdata
     clientdatax
     clientext
     clientextx
     addnlclientdata
     addnlclientdatax
     materialdescription
     plantdata
     plantdatax
     plantext
     plantextx
     forecastparameters
     forecastparametersx
     forecastvalues
     totalconsumption
     unplndconsumption
     planningdata
     planningdatax
     storagelocationdata
     storagelocationdatax
     storagelocationext
     storagelocationextx
     unitsofmeasure
     unitsofmeasurex
     unitofmeasuretexts
     internationalartnos
     vendorean
     layoutmoduleassgmt
     layoutmoduleassgmtx
     taxclassifications
     valuationdata
     valuationdatax
     valuationext
     valuationextx
     warehousenumberdata
     warehousenumberdatax
     warehousenumberext
     warehousenumberextx
     storagetypedata
     storagetypedatax
     storagetypeext
     storagetypeextx
     salesdata
     salesdatax
     salesext
     salesextx
     posdata
     posdatax
     posext
     posextx
     materiallongtext
     plantkeys
     storagelocationkeys
     distrchainkeys
     warehousenokeys
     storagetypekeys
     valuationtypekeys
     textilecomponents
     fibercodes
     segsalesstatus
     segweightvolume
     segvaluationtype
     seasons
     segwarehousenumberdata
     segstoragetypedata
     segmrpgeneraldata
     segmrpquantitydata
   USING
     'X'
   CHANGING lv_return.


  IF lv_return IS NOT INITIAL.
    RAISE error_creating_idocs.
  ENDIF.

  IF sy-subrc <> 0.
    RAISE error_creating_idocs.
  ENDIF.

  CLEAR receivers.
  REFRESH receivers.

  MOVE sy-sysid TO ls_receivers-logsys.
  APPEND ls_receivers TO receivers.

* end-of-insertion
  LOOP AT receivers ASSIGNING FIELD-SYMBOL(<fs_receivers>).
*   with data filtering                                                *
    CLEAR: syst_info, filtered_table_entries.
    REFRESH filtered_table_entries.
    PERFORM bflt_material_maintaindata_rt
            TABLES
                clientdata
                addnlclientdata
                addnlclientdatax
                characteristicvalue
                characteristicvaluex
                clientdatax
                clientext
                clientextx
                materialdescription
                materiallongtext
                plantdata
                forecastparameters
                forecastparametersx
                forecastvalues
                planningdata
                planningdatax
                plantdatax
                plantext
                plantextx
                plantkeys
                storagelocationdata
                storagelocationdatax
                storagelocationext
                storagelocationextx
                storagelocationkeys
                totalconsumption
                unplndconsumption
                salesdata
                distrchainkeys
                posdata
                posdatax
                posext
                posextx
                salesdatax
                salesext
                salesextx
                seasons
                segmrpgeneraldata
                segmrpquantitydata
                segsalesstatus
                segstoragetypedata
                segvaluationtype
                segwarehousenumberdata
                segweightvolume
                taxclassifications
                textilecomponents
                fibercodes
                unitsofmeasure
                internationalartnos
                vendorean
                layoutmoduleassgmt
                layoutmoduleassgmtx
                unitofmeasuretexts
                unitsofmeasurex
                valuationdata
                valuationdatax
                valuationext
                valuationextx
                valuationtypekeys
                variantskeys
                warehousenumberdata
                storagetypedata
                storagetypedatax
                storagetypeext
                storagetypeextx
                storagetypekeys
                warehousenokeys
                warehousenumberdatax
                warehousenumberext
                warehousenumberextx
                filtered_table_entries
            USING
                <fs_receivers>-logsys
                'BUS1001001'
                'CLONE'
                syst_info
                .
    IF NOT syst_info IS INITIAL.
      MESSAGE ID syst_info-msgid
            TYPE syst_info-msgty
          NUMBER syst_info-msgno
            WITH syst_info-msgv1 syst_info-msgv2
                 syst_info-msgv3 syst_info-msgv4
      RAISING error_creating_idocs.
    ENDIF.

*   call subroutine to create IDoc data-record                         *
*    CLEAR: syst_info, idoc_data.
*    REFRESH idoc_data.
*    PERFORM idoc_material_maintaindata_rt
*            TABLES
*                clientdata
*                addnlclientdata
*                addnlclientdatax
*                characteristicvalue
*                characteristicvaluex
*                clientdatax
*                clientext
*                clientextx
*                materialdescription
*                materiallongtext
*                plantdata
*                forecastparameters
*                forecastparametersx
*                forecastvalues
*                planningdata
*                planningdatax
*                plantdatax
*                plantext
*                plantextx
*                plantkeys
*                storagelocationdata
*                storagelocationdatax
*                storagelocationext
*                storagelocationextx
*                storagelocationkeys
*                totalconsumption
*                unplndconsumption
*                salesdata
*                distrchainkeys
*                posdata
*                posdatax
*                posext
*                posextx
*                salesdatax
*                salesext
*                salesextx
*                seasons
*                segmrpgeneraldata
*                segmrpquantitydata
*                segsalesstatus
*                segstoragetypedata
*                segvaluationtype
*                segwarehousenumberdata
*                segweightvolume
*                taxclassifications
*                textilecomponents
*                fibercodes
*                unitsofmeasure
*                internationalartnos
*                vendorean
*                layoutmoduleassgmt
*                layoutmoduleassgmtx
*                unitofmeasuretexts
*                unitsofmeasurex
*                valuationdata
*                valuationdatax
*                valuationext
*                valuationextx
*                valuationtypekeys
*                variantskeys
*                warehousenumberdata
*                storagetypedata
*                storagetypedatax
*                storagetypeext
*                storagetypeextx
*                storagetypekeys
*                warehousenokeys
*                warehousenumberdatax
*                warehousenumberext
*                warehousenumberextx
*                filtered_table_entries
*                idoc_data
*            USING
*                headdata
*                <fs_receivers>-logsys
*                'BUS1001001'
*                'CLONE'
*                syst_info
*                .
*    IF NOT syst_info IS INITIAL.
*      MESSAGE ID syst_info-msgid
*            TYPE syst_info-msgty
*          NUMBER syst_info-msgno
*            WITH syst_info-msgv1 syst_info-msgv2
*                 syst_info-msgv3 syst_info-msgv4
*      RAISING error_creating_idocs.
*    ENDIF.

*   distribute idocs                                                   *
*    REFRESH: idoc_receiver, idoc_comm.
*    APPEND receivers TO idoc_receiver.
*    CALL FUNCTION 'ALE_IDOCS_CREATE'
*         EXPORTING
*              idoc_control                = idoc_control
*              obj_type                    = obj_type
*              chnum                       = serial_id
*         TABLES
*              idoc_data                   = idoc_data
*              receivers                   = idoc_receiver
**             CREATED_IDOCS               =                            *
*              created_idocs_additional    = idoc_comm
*              application_objects         = application_objects
*         EXCEPTIONS
*              idoc_input_was_inconsistent = 1
*              OTHERS                      = 2
*              .
*    IF sy-subrc <> 0.
*      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
*      RAISING error_creating_idocs.
*    ENDIF.
*
*    IF communication_documents IS REQUESTED.
*      LOOP AT idoc_comm.
*        CLEAR communication_documents.
*        communication_documents-objtype  = 'IDOC'.
*        communication_documents-objkey   = idoc_comm-docnum.
*        communication_documents-logsys   = idoc_comm-rcvprn.
*        communication_documents-describe = space.
*        APPEND communication_documents.
*      ENDLOOP.
*    ENDIF.

  ENDLOOP.
* applications do commit work to trigger communications                *





*}   INSERT
ENDFUNCTION.
*{   INSERT         DS1K901359                                        1


* subroutine filtering table parameters                                *
FORM bflt_material_maintaindata_rt
     TABLES
         clientdata STRUCTURE bapie1marart
         addnlclientdata STRUCTURE bapie1maw1rt
         addnlclientdatax STRUCTURE bapie1maw1rtx
         characteristicvalue STRUCTURE bapie1ausprt
         characteristicvaluex STRUCTURE bapie1ausprtx
         clientdatax STRUCTURE bapie1marartx
         clientext STRUCTURE bapie1maraextrt
         clientextx STRUCTURE bapie1maraextrtx
         materialdescription STRUCTURE bapie1maktrt
         materiallongtext STRUCTURE bapie1mltxrt
         plantdata STRUCTURE bapie1marcrt
         forecastparameters STRUCTURE bapie1mpoprt
         forecastparametersx STRUCTURE bapie1mpoprtx
         forecastvalues STRUCTURE bapie1mprwrt
         planningdata STRUCTURE bapie1mpgdrt
         planningdatax STRUCTURE bapie1mpgdrtx
         plantdatax STRUCTURE bapie1marcrtx
         plantext STRUCTURE bapie1marcextrt
         plantextx STRUCTURE bapie1marcextrtx
         plantkeys STRUCTURE bapie1wrkkey
         storagelocationdata STRUCTURE bapie1mardrt
         storagelocationdatax STRUCTURE bapie1mardrtx
         storagelocationext STRUCTURE bapie1mardextrt
         storagelocationextx STRUCTURE bapie1mardextrtx
         storagelocationkeys STRUCTURE bapie1lgokey
         totalconsumption STRUCTURE bapie1mvegrt
         unplndconsumption STRUCTURE bapie1mveurt
         salesdata STRUCTURE bapie1mvkert
         distrchainkeys STRUCTURE bapie1vtlkey
         posdata STRUCTURE bapie1wlk2rt
         posdatax STRUCTURE bapie1wlk2rtx
         posext STRUCTURE bapie1wlk2extrt
         posextx STRUCTURE bapie1wlk2extrtx
         salesdatax STRUCTURE bapie1mvkertx
         salesext STRUCTURE bapie1mvkeextrt
         salesextx STRUCTURE bapie1mvkeextrtx
         seasons STRUCTURE bapifshseasons
         segmrpgeneraldata STRUCTURE bapisgtmrpgn
         segmrpquantitydata STRUCTURE bapisgtmrp
         segsalesstatus STRUCTURE bapisgtmvke
         segstoragetypedata STRUCTURE bapisgtmlgt
         segvaluationtype STRUCTURE bapisgtmadka
         segwarehousenumberdata STRUCTURE bapisgtmlgn
         segweightvolume STRUCTURE bapisgtmarm
         taxclassifications STRUCTURE bapie1mlanrt
         textilecomponents STRUCTURE bapitextlcomp
         fibercodes STRUCTURE bapitextlfibr
         unitsofmeasure STRUCTURE bapie1marmrt
         internationalartnos STRUCTURE bapie1meanrt
         vendorean STRUCTURE bapie1mleart
         layoutmoduleassgmt STRUCTURE bapie1malgrt
         layoutmoduleassgmtx STRUCTURE bapie1malgrtx
         unitofmeasuretexts STRUCTURE bapie1mamtrt
         unitsofmeasurex STRUCTURE bapie1marmrtx
         valuationdata STRUCTURE bapie1mbewrt
         valuationdatax STRUCTURE bapie1mbewrtx
         valuationext STRUCTURE bapie1mbewextrt
         valuationextx STRUCTURE bapie1mbewextrtx
         valuationtypekeys STRUCTURE bapie1bwakey
         variantskeys STRUCTURE bapie1varkey
         warehousenumberdata STRUCTURE bapie1mlgnrt
         storagetypedata STRUCTURE bapie1mlgtrt
         storagetypedatax STRUCTURE bapie1mlgtrtx
         storagetypeext STRUCTURE bapie1mlgtextrt
         storagetypeextx STRUCTURE bapie1mlgtextrtx
         storagetypekeys STRUCTURE bapie1lgtkey
         warehousenokeys STRUCTURE bapie1lgnkey
         warehousenumberdatax STRUCTURE bapie1mlgnrtx
         warehousenumberext STRUCTURE bapie1mlgnextrt
         warehousenumberextx STRUCTURE bapie1mlgnextrtx
         filtered_table_entries STRUCTURE bdi_btabix
     USING
         receiver LIKE bdi_logsys-logsys
         object LIKE swotdv-objtype
         method LIKE swotdv-verb
         syst_info LIKE syst
         .

  DATA: filtered_parent TYPE c.

  DATA: tab_index TYPE sy-tabix.

  REFRESH filtered_table_entries.

* for parameter 'CLIENTDATA'                                           *
  DATA: f_clientdata TYPE c,
        t_clientdata LIKE clientdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'CLIENTDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_clientdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_clientdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'CLIENTDATA'
       TO filtered_table_entries-tabname.
    LOOP AT clientdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.


  IF filtered_parent IS INITIAL AND
     f_clientdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'CLIENTDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = clientdata
        p_data_filtered          = t_clientdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'ADDNLCLIENTDATA'                                      *
  DATA: f_addnlclientdata TYPE c,
        t_addnlclientdata LIKE addnlclientdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'ADDNLCLIENTDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_addnlclientdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_addnlclientdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'ADDNLCLIENTDATA'
       TO filtered_table_entries-tabname.
    LOOP AT addnlclientdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_clientdata LIKE clientdata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_addnlclientdata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT addnlclientdata.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = addnlclientdata-material
                      material_long
                      = addnlclientdata-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'ADDNLCLIENTDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_addnlclientdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'ADDNLCLIENTDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = addnlclientdata
        p_data_filtered          = t_addnlclientdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'ADDNLCLIENTDATAX'                                     *
  DATA: f_addnlclientdatax TYPE c,
        t_addnlclientdatax LIKE addnlclientdatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'ADDNLCLIENTDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_addnlclientdatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_addnlclientdatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'ADDNLCLIENTDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT addnlclientdatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_addnlclientdata LIKE addnlclientdata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_addnlclientdata[] = t_addnlclientdata[].
  SORT x_addnlclientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_addnlclientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_addnlclientdatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT addnlclientdatax.
      tab_index = sy-tabix.
      READ TABLE x_addnlclientdata WITH KEY
                      material
                      = addnlclientdatax-material
                      material_long
                      = addnlclientdatax-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'ADDNLCLIENTDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_addnlclientdata.

  IF filtered_parent IS INITIAL AND
     f_addnlclientdatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'ADDNLCLIENTDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = addnlclientdatax
        p_data_filtered          = t_addnlclientdatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'CHARACTERISTICVALUE'                                  *
  DATA: f_characteristicvalue TYPE c,
        t_characteristicvalue LIKE characteristicvalue
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'CHARACTERISTICVALUE'
      receiver         = receiver
    IMPORTING
      filtered         = f_characteristicvalue
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_characteristicvalue IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'CHARACTERISTICVALUE'
       TO filtered_table_entries-tabname.
    LOOP AT characteristicvalue.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_characteristicvalue IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT characteristicvalue.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = characteristicvalue-material
                      material_long
                      = characteristicvalue-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'CHARACTERISTICVALUE'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_characteristicvalue IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'CHARACTERISTICVALUE'
        receiver                 = receiver
      TABLES
        p_data_original          = characteristicvalue
        p_data_filtered          = t_characteristicvalue
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'CHARACTERISTICVALUEX'                                 *
  DATA: f_characteristicvaluex TYPE c,
        t_characteristicvaluex LIKE characteristicvaluex
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'CHARACTERISTICVALUEX'
      receiver         = receiver
    IMPORTING
      filtered         = f_characteristicvaluex
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_characteristicvaluex IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'CHARACTERISTICVALUEX'
       TO filtered_table_entries-tabname.
    LOOP AT characteristicvaluex.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_characteristicvalue LIKE characteristicvalue
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_characteristicvalue[] = t_characteristicvalue[].
  SORT x_characteristicvalue BY
                      char_name
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_characteristicvalue
                             COMPARING
                                  char_name
                                  material
                                  material_long
                                  .
  IF f_characteristicvaluex IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT characteristicvaluex.
      tab_index = sy-tabix.
      READ TABLE x_characteristicvalue WITH KEY
                      char_name
                      = characteristicvaluex-char_name
                      material
                      = characteristicvaluex-material
                      material_long
                      = characteristicvaluex-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'CHARACTERISTICVALUEX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_characteristicvalue.

  IF filtered_parent IS INITIAL AND
     f_characteristicvaluex IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'CHARACTERISTICVALUEX'
        receiver                 = receiver
      TABLES
        p_data_original          = characteristicvaluex
        p_data_filtered          = t_characteristicvaluex
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'CLIENTDATAX'                                          *
  DATA: f_clientdatax TYPE c,
        t_clientdatax LIKE clientdatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'CLIENTDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_clientdatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_clientdatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'CLIENTDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT clientdatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material_long
                                  material
                                  .
  IF f_clientdatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT clientdatax.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material_long
                      = clientdatax-material_long
                      material
                      = clientdatax-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'CLIENTDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_clientdatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'CLIENTDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = clientdatax
        p_data_filtered          = t_clientdatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'CLIENTEXT'                                            *
  DATA: f_clientext TYPE c,
        t_clientext LIKE clientext
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'CLIENTEXT'
      receiver         = receiver
    IMPORTING
      filtered         = f_clientext
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_clientext IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'CLIENTEXT'
       TO filtered_table_entries-tabname.
    LOOP AT clientext.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_clientext IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT clientext.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = clientext-material
                      material_long
                      = clientext-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'CLIENTEXT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_clientext IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'CLIENTEXT'
        receiver                 = receiver
      TABLES
        p_data_original          = clientext
        p_data_filtered          = t_clientext
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'CLIENTEXTX'                                           *
  DATA: f_clientextx TYPE c,
        t_clientextx LIKE clientextx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'CLIENTEXTX'
      receiver         = receiver
    IMPORTING
      filtered         = f_clientextx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_clientextx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'CLIENTEXTX'
       TO filtered_table_entries-tabname.
    LOOP AT clientextx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_clientext LIKE clientext
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_clientext[] = t_clientext[].
  SORT x_clientext BY
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientext
                             COMPARING
                                  material_long
                                  material
                                  .
  IF f_clientextx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT clientextx.
      tab_index = sy-tabix.
      READ TABLE x_clientext WITH KEY
                      material_long
                      = clientextx-material_long
                      material
                      = clientextx-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'CLIENTEXTX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientext.

  IF filtered_parent IS INITIAL AND
     f_clientextx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'CLIENTEXTX'
        receiver                 = receiver
      TABLES
        p_data_original          = clientextx
        p_data_filtered          = t_clientextx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'MATERIALDESCRIPTION'                                  *
  DATA: f_materialdescription TYPE c,
        t_materialdescription LIKE materialdescription
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'MATERIALDESCRIPTION'
      receiver         = receiver
    IMPORTING
      filtered         = f_materialdescription
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_materialdescription IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'MATERIALDESCRIPTION'
       TO filtered_table_entries-tabname.
    LOOP AT materialdescription.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material_long
                                  material
                                  .
  IF f_materialdescription IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT materialdescription.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material_long
                      = materialdescription-material_long
                      material
                      = materialdescription-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'MATERIALDESCRIPTION'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_materialdescription IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'MATERIALDESCRIPTION'
        receiver                 = receiver
      TABLES
        p_data_original          = materialdescription
        p_data_filtered          = t_materialdescription
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'MATERIALLONGTEXT'                                     *
  DATA: f_materiallongtext TYPE c,
        t_materiallongtext LIKE materiallongtext
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'MATERIALLONGTEXT'
      receiver         = receiver
    IMPORTING
      filtered         = f_materiallongtext
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_materiallongtext IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'MATERIALLONGTEXT'
       TO filtered_table_entries-tabname.
    LOOP AT materiallongtext.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_materiallongtext IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT materiallongtext.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = materiallongtext-material
                      material_long
                      = materiallongtext-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'MATERIALLONGTEXT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_materiallongtext IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'MATERIALLONGTEXT'
        receiver                 = receiver
      TABLES
        p_data_original          = materiallongtext
        p_data_filtered          = t_materiallongtext
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'PLANTDATA'                                            *
  DATA: f_plantdata TYPE c,
        t_plantdata LIKE plantdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'PLANTDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_plantdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_plantdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'PLANTDATA'
       TO filtered_table_entries-tabname.
    LOOP AT plantdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_plantdata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT plantdata.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = plantdata-material
                      material_long
                      = plantdata-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'PLANTDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_plantdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'PLANTDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = plantdata
        p_data_filtered          = t_plantdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'FORECASTPARAMETERS'                                   *
  DATA: f_forecastparameters TYPE c,
        t_forecastparameters LIKE forecastparameters
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'FORECASTPARAMETERS'
      receiver         = receiver
    IMPORTING
      filtered         = f_forecastparameters
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_forecastparameters IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'FORECASTPARAMETERS'
       TO filtered_table_entries-tabname.
    LOOP AT forecastparameters.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_plantdata LIKE plantdata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_plantdata[] = t_plantdata[].
  SORT x_plantdata BY
                      material
                      material_long
                      plant
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantdata
                             COMPARING
                                  material
                                  material_long
                                  plant
                                  .
  IF f_forecastparameters IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT forecastparameters.
      tab_index = sy-tabix.
      READ TABLE x_plantdata WITH KEY
                      material
                      = forecastparameters-material
                      material_long
                      = forecastparameters-material_long
                      plant
                      = forecastparameters-plant
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'FORECASTPARAMETERS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantdata.

  IF filtered_parent IS INITIAL AND
     f_forecastparameters IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'FORECASTPARAMETERS'
        receiver                 = receiver
      TABLES
        p_data_original          = forecastparameters
        p_data_filtered          = t_forecastparameters
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'FORECASTPARAMETERSX'                                  *
  DATA: f_forecastparametersx TYPE c,
        t_forecastparametersx LIKE forecastparametersx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'FORECASTPARAMETERSX'
      receiver         = receiver
    IMPORTING
      filtered         = f_forecastparametersx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_forecastparametersx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'FORECASTPARAMETERSX'
       TO filtered_table_entries-tabname.
    LOOP AT forecastparametersx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_forecastparameters LIKE forecastparameters
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_forecastparameters[] = t_forecastparameters[].
  SORT x_forecastparameters BY
                      plant
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_forecastparameters
                             COMPARING
                                  plant
                                  material_long
                                  material
                                  .
  IF f_forecastparametersx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT forecastparametersx.
      tab_index = sy-tabix.
      READ TABLE x_forecastparameters WITH KEY
                      plant
                      = forecastparametersx-plant
                      material_long
                      = forecastparametersx-material_long
                      material
                      = forecastparametersx-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'FORECASTPARAMETERSX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_forecastparameters.

  IF filtered_parent IS INITIAL AND
     f_forecastparametersx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'FORECASTPARAMETERSX'
        receiver                 = receiver
      TABLES
        p_data_original          = forecastparametersx
        p_data_filtered          = t_forecastparametersx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'FORECASTVALUES'                                       *
  DATA: f_forecastvalues TYPE c,
        t_forecastvalues LIKE forecastvalues
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'FORECASTVALUES'
      receiver         = receiver
    IMPORTING
      filtered         = f_forecastvalues
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_forecastvalues IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'FORECASTVALUES'
       TO filtered_table_entries-tabname.
    LOOP AT forecastvalues.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_plantdata[] = t_plantdata[].
  SORT x_plantdata BY
                      material
                      material_long
                      plant
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantdata
                             COMPARING
                                  material
                                  material_long
                                  plant
                                  .
  IF f_forecastvalues IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT forecastvalues.
      tab_index = sy-tabix.
      READ TABLE x_plantdata WITH KEY
                      material
                      = forecastvalues-material
                      material_long
                      = forecastvalues-material_long
                      plant
                      = forecastvalues-plant
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'FORECASTVALUES'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantdata.

  IF filtered_parent IS INITIAL AND
     f_forecastvalues IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'FORECASTVALUES'
        receiver                 = receiver
      TABLES
        p_data_original          = forecastvalues
        p_data_filtered          = t_forecastvalues
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'PLANNINGDATA'                                         *
  DATA: f_planningdata TYPE c,
        t_planningdata LIKE planningdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'PLANNINGDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_planningdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_planningdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'PLANNINGDATA'
       TO filtered_table_entries-tabname.
    LOOP AT planningdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_plantdata[] = t_plantdata[].
  SORT x_plantdata BY
                      plant
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantdata
                             COMPARING
                                  plant
                                  material_long
                                  material
                                  .
  IF f_planningdata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT planningdata.
      tab_index = sy-tabix.
      READ TABLE x_plantdata WITH KEY
                      plant
                      = planningdata-plant
                      material_long
                      = planningdata-material_long
                      material
                      = planningdata-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'PLANNINGDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantdata.

  IF filtered_parent IS INITIAL AND
     f_planningdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'PLANNINGDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = planningdata
        p_data_filtered          = t_planningdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'PLANNINGDATAX'                                        *
  DATA: f_planningdatax TYPE c,
        t_planningdatax LIKE planningdatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'PLANNINGDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_planningdatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_planningdatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'PLANNINGDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT planningdatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_planningdata LIKE planningdata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_planningdata[] = t_planningdata[].
  SORT x_planningdata BY
                      plant
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_planningdata
                             COMPARING
                                  plant
                                  material
                                  material_long
                                  .
  IF f_planningdatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT planningdatax.
      tab_index = sy-tabix.
      READ TABLE x_planningdata WITH KEY
                      plant
                      = planningdatax-plant
                      material
                      = planningdatax-material
                      material_long
                      = planningdatax-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'PLANNINGDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_planningdata.

  IF filtered_parent IS INITIAL AND
     f_planningdatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'PLANNINGDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = planningdatax
        p_data_filtered          = t_planningdatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'PLANTDATAX'                                           *
  DATA: f_plantdatax TYPE c,
        t_plantdatax LIKE plantdatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'PLANTDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_plantdatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_plantdatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'PLANTDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT plantdatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_plantdata[] = t_plantdata[].
  SORT x_plantdata BY
                      material
                      material_long
                      plant
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantdata
                             COMPARING
                                  material
                                  material_long
                                  plant
                                  .
  IF f_plantdatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT plantdatax.
      tab_index = sy-tabix.
      READ TABLE x_plantdata WITH KEY
                      material
                      = plantdatax-material
                      material_long
                      = plantdatax-material_long
                      plant
                      = plantdatax-plant
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'PLANTDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantdata.

  IF filtered_parent IS INITIAL AND
     f_plantdatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'PLANTDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = plantdatax
        p_data_filtered          = t_plantdatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'PLANTEXT'                                             *
  DATA: f_plantext TYPE c,
        t_plantext LIKE plantext
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'PLANTEXT'
      receiver         = receiver
    IMPORTING
      filtered         = f_plantext
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_plantext IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'PLANTEXT'
       TO filtered_table_entries-tabname.
    LOOP AT plantext.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_plantdata[] = t_plantdata[].
  SORT x_plantdata BY
                      material
                      material_long
                      plant
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantdata
                             COMPARING
                                  material
                                  material_long
                                  plant
                                  .
  IF f_plantext IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT plantext.
      tab_index = sy-tabix.
      READ TABLE x_plantdata WITH KEY
                      material
                      = plantext-material
                      material_long
                      = plantext-material_long
                      plant
                      = plantext-plant
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'PLANTEXT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantdata.

  IF filtered_parent IS INITIAL AND
     f_plantext IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'PLANTEXT'
        receiver                 = receiver
      TABLES
        p_data_original          = plantext
        p_data_filtered          = t_plantext
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'PLANTEXTX'                                            *
  DATA: f_plantextx TYPE c,
        t_plantextx LIKE plantextx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'PLANTEXTX'
      receiver         = receiver
    IMPORTING
      filtered         = f_plantextx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_plantextx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'PLANTEXTX'
       TO filtered_table_entries-tabname.
    LOOP AT plantextx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_plantext LIKE plantext
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_plantext[] = t_plantext[].
  SORT x_plantext BY
                      plant
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantext
                             COMPARING
                                  plant
                                  material_long
                                  material
                                  .
  IF f_plantextx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT plantextx.
      tab_index = sy-tabix.
      READ TABLE x_plantext WITH KEY
                      plant
                      = plantextx-plant
                      material_long
                      = plantextx-material_long
                      material
                      = plantextx-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'PLANTEXTX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantext.

  IF filtered_parent IS INITIAL AND
     f_plantextx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'PLANTEXTX'
        receiver                 = receiver
      TABLES
        p_data_original          = plantextx
        p_data_filtered          = t_plantextx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'PLANTKEYS'                                            *
  DATA: f_plantkeys TYPE c,
        t_plantkeys LIKE plantkeys
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'PLANTKEYS'
      receiver         = receiver
    IMPORTING
      filtered         = f_plantkeys
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_plantkeys IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'PLANTKEYS'
       TO filtered_table_entries-tabname.
    LOOP AT plantkeys.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_plantdata[] = t_plantdata[].
  SORT x_plantdata BY
                      material
                      material_long
                      plant
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantdata
                             COMPARING
                                  material
                                  material_long
                                  plant
                                  .
  IF f_plantkeys IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT plantkeys.
      tab_index = sy-tabix.
      READ TABLE x_plantdata WITH KEY
                      material
                      = plantkeys-material
                      material_long
                      = plantkeys-material_long
                      plant
                      = plantkeys-plant
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'PLANTKEYS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantdata.

  IF filtered_parent IS INITIAL AND
     f_plantkeys IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'PLANTKEYS'
        receiver                 = receiver
      TABLES
        p_data_original          = plantkeys
        p_data_filtered          = t_plantkeys
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGELOCATIONDATA'                                  *
  DATA: f_storagelocationdata TYPE c,
        t_storagelocationdata LIKE storagelocationdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGELOCATIONDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagelocationdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagelocationdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGELOCATIONDATA'
       TO filtered_table_entries-tabname.
    LOOP AT storagelocationdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_plantdata[] = t_plantdata[].
  SORT x_plantdata BY
                      material
                      material_long
                      plant
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantdata
                             COMPARING
                                  material
                                  material_long
                                  plant
                                  .
  IF f_storagelocationdata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagelocationdata.
      tab_index = sy-tabix.
      READ TABLE x_plantdata WITH KEY
                      material
                      = storagelocationdata-material
                      material_long
                      = storagelocationdata-material_long
                      plant
                      = storagelocationdata-plant
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGELOCATIONDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantdata.

  IF filtered_parent IS INITIAL AND
     f_storagelocationdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGELOCATIONDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = storagelocationdata
        p_data_filtered          = t_storagelocationdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGELOCATIONDATAX'                                 *
  DATA: f_storagelocationdatax TYPE c,
        t_storagelocationdatax LIKE storagelocationdatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGELOCATIONDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagelocationdatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagelocationdatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGELOCATIONDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT storagelocationdatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_storagelocationdata LIKE storagelocationdata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_storagelocationdata[] = t_storagelocationdata[].
  SORT x_storagelocationdata BY
                      material
                      material_long
                      plant
                      stge_loc
                      .
  DELETE ADJACENT DUPLICATES FROM x_storagelocationdata
                             COMPARING
                                  material
                                  material_long
                                  plant
                                  stge_loc
                                  .
  IF f_storagelocationdatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagelocationdatax.
      tab_index = sy-tabix.
      READ TABLE x_storagelocationdata WITH KEY
                      material
                      = storagelocationdatax-material
                      material_long
                      = storagelocationdatax-material_long
                      plant
                      = storagelocationdatax-plant
                      stge_loc
                      = storagelocationdatax-stge_loc
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGELOCATIONDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_storagelocationdata.

  IF filtered_parent IS INITIAL AND
     f_storagelocationdatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGELOCATIONDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = storagelocationdatax
        p_data_filtered          = t_storagelocationdatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGELOCATIONEXT'                                   *
  DATA: f_storagelocationext TYPE c,
        t_storagelocationext LIKE storagelocationext
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGELOCATIONEXT'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagelocationext
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagelocationext IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGELOCATIONEXT'
       TO filtered_table_entries-tabname.
    LOOP AT storagelocationext.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_storagelocationdata[] = t_storagelocationdata[].
  SORT x_storagelocationdata BY
                      stge_loc
                      plant
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_storagelocationdata
                             COMPARING
                                  stge_loc
                                  plant
                                  material_long
                                  material
                                  .
  IF f_storagelocationext IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagelocationext.
      tab_index = sy-tabix.
      READ TABLE x_storagelocationdata WITH KEY
                      stge_loc
                      = storagelocationext-stge_loc
                      plant
                      = storagelocationext-plant
                      material_long
                      = storagelocationext-material_long
                      material
                      = storagelocationext-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGELOCATIONEXT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_storagelocationdata.

  IF filtered_parent IS INITIAL AND
     f_storagelocationext IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGELOCATIONEXT'
        receiver                 = receiver
      TABLES
        p_data_original          = storagelocationext
        p_data_filtered          = t_storagelocationext
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGELOCATIONEXTX'                                  *
  DATA: f_storagelocationextx TYPE c,
        t_storagelocationextx LIKE storagelocationextx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGELOCATIONEXTX'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagelocationextx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagelocationextx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGELOCATIONEXTX'
       TO filtered_table_entries-tabname.
    LOOP AT storagelocationextx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_storagelocationext LIKE storagelocationext
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_storagelocationext[] = t_storagelocationext[].
  SORT x_storagelocationext BY
                      material
                      material_long
                      plant
                      stge_loc
                      .
  DELETE ADJACENT DUPLICATES FROM x_storagelocationext
                             COMPARING
                                  material
                                  material_long
                                  plant
                                  stge_loc
                                  .
  IF f_storagelocationextx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagelocationextx.
      tab_index = sy-tabix.
      READ TABLE x_storagelocationext WITH KEY
                      material
                      = storagelocationextx-material
                      material_long
                      = storagelocationextx-material_long
                      plant
                      = storagelocationextx-plant
                      stge_loc
                      = storagelocationextx-stge_loc
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGELOCATIONEXTX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_storagelocationext.

  IF filtered_parent IS INITIAL AND
     f_storagelocationextx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGELOCATIONEXTX'
        receiver                 = receiver
      TABLES
        p_data_original          = storagelocationextx
        p_data_filtered          = t_storagelocationextx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGELOCATIONKEYS'                                  *
  DATA: f_storagelocationkeys TYPE c,
        t_storagelocationkeys LIKE storagelocationkeys
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGELOCATIONKEYS'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagelocationkeys
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagelocationkeys IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGELOCATIONKEYS'
       TO filtered_table_entries-tabname.
    LOOP AT storagelocationkeys.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_storagelocationdata[] = t_storagelocationdata[].
  SORT x_storagelocationdata BY
                      stge_loc
                      plant
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_storagelocationdata
                             COMPARING
                                  stge_loc
                                  plant
                                  material_long
                                  material
                                  .
  IF f_storagelocationkeys IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagelocationkeys.
      tab_index = sy-tabix.
      READ TABLE x_storagelocationdata WITH KEY
                      stge_loc
                      = storagelocationkeys-stge_loc
                      plant
                      = storagelocationkeys-plant
                      material_long
                      = storagelocationkeys-material_long
                      material
                      = storagelocationkeys-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGELOCATIONKEYS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_storagelocationdata.

  IF filtered_parent IS INITIAL AND
     f_storagelocationkeys IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGELOCATIONKEYS'
        receiver                 = receiver
      TABLES
        p_data_original          = storagelocationkeys
        p_data_filtered          = t_storagelocationkeys
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'TOTALCONSUMPTION'                                     *
  DATA: f_totalconsumption TYPE c,
        t_totalconsumption LIKE totalconsumption
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'TOTALCONSUMPTION'
      receiver         = receiver
    IMPORTING
      filtered         = f_totalconsumption
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_totalconsumption IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'TOTALCONSUMPTION'
       TO filtered_table_entries-tabname.
    LOOP AT totalconsumption.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_plantdata[] = t_plantdata[].
  SORT x_plantdata BY
                      material
                      material_long
                      plant
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantdata
                             COMPARING
                                  material
                                  material_long
                                  plant
                                  .
  IF f_totalconsumption IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT totalconsumption.
      tab_index = sy-tabix.
      READ TABLE x_plantdata WITH KEY
                      material
                      = totalconsumption-material
                      material_long
                      = totalconsumption-material_long
                      plant
                      = totalconsumption-plant
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'TOTALCONSUMPTION'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantdata.

  IF filtered_parent IS INITIAL AND
     f_totalconsumption IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'TOTALCONSUMPTION'
        receiver                 = receiver
      TABLES
        p_data_original          = totalconsumption
        p_data_filtered          = t_totalconsumption
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'UNPLNDCONSUMPTION'                                    *
  DATA: f_unplndconsumption TYPE c,
        t_unplndconsumption LIKE unplndconsumption
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'UNPLNDCONSUMPTION'
      receiver         = receiver
    IMPORTING
      filtered         = f_unplndconsumption
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_unplndconsumption IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'UNPLNDCONSUMPTION'
       TO filtered_table_entries-tabname.
    LOOP AT unplndconsumption.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_plantdata[] = t_plantdata[].
  SORT x_plantdata BY
                      plant
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_plantdata
                             COMPARING
                                  plant
                                  material_long
                                  material
                                  .
  IF f_unplndconsumption IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT unplndconsumption.
      tab_index = sy-tabix.
      READ TABLE x_plantdata WITH KEY
                      plant
                      = unplndconsumption-plant
                      material_long
                      = unplndconsumption-material_long
                      material
                      = unplndconsumption-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'UNPLNDCONSUMPTION'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_plantdata.

  IF filtered_parent IS INITIAL AND
     f_unplndconsumption IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'UNPLNDCONSUMPTION'
        receiver                 = receiver
      TABLES
        p_data_original          = unplndconsumption
        p_data_filtered          = t_unplndconsumption
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SALESDATA'                                            *
  DATA: f_salesdata TYPE c,
        t_salesdata LIKE salesdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SALESDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_salesdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_salesdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SALESDATA'
       TO filtered_table_entries-tabname.
    LOOP AT salesdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_salesdata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT salesdata.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = salesdata-material
                      material_long
                      = salesdata-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SALESDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_salesdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SALESDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = salesdata
        p_data_filtered          = t_salesdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'DISTRCHAINKEYS'                                       *
  DATA: f_distrchainkeys TYPE c,
        t_distrchainkeys LIKE distrchainkeys
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'DISTRCHAINKEYS'
      receiver         = receiver
    IMPORTING
      filtered         = f_distrchainkeys
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_distrchainkeys IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'DISTRCHAINKEYS'
       TO filtered_table_entries-tabname.
    LOOP AT distrchainkeys.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_salesdata LIKE salesdata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_salesdata[] = t_salesdata[].
  SORT x_salesdata BY
                      distr_chan
                      material
                      material_long
                      sales_org
                      .
  DELETE ADJACENT DUPLICATES FROM x_salesdata
                             COMPARING
                                  distr_chan
                                  material
                                  material_long
                                  sales_org
                                  .
  IF f_distrchainkeys IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT distrchainkeys.
      tab_index = sy-tabix.
      READ TABLE x_salesdata WITH KEY
                      distr_chan
                      = distrchainkeys-distr_chan
                      material
                      = distrchainkeys-material
                      material_long
                      = distrchainkeys-material_long
                      sales_org
                      = distrchainkeys-sales_org
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'DISTRCHAINKEYS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_salesdata.

  IF filtered_parent IS INITIAL AND
     f_distrchainkeys IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'DISTRCHAINKEYS'
        receiver                 = receiver
      TABLES
        p_data_original          = distrchainkeys
        p_data_filtered          = t_distrchainkeys
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'POSDATA'                                              *
  DATA: f_posdata TYPE c,
        t_posdata LIKE posdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'POSDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_posdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_posdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'POSDATA'
       TO filtered_table_entries-tabname.
    LOOP AT posdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_salesdata[] = t_salesdata[].
  SORT x_salesdata BY
                      distr_chan
                      material
                      material_long
                      sales_org
                      .
  DELETE ADJACENT DUPLICATES FROM x_salesdata
                             COMPARING
                                  distr_chan
                                  material
                                  material_long
                                  sales_org
                                  .
  IF f_posdata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT posdata.
      tab_index = sy-tabix.
      READ TABLE x_salesdata WITH KEY
                      distr_chan
                      = posdata-distr_chan
                      material
                      = posdata-material
                      material_long
                      = posdata-material_long
                      sales_org
                      = posdata-sales_org
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'POSDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_salesdata.

  IF filtered_parent IS INITIAL AND
     f_posdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'POSDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = posdata
        p_data_filtered          = t_posdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'POSDATAX'                                             *
  DATA: f_posdatax TYPE c,
        t_posdatax LIKE posdatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'POSDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_posdatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_posdatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'POSDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT posdatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_posdata LIKE posdata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_posdata[] = t_posdata[].
  SORT x_posdata BY
                      distr_chan
                      material
                      material_long
                      sales_org
                      .
  DELETE ADJACENT DUPLICATES FROM x_posdata
                             COMPARING
                                  distr_chan
                                  material
                                  material_long
                                  sales_org
                                  .
  IF f_posdatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT posdatax.
      tab_index = sy-tabix.
      READ TABLE x_posdata WITH KEY
                      distr_chan
                      = posdatax-distr_chan
                      material
                      = posdatax-material
                      material_long
                      = posdatax-material_long
                      sales_org
                      = posdatax-sales_org
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'POSDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_posdata.

  IF filtered_parent IS INITIAL AND
     f_posdatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'POSDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = posdatax
        p_data_filtered          = t_posdatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'POSEXT'                                               *
  DATA: f_posext TYPE c,
        t_posext LIKE posext
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'POSEXT'
      receiver         = receiver
    IMPORTING
      filtered         = f_posext
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_posext IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'POSEXT'
       TO filtered_table_entries-tabname.
    LOOP AT posext.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_posdata[] = t_posdata[].
  SORT x_posdata BY
                      distr_chan
                      material
                      material_long
                      plant
                      sales_org
                      .
  DELETE ADJACENT DUPLICATES FROM x_posdata
                             COMPARING
                                  distr_chan
                                  material
                                  material_long
                                  plant
                                  sales_org
                                  .
  IF f_posext IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT posext.
      tab_index = sy-tabix.
      READ TABLE x_posdata WITH KEY
                      distr_chan
                      = posext-distr_chan
                      material
                      = posext-material
                      material_long
                      = posext-material_long
                      plant
                      = posext-plant
                      sales_org
                      = posext-sales_org
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'POSEXT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_posdata.

  IF filtered_parent IS INITIAL AND
     f_posext IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'POSEXT'
        receiver                 = receiver
      TABLES
        p_data_original          = posext
        p_data_filtered          = t_posext
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'POSEXTX'                                              *
  DATA: f_posextx TYPE c,
        t_posextx LIKE posextx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'POSEXTX'
      receiver         = receiver
    IMPORTING
      filtered         = f_posextx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_posextx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'POSEXTX'
       TO filtered_table_entries-tabname.
    LOOP AT posextx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_posext LIKE posext
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_posext[] = t_posext[].
  SORT x_posext BY
                      distr_chan
                      material
                      material_long
                      plant
                      sales_org
                      .
  DELETE ADJACENT DUPLICATES FROM x_posext
                             COMPARING
                                  distr_chan
                                  material
                                  material_long
                                  plant
                                  sales_org
                                  .
  IF f_posextx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT posextx.
      tab_index = sy-tabix.
      READ TABLE x_posext WITH KEY
                      distr_chan
                      = posextx-distr_chan
                      material
                      = posextx-material
                      material_long
                      = posextx-material_long
                      plant
                      = posextx-plant
                      sales_org
                      = posextx-sales_org
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'POSEXTX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_posext.

  IF filtered_parent IS INITIAL AND
     f_posextx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'POSEXTX'
        receiver                 = receiver
      TABLES
        p_data_original          = posextx
        p_data_filtered          = t_posextx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SALESDATAX'                                           *
  DATA: f_salesdatax TYPE c,
        t_salesdatax LIKE salesdatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SALESDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_salesdatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_salesdatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SALESDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT salesdatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_salesdata[] = t_salesdata[].
  SORT x_salesdata BY
                      distr_chan
                      material
                      material_long
                      sales_org
                      .
  DELETE ADJACENT DUPLICATES FROM x_salesdata
                             COMPARING
                                  distr_chan
                                  material
                                  material_long
                                  sales_org
                                  .
  IF f_salesdatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT salesdatax.
      tab_index = sy-tabix.
      READ TABLE x_salesdata WITH KEY
                      distr_chan
                      = salesdatax-distr_chan
                      material
                      = salesdatax-material
                      material_long
                      = salesdatax-material_long
                      sales_org
                      = salesdatax-sales_org
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SALESDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_salesdata.

  IF filtered_parent IS INITIAL AND
     f_salesdatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SALESDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = salesdatax
        p_data_filtered          = t_salesdatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SALESEXT'                                             *
  DATA: f_salesext TYPE c,
        t_salesext LIKE salesext
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SALESEXT'
      receiver         = receiver
    IMPORTING
      filtered         = f_salesext
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_salesext IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SALESEXT'
       TO filtered_table_entries-tabname.
    LOOP AT salesext.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_salesdata[] = t_salesdata[].
  SORT x_salesdata BY
                      sales_org
                      material_long
                      distr_chan
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_salesdata
                             COMPARING
                                  sales_org
                                  material_long
                                  distr_chan
                                  material
                                  .
  IF f_salesext IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT salesext.
      tab_index = sy-tabix.
      READ TABLE x_salesdata WITH KEY
                      sales_org
                      = salesext-sales_org
                      material_long
                      = salesext-material_long
                      distr_chan
                      = salesext-distr_chan
                      material
                      = salesext-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SALESEXT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_salesdata.

  IF filtered_parent IS INITIAL AND
     f_salesext IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SALESEXT'
        receiver                 = receiver
      TABLES
        p_data_original          = salesext
        p_data_filtered          = t_salesext
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SALESEXTX'                                            *
  DATA: f_salesextx TYPE c,
        t_salesextx LIKE salesextx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SALESEXTX'
      receiver         = receiver
    IMPORTING
      filtered         = f_salesextx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_salesextx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SALESEXTX'
       TO filtered_table_entries-tabname.
    LOOP AT salesextx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_salesext LIKE salesext
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_salesext[] = t_salesext[].
  SORT x_salesext BY
                      sales_org
                      material_long
                      material
                      distr_chan
                      .
  DELETE ADJACENT DUPLICATES FROM x_salesext
                             COMPARING
                                  sales_org
                                  material_long
                                  material
                                  distr_chan
                                  .
  IF f_salesextx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT salesextx.
      tab_index = sy-tabix.
      READ TABLE x_salesext WITH KEY
                      sales_org
                      = salesextx-sales_org
                      material_long
                      = salesextx-material_long
                      material
                      = salesextx-material
                      distr_chan
                      = salesextx-distr_chan
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SALESEXTX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_salesext.

  IF filtered_parent IS INITIAL AND
     f_salesextx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SALESEXTX'
        receiver                 = receiver
      TABLES
        p_data_original          = salesextx
        p_data_filtered          = t_salesextx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SEASONS'                                              *
  DATA: f_seasons TYPE c,
        t_seasons LIKE seasons
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SEASONS'
      receiver         = receiver
    IMPORTING
      filtered         = f_seasons
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_seasons IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SEASONS'
       TO filtered_table_entries-tabname.
    LOOP AT seasons.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_seasons IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT seasons.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = seasons-material
                      material_long
                      = seasons-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SEASONS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_seasons IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SEASONS'
        receiver                 = receiver
      TABLES
        p_data_original          = seasons
        p_data_filtered          = t_seasons
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SEGMRPGENERALDATA'                                    *
  DATA: f_segmrpgeneraldata TYPE c,
        t_segmrpgeneraldata LIKE segmrpgeneraldata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SEGMRPGENERALDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_segmrpgeneraldata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_segmrpgeneraldata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SEGMRPGENERALDATA'
       TO filtered_table_entries-tabname.
    LOOP AT segmrpgeneraldata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_segmrpgeneraldata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT segmrpgeneraldata.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = segmrpgeneraldata-material
                      material_long
                      = segmrpgeneraldata-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SEGMRPGENERALDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_segmrpgeneraldata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SEGMRPGENERALDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = segmrpgeneraldata
        p_data_filtered          = t_segmrpgeneraldata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SEGMRPQUANTITYDATA'                                   *
  DATA: f_segmrpquantitydata TYPE c,
        t_segmrpquantitydata LIKE segmrpquantitydata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SEGMRPQUANTITYDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_segmrpquantitydata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_segmrpquantitydata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SEGMRPQUANTITYDATA'
       TO filtered_table_entries-tabname.
    LOOP AT segmrpquantitydata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material_long
                                  material
                                  .
  IF f_segmrpquantitydata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT segmrpquantitydata.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material_long
                      = segmrpquantitydata-material_long
                      material
                      = segmrpquantitydata-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SEGMRPQUANTITYDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_segmrpquantitydata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SEGMRPQUANTITYDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = segmrpquantitydata
        p_data_filtered          = t_segmrpquantitydata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SEGSALESSTATUS'                                       *
  DATA: f_segsalesstatus TYPE c,
        t_segsalesstatus LIKE segsalesstatus
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SEGSALESSTATUS'
      receiver         = receiver
    IMPORTING
      filtered         = f_segsalesstatus
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_segsalesstatus IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SEGSALESSTATUS'
       TO filtered_table_entries-tabname.
    LOOP AT segsalesstatus.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material_long
                                  material
                                  .
  IF f_segsalesstatus IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT segsalesstatus.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material_long
                      = segsalesstatus-material_long
                      material
                      = segsalesstatus-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SEGSALESSTATUS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_segsalesstatus IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SEGSALESSTATUS'
        receiver                 = receiver
      TABLES
        p_data_original          = segsalesstatus
        p_data_filtered          = t_segsalesstatus
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SEGSTORAGETYPEDATA'                                   *
  DATA: f_segstoragetypedata TYPE c,
        t_segstoragetypedata LIKE segstoragetypedata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SEGSTORAGETYPEDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_segstoragetypedata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_segstoragetypedata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SEGSTORAGETYPEDATA'
       TO filtered_table_entries-tabname.
    LOOP AT segstoragetypedata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_segstoragetypedata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT segstoragetypedata.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = segstoragetypedata-material
                      material_long
                      = segstoragetypedata-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SEGSTORAGETYPEDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_segstoragetypedata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SEGSTORAGETYPEDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = segstoragetypedata
        p_data_filtered          = t_segstoragetypedata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SEGVALUATIONTYPE'                                     *
  DATA: f_segvaluationtype TYPE c,
        t_segvaluationtype LIKE segvaluationtype
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SEGVALUATIONTYPE'
      receiver         = receiver
    IMPORTING
      filtered         = f_segvaluationtype
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_segvaluationtype IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SEGVALUATIONTYPE'
       TO filtered_table_entries-tabname.
    LOOP AT segvaluationtype.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_segvaluationtype IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT segvaluationtype.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = segvaluationtype-material
                      material_long
                      = segvaluationtype-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SEGVALUATIONTYPE'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_segvaluationtype IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SEGVALUATIONTYPE'
        receiver                 = receiver
      TABLES
        p_data_original          = segvaluationtype
        p_data_filtered          = t_segvaluationtype
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SEGWAREHOUSENUMBERDATA'                               *
  DATA: f_segwarehousenumberdata TYPE c,
        t_segwarehousenumberdata LIKE segwarehousenumberdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SEGWAREHOUSENUMBERDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_segwarehousenumberdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_segwarehousenumberdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SEGWAREHOUSENUMBERDATA'
       TO filtered_table_entries-tabname.
    LOOP AT segwarehousenumberdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_segwarehousenumberdata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT segwarehousenumberdata.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = segwarehousenumberdata-material
                      material_long
                      = segwarehousenumberdata-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SEGWAREHOUSENUMBERDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_segwarehousenumberdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SEGWAREHOUSENUMBERDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = segwarehousenumberdata
        p_data_filtered          = t_segwarehousenumberdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'SEGWEIGHTVOLUME'                                      *
  DATA: f_segweightvolume TYPE c,
        t_segweightvolume LIKE segweightvolume
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'SEGWEIGHTVOLUME'
      receiver         = receiver
    IMPORTING
      filtered         = f_segweightvolume
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_segweightvolume IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'SEGWEIGHTVOLUME'
       TO filtered_table_entries-tabname.
    LOOP AT segweightvolume.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_segweightvolume IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT segweightvolume.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = segweightvolume-material
                      material_long
                      = segweightvolume-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'SEGWEIGHTVOLUME'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_segweightvolume IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'SEGWEIGHTVOLUME'
        receiver                 = receiver
      TABLES
        p_data_original          = segweightvolume
        p_data_filtered          = t_segweightvolume
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'TAXCLASSIFICATIONS'                                   *
  DATA: f_taxclassifications TYPE c,
        t_taxclassifications LIKE taxclassifications
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'TAXCLASSIFICATIONS'
      receiver         = receiver
    IMPORTING
      filtered         = f_taxclassifications
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_taxclassifications IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'TAXCLASSIFICATIONS'
       TO filtered_table_entries-tabname.
    LOOP AT taxclassifications.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material_long
                                  material
                                  .
  IF f_taxclassifications IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT taxclassifications.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material_long
                      = taxclassifications-material_long
                      material
                      = taxclassifications-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'TAXCLASSIFICATIONS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_taxclassifications IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'TAXCLASSIFICATIONS'
        receiver                 = receiver
      TABLES
        p_data_original          = taxclassifications
        p_data_filtered          = t_taxclassifications
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'TEXTILECOMPONENTS'                                    *
  DATA: f_textilecomponents TYPE c,
        t_textilecomponents LIKE textilecomponents
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'TEXTILECOMPONENTS'
      receiver         = receiver
    IMPORTING
      filtered         = f_textilecomponents
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_textilecomponents IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'TEXTILECOMPONENTS'
       TO filtered_table_entries-tabname.
    LOOP AT textilecomponents.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material_long
                                  material
                                  .
  IF f_textilecomponents IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT textilecomponents.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material_long
                      = textilecomponents-material_long
                      material
                      = textilecomponents-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'TEXTILECOMPONENTS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_textilecomponents IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'TEXTILECOMPONENTS'
        receiver                 = receiver
      TABLES
        p_data_original          = textilecomponents
        p_data_filtered          = t_textilecomponents
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'FIBERCODES'                                           *
  DATA: f_fibercodes TYPE c,
        t_fibercodes LIKE fibercodes
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'FIBERCODES'
      receiver         = receiver
    IMPORTING
      filtered         = f_fibercodes
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_fibercodes IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'FIBERCODES'
       TO filtered_table_entries-tabname.
    LOOP AT fibercodes.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_textilecomponents LIKE textilecomponents
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_textilecomponents[] = t_textilecomponents[].
  SORT x_textilecomponents BY
                      material
                      material_long
                      textile_component_position
                      .
  DELETE ADJACENT DUPLICATES FROM x_textilecomponents
                             COMPARING
                                  material
                                  material_long
                                  textile_component_position
                                  .
  IF f_fibercodes IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT fibercodes.
      tab_index = sy-tabix.
      READ TABLE x_textilecomponents WITH KEY
                      material
                      = fibercodes-material
                      material_long
                      = fibercodes-material_long
                      textile_component_position
                      = fibercodes-textile_component_position
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'FIBERCODES'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_textilecomponents.

  IF filtered_parent IS INITIAL AND
     f_fibercodes IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'FIBERCODES'
        receiver                 = receiver
      TABLES
        p_data_original          = fibercodes
        p_data_filtered          = t_fibercodes
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'UNITSOFMEASURE'                                       *
  DATA: f_unitsofmeasure TYPE c,
        t_unitsofmeasure LIKE unitsofmeasure
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'UNITSOFMEASURE'
      receiver         = receiver
    IMPORTING
      filtered         = f_unitsofmeasure
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_unitsofmeasure IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'UNITSOFMEASURE'
       TO filtered_table_entries-tabname.
    LOOP AT unitsofmeasure.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_unitsofmeasure IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT unitsofmeasure.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = unitsofmeasure-material
                      material_long
                      = unitsofmeasure-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'UNITSOFMEASURE'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_unitsofmeasure IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'UNITSOFMEASURE'
        receiver                 = receiver
      TABLES
        p_data_original          = unitsofmeasure
        p_data_filtered          = t_unitsofmeasure
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'INTERNATIONALARTNOS'                                  *
  DATA: f_internationalartnos TYPE c,
        t_internationalartnos LIKE internationalartnos
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'INTERNATIONALARTNOS'
      receiver         = receiver
    IMPORTING
      filtered         = f_internationalartnos
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_internationalartnos IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'INTERNATIONALARTNOS'
       TO filtered_table_entries-tabname.
    LOOP AT internationalartnos.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_unitsofmeasure LIKE unitsofmeasure
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_unitsofmeasure[] = t_unitsofmeasure[].
  SORT x_unitsofmeasure BY
                      unit_iso
                      unit
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_unitsofmeasure
                             COMPARING
                                  unit_iso
                                  unit
                                  material_long
                                  material
                                  .
  IF f_internationalartnos IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT internationalartnos.
      tab_index = sy-tabix.
      READ TABLE x_unitsofmeasure WITH KEY
                      unit_iso
                      = internationalartnos-unit_iso
                      unit
                      = internationalartnos-unit
                      material_long
                      = internationalartnos-material_long
                      material
                      = internationalartnos-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'INTERNATIONALARTNOS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_unitsofmeasure.

  IF filtered_parent IS INITIAL AND
     f_internationalartnos IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'INTERNATIONALARTNOS'
        receiver                 = receiver
      TABLES
        p_data_original          = internationalartnos
        p_data_filtered          = t_internationalartnos
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'VENDOREAN'                                            *
  DATA: f_vendorean TYPE c,
        t_vendorean LIKE vendorean
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'VENDOREAN'
      receiver         = receiver
    IMPORTING
      filtered         = f_vendorean
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_vendorean IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'VENDOREAN'
       TO filtered_table_entries-tabname.
    LOOP AT vendorean.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_internationalartnos LIKE internationalartnos
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_internationalartnos[] = t_internationalartnos[].
  SORT x_internationalartnos BY
                      material
                      material_long
                      unit
                      unit_iso
                      .
  DELETE ADJACENT DUPLICATES FROM x_internationalartnos
                             COMPARING
                                  material
                                  material_long
                                  unit
                                  unit_iso
                                  .
  IF f_vendorean IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT vendorean.
      tab_index = sy-tabix.
      READ TABLE x_internationalartnos WITH KEY
                      material
                      = vendorean-material
                      material_long
                      = vendorean-material_long
                      unit
                      = vendorean-unit
                      unit_iso
                      = vendorean-unit_iso
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'VENDOREAN'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_internationalartnos.

  IF filtered_parent IS INITIAL AND
     f_vendorean IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'VENDOREAN'
        receiver                 = receiver
      TABLES
        p_data_original          = vendorean
        p_data_filtered          = t_vendorean
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'LAYOUTMODULEASSGMT'                                   *
  DATA: f_layoutmoduleassgmt TYPE c,
        t_layoutmoduleassgmt LIKE layoutmoduleassgmt
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'LAYOUTMODULEASSGMT'
      receiver         = receiver
    IMPORTING
      filtered         = f_layoutmoduleassgmt
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_layoutmoduleassgmt IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'LAYOUTMODULEASSGMT'
       TO filtered_table_entries-tabname.
    LOOP AT layoutmoduleassgmt.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_unitsofmeasure[] = t_unitsofmeasure[].
  SORT x_unitsofmeasure BY
                      material
                      material_long
                      unit
                      unit_iso
                      .
  DELETE ADJACENT DUPLICATES FROM x_unitsofmeasure
                             COMPARING
                                  material
                                  material_long
                                  unit
                                  unit_iso
                                  .
  IF f_layoutmoduleassgmt IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT layoutmoduleassgmt.
      tab_index = sy-tabix.
      READ TABLE x_unitsofmeasure WITH KEY
                      material
                      = layoutmoduleassgmt-material
                      material_long
                      = layoutmoduleassgmt-material_long
                      unit
                      = layoutmoduleassgmt-unit
                      unit_iso
                      = layoutmoduleassgmt-unit_iso
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'LAYOUTMODULEASSGMT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_unitsofmeasure.

  IF filtered_parent IS INITIAL AND
     f_layoutmoduleassgmt IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'LAYOUTMODULEASSGMT'
        receiver                 = receiver
      TABLES
        p_data_original          = layoutmoduleassgmt
        p_data_filtered          = t_layoutmoduleassgmt
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'LAYOUTMODULEASSGMTX'                                  *
  DATA: f_layoutmoduleassgmtx TYPE c,
        t_layoutmoduleassgmtx LIKE layoutmoduleassgmtx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'LAYOUTMODULEASSGMTX'
      receiver         = receiver
    IMPORTING
      filtered         = f_layoutmoduleassgmtx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_layoutmoduleassgmtx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'LAYOUTMODULEASSGMTX'
       TO filtered_table_entries-tabname.
    LOOP AT layoutmoduleassgmtx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_layoutmoduleassgmt LIKE layoutmoduleassgmt
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_layoutmoduleassgmt[] = t_layoutmoduleassgmt[].
  SORT x_layoutmoduleassgmt BY
                      material
                      material_long
                      unit
                      layout_mod
                      unit_iso
                      .
  DELETE ADJACENT DUPLICATES FROM x_layoutmoduleassgmt
                             COMPARING
                                  material
                                  material_long
                                  unit
                                  layout_mod
                                  unit_iso
                                  .
  IF f_layoutmoduleassgmtx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT layoutmoduleassgmtx.
      tab_index = sy-tabix.
      READ TABLE x_layoutmoduleassgmt WITH KEY
                      material
                      = layoutmoduleassgmtx-material
                      material_long
                      = layoutmoduleassgmtx-material_long
                      unit
                      = layoutmoduleassgmtx-unit
                      layout_mod
                      = layoutmoduleassgmtx-layout_mod
                      unit_iso
                      = layoutmoduleassgmtx-unit_iso
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'LAYOUTMODULEASSGMTX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_layoutmoduleassgmt.

  IF filtered_parent IS INITIAL AND
     f_layoutmoduleassgmtx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'LAYOUTMODULEASSGMTX'
        receiver                 = receiver
      TABLES
        p_data_original          = layoutmoduleassgmtx
        p_data_filtered          = t_layoutmoduleassgmtx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'UNITOFMEASURETEXTS'                                   *
  DATA: f_unitofmeasuretexts TYPE c,
        t_unitofmeasuretexts LIKE unitofmeasuretexts
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'UNITOFMEASURETEXTS'
      receiver         = receiver
    IMPORTING
      filtered         = f_unitofmeasuretexts
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_unitofmeasuretexts IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'UNITOFMEASURETEXTS'
       TO filtered_table_entries-tabname.
    LOOP AT unitofmeasuretexts.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_unitsofmeasure[] = t_unitsofmeasure[].
  SORT x_unitsofmeasure BY
                      material_long
                      material
                      alt_unit_iso
                      alt_unit
                      .
  DELETE ADJACENT DUPLICATES FROM x_unitsofmeasure
                             COMPARING
                                  material_long
                                  material
                                  alt_unit_iso
                                  alt_unit
                                  .
  IF f_unitofmeasuretexts IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT unitofmeasuretexts.
      tab_index = sy-tabix.
      READ TABLE x_unitsofmeasure WITH KEY
                      material_long
                      = unitofmeasuretexts-material_long
                      material
                      = unitofmeasuretexts-material
                      alt_unit_iso
                      = unitofmeasuretexts-alt_unit_iso
                      alt_unit
                      = unitofmeasuretexts-alt_unit
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'UNITOFMEASURETEXTS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_unitsofmeasure.

  IF filtered_parent IS INITIAL AND
     f_unitofmeasuretexts IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'UNITOFMEASURETEXTS'
        receiver                 = receiver
      TABLES
        p_data_original          = unitofmeasuretexts
        p_data_filtered          = t_unitofmeasuretexts
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'UNITSOFMEASUREX'                                      *
  DATA: f_unitsofmeasurex TYPE c,
        t_unitsofmeasurex LIKE unitsofmeasurex
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'UNITSOFMEASUREX'
      receiver         = receiver
    IMPORTING
      filtered         = f_unitsofmeasurex
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_unitsofmeasurex IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'UNITSOFMEASUREX'
       TO filtered_table_entries-tabname.
    LOOP AT unitsofmeasurex.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_unitsofmeasure[] = t_unitsofmeasure[].
  SORT x_unitsofmeasure BY
                      alt_unit
                      alt_unit_iso
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_unitsofmeasure
                             COMPARING
                                  alt_unit
                                  alt_unit_iso
                                  material
                                  material_long
                                  .
  IF f_unitsofmeasurex IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT unitsofmeasurex.
      tab_index = sy-tabix.
      READ TABLE x_unitsofmeasure WITH KEY
                      alt_unit
                      = unitsofmeasurex-alt_unit
                      alt_unit_iso
                      = unitsofmeasurex-alt_unit_iso
                      material
                      = unitsofmeasurex-material
                      material_long
                      = unitsofmeasurex-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'UNITSOFMEASUREX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_unitsofmeasure.

  IF filtered_parent IS INITIAL AND
     f_unitsofmeasurex IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'UNITSOFMEASUREX'
        receiver                 = receiver
      TABLES
        p_data_original          = unitsofmeasurex
        p_data_filtered          = t_unitsofmeasurex
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'VALUATIONDATA'                                        *
  DATA: f_valuationdata TYPE c,
        t_valuationdata LIKE valuationdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'VALUATIONDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_valuationdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_valuationdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'VALUATIONDATA'
       TO filtered_table_entries-tabname.
    LOOP AT valuationdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_valuationdata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT valuationdata.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = valuationdata-material
                      material_long
                      = valuationdata-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'VALUATIONDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_valuationdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'VALUATIONDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = valuationdata
        p_data_filtered          = t_valuationdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'VALUATIONDATAX'                                       *
  DATA: f_valuationdatax TYPE c,
        t_valuationdatax LIKE valuationdatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'VALUATIONDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_valuationdatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_valuationdatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'VALUATIONDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT valuationdatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_valuationdata LIKE valuationdata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_valuationdata[] = t_valuationdata[].
  SORT x_valuationdata BY
                      val_type
                      material
                      material_long
                      val_area
                      .
  DELETE ADJACENT DUPLICATES FROM x_valuationdata
                             COMPARING
                                  val_type
                                  material
                                  material_long
                                  val_area
                                  .
  IF f_valuationdatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT valuationdatax.
      tab_index = sy-tabix.
      READ TABLE x_valuationdata WITH KEY
                      val_type
                      = valuationdatax-val_type
                      material
                      = valuationdatax-material
                      material_long
                      = valuationdatax-material_long
                      val_area
                      = valuationdatax-val_area
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'VALUATIONDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_valuationdata.

  IF filtered_parent IS INITIAL AND
     f_valuationdatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'VALUATIONDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = valuationdatax
        p_data_filtered          = t_valuationdatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'VALUATIONEXT'                                         *
  DATA: f_valuationext TYPE c,
        t_valuationext LIKE valuationext
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'VALUATIONEXT'
      receiver         = receiver
    IMPORTING
      filtered         = f_valuationext
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_valuationext IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'VALUATIONEXT'
       TO filtered_table_entries-tabname.
    LOOP AT valuationext.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_valuationdata[] = t_valuationdata[].
  SORT x_valuationdata BY
                      val_type
                      val_area
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_valuationdata
                             COMPARING
                                  val_type
                                  val_area
                                  material_long
                                  material
                                  .
  IF f_valuationext IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT valuationext.
      tab_index = sy-tabix.
      READ TABLE x_valuationdata WITH KEY
                      val_type
                      = valuationext-val_type
                      val_area
                      = valuationext-val_area
                      material_long
                      = valuationext-material_long
                      material
                      = valuationext-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'VALUATIONEXT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_valuationdata.

  IF filtered_parent IS INITIAL AND
     f_valuationext IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'VALUATIONEXT'
        receiver                 = receiver
      TABLES
        p_data_original          = valuationext
        p_data_filtered          = t_valuationext
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'VALUATIONEXTX'                                        *
  DATA: f_valuationextx TYPE c,
        t_valuationextx LIKE valuationextx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'VALUATIONEXTX'
      receiver         = receiver
    IMPORTING
      filtered         = f_valuationextx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_valuationextx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'VALUATIONEXTX'
       TO filtered_table_entries-tabname.
    LOOP AT valuationextx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_valuationext LIKE valuationext
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_valuationext[] = t_valuationext[].
  SORT x_valuationext BY
                      val_type
                      material
                      material_long
                      val_area
                      .
  DELETE ADJACENT DUPLICATES FROM x_valuationext
                             COMPARING
                                  val_type
                                  material
                                  material_long
                                  val_area
                                  .
  IF f_valuationextx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT valuationextx.
      tab_index = sy-tabix.
      READ TABLE x_valuationext WITH KEY
                      val_type
                      = valuationextx-val_type
                      material
                      = valuationextx-material
                      material_long
                      = valuationextx-material_long
                      val_area
                      = valuationextx-val_area
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'VALUATIONEXTX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_valuationext.

  IF filtered_parent IS INITIAL AND
     f_valuationextx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'VALUATIONEXTX'
        receiver                 = receiver
      TABLES
        p_data_original          = valuationextx
        p_data_filtered          = t_valuationextx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'VALUATIONTYPEKEYS'                                    *
  DATA: f_valuationtypekeys TYPE c,
        t_valuationtypekeys LIKE valuationtypekeys
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'VALUATIONTYPEKEYS'
      receiver         = receiver
    IMPORTING
      filtered         = f_valuationtypekeys
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_valuationtypekeys IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'VALUATIONTYPEKEYS'
       TO filtered_table_entries-tabname.
    LOOP AT valuationtypekeys.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_valuationdata[] = t_valuationdata[].
  SORT x_valuationdata BY
                      material
                      material_long
                      val_area
                      val_type
                      .
  DELETE ADJACENT DUPLICATES FROM x_valuationdata
                             COMPARING
                                  material
                                  material_long
                                  val_area
                                  val_type
                                  .
  IF f_valuationtypekeys IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT valuationtypekeys.
      tab_index = sy-tabix.
      READ TABLE x_valuationdata WITH KEY
                      material
                      = valuationtypekeys-material
                      material_long
                      = valuationtypekeys-material_long
                      val_area
                      = valuationtypekeys-val_area
                      val_type
                      = valuationtypekeys-val_type
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'VALUATIONTYPEKEYS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_valuationdata.

  IF filtered_parent IS INITIAL AND
     f_valuationtypekeys IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'VALUATIONTYPEKEYS'
        receiver                 = receiver
      TABLES
        p_data_original          = valuationtypekeys
        p_data_filtered          = t_valuationtypekeys
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'VARIANTSKEYS'                                         *
  DATA: f_variantskeys TYPE c,
        t_variantskeys LIKE variantskeys
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'VARIANTSKEYS'
      receiver         = receiver
    IMPORTING
      filtered         = f_variantskeys
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_variantskeys IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'VARIANTSKEYS'
       TO filtered_table_entries-tabname.
    LOOP AT variantskeys.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_variantskeys IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT variantskeys.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = variantskeys-material
                      material_long
                      = variantskeys-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'VARIANTSKEYS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_variantskeys IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'VARIANTSKEYS'
        receiver                 = receiver
      TABLES
        p_data_original          = variantskeys
        p_data_filtered          = t_variantskeys
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'WAREHOUSENUMBERDATA'                                  *
  DATA: f_warehousenumberdata TYPE c,
        t_warehousenumberdata LIKE warehousenumberdata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'WAREHOUSENUMBERDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_warehousenumberdata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_warehousenumberdata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'WAREHOUSENUMBERDATA'
       TO filtered_table_entries-tabname.
    LOOP AT warehousenumberdata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_clientdata[] = t_clientdata[].
  SORT x_clientdata BY
                      material
                      material_long
                      .
  DELETE ADJACENT DUPLICATES FROM x_clientdata
                             COMPARING
                                  material
                                  material_long
                                  .
  IF f_warehousenumberdata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT warehousenumberdata.
      tab_index = sy-tabix.
      READ TABLE x_clientdata WITH KEY
                      material
                      = warehousenumberdata-material
                      material_long
                      = warehousenumberdata-material_long
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'WAREHOUSENUMBERDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_clientdata.

  IF filtered_parent IS INITIAL AND
     f_warehousenumberdata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'WAREHOUSENUMBERDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = warehousenumberdata
        p_data_filtered          = t_warehousenumberdata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGETYPEDATA'                                      *
  DATA: f_storagetypedata TYPE c,
        t_storagetypedata LIKE storagetypedata
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGETYPEDATA'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagetypedata
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagetypedata IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGETYPEDATA'
       TO filtered_table_entries-tabname.
    LOOP AT storagetypedata.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_warehousenumberdata LIKE warehousenumberdata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_warehousenumberdata[] = t_warehousenumberdata[].
  SORT x_warehousenumberdata BY
                      whse_no
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_warehousenumberdata
                             COMPARING
                                  whse_no
                                  material_long
                                  material
                                  .
  IF f_storagetypedata IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagetypedata.
      tab_index = sy-tabix.
      READ TABLE x_warehousenumberdata WITH KEY
                      whse_no
                      = storagetypedata-whse_no
                      material_long
                      = storagetypedata-material_long
                      material
                      = storagetypedata-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGETYPEDATA'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_warehousenumberdata.

  IF filtered_parent IS INITIAL AND
     f_storagetypedata IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGETYPEDATA'
        receiver                 = receiver
      TABLES
        p_data_original          = storagetypedata
        p_data_filtered          = t_storagetypedata
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGETYPEDATAX'                                     *
  DATA: f_storagetypedatax TYPE c,
        t_storagetypedatax LIKE storagetypedatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGETYPEDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagetypedatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagetypedatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGETYPEDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT storagetypedatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_storagetypedata LIKE storagetypedata
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_storagetypedata[] = t_storagetypedata[].
  SORT x_storagetypedata BY
                      whse_no
                      stge_type
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_storagetypedata
                             COMPARING
                                  whse_no
                                  stge_type
                                  material_long
                                  material
                                  .
  IF f_storagetypedatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagetypedatax.
      tab_index = sy-tabix.
      READ TABLE x_storagetypedata WITH KEY
                      whse_no
                      = storagetypedatax-whse_no
                      stge_type
                      = storagetypedatax-stge_type
                      material_long
                      = storagetypedatax-material_long
                      material
                      = storagetypedatax-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGETYPEDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_storagetypedata.

  IF filtered_parent IS INITIAL AND
     f_storagetypedatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGETYPEDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = storagetypedatax
        p_data_filtered          = t_storagetypedatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGETYPEEXT'                                       *
  DATA: f_storagetypeext TYPE c,
        t_storagetypeext LIKE storagetypeext
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGETYPEEXT'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagetypeext
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagetypeext IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGETYPEEXT'
       TO filtered_table_entries-tabname.
    LOOP AT storagetypeext.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_storagetypedata[] = t_storagetypedata[].
  SORT x_storagetypedata BY
                      whse_no
                      stge_type
                      material_long
                      material
                      .
  DELETE ADJACENT DUPLICATES FROM x_storagetypedata
                             COMPARING
                                  whse_no
                                  stge_type
                                  material_long
                                  material
                                  .
  IF f_storagetypeext IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagetypeext.
      tab_index = sy-tabix.
      READ TABLE x_storagetypedata WITH KEY
                      whse_no
                      = storagetypeext-whse_no
                      stge_type
                      = storagetypeext-stge_type
                      material_long
                      = storagetypeext-material_long
                      material
                      = storagetypeext-material
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGETYPEEXT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_storagetypedata.

  IF filtered_parent IS INITIAL AND
     f_storagetypeext IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGETYPEEXT'
        receiver                 = receiver
      TABLES
        p_data_original          = storagetypeext
        p_data_filtered          = t_storagetypeext
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGETYPEEXTX'                                      *
  DATA: f_storagetypeextx TYPE c,
        t_storagetypeextx LIKE storagetypeextx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGETYPEEXTX'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagetypeextx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagetypeextx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGETYPEEXTX'
       TO filtered_table_entries-tabname.
    LOOP AT storagetypeextx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_storagetypeext LIKE storagetypeext
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_storagetypeext[] = t_storagetypeext[].
  SORT x_storagetypeext BY
                      material
                      material_long
                      stge_type
                      whse_no
                      .
  DELETE ADJACENT DUPLICATES FROM x_storagetypeext
                             COMPARING
                                  material
                                  material_long
                                  stge_type
                                  whse_no
                                  .
  IF f_storagetypeextx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagetypeextx.
      tab_index = sy-tabix.
      READ TABLE x_storagetypeext WITH KEY
                      material
                      = storagetypeextx-material
                      material_long
                      = storagetypeextx-material_long
                      stge_type
                      = storagetypeextx-stge_type
                      whse_no
                      = storagetypeextx-whse_no
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGETYPEEXTX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_storagetypeext.

  IF filtered_parent IS INITIAL AND
     f_storagetypeextx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGETYPEEXTX'
        receiver                 = receiver
      TABLES
        p_data_original          = storagetypeextx
        p_data_filtered          = t_storagetypeextx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'STORAGETYPEKEYS'                                      *
  DATA: f_storagetypekeys TYPE c,
        t_storagetypekeys LIKE storagetypekeys
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'STORAGETYPEKEYS'
      receiver         = receiver
    IMPORTING
      filtered         = f_storagetypekeys
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_storagetypekeys IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'STORAGETYPEKEYS'
       TO filtered_table_entries-tabname.
    LOOP AT storagetypekeys.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_storagetypedata[] = t_storagetypedata[].
  SORT x_storagetypedata BY
                      material
                      material_long
                      stge_type
                      whse_no
                      .
  DELETE ADJACENT DUPLICATES FROM x_storagetypedata
                             COMPARING
                                  material
                                  material_long
                                  stge_type
                                  whse_no
                                  .
  IF f_storagetypekeys IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT storagetypekeys.
      tab_index = sy-tabix.
      READ TABLE x_storagetypedata WITH KEY
                      material
                      = storagetypekeys-material
                      material_long
                      = storagetypekeys-material_long
                      stge_type
                      = storagetypekeys-stge_type
                      whse_no
                      = storagetypekeys-whse_no
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'STORAGETYPEKEYS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_storagetypedata.

  IF filtered_parent IS INITIAL AND
     f_storagetypekeys IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'STORAGETYPEKEYS'
        receiver                 = receiver
      TABLES
        p_data_original          = storagetypekeys
        p_data_filtered          = t_storagetypekeys
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'WAREHOUSENOKEYS'                                      *
  DATA: f_warehousenokeys TYPE c,
        t_warehousenokeys LIKE warehousenokeys
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'WAREHOUSENOKEYS'
      receiver         = receiver
    IMPORTING
      filtered         = f_warehousenokeys
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_warehousenokeys IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'WAREHOUSENOKEYS'
       TO filtered_table_entries-tabname.
    LOOP AT warehousenokeys.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_warehousenumberdata[] = t_warehousenumberdata[].
  SORT x_warehousenumberdata BY
                      material
                      material_long
                      whse_no
                      .
  DELETE ADJACENT DUPLICATES FROM x_warehousenumberdata
                             COMPARING
                                  material
                                  material_long
                                  whse_no
                                  .
  IF f_warehousenokeys IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT warehousenokeys.
      tab_index = sy-tabix.
      READ TABLE x_warehousenumberdata WITH KEY
                      material
                      = warehousenokeys-material
                      material_long
                      = warehousenokeys-material_long
                      whse_no
                      = warehousenokeys-whse_no
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'WAREHOUSENOKEYS'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_warehousenumberdata.

  IF filtered_parent IS INITIAL AND
     f_warehousenokeys IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'WAREHOUSENOKEYS'
        receiver                 = receiver
      TABLES
        p_data_original          = warehousenokeys
        p_data_filtered          = t_warehousenokeys
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'WAREHOUSENUMBERDATAX'                                 *
  DATA: f_warehousenumberdatax TYPE c,
        t_warehousenumberdatax LIKE warehousenumberdatax
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'WAREHOUSENUMBERDATAX'
      receiver         = receiver
    IMPORTING
      filtered         = f_warehousenumberdatax
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_warehousenumberdatax IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'WAREHOUSENUMBERDATAX'
       TO filtered_table_entries-tabname.
    LOOP AT warehousenumberdatax.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_warehousenumberdata[] = t_warehousenumberdata[].
  SORT x_warehousenumberdata BY
                      material
                      material_long
                      whse_no
                      .
  DELETE ADJACENT DUPLICATES FROM x_warehousenumberdata
                             COMPARING
                                  material
                                  material_long
                                  whse_no
                                  .
  IF f_warehousenumberdatax IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT warehousenumberdatax.
      tab_index = sy-tabix.
      READ TABLE x_warehousenumberdata WITH KEY
                      material
                      = warehousenumberdatax-material
                      material_long
                      = warehousenumberdatax-material_long
                      whse_no
                      = warehousenumberdatax-whse_no
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'WAREHOUSENUMBERDATAX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_warehousenumberdata.

  IF filtered_parent IS INITIAL AND
     f_warehousenumberdatax IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'WAREHOUSENUMBERDATAX'
        receiver                 = receiver
      TABLES
        p_data_original          = warehousenumberdatax
        p_data_filtered          = t_warehousenumberdatax
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'WAREHOUSENUMBEREXT'                                   *
  DATA: f_warehousenumberext TYPE c,
        t_warehousenumberext LIKE warehousenumberext
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'WAREHOUSENUMBEREXT'
      receiver         = receiver
    IMPORTING
      filtered         = f_warehousenumberext
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_warehousenumberext IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'WAREHOUSENUMBEREXT'
       TO filtered_table_entries-tabname.
    LOOP AT warehousenumberext.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

* inherited filtered table entries                                     *
  x_warehousenumberdata[] = t_warehousenumberdata[].
  SORT x_warehousenumberdata BY
                      material
                      material_long
                      whse_no
                      .
  DELETE ADJACENT DUPLICATES FROM x_warehousenumberdata
                             COMPARING
                                  material
                                  material_long
                                  whse_no
                                  .
  IF f_warehousenumberext IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT warehousenumberext.
      tab_index = sy-tabix.
      READ TABLE x_warehousenumberdata WITH KEY
                      material
                      = warehousenumberext-material
                      material_long
                      = warehousenumberext-material_long
                      whse_no
                      = warehousenumberext-whse_no
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'WAREHOUSENUMBEREXT'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_warehousenumberdata.

  IF filtered_parent IS INITIAL AND
     f_warehousenumberext IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'WAREHOUSENUMBEREXT'
        receiver                 = receiver
      TABLES
        p_data_original          = warehousenumberext
        p_data_filtered          = t_warehousenumberext
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for parameter 'WAREHOUSENUMBEREXTX'                                  *
  DATA: f_warehousenumberextx TYPE c,
        t_warehousenumberextx LIKE warehousenumberextx
                        OCCURS 0 WITH HEADER LINE.

  CLEAR filtered_parent.
  CALL FUNCTION 'ALE_ASYN_BAPI_PARAMETER_FILTER'
    EXPORTING
      object           = object
      method           = method
      bapi_parameter   = 'WAREHOUSENUMBEREXTX'
      receiver         = receiver
    IMPORTING
      filtered         = f_warehousenumberextx
    EXCEPTIONS
      unexpected_error = 1
      OTHERS           = 2.
  IF sy-subrc <> 0.
    syst_info = syst.
    EXIT.
  ENDIF.
  IF f_warehousenumberextx IS INITIAL.
    MOVE: receiver
       TO filtered_table_entries-receiver,
          'WAREHOUSENUMBEREXTX'
       TO filtered_table_entries-tabname.
    LOOP AT warehousenumberextx.
      filtered_table_entries-index = sy-tabix.
      APPEND filtered_table_entries.
    ENDLOOP.
  ENDIF.

  DATA: x_warehousenumberext LIKE warehousenumberext
                       OCCURS 0 WITH HEADER LINE.

* inherited filtered table entries                                     *
  x_warehousenumberext[] = t_warehousenumberext[].
  SORT x_warehousenumberext BY
                      material
                      material_long
                      whse_no
                      .
  DELETE ADJACENT DUPLICATES FROM x_warehousenumberext
                             COMPARING
                                  material
                                  material_long
                                  whse_no
                                  .
  IF f_warehousenumberextx IS INITIAL.
    SORT filtered_table_entries BY receiver tabname index.
    LOOP AT warehousenumberextx.
      tab_index = sy-tabix.
      READ TABLE x_warehousenumberext WITH KEY
                      material
                      = warehousenumberextx-material
                      material_long
                      = warehousenumberextx-material_long
                      whse_no
                      = warehousenumberextx-whse_no
           TRANSPORTING NO FIELDS BINARY SEARCH
                    .
      IF sy-subrc <> 0.
        READ TABLE filtered_table_entries
                     WITH KEY receiver = receiver
                               tabname = 'WAREHOUSENUMBEREXTX'
                                 index = tab_index
                     TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE filtered_table_entries INDEX sy-tabix.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
  filtered_parent = f_warehousenumberext.

  IF filtered_parent IS INITIAL AND
     f_warehousenumberextx IS INITIAL.
    CALL FUNCTION 'ALE_ASYN_BAPI_TABLE_IDX_FILTER'
      EXPORTING
        object                   = object
        method                   = method
        p_name                   = 'WAREHOUSENUMBEREXTX'
        receiver                 = receiver
      TABLES
        p_data_original          = warehousenumberextx
        p_data_filtered          = t_warehousenumberextx
        filtered_table_index     = filtered_table_entries
      EXCEPTIONS
        error_in_ale_customizing = 1
        error_in_filter_objects  = 2
        OTHERS                   = 3.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* sort table entries                                                   *
  SORT filtered_table_entries BY receiver tabname index.
  DELETE ADJACENT DUPLICATES FROM filtered_table_entries
                        COMPARING receiver tabname index.

ENDFORM.                               " BFLT_MATERIAL_MAINTAINDATA_RT


* subroutine creating IDoc data-record                                 *
FORM idoc_material_maintaindata_rt
     TABLES
         clientdata STRUCTURE
           bapie1marart
         addnlclientdata STRUCTURE
           bapie1maw1rt
         addnlclientdatax STRUCTURE
           bapie1maw1rtx
         characteristicvalue STRUCTURE
           bapie1ausprt
         characteristicvaluex STRUCTURE
           bapie1ausprtx
         clientdatax STRUCTURE
           bapie1marartx
         clientext STRUCTURE
           bapie1maraextrt
         clientextx STRUCTURE
           bapie1maraextrtx
         materialdescription STRUCTURE
           bapie1maktrt
         materiallongtext STRUCTURE
           bapie1mltxrt
         plantdata STRUCTURE
           bapie1marcrt
         forecastparameters STRUCTURE
           bapie1mpoprt
         forecastparametersx STRUCTURE
           bapie1mpoprtx
         forecastvalues STRUCTURE
           bapie1mprwrt
         planningdata STRUCTURE
           bapie1mpgdrt
         planningdatax STRUCTURE
           bapie1mpgdrtx
         plantdatax STRUCTURE
           bapie1marcrtx
         plantext STRUCTURE
           bapie1marcextrt
         plantextx STRUCTURE
           bapie1marcextrtx
         plantkeys STRUCTURE
           bapie1wrkkey
         storagelocationdata STRUCTURE
           bapie1mardrt
         storagelocationdatax STRUCTURE
           bapie1mardrtx
         storagelocationext STRUCTURE
           bapie1mardextrt
         storagelocationextx STRUCTURE
           bapie1mardextrtx
         storagelocationkeys STRUCTURE
           bapie1lgokey
         totalconsumption STRUCTURE
           bapie1mvegrt
         unplndconsumption STRUCTURE
           bapie1mveurt
         salesdata STRUCTURE
           bapie1mvkert
         distrchainkeys STRUCTURE
           bapie1vtlkey
         posdata STRUCTURE
           bapie1wlk2rt
         posdatax STRUCTURE
           bapie1wlk2rtx
         posext STRUCTURE
           bapie1wlk2extrt
         posextx STRUCTURE
           bapie1wlk2extrtx
         salesdatax STRUCTURE
           bapie1mvkertx
         salesext STRUCTURE
           bapie1mvkeextrt
         salesextx STRUCTURE
           bapie1mvkeextrtx
         seasons STRUCTURE
           bapifshseasons
         segmrpgeneraldata STRUCTURE
           bapisgtmrpgn
         segmrpquantitydata STRUCTURE
           bapisgtmrp
         segsalesstatus STRUCTURE
           bapisgtmvke
         segstoragetypedata STRUCTURE
           bapisgtmlgt
         segvaluationtype STRUCTURE
           bapisgtmadka
         segwarehousenumberdata STRUCTURE
           bapisgtmlgn
         segweightvolume STRUCTURE
           bapisgtmarm
         taxclassifications STRUCTURE
           bapie1mlanrt
         textilecomponents STRUCTURE
           bapitextlcomp
         fibercodes STRUCTURE
           bapitextlfibr
         unitsofmeasure STRUCTURE
           bapie1marmrt
         internationalartnos STRUCTURE
           bapie1meanrt
         vendorean STRUCTURE
           bapie1mleart
         layoutmoduleassgmt STRUCTURE
           bapie1malgrt
         layoutmoduleassgmtx STRUCTURE
           bapie1malgrtx
         unitofmeasuretexts STRUCTURE
           bapie1mamtrt
         unitsofmeasurex STRUCTURE
           bapie1marmrtx
         valuationdata STRUCTURE
           bapie1mbewrt
         valuationdatax STRUCTURE
           bapie1mbewrtx
         valuationext STRUCTURE
           bapie1mbewextrt
         valuationextx STRUCTURE
           bapie1mbewextrtx
         valuationtypekeys STRUCTURE
           bapie1bwakey
         variantskeys STRUCTURE
           bapie1varkey
         warehousenumberdata STRUCTURE
           bapie1mlgnrt
         storagetypedata STRUCTURE
           bapie1mlgtrt
         storagetypedatax STRUCTURE
           bapie1mlgtrtx
         storagetypeext STRUCTURE
           bapie1mlgtextrt
         storagetypeextx STRUCTURE
           bapie1mlgtextrtx
         storagetypekeys STRUCTURE
           bapie1lgtkey
         warehousenokeys STRUCTURE
           bapie1lgnkey
         warehousenumberdatax STRUCTURE
           bapie1mlgnrtx
         warehousenumberext STRUCTURE
           bapie1mlgnextrt
         warehousenumberextx STRUCTURE
           bapie1mlgnextrtx
         filtered_table_entries STRUCTURE bdi_btabix
         idoc_data STRUCTURE edidd
     USING
         headdata LIKE
           bapie1mathead
         bdbg_receiver LIKE bdi_logsys-logsys
         bdbg_object LIKE swotdv-objtype
         bdbg_method LIKE swotdv-verb
         syst_info LIKE syst
         .

  DATA: e1bpe1mathead   LIKE e1bpe1mathead,
        t_e1bpe1mathead LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1varkey   LIKE e1bpe1varkey,
        t_e1bpe1varkey LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1ausprt   LIKE e1bpe1ausprt,
        t_e1bpe1ausprt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1ausprtx   LIKE e1bpe1ausprtx,
        t_e1bpe1ausprtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marart   LIKE e1bpe1marart,
        t_e1bpe1marart LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marart1   LIKE e1bpe1marart1,
        t_e1bpe1marart1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marartx   LIKE e1bpe1marartx,
        t_e1bpe1marartx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1maraextrt   LIKE e1bpe1maraextrt,
        t_e1bpe1maraextrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1maraextrt1   LIKE e1bpe1maraextrt1,
        t_e1bpe1maraextrt1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1maraextrtx   LIKE e1bpe1maraextrtx,
        t_e1bpe1maraextrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1maraextrtx1   LIKE e1bpe1maraextrtx1,
        t_e1bpe1maraextrtx1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1maw1rt   LIKE e1bpe1maw1rt,
        t_e1bpe1maw1rt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1maw1rtx   LIKE e1bpe1maw1rtx,
        t_e1bpe1maw1rtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1maktrt   LIKE e1bpe1maktrt,
        t_e1bpe1maktrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marcrt   LIKE e1bpe1marcrt,
        t_e1bpe1marcrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marcrt1   LIKE e1bpe1marcrt1,
        t_e1bpe1marcrt1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marcrtx   LIKE e1bpe1marcrtx,
        t_e1bpe1marcrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marcextrt   LIKE e1bpe1marcextrt,
        t_e1bpe1marcextrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marcextrt1   LIKE e1bpe1marcextrt1,
        t_e1bpe1marcextrt1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marcextrtx   LIKE e1bpe1marcextrtx,
        t_e1bpe1marcextrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marcextrtx1   LIKE e1bpe1marcextrtx1,
        t_e1bpe1marcextrtx1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mpoprt   LIKE e1bpe1mpoprt,
        t_e1bpe1mpoprt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mpoprtx   LIKE e1bpe1mpoprtx,
        t_e1bpe1mpoprtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mprwrt   LIKE e1bpe1mprwrt,
        t_e1bpe1mprwrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mvegrt   LIKE e1bpe1mvegrt,
        t_e1bpe1mvegrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mveurt   LIKE e1bpe1mveurt,
        t_e1bpe1mveurt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mpgdrt   LIKE e1bpe1mpgdrt,
        t_e1bpe1mpgdrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mpgdrtx   LIKE e1bpe1mpgdrtx,
        t_e1bpe1mpgdrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mardrt   LIKE e1bpe1mardrt,
        t_e1bpe1mardrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mardrtx   LIKE e1bpe1mardrtx,
        t_e1bpe1mardrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mardextrt   LIKE e1bpe1mardextrt,
        t_e1bpe1mardextrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mardextrt1   LIKE e1bpe1mardextrt1,
        t_e1bpe1mardextrt1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mardextrtx   LIKE e1bpe1mardextrtx,
        t_e1bpe1mardextrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mardextrtx1   LIKE e1bpe1mardextrtx1,
        t_e1bpe1mardextrtx1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marmrt   LIKE e1bpe1marmrt,
        t_e1bpe1marmrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1marmrtx   LIKE e1bpe1marmrtx,
        t_e1bpe1marmrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mamtrt   LIKE e1bpe1mamtrt,
        t_e1bpe1mamtrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1meanrt   LIKE e1bpe1meanrt,
        t_e1bpe1meanrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mleart   LIKE e1bpe1mleart,
        t_e1bpe1mleart LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1malgrt   LIKE e1bpe1malgrt,
        t_e1bpe1malgrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1malgrtx   LIKE e1bpe1malgrtx,
        t_e1bpe1malgrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlanrt   LIKE e1bpe1mlanrt,
        t_e1bpe1mlanrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mbewrt   LIKE e1bpe1mbewrt,
        t_e1bpe1mbewrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mbewrtx   LIKE e1bpe1mbewrtx,
        t_e1bpe1mbewrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mbewextrt   LIKE e1bpe1mbewextrt,
        t_e1bpe1mbewextrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mbewextrt1   LIKE e1bpe1mbewextrt1,
        t_e1bpe1mbewextrt1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mbewextrtx   LIKE e1bpe1mbewextrtx,
        t_e1bpe1mbewextrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mbewextrtx1   LIKE e1bpe1mbewextrtx1,
        t_e1bpe1mbewextrtx1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgnrt   LIKE e1bpe1mlgnrt,
        t_e1bpe1mlgnrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgnrtx   LIKE e1bpe1mlgnrtx,
        t_e1bpe1mlgnrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgnextrt   LIKE e1bpe1mlgnextrt,
        t_e1bpe1mlgnextrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgnextrt1   LIKE e1bpe1mlgnextrt1,
        t_e1bpe1mlgnextrt1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgnextrtx   LIKE e1bpe1mlgnextrtx,
        t_e1bpe1mlgnextrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgnextrtx1   LIKE e1bpe1mlgnextrtx1,
        t_e1bpe1mlgnextrtx1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgtrt   LIKE e1bpe1mlgtrt,
        t_e1bpe1mlgtrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgtrtx   LIKE e1bpe1mlgtrtx,
        t_e1bpe1mlgtrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgtextrt   LIKE e1bpe1mlgtextrt,
        t_e1bpe1mlgtextrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgtextrt1   LIKE e1bpe1mlgtextrt1,
        t_e1bpe1mlgtextrt1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgtextrtx   LIKE e1bpe1mlgtextrtx,
        t_e1bpe1mlgtextrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mlgtextrtx1   LIKE e1bpe1mlgtextrtx1,
        t_e1bpe1mlgtextrtx1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mvkert   LIKE e1bpe1mvkert,
        t_e1bpe1mvkert LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mvkertx   LIKE e1bpe1mvkertx,
        t_e1bpe1mvkertx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mvkeextrt   LIKE e1bpe1mvkeextrt,
        t_e1bpe1mvkeextrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mvkeextrt1   LIKE e1bpe1mvkeextrt1,
        t_e1bpe1mvkeextrt1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mvkeextrtx   LIKE e1bpe1mvkeextrtx,
        t_e1bpe1mvkeextrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mvkeextrtx1   LIKE e1bpe1mvkeextrtx1,
        t_e1bpe1mvkeextrtx1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1wlk2rt   LIKE e1bpe1wlk2rt,
        t_e1bpe1wlk2rt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1wlk2rtx   LIKE e1bpe1wlk2rtx,
        t_e1bpe1wlk2rtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1wlk2extrt   LIKE e1bpe1wlk2extrt,
        t_e1bpe1wlk2extrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1wlk2extrt1   LIKE e1bpe1wlk2extrt1,
        t_e1bpe1wlk2extrt1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1wlk2extrtx   LIKE e1bpe1wlk2extrtx,
        t_e1bpe1wlk2extrtx LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1wlk2extrtx1   LIKE e1bpe1wlk2extrtx1,
        t_e1bpe1wlk2extrtx1 LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1mltxrt   LIKE e1bpe1mltxrt,
        t_e1bpe1mltxrt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1wrkkey   LIKE e1bpe1wrkkey,
        t_e1bpe1wrkkey LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1lgokey   LIKE e1bpe1lgokey,
        t_e1bpe1lgokey LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1vtlkey   LIKE e1bpe1vtlkey,
        t_e1bpe1vtlkey LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1lgnkey   LIKE e1bpe1lgnkey,
        t_e1bpe1lgnkey LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1lgtkey   LIKE e1bpe1lgtkey,
        t_e1bpe1lgtkey LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpe1bwakey   LIKE e1bpe1bwakey,
        t_e1bpe1bwakey LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bptextlcomp   LIKE e1bptextlcomp,
        t_e1bptextlcomp LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bptextlfibr   LIKE e1bptextlfibr,
        t_e1bptextlfibr LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpsgtmvke   LIKE e1bpsgtmvke,
        t_e1bpsgtmvke LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpsgtmarm   LIKE e1bpsgtmarm,
        t_e1bpsgtmarm LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpsgtmadka   LIKE e1bpsgtmadka,
        t_e1bpsgtmadka LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpfshseasons   LIKE e1bpfshseasons,
        t_e1bpfshseasons LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpsgtmlgn   LIKE e1bpsgtmlgn,
        t_e1bpsgtmlgn LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpsgtmlgt   LIKE e1bpsgtmlgt,
        t_e1bpsgtmlgt LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpsgtmrpgn   LIKE e1bpsgtmrpgn,
        t_e1bpsgtmrpgn LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: e1bpsgtmrp   LIKE e1bpsgtmrp,
        t_e1bpsgtmrp LIKE edidd
                    OCCURS 0 WITH HEADER LINE.
  DATA: idx          LIKE sy-tabix,
        bp_parameter LIKE swotrp OCCURS 0 WITH HEADER LINE.

* go through all IDoc-segments                                         *

* for segment 'E1BPE1MATHEAD'                                          *
  CLEAR t_e1bpe1mathead.
  REFRESH t_e1bpe1mathead.
  t_e1bpe1mathead-segnam = 'E1BPE1MATHEAD'.
  CLEAR e1bpe1mathead.
  MOVE-CORRESPONDING headdata
       TO e1bpe1mathead.                                    "#EC ENHOK

  IF NOT e1bpe1mathead IS INITIAL.
    t_e1bpe1mathead-sdata = e1bpe1mathead.
    APPEND t_e1bpe1mathead.
  ENDIF.
  IF NOT t_e1bpe1mathead[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'HEADDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mathead
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1VARKEY'                                           *
  CLEAR t_e1bpe1varkey.
  REFRESH t_e1bpe1varkey.
  t_e1bpe1varkey-segnam = 'E1BPE1VARKEY'.
  LOOP AT variantskeys.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'VARIANTSKEYS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1varkey.
    MOVE-CORRESPONDING variantskeys
         TO e1bpe1varkey.                                   "#EC ENHOK

    t_e1bpe1varkey-sdata = e1bpe1varkey.
    APPEND t_e1bpe1varkey.
  ENDLOOP.
  IF NOT t_e1bpe1varkey[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'VARIANTSKEYS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1varkey
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1AUSPRT'                                           *
  CLEAR t_e1bpe1ausprt.
  REFRESH t_e1bpe1ausprt.
  t_e1bpe1ausprt-segnam = 'E1BPE1AUSPRT'.
  LOOP AT characteristicvalue.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'CHARACTERISTICVALUE'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1ausprt.
    MOVE-CORRESPONDING characteristicvalue
         TO e1bpe1ausprt.                                   "#EC ENHOK

    t_e1bpe1ausprt-sdata = e1bpe1ausprt.
    APPEND t_e1bpe1ausprt.
  ENDLOOP.
  IF NOT t_e1bpe1ausprt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'CHARACTERISTICVALUE'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1ausprt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1AUSPRTX'                                          *
  CLEAR t_e1bpe1ausprtx.
  REFRESH t_e1bpe1ausprtx.
  t_e1bpe1ausprtx-segnam = 'E1BPE1AUSPRTX'.
  LOOP AT characteristicvaluex.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'CHARACTERISTICVALUEX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1ausprtx.
    MOVE-CORRESPONDING characteristicvaluex
         TO e1bpe1ausprtx.                                  "#EC ENHOK

    t_e1bpe1ausprtx-sdata = e1bpe1ausprtx.
    APPEND t_e1bpe1ausprtx.
  ENDLOOP.
  IF NOT t_e1bpe1ausprtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'CHARACTERISTICVALUEX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1ausprtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARART'                                           *
  CLEAR t_e1bpe1marart.
  REFRESH t_e1bpe1marart.
  t_e1bpe1marart-segnam = 'E1BPE1MARART'.
  LOOP AT clientdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'CLIENTDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marart.
    MOVE-CORRESPONDING clientdata
         TO e1bpe1marart.                                   "#EC ENHOK

    CONDENSE e1bpe1marart-net_weight.
    CONDENSE e1bpe1marart-qty_gr_gi.
    CONDENSE e1bpe1marart-allowed_wt.
    CONDENSE e1bpe1marart-allwd_vol.
    CONDENSE e1bpe1marart-wt_tol_lt.
    CONDENSE e1bpe1marart-vol_tol_lt.
    CONDENSE e1bpe1marart-fill_level.
    CONDENSE e1bpe1marart-stack_fact.
    CONDENSE e1bpe1marart-minremlife.
    CONDENSE e1bpe1marart-shelf_life.
    CONDENSE e1bpe1marart-stor_pct.
    CONDENSE e1bpe1marart-net_cont.
    CONDENSE e1bpe1marart-compprunit.
    CONDENSE e1bpe1marart-gross_cont.
    t_e1bpe1marart-sdata = e1bpe1marart.
    APPEND t_e1bpe1marart.
  ENDLOOP.
  IF NOT t_e1bpe1marart[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'CLIENTDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marart
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARART1'                                          *
  CLEAR t_e1bpe1marart1.
  REFRESH t_e1bpe1marart1.
  t_e1bpe1marart1-segnam = 'E1BPE1MARART1'.
  LOOP AT clientdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'CLIENTDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marart1.
    MOVE-CORRESPONDING clientdata
         TO e1bpe1marart1.                                  "#EC ENHOK

    CONDENSE e1bpe1marart1-max_allowed_capacity.
    CONDENSE e1bpe1marart1-overcapacity_tolerance.
    CONDENSE e1bpe1marart1-max_allowed_length.
    CONDENSE e1bpe1marart1-max_allowed_width.
    CONDENSE e1bpe1marart1-max_allowed_heigth.
    CONDENSE e1bpe1marart1-quarantine_period.
    t_e1bpe1marart1-sdata = e1bpe1marart1.
    APPEND t_e1bpe1marart1.
  ENDLOOP.
  IF NOT t_e1bpe1marart1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'CLIENTDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marart1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARARTX'                                          *
  CLEAR t_e1bpe1marartx.
  REFRESH t_e1bpe1marartx.
  t_e1bpe1marartx-segnam = 'E1BPE1MARARTX'.
  LOOP AT clientdatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'CLIENTDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marartx.
    MOVE-CORRESPONDING clientdatax
         TO e1bpe1marartx.                                  "#EC ENHOK

    t_e1bpe1marartx-sdata = e1bpe1marartx.
    APPEND t_e1bpe1marartx.
  ENDLOOP.
  IF NOT t_e1bpe1marartx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'CLIENTDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marartx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARAEXTRT'                                        *
  CLEAR t_e1bpe1maraextrt.
  REFRESH t_e1bpe1maraextrt.
  t_e1bpe1maraextrt-segnam = 'E1BPE1MARAEXTRT'.
  LOOP AT clientext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'CLIENTEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1maraextrt.
    MOVE-CORRESPONDING clientext
         TO e1bpe1maraextrt.                                "#EC ENHOK

    t_e1bpe1maraextrt-sdata = e1bpe1maraextrt.
    APPEND t_e1bpe1maraextrt.
  ENDLOOP.
  IF NOT t_e1bpe1maraextrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'CLIENTEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1maraextrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARAEXTRT1'                                       *
  CLEAR t_e1bpe1maraextrt1.
  REFRESH t_e1bpe1maraextrt1.
  t_e1bpe1maraextrt1-segnam = 'E1BPE1MARAEXTRT1'.
  LOOP AT clientext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'CLIENTEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1maraextrt1.
    MOVE-CORRESPONDING clientext
         TO e1bpe1maraextrt1.                               "#EC ENHOK

    t_e1bpe1maraextrt1-sdata = e1bpe1maraextrt1.
    APPEND t_e1bpe1maraextrt1.
  ENDLOOP.
  IF NOT t_e1bpe1maraextrt1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'CLIENTEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1maraextrt1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARAEXTRTX'                                       *
  CLEAR t_e1bpe1maraextrtx.
  REFRESH t_e1bpe1maraextrtx.
  t_e1bpe1maraextrtx-segnam = 'E1BPE1MARAEXTRTX'.
  LOOP AT clientextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'CLIENTEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1maraextrtx.
    MOVE-CORRESPONDING clientextx
         TO e1bpe1maraextrtx.                               "#EC ENHOK

    t_e1bpe1maraextrtx-sdata = e1bpe1maraextrtx.
    APPEND t_e1bpe1maraextrtx.
  ENDLOOP.
  IF NOT t_e1bpe1maraextrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'CLIENTEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1maraextrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARAEXTRTX1'                                      *
  CLEAR t_e1bpe1maraextrtx1.
  REFRESH t_e1bpe1maraextrtx1.
  t_e1bpe1maraextrtx1-segnam = 'E1BPE1MARAEXTRTX1'.
  LOOP AT clientextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'CLIENTEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1maraextrtx1.
    MOVE-CORRESPONDING clientextx
         TO e1bpe1maraextrtx1.                              "#EC ENHOK

    t_e1bpe1maraextrtx1-sdata = e1bpe1maraextrtx1.
    APPEND t_e1bpe1maraextrtx1.
  ENDLOOP.
  IF NOT t_e1bpe1maraextrtx1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'CLIENTEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1maraextrtx1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MAW1RT'                                           *
  CLEAR t_e1bpe1maw1rt.
  REFRESH t_e1bpe1maw1rt.
  t_e1bpe1maw1rt-segnam = 'E1BPE1MAW1RT'.
  LOOP AT addnlclientdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'ADDNLCLIENTDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1maw1rt.
    MOVE-CORRESPONDING addnlclientdata
         TO e1bpe1maw1rt.                                   "#EC ENHOK

    CONDENSE e1bpe1maw1rt-val_margin.
    t_e1bpe1maw1rt-sdata = e1bpe1maw1rt.
    APPEND t_e1bpe1maw1rt.
  ENDLOOP.
  IF NOT t_e1bpe1maw1rt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'ADDNLCLIENTDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1maw1rt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MAW1RTX'                                          *
  CLEAR t_e1bpe1maw1rtx.
  REFRESH t_e1bpe1maw1rtx.
  t_e1bpe1maw1rtx-segnam = 'E1BPE1MAW1RTX'.
  LOOP AT addnlclientdatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'ADDNLCLIENTDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1maw1rtx.
    MOVE-CORRESPONDING addnlclientdatax
         TO e1bpe1maw1rtx.                                  "#EC ENHOK

    t_e1bpe1maw1rtx-sdata = e1bpe1maw1rtx.
    APPEND t_e1bpe1maw1rtx.
  ENDLOOP.
  IF NOT t_e1bpe1maw1rtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'ADDNLCLIENTDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1maw1rtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MAKTRT'                                           *
  CLEAR t_e1bpe1maktrt.
  REFRESH t_e1bpe1maktrt.
  t_e1bpe1maktrt-segnam = 'E1BPE1MAKTRT'.
  LOOP AT materialdescription.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'MATERIALDESCRIPTION'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1maktrt.
    MOVE-CORRESPONDING materialdescription
         TO e1bpe1maktrt.                                   "#EC ENHOK

    t_e1bpe1maktrt-sdata = e1bpe1maktrt.
    APPEND t_e1bpe1maktrt.
  ENDLOOP.
  IF NOT t_e1bpe1maktrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'MATERIALDESCRIPTION'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1maktrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARCRT'                                           *
  CLEAR t_e1bpe1marcrt.
  REFRESH t_e1bpe1marcrt.
  t_e1bpe1marcrt-segnam = 'E1BPE1MARCRT'.
  LOOP AT plantdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANTDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marcrt.
    MOVE-CORRESPONDING plantdata
         TO e1bpe1marcrt.                                   "#EC ENHOK

    CONDENSE e1bpe1marcrt-plnd_delry.
    CONDENSE e1bpe1marcrt-gr_pr_time.
    CONDENSE e1bpe1marcrt-assy_scrap.
    CONDENSE e1bpe1marcrt-reorder_pt.
    CONDENSE e1bpe1marcrt-safety_stk.
    CONDENSE e1bpe1marcrt-minlotsize.
    CONDENSE e1bpe1marcrt-maxlotsize.
    CONDENSE e1bpe1marcrt-fixed_lot.
    CONDENSE e1bpe1marcrt-round_val.
    CONDENSE e1bpe1marcrt-max_stock.
    CONDENSE e1bpe1marcrt-ord_costs.
    CONDENSE e1bpe1marcrt-inhseprodt.
    CONDENSE e1bpe1marcrt-stgeperiod.
    CONDENSE e1bpe1marcrt-replentime.
    CONDENSE e1bpe1marcrt-serv_level.
    CONDENSE e1bpe1marcrt-setup_time.
    CONDENSE e1bpe1marcrt-base_qty.
    CONDENSE e1bpe1marcrt-proc_time.
    CONDENSE e1bpe1marcrt-comp_scrap.
    CONDENSE e1bpe1marcrt-cycle_time.
    CONDENSE e1bpe1marcrt-mult_ref_m.
    CONDENSE e1bpe1marcrt-insp_int.
    CONDENSE e1bpe1marcrt-under_tol.
    CONDENSE e1bpe1marcrt-over_tol.
    CONDENSE e1bpe1marcrt-setup_time_proc.
    CONDENSE e1bpe1marcrt-processing_time.
    CONDENSE e1bpe1marcrt-base_qty_proc.
    CONDENSE e1bpe1marcrt-interop_time.
    CONDENSE e1bpe1marcrt-lot_size.
    CONDENSE e1bpe1marcrt-min_safety_stk.
    t_e1bpe1marcrt-sdata = e1bpe1marcrt.
    APPEND t_e1bpe1marcrt.
  ENDLOOP.
  IF NOT t_e1bpe1marcrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANTDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marcrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARCRT1'                                          *
  CLEAR t_e1bpe1marcrt1.
  REFRESH t_e1bpe1marcrt1.
  t_e1bpe1marcrt1-segnam = 'E1BPE1MARCRT1'.
  LOOP AT plantdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANTDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marcrt1.
    MOVE-CORRESPONDING plantdata
         TO e1bpe1marcrt1.                                  "#EC ENHOK

    CONDENSE e1bpe1marcrt1-gi_pr_time.
    CONDENSE e1bpe1marcrt1-target_stock.
    t_e1bpe1marcrt1-sdata = e1bpe1marcrt1.
    APPEND t_e1bpe1marcrt1.
  ENDLOOP.
  IF NOT t_e1bpe1marcrt1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANTDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marcrt1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARCRTX'                                          *
  CLEAR t_e1bpe1marcrtx.
  REFRESH t_e1bpe1marcrtx.
  t_e1bpe1marcrtx-segnam = 'E1BPE1MARCRTX'.
  LOOP AT plantdatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANTDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marcrtx.
    MOVE-CORRESPONDING plantdatax
         TO e1bpe1marcrtx.                                  "#EC ENHOK

    t_e1bpe1marcrtx-sdata = e1bpe1marcrtx.
    APPEND t_e1bpe1marcrtx.
  ENDLOOP.
  IF NOT t_e1bpe1marcrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANTDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marcrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARCEXTRT'                                        *
  CLEAR t_e1bpe1marcextrt.
  REFRESH t_e1bpe1marcextrt.
  t_e1bpe1marcextrt-segnam = 'E1BPE1MARCEXTRT'.
  LOOP AT plantext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANTEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marcextrt.
    MOVE-CORRESPONDING plantext
         TO e1bpe1marcextrt.                                "#EC ENHOK

    t_e1bpe1marcextrt-sdata = e1bpe1marcextrt.
    APPEND t_e1bpe1marcextrt.
  ENDLOOP.
  IF NOT t_e1bpe1marcextrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANTEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marcextrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARCEXTRT1'                                       *
  CLEAR t_e1bpe1marcextrt1.
  REFRESH t_e1bpe1marcextrt1.
  t_e1bpe1marcextrt1-segnam = 'E1BPE1MARCEXTRT1'.
  LOOP AT plantext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANTEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marcextrt1.
    MOVE-CORRESPONDING plantext
         TO e1bpe1marcextrt1.                               "#EC ENHOK

    t_e1bpe1marcextrt1-sdata = e1bpe1marcextrt1.
    APPEND t_e1bpe1marcextrt1.
  ENDLOOP.
  IF NOT t_e1bpe1marcextrt1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANTEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marcextrt1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARCEXTRTX'                                       *
  CLEAR t_e1bpe1marcextrtx.
  REFRESH t_e1bpe1marcextrtx.
  t_e1bpe1marcextrtx-segnam = 'E1BPE1MARCEXTRTX'.
  LOOP AT plantextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANTEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marcextrtx.
    MOVE-CORRESPONDING plantextx
         TO e1bpe1marcextrtx.                               "#EC ENHOK

    t_e1bpe1marcextrtx-sdata = e1bpe1marcextrtx.
    APPEND t_e1bpe1marcextrtx.
  ENDLOOP.
  IF NOT t_e1bpe1marcextrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANTEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marcextrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARCEXTRTX1'                                      *
  CLEAR t_e1bpe1marcextrtx1.
  REFRESH t_e1bpe1marcextrtx1.
  t_e1bpe1marcextrtx1-segnam = 'E1BPE1MARCEXTRTX1'.
  LOOP AT plantextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANTEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marcextrtx1.
    MOVE-CORRESPONDING plantextx
         TO e1bpe1marcextrtx1.                              "#EC ENHOK

    t_e1bpe1marcextrtx1-sdata = e1bpe1marcextrtx1.
    APPEND t_e1bpe1marcextrtx1.
  ENDLOOP.
  IF NOT t_e1bpe1marcextrtx1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANTEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marcextrtx1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MPOPRT'                                           *
  CLEAR t_e1bpe1mpoprt.
  REFRESH t_e1bpe1mpoprt.
  t_e1bpe1mpoprt-segnam = 'E1BPE1MPOPRT'.
  LOOP AT forecastparameters.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'FORECASTPARAMETERS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mpoprt.
    MOVE-CORRESPONDING forecastparameters
         TO e1bpe1mpoprt.                                   "#EC ENHOK

    CONDENSE e1bpe1mpoprt-alpha_fact.
    CONDENSE e1bpe1mpoprt-beta_fact.
    CONDENSE e1bpe1mpoprt-gamma_fact.
    CONDENSE e1bpe1mpoprt-delta_fact.
    CONDENSE e1bpe1mpoprt-tracklimit.
    CONDENSE e1bpe1mpoprt-hist_vals.
    CONDENSE e1bpe1mpoprt-init_pds.
    CONDENSE e1bpe1mpoprt-season_pds.
    CONDENSE e1bpe1mpoprt-expost_pds.
    CONDENSE e1bpe1mpoprt-fore_pds.
    CONDENSE e1bpe1mpoprt-fixed_pds.
    t_e1bpe1mpoprt-sdata = e1bpe1mpoprt.
    APPEND t_e1bpe1mpoprt.
  ENDLOOP.
  IF NOT t_e1bpe1mpoprt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'FORECASTPARAMETERS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mpoprt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MPOPRTX'                                          *
  CLEAR t_e1bpe1mpoprtx.
  REFRESH t_e1bpe1mpoprtx.
  t_e1bpe1mpoprtx-segnam = 'E1BPE1MPOPRTX'.
  LOOP AT forecastparametersx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'FORECASTPARAMETERSX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mpoprtx.
    MOVE-CORRESPONDING forecastparametersx
         TO e1bpe1mpoprtx.                                  "#EC ENHOK

    t_e1bpe1mpoprtx-sdata = e1bpe1mpoprtx.
    APPEND t_e1bpe1mpoprtx.
  ENDLOOP.
  IF NOT t_e1bpe1mpoprtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'FORECASTPARAMETERSX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mpoprtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MPRWRT'                                           *
  CLEAR t_e1bpe1mprwrt.
  REFRESH t_e1bpe1mprwrt.
  t_e1bpe1mprwrt-segnam = 'E1BPE1MPRWRT'.
  LOOP AT forecastvalues.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'FORECASTVALUES'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mprwrt.
    MOVE-CORRESPONDING forecastvalues
         TO e1bpe1mprwrt.                                   "#EC ENHOK

    CONDENSE e1bpe1mprwrt-fore_value.
    CONDENSE e1bpe1mprwrt-corr_value.
    CONDENSE e1bpe1mprwrt-seas_index.
    CONDENSE e1bpe1mprwrt-expost_val.
    CONDENSE e1bpe1mprwrt-val_ratio.
    t_e1bpe1mprwrt-sdata = e1bpe1mprwrt.
    APPEND t_e1bpe1mprwrt.
  ENDLOOP.
  IF NOT t_e1bpe1mprwrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'FORECASTVALUES'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mprwrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MVEGRT'                                           *
  CLEAR t_e1bpe1mvegrt.
  REFRESH t_e1bpe1mvegrt.
  t_e1bpe1mvegrt-segnam = 'E1BPE1MVEGRT'.
  LOOP AT totalconsumption.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'TOTALCONSUMPTION'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mvegrt.
    MOVE-CORRESPONDING totalconsumption
         TO e1bpe1mvegrt.                                   "#EC ENHOK

    CONDENSE e1bpe1mvegrt-cons_value.
    CONDENSE e1bpe1mvegrt-corr_value.
    CONDENSE e1bpe1mvegrt-val_ratio.
    t_e1bpe1mvegrt-sdata = e1bpe1mvegrt.
    APPEND t_e1bpe1mvegrt.
  ENDLOOP.
  IF NOT t_e1bpe1mvegrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'TOTALCONSUMPTION'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mvegrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MVEURT'                                           *
  CLEAR t_e1bpe1mveurt.
  REFRESH t_e1bpe1mveurt.
  t_e1bpe1mveurt-segnam = 'E1BPE1MVEURT'.
  LOOP AT unplndconsumption.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'UNPLNDCONSUMPTION'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mveurt.
    MOVE-CORRESPONDING unplndconsumption
         TO e1bpe1mveurt.                                   "#EC ENHOK

    CONDENSE e1bpe1mveurt-cons_value.
    CONDENSE e1bpe1mveurt-corr_value.
    CONDENSE e1bpe1mveurt-val_ratio.
    t_e1bpe1mveurt-sdata = e1bpe1mveurt.
    APPEND t_e1bpe1mveurt.
  ENDLOOP.
  IF NOT t_e1bpe1mveurt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'UNPLNDCONSUMPTION'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mveurt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MPGDRT'                                           *
  CLEAR t_e1bpe1mpgdrt.
  REFRESH t_e1bpe1mpgdrt.
  t_e1bpe1mpgdrt-segnam = 'E1BPE1MPGDRT'.
  LOOP AT planningdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANNINGDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mpgdrt.
    MOVE-CORRESPONDING planningdata
         TO e1bpe1mpgdrt.                                   "#EC ENHOK

    t_e1bpe1mpgdrt-sdata = e1bpe1mpgdrt.
    APPEND t_e1bpe1mpgdrt.
  ENDLOOP.
  IF NOT t_e1bpe1mpgdrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANNINGDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mpgdrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MPGDRTX'                                          *
  CLEAR t_e1bpe1mpgdrtx.
  REFRESH t_e1bpe1mpgdrtx.
  t_e1bpe1mpgdrtx-segnam = 'E1BPE1MPGDRTX'.
  LOOP AT planningdatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANNINGDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mpgdrtx.
    MOVE-CORRESPONDING planningdatax
         TO e1bpe1mpgdrtx.                                  "#EC ENHOK

    t_e1bpe1mpgdrtx-sdata = e1bpe1mpgdrtx.
    APPEND t_e1bpe1mpgdrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mpgdrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANNINGDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mpgdrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARDRT'                                           *
  CLEAR t_e1bpe1mardrt.
  REFRESH t_e1bpe1mardrt.
  t_e1bpe1mardrt-segnam = 'E1BPE1MARDRT'.
  LOOP AT storagelocationdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGELOCATIONDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mardrt.
    MOVE-CORRESPONDING storagelocationdata
         TO e1bpe1mardrt.                                   "#EC ENHOK

    CONDENSE e1bpe1mardrt-reorder_pt.
    CONDENSE e1bpe1mardrt-repl_qty.
    t_e1bpe1mardrt-sdata = e1bpe1mardrt.
    APPEND t_e1bpe1mardrt.
  ENDLOOP.
  IF NOT t_e1bpe1mardrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGELOCATIONDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mardrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARDRTX'                                          *
  CLEAR t_e1bpe1mardrtx.
  REFRESH t_e1bpe1mardrtx.
  t_e1bpe1mardrtx-segnam = 'E1BPE1MARDRTX'.
  LOOP AT storagelocationdatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGELOCATIONDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mardrtx.
    MOVE-CORRESPONDING storagelocationdatax
         TO e1bpe1mardrtx.                                  "#EC ENHOK

    t_e1bpe1mardrtx-sdata = e1bpe1mardrtx.
    APPEND t_e1bpe1mardrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mardrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGELOCATIONDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mardrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARDEXTRT'                                        *
  CLEAR t_e1bpe1mardextrt.
  REFRESH t_e1bpe1mardextrt.
  t_e1bpe1mardextrt-segnam = 'E1BPE1MARDEXTRT'.
  LOOP AT storagelocationext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGELOCATIONEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mardextrt.
    MOVE-CORRESPONDING storagelocationext
         TO e1bpe1mardextrt.                                "#EC ENHOK

    t_e1bpe1mardextrt-sdata = e1bpe1mardextrt.
    APPEND t_e1bpe1mardextrt.
  ENDLOOP.
  IF NOT t_e1bpe1mardextrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGELOCATIONEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mardextrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARDEXTRT1'                                       *
  CLEAR t_e1bpe1mardextrt1.
  REFRESH t_e1bpe1mardextrt1.
  t_e1bpe1mardextrt1-segnam = 'E1BPE1MARDEXTRT1'.
  LOOP AT storagelocationext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGELOCATIONEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mardextrt1.
    MOVE-CORRESPONDING storagelocationext
         TO e1bpe1mardextrt1.                               "#EC ENHOK

    t_e1bpe1mardextrt1-sdata = e1bpe1mardextrt1.
    APPEND t_e1bpe1mardextrt1.
  ENDLOOP.
  IF NOT t_e1bpe1mardextrt1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGELOCATIONEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mardextrt1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARDEXTRTX'                                       *
  CLEAR t_e1bpe1mardextrtx.
  REFRESH t_e1bpe1mardextrtx.
  t_e1bpe1mardextrtx-segnam = 'E1BPE1MARDEXTRTX'.
  LOOP AT storagelocationextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGELOCATIONEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mardextrtx.
    MOVE-CORRESPONDING storagelocationextx
         TO e1bpe1mardextrtx.                               "#EC ENHOK

    t_e1bpe1mardextrtx-sdata = e1bpe1mardextrtx.
    APPEND t_e1bpe1mardextrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mardextrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGELOCATIONEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mardextrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARDEXTRTX1'                                      *
  CLEAR t_e1bpe1mardextrtx1.
  REFRESH t_e1bpe1mardextrtx1.
  t_e1bpe1mardextrtx1-segnam = 'E1BPE1MARDEXTRTX1'.
  LOOP AT storagelocationextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGELOCATIONEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mardextrtx1.
    MOVE-CORRESPONDING storagelocationextx
         TO e1bpe1mardextrtx1.                              "#EC ENHOK

    t_e1bpe1mardextrtx1-sdata = e1bpe1mardextrtx1.
    APPEND t_e1bpe1mardextrtx1.
  ENDLOOP.
  IF NOT t_e1bpe1mardextrtx1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGELOCATIONEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mardextrtx1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARMRT'                                           *
  CLEAR t_e1bpe1marmrt.
  REFRESH t_e1bpe1marmrt.
  t_e1bpe1marmrt-segnam = 'E1BPE1MARMRT'.
  LOOP AT unitsofmeasure.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'UNITSOFMEASURE'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marmrt.
    MOVE-CORRESPONDING unitsofmeasure
         TO e1bpe1marmrt.                                   "#EC ENHOK

    CONDENSE e1bpe1marmrt-numerator.
    CONDENSE e1bpe1marmrt-denominatr.
    CONDENSE e1bpe1marmrt-length.
    CONDENSE e1bpe1marmrt-width.
    CONDENSE e1bpe1marmrt-height.
    CONDENSE e1bpe1marmrt-volume.
    CONDENSE e1bpe1marmrt-gross_wt.
    CONDENSE e1bpe1marmrt-nesting_factor.
    CONDENSE e1bpe1marmrt-maximum_stacking.
    CONDENSE e1bpe1marmrt-capacity_usage.
    t_e1bpe1marmrt-sdata = e1bpe1marmrt.
    APPEND t_e1bpe1marmrt.
  ENDLOOP.
  IF NOT t_e1bpe1marmrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'UNITSOFMEASURE'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marmrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MARMRTX'                                          *
  CLEAR t_e1bpe1marmrtx.
  REFRESH t_e1bpe1marmrtx.
  t_e1bpe1marmrtx-segnam = 'E1BPE1MARMRTX'.
  LOOP AT unitsofmeasurex.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'UNITSOFMEASUREX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1marmrtx.
    MOVE-CORRESPONDING unitsofmeasurex
         TO e1bpe1marmrtx.                                  "#EC ENHOK

    t_e1bpe1marmrtx-sdata = e1bpe1marmrtx.
    APPEND t_e1bpe1marmrtx.
  ENDLOOP.
  IF NOT t_e1bpe1marmrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'UNITSOFMEASUREX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1marmrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MAMTRT'                                           *
  CLEAR t_e1bpe1mamtrt.
  REFRESH t_e1bpe1mamtrt.
  t_e1bpe1mamtrt-segnam = 'E1BPE1MAMTRT'.
  LOOP AT unitofmeasuretexts.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'UNITOFMEASURETEXTS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mamtrt.
    MOVE-CORRESPONDING unitofmeasuretexts
         TO e1bpe1mamtrt.                                   "#EC ENHOK

    t_e1bpe1mamtrt-sdata = e1bpe1mamtrt.
    APPEND t_e1bpe1mamtrt.
  ENDLOOP.
  IF NOT t_e1bpe1mamtrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'UNITOFMEASURETEXTS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mamtrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MEANRT'                                           *
  CLEAR t_e1bpe1meanrt.
  REFRESH t_e1bpe1meanrt.
  t_e1bpe1meanrt-segnam = 'E1BPE1MEANRT'.
  LOOP AT internationalartnos.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'INTERNATIONALARTNOS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1meanrt.
    MOVE-CORRESPONDING internationalartnos
         TO e1bpe1meanrt.                                   "#EC ENHOK

    t_e1bpe1meanrt-sdata = e1bpe1meanrt.
    APPEND t_e1bpe1meanrt.
  ENDLOOP.
  IF NOT t_e1bpe1meanrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'INTERNATIONALARTNOS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1meanrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLEART'                                           *
  CLEAR t_e1bpe1mleart.
  REFRESH t_e1bpe1mleart.
  t_e1bpe1mleart-segnam = 'E1BPE1MLEART'.
  LOOP AT vendorean.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'VENDOREAN'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mleart.
    MOVE-CORRESPONDING vendorean
         TO e1bpe1mleart.                                   "#EC ENHOK

    t_e1bpe1mleart-sdata = e1bpe1mleart.
    APPEND t_e1bpe1mleart.
  ENDLOOP.
  IF NOT t_e1bpe1mleart[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'VENDOREAN'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mleart
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MALGRT'                                           *
  CLEAR t_e1bpe1malgrt.
  REFRESH t_e1bpe1malgrt.
  t_e1bpe1malgrt-segnam = 'E1BPE1MALGRT'.
  LOOP AT layoutmoduleassgmt.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'LAYOUTMODULEASSGMT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1malgrt.
    MOVE-CORRESPONDING layoutmoduleassgmt
         TO e1bpe1malgrt.                                   "#EC ENHOK

    CONDENSE e1bpe1malgrt-facing.
    CONDENSE e1bpe1malgrt-front.
    CONDENSE e1bpe1malgrt-shelf_quantity_max.
    CONDENSE e1bpe1malgrt-shelf_quantity_opt.
    CONDENSE e1bpe1malgrt-pres_qnt.
    t_e1bpe1malgrt-sdata = e1bpe1malgrt.
    APPEND t_e1bpe1malgrt.
  ENDLOOP.
  IF NOT t_e1bpe1malgrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'LAYOUTMODULEASSGMT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1malgrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MALGRTX'                                          *
  CLEAR t_e1bpe1malgrtx.
  REFRESH t_e1bpe1malgrtx.
  t_e1bpe1malgrtx-segnam = 'E1BPE1MALGRTX'.
  LOOP AT layoutmoduleassgmtx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'LAYOUTMODULEASSGMTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1malgrtx.
    MOVE-CORRESPONDING layoutmoduleassgmtx
         TO e1bpe1malgrtx.                                  "#EC ENHOK

    t_e1bpe1malgrtx-sdata = e1bpe1malgrtx.
    APPEND t_e1bpe1malgrtx.
  ENDLOOP.
  IF NOT t_e1bpe1malgrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'LAYOUTMODULEASSGMTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1malgrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLANRT'                                           *
  CLEAR t_e1bpe1mlanrt.
  REFRESH t_e1bpe1mlanrt.
  t_e1bpe1mlanrt-segnam = 'E1BPE1MLANRT'.
  LOOP AT taxclassifications.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'TAXCLASSIFICATIONS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlanrt.
    MOVE-CORRESPONDING taxclassifications
         TO e1bpe1mlanrt.                                   "#EC ENHOK

    t_e1bpe1mlanrt-sdata = e1bpe1mlanrt.
    APPEND t_e1bpe1mlanrt.
  ENDLOOP.
  IF NOT t_e1bpe1mlanrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'TAXCLASSIFICATIONS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlanrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MBEWRT'                                           *
  CLEAR t_e1bpe1mbewrt.
  REFRESH t_e1bpe1mbewrt.
  t_e1bpe1mbewrt-segnam = 'E1BPE1MBEWRT'.
  LOOP AT valuationdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'VALUATIONDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mbewrt.
    MOVE-CORRESPONDING valuationdata
         TO e1bpe1mbewrt.                                   "#EC ENHOK

    CONDENSE e1bpe1mbewrt-moving_pr.
    CONDENSE e1bpe1mbewrt-std_price.
    CONDENSE e1bpe1mbewrt-price_unit.
    CONDENSE e1bpe1mbewrt-mov_pr_pp.
    CONDENSE e1bpe1mbewrt-std_pr_pp.
    CONDENSE e1bpe1mbewrt-pr_unit_pp.
    CONDENSE e1bpe1mbewrt-mov_pr_py.
    CONDENSE e1bpe1mbewrt-std_pr_py.
    CONDENSE e1bpe1mbewrt-pr_unit_py.
    CONDENSE e1bpe1mbewrt-future_pr.
    CONDENSE e1bpe1mbewrt-taxprice_1.
    CONDENSE e1bpe1mbewrt-commprice1.
    CONDENSE e1bpe1mbewrt-taxprice_3.
    CONDENSE e1bpe1mbewrt-commprice3.
    CONDENSE e1bpe1mbewrt-taxprice_2.
    CONDENSE e1bpe1mbewrt-commprice2.
    CONDENSE e1bpe1mbewrt-val_margin.
    CONDENSE e1bpe1mbewrt-tax_cml_un.
    CONDENSE e1bpe1mbewrt-plnd_price.
    CONDENSE e1bpe1mbewrt-plndprice1.
    CONDENSE e1bpe1mbewrt-plndprice2.
    CONDENSE e1bpe1mbewrt-plndprice3.
    t_e1bpe1mbewrt-sdata = e1bpe1mbewrt.
    APPEND t_e1bpe1mbewrt.
  ENDLOOP.
  IF NOT t_e1bpe1mbewrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'VALUATIONDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mbewrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MBEWRTX'                                          *
  CLEAR t_e1bpe1mbewrtx.
  REFRESH t_e1bpe1mbewrtx.
  t_e1bpe1mbewrtx-segnam = 'E1BPE1MBEWRTX'.
  LOOP AT valuationdatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'VALUATIONDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mbewrtx.
    MOVE-CORRESPONDING valuationdatax
         TO e1bpe1mbewrtx.                                  "#EC ENHOK

    t_e1bpe1mbewrtx-sdata = e1bpe1mbewrtx.
    APPEND t_e1bpe1mbewrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mbewrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'VALUATIONDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mbewrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MBEWEXTRT'                                        *
  CLEAR t_e1bpe1mbewextrt.
  REFRESH t_e1bpe1mbewextrt.
  t_e1bpe1mbewextrt-segnam = 'E1BPE1MBEWEXTRT'.
  LOOP AT valuationext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'VALUATIONEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mbewextrt.
    MOVE-CORRESPONDING valuationext
         TO e1bpe1mbewextrt.                                "#EC ENHOK

    t_e1bpe1mbewextrt-sdata = e1bpe1mbewextrt.
    APPEND t_e1bpe1mbewextrt.
  ENDLOOP.
  IF NOT t_e1bpe1mbewextrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'VALUATIONEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mbewextrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MBEWEXTRT1'                                       *
  CLEAR t_e1bpe1mbewextrt1.
  REFRESH t_e1bpe1mbewextrt1.
  t_e1bpe1mbewextrt1-segnam = 'E1BPE1MBEWEXTRT1'.
  LOOP AT valuationext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'VALUATIONEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mbewextrt1.
    MOVE-CORRESPONDING valuationext
         TO e1bpe1mbewextrt1.                               "#EC ENHOK

    t_e1bpe1mbewextrt1-sdata = e1bpe1mbewextrt1.
    APPEND t_e1bpe1mbewextrt1.
  ENDLOOP.
  IF NOT t_e1bpe1mbewextrt1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'VALUATIONEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mbewextrt1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MBEWEXTRTX'                                       *
  CLEAR t_e1bpe1mbewextrtx.
  REFRESH t_e1bpe1mbewextrtx.
  t_e1bpe1mbewextrtx-segnam = 'E1BPE1MBEWEXTRTX'.
  LOOP AT valuationextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'VALUATIONEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mbewextrtx.
    MOVE-CORRESPONDING valuationextx
         TO e1bpe1mbewextrtx.                               "#EC ENHOK

    t_e1bpe1mbewextrtx-sdata = e1bpe1mbewextrtx.
    APPEND t_e1bpe1mbewextrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mbewextrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'VALUATIONEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mbewextrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MBEWEXTRTX1'                                      *
  CLEAR t_e1bpe1mbewextrtx1.
  REFRESH t_e1bpe1mbewextrtx1.
  t_e1bpe1mbewextrtx1-segnam = 'E1BPE1MBEWEXTRTX1'.
  LOOP AT valuationextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'VALUATIONEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mbewextrtx1.
    MOVE-CORRESPONDING valuationextx
         TO e1bpe1mbewextrtx1.                              "#EC ENHOK

    t_e1bpe1mbewextrtx1-sdata = e1bpe1mbewextrtx1.
    APPEND t_e1bpe1mbewextrtx1.
  ENDLOOP.
  IF NOT t_e1bpe1mbewextrtx1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'VALUATIONEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mbewextrtx1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGNRT'                                           *
  CLEAR t_e1bpe1mlgnrt.
  REFRESH t_e1bpe1mlgnrt.
  t_e1bpe1mlgnrt-segnam = 'E1BPE1MLGNRT'.
  LOOP AT warehousenumberdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'WAREHOUSENUMBERDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgnrt.
    MOVE-CORRESPONDING warehousenumberdata
         TO e1bpe1mlgnrt.                                   "#EC ENHOK

    CONDENSE e1bpe1mlgnrt-l_equip_1.
    CONDENSE e1bpe1mlgnrt-l_equip_2.
    CONDENSE e1bpe1mlgnrt-l_equip_3.
    CONDENSE e1bpe1mlgnrt-capy_usage.
    t_e1bpe1mlgnrt-sdata = e1bpe1mlgnrt.
    APPEND t_e1bpe1mlgnrt.
  ENDLOOP.
  IF NOT t_e1bpe1mlgnrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'WAREHOUSENUMBERDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgnrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGNRTX'                                          *
  CLEAR t_e1bpe1mlgnrtx.
  REFRESH t_e1bpe1mlgnrtx.
  t_e1bpe1mlgnrtx-segnam = 'E1BPE1MLGNRTX'.
  LOOP AT warehousenumberdatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'WAREHOUSENUMBERDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgnrtx.
    MOVE-CORRESPONDING warehousenumberdatax
         TO e1bpe1mlgnrtx.                                  "#EC ENHOK

    t_e1bpe1mlgnrtx-sdata = e1bpe1mlgnrtx.
    APPEND t_e1bpe1mlgnrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mlgnrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'WAREHOUSENUMBERDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgnrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGNEXTRT'                                        *
  CLEAR t_e1bpe1mlgnextrt.
  REFRESH t_e1bpe1mlgnextrt.
  t_e1bpe1mlgnextrt-segnam = 'E1BPE1MLGNEXTRT'.
  LOOP AT warehousenumberext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'WAREHOUSENUMBEREXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgnextrt.
    MOVE-CORRESPONDING warehousenumberext
         TO e1bpe1mlgnextrt.                                "#EC ENHOK

    t_e1bpe1mlgnextrt-sdata = e1bpe1mlgnextrt.
    APPEND t_e1bpe1mlgnextrt.
  ENDLOOP.
  IF NOT t_e1bpe1mlgnextrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'WAREHOUSENUMBEREXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgnextrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGNEXTRT1'                                       *
  CLEAR t_e1bpe1mlgnextrt1.
  REFRESH t_e1bpe1mlgnextrt1.
  t_e1bpe1mlgnextrt1-segnam = 'E1BPE1MLGNEXTRT1'.
  LOOP AT warehousenumberext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'WAREHOUSENUMBEREXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgnextrt1.
    MOVE-CORRESPONDING warehousenumberext
         TO e1bpe1mlgnextrt1.                               "#EC ENHOK

    t_e1bpe1mlgnextrt1-sdata = e1bpe1mlgnextrt1.
    APPEND t_e1bpe1mlgnextrt1.
  ENDLOOP.
  IF NOT t_e1bpe1mlgnextrt1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'WAREHOUSENUMBEREXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgnextrt1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGNEXTRTX'                                       *
  CLEAR t_e1bpe1mlgnextrtx.
  REFRESH t_e1bpe1mlgnextrtx.
  t_e1bpe1mlgnextrtx-segnam = 'E1BPE1MLGNEXTRTX'.
  LOOP AT warehousenumberextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'WAREHOUSENUMBEREXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgnextrtx.
    MOVE-CORRESPONDING warehousenumberextx
         TO e1bpe1mlgnextrtx.                               "#EC ENHOK

    t_e1bpe1mlgnextrtx-sdata = e1bpe1mlgnextrtx.
    APPEND t_e1bpe1mlgnextrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mlgnextrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'WAREHOUSENUMBEREXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgnextrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGNEXTRTX1'                                      *
  CLEAR t_e1bpe1mlgnextrtx1.
  REFRESH t_e1bpe1mlgnextrtx1.
  t_e1bpe1mlgnextrtx1-segnam = 'E1BPE1MLGNEXTRTX1'.
  LOOP AT warehousenumberextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'WAREHOUSENUMBEREXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgnextrtx1.
    MOVE-CORRESPONDING warehousenumberextx
         TO e1bpe1mlgnextrtx1.                              "#EC ENHOK

    t_e1bpe1mlgnextrtx1-sdata = e1bpe1mlgnextrtx1.
    APPEND t_e1bpe1mlgnextrtx1.
  ENDLOOP.
  IF NOT t_e1bpe1mlgnextrtx1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'WAREHOUSENUMBEREXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgnextrtx1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGTRT'                                           *
  CLEAR t_e1bpe1mlgtrt.
  REFRESH t_e1bpe1mlgtrt.
  t_e1bpe1mlgtrt-segnam = 'E1BPE1MLGTRT'.
  LOOP AT storagetypedata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGETYPEDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgtrt.
    MOVE-CORRESPONDING storagetypedata
         TO e1bpe1mlgtrt.                                   "#EC ENHOK

    CONDENSE e1bpe1mlgtrt-max_sb_qty.
    CONDENSE e1bpe1mlgtrt-min_sb_qty.
    CONDENSE e1bpe1mlgtrt-ctrl_qty.
    CONDENSE e1bpe1mlgtrt-replen_qty.
    CONDENSE e1bpe1mlgtrt-round_unit.
    t_e1bpe1mlgtrt-sdata = e1bpe1mlgtrt.
    APPEND t_e1bpe1mlgtrt.
  ENDLOOP.
  IF NOT t_e1bpe1mlgtrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGETYPEDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgtrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGTRTX'                                          *
  CLEAR t_e1bpe1mlgtrtx.
  REFRESH t_e1bpe1mlgtrtx.
  t_e1bpe1mlgtrtx-segnam = 'E1BPE1MLGTRTX'.
  LOOP AT storagetypedatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGETYPEDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgtrtx.
    MOVE-CORRESPONDING storagetypedatax
         TO e1bpe1mlgtrtx.                                  "#EC ENHOK

    t_e1bpe1mlgtrtx-sdata = e1bpe1mlgtrtx.
    APPEND t_e1bpe1mlgtrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mlgtrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGETYPEDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgtrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGTEXTRT'                                        *
  CLEAR t_e1bpe1mlgtextrt.
  REFRESH t_e1bpe1mlgtextrt.
  t_e1bpe1mlgtextrt-segnam = 'E1BPE1MLGTEXTRT'.
  LOOP AT storagetypeext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGETYPEEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgtextrt.
    MOVE-CORRESPONDING storagetypeext
         TO e1bpe1mlgtextrt.                                "#EC ENHOK

    t_e1bpe1mlgtextrt-sdata = e1bpe1mlgtextrt.
    APPEND t_e1bpe1mlgtextrt.
  ENDLOOP.
  IF NOT t_e1bpe1mlgtextrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGETYPEEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgtextrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGTEXTRT1'                                       *
  CLEAR t_e1bpe1mlgtextrt1.
  REFRESH t_e1bpe1mlgtextrt1.
  t_e1bpe1mlgtextrt1-segnam = 'E1BPE1MLGTEXTRT1'.
  LOOP AT storagetypeext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGETYPEEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgtextrt1.
    MOVE-CORRESPONDING storagetypeext
         TO e1bpe1mlgtextrt1.                               "#EC ENHOK

    t_e1bpe1mlgtextrt1-sdata = e1bpe1mlgtextrt1.
    APPEND t_e1bpe1mlgtextrt1.
  ENDLOOP.
  IF NOT t_e1bpe1mlgtextrt1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGETYPEEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgtextrt1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGTEXTRTX'                                       *
  CLEAR t_e1bpe1mlgtextrtx.
  REFRESH t_e1bpe1mlgtextrtx.
  t_e1bpe1mlgtextrtx-segnam = 'E1BPE1MLGTEXTRTX'.
  LOOP AT storagetypeextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGETYPEEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgtextrtx.
    MOVE-CORRESPONDING storagetypeextx
         TO e1bpe1mlgtextrtx.                               "#EC ENHOK

    t_e1bpe1mlgtextrtx-sdata = e1bpe1mlgtextrtx.
    APPEND t_e1bpe1mlgtextrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mlgtextrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGETYPEEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgtextrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLGTEXTRTX1'                                      *
  CLEAR t_e1bpe1mlgtextrtx1.
  REFRESH t_e1bpe1mlgtextrtx1.
  t_e1bpe1mlgtextrtx1-segnam = 'E1BPE1MLGTEXTRTX1'.
  LOOP AT storagetypeextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGETYPEEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mlgtextrtx1.
    MOVE-CORRESPONDING storagetypeextx
         TO e1bpe1mlgtextrtx1.                              "#EC ENHOK

    t_e1bpe1mlgtextrtx1-sdata = e1bpe1mlgtextrtx1.
    APPEND t_e1bpe1mlgtextrtx1.
  ENDLOOP.
  IF NOT t_e1bpe1mlgtextrtx1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGETYPEEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mlgtextrtx1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MVKERT'                                           *
  CLEAR t_e1bpe1mvkert.
  REFRESH t_e1bpe1mvkert.
  t_e1bpe1mvkert-segnam = 'E1BPE1MVKERT'.
  LOOP AT salesdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SALESDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mvkert.
    MOVE-CORRESPONDING salesdata
         TO e1bpe1mvkert.                                   "#EC ENHOK

    CONDENSE e1bpe1mvkert-min_order.
    CONDENSE e1bpe1mvkert-min_dely.
    CONDENSE e1bpe1mvkert-min_mto.
    CONDENSE e1bpe1mvkert-dely_unit.
    CONDENSE e1bpe1mvkert-max_dely.
    t_e1bpe1mvkert-sdata = e1bpe1mvkert.
    APPEND t_e1bpe1mvkert.
  ENDLOOP.
  IF NOT t_e1bpe1mvkert[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SALESDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mvkert
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MVKERTX'                                          *
  CLEAR t_e1bpe1mvkertx.
  REFRESH t_e1bpe1mvkertx.
  t_e1bpe1mvkertx-segnam = 'E1BPE1MVKERTX'.
  LOOP AT salesdatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SALESDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mvkertx.
    MOVE-CORRESPONDING salesdatax
         TO e1bpe1mvkertx.                                  "#EC ENHOK

    t_e1bpe1mvkertx-sdata = e1bpe1mvkertx.
    APPEND t_e1bpe1mvkertx.
  ENDLOOP.
  IF NOT t_e1bpe1mvkertx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SALESDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mvkertx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MVKEEXTRT'                                        *
  CLEAR t_e1bpe1mvkeextrt.
  REFRESH t_e1bpe1mvkeextrt.
  t_e1bpe1mvkeextrt-segnam = 'E1BPE1MVKEEXTRT'.
  LOOP AT salesext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SALESEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mvkeextrt.
    MOVE-CORRESPONDING salesext
         TO e1bpe1mvkeextrt.                                "#EC ENHOK

    t_e1bpe1mvkeextrt-sdata = e1bpe1mvkeextrt.
    APPEND t_e1bpe1mvkeextrt.
  ENDLOOP.
  IF NOT t_e1bpe1mvkeextrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SALESEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mvkeextrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MVKEEXTRT1'                                       *
  CLEAR t_e1bpe1mvkeextrt1.
  REFRESH t_e1bpe1mvkeextrt1.
  t_e1bpe1mvkeextrt1-segnam = 'E1BPE1MVKEEXTRT1'.
  LOOP AT salesext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SALESEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mvkeextrt1.
    MOVE-CORRESPONDING salesext
         TO e1bpe1mvkeextrt1.                               "#EC ENHOK

    t_e1bpe1mvkeextrt1-sdata = e1bpe1mvkeextrt1.
    APPEND t_e1bpe1mvkeextrt1.
  ENDLOOP.
  IF NOT t_e1bpe1mvkeextrt1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SALESEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mvkeextrt1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MVKEEXTRTX'                                       *
  CLEAR t_e1bpe1mvkeextrtx.
  REFRESH t_e1bpe1mvkeextrtx.
  t_e1bpe1mvkeextrtx-segnam = 'E1BPE1MVKEEXTRTX'.
  LOOP AT salesextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SALESEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mvkeextrtx.
    MOVE-CORRESPONDING salesextx
         TO e1bpe1mvkeextrtx.                               "#EC ENHOK

    t_e1bpe1mvkeextrtx-sdata = e1bpe1mvkeextrtx.
    APPEND t_e1bpe1mvkeextrtx.
  ENDLOOP.
  IF NOT t_e1bpe1mvkeextrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SALESEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mvkeextrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MVKEEXTRTX1'                                      *
  CLEAR t_e1bpe1mvkeextrtx1.
  REFRESH t_e1bpe1mvkeextrtx1.
  t_e1bpe1mvkeextrtx1-segnam = 'E1BPE1MVKEEXTRTX1'.
  LOOP AT salesextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SALESEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mvkeextrtx1.
    MOVE-CORRESPONDING salesextx
         TO e1bpe1mvkeextrtx1.                              "#EC ENHOK

    t_e1bpe1mvkeextrtx1-sdata = e1bpe1mvkeextrtx1.
    APPEND t_e1bpe1mvkeextrtx1.
  ENDLOOP.
  IF NOT t_e1bpe1mvkeextrtx1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SALESEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mvkeextrtx1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1WLK2RT'                                           *
  CLEAR t_e1bpe1wlk2rt.
  REFRESH t_e1bpe1wlk2rt.
  t_e1bpe1wlk2rt-segnam = 'E1BPE1WLK2RT'.
  LOOP AT posdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'POSDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1wlk2rt.
    MOVE-CORRESPONDING posdata
         TO e1bpe1wlk2rt.                                   "#EC ENHOK

    t_e1bpe1wlk2rt-sdata = e1bpe1wlk2rt.
    APPEND t_e1bpe1wlk2rt.
  ENDLOOP.
  IF NOT t_e1bpe1wlk2rt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'POSDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1wlk2rt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1WLK2RTX'                                          *
  CLEAR t_e1bpe1wlk2rtx.
  REFRESH t_e1bpe1wlk2rtx.
  t_e1bpe1wlk2rtx-segnam = 'E1BPE1WLK2RTX'.
  LOOP AT posdatax.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'POSDATAX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1wlk2rtx.
    MOVE-CORRESPONDING posdatax
         TO e1bpe1wlk2rtx.                                  "#EC ENHOK

    t_e1bpe1wlk2rtx-sdata = e1bpe1wlk2rtx.
    APPEND t_e1bpe1wlk2rtx.
  ENDLOOP.
  IF NOT t_e1bpe1wlk2rtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'POSDATAX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1wlk2rtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1WLK2EXTRT'                                        *
  CLEAR t_e1bpe1wlk2extrt.
  REFRESH t_e1bpe1wlk2extrt.
  t_e1bpe1wlk2extrt-segnam = 'E1BPE1WLK2EXTRT'.
  LOOP AT posext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'POSEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1wlk2extrt.
    MOVE-CORRESPONDING posext
         TO e1bpe1wlk2extrt.                                "#EC ENHOK

    t_e1bpe1wlk2extrt-sdata = e1bpe1wlk2extrt.
    APPEND t_e1bpe1wlk2extrt.
  ENDLOOP.
  IF NOT t_e1bpe1wlk2extrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'POSEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1wlk2extrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1WLK2EXTRT1'                                       *
  CLEAR t_e1bpe1wlk2extrt1.
  REFRESH t_e1bpe1wlk2extrt1.
  t_e1bpe1wlk2extrt1-segnam = 'E1BPE1WLK2EXTRT1'.
  LOOP AT posext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'POSEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1wlk2extrt1.
    MOVE-CORRESPONDING posext
         TO e1bpe1wlk2extrt1.                               "#EC ENHOK

    t_e1bpe1wlk2extrt1-sdata = e1bpe1wlk2extrt1.
    APPEND t_e1bpe1wlk2extrt1.
  ENDLOOP.
  IF NOT t_e1bpe1wlk2extrt1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'POSEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1wlk2extrt1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1WLK2EXTRTX'                                       *
  CLEAR t_e1bpe1wlk2extrtx.
  REFRESH t_e1bpe1wlk2extrtx.
  t_e1bpe1wlk2extrtx-segnam = 'E1BPE1WLK2EXTRTX'.
  LOOP AT posextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'POSEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1wlk2extrtx.
    MOVE-CORRESPONDING posextx
         TO e1bpe1wlk2extrtx.                               "#EC ENHOK

    t_e1bpe1wlk2extrtx-sdata = e1bpe1wlk2extrtx.
    APPEND t_e1bpe1wlk2extrtx.
  ENDLOOP.
  IF NOT t_e1bpe1wlk2extrtx[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'POSEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1wlk2extrtx
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1WLK2EXTRTX1'                                      *
  CLEAR t_e1bpe1wlk2extrtx1.
  REFRESH t_e1bpe1wlk2extrtx1.
  t_e1bpe1wlk2extrtx1-segnam = 'E1BPE1WLK2EXTRTX1'.
  LOOP AT posextx.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'POSEXTX'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1wlk2extrtx1.
    MOVE-CORRESPONDING posextx
         TO e1bpe1wlk2extrtx1.                              "#EC ENHOK

    t_e1bpe1wlk2extrtx1-sdata = e1bpe1wlk2extrtx1.
    APPEND t_e1bpe1wlk2extrtx1.
  ENDLOOP.
  IF NOT t_e1bpe1wlk2extrtx1[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'POSEXTX'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1wlk2extrtx1
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1MLTXRT'                                           *
  CLEAR t_e1bpe1mltxrt.
  REFRESH t_e1bpe1mltxrt.
  t_e1bpe1mltxrt-segnam = 'E1BPE1MLTXRT'.
  LOOP AT materiallongtext.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'MATERIALLONGTEXT'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1mltxrt.
    MOVE-CORRESPONDING materiallongtext
         TO e1bpe1mltxrt.                                   "#EC ENHOK

    t_e1bpe1mltxrt-sdata = e1bpe1mltxrt.
    APPEND t_e1bpe1mltxrt.
  ENDLOOP.
  IF NOT t_e1bpe1mltxrt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'MATERIALLONGTEXT'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1mltxrt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1WRKKEY'                                           *
  CLEAR t_e1bpe1wrkkey.
  REFRESH t_e1bpe1wrkkey.
  t_e1bpe1wrkkey-segnam = 'E1BPE1WRKKEY'.
  LOOP AT plantkeys.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'PLANTKEYS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1wrkkey.
    MOVE-CORRESPONDING plantkeys
         TO e1bpe1wrkkey.                                   "#EC ENHOK

    t_e1bpe1wrkkey-sdata = e1bpe1wrkkey.
    APPEND t_e1bpe1wrkkey.
  ENDLOOP.
  IF NOT t_e1bpe1wrkkey[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'PLANTKEYS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1wrkkey
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1LGOKEY'                                           *
  CLEAR t_e1bpe1lgokey.
  REFRESH t_e1bpe1lgokey.
  t_e1bpe1lgokey-segnam = 'E1BPE1LGOKEY'.
  LOOP AT storagelocationkeys.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGELOCATIONKEYS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1lgokey.
    MOVE-CORRESPONDING storagelocationkeys
         TO e1bpe1lgokey.                                   "#EC ENHOK

    t_e1bpe1lgokey-sdata = e1bpe1lgokey.
    APPEND t_e1bpe1lgokey.
  ENDLOOP.
  IF NOT t_e1bpe1lgokey[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGELOCATIONKEYS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1lgokey
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1VTLKEY'                                           *
  CLEAR t_e1bpe1vtlkey.
  REFRESH t_e1bpe1vtlkey.
  t_e1bpe1vtlkey-segnam = 'E1BPE1VTLKEY'.
  LOOP AT distrchainkeys.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'DISTRCHAINKEYS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1vtlkey.
    MOVE-CORRESPONDING distrchainkeys
         TO e1bpe1vtlkey.                                   "#EC ENHOK

    t_e1bpe1vtlkey-sdata = e1bpe1vtlkey.
    APPEND t_e1bpe1vtlkey.
  ENDLOOP.
  IF NOT t_e1bpe1vtlkey[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'DISTRCHAINKEYS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1vtlkey
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1LGNKEY'                                           *
  CLEAR t_e1bpe1lgnkey.
  REFRESH t_e1bpe1lgnkey.
  t_e1bpe1lgnkey-segnam = 'E1BPE1LGNKEY'.
  LOOP AT warehousenokeys.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'WAREHOUSENOKEYS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1lgnkey.
    MOVE-CORRESPONDING warehousenokeys
         TO e1bpe1lgnkey.                                   "#EC ENHOK

    t_e1bpe1lgnkey-sdata = e1bpe1lgnkey.
    APPEND t_e1bpe1lgnkey.
  ENDLOOP.
  IF NOT t_e1bpe1lgnkey[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'WAREHOUSENOKEYS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1lgnkey
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1LGTKEY'                                           *
  CLEAR t_e1bpe1lgtkey.
  REFRESH t_e1bpe1lgtkey.
  t_e1bpe1lgtkey-segnam = 'E1BPE1LGTKEY'.
  LOOP AT storagetypekeys.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'STORAGETYPEKEYS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1lgtkey.
    MOVE-CORRESPONDING storagetypekeys
         TO e1bpe1lgtkey.                                   "#EC ENHOK

    t_e1bpe1lgtkey-sdata = e1bpe1lgtkey.
    APPEND t_e1bpe1lgtkey.
  ENDLOOP.
  IF NOT t_e1bpe1lgtkey[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'STORAGETYPEKEYS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1lgtkey
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPE1BWAKEY'                                           *
  CLEAR t_e1bpe1bwakey.
  REFRESH t_e1bpe1bwakey.
  t_e1bpe1bwakey-segnam = 'E1BPE1BWAKEY'.
  LOOP AT valuationtypekeys.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'VALUATIONTYPEKEYS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpe1bwakey.
    MOVE-CORRESPONDING valuationtypekeys
         TO e1bpe1bwakey.                                   "#EC ENHOK

    t_e1bpe1bwakey-sdata = e1bpe1bwakey.
    APPEND t_e1bpe1bwakey.
  ENDLOOP.
  IF NOT t_e1bpe1bwakey[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'VALUATIONTYPEKEYS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpe1bwakey
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPTEXTLCOMP'                                          *
  CLEAR t_e1bptextlcomp.
  REFRESH t_e1bptextlcomp.
  t_e1bptextlcomp-segnam = 'E1BPTEXTLCOMP'.
  LOOP AT textilecomponents.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'TEXTILECOMPONENTS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bptextlcomp.
    MOVE-CORRESPONDING textilecomponents
         TO e1bptextlcomp.                                  "#EC ENHOK

    t_e1bptextlcomp-sdata = e1bptextlcomp.
    APPEND t_e1bptextlcomp.
  ENDLOOP.
  IF NOT t_e1bptextlcomp[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'TEXTILECOMPONENTS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bptextlcomp
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPTEXTLFIBR'                                          *
  CLEAR t_e1bptextlfibr.
  REFRESH t_e1bptextlfibr.
  t_e1bptextlfibr-segnam = 'E1BPTEXTLFIBR'.
  LOOP AT fibercodes.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'FIBERCODES'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bptextlfibr.
    MOVE-CORRESPONDING fibercodes
         TO e1bptextlfibr.                                  "#EC ENHOK

    t_e1bptextlfibr-sdata = e1bptextlfibr.
    APPEND t_e1bptextlfibr.
  ENDLOOP.
  IF NOT t_e1bptextlfibr[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'FIBERCODES'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bptextlfibr
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPSGTMVKE'                                            *
  CLEAR t_e1bpsgtmvke.
  REFRESH t_e1bpsgtmvke.
  t_e1bpsgtmvke-segnam = 'E1BPSGTMVKE'.
  LOOP AT segsalesstatus.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SEGSALESSTATUS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpsgtmvke.
    MOVE-CORRESPONDING segsalesstatus
         TO e1bpsgtmvke.                                    "#EC ENHOK

    t_e1bpsgtmvke-sdata = e1bpsgtmvke.
    APPEND t_e1bpsgtmvke.
  ENDLOOP.
  IF NOT t_e1bpsgtmvke[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SEGSALESSTATUS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpsgtmvke
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPSGTMARM'                                            *
  CLEAR t_e1bpsgtmarm.
  REFRESH t_e1bpsgtmarm.
  t_e1bpsgtmarm-segnam = 'E1BPSGTMARM'.
  LOOP AT segweightvolume.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SEGWEIGHTVOLUME'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpsgtmarm.
    MOVE-CORRESPONDING segweightvolume
         TO e1bpsgtmarm.                                    "#EC ENHOK

    CONDENSE e1bpsgtmarm-volume.
    CONDENSE e1bpsgtmarm-gross_wt.
    CONDENSE e1bpsgtmarm-net_weight.
    t_e1bpsgtmarm-sdata = e1bpsgtmarm.
    APPEND t_e1bpsgtmarm.
  ENDLOOP.
  IF NOT t_e1bpsgtmarm[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SEGWEIGHTVOLUME'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpsgtmarm
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPSGTMADKA'                                           *
  CLEAR t_e1bpsgtmadka.
  REFRESH t_e1bpsgtmadka.
  t_e1bpsgtmadka-segnam = 'E1BPSGTMADKA'.
  LOOP AT segvaluationtype.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SEGVALUATIONTYPE'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpsgtmadka.
    MOVE-CORRESPONDING segvaluationtype
         TO e1bpsgtmadka.                                   "#EC ENHOK

    t_e1bpsgtmadka-sdata = e1bpsgtmadka.
    APPEND t_e1bpsgtmadka.
  ENDLOOP.
  IF NOT t_e1bpsgtmadka[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SEGVALUATIONTYPE'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpsgtmadka
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPFSHSEASONS'                                         *
  CLEAR t_e1bpfshseasons.
  REFRESH t_e1bpfshseasons.
  t_e1bpfshseasons-segnam = 'E1BPFSHSEASONS'.
  LOOP AT seasons.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SEASONS'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpfshseasons.
    MOVE-CORRESPONDING seasons
         TO e1bpfshseasons.                                 "#EC ENHOK

    t_e1bpfshseasons-sdata = e1bpfshseasons.
    APPEND t_e1bpfshseasons.
  ENDLOOP.
  IF NOT t_e1bpfshseasons[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SEASONS'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpfshseasons
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPSGTMLGN'                                            *
  CLEAR t_e1bpsgtmlgn.
  REFRESH t_e1bpsgtmlgn.
  t_e1bpsgtmlgn-segnam = 'E1BPSGTMLGN'.
  LOOP AT segwarehousenumberdata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SEGWAREHOUSENUMBERDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpsgtmlgn.
    MOVE-CORRESPONDING segwarehousenumberdata
         TO e1bpsgtmlgn.                                    "#EC ENHOK

    CONDENSE e1bpsgtmlgn-capy_usage.
    t_e1bpsgtmlgn-sdata = e1bpsgtmlgn.
    APPEND t_e1bpsgtmlgn.
  ENDLOOP.
  IF NOT t_e1bpsgtmlgn[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SEGWAREHOUSENUMBERDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpsgtmlgn
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPSGTMLGT'                                            *
  CLEAR t_e1bpsgtmlgt.
  REFRESH t_e1bpsgtmlgt.
  t_e1bpsgtmlgt-segnam = 'E1BPSGTMLGT'.
  LOOP AT segstoragetypedata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SEGSTORAGETYPEDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpsgtmlgt.
    MOVE-CORRESPONDING segstoragetypedata
         TO e1bpsgtmlgt.                                    "#EC ENHOK

    CONDENSE e1bpsgtmlgt-max_sb_qty.
    CONDENSE e1bpsgtmlgt-min_sb_qty.
    CONDENSE e1bpsgtmlgt-ctrl_qty.
    CONDENSE e1bpsgtmlgt-replen_qty.
    CONDENSE e1bpsgtmlgt-round_unit.
    t_e1bpsgtmlgt-sdata = e1bpsgtmlgt.
    APPEND t_e1bpsgtmlgt.
  ENDLOOP.
  IF NOT t_e1bpsgtmlgt[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SEGSTORAGETYPEDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpsgtmlgt
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPSGTMRPGN'                                           *
  CLEAR t_e1bpsgtmrpgn.
  REFRESH t_e1bpsgtmrpgn.
  t_e1bpsgtmrpgn-segnam = 'E1BPSGTMRPGN'.
  LOOP AT segmrpgeneraldata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SEGMRPGENERALDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpsgtmrpgn.
    MOVE-CORRESPONDING segmrpgeneraldata
         TO e1bpsgtmrpgn.                                   "#EC ENHOK

    CONDENSE e1bpsgtmrpgn-inhseprodt.
    CONDENSE e1bpsgtmrpgn-plnd_delry.
    CONDENSE e1bpsgtmrpgn-replentime.
    t_e1bpsgtmrpgn-sdata = e1bpsgtmrpgn.
    APPEND t_e1bpsgtmrpgn.
  ENDLOOP.
  IF NOT t_e1bpsgtmrpgn[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SEGMRPGENERALDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpsgtmrpgn
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* for segment 'E1BPSGTMRP'                                             *
  CLEAR t_e1bpsgtmrp.
  REFRESH t_e1bpsgtmrp.
  t_e1bpsgtmrp-segnam = 'E1BPSGTMRP'.
  LOOP AT segmrpquantitydata.
    READ TABLE filtered_table_entries
          WITH KEY receiver = bdbg_receiver
                    tabname = 'SEGMRPQUANTITYDATA'
                      index = sy-tabix BINARY SEARCH.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.
    CLEAR e1bpsgtmrp.
    MOVE-CORRESPONDING segmrpquantitydata
         TO e1bpsgtmrp.                                     "#EC ENHOK

    CONDENSE e1bpsgtmrp-safety_stk.
    CONDENSE e1bpsgtmrp-minlotsize.
    CONDENSE e1bpsgtmrp-round_val.
    t_e1bpsgtmrp-sdata = e1bpsgtmrp.
    APPEND t_e1bpsgtmrp.
  ENDLOOP.
  IF NOT t_e1bpsgtmrp[] IS INITIAL.
    CLEAR bp_parameter. REFRESH bp_parameter.
    MOVE bdbg_object
      TO bp_parameter-objtype.
    MOVE bdbg_method
      TO bp_parameter-verb.
    MOVE 'SEGMRPQUANTITYDATA'
      TO bp_parameter-parameter.
    APPEND bp_parameter.
    CALL FUNCTION 'ALE_ASYN_BAPI_SEGMENT_FILTER'
      EXPORTING
        receiver         = bdbg_receiver
      TABLES
        bapi_parameter   = bp_parameter
        segment_data     = t_e1bpsgtmrp
      EXCEPTIONS
        unexpected_error = 01.
    IF sy-subrc <> 0.
      syst_info = syst.
      EXIT.
    ENDIF.
  ENDIF.

* construct IDoc data records with structures                          *
  LOOP AT t_e1bpe1mathead.
    idx = sy-tabix.
    APPEND t_e1bpe1mathead TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1varkey.
    idx = sy-tabix.
    APPEND t_e1bpe1varkey TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1ausprt.
    idx = sy-tabix.
    APPEND t_e1bpe1ausprt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1ausprtx.
    idx = sy-tabix.
    APPEND t_e1bpe1ausprtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1marart.
    idx = sy-tabix.
    READ TABLE t_e1bpe1marart INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1marart TO idoc_data.
      READ TABLE t_e1bpe1marart1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1marart1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1marartx.
    idx = sy-tabix.
    APPEND t_e1bpe1marartx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1maraextrt.
    idx = sy-tabix.
    READ TABLE t_e1bpe1maraextrt INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1maraextrt TO idoc_data.
      READ TABLE t_e1bpe1maraextrt1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1maraextrt1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1maraextrtx.
    idx = sy-tabix.
    READ TABLE t_e1bpe1maraextrtx INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1maraextrtx TO idoc_data.
      READ TABLE t_e1bpe1maraextrtx1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1maraextrtx1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1maw1rt.
    idx = sy-tabix.
    APPEND t_e1bpe1maw1rt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1maw1rtx.
    idx = sy-tabix.
    APPEND t_e1bpe1maw1rtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1maktrt.
    idx = sy-tabix.
    APPEND t_e1bpe1maktrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1marcrt.
    idx = sy-tabix.
    READ TABLE t_e1bpe1marcrt INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1marcrt TO idoc_data.
      READ TABLE t_e1bpe1marcrt1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1marcrt1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1marcrtx.
    idx = sy-tabix.
    APPEND t_e1bpe1marcrtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1marcextrt.
    idx = sy-tabix.
    READ TABLE t_e1bpe1marcextrt INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1marcextrt TO idoc_data.
      READ TABLE t_e1bpe1marcextrt1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1marcextrt1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1marcextrtx.
    idx = sy-tabix.
    READ TABLE t_e1bpe1marcextrtx INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1marcextrtx TO idoc_data.
      READ TABLE t_e1bpe1marcextrtx1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1marcextrtx1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mpoprt.
    idx = sy-tabix.
    APPEND t_e1bpe1mpoprt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mpoprtx.
    idx = sy-tabix.
    APPEND t_e1bpe1mpoprtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mprwrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mprwrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mvegrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mvegrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mveurt.
    idx = sy-tabix.
    APPEND t_e1bpe1mveurt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mpgdrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mpgdrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mpgdrtx.
    idx = sy-tabix.
    APPEND t_e1bpe1mpgdrtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mardrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mardrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mardrtx.
    idx = sy-tabix.
    APPEND t_e1bpe1mardrtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mardextrt.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mardextrt INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mardextrt TO idoc_data.
      READ TABLE t_e1bpe1mardextrt1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mardextrt1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mardextrtx.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mardextrtx INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mardextrtx TO idoc_data.
      READ TABLE t_e1bpe1mardextrtx1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mardextrtx1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1marmrt.
    idx = sy-tabix.
    APPEND t_e1bpe1marmrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1marmrtx.
    idx = sy-tabix.
    APPEND t_e1bpe1marmrtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mamtrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mamtrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1meanrt.
    idx = sy-tabix.
    APPEND t_e1bpe1meanrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mleart.
    idx = sy-tabix.
    APPEND t_e1bpe1mleart TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1malgrt.
    idx = sy-tabix.
    APPEND t_e1bpe1malgrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1malgrtx.
    idx = sy-tabix.
    APPEND t_e1bpe1malgrtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mlanrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mlanrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mbewrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mbewrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mbewrtx.
    idx = sy-tabix.
    APPEND t_e1bpe1mbewrtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mbewextrt.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mbewextrt INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mbewextrt TO idoc_data.
      READ TABLE t_e1bpe1mbewextrt1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mbewextrt1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mbewextrtx.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mbewextrtx INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mbewextrtx TO idoc_data.
      READ TABLE t_e1bpe1mbewextrtx1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mbewextrtx1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mlgnrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mlgnrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mlgnrtx.
    idx = sy-tabix.
    APPEND t_e1bpe1mlgnrtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mlgnextrt.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mlgnextrt INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mlgnextrt TO idoc_data.
      READ TABLE t_e1bpe1mlgnextrt1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mlgnextrt1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mlgnextrtx.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mlgnextrtx INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mlgnextrtx TO idoc_data.
      READ TABLE t_e1bpe1mlgnextrtx1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mlgnextrtx1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mlgtrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mlgtrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mlgtrtx.
    idx = sy-tabix.
    APPEND t_e1bpe1mlgtrtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mlgtextrt.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mlgtextrt INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mlgtextrt TO idoc_data.
      READ TABLE t_e1bpe1mlgtextrt1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mlgtextrt1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mlgtextrtx.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mlgtextrtx INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mlgtextrtx TO idoc_data.
      READ TABLE t_e1bpe1mlgtextrtx1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mlgtextrtx1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mvkert.
    idx = sy-tabix.
    APPEND t_e1bpe1mvkert TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mvkertx.
    idx = sy-tabix.
    APPEND t_e1bpe1mvkertx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1mvkeextrt.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mvkeextrt INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mvkeextrt TO idoc_data.
      READ TABLE t_e1bpe1mvkeextrt1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mvkeextrt1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mvkeextrtx.
    idx = sy-tabix.
    READ TABLE t_e1bpe1mvkeextrtx INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1mvkeextrtx TO idoc_data.
      READ TABLE t_e1bpe1mvkeextrtx1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1mvkeextrtx1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1wlk2rt.
    idx = sy-tabix.
    APPEND t_e1bpe1wlk2rt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1wlk2rtx.
    idx = sy-tabix.
    APPEND t_e1bpe1wlk2rtx TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1wlk2extrt.
    idx = sy-tabix.
    READ TABLE t_e1bpe1wlk2extrt INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1wlk2extrt TO idoc_data.
      READ TABLE t_e1bpe1wlk2extrt1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1wlk2extrt1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1wlk2extrtx.
    idx = sy-tabix.
    READ TABLE t_e1bpe1wlk2extrtx INDEX idx.
    IF sy-subrc = 0.
      APPEND t_e1bpe1wlk2extrtx TO idoc_data.
      READ TABLE t_e1bpe1wlk2extrtx1 INDEX idx.
      IF sy-subrc = 0.
        APPEND t_e1bpe1wlk2extrtx1 TO idoc_data.
      ENDIF.
    ENDIF.
  ENDLOOP.
  LOOP AT t_e1bpe1mltxrt.
    idx = sy-tabix.
    APPEND t_e1bpe1mltxrt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1wrkkey.
    idx = sy-tabix.
    APPEND t_e1bpe1wrkkey TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1lgokey.
    idx = sy-tabix.
    APPEND t_e1bpe1lgokey TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1vtlkey.
    idx = sy-tabix.
    APPEND t_e1bpe1vtlkey TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1lgnkey.
    idx = sy-tabix.
    APPEND t_e1bpe1lgnkey TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1lgtkey.
    idx = sy-tabix.
    APPEND t_e1bpe1lgtkey TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpe1bwakey.
    idx = sy-tabix.
    APPEND t_e1bpe1bwakey TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bptextlcomp.
    idx = sy-tabix.
    APPEND t_e1bptextlcomp TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bptextlfibr.
    idx = sy-tabix.
    APPEND t_e1bptextlfibr TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpsgtmvke.
    idx = sy-tabix.
    APPEND t_e1bpsgtmvke TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpsgtmarm.
    idx = sy-tabix.
    APPEND t_e1bpsgtmarm TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpsgtmadka.
    idx = sy-tabix.
    APPEND t_e1bpsgtmadka TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpfshseasons.
    idx = sy-tabix.
    APPEND t_e1bpfshseasons TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpsgtmlgn.
    idx = sy-tabix.
    APPEND t_e1bpsgtmlgn TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpsgtmlgt.
    idx = sy-tabix.
    APPEND t_e1bpsgtmlgt TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpsgtmrpgn.
    idx = sy-tabix.
    APPEND t_e1bpsgtmrpgn TO idoc_data.
  ENDLOOP.
  LOOP AT t_e1bpsgtmrp.
    idx = sy-tabix.
    APPEND t_e1bpsgtmrp TO idoc_data.
  ENDLOOP.

ENDFORM.                               " IDOC_MATERIAL_MAINTAINDATA_RT
*}   INSERT
