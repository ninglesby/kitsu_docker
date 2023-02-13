$CurrentDirectory = Get-Location
Set-Location $PSScriptRoot
Set-Location ../
docker compose up -d
Set-Location $CurrentDirectory