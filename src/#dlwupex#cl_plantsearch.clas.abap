class /DLWUPEX/CL_PLANTSEARCH definition
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



CLASS /DLWUPEX/CL_PLANTSEARCH IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~/DLWUPEX/PLANTSEARCH| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20191206081945.
  endmethod.
ENDCLASS.
