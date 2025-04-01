# �����u�@��x

## 2023/03/01 �J¾

### 2023 3~4��

#### [���׻Ȧ�]���y���x²�TAPI�}�o�@�~
**�}�o���� Gateway �^��²�T�^�Ф��e (MO)�A�Ѧ� draw.io (���ץD�ʦ^���t�άy�{)**

##### �{���@��
���{���t�d�����óB�z���׻Ȧ� Gateway ²�T API �� MO�]Mobile Originated�^�^���A��Τ�^��²�T�ɡA�t�ίॿ�T�����B�O����Ĳ�o����B�z�C

##### �D�n�\��
- **����²�T�^�� (MO)**�G�q²�T�~�̱����Τ�^�Ъ�²�T���e�C
- **�O���P�ʱ�**�G�N�^�Ф��e�O���ܨt�Τ�x�A�H�K������R�C
- **�~���޿�B�z**�G�ھڦ^�Ф��eĲ�o�������B�z�A�Ҧp����T�{�C
- **��Ʀs�x�P�q��**�G�i�N�^�Цs�J��Ʈw�A�γz�L�ƥ��X�ʤ覡�q����L�t�ΡC

##### API �]�p²��
- **Endpoint**: `POST /sms/mo`
- **�ШD�Ѽ�**�G�ӷ�������X�B�^��²�T���e�B�^�Юɶ����C
- **�B�z�y�{**�G���� MO ²�T �� �O����x �� Ĳ�o����B�z�]�p�T�{����^�C

#### �T��²�TAPI²�T�I�����
**���\��Ω�p��ꤺ/���²�T���I�Ʈ��ӡA����ܷ�e�����B�סA�H�K�Τ�x��²�T�o�e�����C**

##### �{���޿軡��
1. **�P�_²�T�ϰ� (�ꤺ/��~)**
    - **�ꤺ²�T**�G�q�ܸ��X�H `0` �� `886` �}�Y�A�p�O `1` �I/�h�C
    - **���²�T**�G��L��X�A�p�O `3` �I/�h�C

2. **�p��²�T�I��**
    - **�]�t���� (UTF-8 �s�X�A�r���ƻP byte ���פ��P)**
        - `70` �r�H���G`1` �h²�T `1` �I�C
        - �W�L `70` �r�G�C `67` �r�p `1` �h�A�h�X�����A�[ `1` �h�C
    - **�­^��μƦr (ASCII �s�X)**
        - `160` �r�H���G`1` �h²�T `1` �I�C
        - �W�L `160` �r�G�C `153` �r�p `1` �h�A�h�X�����A�[ `1` �h�C

3. **�^�ǭp�⵲�G**
    - **�`�I�� = (²�T�h��) �� (�ϰ�O�v)**

```java
/**
 * �p��²�T�I��
 *
 * @param mobileNo ������X
 * @param message ²�T���e
 * @return �p��᪺�I��
 * @throws Exception �i��ߥX�����`
 */
public int smsCount(String mobileNo, String message) throws Exception {
    int area = 0;
    int smsCount = 0;
    // �P�_�q�ܸ��X, 0 �}�Y 1 �� (�ꤺ), �� 886 �}�Y 3 �� (��~)
    if (mobileNo.length() > 3) {
        if (mobileNo.charAt(0) == '0' || "886".equals(mobileNo.substring(0, 3))) {
            area = 1;
        } else {
            area = 3;
        }
    } else {
        area = 1;
    }

    if (message != null && !message.isEmpty()) {
        message = message.trim();
        // ���e�O�_�]�t����
        if (message.getBytes("UTF-8").length != message.length()) {
            smsCount = (message.length() > 70) ? (message.length() / 67) + ((message.length() % 67 > 0) ? 1 : 0) : 1;
        } else {
            smsCount = (message.length() > 160) ? (message.length() / 153) + ((message.length() % 153 > 0) ? 1 : 0) : 1;
        }
    }
    return area * smsCount;
}
```

---

#### [����@��]���V²�T�Y�ɦ^�е{���}�o�@�~
**�}�o����@�����V²�T�Y�ɦ^�Х\��A�T�O�Τ�^��²�T��Y�ɳB�z�P�O���A�Ѧ� draw.io (��� MO �D�ʦ^��)**

##### �{���@��
���{���t�d�B�z����@�ػȦ檺���V²�T�^�о���A�T�O�^�Ф��e��Y�ɱ�����Ĳ�o�����~���޿�C

##### �D�n�\��
- **�Y�ɱ��� MO ²�T**�G�T�O²�T�^�Ф��e����Y�ɶi�J�t�ΡC
- **�O���^�Ф��e**�G�N�^�и�T�x�s���Ʈw�A�ѫ�����R�P�l�ܡC
- **Ĳ�o�����~���޿�**�G�ھ�²�T�^�Ф��e����۹������B�z�޿�C
- **�q���t�Τ��������Ҳ�**�G�z�L�ƥ��X�ʾ���A�T�O�����Ҳկ�Y������^�и�T�C

##### API �]�p²��
- **Endpoint**: `POST /sms/reply`
- **�ШD�Ѽ�**�G�ӷ�������X�B�^�Ф��e�B�^�Юɶ����C
- **�B�z�y�{**�G�����^�� �� �O���^�� �� Ĳ�o�����~���޿� �� �q�������t�ΡC

---

### 2023 5��

#### �P�BERP�Ȥ�εo���������
**�w�ɤU����ƨæP�BDB��ơA�Ѧ� draw.io(�P�BERP�Ȥ�εo���������)�AERP: ���~�귽�p��**

**���k**�G�ϥ� FTPS ��ĳ�w�ɨC����������ơA�U���ܥ��a��A�ѪR�ɮרñN��ƦP�B�g�J��Ʈw�]DB�^�C

**�y�{**�G
1. �]�m�w�ɥ��ȡA�C�����qFTP���A���U��ERP�Ȥ�M�o����ơC
2. �ѪR�U�����ɮסA�������n���Ȥ�εo����ơC
3. �N��Ƽg�J���Ʈw�A��{�ƾڪ��Y�ɧ�s�M�P�B�C

---

### 2023 9��

#### ��X�s�¥��~����API�ۮe�ʽվ�
**�ھ��ª��ج[�q��P�s���t���A�Τ@��X�ܷs��API�A�T�O�ۮe�ʡA��ּv�T�C**

**���k**�G
1. **���R�q�嵲�c�t��**�G����ª��P�s�� API ���ШD�P�^���榡�A��X���ݮe�������C
2. **�]�p�ۮe�h**�G�}�o�����h���ഫ�޿�A���ª��q��i�A�t�s�� API�C
3. **�ק� API �欰**�G�ھڻݨD�վ�s�� API�A�Ϩ��ݮe�ª��޿�A�T�O�~�Ȭy�{�����v�T�C
4. **���ջP����**�G�i��^�k���աA�T�O�Ҧ��ª��q��ॿ�T�q�L�s�� API �B�z�C

**�y�{**�G
1. **�����ª� API �ϥα���**�A�T�O�[�\�Ҧ��~�ȳ����C
2. **��I�ഫ�޿�**�A���s�� API �i�B�z�ª��ШD�A�ëO���^���榡�@�P�C
3. **�i���X����**�A�T�O�s�¨t�Υi���Q�B�@�A�L�k�Ϥ��s�«Ȥ᪺�ϥ�����C
4. **�������p**�A�ʱ���x�P���~�^���A�T�Oí�w�B��C  

---

### 2023 10��

#### smpp-gw DLR�y�{�u��
**�D�ʦ^��DLR�A�Ѧ� draw.io(Smpp-gw(dlr �y�{)**
1. �ھ�VIP���u�����Ǧ^��DLR�A�T�O���n���^���u���B�z�C
2. �C��������DLR���i��A�ھ�VIP��i����ýT�w�O�_�ݭn�B�z�Χ�s�C
3. �T�OVIP����s�W�v�A��A�קK����L�[�v�T�^���ǽT�ʡC
4. �b���i�B�z�L�{���A�ˬd�O�_�����`�ο��~�A�ήɶi����~�B�z�M�^���C
5. �Y�J��L�k�Y�ɳB�z�����p�A�N��ƤJ�ݳB�z���C�A�ó]�m�A�����վ���C
6. �w���˵����u��DLR�B�z�y�{�A�T�O�ʯ�Mí�w�ʹF��̨Ϊ��A�C
* ![img.png](�D�ʦ^��DLR.png)

---
### 2023 12��

**CamelF2S�t��**
# �t��²��
�o�O�@��²�T�B�z���x�A�D�n�t�d²�T�������B���ҡB�B�z�M�o�e�C�t�γq�L Apache Camel �ج[�c�ءA���Ѱ��Ī�²�T�B�z�y�{�A�å]�t���`�B�z�M�ʯ�ʱ�����A�T�O²�T�o�e���X�k�ʡB�w���ʩMí�w�ʡC
## �D�n�\��
1. **²�T����**
    - �ˬd²�T�O�_�X�k�A�קK�Ӧ۶¦W�檺²�T�έ��Ƶo�e�����p�C
2. **�L�o����r�P�ˬd�զW��**
    - �ˬd²�T���O�_�]�t�ӷP����r�A�ýT�O²�T�ӦۦX�k���Ȥ�s�ա]�p�զW��^�C
3. **���`�B�z**
    - ��B�z�L�{���o�Ϳ��~�ɡA�t�η|�i�沧�`����A�îھڳ]�w�i����~�B�z�έ��աC
4. **��x�O��**
    - �t�η|�O���C�@�B�B�z�L�{�����ԲӤ�x�A�K�����l�ܩM���D�Ƭd�C
## �t�ά[�c
### �ϥ� Apache Camel �i����ѳ]�p
- **Camel ����**�G�C�ӳB�z�B�J�Q�]�p���@�� `Processor`�A�q�L Camel ���Ѷi��s���C
- **�õo�B�z**�G�ϥ� `seda` ��ĳ�ӹ�{�������C�M�õo�B�z�C
- **���~�B�z**�G�C�ӳB�z�B�J���i�H���򲧱`�öi�����B�z�A�Ҧp���թαN���~�H���o�e����~�B�z���ѡC
### �B�z�y�{
1. **��l�ƳB�z**�G
    - �i��²�T�Ѽƪ��ե��M�ˬd�C
2. **�¦W���ˬd**�G
    - �ˬd²�T����������X�O�_�b�¦W�椤�C
3. **���Ƶo�e�ˬd**�G
    - �ˬd�O�_�s�b�Ȥ�ݭ��Ƶo�e�ۦP²�T�����p�C
4. **�ӷP�r�L�o**�G
    - �ˬd²�T���e�O�_�]�t�ӷP�r�ΫD�k�r�šC
5. **�ɶ��ˬd�P���²�T���d**�G
    - �ھڤ��P���W�h���ˬd²�T�����Ĵ��M���²�T�o�e������C
6. **���~�B�z�P���`����**�G
    - �p�G����B�J�X�{���`�A�t�η|�۰ʶi����~�B�z�A�ñN���~�H���O�����x���C
### �ʯ�ʱ�
- **�p��B�z�ɶ�**�G�C�ӨB�J���B�z�ɶ����|�Q�O���úʱ��C�p�G�Y�ӨB�J�B�z�L���A�t�η|Ĳ�oĵ���H�K�i���u�ơC
- **��x�ŧO**�G�ھڳB�z�ɶ������u�A�t�η|���O�O�� `INFO` �� `ERROR` �ŧO����x�A���U�ʱ��M�u�ƨt�Ωʯ�C
## �`��
�o�Өt�γq�L **Apache Camel** �ӳB�z²�T���o�e�B���ҩM�L�o�C�C�ӳB�z�B�J���g�L��߳]�p�A�åB�]�t�F���~�B�z�M�ʯ�ʱ�����C�o�˪��[�c���ȴ����F²�T�B�z���Ĳv�A�ٽT�O�F²�T���X�k�ʩM�w���ʡA�åB�i�H�H�ɮھڻݭn�i��վ�M�u�ơC

---

### 2024 1~3��

**�����o�e�j�q���T�v�T���TAPI�į� & �U�~�̥洫���**
## �I��
�b�L�h����{���A�ϥ��ª����覡�i���q���J��ơ]batch insert�^�A�o�ؤ覡�b�B�z�j�q�ƾڮɡA�|�ɭP�į�~�V�A�ƦܥX�{��ƥd�����p�C���F�ѨM�o�Ӱ��D�A�ڭ̶i��F�u�ƽվ�A��� **Table-Valued Parameter (TVP)** ���覡�Ӵ��ɮį�A�ðw�惡�i��į���աC
�쥻����q���J�覡�]batch insert�^�|�b�o�e�j�q²�T�ɼv�T���T API ���į�A�åB�y����ƳB�z����C�����{����ƴ��J�ɡA�t�εL�k�ֳt�B�z�j�q��²�T�o�e�ШD�A�ɭP��ƥd��Ϊ��ɶ��L�^���C
### ���D���R
- **�ª��覡�G** ��q���J�ɡA�C���o�e���ݭn�g�L�h�� round-trip�A�o�˷|�ɭP�ʯण�ΡC
- **�v�T�d��G** ��ШD�ƶq�W�[�ɡA�į���D�U�[����A�S�O�O�b��ƳB�z�M�o�e�L�{���C
### �ѨM���
**�u�Ƥ�k�G** �ϥ� **Table-Valued Parameter (TVP)** �i���q��ƳB�z�C
- **TVP ���u�I�G** �i�H�N�j�q�ƾڥH���Φ��@���ʶǻ����s�x�L�{�A�קK�h���I�s�s�x�L�{�A�q�Ӵ����Ĳv�C
- **�įണ�ɡG** �q�L TVP �u�ƫ�A�ƾڳB�z�M���J�Ĳv����۴��ɡA�קK�F��ƥd�����p�A�B�z�t�פj�T�����C
### TVP ��{
1. **�Ы� Table Type**
    ```sql
    CREATE TYPE dbo.MyTableType AS TABLE
    (
        ID INT,
        Name NVARCHAR(50),
        Age INT
    );
    ```
2. **�Ыئs�x�L�{�èϥ� TVP �Ѽ�**
    ```sql
    CREATE PROCEDURE dbo.ProcessTableValuedParameter
        @MyTable dbo.MyTableType READONLY
    AS
    BEGIN
        -- �B�z�ǤJ�� TVP
        SELECT * FROM @MyTable;

        -- ��q���J�ƾ�
        INSERT INTO dbo.YourTable (ID, Name, Age)
        SELECT ID, Name, Age
        FROM @MyTable;
    END;
    ```
3. **�Ȥ�ݶǻ� TVP**
    ```sql
    DECLARE @MyTable dbo.MyTableType;

    INSERT INTO @MyTable (ID, Name, Age)
    VALUES (1, 'John Doe', 30),
           (2, 'Jane Smith', 25);

    EXEC dbo.ProcessTableValuedParameter @MyTable;
    ```
### �u�Ƶ��G
- **�įണ�ɡG** �q�L TVP �覡�A��q���J���į�j�T���ɡA�קK�F�ª��覡���~�V�C
- **í�w�ʴ����G** �u�ƫ�t�ί���B�z��h���ШD�A��ƥd�����D�o�즳�ĸѨM�C
## ����
�ϥ� **TVP** ���覡�u�ƤF���T API ���į�A�ϱo�j�q��ƳB�z����b���u�ɶ��������A�åB�קK�F��ƳB�z�L�{�����d����D�C����|�~��i��į���աA�T�O�t�ί���b��j�W�ҤUí�w�B��C

### 2024 5��

**�妸�B�z�t��**

#### 1. ����SQL Server Agent / Windows Service
- �쥻�̿� SQL Server Agent �� Windows Service �i�檺�妸���ȡA��� Java �Ƶ{�޲z�A���C��S�w���x���̿�C

#### 2. Java �Ƶ{��@
- �z�L Java �Ƶ{����]`ScheduledExecutorService`�BSpring `@Scheduled` �� Quartz�^����w�ɥ��ȡC
- �T�O���Ȫ��i���@�ʡB�X�i�ʡA��������Ĳv�C

#### 3. ��X�ƾڳB�z
- �z�L Java �����P SQL Server �s���A����妸���ȡA�p��ƦP�B�B�M�z�B�έp���C
- �f�t�h�u�{�Χ妸�B�z�޳N�]�p JDBC ��q��s�^�Ӵ��ɮį�C

#### 4. ���~�B�z�P�ʱ�
- �W�[���~�^������A�T�O���`�o�ͮɯ�ֳt�B�z�C
- �O����x�ô��ѳq������A�Ҧp Email�BWebhook �ξ�X�ʱ��t�Ρ]�p Prometheus + Grafana�^�C

#### 5. �u�ƻP�X�i
- �T�O�t�Υ��ӥi�X�i�A��ھڷ~�ȻݨD�F���վ�妸�޿�P�����W�v�C
- �Y�����ֵo�ݨD�A�Ҽ{�ϥΤ��������Ƚիס]�p Apache Camel�BSpring Batch�BQuartz ���s�Ҧ��^�C

---

### 2024 9��

**���H�D�ʦ^��JAVA��**
- **�ª��t�ΡG** �ϥ� Delphi �}�o�A�B�z�Ĳv���C�A���@�x���C
- **�ؼСG** ���c�t�ΡA�N�쥻�� Delphi �{���ର Java �����A�H���ɮį�B�i�X�i�ʤκ��@�ʡC
### �ѨM���
1. **�t�έ��c�G** �N�ª� Delphi �{�����޿��ഫ�� Java �t�ΡA���ʷs�� JAVA �t�ά[�c�C
2. **�޳N��ܡG** �ϥ� Java ���̷s�޳N���u�Ʈį�A��i�t�Υi���@�ʡA�ô���í�w�ʡC
### �u�ƭ��I
- **�įണ�ɡG** Java �����i�H��n�a�B�z���õo�ШD�A�u�ƤF�t�Ϊ�����Ĳv�C
- **�i���@�ʡG** �ϥβ{�N�ƪ� Java �}�o�ج[�A��֤F Delphi �ª��{�������@�����C
- **�X�i�ʡG** �s�t�Χ�e���i��\���X�i�M������L�ҲաC
### ���G
- ���\�N�ª� Delphi �t�έ��c�� Java �t�ΡC
- �t�ήį�í�w�A��B�z��h�õo�ШD�A���ɤF�B��Ĳv�C
- �����F���@�ʡA���ӯ�����F���a�i��\���X�i�C
## ����
�z�L���c�� Java �����A�t�ήį�o����۴��ɡA���@�ʩM�X�i�ʤ]��o�F�ﵽ�C

---
### 2024 10��

**��sCaffeine �O���魭��j�p**
���F���� Caffeine �w�s���O����ϥζq�A�ھڤ��P�� JDK �����BPattern �ƶq�� Domain �ƶq�i��F���աC���ժ��D�n�ت��O�F�Ѥ��P�t�m�U���O����ϥα��p�A���u�ƨt�Ϊ��į�C

### ���յ��G

| NO | JDK���� | Pattern�ƶq | Domain�ƶq | �O����ϥζq (������)     | �Ƶ�                               |
|----|---------|-------------|------------|--------------------------|------------------------------------|
| 1  | JDK8    | 100         | 200        | 11 MB                    | Pattern��256����r, Domain����30   |
| 2  | JDK8    | 100         | 200        | 14 MB                    | Pattern��512�H���^�Ʀr, Domain����30 |
| 3  | JDK8    | 200         | 400        | 11 MB                    | Pattern��256����r, Domain����30   |
| 4  | JDK8    | 200         | 400        | 16 MB                    | Pattern��512�H���^�Ʀr, Domain����30 |
| 5  | JDK8    | 1000        | 2000       | 11 MB                    | Pattern��256����r, Domain����30   |
| 6  | JDK8    | 1000        | 2000       | 38 MB                    | Pattern��512�H���^�Ʀr, Domain����30 |
| 7  | JDK11   | 100         | 200        | 2 MB                     | Pattern��256����r, Domain����30   |
| 8  | JDK11   | 100         | 200        | 1 MB                     | Pattern��512�H���^�Ʀr, Domain����30 |
| 9  | JDK11   | 200         | 400        | 2 MB                     | Pattern��256����r, Domain����30   |
| 10 | JDK11   | 200         | 400        | 1 MB                     | Pattern��512�H���^�Ʀr, Domain����30 |
| 11 | JDK11   | 1000        | 2000       | 1 MB                     | Pattern��256����r, Domain����30   |
| 12 | JDK11   | 1000        | 2000       | 2 MB                     | Pattern��512�H���^�Ʀr, Domain����30 |

### ����

- **JDK8**: �O����ϥζq�۹�����A�ר�O�b�B�z�j�q `Pattern` �M `Domain` �ɡA�O����ϥζq�i�F 38 MB�C
- **JDK11**: �O����ϥζq�j�T���C�A�L�׬O�B�z 100 �� 1000 �� `Pattern` �M `Domain`�A�O����ϥζq�򥻫O���b 1 MB �� 2 MB �����C
- **Pattern**: �H `512 �H���^�Ʀr` �@�� Pattern �ɡAJDK8 ���O���������۰��� JDK11�C

�o�Ǵ��յ��G��ܡAJDK11 �b Caffeine �w�s���O����ϥΤW������u�աC���j�q��ƪ��B�z�AJDK11 ��A�X�Ω��u�ưO����ϥΡC
