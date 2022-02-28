@AbapCatalog.sqlViewName: '/DLWUPEX/PLANTF4'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Update'
@OData.publish: true
define view /DLWUPEX/PLANTSEARCH  as select from t001w

{
//t001w 
key mandt, 
key werks, 
name1, 
bwkey, 
kunnr, 
lifnr, 
fabkl, 
name2, 
stras, 
pfach, 
pstlz, 
ort01, 
ekorg, 
vkorg, 
chazv, 
kkowk, 
kordb, 
bedpl, 
land1, 
regio, 
counc, 
cityc, 
adrnr, 
iwerk, 
txjcd, 
vtweg, 
spart, 
spras, 
wksop, 
awsls, 
chazv_old, 
vlfkz, 
bzirk, 
zone1, 
taxiw, 
bzqhl, 
let01, 
let02, 
let03, 
txnam_ma1, 
txnam_ma2, 
txnam_ma3, 
betol, 
j_1bbranch, 
vtbfi, 
fprfw, 
achvm, 
dvsart, 
nodetype, 
nschema, 
pkosa, 
misch, 
mgvupd, 
vstel, 
mgvlaupd, 
mgvlareval, 
sourcing, 
no_default_batch_management, 
fsh_mg_arun_req, 
fsh_seaim, 
fsh_bom_maintenance, 
fsh_group_pr, 
arun_fix_batch, 
oilival, 
oihvtype, 
oihcredipi, 
storetype, 
dep_store
}
