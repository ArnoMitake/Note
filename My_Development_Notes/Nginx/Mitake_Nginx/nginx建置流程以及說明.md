# nginx�ظm�y�{�H�λ���

## [�M�׬[�c����]
* nginx_server�G�u�WNginx Server��conf�ɡBSSL pem�ɡB���VSSL pem�ɡBbat�ɡC
    * �����A�ȡA�i�Ѿ\ nginx.zip �̭���conf��
* origin_cer�G���ϥ�SSL���V���Ҫ��Ȥ�A��l������
    * aexp �G����B�q���VSSL���Ҿ�����
    * avon �G�������VSSL���Ҿ�����
    * tmnewa�G�s�w�F�ʮ��W���VSSL���Ҿ�����

##�@[�u�W�t�m���һ���]
* Nginx�����G1.12.1 ( windows�� )
* �{����m�G�@��b C:/nginx_server �U��
* �u�W����
    * �h�L�G192.168.2.95, 192.168.2.96
    * �T���G192.168.131.1, 192.168.131.2

## [�p��ظm Nginx Server]
* ���ƻs���s Nginx 1.12.1�����ܷs�M�ץؿ��A�Ҧp�G�iC:/nginx_server/nginx-1.12.1-NewServer�j
* �վ�����ɦW�١A�Ҧp�G�i nginx_NewServer.exe�j�A��K�b�u�@�޲z���ϧO�O�_�w�Ұ�
* �ƻs�H�U���O�ɦܱM�ץؿ��A�ô����Ҧ��ɮפ��������ɦW�٬��i�B�J 2�j���s�W��
```
   start-nginx.bat�G�Ұ� nginx server
   stop-nginx.bat�G���� nginx server
   reload-nginx.bat�G�ϱo nginx server ���sŪ�� conf �]�w
   reopen-nginx.bat�G�ϱo nginx server �� log �ɮ�
   split_log.bat�G���� nginx �ɮסA�аѾ\�i�ɮפ��λ����j�C
```
* ��s / ���� conf �]�w�ɤ��e ( conf�ؿ��U��nginx.conf )
* ���� start-nginx.bat�A�ýT�{�H�U�ƶ�
    * logs�ؿ��U���`���� nginx.pid
    * �d��logs/error.log�A�S�����~�T���A�B����ܡisignal process started�j
    * �T�{�u�@�޲z���O�_���{��������(�p��)
      ![](�Ϥ�/n1.jpg)
    * �ϥλy�k�G```�inetstat -an | find "port�W��"�j```�A�T�{�A��port�w���T��ť

## [�ӷ�IP���һ���]
* X-Forwarded-For���Y�����G
* �]��nginx�i��ϦV�N�z�ɡA�Q�N�z�����A���ݨӷ�IP��m�|�ܦ�nginx server�D���Ҧb��IP�A�Ӥ��O�Ȥ�ݭ�l���ӷ�IP�A�ҥH�����bnginx��location�϶��A�]�w�iX-Forwarded-For�j���Y�C
* �d�Ҧp�U�G
```
location / {	
	        default_type text/plain;
			proxy_pass http://xxx.com;
			proxy_redirect     off;
			proxy_http_version 1.1;
			proxy_set_header Connection "";
			proxy_set_header        Host            $host;
	        proxy_set_header        X-Real-IP       $remote_addr;
	        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;		
       }
```
* NGINX SERVER �]�w�ӷ�IP�զW��G
* ���O�p�G�Q�N�z�����A���A���|�۰ʨϥΡiX-Forwarded-For�j���Y�����ӷ�IP�A���O�S���������Ҩӷ�IP�����n�ɡA�h�����אּ�b nginx server ��ʳ]�w�ӷ�IP�զW��( �ϥΥզW��O�o�̫ᥲ���[�Jdeny all�A�ϱo���b�W�椺�w�]�T��X�� )�C
* �d�Ҧp�U�G
```
location / {	
	        default_type text/plain;
			allow 111.222.333.444;
			allow 111.222.333.555;
			allow 111.222.333.666;
			deny all;        
			proxy_pass http://xxx.com;	
       }
```
* �p�G�o�{�n���Ҫ��ӷ�IP�L�h���ܡA�i�H�N�Ҧ����n���Ҩӷ�IP��m�W�߬���@�ɮצp�U�G
```
allow 111.222.333.444;
allow 111.222.333.555;
allow 111.222.333.666;
```
* �bnginx �]�w�ɤ��A�h�i�H���include�y�k�A�פJ�~���ɮסG
```
	location / {	
	        default_type text/plain;
			include includes/allow-ips;
			deny all;        
			proxy_pass http://xxx.com;	
       }
```
* �ثe�u�W���ϥΨӷ�IP�զW��]�w��NGINX SERVER��T�p�U
    * FBBANK�I���Ȧ� - Nginx Server �G includes/fbank-ips�ɮפ��A���]�w�Ҧ��i�H�X�ݪ��ӷ�IP�M��

## [�ɮפ��λ���]
* �T�{ nginx.conf�]�w�ɡA�w�վ��ɮ׮榡��gz���Y�ɡA�p�U�d�ҷ|�]�w
  * �ɮצW�١Gaccess.log.gz
  * gzip���Y���šG5
  * �ɮ׷|�ϥΫD�P�B�覡�g�J�ɮ�( 32k�w�Ĥw���άO�Z���W���g�J��1���� )�C
```
		conf�d�ҡG 
		access_log logs/access.log.gz main gzip=5 buffer=32k flush=1m;
```
* �T�{  split_log.bat���A�Ҧ��ɦW�e��r�P�]�w�۲šA�p�U�Ϻ��аO
![](�Ϥ�/n2.jpg)
* �ظm�ƥ���Ƨ��ibak�j��ilogs�j�ؿ��U
* ����  split_log.bat�A�T�{bak�ؿ��U�O�_�����͡A��骺�����ɡi access.yyyy-mm-dd.log.gz �j
* �ϥ�Administrator�����A�ظm�i�C����ɨt�αƵ{�j�A�Ƶ{�]�m���C�ѭ��0�I����A����cmd�y�k���i/c C:/nginx_server/XXX/split_log.bat -1�j�A
* �Ѽ�-1�N��]�w�����ɤ�����e1��A�p�U�Ͻd�ҡC
![](�Ϥ�/n4.jpg)
![](�Ϥ�/n5.jpg)
![](�Ϥ�/n6.jpg)
* �Ƶ{�ظm������A�i�H��ʰ���A���ҬO�_�i���T���ͫe������ɮסC
![](�Ϥ�/n7.jpg)

## [���VSSL���һ���]
* �ϥ� NGINX SERVER ���VSSL���ҡA�ݭn�� nginx.conf �[�J�H�U�ѼơA�ĪG�i�H�Ѧҡi~~NGINX ���VSSL����~~�j(�ڨS���v���i�H��)�A

|�ѼƦW��|����|
|---|---|
|ssl_client_certificate|���w���V�����ɮצ�m�A�̭��i�H�]�t�h�����V����|
|ssl_verify_client|���Ҥ覡�A�i�H�O(on, off, optional, optional_no_ca)�A�Ѿ\ [�x������](https://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_verify_client)|
|ssl_verify_depth|���w�j�M������( certificates chain ) ���`��|

* �]�w�d�Ҧp�U�A��ܨϥ��ɮצ�m�issl/mitake_server.pem�j�i�����V���ҡA���w�j�M������`�׬�5�h�A�B���j�����V���ҡA�u��client�ݦ��n�D���VSSL�{�ҮɡA�~�|�i�J���VSSL���Ҷ��q�C
```
ssl_client_certificate ssl/mitake_server.pem;
	ssl_verify_client optional;
	ssl_verify_depth 5;
