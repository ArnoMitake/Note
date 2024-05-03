# f2s test process

## Chose one Api�BWeb�B²�T�ֻ� to test this project

## _Step1: ���իe���� (�u�n�`�N�H�U�]�w�Y�i�A�o�eapi�N��F)_
* AppSettings.properties
  1. ```f2s.select.execSpName``` have two mode
     1. ```Sp_CamelF2S_SelectSMSourBulkNew_New``` only for short sms
     2. ```Sp_CamelF2S_SelectSMSourBulkLU``` for long or Unicode sms
  2. This project only check [Partkey]�B[GroupID] data
     1. ```f2s.scam.keyword.verification.groupID.list```
     2. ```f2s.select.partKey```
     3. ```DBexp.dbo.CamelF2SGroupIDConfig``` Can see all settings�Acan create a new row before not find data settings
   
~~~~## Processor_P14
### ���լy�{
1. postman call api
2. GateWay �o�e²�T delphi
3. SpFile2SMServerBulk(�n��s��)�O�o����!!�U������ 
4. f2s �� SMServerBulk_New ���
5. SMSourNew �����
6. �̲׵��G�T�{�o�e���s�� ��:DBexp.UBOTCC

### ���չJ����D
* �إ�route DBexp.CamelF2SGroupIDConfig (�s�W�@���s��)
* �ݭn�վ� NotSendByOrderTimeIntervalSettings (�w�������ɶ��]�w)
* �Ұ�gw
  * conf
    * app.global.groupId = UBOTCC
    * db 34 SMS2 (�O�o�� SMS2.SMUser groupid)
    * DBexp.SMUser �� gw �b�K
    * gw.connector.loc1.groupId = UBOTCC
    * gw.connector.loc1.userName = UBOTCC_GW
    * gw.connector.loc1.groupNum = NTI0ODU0NDg4Nw
* �Ұ�api
  * ��db�Y�i
* SMServerBulk_New �L���
  * GW �ݷ|���� -> Server delphi -> SpFile2SMServerBulk(�̭��� @GroupID �������ҬO�g����)
  
## Processor_4
### ���ն���
* �������լO��²�T�ֻ�(��)����
* DB������T
  * .34 DB: SMS2    
    1. UserName: root�APw: 12345
    2. �T�{ SMUser �� GroupID
  * .34 DB: DBexp
    1. ���@�i��=GroupID(��: MSG)
* AP������T
  1. �T�{ Conf �̭��� ``` GroupID verification GroupID list```�A�P���ձb���� GroupID ���L�ۦP�A�y�{�|����
  2. �o�e�� f2s �� CamelWorkDetailLog �̭��|�����ߧǸ�(serialNo)�A�N���ߺݤw���� 
  3. �� serialNo �h DBexp �T�{ GroupID(��) �����A�P�o�����ժ����e�����Y�i~~~~