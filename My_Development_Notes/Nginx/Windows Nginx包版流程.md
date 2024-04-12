# Windows Nginx�]���y�{ (�ѦҤT��)

## Step1 ���ҫظm
1. �w��visul studio ���Desktop with C++
![](�Ϥ�/01.png)
2. �w��git�A�᭱��git��bash�Ӱ���]�� https://git-scm.com/download/win
3. �w��strawberryperl https://strawberryperl.com/
4. �w��NASM https://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D
5. �����ܼưt�m
![](�Ϥ�/02.png)

## Step2 �U��nginx�һ�lib
1. nginx souce code https://github.com/nginx/nginx/tags
2. openssl https://github.com/openssl/openssl/releases
3. zlib https://www.zlib.net/
4. pcre https://github.com/PCRE2Project/pcre2/releases

## Step3 �]��
1. �bnginx souce code��Ƨ��U�إ�objs/lib��Ƨ�
2. ���Step2�U����lib���objs/lib���A�p�ϩҥ�
![](�Ϥ�/03.png)
3. �ק� nginx souce code \auto\cc\msvc
   1. �վ�CFLAGS="$CFLAGS -W4" -> CFLAGS="$CFLAGS -W3"
   2. �b�̤W����Ѫ������K�[visul studio������T �H2022�������d�� -> #MSVC 2022 (17.0) cl 19.36�A�ݭn���D��������Native Tools Command Prompt for VS 2022�Ucl -v
   ![](�Ϥ�/04.png)
   3. �ק�NGX_MSVC_VER��visul studio���� NGX_MSVC_VER=19.36
4. �Nauto/configure�ƻs��W�@�h
5. ��git bash�إ�MakeFile�A���O�p�U 
```
./configure --with-cc=cl --builddir=objs --with-debug --prefix= --conf-path=conf/nginx.conf --pid-path=logs/nginx.pid --http-log-path=logs/access.log --error-log-path=logs/error.log --sbin-path=nginx.exe --http-client-body-temp-path=temp/client_body_temp --http-proxy-temp-path=temp/proxy_temp --http-fastcgi-temp-path=temp/fastcgi_temp --http-scgi-temp-path=temp/scgi_temp --http-uwsgi-temp-path=temp/uwsgi_temp --with-cc-opt=-DFD_SETSIZE=4096 --with-pcre=objs/lib/pcre2-10.39 --with-zlib=objs/lib/zlib-1.2.11 --with-http_v2_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_stub_status_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module --with-http_random_index_module --with-http_secure_link_module --with-http_slice_module --with-mail --with-stream --with-openssl=objs/lib/openssl-1.1.1t --with-openssl-opt='no-asm no-tests -D_WIN32_WINNT=0x0501' --with-http_ssl_module --with-mail_ssl_module --with-stream_ssl_module
```
* 4�Ӧa��ݭn�վ�
```
--with-pcre=objs/lib/pcre2-10.39
--with-zlib=objs/lib/zlib-1.2.11
--with-openssl=objs/lib/openssl-1.1.1t
--with-cc-opt=-DFD_SETSIZE=4096
```
6. Build ngninx.exe ��Native Tools Command Prompt for VS 2022 ��nginx\objs ���� ```nmake /f MakeFile``` ���{��build�n
7. �T�{nginx�������Mlib��T ```nginx.exe -v```

�Ѧҳs�� : https://www.youtube.com/watch?v=M-cj-p4rZtU&ab_channel=ADTSolutions