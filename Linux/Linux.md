# Linux install

## _step1: install WSL_
* open the PowerShell or cmd and work command line ``` wsl --install```
* username: arno
* password: 86136982

�ƻs�� /opt ���U

maven
https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.5.2/
sudo cp /mnt/d/Program\ Files/maven/apache-maven-3.6.0.tar /opt/

MAVEN_HOME=/opt/apache-maven-3.6.0
PATH=${MAVEN_HOME}/bin:$PATH
export MAVEN_HOME PATH

jdk
https://gist.github.com/wavezhang/ba8425f24a968ec9b2a8619d7c2d86a6?permalink_comment_id=5031863
sudo cp /mnt/c/Users/arno/Desktop/JDK/OpenJDK8U-jdk_x64_linux_8u232b09.tar.gz /opt/


Server-gw
com.mitake.common jar
install ����
1. msgserver-gw-mms-drhook
2. server-gw-oauth


channel common 1.1
deliver common 1.1 �ݽT�{
��l���� 1.0

�A�� -------------->
arno@SMS-14:/etc/systemd/system$

sudo systemctl daemon-reload

sudo systemctl restart msgserver-backend-mms-deliverReportGroup-main.service
sudo systemctl start msgserver-backend-mms-deliverReportGroup-main.service
sudo systemctl stop msgserver-backend-mms-deliverReportGroup-main.service

# ���O
*******************************************
���իإߦU�ؤH���A�s���v��
ap �u��ҰʡA�����A���ҵ{��
opd�Bad ���\�� 
ad�s�� �i��g�A���i����A��*************************************
sudo setfacl -R -m g:grp_ops_ad:rwx /etc/systemd/system
sudo setfacl -m d:g:grp_ops_ad:rwx /etc/systemd/system
ad�s�� �i��g�A���i����A��*************************************
grp_ap�s�� ���i��g�A�i����A��*************************************
sudo setfacl -R -m g:grp_ap:rx /etc/systemd/system
sudo setfacl -m d:g:grp_ap:rx /etc/systemd/system
sudo /usr/sbin/visudo
%grp_ap ALL = /bin/systemctl
grp_ap�s�� ���i��g�A�i����A��*************************************
�d���v�� ***************************
getfacl /etc/systemd/system
�d���v�� ***************************
�����v�� ***************************
sudo setfacl -R -x g:grp_ops_ad /etc/systemd/system
�����v�� ***************************
home �v��**************************
sudo setfacl -R -m g:grp_ap:rwx /home
sudo setfacl -m d:g:grp_ap:rwx /home
home �v��**************************
sudo setfacl -R -m g:grp_ap:rwx /home/smsc/.m2/Server
sudo setfacl -m d:g:grp_ap:rwx /home/smsc/.m2/Server
sudo setfacl -R -m:u:arno:rwx /mnt/d/wsl
sudo setfacl -m d:u:arno:rwx /mnt/d/wsl
��w�]�v��
sudo setfacl -b /etc/systemd/system
�޲z���d��jmap
sudo /opt/java8_412/bin/jmap -heap
�d�ݷ�e���檺.jar
ps -ef|grep .jar
�b WSL �� /etc/wsl.conf ��󤤡A�i�H?�m�O�_�n?�J Windows ��?�C�K�[�H�U?�e�i�H���� WSL ?�J Windows PATH�G
sudo vi /etc/wsl.conf
[interop]
appendWindowsPath = false
��systemd log
vi /var/log/system
Shitf+g : �̫�@��
Terminal
wsl
mount
sudo shutdown -h now
my user
cmd wsl --shutdown
//�� .sh ��
sudo dos2unix

�d�ݵ{��
ps -eo user,pid,cmd
## MMS�]�����D
deliver -> Sender
drQuerier -> Sender
drHook -> Sender
drhookreport -> Sender

server-backend -> Server �̭����]�t(Sender)
server-gw -> Server

apigw -> MMS ApiGW

channel


drHook -> backend-mms-common 1.0
drHook-fet -> msgserver-backend-mms-drhookserver.version 1.0
drHook-fet -> msgserver-backend-mms-deliver-connect-fet 1.0
drHook-tai -> msgserver-backend-mms-drhookserver.version 1.1
drHook-tai -> msgserver-backend-mms-deliver-connect-tai 1.0
drHook-cht -> msgserver-backend-mms-deliver-connect-cht 1.0

drQuerier -> backend-mms-common 1.0

channel-msgchannel-main -> com.mitake.common.version 1.1
channel-msgchannel-main -> com.mitake.channel-gw-oauth.version 1.0




deliverReporter
msgserver-backend-mms-deliverReporter -> msgserver-backend-mms-common version:0.0.1-SNAPSHOT //2022�~??  X
drreporter
msgserver-backend-mms-drReporter -> msgserver-backend-mms-common version:0.0.1-SNAPSHOT //2022�~??  X
history
msgserver-backend-mms-history -> msgserver-backend-mms-common version:0.0.1-SNAPSHOT //2022�~??  X

redeliver  
msgserver-backend-mms-redeliver -> msgserver-backend-mms-common version:0.0.1-SNAPSHOT //2022�~??
�o�]�� version:0.0.1-SNAPSHOT �|build���ѡA�n�אּ1.0


*.�إ� AP Log ��Ƨ�
sudo mkdir -p /log/MmsAP
*.�ᤩ�v��
sudo chmod -R 777 /log/MmsAP