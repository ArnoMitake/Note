# �W��(scsb)

## �u�W DB:SCB_test

## �����d�ߵ��G�B�n�޿�վ�}�o�@�~�B���դ覡
* ���\��D�n�w�� [�u�W�d��]�B[�����U��] �����e�@�B�n�A����Ӧa��
1. ��ƺ��@ -> �����d��
2. �i���޲z -> �b���޲z -> �}�l�d�� -> �d�ߵ��G(��ܤ@����ơA�|���s����) -> �o�e����
* �B�n�\��}���Ѧ� DB:SCB_test -> SMUser2 �̭��� Rights(��25�Ӭ��B�n�\��)

## API
|����| �ɮ� | ��m |
|---|---|---|
|�����d��|System_Service.cfgBean.xml | /SMS/QryUploLog.jsp |
|�����d��|QryUploLog.jsp | a href="#" onclick="checkData(3)">����d�� |
|�����d��|QryUploLog.jsp | urlStr = "/SMS/servlet/QryLog.do?t=<%=System.currentTimeMillis() + session.getId()%>" |
|�����d��|QryLogController.java|/servlet/QryLog.do|
|�O���U��|System_Service.cfgBean.xml | /SMS/QryUploLog.jsp |
|�O���U��|QryUploLog.jsp | a href="#" onclick="checkData(2)">�O���U�� |
|�O���U��|QryUploLog.jsp | url:"/SMS/servlet/QryLogServlet" //������ -> /SMS/incSplitRecordFile.jsp|
|�O���U��|QryLogServlet.java|doGet|
|�b���޲z|System_Service.cfgBean.xml | /SMS/servlet/DeptList.do?func=0 |
|�b���޲z|DeptListController.java | /servlet/DeptList.do |
|�b���޲z -> �ק�b��|AccountAdmin.jsp | /SMS/servlet/AccountPolicy.do |
|�b���޲z(�ק�b��)|AccountPolicyController.java|/SMS/NewAccount.jsp|
|�b���޲z(�u�W�d��)|NewAccount.jsp|/SMS/servlet/AccountLog.do|
|�b���޲z(�u�W�d��)|AccountLog.jsp|/SMS/servlet/AccountLog.do|
|�b���޲z(�u�W�d��)|AccountLogController.java|/servlet/AccountLog.do|
|�b���޲z(�O���U��)|AccountLog.jsp|/SMS/servlet/QryLogServlet|
|²�T�o�e�A�w���o�e|System_Service.cfgBean.xml | /SMS/RealSend.jsp |
|²�T�o�e�A�w���o�e|RealSend.jsp|onClick="checkData('<%=((String)session.getAttribute("userRights")).substring(0, 1)%>')">�o�e|
|²�T�o�e�A�w���o�e|RealSend.jsp | doSmsSend(); |
|²�T�o�e�A�w���o�e|RealSend.jsp|document.RealSend.submit();|
|²�T�o�e�A�w���o�e|RealSend.jsp|/SMS/servlet/RealSend.do|
|²�T�o�e�A�w���o�e|RealSendController.java|QueryUserPoint.do|
|²�T�o�e�A�w���o�e|RealSendController.java|RealSendPreview.jsp|
|²�T�o�e�A�w���o�e|RealSendPreview.jsp|onClick="chkData()">�e�X|
|²�T�o�e�A�w���o�e|RealSendPreview.jsp|/SMS/servlet/Preview.do|
|²�T�o�e�A�w���o�e|PreviewController.java|/servlet/Preview.do|
|²�T�o�e�A�w���o�e|BulkSendController.java|/servlet/BulkSend.do|
|�妸�ɵo�e|System_Service.cfgBean.xml|/SMS/SmsSendBulk.jsp|
|�妸�ɵo�e|SmsSendBulk.jsp|/SMS/GetFile.jsp|
|�妸�ɵo�e|GetFile.jsp|/SMS/servlet/FileSend.do|
|�妸�ɵo�e|FileSendController.java|/servlet/FileSend.do|
|�妸�ɵo�e|FileSendController.java|/SMS/Preview.jsp|
|�妸�ɵo�e|Preview.jsp|chkData()|
|�妸�ɵo�e|Preview.jsp|doSmsSend()|
|�妸�ɵo�e|Preview.jsp|/SMS/servlet/Preview.do|
|�妸�ɵo�e|PreviewController.java|/servlet/Preview.do|
|�妸�ɵo�e|PreviewController.java|/SMS/servlet/BulkSend.do|
|�妸�ɵo�e|BulkSendController.java|/servlet/BulkSend.do|
|�ܼ��ɵo�e|System_Service.cfgBean.xml|/SMS/SmsSendBulk.jsp|
|�ܼ��ɵo�e|SmsSendBulk.jsp|/SMS/GetFile.jsp|
|�ܼ��ɵo�e|GetFile.jsp|/SMS/servlet/CutVarFiled.do|
|�ܼ��ɵo�e|CutVarFiledController.java|/servlet/CutVarFiled.do|
|�ܼ��ɵo�e|CutVarFiledController.java|/SMS/VariableSend.jsp|
|�ܼ��ɵo�e|VariableSend.jsp|chkData()|
|�ܼ��ɵo�e|VariableSend.jsp|/SMS/servlet/VariableSend.do|
|�ܼ��ɵo�e|VariableSendController.java|/servlet/VariableSend.do|
|�s�W�s���H|RealSend.jsp|/SMS/servlet/ContactServlet.do|
|�s�W�s���H|ContactServletController.java|ContactServlet.do|

## Dao
|Controller| File | Method| Note|
|---|---|---|---|
|RealSendController|SmsCustParameterDAO.java|insertSmsCustPatmeter|�妸�s�W�ϥΪ̪��o�e���|
|RealSendController|SmsCustParameterDAO.java|getAllSmsCustParameter|���o�ϥΪ̩Ҧ����o�e���|
|QueryUserPointController|SmUserDAO.java|getUserResSubmits|���o�Ѿl�I��|
|BulkSendController|BulkSendDAO.java|execSpWebSmSendBulk2|�h��²�T�o�e|
|ContactServletController|ContactDAO.java|getQueryContactServletSQLString|���o�d�߳q�T����SQL�y�k|



