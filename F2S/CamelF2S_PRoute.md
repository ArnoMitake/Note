# P ���Ѵ���
![img.png](image/PRoute.png)

![img_1.png](image/PRoute2.png)

# table����
* SMMOPool 
  * �S�X�s�ճ]�w
* SMMOPoolCycle 
  * �U������X�b�U�S�X�s�դw�o�e����
  * ��ƶq�j
  * ��ƶq��980�U
* SMMOPoolLog
  * �U�S�X+������X �̫�o�e�O��
  * ��ƶq�j
  * ��ƶq��1600�U
* SMMOPoolBack
  * ���V²�T�^�аO��
  * ��ƶq75�U
  * �L�M�z�L����ƾ���

## �}�o�\��
### P���ѻ���
* p���Ѭ�MO�����V²�T(�ثe�u���x�s�b��)
* ���V²�T: �Ȧ�o���Ȥ�²�T�A�Ȥ�^��(�H���`��)
* �i�h�ӯS�X�o�e���@�ӫȤ� (�ثe�h�Ӫ��W����20�A�W�L�N�|�䤣��W���o�e�L�����e)
### P���Ѵ���
* ���g�@�� P7_1_TestMain �����i�H�h .34 �W�� Syslog Monitor ���L�L�Xsp��T
* P7_1_TestMain �n�T�{ groupID�BMID�AMID�i�H���SMMOPool�d�ݹ�����MID
### P���Ѷ}�o
* �bCamelF2S�s�WP7_1�A�u�� groupID like TSBANK% and mid like p% �~�i�J���޿�
* �s�Wsp�A�N�쥻��sp�̭�p���Ѫ��޿�ӧ۹L�h

```
�d�ߥΫ��O
SELECT 'SMMOPool' as '�S�X�s�ճ]�w',* FROM DBexp.dbo.SMMOPool WITH(NOLOCK)
SELECT 'SMMOPoolCycle' as '�U������X�b�U�S�X�s�դw�o�e����',* FROM DBexp.dbo.SMMOPoolCycle WITH(NOLOCK) order by stamp desc
SELECT 'SMMOPoolLog' as '�U�S�X+������X �̫�o�e�O��',* FROM DBexp.dbo.SMMOPoolLog WITH(NOLOCK)
SELECT 'SMMOPoolBack' as '���V²�T�^�аO��',* FROM DBexp.dbo.SMMOPoolBack WITH(NOLOCK)

SELECT 'SMServerBulk',* FROM SMDR.dbo.SMServerBulk WITH(NOLOCK)

SELECT 'SourceRedundantMIDConfig',* FROM DBexp.dbo.SourceRedundantMIDConfig WITH(NOLOCK)

SELECT * FROM DBexp.dbo.CamelF2SGroupIDConfig WITH(NOLOCK)

SELECT * FROM DBexp.dbo.MidSMSourConfig WITH(NOLOCK) WHERE Note like '�x�s%' or Note like '%�x�s%' or Note like '%�x�s'
or Note like '%P����%'

SELECT * FROM DBexp.dbo.SMGroupRoute WITH(NOLOCK) WHERE GroupID LIKE 'TSBANK%'
SELECT * FROM DBexp.dbo.SMUser WITH(NOLOCK) WHERE GroupID LIKE 'TSBANK%'

--���Ʒ��]�w������0�Amid�̫᭱�|�۰ʱa�JX
SELECT * FROM DBexp.dbo.SourceRedundantMIDConfig WITH(NOLOCK)
--UPDATE DBexp.dbo.SourceRedundantMIDConfig SET SourceRedundantMIDFlag = 1 WHERE SourceNC = '92'

--SMMO MO���V����
SELECT top (2) * FROM DBexp.dbo.SMMO WITH(NOLOCK) ORDER BY Stamp DESC
--�����ջݭn��ʷs�W���
--���ݭn����SMMOPoolLog mid = '17218' and dstno = '0900612345'
-- (MID,DestNo) �o������ۦP�AMsgID�ۭq(���୫��) 
--INSERT DBexp.dbo.SMMO (Stamp, MID, MsgID, SrcNo, DestNo, MsgData) VALUES (CONVERT(VARCHAR, GETDATE(), 120), '17218', '20240723020912', '0900612345', '17218', 'P����MO���V����2')
```

## 20240819 p����bug(���z���S���Ǧ^���G��)
* Sp_CamelF2S_PRoute �� result set �S���^�ǭȡADao �o�g�k(ResultSet rs = cs.executeQuery();)�|�y���S�����G������
