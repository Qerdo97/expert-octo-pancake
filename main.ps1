﻿#Importujemy moduł jeżeli jeszcze go nie mamy, który pozwala nam na wykorzystanie Search-ADAccount
Import-Module activedirectory

#Ustawiamy domyślne formaty kodowania do UTF8 aby poprawnie wyświetlać polskie znaki diakrytyczne
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

#Ustawiamy zmienną którą potem przekazujemy do skryptów potomnych aby katalog roboczy zawsze był ten san
$workDir = $PSScriptRoot

#Funkcja Authors zawiera informacje o autorach tego skrypty
function Authors
{
    Write-Host    "Projekt"
    Write-Host    ""
    Write-Host    "Authors:"
    Write-Host    "Grzegorz Sekuła"
    Write-Host    "Nr indeksu: x"
    Write-Host    ""
    Write-Host    "Robert Łobasiuk"
    Write-Host    "Nr indeksu: x"
    Write-Host    ""
    Write-Host    "Nr grupy: x"
    Write-Host    ""
}

#Funkcja odpowiedzialna za wyświetlanie menu
function Show-Menu
{
    Clear-Host
    Write-Host "================ MENU ================"
    Write-Host ""
    Write-Host "    == Obsługa kont użytkowników ==   "
    Write-Host "1: Wciśnij '1' aby stworzyć konto użytkownika."
    Write-Host "2: Wciśnij '2' aby stworzyć wiele kont na podstawie pliku csv."
    Write-Host "3: Wciśnij '3' aby zablokować konto użytkownika."
    Write-Host "4: Wciśnij '4' aby zmienić hasło do konta użytkownika."
    Write-Host ""
    Write-Host "        == Obsługa kont grup ==       "
    Write-Host "5: Wciśnij '5' aby dodać użytkowników do grup."
    Write-Host ""
    Write-Host "             == Raporty ==            "
    Write-Host "6: Wciśnij '6' aby otrzymać listę grup z członkami."
    Write-Host "7: Wciśnij '7' aby otrzymać listę zablokowanych kont w domenie."
    Write-Host ""
    Write-Host "             == Więcej ==             "
    Write-Host "A: Wciśnij 'A' aby otrzymać informacje o autorach."
    Write-Host "Q: Wciśnij 'Q' aby wyjść."
    Write-Host ""
    Write-Host "======================================"
}

#Wyświetlenie menu i oczekiwanie na decyzję. Po wybraniu odpowiedniej opcji jest wywoływany odpowiedni skrypt potomny.
do
{
    Show-Menu
    $selection = Read-Host "Proszę dokonać wyboru"
    switch ($selection)
    {
        '1' {
            Clear-Host
            &"$workDir\Scripts\1.ps1" -workDir $workDir
        }
        '2' {
            Clear-Host
            &"$workDir\Scripts\2.ps1" -workDir $workDir
        }
        '3' {
            Clear-Host
            &"$workDir\Scripts\3.ps1" -workDir $workDir
        }
        '4' {
            Clear-Host
            &"$workDir\Scripts\4.ps1" -workDir $workDir
        }
        '5' {
            Clear-Host
            &"$workDir\Scripts\5.ps1" -workDir $workDir
        }
        '6' {
            Clear-Host
            &"$workDir\Scripts\6.ps1" -workDir $workDir
        }
        '7' {
            Clear-Host
            &"$workDir\Scripts\7.ps1" -workDir $workDir
        }
        'a' {
            Clear-Host
            Authors
        }
        'q' {

        }
        Default {
            Clear-Host
            "Nie ma takiej opcji"
        }
    }
    pause
}
until ($selection -eq 'q')
