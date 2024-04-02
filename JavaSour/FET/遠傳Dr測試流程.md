# Dr回傳寫入測試案例

## 發送 API
http://10.99.0.38:7316/SmSend?smbody=Fet_QueryDr_Test_20240109_delivered&dstaddr=0900111123&username=jackliutest&password=12345

## RetrieveDr DB流程(此範例暫時用單筆，實測為多筆)
* DBexp.MSG (多筆發送資料寫入需要一段時間)
    1. (UserName = 'jackliutest' and StatusTime like '20240109%')
    2. 找到發送資料的 SerialNo
* SMDR.SMCheck
    1. (SerialNo = 'B00B1AD31')
    2. 此步驟須等 mock 回覆才會有資料，找 MsgID
* TelcomSimulateServer.SmsDataFET
    1. (message_id = '1704783909005')
    2. 此步驟須等 mock 回覆才會有資料
* SMCDR.SMCDRFet (最終結果)
    1.(message_id = '1704783909005')    
* SMDR.sp_fet_dr_final (搓合結果)

## QueryDr DB流程(單筆)
* DBexp.MSG
    1. (UserName = 'jackliutest' and StatusTime like '20240109%')
    2. 找到發送資料的 SerialNo
* SMDR.SMCheck
    1. (SerialNo = 'B00B1AD31')    
    2. 此步驟須等 mock 回覆才會有資料，找 MsgID
    3. 調整 ExpireTime 過期時間，否則 SMCDR.SMCDRFet 無資料
* TelcomSimulateServer.SmsDataFET
    1. (message_id = '1704783909005')
    2. 此步驟須等 mock 回覆才會有資料
* SMCDR.SMCDRFet (最終結果)
    1.(message_id = '1704783909005')
    
* SMDR.sp_fet_dr_final (搓合結果)


## Mock 端
* RetrieveDr 須注意 drTime 拿掉即可
* 調整對應的 respones 狀態即可
