class /DLWUPEX/CL_ODMIGRATIO_MPC_EXT definition
  public
  inheriting from /DLWUPEX/CL_ODMIGRATIO_MPC
  create public

  global friends /DLWUPEX/CL_ODMIGRATIO_MPC .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.

  constants GC_INCL_NAME type STRING value '/DLWUPEX/CL_ODMIGRATIO_MPC====CP' ##NO_TEXT.
ENDCLASS.



CLASS /DLWUPEX/CL_ODMIGRATIO_MPC_EXT IMPLEMENTATION.


  method DEFINE.
*{   INSERT         DS1K901478                                        1
*
     super->define( ).

    data:
      lo_entity   type ref to /iwbep/if_mgw_odata_entity_typ,
      lo_property type ref to /iwbep/if_mgw_odata_property.


     lo_entity = model->get_entity_type( iv_entity_name = 'Xls' ).

    if lo_entity is bound.

      lo_property = lo_entity->get_property( iv_property_name = 'ContentType' ).
      lo_property->set_as_content_type( ).
    endif.




    lo_entity = model->get_entity_type( iv_entity_name = `DataFile` ).
    lo_property = lo_entity->get_property( iv_property_name = `Mimetype` ).
    lo_property->set_as_content_type( ).
*}   INSERT
  endmethod.
ENDCLASS.
