FUNCTION /DLWUPEX/FILL_MATERIAL_DATA .
*"----------------------------------------------------------------------
*"*"Interface globale :
*"  IMPORTING
*"     VALUE(HEAD_MATNR) LIKE  PRE03-MATNR
*"     VALUE(MESSAGE_TYPE) LIKE  TBDME-MESTYP
*"     VALUE(DXWB_CALL) LIKE  SY-DATAR DEFAULT ' '
*"  EXPORTING
*"     VALUE(CREATED_COMM_IDOCS) LIKE  SY-TABIX
*"  TABLES
*"      VAR_TAB STRUCTURE  PRE03
*"      MARAKEY STRUCTURE  BDIMARAKEY
*"      AUSPKEY STRUCTURE  BDIAUSPKEY
*"      MAW1KEY STRUCTURE  BDIMAW1KEY
*"      MAKTKEY STRUCTURE  BDIMAKTKEY
*"      MARCKEY STRUCTURE  BDIMARCKEY
*"      MARDKEY STRUCTURE  BDIMARDKEY
*"      MARMKEY STRUCTURE  BDIMARMKEY
*"      MAMTKEY STRUCTURE  BDIMAMTKEY
*"      MEANKEY STRUCTURE  BDIMEANKEY
*"      MLEAKEY STRUCTURE  BDIMLEAKEY
*"      MALGKEY STRUCTURE  BDIMALGKEY
*"      MVKEKEY STRUCTURE  BDIMVKEKEY
*"      WLK2KEY STRUCTURE  BDIWLK2KEY
*"      MLANKEY STRUCTURE  BDIMLANKEY
*"      MBEWKEY STRUCTURE  BDIMBEWKEY
*"      MLGNKEY STRUCTURE  BDIMLGNKEY
*"      MLGTKEY STRUCTURE  BDIMLGTKEY
*"      STXHKEY STRUCTURE  BDISTXHKEY
*"      MFHMKEY STRUCTURE  BDIMFHMKEY OPTIONAL
*"      MPGDKEY STRUCTURE  BDIMPGDKEY OPTIONAL
*"      MPOPKEY STRUCTURE  BDIMPOPKEY OPTIONAL
*"      MPRWKEY STRUCTURE  BDIMPRWKEY OPTIONAL
*"      MVEGKEY STRUCTURE  BDIMVEGKEY OPTIONAL
*"      MVEUKEY STRUCTURE  BDIMVEUKEY OPTIONAL
*"      MKALKEY STRUCTURE  BDIMKALKEY OPTIONAL
*"      COMMUNICATION_DOCUMENTS STRUCTURE  SWOTOBJID OPTIONAL
*"----------------------------------------------------------------------
* Offen:
* - keine Segmentreduzierung auf Grundlage des BAPI's zu 4.0A
*   -> evtl. ist der Parameter MESSAGE_TYPE unnötig, weil dieser nur
*      noch für die alte Methode der Segmentreduzierung benutzt wird?!?
* - MFHM-Daten im Retail noch nicht unterstützt
* - MKAL-Daten im Retail noch nicht unterstützt
* - Hier werden 'MPOP_REFRESH' und 'MVER_REFRESH' aufgerufen. Wieso
*   dann auch schon im MASTERIDOC_CREATE_REQ_ARTMAS?

*JH/29.04.99/4.6A
* Neuer Parameter DXWB_CALL, der beim Aufruf aus der Datenübernahme-
* Workbench gesetzt wird

  REFRESH: treceivers, tbapi_logsys, tfiltobj_val, tfiltobj_typ.

