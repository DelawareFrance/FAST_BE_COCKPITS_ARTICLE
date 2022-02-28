function-pool /dlwupex/cockpit_article message-id b1.
TYPE-POOLS: sydes.
* Materialstammtabellen
tables: crvm_b,
        mapr,
        mara,
        makt,
        marc,
        mard,
        marm,
        mean,
        mbew,
        mfhm,
        mpgd,
        mlgn,
        mpop,
        mprw,
        mveg,
        mveu,
        mkal,
        mvke,
        mlan,
        mlgt,     " //br010797 zu 4.0
        qmat,
        mape,
        stxh,
        maw1,     "JH/25.08.97/4.0A
        malg,     "
        wlk2,     "
        inob,     "
        smtext.   "JH/25.08.97/4.0A

* spezielle Deklarationen für dynam. Ermittl. d. Schlüssellängen
tables: dprow,
        dmamt,
        t005t,
        t685t,
        t606r,
        dmlea,    "JH/17.09.97/4.0A
        dmalg.    "JH/17.09.97/4.0A

* Segmenttypen
tables: e1marac,
        e1maktc.
tables: e1maradi.

*$*$-End:   LMV01TOP_21-------------------------------------------------------------------------$*$*
tables: e1maram,   e3maram,
        e1mara1,
        e1maktm,   e3maktm,
        e1marcm,   e3marcm,
        e1marc1,
        e1mardm,   e3mardm,
        e1mfhmm,   e3mfhmm,
        e1mpgdm,   e3mpgdm,
        e1mpopm,   e3mpopm,
        e1mprwm,   e3mprwm,
        e1mvegm,   e3mvegm,
        e1mveum,   e3mveum,
        e1mkalm,   e3mkalm,
        e1marmm,   e3marmm,
        e1meanm,   e3meanm,
        e1mbewm,   e3mbewm,
        e1mlgnm,   e3mlgnm,
        e1mlgtm,   e3mlgtm,            " //br010797
        e1mvkem,   e3mvkem,
        e1mlanm,   e3mlanm,
        e1mtxhm,   e3mtxhm,
        e1mtxlm,   e3mtxlm.

tables: e1aler1,
        e1aleq1,
        tbdme.

* tax
tables: tstl.

type-pools: isoc.                                         "note 977988

*******Begin of data declaration for Segmentation relevant tables
tables: e1sgtmvke,
        e1sgtmarm,
        e1sgtmadka.

data: t_sgtmvke  type table of sgt_mvke,
      t_sgtmarm  type table of sgt_marm,
      t_sgtmadka type table of sgt_madka.
*******End of data declaration for Segmentation relevant tables
* interne Tabellen für Array-Zugriffe
data: t_makt like makt occurs 0 with header line,
      t_marc like marc occurs 0 with header line,
      t_mard like mard occurs 0 with header line,
      t_mpgd like mpgd occurs 0 with header line,
      t_mpop like mpop occurs 0 with header line,
      t_marm like marm occurs 0 with header line,
      t_mean like mean occurs 0 with header line,
      t_mbew like mbew occurs 0 with header line,
      t_mlgn like mlgn occurs 0 with header line,
      t_mlgt like mlgt occurs 0 with header line,
      t_mvke like mvke occurs 0 with header line,
* JH/25.08.97/4.0A (Anfang)
      t_maw1 like maw1 occurs 0 with header line,
      t_mamt like mamt occurs 0 with header line,
      t_mlea like mlea occurs 0 with header line,
      t_malg like malg occurs 0 with header line,
      t_mlan like mlan occurs 0 with header line,
      t_wlk2 like wlk2 occurs 0 with header line.
* JH/25.08.97/4.0A (Anfang)

tables: t001k,
        t001.

include mmkeylen.

"{ Begin ENHO /NFM/CA_SAPLMV01 IS-MP-NF /NFM/GENERAL }
*/NFM/ processing - C5007732
*INCLUDE /nfm/mv01com.
*
"{ End ENHO /NFM/CA_SAPLMV01 IS-MP-NF /NFM/GENERAL }

