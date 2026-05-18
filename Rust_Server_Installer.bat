@echo off
chcp 65001 > NUL
REM Rust Server Setup Tool [v3.0.0]
mode 130,25 & color 02

:intro
title Rust Server Setup Tool
echo Welcome to the Rust server setup tool!
echo.	 
echo.
echo Press a key to start the installation...	
pause >nul
cls

:steamcmd
title SteamCMD Installing...
set steamcmd=C:\SteamCMD
echo Enter the directory where you want SteamCMD installed [Default: C:\SteamCMD]
echo.
set /p steamcmd="Directory: "
echo.
md "%steamcmd%"
curl -SL -A "Mozilla/5.0" https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip --output "%steamcmd%"\SteamCMD.zip
cd /d "%steamcmd%"
powershell -command "Expand-Archive -Force SteamCMD.zip ./"
del SteamCMD.zip
cls
echo SteamCMD installation completed!
echo -------------------

:branch
title Server Setup Settings
echo.
echo Select server version:
echo.
echo 1: Release
echo 2: Staging Branch
echo.
echo Note: There is no direct Oxide support for the Staging Branch. You need to install it yourself later.
echo.
set /p choice="Press 1 or 2: "
if not '%choice%'=='' set choice=%choice:~0,1%
cls
if '%choice%' == '1' goto rustmain
if '%choice%' == '2' goto ruststaging
echo Please press 1 or 2.
goto branch

:rustmain
set forceinstall=C:\RustServer
echo WARNING: Make sure there is no existing Rust Server installation in this directory.
echo The folder should be empty or not exist at all.
echo.
echo Enter the directory where you want to install Rust [Default: C:\RustServer]
echo.
set /p forceinstall="Directory: "
md "%forceinstall%"
cd /d "%forceinstall%"
title Installing Rust Server...
"%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 +quit

REM [Release] Creating Update File
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM UpdateServer.bat
	echo mode 110,20
	echo color 02
	echo title Updating Server...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 +quit
	echo echo.
	echo echo Rust has been updated!
	echo echo.
	echo choice /c yn /m "Would you like to start the server now?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %comspec%
	echo StartServer.bat
)>UpdateServer.bat
cls
echo Rust server installation completed!
echo ----------------------
echo.
goto modchoice

:ruststaging
set forceinstall=C:\RustStagingServer
echo WARNING: Make sure there is no existing Rust Server installation in this directory.
echo The folder should be empty or not exist at all.
echo.
echo Enter the directory where you want to install the Staging Branch [Default: C:\RustStagingServer]
echo.
set /p forceinstall="Directory: "
echo.
md "%forceinstall%"
cd /d "%forceinstall%"
title Installing Staging Server...
"%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 -beta staging +quit

REM [Staging Branch] Creating Update File
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM UpdateServer.bat
	echo mode 110,20
	echo color 02
	echo title Updating Server...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 -beta staging +quit
	echo echo.
	echo echo Rust [Staging Branch] has been updated!
	echo echo.
	echo choice /c yn /m "Would you like to start the server now?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %comspec%
	echo StartServer.bat
)>UpdateServer.bat
cls
echo Staging Branch Server installation completed!
echo ------------------------------
echo.
goto modchoicestaging

:modchoice
title Server Setup Settings

echo 1: Oxide
echo 2: Carbon
echo 3: Vanilla [No Mods]
echo.
set /p mod="Do you want to install Oxide or Carbon?: "
echo.
if not '%mod%'=='' set mod=%mod:~0,1%
cls
if '%mod%' == '1' goto oxideinstall
if '%mod%' == '2' goto carboninstall
if '%mod%' == '3' goto mapchoice
echo Please press 1, 2 or 3.
echo.
goto modchoice

:modchoicestaging
title Server Setup Settings

echo 1: Carbon
echo 2: Vanilla [No Mods]
echo.
set /p mod="Do you want to install Carbon?: "
echo.
if not '%mod%'=='' set mod=%mod:~0,1%
cls
if '%mod%' == '1' goto carboninstallstaging
if '%mod%' == '2' goto mapchoice
echo Please press 1 or 2.
echo.
goto modchoicestaging

