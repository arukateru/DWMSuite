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
echo.===========================================================
echo.		            DWMSuite by Alcatel :D
echo.===========================================================
echo.
echo.	In the case of a black screen upon reboot you should
echo.   recover DWM from WinRE. You can't use this Batch file in
echo.   WinRE cuz it doesn't have the "choice" command for some
echo.	reason lmao, just open it in Notepad and copy the section
echo.   you need such as :restore and save as and you will also
echo.   have to find and replace in Notepad (Ctrl-H)
echo.   % systemroot % (no spaces) with your drive letter cuz in 
echo.	WinRE systemroot would be the ramdisk system32
echo.	
echo.	If your language is not American English make sure to
echo.	find and replace en-US with whatever your language code
echo.   is in this script
echo.	
echo.	PLEASE MAKE A RESTORE POINT FIRST IN CASE OF ERRORS!
echo.	Press [1] to backup DWM files
echo.	Press [2] to restore DWM files
echo.	Press [3] to import files
echo.	Press [4] to disable DWM
echo.	Press [5] to enable DWM
echo.	Press [6] to enable console logon screen
echo.	Press [7] to enable UWP logon screen
echo.	Press [8] to enable W7 Aero windowmetrics
echo.	Press [9] to enable W7 Basic windowmetrics
echo.	Press [L] to enable W10 default windowmetrics
echo.	Press [X] to quit
echo.
echo.=============================================================
choice /C:123456789LX /N /M "Selection: "
if errorlevel L goto :10metrics
if errorlevel 9 goto :basicmetrics
if errorlevel 8 goto :aerometrics
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
icacls %systemroot%\System32\dwm.exe /grant Administrators:(F)
takeown /f %systemroot%\System32\dwmapi.dll
icacls %systemroot%\System32\dwmapi.dll /grant Administrators:(F)
takeown /f %systemroot%\System32\dwmcore.dll
icacls %systemroot%\System32\dwmcore.dll /grant Administrators:(F)
takeown /f %systemroot%\System32\dwminit.dll
icacls %systemroot%\System32\dwminit.dll /grant Administrators:(F)
takeown /f %systemroot%\System32\dwmredir.dll
icacls %systemroot%\System32\dwmredir.dll /grant Administrators:(F)
takeown /f %systemroot%\System32\uDWM.dll
icacls %systemroot%\System32\uDWM.dll /grant Administrators:(F)
takeown /f %systemroot%\System32\DWMGhost.dll
icacls %systemroot%\System32\DWMGhost.dll /grant Administrators:(F)
takeown /f %systemroot%\System32\en-US\dwm.exe.mui
icacls %systemroot%\System32\en-US\dwm.exe.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-US\dwmapi.dll.mui
icacls %systemroot%\System32\en-US\dwmapi.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-US\dwmcore.dll.mui
icacls %systemroot%\System32\en-US\dwmcore.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-US\dwminit.dll.mui
icacls %systemroot%\System32\en-US\dwminit.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-US\dwmredir.dll.mui
icacls %systemroot%\System32\en-US\dwmredir.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-US\uDWM.dll.mui
icacls %systemroot%\System32\en-US\uDWM.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-US\DWMGhost.dll.mui
icacls %systemroot%\System32\en-US\DWMGhost.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-GB\dwm.exe.mui
icacls %systemroot%\System32\en-GB\dwm.exe.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-GB\dwmapi.dll.mui
icacls %systemroot%\System32\en-GB\dwmapi.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-GB\dwmcore.dll.mui
icacls %systemroot%\System32\en-GB\dwmcore.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-GB\dwminit.dll.mui
icacls %systemroot%\System32\en-GB\dwminit.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-GB\dwmredir.dll.mui
icacls %systemroot%\System32\en-GB\dwmredit.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-GB\uDWM.dll.mui
icacls %systemroot%\System32\en-GB\uDWM.dll.mui /grant Administrators:(F)
takeown /f %systemroot%\System32\en-GB\DWMGhost.dll.mui
icacls %systemroot%\System32\en-GB\DWMGhost.dll.mui /grant Administrators:(F)
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwm.exe.mui"
icacls "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwm.exe.mui" /grant Administrators:(F)
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmapi.dll.mui"
icacls "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmapi.dll.mui" /grant Administrators:(F)
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmcore.dll.mui"
icacls "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmcore.dll.mui" /grant Administrators:(F)
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwminit.dll.mui"
icacls "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwminit.dll.mui" /grant Administrators:(F)
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmredir.dll.mui"
icacls "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\dwmredir.dll.mui" /grant Administrators:(F)
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\uDWM.dll.mui"
icacls "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\uDWM.dll.mui" /grant Administrators:(F)
takeown /f "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\DWMGhost.dll.mui"
icacls "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US\DWMGhost.dll.mui" /grant Administrators:(F)
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
xcopy %systemroot%\System32\dwmbackup\dwm.exe %systemroot%\System32 /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\dwmapi.dll %systemroot%\System32 /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\dwmcore.dll %systemroot%\System32 /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\dwminit.dll %systemroot%\System32 /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\dwmredir.dll %systemroot%\System32 /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\uDWM.dll %systemroot%\System32 /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\DWMGhost.dll %systemroot%\System32 /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US\dwm.exe.mui %systemroot%\System32\en-US /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US\dwmapi.dll.mui %systemroot%\System32\en-US /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US\dwmcore.dll.mui %systemroot%\System32\en-US /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US\dwminit.dll.mui %systemroot%\System32\en-US /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US\dwmredir.dll.mui %systemroot%\System32\en-US /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US\uDWM.dll.mui %systemroot%\System32\en-US /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US\DWMGhost.dll.mui %systemroot%\System32\en-US /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-GB\dwm.exe.mui %systemroot%\System32\en-GB /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-GB\dwmapi.dll.mui %systemroot%\System32\en-GB /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-GB\dwmcore.dll.mui %systemroot%\System32\en-GB /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-GB\dwminit.dll.mui %systemroot%\System32\en-GB /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-GB\dwmredir.dll.mui %systemroot%\System32\en-GB /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-GB\uDWM.dll.mui %systemroot%\System32\en-GB /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-GB\DWMGhost.dll.mui %systemroot%\System32\en-GB /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwm.exe.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwmapi.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwmcore.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwminit.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwminit.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US-languagepacks\dwmredir.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US-languagepacks\uDWM.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" /i /e /y /f
xcopy %systemroot%\System32\dwmbackup\en-US-languagepacks\DWMGhost.dll.mui "C:\Program Files\WindowsApps\Microsoft.LanguageExperiencePacken-US_17763.28.29.0_neutral__8wekyb3d8bbwe\Windows\System32\en-US" /i /e /y /f
cls
echo Done
pause
exit

:dcl
takeown /f %systemroot%\System32\Windows.UI.Logon.dll
icacls %systemroot%\System32\Windows.UI.Logon.dll /grant Administrators:(F)
ren %systemroot%\System32\Windows.UI.Logon.dll.bak Windows.UI.Logon.dll
cls
echo Done
pause
exit

:ecl
takeown /f %systemroot%\System32\Windows.UI.Logon.dll
icacls %systemroot%\System32\Windows.UI.Logon.dll /grant Administrators:(F)
ren %systemroot%\System32\Windows.UI.Logon.dll Windows.UI.Logon.dll.bak
echo Done
pause
exit

:basicmetrics
reg add HKCU\Control Panel\Desktop\WindowMetrics /v CaptionHeight /t REG_SZ /d -315
echo It will take effect after logging on again
pause
exit

:aerometrics
reg add HKCU\Control Panel\Desktop\WindowMetrics /v CaptionHeight /t REG_SZ /d -285
echo It will take effect after logging on again
pause
exit

:10metrics
reg add HKCU\Control Panel\Desktop\WindowMetrics /v CaptionHeight /t REG_SZ /d -330
echo It will take effect after logging on again
pause
exit
