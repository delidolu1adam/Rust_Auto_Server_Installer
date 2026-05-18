@echo off
chcp 65001 > NUL
REM Rust Sunucu Kurulum Aracı [v3.0.0]
mode 130,25 & color 02

:intro
title Rust Sunucu Kurulum Aracı
echo Rust sunucu kurulumu aracına hoş geldiniz!
echo.	 
echo.
echo Kurulumu başlatmak için bir tuşa basın...	
pause >nul
cls

:steamcmd
title SteamCMD Kuruluyor...
set steamcmd=C:\SteamCMD
echo SteamCMD'nin kurulmasını istediğiniz dizini girin [Varsayılan: C:\SteamCMD]
echo.
set /p steamcmd="Dizin: "
echo.
md "%steamcmd%"
curl -SL -A "Mozilla/5.0" https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip --output "%steamcmd%"\SteamCMD.zip
cd /d "%steamcmd%"
powershell -command "Expand-Archive -Force SteamCMD.zip ./"
del SteamCMD.zip
cls
echo SteamCMD kurulumu tamamlandı!
echo -------------------

:branch
title Sunucu Kurulum Ayarları
echo.
echo Sunucu sürümünü seçin:
echo.
echo 1: Kararlı Sürüm [Release]
echo 2: Geliştirme Sürümü [Staging]
echo.
echo Not: Geliştirme Sürümü sürümü için doğrudan Oxide desteği yoktur. Bunu daha sonra kendiniz kurmanız gerekiyor.
echo.
set /p choice="1 veya 2 tuşlarına basın: "
if not '%choice%'=='' set choice=%choice:~0,1%
cls
if '%choice%' == '1' goto rustmain
if '%choice%' == '2' goto ruststaging
echo Lütfen 1 veya 2 tuşlarına basın.
goto branch

:rustmain
set forceinstall=C:\RustServer
echo UYARI: Bu dizinde mevcut bir Rust Sunucusu kurulumu olmadığından emin olun.
echo Klasör boş ya da hiç olmamalıdır.
echo.
echo Rust'ı kurmak istediğiniz dizini girin [Varsayılan: C:\RustServer]
echo.
set /p forceinstall="Dizin: "
md "%forceinstall%"
cd /d "%forceinstall%"
title Rust Sunucusu Kuruluyor...
"%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 +quit

REM [Kararlı Sürüm] Güncelleme Dosyası Oluşturuluyor
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM Sunucuyu_Güncelle.bat
	echo mode 110,20
	echo color 02
	echo title Sunucu Güncelleniyor...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 +quit
	echo echo.
	echo echo Rust güncellendi!
	echo echo.
	echo choice /c eh /m "Sunucuyu şimdi başlatmak ister misiniz?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %comspec%
	echo Sunucuyu_Başlat.bat
)>Sunucuyu_Güncelle.bat
cls
echo Rust sunucu kurulumu tamamlandı!
echo ----------------------
echo.
goto modchoice

:ruststaging
set forceinstall=C:\RustStagingServer
echo UYARI: Bu dizinde mevcut bir Rust Sunucusu kurulumu olmadığından emin olun.
echo Klasör boş ya da hiç olmamalıdır.
echo.
echo Geliştirme sürümünü kurmak istediğiniz dizini girin [Varsayılan: C:\RustStagingServer]
echo.
set /p forceinstall="Dizin: "
echo.
md "%forceinstall%"
cd /d "%forceinstall%"
title Geliştirme Sürümü Sunucusu Kuruluyor...
"%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 -beta staging +quit

REM [Geliştirme Sürümü] Güncelleme Dosyası Oluşturuluyor
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM Sunucuyu_Güncelle.bat
	echo mode 110,20
	echo color 02
	echo title Sunucu Güncelleniyor...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 -beta staging +quit
	echo echo.
	echo echo Rust [Geliştirme Sürümü] güncellendi!
	echo echo.
	echo choice /c eh /m "Sunucuyu şimdi başlatmak ister misiniz?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %comspec%
	echo Sunucuyu_Başlat.bat
)>Sunucuyu_Güncelle.bat
cls
echo Geliştirme Sürümü sunucusu kurulumu tamamlandı!
echo ------------------------------
echo.
goto modchoicestaging

:modchoice
title Sunucu Kurulum Ayarları

