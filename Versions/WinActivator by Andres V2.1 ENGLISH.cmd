@echo off
title Windows 10 Activation Script
set sv= kms.digiboy.ir
FOR /F "usebackq tokens=3,4,5" %%i IN (`REG query "hklm\software\microsoft\windows NT\CurrentVersion" /v ProductName`) do set WVersion=%%j & set WModule=%%k

:Inicio
color 1F
echo -------------------------------
echo - W11 Activator by Andres - 			- Server : %sv% -
echo -------------------------------
echo.
echo 1. Automatic Key Crack
echo.
echo 2. Manual Key Crack
echo.
echo 3. Change Server
echo 4. See Windows Expiration Date
echo.
set/p S=Select=
cls
if %S%==1 (goto :Auto)
if %S%==2 (goto :Manual)
if %S%==3 (goto :Servidor)
if %S%==4 (goto :Vcaducidad)

echo ------------------------------------
echo ------Elija un numero correcto------
echo ------------------------------------
echo.
goto :Inicio
:Manual
cls
echo -------------------------------
echo - W11 Activator by Andres - 			- Server : %sv% -
echo -------------------------------
echo.
echo 1. Windows 10 / 11 Keys
echo 2. Windows 8 / 8.1 Keys
echo X. Windows 7 Keys
echo.
echo 3. Return
echo.
set/p SM=Select=
cls
if %SM%==1 (goto :W10Menu)
if %SM%==2 (goto :W8Menu)
if %SM%==3 (goto :Inicio)


echo ------------------------------------
echo ------ Select a valid option  ------
echo ------------------------------------
echo.
goto :Manual






:Auto
cls
echo -------------------------------
echo - W11 Activator by Andres - 			- Server : %sv% -
echo -------------------------------
echo.
echo Detected Windows %WVersion%%WModule%
echo Installing product key, wait...
if %WVersion%==10 (goto :AutoW10)
if %WVersion%==11 (goto :AutoW10)
if %WVersion%==8 (goto :AutoW8)
if %WVersion%==8.1 (goto :AutoW81)

:AutoW10
if %WModule%==Home (goto :W10Home)
if %WModule%==Pro (goto :W10Pro)
if %WModule%==Enterprise (goto :W10Enterprise)
if %WModule%==Education(goto :W10Education)

:AutoW8
if %WModule%==Home (goto :W8Home)
if %WModule%==Pro (goto :W8Pro)

:AutoW81
if %WModule%==Home (goto :W81Home)
if %WModule%==Pro (goto :W81Pro)

echo No automatic Windows version detected, please, do it manually
echo.
goto :Inicio

:W10Menu

echo ---------------------------
echo - W11 Activator by Andres - 			- Server : %sv% -
echo ---------------------------
echo.
echo 1. Windows 10 Home
echo 2. Windows 10 Home N
echo.
echo 3. Windows 10 Professional
echo 4. Windows 10 Professional N
echo.
echo 5. Windows 10 Enterprise
echo 6. Windows 10 Enterprise N
echo.
echo 7. Windows 10 Education
echo 8. Windows 10 Education N
echo.
echo 9. Other options
echo.
echo 10. Return
echo.
set/p S=Select=
cls
if %S%==1 (goto :W10Home)
if %S%==2 (goto :W10HomeN)
if %S%==3 (goto :W10Pro)
if %S%==4 (goto :W10ProN)
if %S%==5 (goto :W10Enterprise)
if %S%==6 (goto :W10EnterpriseN)
if %S%==7 (goto :W10Education)
if %S%==8 (goto :W10EducationN)
if %S%==9 (goto :SMenu)
if %S%==10 (goto :Inicio)

echo ------------------------------------
echo ------ Select a valid option -------
echo ------------------------------------
echo.
goto :W10Menu


:SMenu
echo ---------------------------
echo - W11 Activator by Andres - 			- Server : %sv% -
echo ---------------------------
echo.
echo 1. Windows 10 Home Single Language
echo 2. Windows 10 Home Country Specific
echo.
echo 3. Windows 10 Enterprise 2015 LTSB
echo 4. Windows 10 Enterprise 2015 LTSB N
echo.
echo 5. Return to Windows 10 menu
echo.
set/p S2=Select=
cls
if %S2%==1 (goto :W10HomeSL)
if %S2%==2 (goto :W10HomeCS)
if %S2%==3 (goto :W10Enterprise2015LTSB)
if %S2%==4 (goto :W10Enterprise2015LTSBN)
if %S2%==5 (goto :W10Menu)

