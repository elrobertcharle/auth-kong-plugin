Write-Host @"
Installing lua-resty-http
"@

$ContainerId = Read-Host -Prompt 'Input ContainerId'
docker exec --user=root ${ContainerId} mkdir -p /del
docker cp "D:\Documents\Ashe\KongAuthPlugin\install_lua-http.sh" ${ContainerId}:/del/install_lua-http.sh
docker exec --user=root -it ${ContainerId} /bin/bash -c "cd /del && sed -i -e 's/\r$//' install_lua-http.sh && ./install_lua-http.sh"