@echo off
setlocal

set "SRC=C:\Users\fabitmart\Dropbox\Claude\clo-author-metrics\Paper\gitbook_notes\_book"
set "DEST=_site\notes"

if not exist "%SRC%\index.html" (
  echo [build-notes] %SRC% has no index.html. Render the metrics book first.
  exit /b 0
)

if exist "%DEST%" rmdir /S /Q "%DEST%"
xcopy "%SRC%" "%DEST%\" /E /I /Q /Y >nul

if not "%ERRORLEVEL%"=="0" (
  echo [build-notes] xcopy failed with exit code %ERRORLEVEL%
  exit /b %ERRORLEVEL%
)

echo [build-notes] _site\notes\ updated from %SRC%
exit /b 0