echo 1: Oxide
echo 2: Carbon
echo 3: Vanilya [Modsuz]
echo.
set /p mod="Oxide veya Carbon yüklemek istiyor musunuz?: "
echo.
if not '%mod%'=='' set mod=%mod:~0,1%
cls
if '%mod%' == '1' goto oxideinstall
if '%mod%' == '2' goto carboninstall
if '%mod%' == '3' goto mapchoice
echo Lütfen 1, 2 veya 3 tuşlarına basın.
echo.
goto modchoice

:modchoicestaging
title Sunucu Kurulum Ayarları

echo 1: Carbon
echo 2: Vanilya [Modsuz]
echo.
set /p mod="Carbon'u yüklemek istiyor musunuz?: "
echo.
if not '%mod%'=='' set mod=%mod:~0,1%
cls
if '%mod%' == '1' goto carboninstallstaging
if '%mod%' == '2' goto mapchoice
echo Lütfen 1 veya 2 tuşlarına basın.
echo.
goto modchoicestaging

:oxideinstall
title Oxide Kuruluyor...
curl -SL -A "Mozilla/5.0" "https://umod.org/games/rust/download" --output "%forceinstall%"\OxideMod.zip
cd /d "%forceinstall%"
powershell -command "Expand-Archive -Force OxideMod.zip ./"
del OxideMod.zip

REM [Oxide] Güncelleme Dosyası Oluşturuluyor
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM Sunucuyu_Güncelle.bat
	echo mode 110,20
	echo color 02
	echo title Sunucu Güncelleniyor...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 +quit
	echo echo.
	echo echo Rust güncellendi!
	echo pause
	echo curl -SL -A "Mozilla/5.0" "https://umod.org/games/rust/download" --output "%forceinstall%"\OxideMod.zip
	echo cd /d "%forceinstall%"
	echo powershell -command "Expand-Archive -Force OxideMod.zip ./"
	echo del OxideMod.zip
	echo echo.
	echo echo Oxide güncellendi!
	echo :start
	echo echo.
	echo choice /c eh /m "Sunucuyu şimdi başlatmak ister misiniz?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %%comspec%%
	echo Sunucuyu_Başlat.bat
)>Sunucuyu_Güncelle.bat
cls
echo Oxide kurulumu tamamlandı!
echo ----------------
echo.
goto mapchoice

:carboninstall
title Carbon Kuruluyor...
curl -SL -A "Mozilla/5.0" "https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Windows.Release.zip" --output "%forceinstall%"\CarbonMod.zip
cd /d "%forceinstall%"
powershell -command "Expand-Archive -Force CarbonMod.zip ./"
del CarbonMod.zip

REM [Carbon] Güncelleme Dosyası Oluşturuluyor
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM Sunucuyu_Güncelle.bat
	echo mode 110,20
	echo color 02
	echo title Sunucu Güncelleniyor...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 +quit
	echo echo.
	echo echo Rust güncellendi!
	echo pause
	echo echo.
	echo choice /c eh /m "Carbon'u yüklemek istediğinizden emin misiniz?: "
	echo IF ERRORLEVEL 2 goto start
	echo IF ERRORLEVEL 1 goto carbonupdate
	echo :carbonupdate
	echo curl -SL -A "Mozilla/5.0" "https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Windows.Release.zip" --output "%forceinstall%"\CarbonMod.zip
	echo cd /d "%forceinstall%"
	echo powershell -command "Expand-Archive -Force CarbonMod.zip ./"
	echo del CarbonMod.zip
	echo echo.
	echo echo Carbon güncellendi!
	echo :start
	echo echo.
	echo choice /c eh /m "Sunucuyu şimdi başlatmak ister misiniz?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %comspec%
	echo Sunucuyu_Başlat.bat
)>Sunucuyu_Güncelle.bat
cls
echo Carbon kurulumu tamamlandı!
echo ----------------
echo.
goto mapchoice

:carboninstallstaging
title Carbon Kuruluyor...
curl -SL -A "Mozilla/5.0" "https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Windows.Release.zip" --output "%forceinstall%"\CarbonMod.zip
cd /d "%forceinstall%"
powershell -command "Expand-Archive -Force CarbonMod.zip ./"
del CarbonMod.zip

