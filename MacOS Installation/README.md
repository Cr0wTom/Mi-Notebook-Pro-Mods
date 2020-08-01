# Mi Notebook Pro for macOS Catalina

Required files for MacOS installation, including:

- EFI folder with all the kexts and drivers
- config.plist file (please change the SMBIOS after your installation using Clover Configuratior. [Instructions.](https://www.tonymacx86.com/threads/guide-how-to-configure-your-systems-smbios-correctly.198155/))
- Improved Color Profile in Color Profile folder.
- Higher DPI script in the HIDPI folder
- Headphones problem fix in the ALCPlugFix folder

## MacOS Installation

0. We firstly have to boot into BIOS (by pressing F2) and disable Secure boot. (Basic supported installation instructions can be found [here.](https://www.tonymacx86.com/threads/unibeast-install-macos-mojave-on-any-supported-intel-based-pc.259381/))
1. We create the installation USB using the guide mentioned earlier and replace the EFI folder from the one in this repo.
2. We boot from  USB and complete the installation.
3. After the installation we boot again from the USB and select the new MacOS drive in order to boot.
4. We mount the EFI partition using [EFI Mounter](https://www.tonymacx86.com/resources/efi-mounter-v3.280/) and replace the whole EFI folder with the one from this repo.
5. You are ready to rolll...

**Update:** There is a really handy bash script that automates most of the post installation and fixes parts for MacOS on Mi Notebook Pro (MX version) that daliansky made and you can find it in his [repo.](https://github.com/daliansky/XiaoMi-Pro-Hackintosh) Just clone the repo and run the install.sh script in Terminal.

## Troubleshooting 

- If headphones are not working, use the ALCPlugFix from the folder, and run `install.command` in a Terminal, and restart to patch the audio driver.
- If the tracpad doesn't work during installation, please plug a wired mouse or a wireless mouse projector before the installation. After the installation completes, open `Terminal.app` and type `sudo kextcache -i /`. Wait for the process ending and restart the device. Enjoy your trackpad!
- Some i5 devices may fail to drive microphone, in order to fix:
    - Use Text Editor.app to open /EFI/CLOVER/config.plist
    - Find the following code: <key>layout-id</key> <data>YwAAAA==</data>
    - Replace with this: <key>layout-id</key> <data>HAAAAA==</data>
    - Restart
- CPU native support. For people who want better performance (or longer battery life), please replace `/CLOVER/kexts/Other/CPUFriendDataProvider.kext` with the ones in the Performance Files folder. The default one is the balanced.
- Other ACPI fixes use hotpatch; related files are located in `/CLOVER/ACPI/patched`.
-  USB Port Patching uses Intel FB-Patcher, related file is located in `/CLOVER/kexts/Other/USBPower.kext`.
- Use HDMI port on the left side may cause black internal display, please try to reopen the lid.
- Native Brightness hotkey support; related file is located in `/CLOVER/ACPI/patched/SSDT-LGPA.aml`.
- Native Bluetooth is [not working well](https://github.com/daliansky/XiaoMi-Pro/issues/50). The model is `Intel® Dual Band Wireless-AC 8265`. There are two options you can do with it:
    - Disable it to save power or use a BT dongle. Please read instructions here: [#24](https://github.com/daliansky/XiaoMi-Pro/issues/24).
    - Buy and insert a supported wireless card in M.2 slot and carefully solder D+ and D- wires to the WLAN_LTE slot. After that, please replace the archive in [#7](https://github.com/stevezhengshiqi/XiaoMi-Pro/issues/7).
- Recent model uses `PM981` SSD instead of `PM961`. This EFI doesn't fully support `PM981`, and `PM981` users can replace their SSDs or visit [How to fix PM981 in 10.3.3]( https://www.tonymacx86.com/threads/how-to-fix-pm981-in-10-13-3-17d47.245063/).
- To install the color profile(sRGB 84% -> 97,1, Calibrated on Spyder5) from the folder:
    - Copy `NV156FHM-N61.icm` to `~/Library/ColorSync/Profiles`
    - Open `System Preferences -> Displays -> Color`
    - Select `NV156FHM-N61` profile
    - Reboot
- In order to open native Apple HiDPI settings for non-Retina screen(no need for RDM), we have to run the following in a terminal window:
    - $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/xzhih/one-key-hidpi/master/hidpi.sh)"
    - We then run `install.command` file from the HiDPI folder. This program is used to avoid wake problems.
- There are new kexts to fix the bluetooth issues and now Bluetooth can work from cold boot with not so many issues. Kexts can be found [here](https://github.com/zxystd/IntelBluetoothFirmware). Process thanks to [jackreeves](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/issues/323#issuecomment-570912337)
    - Mount EFI using Clover Configurator
    - Ensure using latest kexts in EFI.
    - Add both `IntelBluetoothFirmware.kext` and `IntelBluetoothInjector.kext` to `/EFI/CLOVER/Kext/Other`
    - Remove startup script id installed for booting drivers via VMware
    - Rebuild kext using terminal command `sudo kextcache -i /`
    - Shutdown not restart and wait for 10 sec, Power on
    - Rebuild kext using terminal command `sudo kextcache -i /`
    - Shutdown not restart and wait for 10 sec, Power on
- In this tutorial we do not mention how to configure your plist with new serial number and customized info. For that reason to fix iMessage and other Mac related services follow [this](https://www.tonymacx86.com/threads/an-idiots-guide-to-imessage.196827/) guide, it never failed me. 

## WiFi Installation

As many of you know, there is huge progress in the Intel WiFi comunithy, and there is a stable way to use Mi Notebook Pro's internal WiFi. There is a woring project which [spoofs Ethernet](https://github.com/AppleIntelWifi/adapter), and I can safelly say that right now is really stable. After the installation, copy the [HeliPort](https://github.com/zxystd/HeliPort) app in your Application folder(which is also really stable right now) and make it run with boot. This will present a wifi icon in your menu bar which you can use to connect to WiFi networks. :) Enjoy

## What is Working

- Intel UHD 620 graphics (not the MX150, which is disabled via SSDT and will never work). Some minor glitches on boot
- Keyboard
- Trackpad
- Backlight. Working in system preferences, but cannot be adjusted with default keys. It should be possible to map this using some external keyboard-shortcut-binding software.
- Webcam
- Sleep/Wake. (Does not work if you install Mac OS X on an external drive)
- Audio (Speakers and jack)
- HDMI
- Battery status. Sometimes it gets a while for the battery level to appear on the status bar.
- Usb-c ports have been confirmed to work for display output.
- Bluetooth 4.1 (Fix in troubleshooting section)
- Wireless Intel AC 8265 (for now see [here](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/issues/330#issuecomment-582377174), i will keep updating)
    - Easy Solution: use USB wifi dongle (I use the TP-LINK TL-WN725N with available drivers from the companys website.).
    - Hard Solution: See [Section 4 in this post](https://www.tonymacx86.com/threads/guide-xiaomi-mi-notebook-pro-high-sierra-10-13-6.242724/).

## Not Working

- Fingerprint sensor (probably will never work).
- NVIDIA MX 150. Disabled via SSDT (probably will never work).
- SD Card Reader (probably will never work).

## Credits

- [RehabMan](https://github.com/RehabMan)
- [qeeqez](https://github.com/qeeqez)
- [vit9696](https://github.com/vit9696)
- [PMheart](https://github.com/PMheart)
- [alexandred](https://github.com/alexandred)
- [hieplpvip](https://github.com/hieplpvip)
- [FallenChromium](https://github.com/FallenChromium)
- [Javmain](https://github.com/javmain)
- [johnnync13](https://github.com/johnnync13)
- [stevezhengshiqi](https://github.com/stevezhengshiqi)
- [xzhih](https://github.com/xzhih)
- [zysuper](https://github.com/zysuper)
- [zxystd](https://github.com/zxystd)
- [jackreeves](https://github.com/jackreeves)
- [daliansky](https://github.com/daliansky)

## Support and discussion

- [[Guide] Xiaomi Mi Notebook Pro High Sierra 10.13.6](https://www.tonymacx86.com/threads/guide-xiaomi-mi-notebook-pro-high-sierra-10-13-6.242724)
- [Dalianskys Repo](https://github.com/daliansky/XiaoMi-Pro-Hackintosh)

- Last sources update: 27-06-2020
- Support for MacOS Catalina, High Sierra and Mojave