*ENHANCEMENT-POINT lmv01top_03 SPOTS es_saplmv01 STATIC.
********************************************************
**INSERT EJU: START
*
*TYPES: BEGIN OF s_pack_log,
*         taskname(8) TYPE c,
*         art_count   TYPE i,
*         chp_count   TYPE i,
*       END OF s_pack_log.
*DATA: pack_log TYPE s_pack_log OCCURS 0 WITH HEADER LINE.
*
*TYPES: BEGIN OF s_error_log,
*         taskname(8)  TYPE c,
*         subrc        LIKE sy-subrc,
*         msg_text(80) TYPE c,
*       END OF s_error_log.
*DATA: error_log TYPE s_error_log OCCURS 0 WITH HEADER LINE.
*
*TYPES: BEGIN OF s_timestat,
*         action(30) TYPE c,
*         start      LIKE sy-uzeit,
*         stop       LIKE sy-uzeit,
*         runtime    LIKE sy-uzeit,
*       END OF s_timestat.
*DATA: timestat TYPE s_timestat OCCURS 0 WITH HEADER LINE.
*
*
*TYPES: BEGIN OF s_tasklist,
*         taskname(8) TYPE c,
*         rfcdest     LIKE rfcdes-rfcdest,
*         fchost      LIKE rfcsi-rfchost,
*       END OF s_tasklist.
*DATA: tasklist TYPE s_tasklist OCCURS 0 WITH HEADER LINE.
*
*
*
*DATA: taskname(8) TYPE n VALUE '00000001'.
*DATA: msg_text(80).
*
*DATA: BEGIN OF stat_file OCCURS   0,
*        taskname(8),
*        time        LIKE sy-uzeit,
*        time2       LIKE sy-uzeit,
*        time3       LIKE sy-uzeit,
*        host        LIKE rfcsi-rfcdest,
*        para(3),
*      END OF stat_file.
*DATA: running_arfc_wps TYPE i,
*      rcv_jobs         TYPE i,
*      snd_jobs         TYPE i.
*
*TYPES: BEGIN OF s_mara,
*         matnr     TYPE mara-matnr,
*         satnr     TYPE mara-satnr,
*         attyp     TYPE mara-attyp,
*         art_count LIKE sy-tabix,
*         chp_count LIKE sy-tabix,
*       END OF s_mara.
*DATA: para_mara TYPE s_mara OCCURS 0 WITH HEADER LINE.
*DATA: r_para_mara TYPE s_mara OCCURS 0 WITH HEADER LINE.
*
*TYPES: BEGIN OF s_gen_article,
*         matnr       TYPE mara-matnr,
*         art_counter LIKE sy-tabix,
*         chp_counter LIKE sy-tabix,
*         only_var(1),        "VAR-Änd.zeiger ohne SA-Änd.zeiger
*       END OF s_gen_article.
*DATA: gen_article   TYPE s_gen_article OCCURS 0 WITH HEADER LINE.
*DATA: t_gen_article TYPE s_gen_article OCCURS 0 WITH HEADER LINE.
*
*
*TYPES: BEGIN OF s_gen_var,
*         matnr       TYPE mara-matnr,
*         variant     TYPE mara-matnr,
*         chp_count   LIKE sy-tabix,
*         only_var(1),
*       END OF s_gen_var.
*DATA: gen_var TYPE s_gen_var OCCURS 0 WITH HEADER LINE.
*
**types: BEGIN OF S_CHANGE_POINTER,
**         matnr   type mara-matnr,
**         CPIDENT TYPE BDCP-CPIDENT,
**         counter like sy-tabix,
**       END OF S_CHANGE_POINTER.
**data: change_pointer type s_change_pointer occurs 0 with header line.
**
*TYPES: BEGIN OF s_mara_pointer,
*         matnr   TYPE mara-matnr,
*         counter LIKE sy-tabix,
*       END OF s_mara_pointer.
*DATA: mara_pointer TYPE s_mara_pointer OCCURS 0 WITH HEADER LINE.
*
*DATA: t_bdcp LIKE bdcp OCCURS 0 WITH HEADER LINE.
*DATA: t_taskname(8) VALUE '00000000'.
*
*
**INSERT EJU: END
*********************************************************



