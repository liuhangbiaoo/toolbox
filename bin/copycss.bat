@echo off

echo ����������Ҫ�������ļ�... 

cd ../src/css

set ip=%cd%

cd ../../dist

if not exist css md css

copy %ip%\*.min.css %cd%\css

cd ../

echo �ļ��������  

pause

