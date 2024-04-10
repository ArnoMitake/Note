# 上海(scsb)

## 線上 DB:SCB_test

## 紀錄查詢結果遮罩邏輯調整開發作業、測試方式
* 此功能主要針對 [線上查詢]、[紀錄下載] 的內容作遮罩，有兩個地方
1. 資料維護 -> 紀錄查詢
2. 進階管理 -> 帳號管理 -> 開始查詢 -> 查詢結果(選擇一筆資料，會有新視窗) -> 發送紀錄
* 遮罩功能開關參考 DB:SCB_test -> SMUser2 裡面的 Rights(第25個為遮罩功能)

## API
|項目| 檔案 | 位置 |
|---|---|---|
|紀錄查詢|System_Service.cfgBean.xml | /SMS/QryUploLog.jsp |
|紀錄查詢|QryUploLog.jsp | a href="#" onclick="checkData(3)">本日查詢 |
|紀錄查詢|QryUploLog.jsp | urlStr = "/SMS/servlet/QryLog.do?t=<%=System.currentTimeMillis() + session.getId()%>" |
|紀錄查詢|QryLogController.java|/servlet/QryLog.do|
|記錄下載|System_Service.cfgBean.xml | /SMS/QryUploLog.jsp |
|記錄下載|QryUploLog.jsp | a href="#" onclick="checkData(2)">記錄下載 |
|記錄下載|QryUploLog.jsp | url:"/SMS/servlet/QryLogServlet" //有分檔 -> /SMS/incSplitRecordFile.jsp|
|記錄下載|QryLogServlet.java|doGet|
|帳號管理|System_Service.cfgBean.xml | /SMS/servlet/DeptList.do?func=0 |
|帳號管理|DeptListController.java | /servlet/DeptList.do |
|帳號管理 -> 修改帳號|AccountAdmin.jsp | /SMS/servlet/AccountPolicy.do |
|帳號管理(修改帳號)|AccountPolicyController.java|/SMS/NewAccount.jsp|
|帳號管理(線上查詢)|NewAccount.jsp|/SMS/servlet/AccountLog.do|
|帳號管理(線上查詢)|AccountLog.jsp|/SMS/servlet/AccountLog.do|
|帳號管理(線上查詢)|AccountLogController.java|/servlet/AccountLog.do|
|帳號管理(記錄下載)|AccountLog.jsp|/SMS/servlet/QryLogServlet|
|簡訊發送，預覽發送|System_Service.cfgBean.xml | /SMS/RealSend.jsp |
|簡訊發送，預覽發送|RealSend.jsp|onClick="checkData('<%=((String)session.getAttribute("userRights")).substring(0, 1)%>')">發送|
|簡訊發送，預覽發送|RealSend.jsp | doSmsSend(); |
|簡訊發送，預覽發送|RealSend.jsp|document.RealSend.submit();|
|簡訊發送，預覽發送|RealSend.jsp|/SMS/servlet/RealSend.do|
|簡訊發送，預覽發送|RealSendController.java|QueryUserPoint.do|
|簡訊發送，預覽發送|RealSendController.java|RealSendPreview.jsp|
|簡訊發送，預覽發送|RealSendPreview.jsp|onClick="chkData()">送出|
|簡訊發送，預覽發送|RealSendPreview.jsp|/SMS/servlet/Preview.do|
|簡訊發送，預覽發送|PreviewController.java|/servlet/Preview.do|
|簡訊發送，預覽發送|BulkSendController.java|/servlet/BulkSend.do|
|批次檔發送|System_Service.cfgBean.xml|/SMS/SmsSendBulk.jsp|
|批次檔發送|SmsSendBulk.jsp|/SMS/GetFile.jsp|
|批次檔發送|GetFile.jsp|/SMS/servlet/FileSend.do|
|批次檔發送|FileSendController.java|/servlet/FileSend.do|
|批次檔發送|FileSendController.java|/SMS/Preview.jsp|
|批次檔發送|Preview.jsp|chkData()|
|批次檔發送|Preview.jsp|doSmsSend()|
|批次檔發送|Preview.jsp|/SMS/servlet/Preview.do|
|批次檔發送|PreviewController.java|/servlet/Preview.do|
|批次檔發送|PreviewController.java|/SMS/servlet/BulkSend.do|
|批次檔發送|BulkSendController.java|/servlet/BulkSend.do|
|變數檔發送|System_Service.cfgBean.xml|/SMS/SmsSendBulk.jsp|
|變數檔發送|SmsSendBulk.jsp|/SMS/GetFile.jsp|
|變數檔發送|GetFile.jsp|/SMS/servlet/CutVarFiled.do|
|變數檔發送|CutVarFiledController.java|/servlet/CutVarFiled.do|
|變數檔發送|CutVarFiledController.java|/SMS/VariableSend.jsp|
|變數檔發送|VariableSend.jsp|chkData()|
|變數檔發送|VariableSend.jsp|/SMS/servlet/VariableSend.do|
|變數檔發送|VariableSendController.java|/servlet/VariableSend.do|
|新增連絡人|RealSend.jsp|/SMS/servlet/ContactServlet.do|
|新增連絡人|ContactServletController.java|ContactServlet.do|

## Dao
|Controller| File | Method| Note|
|---|---|---|---|
|RealSendController|SmsCustParameterDAO.java|insertSmsCustPatmeter|批次新增使用者的發送資料|
|RealSendController|SmsCustParameterDAO.java|getAllSmsCustParameter|取得使用者所有的發送資料|
|QueryUserPointController|SmUserDAO.java|getUserResSubmits|取得剩餘點數|
|BulkSendController|BulkSendDAO.java|execSpWebSmSendBulk2|多筆簡訊發送|
|ContactServletController|ContactDAO.java|getQueryContactServletSQLString|取得查詢通訊錄的SQL語法|



