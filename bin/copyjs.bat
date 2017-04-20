@echo off

echo 正在搜索需要拷贝的文件... 

cd ../src/js

set ip=%cd%

cd ../../dist

if not exist js md js

copy %ip%\*.min.js %cd%\js

cd ../

echo 文件拷贝完毕  

pause

