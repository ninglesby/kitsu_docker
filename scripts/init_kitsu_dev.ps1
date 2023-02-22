$CurrentDirectory = Get-Location
Set-Location $PSScriptRoot
Set-Location ../
$User = Read-Host -Prompt 'Enter New Admin User Email: '
$Password = Read-Host -Prompt 'Enter New Password: '
docker compose run zou-api init $User $Password
docker compose down
Set-Location $CurrentDirectory