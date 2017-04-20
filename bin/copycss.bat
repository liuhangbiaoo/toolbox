@echo off

echo 正在搜索需要拷贝的文件... 

cd ../src/css

set ip=%cd%

cd ../../dist

if not exist css md css

copy %ip%\*.min.css %cd%\css

cd ../

echo 文件拷贝完毕  

pause

