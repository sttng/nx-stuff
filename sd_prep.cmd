@echo off
mkdir SD_prep
cd SD_prep

REM Getting Atmosphere latest version
SET my_url=https://api.github.com/repos/Atmosphere-NX/Atmosphere/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url ^| findstr zip') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for %%F in ("%URL_latest%") DO SET file_latest=%%~nxF
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name ^| findstr zip') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.
tar -xf %file_latest%

REM Getting Hekate latest version
SET my_url=https://api.github.com/repos/CTCaer/hekate/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url ^| findstr hekate_ctc') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for %%F in ("%URL_latest%") DO SET file_latest=%%~nxF
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name ^| findstr hekate_ctc') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.
tar -xf %file_latest%

REM Getting Hekate additions: hekate_ipl.ini and bootlogos.zip
echo Getting Hekate additions: hekate_ipl.ini and bootlogos.zip
curl -L -O -# https://nh-server.github.io/switch-guide/files/emu/hekate_ipl.ini
curl -L -O -# https://nh-server.github.io/switch-guide/files/bootlogos.zip
echo.
tar -xf bootlogos.zip

REM Getting Lockpick latest version
SET my_url=https://api.github.com/repos/shchmue/Lockpick_RCM/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.

move hekate_ipl.ini bootloader >NUL
move Lockpick_RCM.bin bootloader\payloads >NUL
move atmosphere\reboot_payload.bin atmosphere\#reboot_payload.bin >NUL
copy hekate_ctcaer_*.bin bootloader\payloads >NUL
move hekate_ctcaer_*.bin atmosphere\reboot_payload.bin >NUL

REM Getting ChoiDujourNXv102
echo Getting ChoiDujourNXv102
curl -L -O -# https://files.sshnuke.net/ChoiDujourNXv102.zip
echo.

REM Getting Incognito_RCM latest version
SET my_url=https://api.github.com/repos/jimzrt/Incognito_RCM/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.

REM Getting nxdumptool latest version
SET my_url=https://api.github.com/repos/DarkMatterCore/nxdumptool/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name ^| findstr nro') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.

REM Getting EdiZon latest version
SET my_url=https://api.github.com/repos/WerWolv/EdiZon/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name ^| findstr zip') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.
tar -xf SD.zip

move Incognito_RCM.bin bootloader\payloads >NUL
tar -xf ChoiDujourNXv102.zip
move ChoiDujourNX.nro switch >NUL
move *.txt switch >NUL
move nxdumptool.nro switch >NUL

REM Getting FTPD latest version
SET my_url=https://api.github.com/repos/mtheall/ftpd/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url ^| findstr nro') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name ^| findstr nro') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# https://github.com/mtheall/ftpd/releases/latest/download/ftpd.nro
move ftpd.nro switch >NUL
echo.

REM Getting NXThemeInstaller latest version
SET my_url=https://api.github.com/repos/exelix11/SwitchThemeInjector/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url ^| findstr nro') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name ^| findstr nro') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.
move NXThemesInstaller.nro switch >NUL

REM Getting NX-Shell latest version
SET my_url=https://api.github.com/repos/joel16/NX-Shell/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.
move NX-Shell.nro switch >NUL

REM Getting atmosphere-updater latest version
SET my_url=https://api.github.com/repos/ITotalJustice/atmosphere-updater/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.
move atmosphere-updater.nro switch >NUL

REM Getting hbappstore latest version
SET my_url=https://api.github.com/repos/vgmoose/hb-appstore/releases/latest
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr browser_download_url ^| findstr nro') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET URL_latest=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr tag_name') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET tag_name=%%I
for /f "tokens=2" %%i in ('curl -s %my_url% ^| findstr name ^| findstr nro') do set RESULT=%%i
for /f "delims=" %%I IN (%RESULT%) DO SET name=%%I
echo Getting %name% version: %tag_name%
curl -L -O -# %URL_latest%
echo.
cd switch
mkdir appstore
cd ..
move appstore.nro switch\appstore >NUL

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
echo nintendo_path = Emutendo) > emummc.ini
cd..

del *.zip
cd..
