@echo off


rem don't mind this nice way to request admin perms on stackoverflow
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo CLICK YES
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 

:welcome
echo.==================================================================================
echo.		            DWMSuite by Alcatel :D
echo.==================================================================================
echo.
echo.	In the case of a black screen upon reboot you should recover DWM from WinRE.
echo.	You can't use this Batch file in WinRE cuz it doesn't have the "choice" command
echo.	for some reason lmao, just open it in Notepad and copy the section you need
echo.	such as :restore and save as and you will also have to find and replace in 
echo.	Notepad (Ctrl-H) % systemroot %  (no spaces) with your drive letter cuz in 
echo.	WinRE systemroot would be the ramdisk system32
echo.	
echo.	If your language is not American English make sure to find and replace
echo.	en-US with whatever your language code is in this script
echo.	
echo.	Press [1] to backup DWM files
echo.	Press [2] to restore DWM files
echo.	Press [3] to swap DWM files for another version
echo.	Press [4] to disable DWM
echo.	Press [5] to enable DWM
echo.	Press [6] to enable console logon (Win10 logon screen is all black w/o DWM)
echo.	Press [7] to disable console logon
echo.	Press [8] for information
echo.	Press [X] to quit
echo.
echo.==================================================================================
choice /C:12345678X /N /M "Selection: "
if errorlevel 8 goto :help
if errorlevel 7 goto :dcl
if errorlevel 6 goto :ecl
if errorlevel 5 goto :enable
if errorlevel 4 goto :disable
if errorlevel 3 goto :swap
if errorlevel 2 goto :restore
if errorlevel 1 goto :backup


:swap
echo This will bootloop the PC until you fix it in WinRE if Windows doesn't like your DWM. IMPORTANT NOTE: In order to copy the new DWM version, you must put the files in a System32 folder within this directory. This folder can have a en-US subfolder with the MUIs.
/pause
takeown /f %systemroot%\System32\dwm.exe
takeown /f %systemroot%\System32\dwmapi.dll
takeown /f %systemroot%\System32\dwmcore.dll
takeown /f %systemroot%\System32\dwminit.dll
takeown /f %systemroot%\System32\dwmredir.dll
takeown /f %systemroot%\System32\uDWM.dll
takeown /f %systemroot%\System32\en-US\dwm.exe.mui 
takeown /f %systemroot%\System32\en-US\dwmapi.dll.mui
takeown /f %systemroot%\System32\en-US\dwmcore.dll.mui
takeown /f %systemroot%\System32\en-US\dwminit.dll.mui
takeown /f %systemroot%\System32\en-US\dwmredir.dll.mui
takeown /f %systemroot%\System32\en-US\uDWM.dll.mui
takeown /f %systemroot%\System32\en-GB\dwm.exe.mui
takeown /f %systemroot%\System32\en-GB\dwmapi.dll.mui
takeown /f %systemroot%\System32\en-GB\dwmcore.dll.mui
takeown /f %systemroot%\System32\en-GB\dwminit.dll.mui
takeown /f %systemroot%\System32\en-GB\dwmredir.dll.mui
takeown /f %systemroot%\System32\en-GB\uDWM.dll.mui
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwm.exe.mui"
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmapi.dll.mui"
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmcore.dll.mui"
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwminit.dll.mui"
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmredir.dll.mui"
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\uDWM.dll.mui"
mkdir %systemroot%\System32\dwmbackup
move %systemroot%\System32\dwm.exe %systemroot%\System32\dwmbackup
move %systemroot%\System32\dwmapi.dll %systemroot%\System32\dwmbackup
move %systemroot%\System32\dwmcore.dll %systemroot%\System32\dwmbackup
move %systemroot%\System32\dwminit.dll %systemroot%\System32\dwmbackup
move %systemroot%\System32\dwmredir.dll %systemroot%\System32\dwmbackup
move %systemroot%\System32\uDWM.dll %systemroot%\System32\dwmbackup
mkdir %systemroot%\System32\dwmbackup\en-US
move %systemroot%\System32\en-US\dwm.exe.mui %systemroot%\System32\dwmbackup\en-US
move %systemroot%\System32\en-US\dwmapi.dll.mui %systemroot%\System32\dwmbackup\en-US
move %systemroot%\System32\en-US\dwmcore.dll.mui %systemroot%\System32\dwmbackup\en-US
move %systemroot%\System32\en-US\dwminit.dll.mui %systemroot%\System32\dwmbackup\en-US
move %systemroot%\System32\en-US\dwmredir.dll.mui %systemroot%\System32\dwmbackup\en-US
move %systemroot%\System32\en-US\uDWM.dll.mui %systemroot%\System32\dwmbackup\en-US
mkdir %systemroot%\System32\dwmbackup\en-GB
move %systemroot%\System32\en-GB\dwm.exe.mui %systemroot%\System32\dwmbackup\en-GB
move %systemroot%\System32\en-GB\dwmapi.dll.mui %systemroot%\System32\dwmbackup\en-GB
move %systemroot%\System32\en-GB\dwmcore.dll.mui %systemroot%\System32\dwmbackup\en-GB
move %systemroot%\System32\en-GB\dwminit.dll.mui %systemroot%\System32\dwmbackup\en-GB
move %systemroot%\System32\en-GB\dwmredir.dll.mui %systemroot%\System32\dwmbackup\en-GB
move %systemroot%\System32\en-GB\uDWM.dll.mui %systemroot%\System32\dwmbackup\en-GB
mkdir %systemroot%\System32\dwmbackup\en-US-languagepacks
move "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwm.exe.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
move "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmapi.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
move "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmcore.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
move "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwminit.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
move "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmredir.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
move "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\uDWM.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
xcopy System32 "%systemroot%\System32" /i /e /y /f
cd System32
xcopy en-US "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" /I /E /Y /f
clr
echo Done
pause
exit

