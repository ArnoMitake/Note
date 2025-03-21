# Ja4-Nginx(加入ja4數位指紋)

## 概要
* build ja4 module to nginx
* build need as follows:
  * [ja4-Nginx](https://github.com/FoxIO-LLC/ja4-nginx?tab=readme-ov-file)
  * [ja4-nginx-module](https://github.com/FoxIO-LLC/ja4-nginx-module)
  * [ja4-openssl](https://github.com/FoxIO-LLC/ja4-openssl)
  * [pcre2-10.44](https://www.linuxfromscratch.org/blfs/view/svn/general/pcre2.html)
  * [zlib-1.3.1](https://github.com/madler/zlib/releases)
  * [MinGW-w64](https://www.mingw-w64.org/)

## step.1 調整 ja4 nginx 目錄
* 入進 ja4-nginx 底下
* 把 clone 下來的 ``ja4-nginx-module`` 覆蓋到 ja4-nginx/ja4-nginx-module
* 回到 ja4-nginx 建立新資料夾 objs/lib
* 把 ja4-openssl、pcre2-10.44、zlib-1.3.1 放到 lib 底下

## step.2 建置 nginx
* 打開 git bash 進入到 ja4-nginx 
* 建立 MakeFile 指令 (確認需要的 lib)
```
./auto/configure --with-debug --with-compat --add-module=./ja4-nginx-module/src --with-pcre=objs/lib/pcre2-10.44 --with-zlib=objs/lib/zlib-1.3.1 --with-openssl=objs/lib/ja4-openssl
```

## step.3 執行 make
* 打開 git bash 進入到 ja4-nginx 
* 執行 ```make```


## 補充
* step 2、3 遇到問題 :
    1. 遇到路徑不正確，進到 MakeFile 裡面調整
    2. 遇到 cc 語法不能執行，檢查這兩種語法能否使用 ```which gcc``` or ```which cc```，不行參考2-1
       2-1. 進到 mingw64\bin 執行
       ```ln -s /d/Tools/mingw64/bin/gcc /d/Tools/mingw64/bin/cc```