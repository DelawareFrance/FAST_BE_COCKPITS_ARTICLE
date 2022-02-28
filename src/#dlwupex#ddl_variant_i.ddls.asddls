@AbapCatalog.sqlViewName: '/DLWUPEX/V_VARTI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view get items variant data'
define view /DLWUPEX/DDL_VARIANT_I
  as select from    /dlwupex/tvar_p as _head
  
     left outer join dd07t           as _descEditable on  _descEditable.domname    = '/DLWUPEX/DEDIT'
                                                       and _descEditable.ddlanguage = $session.system_language
                                                       and _descEditable.domvalue_l = _head.edit
  
    left outer join dd07t           as _descViewname   on  _descViewname.domname    = '/DLWUPEX/DVIEWNAME'
                                                       and _descViewname.ddlanguage = $session.system_language
                                                       and _descViewname.domvalue_l = _head.viewname
    left outer join dd07t           as _descObligatory on  _descObligatory.domname    = '/DLWUPEX/DOBLIGAT_MOD'
                                                       and _descObligatory.ddlanguage = $session.system_language
                                                       and _descObligatory.domvalue_l = _head.obligatory
    left outer join dd02t           as _descTabname    on  _descTabname.tabname    = _head.tabname
                                                       and _descTabname.ddlanguage = $session.system_language
    left outer join dd03l           as _rollname       on  _rollname.tabname   = _head.tabname
                                                       and _rollname.fieldname = _head.fieldname
    left outer join dd04t           as _fielddesc      on  _fielddesc.rollname   = _rollname.rollname
                                                       and _fielddesc.ddlanguage = $session.system_language
  association [0..1] to /dlwupex/tview_k as _properties on  _properties.viewname  = _head.viewname
                                                        and _properties.viewname  = _head.viewname
                                                        and _properties.tabname   = _head.tabname
                                                        and _properties.fieldname = _head.fieldname
{
  key _head.variant             as Variant,
  key _head.viewname            as ViewName,
  key _head.tabname             as TabName,
  key _head.fieldname           as FieldName,
      _head.dposition           as PositionNo,
       _head.edit          as IsEditable,
//      cast( case _head.edit
//            when 'Y' then 'X'
//            else ''
//          end  as boole_d     ) as IsEditable,

      cast( case _head.active
      when 'Y' then 'X'
      else ''
      end  as boole_d     )     as IsActive,
      _head.obligatory          as IsMandatory,
      _head.default_val         as IsDefaultValue,
      _head.take_back_insert    as IsBackInsert,
      _head.etag                as ChangeDateTime,
      _descViewname.ddtext      as ViewDesc,
      _descObligatory.ddtext    as MandatoryDesc,
      _descTabname.ddtext       as TabnameDesc,
      _fielddesc.ddtext         as FieldnameDesc,
      _properties.display_only  as DisplayOnly,
      _properties.var_def       as MandatoryField,
      _descEditable.ddtext      as IsEditableDesc
}
