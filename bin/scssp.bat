@echo off

::set /p pn=������less�ļ�����(��������׺):

echo ����������Ҫ����scss�ļ�... 

::"scss": "node-sass --output-style -o dist/css src/scss",
::"scss:min": "node-sass --output-style compressed -o dist/css src/scss",

for /r ../src/scss/ %%i in (*.scss) do   call node-sass  %%i  ../src/css/%%~ni.css

for /r ../src/scss/ %%i in (*.scss) do   call node-sass  --output-style  compressed %%i  ../src/css/%%~ni.min.css

echo scss�������  

pause
