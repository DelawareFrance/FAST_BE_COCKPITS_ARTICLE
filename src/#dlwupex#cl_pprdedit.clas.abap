class /DLWUPEX/CL_PPRDEDIT definition
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



CLASS /DLWUPEX/CL_PPRDEDIT IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~/DLWUPEX/PPRDEDIT| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20191203154228.
  endmethod.
ENDCLASS.
