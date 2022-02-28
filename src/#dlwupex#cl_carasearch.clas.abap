class /DLWUPEX/CL_CARASEARCH definition
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



CLASS /DLWUPEX/CL_CARASEARCH IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~/DLWUPEX/CARASEARCH| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20191206163047.
  endmethod.
ENDCLASS.
