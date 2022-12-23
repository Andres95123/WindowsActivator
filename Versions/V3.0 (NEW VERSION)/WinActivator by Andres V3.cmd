::APP from GitHub repository https://github.com/Andres95123/WindowsActivator
::This is a OPEN SOURCE proyect, but you must give credits to the repository author.

@echo off
color 1F
:SoftwareStart
cls
::Esto es un comentario
CALL :getStartVariables
echo %text_lenguage_detected%
::Main
CALL :Main text_automatic_option text_manual_option text_expire_date
::If fail reset software
if %ERRORLEVEL% EQU 1 (
    goto :SoftwareStart
)
::If succes exit
EXIT(0)

::Menu call function
:displayMenu
    cls
    echo ===================================================================================
    echo = %text_title% == Windows %WVersion% %WModule% == %text_idiom% : %Language% == %text_server% : !W_Server[%Current_Server%]! =
    echo ===================================================================================
    echo.
    EXIT /B 0

:Main
    setlocal enableextensions enableDelayedExpansion
    CALL :displayMenu
    CALL :getSelectedOption %*
    CALL :teleportToSelectedOption %sel% %*
    endlocal & (
        set Global_ERROR=%ERROR%
        set Current_Server=%Current_Server%
        set W_Key=%W_Key%
    )
    EXIT /B 0
::Start getStartVariables
:text_automatic_option_CALL
echo %text_welcometo_automatic%
CALL :getWindowsVersionKey
CALL :setWindowsVersionKey
pause
exit /B 0

:text_manual_option_CALL
echo %text_welcometo_manual%
CALL :Main text_manual_select_version text_manual_select_server text_manual_select_exit
if %Global_ERROR% NEQ 1 (
    cls
    goto :text_manual_option_CALL
)
pause
exit /B 0

:text_manual_select_version_CALL
    set text_windows_versions11=Windows_11/10
    set text_windows_versions8_1=Windows_8.1
    set text_windows_versions8=Windows_8
    CALL :Main text_windows_versions11 text_windows_versions8_1 text_windows_versions8 text_exit_option
    CALL :setWindowsVersionKey
    pause
    set /A ERROR=0
    exit /B 0
:text_manual_select_server_CALL
    set text_W_Server_X=%W_Server[0]%
    set text_W_Server_Y=%W_Server[1]%
    set text_W_Server_Z=%W_Server[2]%
    CALL :Main text_W_Server_X text_W_Server_Y text_W_Server_Z text_exit_option
    set /A ERROR=0
    exit /B 0
:text_manual_select_exit_CALL
    set /A ERROR=1
    goto :SoftwareStart
    exit /B 0

:text_expire_date_CALL
    slmgr -xpr
    slmgr /dli
    goto :SoftwareStart

:text_windows_versions11_CALL
    CALL :Main W11_Home W11_HomeN W11_HomeSL W11_HomeCS W11_Pro W11_ProN W11_Enterprise W11_EnterpriseN W11_Enterprise2015LTSB W11_Enterprise2015LTSBN W11_Education W11_EducationN text_exit_option
    exit /B 0
:text_windows_versions8_1_CALL
    CALL :Main W8.1_Home W8.1_HomeN W8.1_Pro W8.1_ProN text_exit_option
    exit /B 0
:text_windows_versions8_CALL
    CALL :Main W8_Home W8_Pro W8_ProN text_exit_option
    exit /B 0

exit /B 0
:text_W_Server_X_CALL
set /a Current_Server=0
exit /b 0
:text_W_Server_Y_CALL
set /a Current_Server=1
exit /b 0
:text_W_Server_Z_CALL
set /a Current_Server=2
exit /b 0

:getStartVariables
    ::Get servers
    CALL :getServerDomain
    ::Text
    set text_title=WinActivator V3.0
    set /A IsLanguage=0

    ::Get lenguaje
    FOR /F "tokens=2 delims==" %%a IN ('wmic os get OSLanguage /Value') DO set OSLanguage=%%a
    CALL :setOSLenguage

    ::Get Windows Version and Module
    FOR /F "usebackq tokens=3,4,5" %%i IN (`REG query "hklm\software\microsoft\windows NT\CurrentVersion" /v ProductName`) do set WVersion=%%j & set WModule=%%k
    set WVersion=%WVersion:~0,-1%

    

    EXIT /B 0

:teleportToSelectedOption
    set argC=0 
    for %%x in (%*) do (
        if !argC! == %1 (
            CALL :%%x_CALL
            EXIT /B 0
        )
        set/a argC+=1
    )
    EXIT /B 1
:getSelectedOption
    	set argC=1
    	for %%x in (%*) do (
    	    echo !argC!. !%%x!
            Set /A argC+=1
        )
    echo.
    set/p sel=%text_select%=

    if %sel% LEQ 0 (
        echo %text_invalid_option%
        pause
        cls
        goto :getSelectedOption)

    if %sel% GTR %argC% (
        echo %text_invalid_option%
        pause
        cls
        goto :getSelectedOption)

    EXIT /B %sel%
