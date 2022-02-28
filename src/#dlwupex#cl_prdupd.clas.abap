class /DLWUPEX/CL_PRDUPD definition
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



CLASS /DLWUPEX/CL_PRDUPD IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~/DLWUPEX/PRDUPD| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20191204064741.
  endmethod.
ENDCLASS.
