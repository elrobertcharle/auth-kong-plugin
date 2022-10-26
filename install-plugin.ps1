$ContainerId = Read-Host -Prompt 'Input ContainerId'
docker exec --user=root ${ContainerId} rm /del/kong-asheauth-1.0-3.all.rock
docker exec --user=root ${ContainerId} rm /del/kong-asheauth-1.0-3.rockspec
docker exec --user=root ${ContainerId} rm -r /del/plugin
docker exec --user=root ${ContainerId} mkdir /del/plugin
docker cp "D:\Documents\Ashe\KongAuthPlugin\plugin\handler.lua" ${ContainerId}:/del/plugin/handler.lua
docker cp "D:\Documents\Ashe\KongAuthPlugin\plugin\schema.lua" ${ContainerId}:/del/plugin/schema.lua
docker cp "D:\Documents\Ashe\KongAuthPlugin\kong-asheauth-1.0-3.rockspec" ${ContainerId}:/del/kong-asheauth-1.0-3.rockspec
docker exec  --user=root ${ContainerId} /bin/bash -c "cd /del && luarocks make"
docker exec  --user=root ${ContainerId} /bin/bash -c "cd /del && luarocks pack kong-asheauth 1.0-3"
docker exec  --user=root ${ContainerId} /bin/bash -c "cd /del && luarocks install kong-asheauth-1.0-3.all.rock"
docker exec --user root ${ContainerId} rm /etc/kong/kong.conf.default
docker cp "D:\Documents\Ashe\KongAuthPlugin\kong.conf" ${ContainerId}:/etc/kong/kong.conf
docker exec --user=root ${ContainerId} kong restart
docker start ${ContainerId}