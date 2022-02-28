@AbapCatalog.sqlViewName: '/DLWUPEX/CARACT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Update'

define view /DLWUPEX/CARA  

with parameters 
@Consumption.hidden: true 
@Environment.systemField: #SYSTEM_DATE 
P_KeyDate : syst_datum ,
@Consumption.hidden: true 
@Environment.systemField: #SYSTEM_LANGUAGE 
P_Language : syst_langu 
 as  select distinct  
 CLASS.klart                                     as  ClassType  ,  
 CLASS.statu                                     as  ClassificationStatus  ,  
 RTRIM( SUBSTRING( I.objek , 1  , 40  ) , ' ' )  as  Material  ,  
 I.cuobj                                         as  ProductConfiguration  ,  
 @EndUserText.label: 'Type de tarif BM (Sur Mesure)'
cast ( AUSP0001.atwrt as abap.char( 30 ) )   as  ZZ_BM_TYPETARIF  ,  
 @EndUserText.label: 'Type de tarif BM (Sur Mesure) description'
VALD0001.CharacteristicValueDescription      as  ZZ_BM_TYPETARIF_Desc  ,  
 @EndUserText.label: 'Unité mesure client (SM)'
cast ( AUSP0002.atwrt as abap.char( 3 ) )    as  ZZ_BM_UMCLIENT  ,  
 @EndUserText.label: 'Unité mesure client (SM) description'
VALD0002.CharacteristicValueDescription      as  ZZ_BM_UMCLIENT_Desc  ,  
 @EndUserText.label: 'Interface Bricoman'
cast ( AUSP0003.atwrt as abap.char( 30 ) )   as  ZZ_BM_INTERFACE  ,  
 @EndUserText.label: 'Interface Bricoman description'
VALD0003.CharacteristicValueDescription      as  ZZ_BM_INTERFACE_Desc,

@EndUserText.label: 'Type de licence'
cast ( AUSP0004.atwrt as abap.char( 30 ) )    as  ZZ_BM_LICENCE  ,  
 @EndUserText.label: 'Type de licence description'
VALD0004.CharacteristicValueDescription      as  ZZ_BM_LICENCE_Desc ,

@EndUserText.label: 'Type de licence'
cast ( AUSP0005.atwrt as abap.char( 30 ) )    as  Z_BM_DANGEROSITE  ,  
 @EndUserText.label: 'Type de licence description'
VALD0005.CharacteristicValueDescription      as  Z_BM_DANGEROSITE_Desc ,

@EndUserText.label: 'Type de licence'
cast ( AUSP0006.atwrt as abap.char( 30 ) )    as  Z_LOLO2  ,  
 @EndUserText.label: 'Type de licence description'
VALD0006.CharacteristicValueDescription      as  Z_LOLO2_Desc ,

@EndUserText.label: 'Type de licence'
cast ( AUSP0007.atwrt as abap.char( 30 ) )    as  Z_LOLO3  ,  
 @EndUserText.label: 'Type de licence description'
VALD0007.CharacteristicValueDescription      as  Z_LOLO3_Desc ,

@EndUserText.label: 'Type de licence'
cast ( AUSP0008.atwrt as abap.char( 30 ) )    as  Z_LOLO  ,  
 @EndUserText.label: 'Type de licence description'
VALD0008.CharacteristicValueDescription      as  Z_LOLO_Desc ,

@EndUserText.label: 'Type de licence'
cast ( AUSP0009.atwrt as abap.char( 30 ) )    as Z_LOLO1  ,  
 @EndUserText.label: 'Type de licence description'
