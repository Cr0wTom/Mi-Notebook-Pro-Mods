[Instructions for installing custom EC firmware (coolers patch)]
Your BIOS version should be XMAKB5R0P0603! Upgrade before next steps.
The default version to flash is +12°, if you need version +20°, replace ec604.bin with the corresponding one from the EC folder

0) Make a full dump of your BIOS firmware: backup.cmd, save file mybackup.bin outside of laptop 
1) Remove write protection BIOS: bios_unlock.cmd, be sure to reboot
2) Save your EC: readEC.cmd, the ec.bin file will appear, this is your EC backup
3) Flash new EC: flashEC.cmd, will be flashed ec604.bin
4) First pull out the power cable, then completely turn off the laptop (Start->Shutdown, not just close the lid), wait a minute, insert the cable, wait 5 seconds, turn on the laptop
5) Put back write protection for BIOS: bios_lock.cmd


[Possible errors and how to fix them]
1) The firmware dump utility reports:
Error 318: The host CPU does not have read access to the target flash area. To enable read access for this operation you must modify the descriptor settings to give host access to this region.
FPT Operation Failed.
Solution:
- it is necessary at least once to start BIOS update procedure, until the "unlockme" step inclusive, after that the procedure can be interrupted

2) Problems with security policies and the inability to run PowerShell scripts, for example:
"The .\Patchscript_bue.ps1 file does not have a digital signature. The script can not be run bla bla bla"
Solutions:
- enter the following from the command line: powershell set-executionpolicy remotesigned
- in more advanced cases, in group security policies, you must enable scripting for powershell
- if nothing helped, then my knowledge is over, look for the solution here: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set- execution_policy?view=powershell-6

3) Coolers after the patch are still kicked at 42°
- Repeat step number 4, sometimes you need to juggle the cable several times (almost always more than one)
- If it does not help, check that the firmware update was successful: run again readEC.cmd, compare new ec.bin and ec604.bin, now they should be binary same
- If the firmware update was successful, but all manipulations with the power cable was unsuccessful, then it remains only to throw off the battery cable for a couple of minutes, or just wait, sooner or later the EC will read new firmware, after one of the reboots or after a night's sleep

4) The laptop after patch did not turn on, the power indicator is always orange
- this means that you did something completely wrong, and now only one way: backup "mybackup.bin" flash by an external programmer (for example ch341a + soic8 clip, or at any service on laptops)


[How to roll back]
1. Flash the original BIOS 
2. Flash only the EC from backup ec.bin, by the instructions above, also the original file can be found in the archive (EC\Orig\ec603.bin)


[Additionally]
I found a way to enable Intel SpeedShift. This is a new technology to control the frequency of the processor. 
Read more about this technology here: https://www.anandtech.com/show/9751/examining-intel-skylake-speed-shift-more-responsive-processors
You can enable it using the script speedshift_unlock.cmd