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