:disable
rem this part is copied from the Revision OS DWM tool but modified a little
if exist %systemroot%\ImmersiveControlPanel takeown /F %systemroot%\ImmersiveControlPanel /R /A & icacls %systemroot%\ImmersiveControlPanel /grant Administrators:(F) /T
if exist %systemroot%\System32\UIRibbon.dll takeown /F %systemroot%\System32\UIRibbon.dll /A & icacls %systemroot%\System32\UIRibbon.dll /grant Administrators:(F)
if exist %systemroot%\System32\UIRibbonRes.dll takeown /F %systemroot%\System32\UIRibbonRes.dll /A & icacls %systemroot%\System32\UIRibbonRes.dll /grant Administrators:(F)
if exist %systemroot%\System32\dwm.exe takeown /F %systemroot%\System32\dwm.exe /A & icacls %systemroot%\System32\dwm.exe /grant Administrators:(F)
if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll takeown /F %systemroot%\System32\windows.immersiveshell.serviceprovider.dll /A & icacls %systemroot%\System32\windows.immersiveshell.serviceprovider.dll /grant Administrators:(F)
if exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy takeown /F %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy /R /A & icacls %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy /grant Administrators:(F) /T
taskkill /f /im ApplicationFrameHost.exe
taskkill /f /im RuntimeBroker.exe
taskkill /f /im ShellExperienceHost.exe
taskkill /f /im SystemSettings.exe
if not exist %systemroot%\ImmersiveControlPanel.old if exist %systemroot%\ImmersiveControlPanel ren %systemroot%\ImmersiveControlPanel ImmersiveControlPanel.old
if exist %systemroot%\ImmersiveControlPanel.old if exist %systemroot%\ImmersiveControlPanel rmdir /S /Q %systemroot%\ImmersiveControlPanel
if not exist %systemroot%\System32\UIRibbon.dll.old if exist %systemroot%\System32\UIRibbon.dll ren %systemroot%\System32\UIRibbon.dll UIRibbon.dll.old
if exist %systemroot%\System32\UIRibbon.dll.old if exist %systemroot%\System32\UIRibbon.dll del /q %systemroot%\System32\UIRibbon.dll
if not exist %systemroot%\System32\UIRibbonRes.dll.old if exist %systemroot%\System32\UIRibbonRes.dll ren %systemroot%\System32\UIRibbonRes.dll UIRibbonRes.dll.old
if exist %systemroot%\System32\UIRibbonRes.dll.old if exist %systemroot%\System32\UIRibbonRes.dll del /q %systemroot%\System32\UIRibbonRes.dll
if not exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll ren %systemroot%\System32\windows.immersiveshell.serviceprovider.dll windows.immersiveshell.serviceprovider.dll.old
if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll del /q %systemroot%\System32\windows.immersiveshell.serviceprovider.dll
if not exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.old if exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy ren %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy ShellExperienceHost_cw5n1h2txyewy.old
if exist %systemroot%\ShellExperienceHost_cw5n1h2txyewy.old if exist %systemroot%\ShellExperienceHost_cw5n1h2txyewy rmdir /S /Q %systemroot%\ShellExperienceHost_cw5n1h2txyewy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "ConsoleMode" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "XamlCredUIAvailable" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32TrayClockExperience" /t REG_DWORD /d "1" /f
:: Confuse Windows with a fake dwm.exe
if exist %systemroot%\System32\dwm.exe takeown /F %systemroot%\System32\dwm.exe /A & icacls %systemroot%\System32\dwm.exe /grant Administrators:(F)
if not exist %systemroot%\System32\dwm.exe.old if exist %systemroot%\System32\dwm.exe ren %systemroot%\System32\dwm.exe dwm.exe.old
if exist %systemroot%\System32\dwm.exe.old if exist %systemroot%\System32\dwm.exe del /q %systemroot%\System32\dwm.exe
echo N| copy/-Y "%systemroot%\System32\rundll32.exe" "%systemroot%\System32\dwm.exe"
cls
echo Done, changes will take effect after logoff.
pause
exit

