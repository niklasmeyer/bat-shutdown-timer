@echo off
color 0A

:start
echo Shutdown in?
set /p min=Zeit in Minuten or (a)bort: 

if not defined min (
  echo.
  echo "Bitte gib einen Wert ein. :)"
  echo.
  goto start
)

set /a test = %min%*1

if %test% LEQ 0 (
  if %min% == a (
    goto cancel
  )
  echo.
  echo "Sofort geht leider nicht. :("
  echo.
  goto start
)

set /a zeit = %min%*60
echo Shutdown in %min% Minuten
pause
shutdown.exe -s -t %zeit% -f
exit

:cancel
echo.
echo SleepTimer abbrechen?
pause
shutdown.exe -a