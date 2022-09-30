@ECHO OFF
REM Deletes cache files and temps from all users for JAVA, Flash, Browsers and users directories

start taskkill /F /im "iexplore.exe" /im "FlashUtil*" /im "Flashplayer*" /im "SwHelper.exe" /im "swdnld.exe" /im "java.exe" /im "javaw.exe" /im "javaws.exe" /im "jucheck.exe" /im "jusched.exe" /im "jp2launcher.exe" /im chrome.exe /im firefox.exe /im "opera.exe"

REM Remove temps and logs from bellow
IF EXIST C:\Windows\Temp\ DEL /f /s /q C:\Windows\Temp\

IF EXIST C:\Windows\Logs\CBS\ DEL /f /s /q C:\Windows\Logs\CBS\

REM UserTemps
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
        DEL /f /s /q "%%x\AppData\Local\Temp\"
    )
)
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
		DEL /f /s /q "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files\"
	)
)
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
		DEL /f /s /q %%x\AppData\Local\Microsoft\Intern~1\"
	)
)
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
		DEL /f /s /q %%x\AppData\Local\Microsoft\Windows\History\"
	)
)
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
		DEL /f /s /q %%x\AppData\Local\Microsoft\Windows\Tempor~1\"
	)
)
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
		DEL /f /s /q %%x\AppData\Roaming\Microsoft\Windows\Cookies\"
	)
)

REM IE cleaning tool trigger
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 10

REM JAVA
javaws -uninstall
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
        DEL /f /s /q "%%x\AppData\LocalLow\Sun\Java\Deployment\cache\"
    )
)

REM Flash
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
        DEL /f /s /q "%%x\AppData\Roaming\Adobe\Flashp~1\"
    )
)

REM Macromedia
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
        DEL /f /s /q "%%x\AppData\Roaming\Macromedia\Flashp~1\"
    )
)

REM CryptnetUrlCache
IF EXIST "C:\Users\" (
    FOR /D %%x IN ("C:\Users\*") DO (
        DEL /f /s /q "%%x\AppData\LocalLow\Microsoft\CryptnetUrlCache\"
    )
)

REM FlushDNS entries
ipconfig /flushdns