*  IF flag_testmode IS INITIAL.
**   Test, ob ein Empfänger für das IDoc gefunden werden kann, ansonsten
**   brauchen keine IDoc-Daten zusammengestellt werden
*    IF NOT rcvprn IS INITIAL.
*      treceivers-logsys = rcvprn.
*      APPEND treceivers.
*    ENDIF.
*
**JH/29.04.99/4.6A (Anfang)
**   Keine Empfängerermittlung, wenn der Aufruf aus der DX-Workbench
**   heraus erfolgt ist
*    IF dxwb_call IS INITIAL.
**JH/29.04.99/4.6A (Ende)
*
**   Filterobjekte für die Empfängerermittlung lesen
*      CALL FUNCTION 'ALE_BAPI_GET_FILTEROBJECTS'
*        EXPORTING
*          object                   = bor_object
*          method                   = maintaindata_rt_method
*        TABLES
*          receiver_input           = treceivers
*          filterobjects            = tfiltobj_typ
*        EXCEPTIONS
*          error_in_ale_customizing = 1
*          OTHERS                   = 2.
*
**   In der Ankreuzleiste markieren, welche Filterobjekte relevant sind
**   (-> für nicht relevante Filterobjekte werden aus Performancegründen
**   keine Filterwerte zusammengestellt!)
*      CLEAR filtobj_relev.
*      LOOP AT tfiltobj_typ.
*        CASE tfiltobj_typ-objtype.
*          WHEN fobj_material.
**         Note 595027
**         Unterstützung von Abhängigkeiten des ARTMAS-Nachrichtentyps
**         von anderen Nachrichtentypen und Filterung bzgl. MATNR
*            filtobj_relev-material = 'X'.
*          WHEN fobj_matl_type.
*            filtobj_relev-matl_type = 'X'.
*          WHEN fobj_matl_group.
*            filtobj_relev-matl_group = 'X'.
*          WHEN fobj_matl_cat.
*            filtobj_relev-matl_cat = 'X'.
*          WHEN fobj_plant.
*            filtobj_relev-plant = 'X'.
*          WHEN fobj_val_area.
*            filtobj_relev-val_area = 'X'.
*          WHEN fobj_langu.
*            filtobj_relev-langu = 'X'.
*        ENDCASE.
*      ENDLOOP.
*
*      IF sy-subrc NE 0.   "Schleife nicht durchlaufen
**     Wenn Filterobjekte ermittelt werden konnten (SY-SUBRC = 0 nach
**     dem LOOP) bedeutet dies, daß auch Empfänger im Verteilungsmodell
**     hinterlegt sind und somit das IDoc erstellt werden kann.
**     Wenn keine Filterobjekte ermittelt werden konnten (SY-SUBRC <> 0
**     nach dem LOOP) muß nochmal über die Empfängerermittlung geprüft
**     werden, ob sich der Aufbau des IDocs lohnt.
**     (->Empfängerermittlung mit leerer TFILTOBJ_VAL)
**     Anmerkung: Das Zusammenstellen der Filterwerte, die für die
**                Objektfilter relevant sind, erfolgt beim Aufbauen der
**                Anwendungsdaten (FORM DATEN_ZU_KEYS_LESEN)
*        CALL FUNCTION 'ALE_ASYNC_BAPI_GET_RECEIVER'
*          EXPORTING
*            object                   = bor_object
*            method                   = maintaindata_rt_method
*          TABLES
*            receiver_input           = treceivers
*            receivers                = tbapi_logsys
*            filterobject_values      = tfiltobj_val
*          EXCEPTIONS
*            error_in_filterobjects   = 1
*            error_in_ale_customizing = 2
*            OTHERS                   = 3.
*
*        DESCRIBE TABLE tbapi_logsys LINES sy-tfill.
*        IF sy-tfill = 0.
*          EXIT.  "kein IDoc aufbauen, weil keine Empfänger vorhanden
*        ENDIF.
*      ENDIF.
*    ENDIF.     "JH/29.04.99/4.6A
*  ENDIF.

  PERFORM init_ankreuzleiste.

  PERFORM daten_zu_keys_lesen USING head_matnr space.

  CALL FUNCTION 'MARA_SINGLE_READ'
    EXPORTING
      matnr             = head_matnr
    IMPORTING
      wmara             = mara
    EXCEPTIONS
      lock_on_material  = 1
      lock_system_error = 2
      wrong_call        = 3
      not_found         = 4
      OTHERS            = 5.

  IF sy-subrc = 0.
    IF mara-attyp = attyp_samm.
*     Bei Sammelartikeln auch die Daten der Varianten behandeln

*     Merkmalsbewertung der Varianten lesen
      PERFORM var_bewertung_lesen USING mara.

*     Variantendaten zusammenstellen
      LOOP AT var_tab.
        PERFORM daten_zu_keys_lesen USING var_tab-matnr 'X'.
      ENDLOOP.
    ENDIF.
  ENDIF.

  PERFORM idoc_erzeugen.

*}   INSERT
ENDFUNCTION.
