# Ja4-Nginx(�[�Jja4�Ʀ����)

## ���n
* build ja4 module to nginx
* build need as follows:
  * [ja4-Nginx](https://github.com/FoxIO-LLC/ja4-nginx?tab=readme-ov-file)
  * [ja4-nginx-module](https://github.com/FoxIO-LLC/ja4-nginx-module)
  * [ja4-openssl](https://github.com/FoxIO-LLC/ja4-openssl)
  * [pcre2-10.44](https://www.linuxfromscratch.org/blfs/view/svn/general/pcre2.html)
  * [zlib-1.3.1](https://github.com/madler/zlib/releases)
  * [MinGW-w64](https://www.mingw-w64.org/)

## step.1 �վ� ja4 nginx �ؿ�
* �J�i ja4-nginx ���U
* �� clone �U�Ӫ� ``ja4-nginx-module`` �л\�� ja4-nginx/ja4-nginx-module
* �^�� ja4-nginx �إ߷s��Ƨ� objs/lib
* �� ja4-openssl�Bpcre2-10.44�Bzlib-1.3.1 ��� lib ���U

## step.2 �ظm nginx
* ���} git bash �i�J�� ja4-nginx 
* �إ� MakeFile ���O (�T�{�ݭn�� lib)
```
./auto/configure --with-debug --with-compat --add-module=./ja4-nginx-module/src --with-pcre=objs/lib/pcre2-10.44 --with-zlib=objs/lib/zlib-1.3.1 --with-openssl=objs/lib/ja4-openssl
```

## step.3 ���� make
* ���} git bash �i�J�� ja4-nginx 
* ���� ```make```


## �ɥR
* step 2�B3 �J����D :
    1. �J����|�����T�A�i�� MakeFile �̭��վ�
    2. �J�� cc �y�k�������A�ˬd�o��ػy�k��_�ϥ� ```which gcc``` or ```which cc```�A����Ѧ�2-1
       2-1. �i�� mingw64\bin ����
       ```ln -s /d/Tools/mingw64/bin/gcc /d/Tools/mingw64/bin/cc```