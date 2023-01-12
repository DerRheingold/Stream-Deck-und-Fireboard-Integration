@echo off
Rem %1 Fahrzeugkennung: z.B. 01/10-01
Rem %2 Status
Rem Für Fireboard muss der Auth-Key eingetragen werden. Hier zu finden: https://login.fireboard.net/account/authkeys
Rem Beispiel um den KdoW (FL KIB.WIN 01/10-01) auf Status 2 zu setzen: script.bat 01/10-01 2
Rem Beispiel um den HLF2 (FL KIB.WIN 01/46-02) auf Status 3 zu setzen: script.bat 01/46-02 3

call :GetUnixTime UNIX_TIME
curl -X POST "https://login.fireboard.net/api?authkey=DeinFireBoardAuthKey&call=status_data" -H "Content-Type: application/xml" -d "<?xml version='1.0' encoding='UTF-8'?><fireboardStatus version='1.0'><statusData><status>%2</status><fms>FL KIB.WIN %1</fms><timestamp><long>%UNIX_TIME%</long></timestamp></statusData></fireboardStatus>"
Rem echo %time% %UNIX_TIME%
goto :EOF

:GetUnixTime
setlocal enableextensions
for /f %%x in ('wmic path win32_utctime get /format:list ^| findstr "="') do (
    set %%x)
set /a z=(14-100%Month%%%100)/12, y=10000%Year%%%10000-z
set /a ut=y*365+y/4-y/100+y/400+(153*(100%Month%%%100+12*z-3)+2)/5+Day-719469
set /a ut=ut*86400+100%Hour%%%100*3600+100%Minute%%%100*60+100%Second%%%100
endlocal & set "%1=%ut%" & goto :EOF