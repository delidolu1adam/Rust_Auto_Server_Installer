![Logo](https://github.com/delidolu1adam/Rust_Auto_Server_Installer/blob/main/images/rust_server_installer.png?raw=true)

ℹ️ Hakkında
=========================
Bu Windows komut dosyası, tek bir tıklamayla Windows bilgisayarınıza bir Rust sunucusu kurmak için tasarlanmıştır.
Bu Windows komut dosyası, aşağıdaki özellikleri içermektedir.

✅ Özellikler
=========================
- SteamCMD kurulumu
- Normal ve Test sunucusu kurulumu seçeneği
- Özel harita ve RustEdit DLL dosyası ekleme desteği
- Oxide desteği
- Carbon desteği
- Sunucu yapılandırma seçeneği
- Kurulum sırasında yönetici ekleme seçeneği
- Kurulum tamamlandıktan sonra sunucuyu başlatma seçeneği

NOT: Kurulum tamamlandıktan sonra ana dizinde "ServerStart, ServerUpdate, ServerWipe" dosyaları oluşturulur. Bu dosyalarla sunucunuzu başlatabilir, güncelleyebilir veya sıfırlayabilirsiniz.

🛡️ Antivirüs ve Güvenlik
=========================
SSL sertifikalarını yöneten herhangi bir antivirüs programı kullanıyorsanız, bu komut dosyasının düzgün çalışması için onu devre dışı bırakmanız gerekebilir.
Kaspersky ve Bitdefender, bu tür sorunlara neden olan en yaygın iki antivirüs programıdır.
Lütfen kendi güvenliğiniz için bir sonraki adımları okumaya devam edin!

🦠 Veri Sızıntısı ve Bitcoin Madenciliği
=========================
Bu komut dosyası tamamen açık kaynak kodludur ve hiç bir kod şifrelenmemiştir, tüm kodları gönül rahatlığıyla inceleyebilirsiniz.

Bu dosya da virüs var, bilgilerim çalındı vb. yalan yanlış ithamlarda bulunan kişilere kulak asmayın. Dilerseniz indirmeden önce dosyanın indirme bağlantısını kullanarak [buradan](https://www.virustotal.com/gui/home/upload) veya dosyayı indirdikten sonra dosyayı karşıya yükleyerek [buradan](https://www.virustotal.com/gui/home/url) virüs taraması yapabilirsiniz.

> [!CAUTION]
> Kodların ne işe yaradığını ve hangi amaçla yazıldığını öğrenmek için kod bilgisine sahip olmanıza da gerek yok [buraya](https://chatgpt.com/) tıklayın ardından **Bu kodlarda virüs var mı? Hangi amaçla yazılmış? Ne işe yarıyor? Bilgilerim çalınır mı? Bitcoin madenciği yapıyor mu?** sorununu yazdıktan sonra **SHIFT + ENTER** tuşlarına basarak 2 satır aşağı inin ve merak ettiğiniz kodu da yapıştırıp gönderin. :)

❔ Nasıl Kullanılır?
=========================
- İndirmiş olduğunuz Rust_Sunucu_Kurulumu_Aracı.bat dosyasına sağ tıklayın ve çalıştırın.
- Ardından Komut penceresindeki talimatları okuyarak ve doldurarak kuruluma devam edin.
- Herhangi bir değer girilmezse, tüm değerler Varsayılan olarak eklenecektir.

> [!NOTE]
> Eğer yardıma ihtiyacınız olursa [buraya](https://youtube.com/@okolay) tıklayarak Youtube kanalımdaki ilgili videoyu izleyebilirsiniz. Ya da [buraya](https://dsc.gg/okolay) tıklayarak Discord sunucuma katılabilirsiniz.

- Windows 10, Windows 11 ve Windows Server 2019 sürümlerinde test edilmiştir ve herhangi bir ek araca ihtiyaç duymadan çalıştırılabilir.
- Windows Server 2016, 2012R2 ve Windows 8/8.1 desteği için [buraya](https://curl.se/download.html) tıklayarak bilgisayarınıza CURL kurmanız gerekmektedir.

> [!WARNING]
> Bu komut dosyasını çalıştırdıktan sonra (Varsayılan: RustServer) sunucu kimliği adınızı değiştirirseniz, ana dizinde bulunan WipeServer.bat dosyasındaki iki satırı da düzenlemeniz gerekir.

17. satırdaki `cd /d server/RustServer` kimlik adını yeni adınızla değiştirin.
30. satırdaki `cd /d server/RustServer` kimlik adını yeni adınızla değiştirin.

> [!NOTE]
> Komut dosyası çalıştıktan sonra sunucunuzun kurulum dizinini taşımanız önerilmez, çünkü UpdateServer.bat dosyası artık beklendiği gibi çalışmayacaktır. Dosyayı yeni dizini referans alacak şekilde elle güncelleyebilirsiniz. Ancak genellikle Rust sunucu kurulumunu tamamlamak için komut dosyasını sıfırdan çalıştırmak ve ardından sunucu ve oxide veya carbon klasörlerinizi kopyalamak, kimlik adınızın aynı kalmasını sağlamak daha kolay ve önerilen bir yöntemdir.

🗺️ Özel Haritalar
=========================
- Özel haritaların kullanımıyla ilgili dikkat edilmesi gereken bir nokta!
- Özel haritalar, doğrudan indirilebilir bir bağlantı olmalıdır; yani bağlantı, harita indirme işlemini hemen başlatmalıdır.
- Örneğin, https://www.dropbox.com/s/ig1ds1m3q5hnflj/proc_install_1.0.map?dl=1 doğrudan indirme bağlantısıdır.
- Dropbox bağlantıları için, bağlantının sonunda "dl=1" olduğundan ve "dl=0" olmadığından emin olun.

🛜 Sunucunuza Nasıl Katılabilirsiniz?
=========================
- Sunucu kurulumu tamamlandıktan sonra sunucuyu başlattıysanız zaten açık bir komut penceresi olmalı ve en altında [şuna benzer](https://ibb.co/KjgCZ4md) sayılar görünmeli, bu sunucunuzun sorunsuz çalıştığı anlamına gelir.
- Eğer kurulum sonrasında sunucuyu başlatmayı reddetiyseniz, sunucunun kurulu olduğu dizindeki ServerStart.bat dosyasını çalıştırarak sunucuyu başlatabilirsiniz.

- Sunucuya bağlanmak için F1 tuşuna basın ve KONSOL sekmesine şu komutu yazın:
`client.connect localhost`

- Eğer aynı ağda bulunan farklı bir bilgisayardan bağlanmak istiyorsanız, önce sunucunun kurulu olduğu IPv4 adresini öğrenin ve KONSOL sekmesine şu komutu yazın:
`client.connect `192.168.**.**`

🛜 Aynı Ağda Olmayanlar Nasıl Katılabilir?
=========================
Yerel ağınızın dışındaki kişilerin sunucunuza katılmasını sağlamak için, UDP Sunucu Bağlantı Noktasını ve UDP Sorgu Bağlantı Noktasını sunucunuzun kurulu olduğu bilgisayara yönlendirmeniz gerekecektir.
Bunun yanı sıra, çoğu durumda gerekli bağlantı noktalarının Windows Defender Güvenlik Duvarı'ndan geçmesine izin vermeniz gerekecektir.
Her yönlendirici/güvenlik duvarı farklı olsa da, SRTBull sürecini açıklayan videoyu [buradan](https://www.youtube.com/watch?v=PYfpOUNVKoM) izleyebilirsiniz.

❤️ Özel Teşekkür
=========================
Bu aracı oluşturup bizimle paylaştığı için `@lilciv`'e teşekkür ederiz.
