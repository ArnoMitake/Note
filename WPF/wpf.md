# WPF

## �����@�ǹL�{
�]���y�{
�睊��-> ���� -> �� install project ���� -> msi ��W 38 -> �� 38 autoupdate.xml ����(���e)

signtool sign /f "path\to\your\certificate.pfx" /p "yourpassword" /t http://timestamp.digicert.com "path\to\your\file.msi"
.\signtool sign /debug /f STAR_mitake_com_tw.pfx /p 861369821306 /fd SHA256 /v smexpress_install.msi
.\signtool sign /debug /f STAR_mitake_com_tw.pfx /p 861369821306 /t http://timestamp.digicert.com smexpress_Setup.msi

.\signtool sign /f wpf.cer /p "86136982" /fd SHA256 /t http://timestamp.digicert.com /v smexpress_install.msi
.\signtool sign /debug /f STAR_mitake_com_tw.pfx /p "861369821306" /fd SHA256 /t http://timestamp.digicert.com /v smexpress_install.msi

"D:\Program Files\SourceTree\c#_Project\���ҶפJ����\SignTool\x64\signtool.exe" sign /f "D:\Program Files\SourceTree\c#_Project\���ҶפJ����\SignTool\x64\mitake.pfx" /p "86136982" /fd SHA256 /t http://timestamp.digicert.com /v "D:\Program Files\SourceTree\c#_Project\WPF\smexpress_wpf\bin\msi\smexpress_wpf.exe"


signtool sign /debug /f mitake.pfx /fd SHA256 smexpress_install.msi
signtool sign /a /fd SHA256 smexpress_install.msi

signtool sign /debug /f mitake.pfx /p 86136982 /fd SHA256 /tr http://timestamp.digicert.com /td SHA256 smexpress_install.msi


C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x64

certmgr.exe -add mitake.pfx -c -s -r localMachine TrustedPublisher

"C:\Program Files (x86)\Windows Kits\10\bin\<version>\x64\certmgr.exe" -add mitake.pfx -c -s -r localMachine TrustedPublisher

[ProgramFiles64Folder][Manufacturer]\[ProductName]


msiexec.exe
C:\Windows\System32

https://www.cnblogs.com/ggll611928/p/17917063.html