REM [Carbon - Geliştirme Sürümü] Güncelleme Dosyası Oluşturuluyor
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM Sunucuyu_Güncelle.bat
	echo mode 110,20
	echo color 02
	echo title Rust [Geliştirme Sürümü] Sunucusu Güncelleniyor...
	echo "%steamcmd%"\steamcmd.exe +force_install_dir "%forceinstall%" +login anonymous +app_update 258550 -beta staging +quit
	echo echo.
	echo echo Rust [Geliştirme Sürümü] sunucusu güncellendi!
	echo echo.
	echo choice /c eh /m "Carbon'u yüklemek istediğinizden emin misiniz?: "
	echo IF ERRORLEVEL 2 goto start
	echo IF ERRORLEVEL 1 goto carbonupdate
	echo :carbonupdate
	echo curl -SL -A "Mozilla/5.0" "https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Windows.Release.zip" --output "%forceinstall%"\CarbonMod.zip
	echo cd /d "%forceinstall%"
	echo powershell -command "Expand-Archive -Force CarbonMod.zip ./"
	echo del CarbonMod.zip
	echo echo.
	echo echo Carbon güncellendi!
	echo :start
	echo echo.
	echo choice /c eh /m "Sunucuyu şimdi başlatmak ister misiniz?: "
	echo IF ERRORLEVEL 2 exit
	echo IF ERRORLEVEL 1 goto serverstart
	echo :serverstart
	echo mode 120,30
	echo title %comspec%
	echo Sunucuyu_Başlat.bat
)>Sunucuyu_Güncelle.bat
cls
echo Carbon kurulumu tamamlandı!
echo ----------------
echo.
goto mapchoice

:mapchoice
title Sunucu Kurulum Ayarları
choice /c eh /m "Özel bir harita dosyası kullanıyor musunuz? Eğer ilk kurulumunuzsa muhtemelen kullanmıyorsunuzdur: "
cls
IF ERRORLEVEL 2 goto startproc
IF ERRORLEVEL 1 goto rusteditchoice

:rusteditchoice
choice /c eh /m "Özel haritaların çalıştırılabilmesi için gerekli RustEdit DLL dosyasını kurmak ister misiniz?: "
echo.
IF ERRORLEVEL 2 goto startcustom
IF ERRORLEVEL 1 goto rusteditinstall

:rusteditinstall
title RustEdit DLL Kuruluyor...
powershell -Command "Invoke-WebRequest https://github.com/k1lly0u/Oxide.Ext.RustEdit/raw/master/Oxide.Ext.RustEdit.dll -OutFile '"%forceinstall%"\RustDedicated_Data\Managed\Oxide.Ext.RustEdit.dll'
cls
echo RustEdit DLL kurulumu tamamlandı!
echo -----------------------
echo.
goto startcustom

:startproc
cd /d "%forceinstall%"
title Başlatma Dosyası Oluşturuluyor...
set serverport=28015
set /p serverport="Sunucu port numaranızı girin [Varsayılan: 28015]: "
echo.
set rconport=28016
set /p rconport="RCON port numaranızı girin [Varsayılan: 28016]: "
echo.
set queryport=28017
set /p queryport="Sunucu sorgu portunuzu girin [Varsayılan: 28017]: "
echo.
set identity=RustServer
echo Kimlik adında boşluk bırakmayın!
set /p identity="Sunucu kimliğinizi girin [Varsayılan: RustServer]: "
echo.
set seed=1337
set /p seed="Harita tohumunu girin [Varsayılan: 1337]: "
echo.
set worldsize=4500
set /p worldsize="Harita boyutunuzu girin [Varsayılan: 4500]: "
echo.
set maxplayers=100
set /p maxplayers="Sunucuya katılabilecek oyuncu sayısını girin [Varsayılan: 100]: "
echo.
set hostname=Rust Sunucum
set /p hostname="Sunucu listesinde görünecek sunucu adını girin [Varsayılan: Rust Sunucum]: "
echo.
set description=Rust sunucu açıklaması
set /p description="Sunucu açıklamasını girin [Varsayılan: Rust sunucu açıklaması]: "
echo.
set rconpw=1234567890
set /p rconpw="Güvenli bir RCON parolası oluşturun [Varsayılan: 1234567890]: "
echo.
set serverurl="https://"
set /p serverurl="Sunucu veya Discord davet bağlantınızı girin [Varsayılan: https://discord.com/example]: "
echo.
set headerimage="https://"
echo HATIRLATMA: Sunucu afişi için kullanacağınız görüntü en fazla 1024x512 boyutlarında olmalıdır.
set /p headerimage="Sunucu afiş bağlantınızı girin [Varsayılan: https://example.com/example.png]: "

