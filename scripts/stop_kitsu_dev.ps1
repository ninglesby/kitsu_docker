$CurrentDirectory = Get-Location
Set-Location $PSScriptRoot
Set-Location ../
docker compose down
Set-Location $CurrentDirectory