*----------------------------------------------------------------------*
***INCLUDE /DLWUPEX/LVARIANTF01.
*----------------------------------------------------------------------*

FORM before_save.

  CONSTANTS : lc_action_update TYPE c VALUE 'U',    "Updating current record
              lc_action_create TYPE c VALUE 'N'.     "Creating new  record

  TYPES : BEGIN OF ty_dd03l,
            tabname   TYPE tabname,
            fieldname TYPE fieldname,
          END OF ty_dd03l.

  DATA : lt_dd03l  TYPE TABLE OF ty_dd03l,
         ls_dd03l  TYPE ty_dd03l,
         lt_tview_k TYPE TABLE OF /dlwupex/tview_k.

*  BREAK-POINT 20009815.
*
*  SELECT tabname fieldname FROM dd03l INTO TABLE lt_dd03l
*    WHERE tabname = '/DLWUPEX/SGDATAUP'.
*  SORT lt_dd03l.
*
*  SELECT * FROM /dlwupex/tview_k INTO TABLE lt_tview_k.
*
*  LOOP AT /dlwupex/v_var_p_total ASSIGNING FIELD-SYMBOL(<v_var_p_total>).
*    CHECK <action> = lc_action_update OR <action> = lc_action_create.
*
*    READ TABLE lt_dd03l TRANSPORTING NO FIELDS
*      WITH KEY tabname = '/DLWUPEX/SGDATAUP'
*               fieldname = <v_var_p_total>-fieldname
*               BINARY SEARCH.
*    IF sy-subrc IS NOT INITIAL.
*      MESSAGE 'champ impossible' TYPE 'E'.
*    ENDIF.
*
*    READ TABLE lt_tview_k INTO DATA(ls_tview_k)
*      WITH KEY viewname = <v_var_p_total>-viewname
*               tabname = <v_var_p_total>-tabname
*               fieldname = <v_var_p_total>-fieldname
*               BINARY SEARCH.
*    IF sy-subrc IS INITIAL AND ls_tview_k-display_only = 'X'.
*      <v_var_p_total>-edit = 'N'.
*    ENDIF.
*
*  ENDLOOP.

  IF 1 = 2.

  ENDIF.
ENDFORM.
