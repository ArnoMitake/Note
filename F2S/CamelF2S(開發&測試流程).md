# f2s test process

## Chose one Api、Web、簡訊快遞 to test this project

### _Step1: 測試前須知 (只要注意以下設定即可，發送api就行了)_
* AppSettings.properties
  1. ```f2s.select.execSpName``` have two mode
     1. ```Sp_CamelF2S_SelectSMSourBulkNew_New``` only for short sms
     2. ```Sp_CamelF2S_SelectSMSourBulkLU``` for long or Unicode sms
  2. This project only check [Partkey]、[GroupID] data
     1. ```f2s.scam.keyword.verification.groupID.list```
     2. ```f2s.select.partKey```
     3. ```DBexp.dbo.CamelF2SGroupIDConfig``` Can see all settings，can create a new row before not find data settings
* 有些群組設定會寫死在 sp 裡面需要去調整

## 請注意!!!!!!!!!!!!!!!!!!!!!!!!!!! 很容易忘記
* DBexp SpFile2SMServerBulk 這裡面的群組是寫死的 有要測新的群組要進去加