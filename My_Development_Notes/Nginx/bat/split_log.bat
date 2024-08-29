@echo off

REM 檢查參數
set DATEADD=%1
if "%DATEADD%"=="" (
	set DATEADD=0
)

REM 取得日期字串
echo wscript.echo dateadd("d",%DATEADD%,date) >%tmp%\tmp.vbs
for /f %%a in ('cscript //nologo %tmp%\tmp.vbs') do del %tmp%\tmp.vbs&&set yyyymmdd=%%a
for /f "tokens=1,2,3* delims=// " %%i in ('echo %yyyymmdd%') do set YEAR=%%i&set MONTH=%%j&set DAY=%%k
if %MONTH% LSS 9 set MONTH=0%MONTH%
if %DAY% LSS 9 set DAY=0%DAY%
SET DATE_FRM=%YEAR%-%MONTH%-%DAY%
SET DATA_IDX=0

cd /d %~dp0

REM access.log
REM 計算 access.log 流水號
IF EXIST .\logs\bak\access.%DATE_FRM%*.gz (
	For /f "tokens=1" %%a in ('dir .\logs\bak\access.%DATE_FRM%* /b /a-d ^| find /v /c "&#@"') do set DATA_IDX=%%a
)
REM 搬移 access.log 
IF EXIST .\logs\access.log.gz (
   move .\logs\access.log.gz .\logs\bak\access.%DATE_FRM%.%DATA_IDX%.log.gz
)

REM http_api_access.log
REM 計算 http_api_access.log 流水號
IF EXIST .\logs\bak\http_api_access.%DATE_FRM%*.gz (
	For /f "tokens=1" %%a in ('dir .\logs\bak\http_api_access.%DATE_FRM%* /b /a-d ^| find /v /c "&#@"') do set DATA_IDX=%%a
)
REM 搬移 http_api_access.log 
IF EXIST .\logs\http_api_access.log.gz (
   move .\logs\http_api_access.log.gz .\logs\bak\http_api_access.%DATE_FRM%.%DATA_IDX%.log.gz
)

REM https_api_access.log
REM 計算 https_api_access.log 流水號
IF EXIST .\logs\bak\https_api_access.%DATE_FRM%*.gz (
	For /f "tokens=1" %%a in ('dir .\logs\bak\https_api_access.%DATE_FRM%* /b /a-d ^| find /v /c "&#@"') do set DATA_IDX=%%a
)
REM 搬移 https_api_access.log 
IF EXIST .\logs\https_api_access.log.gz (
   move .\logs\https_api_access.log.gz .\logs\bak\https_api_access.%DATE_FRM%.%DATA_IDX%.log.gz
)

reopen-nginx