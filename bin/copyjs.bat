@echo off

echo ����������Ҫ�������ļ�... 

cd ../src/js

set ip=%cd%

cd ../../dist

if not exist js md js

copy %ip%\*.min.js %cd%\js

cd ../

echo �ļ��������  

pause

