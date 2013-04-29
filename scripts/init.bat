cd "%~dp0.." || exit /b 1

:: if exist vendor rd /s /q vendor || exit /b 1
:: if exist node_modules rd /s /q node_modules || exit /b 1

if exist node_modules call npm update || exit /b 1
if not exist node_modules call npm install || exit /b 1
if not exist node_modules exit /b 1

call node_modules\.bin\bower install || exit /b 1
