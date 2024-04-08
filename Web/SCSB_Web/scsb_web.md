# 上海(scsb)

## API
### 紀錄查詢
| 檔案 | 位置 |
|---|---|
|System_Service.cfgBean.xml | /SMS/QryUploLog.jsp |
|QryUploLog.jsp | a href="#" onclick="checkData(3)">本日查詢 |
|QryUploLog.jsp | urlStr = "/SMS/servlet/QryLog.do?t=<%=System.currentTimeMillis() + session.getId()%>" |
|QryLogController.java|/servlet/QryLog.do|

### 帳號管理->紀錄查詢
* 進階管理 -> 帳號管理 -> 開始查詢 -> 修改帳號(點選任意一筆資料進入畫面) -> 發送紀錄

|檔案|位置|
|---|---|
|AccountLogController.java|/servlet/AccountLog.do|


### 簡訊發送，預覽發送
| 檔案 | 位置 |
|---|---|
|System_Service.cfgBean.xml | /SMS/RealSend.jsp |
|RealSend.jsp|onClick="checkData('<%=((String)session.getAttribute("userRights")).substring(0, 1)%>')">發送|
|RealSend.jsp | doSmsSend(); |
|RealSend.jsp|document.RealSend.submit();|
|RealSend.jsp|/SMS/servlet/RealSend.do|
|RealSendController.java|QueryUserPoint.do|
|RealSendController.java|RealSendPreview.jsp|
|RealSendPreview.jsp|onClick="chkData()">送出|
|RealSendPreview.jsp|/SMS/servlet/Preview.do|
|PreviewController.java|/servlet/Preview.do|
|BulkSendController.java|/servlet/BulkSend.do|

### 批次檔發送
| 檔案 | 位置 |
|---|---|
|System_Service.cfgBean.xml|/SMS/SmsSendBulk.jsp|
|SmsSendBulk.jsp|/SMS/GetFile.jsp|
|GetFile.jsp|/SMS/servlet/FileSend.do|
|FileSendController.java|/servlet/FileSend.do|
|FileSendController.java|/SMS/Preview.jsp|
|Preview.jsp|chkData()|
|Preview.jsp|doSmsSend()|
|Preview.jsp|/SMS/servlet/Preview.do|
|PreviewController.java|/servlet/Preview.do|
|PreviewController.java|/SMS/servlet/BulkSend.do|
|BulkSendController.java|/servlet/BulkSend.do|

### 變數檔發送
| 檔案 | 位置 |
|---|---|
|System_Service.cfgBean.xml|/SMS/SmsSendBulk.jsp|
|SmsSendBulk.jsp|/SMS/GetFile.jsp|
|GetFile.jsp|/SMS/servlet/CutVarFiled.do|
|CutVarFiledController.java|/servlet/CutVarFiled.do|
|CutVarFiledController.java|/SMS/VariableSend.jsp|
|VariableSend.jsp|chkData()|
|VariableSend.jsp|/SMS/servlet/VariableSend.do|
|VariableSendController.java|/servlet/VariableSend.do|

### 新增連絡人
| 檔案 | 位置 |
|---|---|
|RealSend.jsp|/SMS/servlet/ContactServlet.do|
|ContactServletController.java|ContactServlet.do|

## Dao
### RealSendController
| File | Method| Note|
|---|---|---|
|SmsCustParameterDAO.java|insertSmsCustPatmeter|批次新增使用者的發送資料|
|SmsCustParameterDAO.java|getAllSmsCustParameter|取得使用者所有的發送資料|

### QueryUserPointController
| File | Method| Note|
|---|---|---|
|SmUserDAO.java|getUserResSubmits|取得剩餘點數|

### BulkSendController
| File | Method| Note|
|---|---|---|
|BulkSendDAO.java|execSpWebSmSendBulk2|多筆簡訊發送|

### ContactServletController
| File | Method| Note|
|---|---|---|
|ContactDAO.java|getQueryContactServletSQLString|取得查詢通訊錄的SQL語法|