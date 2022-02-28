@AbapCatalog.sqlViewName: '/DLWUPEX/V_VARTA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view get authorization variant data'
define view /DLWUPEX/DDL_VARIANT_AUTH
  as select from /dlwupex/tvar_au
  association [0..1] to dd07t as _descsign        on  _descsign.domname    = 'EECIC_SIGN'
                                                  and _descsign.ddlanguage = $session.system_language
                                                  and _descsign.domvalue_l = $projection.SignUser
  association [0..1] to dd07t as _descsigngroup   on  _descsigngroup.domname    = 'EECIC_SIGN'
                                                  and _descsigngroup.ddlanguage = $session.system_language
                                                  and _descsigngroup.domvalue_l = $projection.GroupSignUser
  association [0..1] to dd07t as _descsignrole   on  _descsignrole.domname    = 'EECIC_SIGN'
                                                  and _descsignrole.ddlanguage = $session.system_language
                                                  and _descsignrole.domvalue_l = $projection.RoleSignUser
  association [0..1] to dd07t as _descoption      on  _descoption.domname    = 'EECIC_OPTION'
                                                  and _descoption.ddlanguage = $session.system_language
                                                  and _descoption.domvalue_l = $projection.OptionUser
  association [0..1] to dd07t as _descoptiongroup on  _descoptiongroup.domname    = 'EECIC_OPTION'
                                                  and _descoptiongroup.ddlanguage = $session.system_language
                                                  and _descoptiongroup.domvalue_l = $projection.GroupOptionUser
  association [0..1] to dd07t as _descoptionrole on  _descoptionrole.domname    = 'EECIC_OPTION'
                                                  and _descoptionrole.ddlanguage = $session.system_language
                                                  and _descoptionrole.domvalue_l = $projection.RoleOptionUser
{
  key variant                 as Variant,
  key line                    as Line,
      sign_user               as SignUser,
      option_user             as OptionUser,
      user_low                as LowUser,
      user_high               as HighUser,
      sign_group_user         as GroupSignUser,
      option_group_user       as GroupOptionUser,
      group_user_low          as GroupUserLow,
      group_user_high         as GroupUserHigh,
      sign_role_user          as RoleSignUser,
      option_role_user        as RoleOptionUser,
      role_low                as RoleLow,
      role_high               as RoleHigh,
      _descsign.ddtext        as SignuserDesc,
      _descsigngroup.ddtext   as SignusergDesc,
      _descsignrole.ddtext   as SignuserroleDesc,
      _descoption.ddtext      as OptionuserDesc,
      _descoptiongroup.ddtext as OptionusergDesc,
      _descoptionrole.ddtext as OptionuserroleDesc
}
