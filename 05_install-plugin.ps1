$ContainerId = Read-Host -Prompt 'Input ContainerId'

docker exec --user root ${ContainerId} rm /etc/kong/kong.conf.default
docker cp "D:\Documents\Ashe\KongAuthPlugin\kong.conf" ${ContainerId}:/etc/kong/kong.conf
docker exec --user=root ${ContainerId} kong restart
docker start ${ContainerId}

