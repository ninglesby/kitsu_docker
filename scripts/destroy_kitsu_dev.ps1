$CurrentDirectory = Get-Location
Set-Location $PSScriptRoot
Set-Location ../
$DestroyInfra = Read-Host -Prompt 'Bring down Kitsu Stack and remove containers?(Y/N): '

if ( $DestroyInfra -eq "Y" )
{
    docker compose down
    docker rm -f $(docker ps -a -q)
    $DestroyData = Read-Host -Prompt 'Destroy volumes? THIS IS AN UNRECOVERABLE ACTION! (Y/N): '
    if ( $DestroyData -eq "Y" )
    {
        docker volume rm $(docker volume ls -q)
    }
}
Set-Location $CurrentDirectory