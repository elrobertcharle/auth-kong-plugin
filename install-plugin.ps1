$ContainerId = Read-Host -Prompt 'Input ContainerId'
docker exec --user=root ${ContainerId} rm /del/asheauth-1.0-3.all.rock
docker exec --user=root ${ContainerId} rm /del/asheauth-1.0-3.rockspec
docker exec --user=root ${ContainerId} rm -r /del/kong
docker exec --user=root ${ContainerId} mkdir -p /del/kong/plugins/asheauth
docker cp "D:\Documents\Ashe\KongAuthPlugin\kong\plugins\asheauth\handler.lua" ${ContainerId}:/del/kong/plugins/asheauth/handler.lua
docker cp "D:\Documents\Ashe\KongAuthPlugin\kong\plugins\asheauth\schema.lua" ${ContainerId}:/del/kong/plugins/asheauth/schema.lua
docker cp "D:\Documents\Ashe\KongAuthPlugin\kong-plugin-asheauth-1.0-3.rockspec" ${ContainerId}:/del/asheauth-1.0-3.rockspec
docker exec  --user=root ${ContainerId} /bin/bash -c "cd /del && luarocks make"
docker exec  --user=root ${ContainerId} /bin/bash -c "cd /del && luarocks pack asheauth 1.0-3"
docker exec  --user=root ${ContainerId} /bin/bash -c "cd /del && luarocks install asheauth-1.0-3.all.rock"
docker exec --user root ${ContainerId} rm /etc/kong/kong.conf.default
docker cp "D:\Documents\Ashe\KongAuthPlugin\kong.conf" ${ContainerId}:/etc/kong/kong.conf
docker exec --user=root ${ContainerId} kong restart
docker start ${ContainerId}