# f2s ���լy�{

## Processor_P14
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
  