data: hlen type i.

* JH/25.08.97/4.0A Daten für MASTERIDOC_CREATE_REQ_ARTMAS (Anfang)
* Erläuterung:
* HMARAKEY: Kopie der MARA-Keys die in der Selektionsliste übergeben
*           wurden
* TVAR_TAB: Liste der Varianten, wenn es sich bei dem Kopfartikel
*           um einen Sammelartikel handelt
* VAR_MARA: MARA-Daten der Varianten, wenn der Kopfartikel ein SA ist
* TxxxxKEY: Keys zur Tabelle xxxx für alle relevanten Artikel
*           (Einzelartikel, Sammelartikel, Varianten mit und ohne
*           Bezug zu einem Sammelartikel)
data: ihead_matnr  like pre03-matnr,
      hmarakey     like bdimarakey    occurs 0 with header line,
      tmarakey     like bdimarakey    occurs 0 with header line,
      var_mara     like mara          occurs 0 with header line,
      tvar_tab     like pre03         occurs 0 with header line,
      tauspkey     like bdiauspkey    occurs 0 with header line,
      tmaktkey     like bdimaktkey    occurs 0 with header line,
      tmaw1key     like bdimaw1key    occurs 0 with header line,
      tmarckey     like bdimarckey    occurs 0 with header line,
      tmardkey     like bdimardkey    occurs 0 with header line,
      tmfhmkey     like bdimfhmkey    occurs 0 with header line,
      tmpgdkey     like bdimpgdkey    occurs 0 with header line,
      tmpopkey     like bdimpopkey    occurs 0 with header line,
      tmprwkey     like bdimprwkey    occurs 0 with header line,
      tmvegkey     like bdimvegkey    occurs 0 with header line,
      tmveukey     like bdimveukey    occurs 0 with header line,
      tmkalkey     like bdimkalkey    occurs 0 with header line,
      tmarmkey     like bdimarmkey    occurs 0 with header line,
      tmamtkey     like bdimamtkey    occurs 0 with header line,
      tmeankey     like bdimeankey    occurs 0 with header line,
      tmleakey     like bdimleakey    occurs 0 with header line,
      tmalgkey     like bdimalgkey    occurs 0 with header line,
      tmvkekey     like bdimvkekey    occurs 0 with header line,
      twlk2key     like bdiwlk2key    occurs 0 with header line,
      tmlankey     like bdimlankey    occurs 0 with header line,
      tmbewkey     like bdimbewkey    occurs 0 with header line,
      tmlgnkey     like bdimlgnkey    occurs 0 with header line,
      tmlgtkey     like bdimlgtkey    occurs 0 with header line,
      tstxhkey     like bdistxhkey    occurs 0 with header line,
      thelp_prowfa like prowfa        occurs 0 with header line,
      thelp_gesv   like sverbtaba     occurs 0 with header line,
      thelp_ungv   like sverbtaba     occurs 0 with header line.

data: lt_del_ausp  type bdcp occurs 0 with header line.

data: anz_entries like sy-tfill.

data: itextheader like thead.

data: ttextselections like thead occurs 10 with header line.

data: created_c_idocs like sy-tabix.
data: created_m_idocs like sy-tabix.
data: done_since_commit like sy-tabix.

data: output_text(80).
data: output_counter(6).
data: output_total(6).

* DATA ACTIVE  LIKE C_TRUE.  "????Für die Segmentreduzierung
* DATA HACTIVE LIKE C_TRUE.

data hpre03 like pre03 occurs 1 with header line.
* JH/25.08.97/4.0A Daten für MASTERIDOC_CREATE_REQ_ARTMAS (Ende)

