# �W��(scsb)

## API
### �����d��
| �ɮ� | ��m |
|---|---|
|System_Service.cfgBean.xml | /SMS/QryUploLog.jsp |
|QryUploLog.jsp | a href="#" onclick="checkData(3)">����d�� |
|QryUploLog.jsp | urlStr = "/SMS/servlet/QryLog.do?t=<%=System.currentTimeMillis() + session.getId()%>" |
|QryLogController.java|/servlet/QryLog.do|

### �b���޲z->�����d��
* �i���޲z -> �b���޲z -> �}�l�d�� -> �ק�b��(�I����N�@����ƶi�J�e��) -> �o�e����

|�ɮ�|��m|
|---|---|
|AccountLogController.java|/servlet/AccountLog.do|


### ²�T�o�e�A�w���o�e
| �ɮ� | ��m |
|---|---|
|System_Service.cfgBean.xml | /SMS/RealSend.jsp |
|RealSend.jsp|onClick="checkData('<%=((String)session.getAttribute("userRights")).substring(0, 1)%>')">�o�e|
|RealSend.jsp | doSmsSend(); |
|RealSend.jsp|document.RealSend.submit();|
|RealSend.jsp|/SMS/servlet/RealSend.do|
|RealSendController.java|QueryUserPoint.do|
|RealSendController.java|RealSendPreview.jsp|
|RealSendPreview.jsp|onClick="chkData()">�e�X|
|RealSendPreview.jsp|/SMS/servlet/Preview.do|
|PreviewController.java|/servlet/Preview.do|
|BulkSendController.java|/servlet/BulkSend.do|

### �妸�ɵo�e
| �ɮ� | ��m |
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

### �ܼ��ɵo�e
| �ɮ� | ��m |
|---|---|
|System_Service.cfgBean.xml|/SMS/SmsSendBulk.jsp|
|SmsSendBulk.jsp|/SMS/GetFile.jsp|
|GetFile.jsp|/SMS/servlet/CutVarFiled.do|
|CutVarFiledController.java|/servlet/CutVarFiled.do|
|CutVarFiledController.java|/SMS/VariableSend.jsp|
|VariableSend.jsp|chkData()|
|VariableSend.jsp|/SMS/servlet/VariableSend.do|
|VariableSendController.java|/servlet/VariableSend.do|

### �s�W�s���H
| �ɮ� | ��m |
|---|---|
|RealSend.jsp|/SMS/servlet/ContactServlet.do|
|ContactServletController.java|ContactServlet.do|

## Dao
### RealSendController
| File | Method| Note|
|---|---|---|
|SmsCustParameterDAO.java|insertSmsCustPatmeter|�妸�s�W�ϥΪ̪��o�e���|
|SmsCustParameterDAO.java|getAllSmsCustParameter|���o�ϥΪ̩Ҧ����o�e���|

### QueryUserPointController
| File | Method| Note|
|---|---|---|
|SmUserDAO.java|getUserResSubmits|���o�Ѿl�I��|

### BulkSendController
| File | Method| Note|
|---|---|---|
|BulkSendDAO.java|execSpWebSmSendBulk2|�h��²�T�o�e|

### ContactServletController
| File | Method| Note|
|---|---|---|
|ContactDAO.java|getQueryContactServletSQLString|���o�d�߳q�T����SQL�y�k|