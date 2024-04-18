# f2s 測試流程

## 此專案測試資料可透過 api、web、簡訊快遞

## Processor_P14
### 測試流程
1. postman call api
2. GateWay 發送簡訊 delphi
3. SpFile2SMServerBulk(要改群組)記得先改!!下面有教 
4. f2s 抓 SMServerBulk_New 資料
5. SMSourNew 有資料
6. 最終結果確認發送的群組 例:DBexp.UBOTCC

### 測試遇到問題
* 建立route DBexp.CamelF2SGroupIDConfig (新增一筆群組)
* 需要調整 NotSendByOrderTimeIntervalSettings (預約期間時間設定)
* 啟動gw
  * conf
    * app.global.groupId = UBOTCC
    * db 34 SMS2 (記得改 SMS2.SMUser groupid)
    * DBexp.SMUser 找 gw 帳密
    * gw.connector.loc1.groupId = UBOTCC
    * gw.connector.loc1.userName = UBOTCC_GW
    * gw.connector.loc1.groupNum = NTI0ODU0NDg4Nw
* 啟動api
  * 改db即可
* SMServerBulk_New 無資料
  * GW 端會打到 -> Server delphi -> SpFile2SMServerBulk(裡面的 @GroupID 測試環境是寫死的)
  
## Processor_4
### 測試順序
* 本次測試是用簡訊快遞(舊)測試
* DB相關資訊
  * .34 DB: SMS2    
    1. UserName: root，Pw: 12345
    2. 確認 SMUser 的 GroupID
  * .34 DB: DBexp
    1. 有一張表=GroupID(例: MSG)
* AP相關資訊
  1. 確認 Conf 裡面的 ``` GroupID verification GroupID list```，與測試帳號的 GroupID 有無相同，流程會驗證
  2. 發送後 f2s 的 CamelWorkDetailLog 裡面會有中心序號(serialNo)，代表中心端已收到 
  3. 用 serialNo 去 DBexp 確認 GroupID(表) 的狀態與這次測試的內容相關即可