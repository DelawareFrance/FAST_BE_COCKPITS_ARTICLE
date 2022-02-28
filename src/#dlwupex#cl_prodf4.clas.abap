class /DLWUPEX/CL_PRODF4 definition
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



CLASS /DLWUPEX/CL_PRODF4 IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~/DLWUPEX/PRODF4| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20191205135443.
  endmethod.
ENDCLASS.
