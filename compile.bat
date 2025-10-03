@echo off
echo ========================================
echo    C++ Pattern Programs Compiler
echo ========================================
echo.

:menu
echo Choose an option:
echo 1. Compile a specific pattern
echo 2. Compile all patterns
echo 3. Run a pattern
echo 4. Clean compiled files
echo 5. Exit
echo.
set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" goto compile_single
if "%choice%"=="2" goto compile_all
if "%choice%"=="3" goto run_pattern
if "%choice%"=="4" goto clean
if "%choice%"=="5" goto exit
echo Invalid choice. Please try again.
echo.
goto menu

:compile_single
echo.
set /p pattern="Enter pattern number (1-19): "
if exist "pattern%pattern%.cpp" (
    echo Compiling pattern%pattern%.cpp...
    g++ -o pattern%pattern%.exe pattern%pattern%.cpp
    if %errorlevel%==0 (
        echo Successfully compiled pattern%pattern%.exe
    ) else (
        echo Compilation failed!
    )
) else (
    echo Pattern%pattern%.cpp not found!
)
echo.
pause
goto menu

:compile_all
echo.
echo Compiling all patterns...
for %%i in (pattern*.cpp) do (
    echo Compiling %%i...
    g++ -o %%~ni.exe %%i
)
echo All patterns compiled!
echo.
pause
goto menu

:run_pattern
echo.
set /p pattern="Enter pattern number to run (1-19): "
if exist "pattern%pattern%.exe" (
    echo Running pattern%pattern%...
    echo Enter the size when prompted:
    pattern%pattern%.exe
) else (
    echo pattern%pattern%.exe not found! Compile it first.
)
echo.
pause
goto menu

:clean
echo.
echo Cleaning compiled files...
del *.exe 2>nul
echo Cleaned!
echo.
pause
goto menu

:exit
echo Thank you for using the Pattern Compiler!
pause
exit