REM [Prosedürel Harita] Başlatma ​​Dosyası Oluşturuluyor
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
)>Sunucuyu_Başlat.bat

REM [Prosedürel Harita] server.cfg Dosyası Oluşturuluyor
md "%forceinstall%"\server\%identity%\cfg
cd /d "%forceinstall%"\server\%identity%\cfg
(
	echo fps.limit "100"
)>server.cfg

REM [Prosedürel Harita] Sıfırlama Dosyası Oluşturuluyor
cd /d "%forceinstall%"
(
	echo @echo off
	echo chcp 65001 > NUL
	echo REM Sunucuyu_Sıfırla.bat
	echo mode 110,20
	echo color 02
	echo echo Bu dosya sunucunuzu sıfırlamanızı sağlar. Devam etmek istediğinizden emin olun.
	echo echo.
	echo pause
	echo echo.
	echo choice /c eh /m "İnşa planlarını silmek istiyor musunuz?: "
	echo IF ERRORLEVEL 2 goto wipemap
	echo IF ERRORLEVEL 1 goto wipebp
	echo :wipebp
	echo echo.
	echo echo UYARI: BU İŞLEM SUNUCUNUZUN HARİTA, OYUNCU VE İNŞA PLANLARINI SİLECEKTİR. DEVAM ETMEK İSTEDİĞİNİZDEN EMİN OLUN.
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
	echo echo UYARI: BU İŞLEM SUNUCUNUZUN HARİTASINI VE OYUNCU VERİLERİNİ SİLECEKTİR. DEVAM ETMEK İSTEDİĞİNİZDEN EMİN OLUN.
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
	echo echo Sunucu haritası ve inşa planları sıfırlandı!
	echo echo.
	echo echo StartServer dosyanızdaki harita tohumunu değiştirmeyi unutmayın!
	echo echo Gerekli eklenti verilerini elle silmeyi unutmayın!
	echo echo.
	echo pause
	echo exit
	echo :finishmap
	echo echo.
	echo echo Sunucu haritası sıfırlandı!
	echo echo.
	echo echo Sunucuyu_Başlat.bat dosyanızdaki harita tohumunu değiştirmeyi unutmayın!
	echo echo Gerekli eklenti verilerini elle silmeyi unutmayın!
	echo echo.
	echo pause
)>Sunucuyu_Sıfırla.bat

REM [Prosedürel Harita] Yönetici Kontrolü
cls
choice /c eh /m "Kendinizi sunucuya Yönetici olarak eklemek ister misiniz?: "
cls
IF ERRORLEVEL 2 goto finish
IF ERRORLEVEL 1 goto admin

:startcustom
cd /d "%forceinstall%"
title Özel Harita Başlatma Dosyası Oluşturuluyor...
set serverport=28015
set /p serverport="Sunucu port numaranızı girin [Varsayılan: 28015]: "
echo.
set rconport=28016
set /p rconport="RCON port numaranızı girin [Varsayılan: 28016]: "
echo.
set queryport=28017
set /p queryport="Sunucu sorgu portunuzu girin [Varsayılan: 28017]: "
echo.
set identity=RustServer
echo Kimlik adında boşluk bırakmayın!
set /p identity="Sunucu kimliğinizi girin [Varsayılan: RustServer]: "
echo.
set levelurl=https://www.dropbox.com/s/ig1ds1m3q5hnflj/proc_install_1.0.map?dl=1
set /p levelurl="Özel haritanızın indirme bağlantısını girin: "
echo.
set maxplayers=100
set /p maxplayers="Sunucuya katılabilecek oyuncu sayısını girin [Varsayılan: 100]: "
echo.
set hostname=Rust Sunucum
set /p hostname="Sunucu listesinde görünecek sunucu adını girin [Varsayılan: Rust Sunucum]: "
echo.
set description=Yeni bir Rust sunucusu.
set /p description="Sunucu açıklamasını girin [Varsayılan: Yeni bir Rust sunucusu.]: "
echo.
set rconpw=1234567890
set /p rconpw="Güvenli bir RCON parolası oluşturun [Varsayılan: 1234567890]: "
echo.
set serverurl="https://"
set /p serverurl="Sunucu veya Discord davet bağlantınızı girin [Varsayılan: https://discord.com/example]: "
echo.
set headerimage="https://"
echo HATIRLATMA: Sunucu afişi için kullanacağınız görüntü en fazla 1024x512 boyutlarında olmalıdır.
set /p headerimage="Sunucu afiş bağlantınızı girin [Varsayılan: https://example.com/example.png]: "

