# Linux install

## _step1: install WSL_
* open the PowerShell or cmd and work command line ``` wsl --install```
* username: arno
* password: 86136982

複製到 /opt 底下

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
install 順序
1. msgserver-gw-mms-drhook
2. server-gw-oauth


channel common 1.1
deliver common 1.1 待確認
其餘都為 1.0

服務 -------------->
arno@SMS-14:/etc/systemd/system$

sudo systemctl daemon-reload

sudo systemctl restart msgserver-backend-mms-deliverReportGroup-main.service
sudo systemctl start msgserver-backend-mms-deliverReportGroup-main.service
sudo systemctl stop msgserver-backend-mms-deliverReportGroup-main.service

# 指令
*******************************************
測試建立各種人員，群組權限
ap 只能啟動，關閉，重啟程式
opd、ad 全功能 
ad群組 可改寫，不可執行服務*************************************
sudo setfacl -R -m g:grp_ops_ad:rwx /etc/systemd/system
sudo setfacl -m d:g:grp_ops_ad:rwx /etc/systemd/system
ad群組 可改寫，不可執行服務*************************************
grp_ap群組 不可改寫，可執行服務*************************************
sudo setfacl -R -m g:grp_ap:rx /etc/systemd/system
sudo setfacl -m d:g:grp_ap:rx /etc/systemd/system
sudo /usr/sbin/visudo
%grp_ap ALL = /bin/systemctl
grp_ap群組 不可改寫，可執行服務*************************************
查看權限 ***************************
getfacl /etc/systemd/system
查看權限 ***************************
移除權限 ***************************
sudo setfacl -R -x g:grp_ops_ad /etc/systemd/system
移除權限 ***************************
home 權限**************************
sudo setfacl -R -m g:grp_ap:rwx /home
sudo setfacl -m d:g:grp_ap:rwx /home
home 權限**************************
sudo setfacl -R -m g:grp_ap:rwx /home/smsc/.m2/Server
sudo setfacl -m d:g:grp_ap:rwx /home/smsc/.m2/Server
sudo setfacl -R -m:u:arno:rwx /mnt/d/wsl
sudo setfacl -m d:u:arno:rwx /mnt/d/wsl
砍預設權限
sudo setfacl -b /etc/systemd/system
管理員查看jmap
sudo /opt/java8_412/bin/jmap -heap
查看當前執行的.jar
ps -ef|grep .jar
在 WSL 的 /etc/wsl.conf 文件中，可以?置是否要?入 Windows 路?。添加以下?容可以阻止 WSL ?入 Windows PATH：
sudo vi /etc/wsl.conf
[interop]
appendWindowsPath = false
看systemd log
vi /var/log/system
Shitf+g : 最後一行
Terminal
wsl
mount
sudo shutdown -h now
my user
cmd wsl --shutdown
//轉 .sh 檔
sudo dos2unix

查看程序
ps -eo user,pid,cmd
## MMS包版問題
deliver -> Sender
drQuerier -> Sender
drHook -> Sender
drhookreport -> Sender

server-backend -> Server 裡面不包含(Sender)
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
msgserver-backend-mms-deliverReporter -> msgserver-backend-mms-common version:0.0.1-SNAPSHOT //2022年??  X
drreporter
msgserver-backend-mms-drReporter -> msgserver-backend-mms-common version:0.0.1-SNAPSHOT //2022年??  X
history
msgserver-backend-mms-history -> msgserver-backend-mms-common version:0.0.1-SNAPSHOT //2022年??  X

redeliver  
msgserver-backend-mms-redeliver -> msgserver-backend-mms-common version:0.0.1-SNAPSHOT //2022年??
這包用 version:0.0.1-SNAPSHOT 會build失敗，要改為1.0


*.建立 AP Log 資料夾
sudo mkdir -p /log/MmsAP
*.賦予權限
sudo chmod -R 777 /log/MmsAP