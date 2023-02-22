$CurrentDirectory = Get-Location
Set-Location $PSScriptRoot
Set-Location ../
docker compose build --no-cache
Set-Location $CurrentDirectory