$ContainerId = Read-Host -Prompt 'Input ContainerId'
docker exec --user=root ${ContainerId} mkdir -p /del
docker cp "D:\Documents\Ashe\KongAuthPlugin\install_plugin.sh" ${ContainerId}:/del/install_plugin.sh
docker exec --user=root -it ${ContainerId} /bin/bash -c "cd /del && sed -i -e 's/\r$//' install_plugin.sh && ./install_plugin.sh"