@echo off
%windir%\system32\reg.exe query "HKU\S-1-5-19" >nul 2>&1 || (
echo /!\ Run as administrator /!\
echo.
echo Press any key to continue ...
pause >nul
exit
)
pushd %~dp0
FWUpdLcl64 -FWVER
pause