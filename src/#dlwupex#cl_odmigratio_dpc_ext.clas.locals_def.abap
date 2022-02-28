*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
*{   INSERT         DS1K901097                                        1
*

 interface lif_migration_manager.
   methods:
     get_busines_unit
       importing iv_uname type sy-uname optional
                 iv_modif type boolean optional
       exporting et_itab  type ref to data ,

     get_march_cat
       exporting et_itab type ref to data,

     get_materials_copy
       exporting et_itab type ref to data,

     get_requestlist
       importing iv_uname type sy-uname optional
       exporting et_itab  type ref to data .

 endinterface.

 interface lif_data_read.
   methods:
     get_busines_unit
       importing iv_uname type sy-uname optional
                 iv_modif type boolean optional
       exporting et_itab  type ref to data ,

     get_march_cat
       exporting et_itab type ref to data ,

     get_materials_copy
       exporting et_itab type ref to data,

     get_requestlist
       importing iv_uname type sy-uname optional
       exporting et_itab  type ref to data .
 endinterface.
*}   INSERT
