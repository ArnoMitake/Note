# f2s test process

## Chose one Api、Web、簡訊快遞 to test this project

### _Step1: 測試前須知 (只要注意以下設定即可，發送api就行了)_
* AppSettings.properties
  1. ```f2s.select.execSpName``` have two mode
     1. ```Sp_CamelF2S_SelectSMSourBulkNew_New``` only for short sms
     2. ```Sp_CamelF2S_SelectSMSourBulkLU``` for long or Unicode sms
  2. This project only check [Partkey]、[GroupID] data
     1. ```f2s.scam.keyword.verification.groupID.list```
     2. ```f2s.select.partKey```
     3. ```DBexp.dbo.CamelF2SGroupIDConfig``` Can see all settings，can create a new row before not find data settings
* 有些群組設定會寫死在 sp 裡面需要去調整

## 請注意!!!!!!!!!!!!!!!!!!!!!!!!!!! 很容易忘記
* DBexp SpFile2SMServerBulk 這裡面的群組是寫死的 有要測新的群組要進去加

## 2024-09-27 F2S 經銷商名單測試
* 本次改動 -> Sp_CamelF2S_InsertJob_LU_20240502
```
IF @GroupID in ('MSG') BEGIN
		-- [即時驗證URL] 建立暫存資料表
		select @tempTime=GETDATE()
		INSERT INTO #SMSourCheckTemp (serialNo) 
			SELECT A.SerialNo 
			FROM @SmServerBulkModel A  
			WHERE A.StatusFlag < '4'
			AND (EXISTS (SELECT 1 FROM dbo.SMSCompanyNew B WITH(NOLOCK) WHERE A.GroupID=B.GroupID AND A.UserName=B.UserName)	-- 群組+帳號存在經銷商名單
				OR EXISTS (SELECT 1 FROM dbo.SMSCompanyNew B WITH(NOLOCK) WHERE A.GroupID=B.GroupID AND A.DestCategory=B.Dept)	-- 群組+部門存在經銷商名單
				OR EXISTS (SELECT 1 FROM dbo.SMSCompanyNew B WITH(NOLOCK) WHERE A.GroupID=B.GroupID AND B.Dept='' AND B.UserName='')) -- 群組存在經銷商名單
			--AND NOT	EXISTS (SELECT 1 FROM Message_Blocking.dbo.BankWhiteListDestCategory C WITH(NOLOCK) WHERE A.DestCategory=C.DestCategory)	-- 部門不存在關鍵字部門白名單
			--AND NOT	EXISTS (SELECT 1 FROM Message_Blocking.dbo.BankWhiteListUserName D WITH(NOLOCK) WHERE A.UserName=D.UserName)	-- 帳號不存在關鍵字帳號白名單
			--AND dbo.RegexIsMatch(A.MsgData,'[a-zA-Z0-9]+\.[a-zA-Z]+|\d+\.\d+\.\d+\.\d+') = 1 -- 簡訊內容可能有URL
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
		
	-- 下面 Sour 的部分移到 java
	branch:　NoTracer
	https://gitlab02.mitake.com.tw/SMS/server/serverblockproxy/-/tree/NoTracer?ref_type=heads
```
