class /DLWUPEX/CL_PRDEDIT definition
  public
  inheriting from CL_NAT_ODATA_MODEL_ABS
  final
  create public .

public section.

  constants NC_QUERY_NAME type /IWBEP/ANA_GSR_QUERY_NAME value '2C/DLWUPEX/PREDIT' ##NO_TEXT.

  methods IF_NAT_QUERY_HELPER~GET_QUERY_NAME
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS /DLWUPEX/CL_PRDEDIT IMPLEMENTATION.


  method IF_NAT_QUERY_HELPER~GET_QUERY_NAME.
    r_query_name = nc_query_name.
  endmethod.
ENDCLASS.
