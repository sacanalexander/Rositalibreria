@echo off
:: --- Cambia esta ruta a la carpeta de tu proyecto ---
cd /d "C:\Users\gamer\Downloads\aplicacion"

:: --- Verifica si hay cambios ---
git status --porcelain > cambios.txt
for /f %%i in (cambios.txt) do (
    set hayCambios=1
)

if defined hayCambios (
    echo Se detectaron cambios, actualizando...
    git add .
    git commit -m "Actualización automática"
    git push origin main
    echo ¡Listo! Los cambios se han subido y Netlify actualizará tu sitio.
) else (
    echo No hay cambios para subir.
)

del cambios.txt
pause
