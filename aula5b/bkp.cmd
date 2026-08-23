@echo off
cls
color 1e
echo Caminho completo: C:\Users\admin\AppData\Local\Temp\2026_08_23_12_11_27
:: Pega apenas o nome da pasta atual
for %i in ("C:\Users\admin\AppData\Local\Temp\2026_08_23_12_11_27") do set "pasta=%~nxi"
echo Última pasta: 
if not exist \temp mkdir \temp
start winrar a -afzip -r -ep1 \temp\.zip *
start explorer  c:\temp