:oxideinstall
title Installing Oxide...
curl -SL -A "Mozilla/5.0" "https://umod.org/games/rust/download" --output "%forceinstall%"\OxideMod.zip
cd /d "%forceinstall%"
powershell -command "Expand-Archive -Force OxideMod.zip ./"
del OxideMod.zip

REM [Oxide] Creating Update File
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM UpdateServer.bat
	echo mode 110,20
	echo color 02
	echo title Updating Server...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 +quit
	echo echo.
	echo echo Rust has been updated!
	echo pause
	echo curl -SL -A "Mozilla/5.0" "https://umod.org/games/rust/download" --output "%forceinstall%"\OxideMod.zip
	echo cd /d "%forceinstall%"
	echo powershell -command "Expand-Archive -Force OxideMod.zip ./"
	echo del OxideMod.zip
	echo echo.
	echo echo Oxide has been updated!
	echo :start
	echo echo.
	echo choice /c yn /m "Would you like to start the server now?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %%comspec%%
	echo StartServer.bat
)>UpdateServer.bat
cls
echo Oxide installation completed!
echo ----------------
echo.
goto mapchoice

:carboninstall
title Installing Carbon...
curl -SL -A "Mozilla/5.0" "https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Windows.Release.zip" --output "%forceinstall%"\CarbonMod.zip
cd /d "%forceinstall%"
powershell -command "Expand-Archive -Force CarbonMod.zip ./"
del CarbonMod.zip

REM [Carbon] Creating Update File
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM UpdateServer.bat
	echo mode 110,20
	echo color 02
	echo title Updating Server...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 +quit
	echo echo.
	echo echo Rust has been updated!
	echo pause
	echo echo.
	echo choice /c yn /m "Are you sure you want to install Carbon?: "
	echo IF ERRORLEVEL 2 goto start
	echo IF ERRORLEVEL 1 goto carbonupdate
	echo :carbonupdate
	echo curl -SL -A "Mozilla/5.0" "https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Windows.Release.zip" --output "%forceinstall%"\CarbonMod.zip
	echo cd /d "%forceinstall%"
	echo powershell -command "Expand-Archive -Force CarbonMod.zip ./"
	echo del CarbonMod.zip
	echo echo.
	echo echo Carbon has been updated!
	echo :start
	echo echo.
	echo choice /c yn /m "Would you like to start the server now?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %comspec%
	echo StartServer.bat
)>UpdateServer.bat
cls
echo Carbon installation completed!
echo ----------------
echo.
goto mapchoice

:carboninstallstaging
title Installing Carbon...
curl -SL -A "Mozilla/5.0" "https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Windows.Release.zip" --output "%forceinstall%"\CarbonMod.zip
cd /d "%forceinstall%"
powershell -command "Expand-Archive -Force CarbonMod.zip ./"
del CarbonMod.zip

REM [Carbon - Staging Branch] Creating Update File
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM UpdateServer.bat
	echo mode 110,20
	echo color 02
	echo title Updating Rust [Staging Branch] Server...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 -beta staging +quit
	echo echo.
	echo echo Rust [Staging Branch] server has been updated!
	echo echo.
	echo choice /c yn /m "Are you sure you want to install Carbon?: "
	echo IF ERRORLEVEL 2 goto start
	echo IF ERRORLEVEL 1 goto carbonupdate
	echo :carbonupdate
	echo curl -SL -A "Mozilla/5.0" "https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Windows.Release.zip" --output "%forceinstall%"\CarbonMod.zip
	echo cd /d "%forceinstall%"
	echo powershell -command "Expand-Archive -Force CarbonMod.zip ./"
	echo del CarbonMod.zip
	echo echo.
	echo echo Carbon has been updated!
	echo :start
	echo echo.
	echo choice /c yn /m "Would you like to start the server now?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %comspec%
	echo StartServer.bat
)>UpdateServer.bat
cls
echo Carbon installation completed!
echo ----------------
echo.
goto mapchoice