* JH/25.08.97/4.0A Daten für MASTERIDOC_CREATE_ARTMAS (Anfang)
* IDoc-Datensegmente
data: iheaddata             like  bapie1mathead,
      tvariantskeys         like  bapie1varkey
                            occurs 0 with header line,
      tcharacteristicvalue  like  bapie1ausprt
                            occurs 0 with header line,
      tcharacteristicvaluex like  bapie1ausprtx
                            occurs 0 with header line,
      tclientdata           like  bapie1marart
                            occurs 0 with header line,
      tclientdatax          like  bapie1marartx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Anfang)
      tclientext            like  bapie1maraextrt
                            occurs 0 with header line,
      tclientextx           like  bapie1maraextrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Ende)
      taddnlclientdata      like  bapie1maw1rt
                            occurs 0 with header line,
      taddnlclientdatax     like  bapie1maw1rtx
                            occurs 0 with header line,
      tmaterialdescription  like  bapie1maktrt
                            occurs 0 with header line,
*#      TMATERIALDESCRIPTIONX  LIKE  BAPIE1MAKTRTX
*#                             OCCURS 0 WITH HEADER LINE,
      tplantdata            like  bapie1marcrt
                            occurs 0 with header line,
      tplantdatax           like  bapie1marcrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Anfang)
      tplantext             like  bapie1marcextrt
                            occurs 0 with header line,
      tplantextx            like  bapie1marcextrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Ende)
      tforecastparameters   like  bapie1mpoprt
                            occurs 0 with header line,
      tforecastparametersx  like  bapie1mpoprtx
                            occurs 0 with header line,
      tforecastvalues       like  bapie1mprwrt
                            occurs 0 with header line,
*#      TFORECASTVALUESX       LIKE  BAPIE1MPRWRTX
*#                             OCCURS 0 WITH HEADER LINE,
      ttotalconsumption     like  bapie1mvegrt
                            occurs 0 with header line,
*#      TTOTALCONSUMPTIONX     LIKE  BAPIE1MVEGRTX
*#                             OCCURS 0 WITH HEADER LINE,
      tunplndconsumption    like  bapie1mveurt
                            occurs 0 with header line,
*#      TUNPLNDCONSUMPTIONX    LIKE  BAPIE1MVEURTX
*#                             OCCURS 0 WITH HEADER LINE,
      tplanningdata         like  bapie1mpgdrt
                            occurs 0 with header line,
      tplanningdatax        like  bapie1mpgdrtx
                            occurs 0 with header line,
      tstoragelocationdata  like  bapie1mardrt
                            occurs 0 with header line,
      tstoragelocationdatax like  bapie1mardrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Anfang)
      tstoragelocationext   like  bapie1mardextrt
                            occurs 0 with header line,
      tstoragelocationextx  like  bapie1mardextrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Ende)
      tunitsofmeasure       like  bapie1marmrt
                            occurs 0 with header line,
      tunitsofmeasurex      like  bapie1marmrtx
                            occurs 0 with header line,
      tunitofmeasuretexts   like  bapie1mamtrt
                            occurs 0 with header line,
*#      TUNITOFMEASURETEXTSX   LIKE  BAPIE1MAMTRTX
*#                             OCCURS 0 WITH HEADER LINE,
      tinternationalartnos  like  bapie1meanrt
                            occurs 0 with header line,
*#      TINTERNATIONALARTNOSX  LIKE  BAPIE1MEANRTX
*#                             OCCURS 0 WITH HEADER LINE,
      tvendorean            like  bapie1mleart
                            occurs 0 with header line,
*#      TVENDOREANX            LIKE  BAPIE1MLEARTX
*#                             OCCURS 0 WITH HEADER LINE,
      tlayoutmoduleassgmt   like  bapie1malgrt
                            occurs 0 with header line,
      tlayoutmoduleassgmtx  like  bapie1malgrtx         "JH/4.0C
                            occurs 0 with header line,  "JH/4.0C
      ttaxclassifications   like  bapie1mlanrt
                            occurs 0 with header line,
