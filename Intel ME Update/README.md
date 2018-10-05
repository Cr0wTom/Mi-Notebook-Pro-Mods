# Intel Management Engine (ME) Update

The latest ME driver can be found in in [Fernando's Win-RAID Forum](https://www.win-raid.com/t596f39-Intel-Management-Engine-Drivers-Firmware-amp-System-Tools.html). Updating ME helps in malicious attack prevention that occured lately. The ME firmware version in this folder is Intel CSME 11.8 Consumer PCH-LP Firmware v11.8.55.3510 and the version of Intel (CS)ME System Tools is Intel CSME System Tools v11 r14 - (2018-08-09).

**Disclaimer** - Since the operations are related to BIOS, there's possibility that if some errors occur during the update process, the whole system may be unable to boot. I do not get any responsibility for bricked and broken devices.

To update to the latest ME please update to the latest available BIOS from the BIOS folder of this repo.

## ME Update

1. Create a new folder within the drive C and name it "Win64" (path: C:\Win64).
2. Copy all the files from the ME folder into "Win64" folder.
3. Make sure that you are connected to the charger and that you have more than 80% charge.
4. Shift + Right click in the C:\Win64 folder and select Open PowerShel window here.
5. Execute the following command:
    - .\FWUpdLcl64.exe -F ME.bin
6. Wait until the process has been successfully completed.
7. Reboot

## Credits

- [FallenChromium](https://github.com/FallenChromium)
- [daliansky](https://github.com/daliansky)
- [_Cyb_](https://4pda.ru/forum/index.php?showuser=914121)
- [plutomaniac](https://www.win-raid.com/t596f39-Intel-Management-Engine-Drivers-Firmware-amp-System-Tools.html#no_permission_userprofile)


