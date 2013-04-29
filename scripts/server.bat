cd "%~dp0.." || exit /b 1

@setlocal

if exist .build rd /s /q .build || exit /b 1

set DEBUG=brunch:*

call node_modules\.bin\brunch watch --server %* || exit /b 1
