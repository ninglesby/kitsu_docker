$CurrentDirectory = Get-Location
Set-Location $PSScriptRoot
Set-Location ../
docker compose build
Set-Location $CurrentDirectory