:enable
rem this part is copied from the Revision OS DWM tool but modified a little
if not exist %systemroot%\ImmersiveControlPanel if exist %systemroot%\ImmersiveControlPanel.old ren %systemroot%\ImmersiveControlPanel.old ImmersiveControlPanel
if exist %systemroot%\ImmersiveControlPanel if exist %systemroot%\ImmersiveControlPanel.old rmdir /S /Q %systemroot%\ImmersiveControlPanel.old
if not exist %systemroot%\System32\UIRibbon.dll if exist %systemroot%\System32\UIRibbon.dll.old ren %systemroot%\System32\UIRibbon.dll.old UIRibbon.dll
if exist %systemroot%\System32\UIRibbon.dll if exist %systemroot%\System32\UIRibbon.dll.old del /q %systemroot%\System32\UIRibbon.dll.old
if not exist %systemroot%\System32\UIRibbonRes.dll if exist %systemroot%\System32\UIRibbonRes.dll.old ren %systemroot%\System32\UIRibbonRes.dll.old UIRibbonRes.dll
if exist %systemroot%\System32\UIRibbonRes.dll if exist %systemroot%\System32\UIRibbonRes.dll.old del /q %systemroot%\System32\UIRibbonRes.dll.old
if not exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old ren %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old windows.immersiveshell.serviceprovider.dll
if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old del /q %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old
if not exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy if exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.old ren %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.old ShellExperienceHost_cw5n1h2txyewy
if exist %systemroot%\ShellExperienceHost_cw5n1h2txyewy if exist %systemroot%\ShellExperienceHost_cw5n1h2txyewy.old rmdir /S /Q %systemroot%\ShellExperienceHost_cw5n1h2txyewy.old
:: Revert DWM.exe changes
del %systemroot%\System32\dwm.exe
if exist %systemroot%\System32\dwm.exe.old takeown /F %systemroot%\System32\dwm.exe.old /A & icacls %systemroot%\System32\dwm.exe.old /grant Administrators:(F)
if not exist %systemroot%\System32\dwm.exe if exist %systemroot%\System32\dwm.exe.old ren %systemroot%\System32\dwm.exe.old dwm.exe
cls
echo Done, changes will take effect after logoff.
pause
exit

:backup
mkdir %systemroot%\System32\dwmbackup
copy %systemroot%\System32\dwm.exe %systemroot%\System32\dwmbackup
copy %systemroot%\System32\dwmapi.dll %systemroot%\System32\dwmbackup
copy %systemroot%\System32\dwmcore.dll %systemroot%\System32\dwmbackup
copy %systemroot%\System32\dwminit.dll %systemroot%\System32\dwmbackup
copy %systemroot%\System32\dwmredir.dll %systemroot%\System32\dwmbackup
copy %systemroot%\System32\uDWM.dll %systemroot%\System32\dwmbackup
mkdir %systemroot%\System32\dwmbackup\en-US
copy %systemroot%\System32\en-US\dwm.exe.mui %systemroot%\System32\dwmbackup\en-US
copy %systemroot%\System32\en-US\dwmapi.dll.mui %systemroot%\System32\dwmbackup\en-US
copy %systemroot%\System32\en-US\dwmcore.dll.mui %systemroot%\System32\dwmbackup\en-US
copy %systemroot%\System32\en-US\dwminit.dll.mui %systemroot%\System32\dwmbackup\en-US
copy %systemroot%\System32\en-US\dwmredir.dll.mui %systemroot%\System32\dwmbackup\en-US
copy %systemroot%\System32\en-US\uDWM.dll.mui %systemroot%\System32\dwmbackup\en-US
mkdir %systemroot%\System32\dwmbackup\en-GB
copy %systemroot%\System32\en-GB\dwm.exe.mui %systemroot%\System32\dwmbackup\en-GB
copy %systemroot%\System32\en-GB\dwmapi.dll.mui %systemroot%\System32\dwmbackup\en-GB
copy %systemroot%\System32\en-GB\dwmcore.dll.mui %systemroot%\System32\dwmbackup\en-GB
copy %systemroot%\System32\en-GB\dwminit.dll.mui %systemroot%\System32\dwmbackup\en-GB
copy %systemroot%\System32\en-GB\dwmredir.dll.mui %systemroot%\System32\dwmbackup\en-GB
copy %systemroot%\System32\en-GB\uDWM.dll.mui %systemroot%\System32\dwmbackup\en-GB
mkdir %systemroot%\System32\dwmbackup\en-US-languagepacks
copy "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwm.exe.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
copy "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmapi.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
copy "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmcore.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
copy "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwminit.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
copy "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmredir.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
copy "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\uDWM.dll.mui" %systemroot%\System32\dwmbackup\en-US-languagepacks
cls
echo Done
pause
exit

