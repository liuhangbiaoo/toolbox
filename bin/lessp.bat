@echo off

::set /p pn=������less�ļ�����(��������׺):
::lessc  ../src/less/%pn%.less  ../src/css/%pn%.css

echo ����������Ҫ����less�ļ�... 

::"less": "lessc  src/less/index.less  dist/css/index.css",
::"less:min": "lessc --compress src/less/index.less  dist/css/index.min.css",

for /r ../src/less/ %%i in (*.less) do   call lessc %%i  ../src/css/%%~ni.css

for /r ../src/less/ %%i in (*.less) do   call lessc --compress %%i  ../src/css/%%~ni.min.css

echo less�������

pause