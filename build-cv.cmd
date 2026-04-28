@echo off
REM Pre-render hook: compile cv/cv.tex via latexmk, copy PDF into assets/
REM Quarto runs this from the project root (personal-website/).

setlocal
set "LATEXMK=%LOCALAPPDATA%\Programs\MiKTeX\miktex\bin\x64\latexmk.exe"

if not exist "cv\cv.tex" (
  echo [build-cv] cv\cv.tex not found, skipping
  exit /b 0
)

echo [build-cv] compiling cv\cv.tex
pushd cv
"%LATEXMK%" -pdf -interaction=nonstopmode -halt-on-error -quiet cv.tex
set "RC=%ERRORLEVEL%"
popd

if not "%RC%"=="0" (
  echo [build-cv] latexmk failed with exit code %RC%
  exit /b %RC%
)

if not exist "assets" mkdir assets
copy /Y "cv\cv.pdf" "assets\cv.pdf" >nul
echo [build-cv] assets\cv.pdf updated
exit /b 0