REM [Özel Harita] Başlatma ​​Dosyası Oluşturuluyor
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
)>Sunucuyu_Başlat.bat

REM [Özel Harita]server.cfg Dosyası Oluşturuluyor
md "%forceinstall%"\server\%identity%\cfg
cd /d "%forceinstall%"\server\%identity%\cfg
(
	echo fps.limit "100"
)>server.cfg

REM [Özel Harita]Sıfırlama Dosyası Oluşturuluyor
cd /d "%forceinstall%"
(
	echo @echo off
	echo chcp 65001 > NUL		
	echo REM Sunucuyu_Sıfırla.bat
	echo mode 110,20
	echo color 02
	echo echo Bu dosya sunucunuzu sıfırlamanızı sağlar. Devam etmek istediğinizden emin olun.
	echo echo.
	echo pause
	echo echo.
	echo choice /c eh /m "İnşa planlarını silmek istiyor musunuz?: "
	echo IF ERRORLEVEL 2 goto wipemap
	echo IF ERRORLEVEL 1 goto wipebp
	echo :wipebp
	echo echo.
	echo echo UYARI: BU İŞLEM SUNUCUNUZUN HARİTA, OYUNCU VE İNŞA PLANLARINI SİLECEKTİR. DEVAM ETMEK İSTEDİĞİNİZDEN EMİN OLUN.
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
	echo echo UYARI: BU İŞLEM SUNUCUNUZUN HARİTASINI VE OYUNCU VERİLERİNİ SİLECEKTİR. DEVAM ETMEK İSTEDİĞİNİZDEN EMİN OLUN.
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
	echo echo Sunucu haritası ve inşa planları sıfırlandı!
	echo echo.
	echo echo Başlangıçta toplu iş dosyanızdaki Özel Harita bağlantınızı kontrol etmeyi unutmayın!
	echo echo Gerekli eklenti verilerini silmeyi unutmayın!
	echo echo.
	echo pause
	echo exit
	echo :finishmap
	echo echo.
	echo echo Sunucu haritası sıfırlandı!
	echo echo.
	echo echo Başlangıçta toplu iş dosyanızdaki Özel Harita bağlantınızı kontrol etmeyi unutmayın!
	echo echo Gerekli eklenti verilerini silmeyi unutmayın!
	echo echo.
	echo pause
)>Sunucuyu_Sıfırla.bat

REM [Özel Harita] Yönetici Kontrolü
cls
choice /c eh /m "Kendinizi sunucuya Yönetici olarak eklemek ister misiniz?: "
cls
IF ERRORLEVEL 2 goto finish
IF ERRORLEVEL 1 goto admin

:admin
REM [Genel] Bu geçerli bir Steam64 ID değildir.
set steamid=12102003
echo Steam64 kimliğinizi bilmiyorsanız lütfen bu web sitelerini kullanın: https://steamid.xyz veya https://steamid.io
echo.
echo Yönetici ve Moderatör kullanıcıları şu dizindeki users.cfg dosyasında saklanır: %forceinstall%\server\%identity%\cfg
echo.
set /p steamid="Steam64 kimliğinizi girin: "

cd /d "%forceinstall%"\server\%identity%\cfg
(
	echo ownerid %steamid% "Ad" "Rütbe"
)>users.cfg
cls
goto finish

:finish
echo Her şey tamamlandı! %forceinstall% klasöründe 3 adet toplu işlem dosyası göreceksiniz:
echo.
echo Sunucuyu_Başlat.bat dosyası sunucunuzu başlatmak için kullanılır.
echo Sunucuyu_Güncelle.bat dosyası sunucunuzu [ve kuruluysa Oxide] günceller ve dosya bütünlüğünü doğrulamak için kullanılır.
echo Sunucuyu_Sıfırla.bat dosyası sunucunuzun sadece haritasını veya harita ve inşa planlarını sıfırlamak için kullanılır.
echo.
choice /c eh /m "Yeni sunucuyu şimdi başlatmak ister misiniz?: "
echo.
IF ERRORLEVEL 2 exit
IF ERRORLEVEL 1 goto serverstart

:serverstart
cd /d "%forceinstall%"
mode 120,30
title %comspec%
Sunucuyu_Başlat.bat