:getServerDomain
    set /A Current_Server=0
    ::Secure Servers
    set W_Server[0]=kms.digiboy.ir
    set W_Server[1]=kms.msguides.com
    set W_Server[2]=kms8.msguides.com

    EXIT /B 0

:getIfSuccessKeyInstall
    cscript //nologo "%systemroot%\system32\slmgr.vbs" /dli 2>nul | find "%W_Key:~24%">nul
    EXIT /B %ERRORLEVEL%

:setWindowsVersionKey
    ::DEFINE SERVER LENGHT
    setlocal enableDelayedExpansion
    :Loop
    IF DEFINED W_Server[%Current_Server%] (
    echo %text_testing_text% !W_Server[%Current_Server%]!
    echo %text_wait%
    echo.
    ::Install the key //b
    slmgr /ipk %W_Key%  //b
    slmgr /skms !W_Server[%Current_Server%]! //b
    slmgr /ato //b)
    ::Look for succes instlation
    
    CALL :getIfSuccessKeyInstall
    ::If not succes retry with other server
    if %ERRORLEVEL% NEQ 0 (
            set /A Current_Server+=1
        IF DEFINED W_Server[%Current_Server%] ( 
            echo.
            echo %text_error_crack%
            echo ==================
            echo.
            echo %text_timeout%
            timeout /t 5 /nobreak
            cls
            CALL :displayMenu
            GOTO :Loop 
        ) ELSE (
            echo.
            echo.
            echo %text_no_server_left%
            echo.
            ::Beep as notify
            rundll32.exe cmdext.dll,MessageBeepStub
            EXIT /B 1
        )
    )
    echo %text_succes_crack%
    echo %text_msg_success%
    endlocal
    ::Beep as notify
    rundll32.exe cmdext.dll,MessageBeepStub
    EXIT /B 0
:text_exit_option_CALL
    goto text_manual_option_CALL
:getWindowsVersionKey
    ::Get Version Key
    CALL :W%WVersion%_%WModule%
    EXIT /B 0

    ::Windows 11 and 10 KEYS

    :W11_Home
    :W11_Home_CALL
    :W10_Home
        set W_Key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
    EXIT /B 0

    :W11_HomeN
    :W11_HomeN_CALL
    :W10_HomeN
        set W_Key=3KHY7-WNT83-DGQKR-F7HPR-844BM
    EXIT /B 0

    :W11_HomeSL
    :W11_HomeSL_CALL
    :W10_HomeSL
        set W_Key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
    EXIT /B 0

    :W11_HomeCS
    :W11_HomeCS_CALL
    :W10_HomeCS
        set W_Key=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
    EXIT /B 0

    :W11_Pro
    :W11_Pro_CALL
    :W10_Pro
        set W_Key=W269N-WFGWX-YVC9B-4J6C9-T83GX
    EXIT /B 0

    :W11_ProN
    :W11_ProN_CALL
    :W10_ProN
        set W_Key=MH37W-N47XK-V7XM9-C7227-GCQG9
    EXIT /B 0

    :W11_Enterprise
    :W11_Enterprise_CALL
    :W10_Enterprise
        set W_Key=NPPR9-FWDCX-D2C8J-H872K-2YT43
    EXIT /B 0

    :W11_EnterpriseN
    :W11_EnterpriseN_CALL
    :W10_EnterpriseN
        set W_Key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
    EXIT /B 0

    :W11_Enterprise2015LTSB
    :W11_Enterprise2015LTSB_CALL
    :W10_Enterprise2015LTSB
        set W_Key=WNMTR-4C88C-JK8YV-HQ7T2-76DF9
    EXIT /B 0

    :W11_Enterprise2015LTSBN
    :W11_Enterprise2015LTSBN_CALL
    :W10_Enterprise2015LTSBN
        set W_Key=2F77B-TNFGY-69QQF-B8YKP-D69TJ
    EXIT /B 0

    :W11_Education
    :W11_Education_CALL
    :W10_Education
        set W_Key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
    EXIT /B 0

    :W11_EducationN
    :W11_EducationN_CALL
    :W10_EducationN
        set W_Key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
    EXIT /B 0

    ::Windows 8.1 Keys
    :W8.1_Home
    :W8.1_Home_CALL
        set W_Key=M9Q9P-WNJJT-6PXPY-DWX8H-6XWKK
    EXIT /B 0

    :W8.1_HomeN
    :W8.1_HomeN_CALL
        set W_Key=7B9N3-D94CG-YTVHR-QBPX3-RJP64
    EXIT /B 0

    :W8.1_Pro
    :W8.1_Pro_CALL
        set W_Key=GCRJD-8NW9H-F2CDX-CCM8D-9D6T9
    EXIT /B 0

    :W8.1_ProN
    :W8.1_ProN_CALL
        set W_Key=HMCNV-VVBFX-7HMBH-CTY9B-B4FXY
    EXIT /B 0


    ::Windows 8 Keys
    :W8_Home
    :W8_Home_CALL
        set W_Key=BN3D2-R7TKB-3YPBD-8DRP2-27GG4
    EXIT /B 0

    :W8_Pro
    :W8_Pro_CALL
        set W_Key=NG4HW-VH26C-733PB-MHCB7-2RYQQ
    EXIT /B 0

    :W8_ProN
    :W8_ProN_CALL
        set W_Key=XCVCF-2NXM9-723PB-MHCB7-2RYQQ
    EXIT /B 0


    ::Windows 7 KEYS COMMING SOON

::Set / Get lenguage
:setOSLenguage
    ::Lenguage List
    set Lenguage=%OSLanguage%

    CALL :OS_%OSLanguage%

    if %IsLanguage% NEQ 1 (
        ::If no lenguage detected, set english as default
        cls
        CALL :OS_Default
    )

    


    ::W11 and W10
    set W11_Home=Windows 11/10 Home
    set W11_HomeN=Windows 11/10 HomeN
    set W11_HomeSL=Windows 11/10 HomeSL
    set W11_HomeCS=Windows 11/10 HomeCS
    set W11_Pro=Windows 11/10 Pro
    set W11_ProN=Windows 11/10 ProN
    set W11_Enterprise=Windows 11/10 Enterprise
    set W11_EnterpriseN=Windows 11/10 EnterpriseN
    set W11_Enterprise2015LTSB=Windows 11/10 Enterprise2015LTSB
    set W11_Enterprise2015LTSBN=Windows 11/10 Enterprise2015LTSBN=
    set W11_Education=Windows 11/10 Education
    set W11_EducationN=Windows 11/10 EducationN

    ::W8.1 and W8
    set W8.1_Home=Windows 8.1 Home
    set W8.1_HomeN=Windows 8.1 HomeN
    set W8.1_Pro=Windows 8.1 Pro
    set W8.1_ProN=Windows 8.1 ProN
    set W8_Home=Windows 8 Home
    set W8_Pro=Windows 8 Pro
    set W8_ProN=Windows 8 ProN

    
    

    EXIT /B 0


    ::SPANISH
    :OS_3082
        set Language=es
        set /A IsLanguage=1

        ::TEXT
        set text_invalid_option=Ha elegido una opcion no valida, repita la eleccion
        set text_manual_select_version=Elegir_Version
        set text_manual_select_server=Elegir_Servidor
        set text_manual_select_exit=Volver_Al_Menu_Principal
        set text_welcometo_automatic=Bienvenido al modo Automatico, EMPEZANDO AHORA
        set text_welcometo_manual=Bienvenido al modo Manual, seleccione sus preferencias:
        set text_automatic_option=Automatico
        set text_manual_option=Manual
        set text_expire_date=Ver_Caducidad_Key
        set text_lenguage_detected=Espanol detectado como idioma
        set text_timeout=REINTENTO EN 5s
        set text_no_server_left=No quedan servidores por probar, intentelo de nuevo o realice la instalacion de forma manual
        set text_error_crack=Ha habido un problema, probando con otro servidor
        set text_wait=Esto puede necesitar un par de minutos...
        set text_testing_text=Probando con servidor :
        set text_succes_crack=Se ha instalado correctamente la key
        set text_server=Servidor
        set text_select=Elige
        set text_idiom=Idioma
        set text_exit_option=Volver
        set text_msg_success=Para eliminar la marca de agua, tal vez sea necesario reiniciar.

        EXIT /B 0

    ::Default ENGLISH
    :OS_Default
        set Lenguage=en
        set /A IsLanguage=1

        ::TEXT
        set text_invalid_option=Invalid Option, please select a good one
        set text_manual_select_version=Select_Version
        set text_manual_select_server=Select_Server
        set text_manual_select_exit=Return_To_Main_Menu
        set text_welcometo_automatic=Welcome to Automatic mode, STARTING NOW
        set text_welcometo_manual=Welcome to Manual mode, set your choice:
        set text_automatic_option=Automatic
        set text_manual_option=Manual
        set text_expire_date=See_Key_Expire_Date
        set text_lenguage_detected=English detected as Default
        set text_timeout=RETRY in 5s
        set text_no_server_left=No servers left for trying, please try it again or do it manually
        set text_error_crack=Some problem has happened, trying other servers
        set text_testing_text=Testing with server :
        set text_wait=It can take some minutes...
        set text_succes_crack=Key installed succesfully
        set text_server=Server
        set text_select=Select
        set text_idiom=Lenguage
        set text_exit_option=Return
        set text_msg_success=To remove activation watermark, you may need to restart your computer.

        EXIT /B 0

::APP from GitHub repository https://github.com/Andres95123/WindowsActivator
::This is a OPEN SOURCE proyect, but you must give credits to the repository author.