*#      TTAXCLASSIFICATIONSX   LIKE  BAPIE1MLANRTX
*#                             OCCURS 0 WITH HEADER LINE,
      tvaluationdata        like  bapie1mbewrt
                            occurs 0 with header line,
      tvaluationdatax       like  bapie1mbewrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Anfang)
      tvaluationext         like  bapie1mbewextrt
                            occurs 0 with header line,
      tvaluationextx        like  bapie1mbewextrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Ende)
      twarehousenumberdata  like  bapie1mlgnrt
                            occurs 0 with header line,
      twarehousenumberdatax like  bapie1mlgnrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Anfang)
      twarehousenumberext   like  bapie1mlgnextrt
                            occurs 0 with header line,
      twarehousenumberextx  like  bapie1mlgnextrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Ende)
      tstoragetypedata      like  bapie1mlgtrt
                            occurs 0 with header line,
      tstoragetypedatax     like  bapie1mlgtrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Anfang)
      tstoragetypeext       like  bapie1mlgtextrt
                            occurs 0 with header line,
      tstoragetypeextx      like  bapie1mlgtextrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Ende)
      tsalesdata            like  bapie1mvkert
                            occurs 0 with header line,
      tsalesdatax           like  bapie1mvkertx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Anfang)
      tsalesext             like  bapie1mvkeextrt
                            occurs 0 with header line,
      tsalesextx            like  bapie1mvkeextrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Ende)
      tposdata              like  bapie1wlk2rt
                            occurs 0 with header line,
      tposdatax             like  bapie1wlk2rtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Anfang)
      tposext               like  bapie1wlk2extrt
                            occurs 0 with header line,
      tposextx              like  bapie1wlk2extrtx
                            occurs 0 with header line,
*       JH/22.04.98/4.0C Strukturen f. Userexit (Ende)
      tmateriallongtext     like  bapie1mltxrt
                            occurs 0 with header line,
*#      TMATERIALLONGTEXTX     LIKE  BAPIE1MLTXRTX
*#                             OCCURS 0 WITH HEADER LINE,
      tplantkeys            like  bapie1wrkkey
                            occurs 0 with header line,
      tstoragelocationkeys  like  bapie1lgokey
                            occurs 0 with header line,
      tdistrchainkeys       like  bapie1vtlkey
                            occurs 0 with header line,
      twarehousenokeys      like  bapie1lgnkey
                            occurs 0 with header line,
      tstoragetypekeys      like  bapie1lgtkey
                            occurs 0 with header line,
      tvaluationtypekeys    like  bapie1bwakey
                            occurs 0 with header line.
* Daten zur Ermittlung der Mermalsbewertung
ranges: r_atinn for  ausp-atinn,    "Liste der relevanten Merkmale
        r_objek for  kssk-objek.    "Liste der relevanten Varianten
data: tmerkm  like api_char occurs 10 with header line,
      tbewert like api_vali occurs 0 with header line.
*JH/07.04.99/4.6A (Anfang)
data:   tmerkm_var  like api_char occurs 10 with header line.
*JH/07.04.99/4.6A (Ende)
data:   tausp   like ausp occurs 0 with header line.
data:   tinf_ausp like ausp occurs 0 with header line.   "note 367970
data:   iausp   like sausp.
data:   ivarky  like svarky.
* Daten für Umschlüsselungen/Zwischenstrukturen
data:   ttstl   like tstl occurs 10 with header line.
data:   ttextlines like tline occurs 10 with header line.
data: it001w like t001w,
      it001k like t001k,
      it001  like t001.
* Tabellen für die Empfängerermittlung
data: treceivers               like bdi_logsys   occurs 10 with header line,
      tbapi_logsys             like bdi_logsys   occurs 10 with header line,
      tfiltobj_val             like bdi_fobj     occurs  0 with header line,
* JH/06.01.98/4.0C Struktur BDI_FOBJTYPE durch BDI_FLTTYP ersetzt
*       TFILTOBJ_TYP LIKE BDI_FOBJTYPE OCCURS  0 WITH HEADER LINE,
      tfiltobj_typ             like bdi_flttyp   occurs  0 with header line,
      tcommunication_documents like swotobjid
                                     occurs 0 with header line,
      tapplication_objects     like swotobjid
                                     occurs 0 with header line.
* Relevante Filterwerte für die Objektfilter
data: tmatl_type  like bapie1mathead-matl_type
                                     occurs  1 with header line,
