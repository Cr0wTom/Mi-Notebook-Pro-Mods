:warning: **Laptop has been sold, so there will be no meaningful updates in this repo any more :) Thank you for your support all these years.**

# Mi-Notebook-Pro-Mods
Mod collection with instructions for the Xiaomi Mi Notebook Pro:

- BIOS Update
- Fan Curve Patch
- Intel SpeedShift Technology (SST) Enable
- CPU undervolting feature enable
- Create a custom TDP profile
- MacOS custom Installation
- MacOS Patches
- Intel ME Update
- BIOS Patching


Modification collection for the i5/i7 (8th Gen) Mi Notebook Pro (with the MX150 GPU).

**Disclaimer 1:** Before every mod ensure that you have AT LEAST 80% battery and that you are pluged in to a power outlet, unless stated otherwise.

**Disclaimer 2:** The methods presented in this repo are not supported by Xiaomi, and may result in undesirable results. I do not take any responsibility for broken or bricked devices. 
    
**Disclaimer 3:** If you use BitLocker encryption in your drive, keep your keys stored somewhere safe, as you might need them to decrypt your drive after BIOS updates or mods.

**Latest Available BIOS:** XMAKB5R0P0E07

**[Official Driver Download Link](https://www.mi.com/service/bijiben/drivers/15/)**

## BIOS Update

1. Download [Rufus](https://rufus.akeo.ie/) and format a usb to be “GPT Partitioning scheme for UEFI” and Filesystem set as “FAT32.” USB must be in the top USB port; usb boot does not work on the other.

2. Copy the files from tha BIOS zip that you want to install (603 is the latest available BIOS at the time of writing), to the USB device partitioned earlier, and make sure that the EFI folder is placed at the root folder of the device.

3. Shutdown the laptop.

4. Switch on and keep pressing F2 to enter BIOS. Disable secure boot, clear keys and enable USB boot. Set a supervisior password and press F10 to save changes and restart. Shutdown PC.

5. Switch on and keep pressing F12 to enter boot selection menu, where we select the USB drive. The UEFI shell should load until we see a fs: .

6. We type unlockme in the to unlock bios. This is will boot into windows but there is a high chance we wont be able to login. Shutdown the PC.

7. Repeat step 5 and then we type flash to begin the flash process. This will reboot and start flashing. BE PATIENT and let it finish. It will boot into windows finally.

8. Fingerprint might not work, we will need to type in our password to log in.

9. We can use same instructions as Step 4 to enable secure boot and other settings we may want.

**Disclaimer:** Use the XMAKB5R0P0805 with caution. It has been dumped from the 1070 new models and not yet widely tested on earlier models. I will test it once I will find some more time.

**Downgrade** To downgrade to an earlier supported BIOS you have to open the platform.ini file that exists inside the BIOS zip and locate the string **[Bios_Version_Check] Flag=1** and change it to Flag=0. After that you follow the BIOS update directions from above.

**UPDATE:** For the latest XMAKB5R0P0906 BIOS update, just unzip the folder and execute the H2OFFT-Wx64.exe executable, in a Windows installation.

**UPDATE 2:** The new XMAKB5R0P0A07 and XMAKB5R0P0E07 BIOS's update come in a .exe format so use at your own risk. It is stable from my testing with no obvious backdoors, it comes from a trusted source, but you never know...

## Mod Installation

Several mods are available in the Patches folder. In order for them to work you need to be in the 603 BIOS version, so update if needed.

**UPDATE:** For BIOS version 805 patches unzip the Patches/EC/EC805 Patches.zip file and use the appropriate files for patching. No 906 BIOS patches yet.

###### Fan Curve Patch  

The default version is +12°, if you need the version +20°, replace ec604.bin with the corresponding one from the /EC folder. If you need to be able to charge the laptop through the hub, use the /EC502 folder. If you want to create your own profile, take the original EC file from the EC/Orig or EC502/Orig folder and edit using the tool of this [repo](https://github.com/saltukkos/xiaomi-notebook-pro-bios-patcher).

0. Shift + Right Click on the Patch folder and select Open PowerShell window here.
1. Make a full backup of your BIOS firmware by executing the following: .\backup.cmd
2. Save file mybackup.bin outside of laptop 
3. Remove write protection from BIOS by executing: .\bios_unlock.cmd
4. Reboot
5. Save your EC by executing: .\readEC.cmd
6. The ec.bin file will appear, this is your EC backup.
7. Flash the new EC of your choise by executing: .\flashEC.cmd
8. The ec604.bin will be flashed.
9. Now, we first pull out the power cable, then completely turn off the laptop (Start->Shutdown, not just close the lid), wait a minute, insert the cable, wait 5 seconds, turn on the laptop.
10. Put back write protection for BIOS by executing: .\bios_lock.cmd

###### Enabling Intel SpeedShift Technology (SST)  

0. Shift + Right Click on the Patch folder and select Open PowerShell window here. 
1. Execute the following script: .\script speedshift_unlock.cmd

###### Enable CPU undervolting feature  

0. Shift + Right Click on the Patch folder and select Open PowerShell window here. 
1. Execute the following script: .\script voltage_unlock.cmd

Alternative method (From Russian Forum)

0. Shift + Right Click on the Patch/Voltage Patch folder and select Open PowerShell window here.
1. Execute the following script: .\Patcher

###### MacOS Patches  

- Change the parameter DVMT: Edit and run the script .\DVMT_set.cmd in a Windows PowerShell

- 0xE2 Lock: Run the script .\CFG_unlock.cmd

###### Official fan noise fix and always on keyboard enable

- Just install the XMAKB5R0P0906 BIOS update and alter the keyboard option in the BIOS menu.

###### Slow SSD Speeds

- To fix the slow SSD speeds (below 1900mb/s) install any BIOS from 300 and newer. (I would suggest 906 which is the latest one right now)

###### Undervolt and CPU Boost

- Download the latest XTU tool from [intel.](https://downloadcenter.intel.com/download/24075/Intel-Extreme-Tuning-Utility-Intel-XTU-)

- Alter the following settings: 
    - Turbo Boost Power Max: 35.00 W (You can try going up to 40 W)
    - Core Voltage Offset: -0.100 V (You can try going lower but it may result in crashes and blue screens)

- Click Apply and reboot.

###### Overclock MX150 GPU

- Download the latest [MSI Afterburner.](https://www.msi.com/page/afterburner)

- Save a profile with the default settings

- Alter the following settings:
    - Memory Clock: +1000 MHz
    - Core Clock: +60 MHz

- Save the new settings in a new profile

- Test for stability with games and benchmarks. If it isn't stable enought lower the settings.

## Errors and Fixes

1. The firmware dump utility reports:
**Error 318**: The host CPU does not have read access to the target flash area. To enable read access for this operation you must modify the descriptor settings to give host access to this region. FPT Operation Failed.
    - it is necessary at least once to start BIOS update procedure, until the "unlockme" step inclusive, after that the procedure can be interrupted

2. Problems with security policies and the inability to run PowerShell scripts, for example: "The .\Patchscript_bue.ps1 file does not have a digital signature. The script can not be run..."
    - Execute the folllowing on PowerShell: powershell set-executionpolicy remotesigned
    - In group security policies, you must enable scripting for powershell

3. Coolers after the patch are still kicked at 42°
    - check that the firmware update was successful: run again readEC.cmd, compare new ec.bin and ec604.bin, now they should be binary same
    - Repeat step 9, sometimes you need to juggle the cable several times (almost always more than one)
    - disconnect the power cable, hold the power button for a long time until the laptop switches off, wait a minute, connect the cable, wait 10 seconds, switch on
    - if the firmware update was successful, but all manipulations with the power cable was unsuccessful, then it remains only to throw off the battery cable for a couple of minutes, or just wait, sooner or later the EC will read new firmware, after one of the reboots or after a night's sleep.

4. If powershell scripts fail, make sure PowerShell scripts execution is allowed on your Windows machine. Further info [here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6).

5. Supervisor password is unknown
    - download HxD Hex editor ](https://mh-nexus.de/en/hxd/) and **Intel Flash Programming Tool**
    - open powershell as administrator and move to the folder containing FPTW64.exe
    - execute .\FPTW64.exe -bios -d bios_backup.bin
    - open bios_backup.bin inside HxD and search for following hex-values **00 65 00 72 00 76 00 69 00 73 00 6F 00 72 00 50**
    - the decoded text section will show something like this **{S.y.s.t.e.m.S.u.p.e.r.v.i.s.o.r.P.w.....(this area will contain your password)aU?**

6. Supervisor password recovered from BIOS dump is not working
    - download BIOS version XMAKB5R0P0906 or older
    - open the platform.ini file that exists inside the BIOS zip and change following flags:
        - **[Bios_Version_Check] Flag=1** and change it to Flag=0
        - **[ForceFlash] Password=0** and change it to Password=1
    - flash the BIOS with the flashing utility (H2OFFT-Wx64.exe) or with the instructions from [link](## BIOS Update) depending on downloaded BIOS version

## Credits

- [PavelLJ](https://github.com/PavelLJ)
- [saltukkos](https://github.com/saltukkos)
- [cybsuai](https://github.com/cybsuai/)
- Techtablets.com
- [HWupgrade.it](https://www.hwupgrade.it/forum/showthread.php?t=2861428)

## Support

Feel free to support me or buy me a beer in Prague :D
