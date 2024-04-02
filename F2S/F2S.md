# f2s 測試流程

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
  