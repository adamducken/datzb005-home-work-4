@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Saskaitu atzimes, lai pec cikla varetu aprekinat videjo un sekmigo skaitu.
set /a "skaits=0, summa=0, mazaka=10, lielaka=1, sekmigas=0" >nul

rem Saraksta var ierakstit savas atzimes: veselus skaitlus no 1 lidz 10.
rem FOR katra reize ieliek vienu atzimi mainigaja %%A.
for %%A in (8 6 9 10 7 3 2 9) do (
    rem Pieskaitu vienu atzimi un tas vertibu kopejai summai.
    set /a "skaits+=1, summa+=%%A" >nul
    rem Salidzinu atzimi ar lidz sim atrasto mazako un lielako.
    if %%A lss !mazaka! set "mazaka=%%A"
    if %%A gtr !lielaka! set "lielaka=%%A"
    rem Atzime ir sekmiga, ja ta ir vismaz 4.
    if %%A geq 4 set /a "sekmigas+=1" >nul
    rem Izsaukuma zimes dod cikla laika atjauninato skaitu.
    echo Atzime !skaits!: %%A
)

rem SET /A dala veselus skaitlus; reizinaju ar 100, lai saglabatu simtdalas.
set /a "videja=summa*100/skaits, vesela=videja/100, dala=videja%%100, nesekmigas=skaits-sekmigas" >nul
rem Pievienoju sakuma nulli, lai aiz komata vienmer butu divi cipari.
set "dala=0!dala!"
echo Skaits: !skaits!
echo Summa: !summa!
echo Mazaka: !mazaka!
echo Lielaka: !lielaka!
echo Videja: !vesela!.!dala:~-2!
echo Sekmigas: !sekmigas!
echo Nesekmigas: !nesekmigas!
exit /b 0
