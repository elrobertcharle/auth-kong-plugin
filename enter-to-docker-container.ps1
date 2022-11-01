$ContainerId = Read-Host -Prompt 'Input ContainerId'
docker exec -it --user=root ${ContainerId} /bin/bash