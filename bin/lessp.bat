@echo off

::set /p pn=请输入less文件名称(不包含后缀):
::lessc  ../src/less/%pn%.less  ../src/css/%pn%.css

echo 正在搜索需要编译less文件... 

::"less": "lessc  src/less/index.less  dist/css/index.css",
::"less:min": "lessc --compress src/less/index.less  dist/css/index.min.css",

for /r ../src/less/ %%i in (*.less) do   call lessc %%i  ../src/css/%%~ni.css

for /r ../src/less/ %%i in (*.less) do   call lessc --compress %%i  ../src/css/%%~ni.min.css

echo less编译完毕

pause