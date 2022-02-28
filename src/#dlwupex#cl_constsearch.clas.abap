class /DLWUPEX/CL_CONSTSEARCH definition
  public
  inheriting from CL_SADL_GTK_EXPOSURE_MPC
  final
  create public .

public section.
protected section.

  methods GET_PATHS
    redefinition .
  methods GET_TIMESTAMP
    redefinition .
private section.
ENDCLASS.



CLASS /DLWUPEX/CL_CONSTSEARCH IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~/DLWUPEX/CONSTSEARCH| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20200305082200.
  endmethod.
ENDCLASS.
