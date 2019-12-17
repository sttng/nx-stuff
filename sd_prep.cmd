@echo off
mkdir SD_prep
cd SD_prep

REM Getting Hekate latest version
for /f "tokens=2" %%i in ('curl -s https://api.github.com/repos/CTCaer/hekate/releases/latest ^| findstr browser_download_url ^| findstr hekate_ctc') do set RESULT=%%i
FOR /F "delims=" %%I IN (%RESULT%) DO SET URL_hekate_latest=%%I
for %%F in ("%URL_hekate_latest%") DO SET hekate_latest=%%~nxF
echo Getting Hekate latest version: %hekate_latest%
curl -L -O -# %URL_hekate_latest%
echo.

REM Getting Hekate additions: hekate_ipl.ini and bootlogos.zip
echo Getting Hekate additions: hekate_ipl.ini and bootlogos.zip
curl -L -O -# https://nh-server.github.io/switch-guide/files/emu/hekate_ipl.ini
curl -L -O -# https://nh-server.github.io/switch-guide/files/bootlogos.zip
echo.

REM Getting Atmosphere latest version
for /f "tokens=2" %%i in ('curl -s https://api.github.com/repos/Atmosphere-NX/Atmosphere/releases/latest ^| findstr browser_download_url ^| findstr atmosphere') do set RESULT=%%i
FOR /F "delims=" %%I IN (%RESULT%) DO SET URL_atmosphere_latest=%%I
for %%F in ("%URL_atmosphere_latest%") DO SET atmosphere_latest=%%~nxF
echo Getting Atmosphere latest version: %atmosphere_latest%
curl -L -O -# %URL_atmosphere_latest%
echo.

REM Unpacking Atmosphere, Hekate, Hekate Logos
tar -xf %atmosphere_latest%
tar -xf %hekate_latest%
tar -xf bootlogos.zip

REM Getting Lockpick latest version
echo Getting Lockpick latest version: Lockpick_RCM.bin
curl -L -O -# https://github.com/shchmue/Lockpick_RCM/releases/latest/download/Lockpick_RCM.bin
echo.

move hekate_ipl.ini bootloader >NUL
move Lockpick_RCM.bin bootloader\payloads >NUL
move atmosphere\reboot_payload.bin atmosphere\#reboot_payload.bin >NUL
copy hekate_ctcaer_*.bin bootloader\payloads >NUL
move hekate_ctcaer_*.bin atmosphere\reboot_payload.bin >NUL

REM Getting additonal tools: ChoiDujourNXv102, Incognito_RCM (latest), nxdumptool (latest)
echo Getting additonal tools: ChoiDujourNXv102, Incognito_RCM (latest), nxdumptool (latest)
curl -L -O -# https://files.sshnuke.net/ChoiDujourNXv102.zip
curl -L -O -# https://github.com/jimzrt/Incognito_RCM/releases/latest/download/Incognito_RCM.bin
curl -L -O -# https://github.com/DarkMatterCore/nxdumptool/releases/latest/download/nxdumptool.nro
echo.

move Incognito_RCM.bin bootloader\payloads >NUL
tar -xf ChoiDujourNXv102.zip
move ChoiDujourNX.nro switch >NUL
move *.txt switch >NUL
move nxdumptool.nro switch >NUL

REM Getting EdiZon latest version
echo REM Getting EdiZon latest version: SD.zip
curl -L -O -# https://github.com/WerWolv/EdiZon/releases/latest/download/SD.zip

REM Getting FTPD latest version
echo REM Getting FTPD latest version: FTPD.nro
curl -L -O -# https://github.com/mtheall/ftpd/releases/latest/download/ftpd.nro
move ftpd.nro switch >NUL

REM Getting NXThemeInstaller latest version
echo REM Getting NXThemeInstaller latest version: NXThemesInstaller.nro
curl -L -O -# https://github.com/exelix11/SwitchThemeInjector/releases/latest/download/NXThemesInstaller.nro
move NXThemesInstaller.nro switch >NUL

REM Getting NX-Shell latest version
echo REM Getting NX-Shell latest version: NX-Shell.nro
curl -L -O -# https://github.com/joel16/NX-Shell/releases/latest/download/NX-Shell.nro
move NX-Shell.nro switch >NUL

REM Getting atmosphere-updater latest version
echo REM Getting atmosphere-updater latest version: atmosphere-updater.nro
curl -L -O -# https://github.com/ITotalJustice/atmosphere-updater/releases/latest/download/atmosphere-updater.nro
move atmosphere-updater.nro switch >NUL

REM Getting hbappstore latest version
echo REM Getting hbappstore latest version: appstore.nro
curl -L -O -# https://github.com/vgmoose/hb-appstore/releases/latest/download/appstore.nro
move appstore.nro switch >NUL

REM Getting SX OS
echo Getting SX OS and SX loader
curl -L -O -# https://sx.xecuter.com/download/SXOS_beta_v2.9.3.zip
curl -L -O -# https://sx.xecuter.com/download/payload.bin
echo.

tar -xf SXOS_beta_v2.9.3.zip
move payload.bin bootloader\payloads\SXOS_loader.bin >NUL

mkdir Emutendo
mkdir emummc
cd emummc
@echo off
(echo [emummc]
echo enabled = 1 
echo sector = 0x2
echo nintendo_path = Emutendo) > filename.txt
cd..

del *.zip
cd..