VALD0009.CharacteristicValueDescription      as  Z_LOLO1_Desc 




  from  kssk  as  CLASS 
  inner join  inob  as  I  on  I.cuobj  = CLASS.objek and I.obtab  = 'MARAT' and I.mandt  = CLASS.mandt 
  inner join  klah  as  KLAH  on  KLAH.clint  = CLASS.clint //AND KLAH.CLASS  = '01010' 
  
  inner join  cabn  as  CABN0001  on  CABN0001.atnam  = 'Z_BM_TYPETARIF' 
  left outer join  ausp  as  AUSP0001  on  AUSP0001.mandt  = CLASS.mandt and AUSP0001.klart  = CLASS.klart and AUSP0001.mafid  = CLASS.mafid and AUSP0001.objek  = CLASS.objek and AUSP0001.atinn  = CABN0001.atinn 
  left outer join  I_CharcValueDescForKeyDate ( P_KeyDate : :P_KeyDate, P_Language : :P_Language)  as  VALD0001  on  VALD0001.CharacteristicInternalID  = CABN0001.atinn and VALD0001.CharacteristicValue  = AUSP0001.atwrt 
  
  inner join  cabn  as  CABN0002  on  CABN0002.atnam  = 'Z_BM_UMCLIENT' 
  left outer join  ausp  as  AUSP0002  on  AUSP0002.mandt  = CLASS.mandt and AUSP0002.klart  = CLASS.klart and AUSP0002.mafid  = CLASS.mafid and AUSP0002.objek  = CLASS.objek and AUSP0002.atinn  = CABN0002.atinn 
  left outer join  I_CharcValueDescForKeyDate ( P_KeyDate : :P_KeyDate, P_Language : :P_Language)  as  VALD0002  on  VALD0002.CharacteristicInternalID  = CABN0002.atinn and VALD0002.CharacteristicValue  = AUSP0002.atwrt 
  inner join  cabn  as  CABN0003  on  CABN0003.atnam  = 'Z_BM_INTERFACE' 
  left outer join  ausp  as  AUSP0003  on  AUSP0003.mandt  = CLASS.mandt and AUSP0003.klart  = CLASS.klart and AUSP0003.mafid  = CLASS.mafid and AUSP0003.objek  = CLASS.objek and AUSP0003.atinn  = CABN0003.atinn 
  left outer join  I_CharcValueDescForKeyDate ( P_KeyDate : :P_KeyDate, P_Language : :P_Language) as  VALD0003  on  VALD0003.CharacteristicInternalID  = CABN0003.atinn and VALD0003.CharacteristicValue  = AUSP0003.atwrt  
  
  inner join  cabn  as  CABN0004  on  CABN0004.atnam  = 'Z_BM_LICENCE' 
  left outer join  ausp  as  AUSP0004  on  AUSP0004.mandt  = CLASS.mandt and AUSP0004.klart  = CLASS.klart and AUSP0004.mafid  = CLASS.mafid and AUSP0004.objek  = CLASS.objek and AUSP0004.atinn  = CABN0004.atinn 
  left outer join  I_CharcValueDescForKeyDate ( P_KeyDate : :P_KeyDate, P_Language : :P_Language)  as  VALD0004  on  VALD0004.CharacteristicInternalID  = CABN0004.atinn and VALD0004.CharacteristicValue  = AUSP0004.atwrt 
  
 
  inner join  cabn  as  CABN0005  on  CABN0005.atnam  = 'Z_BM_DANGEROSITE' 
  left outer join  ausp  as  AUSP0005  on  AUSP0005.mandt  = CLASS.mandt and AUSP0005.klart  = CLASS.klart and AUSP0005.mafid  = CLASS.mafid and AUSP0005.objek  = CLASS.objek and AUSP0005.atinn  = CABN0005.atinn 
  left outer join  I_CharcValueDescForKeyDate ( P_KeyDate : :P_KeyDate, P_Language : :P_Language)  as  VALD0005  on  VALD0005.CharacteristicInternalID  = CABN0005.atinn and VALD0005.CharacteristicValue  = AUSP0005.atwrt 
  
  inner join  cabn  as  CABN0006  on  CABN0006.atnam  = 'Z_LOLO2' 
  left outer join  ausp  as  AUSP0006  on  AUSP0006.mandt  = CLASS.mandt and AUSP0006.klart  = CLASS.klart and AUSP0006.mafid  = CLASS.mafid and AUSP0006.objek  = CLASS.objek and AUSP0006.atinn  = CABN0006.atinn 
  left outer join  I_CharcValueDescForKeyDate ( P_KeyDate : :P_KeyDate, P_Language : :P_Language)  as  VALD0006  on  VALD0006.CharacteristicInternalID  = CABN0006.atinn and VALD0006.CharacteristicValue  = AUSP0006.atwrt 
  
 
 
  inner join  cabn  as  CABN0007  on  CABN0007.atnam  = 'Z_LOLO3' 
  left outer join  ausp  as  AUSP0007  on  AUSP0007.mandt  = CLASS.mandt and AUSP0007.klart  = CLASS.klart and AUSP0007.mafid  = CLASS.mafid and AUSP0007.objek  = CLASS.objek and AUSP0007.atinn  = CABN0007.atinn 
  left outer join  I_CharcValueDescForKeyDate ( P_KeyDate : :P_KeyDate, P_Language : :P_Language)  as  VALD0007  on  VALD0007.CharacteristicInternalID  = CABN0007.atinn and VALD0007.CharacteristicValue  = AUSP0007.atwrt 
  
 inner join  cabn  as  CABN0008  on  CABN0008.atnam  = 'Z_LOLO' 
  left outer join  ausp  as  AUSP0008  on  AUSP0008.mandt  = CLASS.mandt and AUSP0008.klart  = CLASS.klart and AUSP0008.mafid  = CLASS.mafid and AUSP0008.objek  = CLASS.objek and AUSP0008.atinn  = CABN0008.atinn 
  left outer join  I_CharcValueDescForKeyDate ( P_KeyDate : :P_KeyDate, P_Language : :P_Language)  as  VALD0008  on  VALD0008.CharacteristicInternalID  = CABN0008.atinn and VALD0008.CharacteristicValue  = AUSP0008.atwrt 
  
  
  inner join  cabn  as  CABN0009  on  CABN0009.atnam  = 'Z_LOLO1' 
  left outer join  ausp  as  AUSP0009  on  AUSP0009.mandt  = CLASS.mandt and AUSP0009.klart  = CLASS.klart and AUSP0009.mafid  = CLASS.mafid and AUSP0009.objek  = CLASS.objek and AUSP0009.atinn  = CABN0009.atinn 
  left outer join  I_CharcValueDescForKeyDate ( P_KeyDate : :P_KeyDate, P_Language : :P_Language)  as  VALD0009  on  VALD0009.CharacteristicInternalID  = CABN0009.atinn and VALD0009.CharacteristicValue  = AUSP0009.atwrt 
  
 
 
  where  CLASS.mandt  = $session.client and CLASS.mafid  = 'O' and CLASS.klart  = '026';

