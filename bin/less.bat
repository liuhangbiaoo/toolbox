@echo off
set /p pn=请输入项目名称:
lessc  ../src/less/%pn%.less  ../src/css/%pn%.css
