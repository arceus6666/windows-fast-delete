@echo off

:: path
set p=%1

if not defined p (goto :EOF)

:: set type
set t=
if exist "%p%\*" (
	set t="folder"
) else (
	set t="file"
)

:: choise
set c="n"
set /P "c=Delete this %t%? (Y/n):"

:: cancel
if /i %c%==y (
	goto :CONT
) else (goto :EOF)

:CheckPath
if exist "%p%\*" (
	set "%\~1="
) else (
	set "%\~1=1"
)
exit /b 0

:CONT
if exist "%p%\*" (
	goto :DIR
) else (
	goto :FILE
)

:DIR
rmdir /q/s "%p%"
goto :END

:FILE
del /f/q/s "%p%" > nul
goto :END

:END
pause
