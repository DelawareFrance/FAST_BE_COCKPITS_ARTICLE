@AbapCatalog.sqlViewName: '/DLWUPEX/V_VARTX'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view get langu text variant data'
define view /DLWUPEX/DDL_VARIANT_TX
  as select from /dlwupex/tvar_tx
  association [0..1] to t002t as _languDesc on  _languDesc.spras = $session.system_language
                                            and _languDesc.sprsl = $projection.Language
{
  key variant          as Variant,
  key spras            as Language,
      description      as Description,
      _languDesc.sptxt as LanguageDesc
}