:mapchoice
title Server Setup Settings
choice /c yn /m "Are you using a custom map file? If this is your first setup, you probably aren't: "
cls
IF ERRORLEVEL 2 goto startproc
IF ERRORLEVEL 1 goto rusteditchoice

:rusteditchoice
choice /c yn /m "Would you like to install the RustEdit DLL file required to run custom maps?: "
echo.
IF ERRORLEVEL 2 goto startcustom
IF ERRORLEVEL 1 goto rusteditinstall

:rusteditinstall
title Installing RustEdit DLL...
powershell -Command "Invoke-WebRequest https://github.com/k1lly0u/Oxide.Ext.RustEdit/raw/master/Oxide.Ext.RustEdit.dll -OutFile '"%forceinstall%"\RustDedicated_Data\Managed\Oxide.Ext.RustEdit.dll'
cls
echo RustEdit DLL installation completed!
echo -----------------------
echo.
goto startcustom

:startproc
cd /d "%forceinstall%"
title Creating Startup File...
set serverport=28015
set /p serverport="Enter your server port number [Default: 28015]: "
echo.
set rconport=28016
set /p rconport="Enter your RCON port number [Default: 28016]: "
echo.
set queryport=28017
set /p queryport="Enter your server query port [Default: 28017]: "
echo.
set identity=RustServer
echo Do not leave spaces in the identity name!
set /p identity="Enter your server identity [Default: RustServer]: "
echo.
set seed=1337
set /p seed="Enter map seed [Default: 1337]: "
echo.
set worldsize=4500
set /p worldsize="Enter map size [Default: 4500]: "
echo.
set maxplayers=100
set /p maxplayers="Enter max players who can join the server [Default: 100]: "
echo.
set hostname=My Rust Server
set /p hostname="Enter the server name that will appear in the server list [Default: My Rust Server]: "
echo.
set description=Rust server description
set /p description="Enter server description [Default: Rust server description]: "
echo.
set rconpw=1234567890
set /p rconpw="Create a secure RCON password [Default: 1234567890]: "
echo.
set serverurl="https://"
set /p serverurl="Enter your server or Discord invite link [Default: https://discord.com/example]: "
echo.
set headerimage="https://"
echo REMINDER: The image you use for the server banner must be a maximum of 1024x512 in size.
set /p headerimage="Enter your server banner link [Default: https://example.com/example.png]: "

REM [Procedural Map] Creating Startup File
(
	echo @echo off
	echo chcp 65001 > NUL
	echo :start
	echo RustDedicated.exe -batchmode ^^
	echo -logFile "%identity%_logs.txt" ^^
	echo +server.queryport %queryport% ^^
	echo +server.port %serverport% ^^
	echo +server.level "Procedural Map" ^^
	echo +server.seed %seed% ^^
	echo +server.worldsize %worldsize% ^^
	echo +server.maxplayers %maxplayers% ^^
	echo +server.hostname "%hostname%" ^^
	echo +server.description "%description%" ^^
	echo +server.headerimage "%headerimage%" ^^
	echo +server.url "%serverurl%" ^^
	echo +server.identity "%identity%" ^^
	echo +rcon.port %rconport% ^^
	echo +rcon.password %rconpw% ^^
	echo +rcon.web 1
	echo goto start
)>StartServer.bat

REM [Procedural Map] Creating server.cfg File
md "%forceinstall%"\server\%identity%\cfg
cd /d "%forceinstall%"\server\%identity%\cfg
(
	echo fps.limit "100"
)>server.cfg

