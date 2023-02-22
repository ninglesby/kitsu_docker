
if ( $args.Length -gt 0 )
{
    $OutputPath = $args[0]
} else {
    $OutputPath = Get-Location
}

if ( $args.Length -gt 1 )
{
    $CurrentDate = $args[1]
} else {
    $CurrentDate = Get-Date -Format "yyMMdd"
}

$CurrentDirectory = Get-Location
Set-Location $PSScriptRoot
Set-Location ../

docker-compose up -d
docker-compose down

docker run --rm --volume kitsu_docker_db_data:/data --volume ${OutputPath}:/backup ubuntu tar xvf /backup/kitsu_docker_db_data_${CurrentDate}.tar
docker run --rm --volume kitsu_docker_logs:/data --volume ${OutputPath}:/backup ubuntu tar xvf /backup/kitsu_docker_logs_${CurrentDate}.tar
docker run --rm --volume kitsu_docker_tmp:/data --volume ${OutputPath}:/backup ubuntu tar xvf /backup/kitsu_docker_tmp_${CurrentDate}.tar
docker run --rm --volume kitsu_docker_zou_previews:/data --volume ${OutputPath}:/backup ubuntu tar xvf /backup/kitsu_docker_zou_previews_${CurrentDate}.tar

Set-Location $CurrentDirectory