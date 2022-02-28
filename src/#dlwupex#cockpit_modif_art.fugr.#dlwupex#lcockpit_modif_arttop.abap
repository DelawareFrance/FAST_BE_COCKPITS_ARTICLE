FUNCTION-POOL /DLWUPEX/COCKPIT_MODIF_ART.   "MESSAGE-ID ..

* INCLUDE /DLWUPEX/LCOCKPIT_MODIF_ARTD...    " Local class definition
 types:
    BEGIN OF ty_data,
      data TYPE REF TO data,
    END OF ty_data .
  types:
    BEGIN OF ty_change_data,
      view    TYPE /dlwupex/eviewname,
      seldata TYPE     /dlwupex/seldata_tt,
      data    TYPE STANDARD TABLE OF ty_data WITH DEFAULT KEY,
    END OF ty_change_data .
  types:
    ty_change_data_tt TYPE STANDARD TABLE OF ty_change_data WITH DEFAULT KEY .
