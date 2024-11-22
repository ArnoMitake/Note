# f2s test process

## Chose one Api�BWeb�B²�T�ֻ� to test this project

### _Step1: ���իe���� (�u�n�`�N�H�U�]�w�Y�i�A�o�eapi�N��F)_
* AppSettings.properties
  1. ```f2s.select.execSpName``` have two mode
     1. ```Sp_CamelF2S_SelectSMSourBulkNew_New``` only for short sms
     2. ```Sp_CamelF2S_SelectSMSourBulkLU``` for long or Unicode sms
  2. This project only check [Partkey]�B[GroupID] data
     1. ```f2s.scam.keyword.verification.groupID.list```
     2. ```f2s.select.partKey```
     3. ```DBexp.dbo.CamelF2SGroupIDConfig``` Can see all settings�Acan create a new row before not find data settings
* ���Ǹs�ճ]�w�|�g���b sp �̭��ݭn�h�վ�

## �Ъ`�N!!!!!!!!!!!!!!!!!!!!!!!!!!! �ܮe���ѰO
* DBexp SpFile2SMServerBulk �o�̭����s�լO�g���� ���n���s���s�խn�i�h�[

## 2024-09-27 F2S �g�P�ӦW�����
* ������� -> Sp_CamelF2S_InsertJob_LU_20240502
```
IF @GroupID in ('MSG') BEGIN
		-- [�Y������URL] �إ߼Ȧs��ƪ�
		select @tempTime=GETDATE()
		INSERT INTO #SMSourCheckTemp (serialNo) 
			SELECT A.SerialNo 
			FROM @SmServerBulkModel A  
			WHERE A.StatusFlag < '4'
			AND (EXISTS (SELECT 1 FROM dbo.SMSCompanyNew B WITH(NOLOCK) WHERE A.GroupID=B.GroupID AND A.UserName=B.UserName)	-- �s��+�b���s�b�g�P�ӦW��
				OR EXISTS (SELECT 1 FROM dbo.SMSCompanyNew B WITH(NOLOCK) WHERE A.GroupID=B.GroupID AND A.DestCategory=B.Dept)	-- �s��+�����s�b�g�P�ӦW��
				OR EXISTS (SELECT 1 FROM dbo.SMSCompanyNew B WITH(NOLOCK) WHERE A.GroupID=B.GroupID AND B.Dept='' AND B.UserName='')) -- �s�զs�b�g�P�ӦW��
			--AND NOT	EXISTS (SELECT 1 FROM Message_Blocking.dbo.BankWhiteListDestCategory C WITH(NOLOCK) WHERE A.DestCategory=C.DestCategory)	-- �������s�b����r�����զW��
			--AND NOT	EXISTS (SELECT 1 FROM Message_Blocking.dbo.BankWhiteListUserName D WITH(NOLOCK) WHERE A.UserName=D.UserName)	-- �b�����s�b����r�b���զW��
			--AND dbo.RegexIsMatch(A.MsgData,'[a-zA-Z0-9]+\.[a-zA-Z]+|\d+\.\d+\.\d+\.\d+') = 1 -- ²�T���e�i�঳URL
		set @cinsmsourchecktemp=@@RowCount;
		set @einsmsourchecktemp=DateDiff(ms, @tempTime, GetDate())
		IF @cinsmsourchecktemp > 0 BEGIN
			select @tempTime=GETDATE()
			INSERT INTO dbo.SMSourCheckNew (Lno, SerialNo, GroupID, DestCategory, UserName, DestNo, MID, OrderTime, ExpireTime, DelegateTime, SubmitFlag, StatusFlag, StatusTime, MsgType, Priority, ObjectID, ReCount, SmsCount, MsgData) 
				SELECT A.Lno, A.SerialNo, A.GroupID, A.DestCategory, A.UserName, A.DestNo, A.MID, A.OrderTime, A.ExpireTime, A.DelegateTime, A.SubmitFlag, A.StatusFlag, @nowDateTime, A.MsgType, A.Priority, A.ObjectID, 0, 1, A.MsgData 
				FROM @SmServerBulkModel A
				JOIN #SMSourCheckTemp B ON A.SerialNo=B.serialNo 
			set @einsmsourcheck=DateDiff(ms, @tempTime, GetDate())
		END
		
	-- �U�� Sour ���������� java
	branch:�@NoTracer
	https://gitlab02.mitake.com.tw/SMS/server/serverblockproxy/-/tree/NoTracer?ref_type=heads
```