*       Note 595027
      tmaterial   like bapie1mathead-material_long
                                     occurs  0 with header line,
      tmatl_group like bapie1mathead-matl_group
                                     occurs  1 with header line,
      tmatl_cat   like bapie1mathead-matl_cat
                                     occurs  1 with header line,
      tplant      like bapie1marcrt-plant
                                     occurs  0 with header line,
      tval_area   like bapie1mbewrt-val_area
                                     occurs  0 with header line,
      tlangu      like bapie1maktrt-langu
                                     occurs 10 with header line.
* Ankreuzleiste, welche Filterobjekte relevant sind (wg. Performance)
data: begin of filtobj_relev,
        material(1),
        matl_type(1),
        matl_group(1),
        matl_cat(1),
        plant(1),
        val_area(1),
        langu(1),
      end   of filtobj_relev.
* Filterwerte bei Langtexten
data: l_matnr like mara-matnr,   "MATNR bei Langtext
      l_werks like marc-werks.   "WERKS bei werksabh. Langtext

* Variable zur Initialisierung der Ankreuzleisten im IDoc
data: ankreuzleiste(500).

data: set_mprof.   "KZ, ob Merkmalsprofil im Kopfsegment gesetzt wird
data: wg_class like rmclf-class.   "Warengruppe oder Merkmalsprofil
data: gv_config_class type class_var.
data: gv_config_klart type klart_var.

* JH/25.08.97/4.0A Daten für MASTERIDOC_CREATE_ARTMAS (Ende)

* JH/25.08.97/4.0A Daten für MASTERIDOC_CREATE_SMD_ARTMAS (Anfang)
* Erläuterung:
* TxxxxKEY: Keys zur Tabelle xxxx für alle relevanten Artikel
*           (Einzelartikel, Sammelartikel, Varianten mit und ohne
*           Bezug zu einem Sammelartikel)
*           (schon für MASTERIDOC_CREATE_REQ_ARTMAS definiert, s.o.)
* TxxxxAKT: Keys zur Tabelle xxxx für den aktuell bearbeiteten Artikel
* HMARAKEY: Liste der Artikel, zu denen irgendeine Änderung vorliegt
*           (-> ist notwendig, weil in TMARAKEY nur noch die Artikel
*           mit MARA-Änderungen enthalten sind!)
*           (schon für MASTERIDOC_CREATE_REQ_ARTMAS definiert, s.o.)
* IHEADAKT: MATNR des aktuellen Kopfartikels
* TVAR_TAB: Liste der Varianten, wenn es sich bei dem aktuellen
*           Kopfartikel um einen Sammelartikel handelt
*           (schon für MASTERIDOC_CREATE_REQ_ARTMAS definiert, s.o.)
* VAR_MARA: MARA-Daten der Varianten, wenn der Kopfartikel ein SA ist
*           (schon für MASTERIDOC_CREATE_REQ_ARTMAS definiert, s.o.)
data: iheadakt like pre03-matnr,
      tmaraakt like bdimarakey    occurs 0 with header line,
      tmaktakt like bdimaktkey    occurs 0 with header line,
      tauspakt like bdiauspkey    occurs 0 with header line,
      tmaw1akt like bdimaw1key    occurs 0 with header line,
      tmarcakt like bdimarckey    occurs 0 with header line,
      tmardakt like bdimardkey    occurs 0 with header line,
      tmfhmakt like bdimfhmkey    occurs 0 with header line,
      tmpgdakt like bdimpgdkey    occurs 0 with header line,
      tmpopakt like bdimpopkey    occurs 0 with header line,
      tmprwakt like bdimprwkey    occurs 0 with header line,
      tmvegakt like bdimvegkey    occurs 0 with header line,
      tmveuakt like bdimveukey    occurs 0 with header line,
      tmkalakt like bdimkalkey    occurs 0 with header line,
      tmarmakt like bdimarmkey    occurs 0 with header line,
      tmamtakt like bdimamtkey    occurs 0 with header line,
      tmeanakt like bdimeankey    occurs 0 with header line,
      tmleaakt like bdimleakey    occurs 0 with header line,
      tmalgakt like bdimalgkey    occurs 0 with header line,
      tmvkeakt like bdimvkekey    occurs 0 with header line,
      twlk2akt like bdiwlk2key    occurs 0 with header line,
      tmlanakt like bdimlankey    occurs 0 with header line,
      tmbewakt like bdimbewkey    occurs 0 with header line,
      tmlgnakt like bdimlgnkey    occurs 0 with header line,
      tmlgtakt like bdimlgtkey    occurs 0 with header line,
      tstxhakt like bdistxhkey    occurs 0 with header line.