echo ------------------------------------
echo ------ Select a valid option -------
echo ------------------------------------
echo.

goto : SMenu


:Servidor

echo -------------------------------
echo - Windows Activator by Andres - 			- Server : %sv% -
echo -------------------------------
echo.
echo 1. Digiboy
echo 2. MSGUIDES
echo 3. K8.MSGUIDES
echo.
echo 4. Return to main menu
echo.
set/p S3=Select=
cls
if %S3%==1 (set sv=kms.digiboy.ir)
if %S3%==1 (goto :Inicio)
if %S3%==2 (set sv=kms.msguides.com)
if %S3%==2 (goto :Inicio)
if %S3%==3 (set sv=kms8.msguides.com)
if %S3%==3 (goto :Inicio)
if %S3%==4 (goto :Inicio)

echo ------------------------------------
echo ------ Select a valid option -------
echo ------------------------------------
echo.

goto : Servidor

:W8Menu
echo ------------------------------
echo - W8/8.1 Activator by Andres - 			- Server : %sv% -
echo ------------------------------
echo.
echo 1. Windows 8 Home
echo.
echo 2. Windows 8 Professional
echo 3. Windows 8 Professional N
echo.
echo 4. Windows 8.1 Home
echo 5. Windows 8.1 Home N
echo.
echo 6. Windows 8.1 Professional
echo 7. Windows 8.1 Professional N
echo.
echo 8. Return
echo.
set/p S4=Select=
cls
if %S4%==1 (goto :W8Home)
if %S4%==2 (goto :W8Pro)
if %S4%==3 (goto :W8ProN)
if %S4%==4 (goto :W81Home)
if %S4%==5 (goto :W81HomeN)
if %S4%==6 (goto :W81Pro)
if %S4%==7 (goto :W81ProN)
if %S4%==8 (goto :iNICIO)



echo ------------------------------------
echo ------ Select a valid option -------
echo ------------------------------------
echo.
goto :W8Menu

:W8Home
set x=BN3D2-R7TKB-3YPBD-8DRP2-27GG4
goto :ActivarW10
:W8Pro
set x=NG4HW-VH26C-733PB-MHCB7-2RYQQ
goto :ActivarW10
:W8ProN
set x=XCVCF-2NXM9-723PB-MHCB7-2RYQQ
goto :ActivarW10
:W81Home
set x=M9Q9P-WNJJT-6PXPY-DWX8H-6XWKK
goto :ActivarW10
:W81HomeN
set x=7B9N3-D94CG-YTVHR-QBPX3-RJP64
goto :ActivarW10
:W81Pro
set x=GCRJD-8NW9H-F2CDX-CCM8D-9D6T9
goto :ActivarW10
:W81ProN
set x=HMCNV-VVBFX-7HMBH-CTY9B-B4FXY
goto :ActivarW10



:Vcaducidad

slmgr -xpr
slmgr /dli
cls
goto :Inicio

:W10Home
set x=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
goto :ActivarW10


:W10HomeN
set x=3KHY7-WNT83-DGQKR-F7HPR-844BM
goto :ActivarW10

:W10HomeSL

set x=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
goto :ActivarW10

:W10HomeCS

set x=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
goto :ActivarW10

:W10Pro
set x=W269N-WFGWX-YVC9B-4J6C9-T83GX
goto :ActivarW10


:W10ProN
set x=MH37W-N47XK-V7XM9-C7227-GCQG9
goto :ActivarW10


:W10Enterprise
set x=NPPR9-FWDCX-D2C8J-H872K-2YT43
goto :ActivarW10



:W10EnterpriseN
set x=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
goto :ActivarW10

:W10Enterprise2015LTSB
set x=WNMTR-4C88C-JK8YV-HQ7T2-76DF9
goto :ActivarW10

:W10Enterprise2015LTSBN
set x=2F77B-TNFGY-69QQF-B8YKP-D69TJ
goto :ActivarW10


:W10Education
set x=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
goto :ActivarW10



:W10EducationN
set x=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
goto :ActivarW10




:ActivarW10
echo Activating with the product key %x%
echo Please don't turn off your computer in the next minute.

slmgr /ipk %x%
slmgr /skms %sv%
slmgr /ato

echo Windows Key Activated Succesfully. Press any key to continue...

pause
cls
goto :Inicio