REM [Procedural Map] Creating Wipe File
cd /d "%forceinstall%"
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM WipeServer.bat
	echo mode 110,20
	echo color 02
	echo echo This file allows you to wipe your server. Make sure you want to continue.
	echo echo.
	echo pause
	echo echo.
	echo choice /c yn /m "Do you want to wipe blueprints?: "
	echo IF ERRORLEVEL 2 goto wipemap
	echo IF ERRORLEVEL 1 goto wipebp
	echo :wipebp
	echo echo.
	echo echo WARNING: THIS PROCESS WILL WIPE YOUR SERVER MAP, PLAYER DATA, AND BLUEPRINTS. MAKE SURE YOU WANT TO CONTINUE.
	echo pause
	echo echo.
	echo cd /d server/%identity%
	echo del *.sav
	echo del *.sav.*
	echo del *.map
	echo del *.db
	echo del *.db-journal
	echo del *.db-wal
	echo goto finishbp
	echo :wipemap
	echo echo.
	echo echo WARNING: THIS PROCESS WILL WIPE YOUR SERVER MAP AND PLAYER DATA. MAKE SURE YOU WANT TO CONTINUE.
	echo pause
	echo echo.
	echo cd /d server/%identity%
	echo del *.sav
	echo del *.sav.*
	echo del *.map
	echo del player.deaths.*
	echo del player.identities.*
	echo del player.states.*
	echo del player.tokens.*
	echo del sv.files.*
	echo goto finishmap
	echo :finishbp
	echo echo.
	echo echo Server map and blueprints have been wiped!
	echo echo.
	echo echo Don't forget to change the map seed in your StartServer file!
	echo echo Don't forget to manually delete necessary plugin data!
	echo echo.
	echo pause
	echo exit
	echo :finishmap
	echo echo.
	echo echo Server map has been wiped!
	echo echo.
	echo echo Don't forget to change the map seed in your StartServer.bat file!
	echo echo Don't forget to manually delete necessary plugin data!
	echo echo.
	echo pause
)>WipeServer.bat

REM [Procedural Map] Admin Control
cls
choice /c yn /m "Would you like to add yourself as an Admin to the server?: "
cls
IF ERRORLEVEL 2 goto finish
IF ERRORLEVEL 1 goto admin

:startcustom
cd /d "%forceinstall%"
title Creating Custom Map Startup File...
set serverport=28015
set /p serverport="Enter your server port number [Default: 28015]: "
echo.
set rconport=28016
set /p rconport="Enter your RCON port number [Default: 28016]: "
echo.
set queryport=28017
set /p queryport="Enter your server query port [Default: 28017]: "
echo.
set identity=RustServer
echo Do not leave spaces in the identity name!
set /p identity="Enter your server identity [Default: RustServer]: "
echo.
set levelurl=https://www.dropbox.com/s/ig1ds1m3q5hnflj/proc_install_1.0.map?dl=1
set /p levelurl="Enter the download link for your custom map: "
echo.
set maxplayers=100
set /p maxplayers="Enter max players who can join the server [Default: 100]: "
echo.
set hostname=My Rust Server
set /p hostname="Enter the server name that will appear in the server list [Default: My Rust Server]: "
echo.
set description=A new Rust server.
set /p description="Enter server description [Default: A new Rust server.]: "
echo.
set rconpw=1234567890
set /p rconpw="Create a secure RCON password [Default: 1234567890]: "
echo.
set serverurl="https://"
set /p serverurl="Enter your server or Discord invite link [Default: https://discord.com/example]: "
echo.
set headerimage="https://"
echo REMINDER: The image you use for the server banner must be a maximum of 1024x512 in size.
set /p headerimage="Enter your server banner link [Default: https://example.com/example.png]: "

REM [Custom Map] Creating Startup File
(
	echo @echo off
	echo chcp 65001 > NUL
	echo :start
	echo RustDedicated.exe -batchmode ^^
	echo -logFile "%identity%_logs.txt" ^^
	echo -levelurl "%levelurl%" ^^
	echo +server.queryport %queryport% ^^
	echo +server.port %serverport% ^^
	echo +server.maxplayers %maxplayers% ^^
	echo +server.hostname "%hostname%" ^^
	echo +server.description "%description%" ^^
	echo +server.headerimage "%headerimage%" ^^
	echo +server.url "%serverurl%" ^^
	echo +server.identity "%identity%" ^^
	echo +rcon.port %rconport% ^^
	echo +rcon.password %rconpw% ^^
	echo +rcon.web 1
	echo goto start
)>StartServer.bat

