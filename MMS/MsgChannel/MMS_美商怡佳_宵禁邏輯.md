# MMS_美商怡佳_宵禁邏輯

## MMS流程圖
![](流程圖/New%20Message%20Architecture%20(Detail).png)
### Client端
![img.png](流程圖/img.png)
* https://gitlab01.mitake.com.tw/SMS/message/apigw
* https://gitlab01.mitake.com.tw/SMS/message/server-backend
### 中心端
![img_1.png](流程圖/img_1.png)
* https://gitlab01.mitake.com.tw/SMS/message/server-gw
* MsgServer-gw-mms-common
* MsgServer-gw-mms-json-master (Main)
* MsgServer-gw-oauth

## DB 
* Message_Channel
  * 帶有ApiDeliver都是由api發送的
  * Web發送的會到 MMSDeliverTemp(文字資料)、MMSDeliverAttachTemp (附件)
  * 發送完會執行sp Sp_MMS_ApiDeliverDataSelect、Sp_MMS_DeliverDataResendSelect、Sp_MMS_DeliverDataSelect 將資料join到最終結果
  * 最終結果都會存到 MMSDeliver、MMSAttachments


## 需求
```
新增只針對部門為「C10880」及「美商怡佳」處理宵禁邏輯，

預計改法是在xml設定多一個bean，Processor部分也要一支新的，未來想移除比較方便，Send跟reSedn都需要增加此邏輯，

宵禁邏輯基本上參考VerifyDataProssor，

但俊宏說這有一個BUG，也麻煩修復正確，若OrderTime有中宵禁而往後延，ExpireTime應該也要往後延，

另外，多預留flag來控制是否要執行這段邏輯，我希望可以從DB資料表去update就能開關邏輯，

需求上有任何問題，都提出來討論，需求確認清楚後再開始調整，

P.S. 有改到的porject，都new一個新的branch

```

## 預估做法
* 新開一隻 Processor 對部門為「C10880」及「美商怡佳」處理宵禁邏輯
* Send、ReSend 撈取資料玩檢查無資料，有資料進入宵禁
* 需討論新 table
  * 主要方向以控制多種功能開關設置 -> (例:GroupFuncSetting)
  
  |欄位|類型|說明|
  |---|---|---|
  |GroupID | char(pk)|群組|
  |CurFewMode|int?|宵禁模式 0:關閉 1:開啟|
  |....|int?|??模式|