:restore
copy %systemroot%\System32\dwmbackup\dwm.exe %systemroot%\System32 -y
copy %systemroot%\System32\dwmbackup\dwmapi.dll %systemroot%\System32 -y
copy %systemroot%\System32\dwmbackup\dwmcore.dll %systemroot%\System32 -y
copy %systemroot%\System32\dwmbackup\dwminit.dll %systemroot%\System32 -y
copy %systemroot%\System32\dwmbackup\dwmredir.dll %systemroot%\System32 -y
copy %systemroot%\System32\dwmbackup\uDWM.dll %systemroot%\System32 -y
copy %systemroot%\System32\dwmbackup\DWMGhost.dll %systemroot%\System32 -y
copy %systemroot%\System32\dwmbackup\en-US\dwm.exe.mui %systemroot%\System32\en-US -y
copy %systemroot%\System32\dwmbackup\en-US\dwmapi.dll.mui %systemroot%\System32\en-US -y
copy %systemroot%\System32\dwmbackup\en-US\dwmcore.dll.mui %systemroot%\System32\en-US -y
copy %systemroot%\System32\dwmbackup\en-US\dwminit.dll.mui %systemroot%\System32\en-US -y
copy %systemroot%\System32\dwmbackup\en-US\dwmredir.dll.mui %systemroot%\System32\en-US -y
copy %systemroot%\System32\dwmbackup\en-US\uDWM.dll.mui %systemroot%\System32\en-US -y
copy %systemroot%\System32\dwmbackup\en-US\DWMGhost.dll.mui %systemroot%\System32\en-US -y
copy %systemroot%\System32\dwmbackup\en-GB\dwm.exe.mui %systemroot%\System32\en-GB -y
copy %systemroot%\System32\dwmbackup\en-GB\dwmapi.dll.mui %systemroot%\System32\en-GB -y
copy %systemroot%\System32\dwmbackup\en-GB\dwmcore.dll.mui %systemroot%\System32\en-GB -y
copy %systemroot%\System32\dwmbackup\en-GB\dwminit.dll.mui %systemroot%\System32\en-GB -y
copy %systemroot%\System32\dwmbackup\en-GB\dwmredir.dll.mui %systemroot%\System32\en-GB -y
copy %systemroot%\System32\dwmbackup\en-GB\uDWM.dll.mui %systemroot%\System32\en-GB -y
copy %systemroot%\System32\dwmbackup\en-GB\DWMGhost.dll.mui %systemroot%\System32\en-GB  -y
copy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwm.exe.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" -y
copy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwmapi.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" -y
copy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwmcore.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" -y
copy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwminit.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" -y
copy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwminit.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" -y
copy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwmredir.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" -y
copy %systemroot%\System32\dwmbackup\en-US-languagepacks\uDWM.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" -y
copy %systemroot%\System32\dwmbackup\en-US-languagepacks\DWMGhost.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" -y
cls
echo Done
pause
exit

:dcl
takeown /f %systemroot%\Windows.UI.Logon.dll
ren %systemroot%\System32\Windows.UI.Logon.dll.bak Windows.UI.Logon.dll
cls Done
pause
exit

:ecl
ren %systemroot%\System32\Windows.UI.Logon.dll Windows.UI.Logon.dll.bak
Done
pause
exit

:help
echo.==================================================================================
echo.		            DWMSuite by Alcatel :D
echo.==================================================================================
echo.
echo. hi
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.==================================================================================
pause
exit