```
* �p�G�n�baccess.log���A�O���Ȥ�ШD�����V���Ҭ�����T���ܡA�ݭn�վ�]�w�� log_format �p�U�A�[�J$ssl_client_verify�B$ssl_client_i_dn�B$ssl_client_raw_cert�A�i�H�baccess.log�K�[���Ҭ�����T
```
log_format main '$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent" $http_x_forwarded_for | $ssl_client_verify | $ssl_client_i_dn';
```
![](�Ϥ�/n8.jpg)
* �ثe�u�W���ϥ����VSSL�]�w��NGINX SERVER��T�p�U
  * B2C���x - Nginx Server �G �����ɮפ��]�t�i����B�q�j�H�Ρi�s�w�F�ʮ��W�j�����V���Ҿ�����C
  * AVON ���� - Nginx Server�G�����ɮפ��]�t�i���ڡj�����V���Ҿ�����C

## [�s�@���VSSL���Ҿ�����]
* nginx�ϥΪ����VSSL���Ҿ����ɮסA�ݭn�ϥ�PEM�榡�A�q�`�̾ڥH�U��ت��p�����ɮ�
  * �ϥΤw�g�L�ĤT�����Ҫ��X����� �G�Y�O�n�����w�g�L�ĤT��{�Ҫ����ҡA�i�̷ӥH�U�B�J����
    * �˵������ɮ׮榡�A�Y�Ocer�i�H��������ɦW��pem�A ��l�h�ݭn�ഫ��PEM�榡
    * �Y�����~����( �p�U�� )�A�����N���������( ROOT�B���~ )�A����b�ɮפ�
    ![](�Ϥ�/n9.jpg)
  * �ϥΦ�ñ���� �G�Y�O�A�ȭn�����ۤv��SSL���ҡA�i�̷ӥH�U�B�J����
    * �i�ϥΡiKeyStore Explorer�j���} .jks�ɮ�
    ![](�Ϥ�/n10.jpg)
    * �b�˵����Ҹ�T�����A��ܡiPEM�j�öץX�ɮקY�i
    ![](�Ϥ�/n11.jpg)
  * �Y�O�P�@�A�ȭn�����h�վ��� �G�N�W�zPEM�榡�ɮסA�Τ@��m�b�ۦP�ɮפ��Y�i�A���Ǥ�����