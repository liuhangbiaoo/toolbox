@echo off

::set /p pn=请输入less文件名称(不包含后缀):

echo 正在搜索需要编译scss文件... 

::"scss": "node-sass --output-style -o dist/css src/scss",
::"scss:min": "node-sass --output-style compressed -o dist/css src/scss",

for /r ../src/scss/ %%i in (*.scss) do   call node-sass  %%i  ../src/css/%%~ni.css

for /r ../src/scss/ %%i in (*.scss) do   call node-sass  --output-style  compressed %%i  ../src/css/%%~ni.min.css

echo scss编译完毕  

pause
