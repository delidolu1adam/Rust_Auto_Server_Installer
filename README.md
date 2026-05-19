![Logo](https://github.com/delidolu1adam/Rust_Auto_Server_Installer/blob/main/images/rust_server_installer.png?raw=true)

ℹ️ About
=========================
This Windows script is designed to install a Rust server on your Windows computer with a single click. This Windows script includes the following features.

✅ Features
=========================
- SteamCMD installation
- Normal and Test server installation options
- Support for adding custom maps and RustEdit DLL files
- Oxide support
- Carbon support
- Server configuration option
- Option to add administrator during installation
- Option to start the server after installation is complete

NOTE: After installation is complete, the "ServerStart, ServerUpdate, and ServerWipe" files will be created in the main directory. You can use these files to start, update, or reset your server.

🛡️Antivirus and Security
=========================
If you are using any antivirus program that manages SSL certificates, you may need to disable it for this script to work properly. Kaspersky and Bitdefender are two of the most common antivirus programs that cause these kinds of problems. Please continue reading the next steps for your own safety!

🦠 Data Leak and Bitcoin Mining
=========================
This script is completely open source and none of the code is encrypted; you can examine all of the code with complete peace of mind.

Ignore those who make false and misleading accusations such as "this file contains a virus," "my data has been stolen," etc. If you wish, you can scan the file for viruses before downloading it using the download link [here](https://www.virustotal.com/gui/home/upload) or after downloading the file and uploading it [here](https://www.virustotal.com/gui/home/url).

> [!CAUTION]
> You don't need to know coding to find out what these codes do and what their purpose is. Click [here](https://chatgpt.com/), then type your question: **Do these codes contain viruses? What is their purpose? What do they do? Will my data be stolen? Do they mine Bitcoin?** After typing this question, press **SHIFT + ENTER** to scroll down two lines, paste the code you're curious about, and send it. :)

❔ How to Use?
=========================
- Right-click on the Rust_Server_Setup_Tool.bat file you downloaded and run it. - Then, continue the installation by reading and filling in the instructions in the Command window. - If no values ​​are entered, all values ​​will be added as defaults.

> [!NOTE]
> If you need help, you can watch the relevant video on my YouTube channel by clicking [here](https://youtube.com/@okolay). Or you can join my Discord server by clicking [here](https://dsc.gg/okolay).

- Tested on Windows 10, Windows 11, and Windows Server 2019, and can be run without any additional tools. - For Windows Server 2016, 2012R2, and Windows 8/8.1 support, you need to install CURL on your computer by clicking [here](https://curl.se/download.html).

> [!WARNING]
> If you change your server ID name (Default: RustServer) after running this script, you will also need to edit two lines in the WipeServer.bat file located in the main directory.

Replace the ID name `cd /d server/RustServer` on line 17 with your new name.
Replace the ID name `cd /d server/RustServer` on line 30 with your new name.

> [!NOTE]
> It is not recommended to move your server's installation directory after the script runs, as the UpdateServer.bat file will no longer work as expected. You can manually update the file to reference the new directory. However, it is generally easier and more recommended to run the script from scratch to complete the Rust server installation, then copy your server and oxide or carbon folders, ensuring your identity remains the same.

🗺️ Custom Maps
=========================
- An important point to note regarding the use of custom maps!
- Custom maps must be a direct downloadable link; that is, the link must immediately start the map download process. - For example, https://www.dropbox.com/s/ig1ds1m3q5hnflj/proc_install_1.0.map?dl=1 is a direct download link. - For Dropbox links, make sure that "dl=1" is at the end of the link and not "dl=0".

🛜 How can I join your server?
=========================
- After completing the server installation, if you started the server, you should already have an open command window with numbers [similar to this](https://ibb.co/KjgCZ4md) at the bottom, which means your server is working correctly. - If you refused to start the server after installation, you can start the server by running the ServerStart.bat file located in the directory where the server is installed.
- To connect to the server, press F1 and type the following command in the CONSOLE tab:
```bash
client.connect localhost
```
- If you want to connect from a different computer on the same network, first find out the IPv4 address where the server is installed and type the following command in the CONSOLE tab:
```bash
client.connect 192.168.**.**
```

🛜 How can people who are not on the same network join?
=========================
To allow people outside your local network to join your server, you will need to forward the UDP Server Port and the UDP Query Port to the computer where your server is installed.

Additionally, in most cases you will need to allow the necessary ports to pass through the Windows Defender Firewall.

While each router/firewall is different, you can watch a video explaining the SRTBull process [here](https://www.youtube.com/watch?v=PYfpOUNVKoM).

❤️ Special Thanks
=========================
We thank `@lilciv` for creating and sharing this tool with us.
