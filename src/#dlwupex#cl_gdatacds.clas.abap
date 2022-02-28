class /DLWUPEX/CL_GDATACDS definition
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



CLASS /DLWUPEX/CL_GDATACDS IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~/DLWUPEX/GDATACDS| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20190725090926.
  endmethod.
ENDCLASS.
