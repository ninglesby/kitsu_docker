$CurrentDate = Get-Date -Format "yyMMdd"
Set-Location $PSScriptRoot
Set-Location ../

Write-Host $CurrentDate
if ( $args.Length -gt 0 )
{
    $OutputPath = $args[0]
} else {
    $OutputPath = Get-Location
}
$CurrentDirectory = Get-Location

docker run --rm --volume kitsu_docker_db_data:/data --volume ${OutputPath}:/backup ubuntu tar cvf /backup/kitsu_docker_db_data_${CurrentDate}.tar /data
docker run --rm --volume kitsu_docker_logs:/data --volume ${OutputPath}:/backup ubuntu tar cvf /backup/kitsu_docker_logs_${CurrentDate}.tar /data
docker run --rm --volume kitsu_docker_tmp:/data --volume ${OutputPath}:/backup ubuntu tar cvf /backup/kitsu_docker_tmp_${CurrentDate}.tar /data
docker run --rm --volume kitsu_docker_zou_previews:/data --volume ${OutputPath}:/backup ubuntu tar cvf /backup/kitsu_docker_zou_previews_${CurrentDate}.tar /data

Set-Location $CurrentDirectory