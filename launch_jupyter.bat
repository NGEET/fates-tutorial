@echo off
setlocal

docker logs --tail 20 tutorial-notebook 2>&1 | findstr 127 | findstr /v ServerApp > tempurl.txt

set /p tempurl=<tempurl.txt
set "url=%tempurl: =%"

echo opening %url%
start "" "%url%"

del tempurl.txt

endlocal
