# SQL Agent (SQL�Ƶ{)

## 2024/08/05 �C��H�X�����æW�����ݨD
* ### D:\�u�@�ƶ�\20240805_�C��H�X�����æW�����ݨD
* �ݨD�p�U:
> ![img.png](image/img.png)
* ���ե�sql�p�U:
```
-- �}�o���G�B�T��DB
USE [SMSDB] -- �ۦ����
--�b���B�����í���IP�B�W���n�J�ɶ�
SELECT * FROM dbo.SMUserSuspectList WITH(NOLOCK)
--�s�եN�X�B�����B�Ȥ�W��
SELECT * FROM dbo.SMUser WITH(NOLOCK) where UserName = 'jackliutest'
SELECT * FROM dbo.SMUser2 WITH(NOLOCK) where UserName = 'jackliutest'
--���ݷ~��
SELECT * FROM SYS.dbo.Sales A WITH(NOLOCK)
join SMSDB.dbo.SMUser2 B WITH(NOLOCK) ON A.EmpNo = B.SalesPerson

--�����(���R��)
--update SMSDB.dbo.SMUser2 set SalesPerson = 99999 where UserName = 'jackliutest'
--insert into SYS.dbo.Sales (EmpNo, EmpDept, EmpName) values (99999, 99999, 'jackliutest')

--�ЫؼȦs��(���ե�)
CREATE TABLE #TEST (
    CreateStamp DATETIME
);
--�g�J���ƾ�
INSERT INTO #TEST (CreateStamp)
VALUES 
    ('2024-01-01 10:00:00'),
    ('2024-01-02 11:00:00'),
    ('2024-01-02 15:00:00'),
    ('20��24-08-05 00:00:00'),
    ('2024-08-05 23:59:59'),
    ('2024-08-05 12:00:00');
--�ŧi�ܼ�
Declare @startTime19 char(19), @endTime19 char(19)
--����Ѥ��
select @startTime19=CONVERT(CHAR(10), GETDATE(), 120) +' 00:00:00',@endTime19=CONVERT(CHAR(10), GETDATE(), 120) +' 23:59:59'
--�d�ߵ��G
SELECT * FROM #TEST WITH(NOLOCK) 
WHERE CreateStamp between @startTime19 AND @endTime19
--?���Ȧs��
--DROP TABLE #TEST;
--�d��DB�t�Ϊ�mail�b��
select * FROM msdb.dbo.sysmail_profile with(nolock)
select * FROM msdb.dbo.sysmail_profileaccount with(nolock)
SELECT * FROM msdb.dbo.sysmail_mailitems with(nolock)
exec msdb.dbo.sysmail_help_account_sp
exec msdb.dbo.sysmail_help_profile_sp
--����o�email
exec msdb.dbo.sp_send_dbmail 
					@profile_name	= 'mo',--�o�e��
					@from_address = 'service@mitake.com.tw',
					@recipients = 'arno@mitake.com.tw;miumiu@mitake.com.tw', --�����
					@subject = '�i�G���C��H�X�����æW�����j',  
					@body = @tablehtml,  
					@body_format = 'html'; 		
--�d��mail�o�e���A
SELECT * FROM msdb.dbo.sysmail_allitems
--�d�ݵo�e���G�T��
SELECT * FROM msdb.dbo.sysmail_event_log;
```

