# ��~�Ȥ�GW_DR�u�Ƭy

## ���եت�

> Dear Arno
> 
> �������հ�~�Ȥ�GW DR�D�ʦ^���{���A�{��²���y�{�ϽаѦҪ���A
> ����DB�ϥ�36��OFFSHORE_N�ADB�b���ϥεϰ�P�B����OFFSHORE�C
> �n�C���ծרҡC
> 
> OFFSHORE(����)�|�Ψ쪺 table �v���A�n�O��
> 
> git@gitlab01.mitake.com.tw:SMS/gw/camel_pushclient_replier.git
> branch:offshore

## ���դ覡
### Step1. �Ұ� MitakeApi�ADB �]�w�p�U:
> db.ip = 10.99.0.36
> 
> db.port = 1433
> 
> db.user = OFFSHORE
> 
> db.num = MTIzNDU
> 
> db.dbname = OFFSHORE_N
### Step2. �Ұ� GeneralChannel�A�ݽվ�s�աBDB�B�s�ճ]�w�p�U:
* (�]���b�}�o���ұҰ� gw  ���| final statusflag) �u���ʷb�X���A
> app.global.groupId = ARNO
> 
> DB �ѷӲĤ@�I
> 
>  gw.connector.loc1.groupId = ARNO
> 
>  gw.connector.loc1.userName = ARNO_GW
> 
>  gw.connector.loc1.groupNum = NDMxNjQ5MDkyOQ
> 
>  gw.connector.loc1.addrinfo1.ip = 10.99.0.34
> 
>  gw.connector.loc1.addrinfo1.port = 5004
### Step3. �Ұ� Camel_PushClient_Replier �� DR_Main
### Step4. �T�{�S�X�������~�̫��O�p�U:
```
-- �d�ݸs��
--SELECT * FROM DBexp.dbo.SMUser WITH(NOLOCK) WHERE GroupID ='ARNO'

-- �d�ݸs��Route
--SELECT * FROM DBexp.dbo.SMGroupRoute WITH(NOLOCK) WHERE GroupID ='ARNO'

-- �d�� Route �������S�X
SELECT * FROM DBexp.dbo.SMRoute WITH(NOLOCK) WHERE Route ='B2CMix_GN'AND MobileNo LIKE '852%'

--�ݭn�s�W�s�զb�o�]�w���ACamelF2S�|�إ�Route
--SELECT * FROM DBexp.dbo.CamelF2SGroupIDConfig WITH(NOLOCK)

--������� PartKey �T�{�O���x�~�̥i�H��.36�W���ݡA�p�G�S�������i�վ�
SELECT * FROM DBexp.dbo.MidSMSourConfig WITH(NOLOCK) WHERE Mid IN ('TW821','10694','18329')

--�T�{�~�̺ݦ��L�^�Ǹ�T
SELECT * FROM DBexp.dbo.ARNO WITH(NOLOCK)
```
### Step5. �o�e²�T����:
> http://localhost:7313/SmSend?username=arno&password=12345&dstaddr=85236690084&smbody=test_20240620_4&response=http://127.0.0.1:7777/callbackurl
### Step6. �T�{DB.MsgInfo���L���
```
--���U���O�d��
SELECT * FROM OFFSHORE_N.dbo.MsgInfo WITH(NOLOCK) order by SerialNo desc

--�p�G����ơA����Step2.���������final���A
update OFFSHORE_N.dbo.MsgInfo set StatusFlag = '4' where SerialNo = 'A0000000016' AND UserName = 'arno'

--�|�Ψ쪺table
SELECT * FROM OFFSHORE_N.dbo.MsgInfo WITH(NOLOCK) order by SerialNo desc
SELECT * FROM OFFSHORE_N.dbo.MsgDRReply WITH(NOLOCK)
SELECT * FROM OFFSHORE_N.dbo.MsgDRReplyWait_New WITH(NOLOCK)
SELECT * FROM OFFSHORE_N.dbo.MsgDRReplyRetry_New WITH(NOLOCK)
SELECT * FROM OFFSHORE_N.dbo.MsgReply WITH(NOLOCK)
SELECT * FROM OFFSHORE_N.dbo.MsgSourNew WITH(NOLOCK)
```
### Step7. Response url �^��
> �ثe�ۤv�g�b MyProject CamelExample �@�������ݼ����^�Ъ��A

> Table �y�{�AGW�� final �����A�|�� SP0001�ӳB�z(SQL Agent)
> 
> MsgSourRoute -> MsgSour -> MsgSourWork -> MsgInfo

## �y�{��
![](image/��~�Ȥ�GW_DR�u�Ƭy�{��.png)

## Table
> OFFSHORE_N.dbo.MsgDRReply -> ��ƨӷ� dbo.MsgInfo(trigger)�ASourceType='A'
> OFFSHORE_N.dbo.MsgDRReplyWait_New
> OFFSHORE_N.dbo.MsgDRReplyRetry_New

## SP 
> SpMsgDRReplyMatch_HTTP (���XSMPP�ĤG���q�^��) //SQL Server Agent �Ƶ{ (OFFSHORE_N_���X²�T�D�ʪ��ADR�^��_HTTP)
> ```
> �ˬd dbo.MsgDRReply ObjectID <> 'SMPP' 
> �פJ MsgReplyWait_New
> �R�� MsgReply
> ``` 
> SpMsgDRReplyMatch_SMPP (���XSMPP�ĤG���q�^��) //SQL Server Agent �Ƶ{ (OFFSHORE_N_���X²�T�D�ʪ��ADR�^��_SMPP)
> ```
> �ˬd dbo.MsgDRReply ObjectID = 'SMPP' 
> �פJ MsgReplyWait_New
> �R�� MsgReply
> ```
> SpMsgReplyWaitSelect_DR_HTTP
> ```
> �ˬd dbo.MsgDRReplyWait_New ObjectID <> 'SMPP'
> DELETE OUTPUT
> ```
> SpMsgReplyWaitSelect_DR_SMPP
> ```
> �ˬd dbo.MsgDRReplyWait_New ObjectID = 'SMPP'
> DELETE OUTPUT
> ```