*????   THELP_PROWFA LIKE PROWFA        OCCURS 0 WITH HEADER LINE,
*????   THELP_GESV   LIKE SVERBTABA     OCCURS 0 WITH HEADER LINE,
*????   THELP_UNGV   LIKE SVERBTABA     OCCURS 0 WITH HEADER LINE.
* Changepointer
data: begin of tchgptrs occurs 10.
        include structure bdcp.
      data: end of tchgptrs.

data: begin of ptchgptrs occurs 10.
        include structure bdcp.
      data: end of ptchgptrs.


data: begin of tcpident occurs 10,
        cpident like bdcp-cpident,
      end of tcpident.

data: begin of tcpident_mat occurs 10,
        mandt   like mara-mandt,
        matnr   like mara-matnr,
        cpident like bdcp-cpident,
      end of tcpident_mat.

* JH/25.08.97/4.0A Daten für MASTERIDOC_CREATE_SMD_ARTMAS (Ende)

* modifkationsfreie Erweiterung des Materialstamms 4.70
data: g_badi_material_od
                  type ref to if_ex_badi_material_od.
data: mat_od_imp_found like sy-batch value space.

data: artmas_data type ref to if_ex_artmas_data_reduce.
data: artmas_data_akt like sy-batch.

* Note 595027
data: artmas_filter type ref to if_ex_artmas_filtering.
data: artmas_filter_akt like sy-batch.

* Note 595707
data: artmas_data_enrich type ref to if_ex_artmas_data_enrich.
data: artmas_data_enrich_akt like sy-batch.

* Note 1820980
data gt_textile_comp like bapitextlcomp
                               occurs 0 with header line.
data gt_textile_fibr like bapitextlfibr
                               occurs 0 with header line.

data gr_badi_fiber_codes_idoc_proc type ref to
 badi_fiber_codes_idoc_process.

*  Fashion Tables
data gt_sgt_marm like bapisgtmarm
                              occurs 0 with header line.
data gt_sgt_mvke like bapisgtmvke
                              occurs 0 with header line.
data gt_sgt_madka like bapisgtmadka
                              occurs 0 with header line.
data gt_seasons like bapifshseasons
                              occurs 0 with header line.
data gt_sgt_mlgn like bapisgtmlgn
                              occurs 0 with header line.
data gt_sgt_mlgt like bapisgtmlgt
                              occurs 0 with header line.
*SDIMP change start I069729
data gt_sgt_mrp   like bapisgtmrp
                              occurs 0 with header line.
data gt_sgt_mrpgn like bapisgtmrpgn
                              occurs 0 with header line.
*SDIMP change end I069729
data go_badi_fsh_idoc_process type ref to badi_fsh_idoc_process.

* Konstanten
include mmvconst.
include mmmgxv29.  "Langtextdeklarationen
include mmmgxv36.  "spezielle Änderungszeiger           //br4.0
include mmmwxv03.  "Artikeltypen                   JH/25.08.97/4.0A
include mmmgxv50.  "Sichten                        JH/25.08.97/4.0A
include mmmwxv05.  "Klassifizierung                JH/25.08.97/4.0A
include mmmgxv38.  "BOR-Objekte                    JH/25.08.97/4.0A
include mmmgxv35.  "Filterobjekte                  JH/25.08.97/4.0A
*ENHANCEMENT-POINT lmv01top_01 SPOTS es_saplmv01 STATIC.
*INCLUDE lsvimdat                                . "general data decl.
*INCLUDE lmv01t00                                . "view rel. data dcl.


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
data : gt_xml_shared_str_itab type ty_i_xml_shared_str_itab,
       gt_xml_sheet_itab      type ty_i_xml_sheet_itab,
       go_ixml_factory        type ref to if_ixml.
