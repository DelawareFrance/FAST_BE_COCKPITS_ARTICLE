@AbapCatalog.sqlViewName: '/DLWUPEX/V_SH_ED'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Cds for SH domain /DLWUPEX/DEDIT'
define view /DLWUPEX/DDL_SH_EDITABLE
  as select from dd07l as _value
  association [0..1] to dd07t as _desc on  _desc.domname    = _value.domname
                                       and _desc.ddlanguage = $session.system_language
                                       and _desc.as4local   = _value.as4local
                                       and _desc.valpos     = _value.valpos
                                       and _desc.as4vers    = _value.as4vers

{
  key _value.domvalue_l as Value,
      _desc.ddtext      as Description
}
where
  _desc.domname = '/DLWUPEX/DEDIT'
