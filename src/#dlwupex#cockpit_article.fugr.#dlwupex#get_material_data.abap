FUNCTION /DLWUPEX/GET_MATERIAL_DATA .
*"----------------------------------------------------------------------
*"*"Interface globale :
*"  IMPORTING
*"     VALUE(MESSAGE_TYPE) LIKE  TBDME-MESTYP
*"     VALUE(DXWB_CALL) LIKE  SY-DATAR DEFAULT ' '
*"     VALUE(SUPPRESS_PROGRESS_INDICATOR) LIKE  SY-DATAR DEFAULT SPACE
*"     VALUE(SUPPRESS_BUFFER_REFRESH) LIKE  SY-DATAR DEFAULT SPACE
*"     VALUE(OUTPUT_TOTAL_INIT) LIKE  MMMDALE-OUTPUT_TOTAL DEFAULT 0
*"     VALUE(OUTPUT_COUNTER_INIT) LIKE  MMMDALE-OUTPUT_OFFSET DEFAULT 0
*"  EXPORTING
*"     VALUE(CREATED_COMM_IDOCS) LIKE  SY-TABIX
*"     VALUE(CREATED_MASTER_IDOCS) LIKE  SY-TABIX
*"  TABLES
*"      MARAKEY STRUCTURE  BDIMARAKEY
*"      COMMUNICATION_DOCUMENTS STRUCTURE  SWOTOBJID OPTIONAL
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
*"----------------------------------------------------------------------
*{   INSERT         DS1K901359                                        1
* Offene Fragen:
* - Segmentreduzierung auf BAPI-Ebene zu 4.0A noch nicht vom ALE
*   unterstützt
*   -> evtl. ist der Parameter MESSAGE_TYPE unnötig, weil dieser nur
*      noch für die alte Methode der Segmentreduzierung benutzt wird?!?
* - MFHM- und MKAL-Daten im Retail noch nicht unterstützt
* - Wieso wird beim Füllen der TMLGTKEY der FB
*   'MLGT_ARRAY_READ_MATNR_ALL' nochmal aufgerufen. Dieser Aufruf
*   erfolgt bereits beim MATERIAL_PRE_READ

*JH/29.04.99/4.6A
* Neuer Parameter DXWB_CALL, der beim Aufruf aus der Datenübernahme-
* Workbench gesetzt wird

* Keydaten in eigene Tabelle übernehmen, weil die verarbeiteten
* Einträge herausgelöscht werden
  hmarakey[] = marakey[].

  CLEAR tcommunication_documents[]. "note 2631911

  CLEAR created_c_idocs.
  CLEAR created_m_idocs.
  done_since_commit = 0.

  output_counter = 0.
  output_total = 0.
  ADD output_counter_init TO output_counter.

*????Falls später beim Prefetch HMARAKEY-Sätze herausgelöscht werden
*????stimmt OUTPUT_TOTAL nicht mehr!?!?
  IF output_total_init IS INITIAL.
    DESCRIBE TABLE hmarakey LINES output_total.
  ELSE.
    MOVE output_total_init TO output_total.
  ENDIF.

  SORT hmarakey BY matnr.
*
** Use the BADI Flag
*  DATA: suppress_prefetch LIKE sy-batch.
** Objektinstanz erzeugen
*  IF artmas_data IS INITIAL.
*    CALL METHOD cl_exithandler=>get_instance
*      EXPORTING
*        exit_name        = 'ARTMAS_DATA_REDUCE'
*      IMPORTING
*        act_imp_existing = artmas_data_akt
*      CHANGING
*        instance         = artmas_data
*      EXCEPTIONS
*        OTHERS           = 9.
*    IF sy-subrc <> 0.
*      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*    ENDIF.
*  ENDIF.
*  IF NOT artmas_data_akt IS INITIAL.
*    CALL METHOD artmas_data->suppress_prefetch
*      IMPORTING
*        suppress = suppress_prefetch.
*  ENDIF.
*  IF suppress_prefetch IS INITIAL.
*    PERFORM material_pre_read_rt TABLES hmarakey
*                                USING  suppress_buffer_refresh
*                                       .
*  ENDIF.

* Schleife über alle selektierten Artikel (Industriematerialien wurden
* im MATERIAL_PRE_READ_RT herausgelöscht!)
  LOOP AT hmarakey WHERE mandt = sy-mandt.
    CALL FUNCTION 'MARA_SINGLE_READ'
      EXPORTING
*       KZRFB             = ' '
*       MAXTZ             = 0
        matnr             = hmarakey-matnr
*       SPERRMODUS        = ' '
*       STD_SPERRMODUS    = ' '
      IMPORTING
        wmara             = mara
      EXCEPTIONS
        lock_on_material  = 1
        lock_system_error = 2
        wrong_call        = 3
        not_found         = 4
        error_message     = 5  "zur Sicherheit->alle E- und A-Mess
        OTHERS            = 6. "ohne RAISING abfangen

*   Varianten werden ausgenommen, da diese über den zugeordneten
*   Sammelartikel abgehandelt werden
    CHECK mara-attyp NE attyp_var.

* User the Badi Flag
    PERFORM key_tabellen_fuellen_req USING hmarakey-matnr space 'X'.

*   Verarbeiteten Artikel aus der KEY-Tabelle entfernen
    DELETE hmarakey.

    IF mara-attyp = attyp_samm.
*     Wenn ein Sammelartikel verarbeitet wird, werden auch alle
*     Varianten dazu verarbeitet
*     Varianten zu SA lesen (aus Puffer)
      CALL FUNCTION 'LESEN_VARIANTEN_ZU_SA'
        EXPORTING
          sammelartikel        = hmarakey-matnr
        TABLES
          varianten            = var_mara
*         VARIANTEN_MAW1       =
*         VARIANTEN_MARC       =
*         VARIANTEN_MBEW       =
        EXCEPTIONS
          enqueue_mode_changed = 1
          lock_on_material     = 2
          lock_system_error    = 3
          wrong_call           = 4
          not_found            = 5
          no_maw1_for_mara     = 6
          lock_on_marc         = 7
          lock_on_mbew         = 8
          error_message        = 9
          OTHERS               = 10.

      LOOP AT var_mara.
*       Aufbau TVAR_TAB pro Variante
        tvar_tab-matnr = var_mara-matnr.
        APPEND tvar_tab TO tvar_tab.
        PERFORM key_tabellen_fuellen_req USING tvar_tab-matnr 'X' 'X'.

*       Verarbeitete Variante aus der KEY-Tabelle entfernen, falls
*       vorhanden
        READ TABLE hmarakey WITH KEY matnr = var_mara-matnr
                            BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE hmarakey INDEX sy-tabix.
        ENDIF.
      ENDLOOP.
    ENDIF.           "MARA-ATTYP = ATTYP_SAMM.

    PERFORM key_tabellen_uebergeben_req.
  ENDLOOP.

* Schleife über alle verbleibenden Artikel.
* Bei den verbleibenden Artikeln handelt es sich um Varianten, deren
* Sammelartikel nicht in der Selektionsliste enthalten waren
* -> Varianten wie normale Einzelartikel behandeln
  LOOP AT hmarakey WHERE mandt = sy-mandt.
    PERFORM key_tabellen_fuellen_req USING hmarakey-matnr space 'X'.
    PERFORM key_tabellen_uebergeben_req.
  ENDLOOP.
*
  clientdata[] = tclientdata[].
  plantdata[] = tplantdata[].
  variantskeys[] = tvariantskeys[].
  characteristicvalue[] = tcharacteristicvalue[].
  characteristicvaluex[] = tcharacteristicvaluex[].
  clientdata[] = tclientdata[].
  clientdatax[] = tclientdatax[].
  clientext[] = tclientext[].
  clientextx[] = tclientextx[].
  addnlclientdata[] = taddnlclientdata[].
  addnlclientdatax[] = taddnlclientdatax[].
  materialdescription[] = tmaterialdescription[].
  plantdata[] = tplantdata[].
  plantdatax[] = tplantdatax[].
  plantext[] = tplantext[].
  plantextx[] = tplantextx[].
  forecastparameters[] = tforecastparameters[].
  forecastparametersx[] = tforecastparametersx[].
  forecastvalues[] = tforecastvalues[].
  totalconsumption[] = ttotalconsumption[].
  unplndconsumption[] = tunplndconsumption[].
  planningdata[] = tplanningdata[].
  planningdatax[] = tplanningdatax[].
  storagelocationdata[] = tstoragelocationdata[].
  storagelocationdatax[] = tstoragelocationdatax[].
  storagelocationext[] = tstoragelocationext[].
  storagelocationextx[] = tstoragelocationextx[].
  unitsofmeasure[] = tunitsofmeasure[].
  unitsofmeasurex[] = tunitsofmeasurex[].
  unitofmeasuretexts[] = tunitofmeasuretexts[].
  internationalartnos[] = tinternationalartnos[].
  vendorean[] = tvendorean[].
  layoutmoduleassgmt[] = tlayoutmoduleassgmt[].
  layoutmoduleassgmtx[] = tlayoutmoduleassgmtx[].
  taxclassifications[] = ttaxclassifications[].
  valuationdata[] = tvaluationdata[].
  valuationdatax[] = tvaluationdatax[].
  valuationext[] = tvaluationext[].
  valuationextx[] = tvaluationextx[].
  warehousenumberdata[] = twarehousenumberdata[].
  warehousenumberdatax[] = twarehousenumberdatax[].
  warehousenumberext[] = twarehousenumberext[].
  warehousenumberextx[] = twarehousenumberextx[].
  storagetypedata[] = tstoragetypedata[].
  storagetypedatax[] = tstoragetypedatax[].
  storagetypeext[] = tstoragetypeext[].
  storagetypeextx[] = tstoragetypeextx[].
  salesdata[] = tsalesdata[].
  salesdatax[] = tsalesdatax[].
  salesext[] = tsalesext[].
  salesextx[] = tsalesextx[].
  posdata[] = tposdata[].
  posdatax[] = tposdatax[].
  posext[] = tposext[].
  posextx[] = tposextx[].
  materiallongtext[] = tmateriallongtext[].
  plantkeys[] = tplantkeys[].
  storagelocationkeys[] = tstoragelocationkeys[].
  distrchainkeys[] = tdistrchainkeys[].
  warehousenokeys[] = twarehousenokeys[].
  storagetypekeys[] = tstoragetypekeys[].
  valuationtypekeys[] = tvaluationtypekeys[].
  textilecomponents[] = gt_textile_comp[].
  fibercodes[] = gt_textile_fibr[].
  segsalesstatus[] = gt_sgt_mvke[].
  segweightvolume[] = gt_sgt_marm[].
  segvaluationtype[] = gt_sgt_madka[].
  seasons[] = gt_seasons[].
  segwarehousenumberdata[] = gt_sgt_mlgn[].
  segstoragetypedata[] = gt_sgt_mlgt[].
  segmrpgeneraldata[] = gt_sgt_mrpgn[].
  segmrpquantitydata[] = gt_sgt_mrp[].


*  IF done_since_commit > 0.
**   note 1319389
*    CALL FUNCTION 'DB_COMMIT'.
*    CALL FUNCTION 'DEQUEUE_ALL'.
*    COMMIT WORK.
*  ENDIF.
*
*  created_comm_idocs = created_c_idocs.
*  created_master_idocs = created_m_idocs.
*  communication_documents[] = tcommunication_documents[]. "note 2437280

*}   INSERT
ENDFUNCTION.