data gv_gendata(1) TYPE c.
data gv_done  TYPE flag.
data lv_SHEET TYPE i.
data gv_ctpe TYPE i.

data   : gt_gdatai            TYPE /DLWUPEX/TGDATA_TT,
         gt_TUNITi            TYPE /DLWUPEX/TUNIT_TT,
         gt_TCARACTi          TYPE /DLWUPEX/TCARACT_TT,
         gt_TBOMi             TYPE /DLWUPEX/TBOM_TT,
         gt_TListi            TYPE /DLWUPEX/TLIST_TT,
         gt_TFIAi             TYPE /DLWUPEX/TFIA_TT,
         gt_TSlisti           TYPE /DLWUPEX/TSRLIST_TT,
         gt_TSalesi           TYPE /DLWUPEX/TSALE_TT,
         gt_TLogdci           TYPE /DLWUPEX/TLOGDC_TT,
         gt_TLogsti           TYPE /DLWUPEX/TLOGSTO_TT,
         gt_gdata            TYPE /DLWUPEX/TGDATA_TT,
         gt_TUNIT            TYPE /DLWUPEX/TUNIT_TT,
         gt_TCARACT          TYPE /DLWUPEX/TCARACT_TT,
         gt_TBOM             TYPE /DLWUPEX/TBOM_TT,
         gt_TList            TYPE /DLWUPEX/TLIST_TT,
         gt_TFIA             TYPE /DLWUPEX/TFIA_TT,
         gt_TSlist           TYPE /DLWUPEX/TSRLIST_TT,
         gt_TSales           TYPE /DLWUPEX/TSALE_TT,
         gt_TLogdc           TYPE /DLWUPEX/TLOGDC_TT,
         gt_TLogst           TYPE /DLWUPEX/TLOGSTO_TT.


form set_result_done  using taskname.
  data : lt_xml_shared_str_itab type ty_i_xml_shared_str_itab,
         lt_xml_sheet_itab      type ty_i_xml_sheet_itab.
  receive results from  function '/DLWUPEX/XLSUPLOADSHEET'
      importing
*          ET_XML_SHARED_STR_ITAB =   lT_XML_SHARED_STR_ITAB
*          ET_XML_SHEET_ITAB      =   lt_xml_sheet_itab
          ET_GDATA = gt_gdatai
          ET_UNIT  = gt_TUNITi
          ET_CARAC = gt_TCARACTi
          ET_BOM   = gt_TBOMi
          ET_LIST  = gt_TListi
          ET_FIA   = gt_TFIAi
          ET_SLIST = gt_TSlisti
          ET_SALE  = gt_TSalesi
          ET_LOGDC = gt_TLogdci
          ET_LOGSTORE = gt_TLogsti
          EP_SHEET               =   lv_SHEET.

  CASE lv_SHEET.
    WHEN 1.
      gt_gdata[] = gt_gdatai[].
    WHEN 2.
      gt_TUNIT[] = gt_TUNITi[].
    WHEN 3.
      gt_TCARACT[] = gt_TCARACTi[].
    WHEN 4.
      gt_TBOM[]   = gt_TBOMi[].
    WHEN 5.
      gt_TList[] = gt_TListi[].
    WHEN 6.
      gt_TFIA[] = gt_TFIAi[].
    WHEN 7.
      gt_TSlist[] = gt_TSlisti[].
    WHEN 8.
      gt_TSales[] = gt_TSalesi[].
    WHEN 9.
      gt_TLogdc[] = gt_TLogdci[].
     WHEN 10.
       gt_TLogst[] = gt_TLogsti[].
    WHEN OTHERS.
  ENDCASE.

  gv_ctpe =  gv_ctpe + 1.
  APPEND LINES OF lT_XML_SHARED_STR_ITAB to gt_XML_SHARED_STR_ITAB.
  APPEND LINES OF lt_xml_sheet_itab      to gt_xml_sheet_itab.
  IF gv_ctpe = 10.
   gv_gendata = 'X'.
  endif.
endform.