REM [Custom Map] Creating server.cfg File
md "%forceinstall%"\server\%identity%\cfg
cd /d "%forceinstall%"\server\%identity%\cfg
(
	echo fps.limit "100"
)>server.cfg

REM [Custom Map] Creating Wipe File
cd /d "%forceinstall%"
(
	echo @echo off
	echo chcp 65001 > NUL	
	echo REM WipeServer.bat
	echo mode 110,20
	echo color 02
	echo echo This file allows you to wipe your server. Make sure you want to continue.
	echo echo.
	echo pause
	echo echo.
	echo choice /c yn /m "Do you want to wipe blueprints?: "
	echo IF ERRORLEVEL 2 goto wipemap
	echo IF ERRORLEVEL 1 goto wipebp
	echo :wipebp
	echo echo.
	echo echo WARNING: THIS PROCESS WILL WIPE YOUR SERVER MAP, PLAYER DATA, AND BLUEPRINTS. MAKE SURE YOU WANT TO CONTINUE.
	echo pause
	echo echo.
	echo cd /d server/%identity%
	echo del *.sav
	echo del *.sav.*
	echo del *.map
	echo del *.db
	echo del *.db-journal
	echo del *.db-wal
	echo goto finishbp
	echo :wipemap
	echo echo.
	echo echo WARNING: THIS PROCESS WILL WIPE YOUR SERVER MAP AND PLAYER DATA. MAKE SURE YOU WANT TO CONTINUE.
	echo pause
	echo echo.
	echo cd /d server/%identity%
	echo del *.sav
	echo del *.sav.*
	echo del *.map
	echo del player.deaths.*
	echo del player.identities.*
	echo del player.states.*
	echo del player.tokens.*
	echo del sv.files.*
	echo goto finishmap
	echo :finishbp
	echo echo.
	echo echo Server map and blueprints have been wiped!
	echo echo.
	echo echo Don't forget to check your Custom Map link in your startup batch file!
	echo echo Don't forget to delete necessary plugin data!
	echo echo.
	echo pause
	echo exit
	echo :finishmap
	echo echo.
	echo echo Server map has been wiped!
	echo echo.
	echo echo Don't forget to check your Custom Map link in your startup batch file!
	echo echo Don't forget to delete necessary plugin data!
	echo echo.
	echo pause
)>WipeServer.bat

REM [Custom Map] Admin Control
cls
choice /c yn /m "Would you like to add yourself as an Admin to the server?: "
cls
IF ERRORLEVEL 2 goto finish
IF ERRORLEVEL 1 goto admin

:admin
REM [General] This is not a valid Steam64 ID.
set steamid=12102003
echo If you do not know your Steam64 ID, please use these websites: https://steamid.xyz or https://steamid.io
echo.
echo Admin and Moderator users are stored in the users.cfg file in this directory: %forceinstall%\server\%identity%\cfg
echo.
set /p steamid="Enter your Steam64 ID: "

cd /d "%forceinstall%"\server\%identity%\cfg
(
	echo ownerid %steamid% "Name" "Rank"
)>users.cfg
cls
goto finish

:finish
echo All completed! You will see 3 batch files in the %forceinstall% folder:
echo.
echo The StartServer.bat file is used to start your server.
echo The UpdateServer.bat file updates your server [and Oxide if installed] and is used to verify file integrity.
echo The WipeServer.bat file is used to wipe only your server map or map and blueprints.
echo.
choice /c yn /m "Would you like to start the new server now?: "
echo.
IF ERRORLEVEL 2 exit
IF ERRORLEVEL 1 goto serverstart

:serverstart
cd /d "%forceinstall%"
mode 120,30
title %comspec%
StartServer.bat
