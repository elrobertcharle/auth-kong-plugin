$ContainerId = Read-Host -Prompt 'Input ContainerId'
docker exec --user=root -it 8a03a3693e9cdbb71544c0e9543346d8ea38e3a335f3547f06a454d1041f993c /bin/bash

apt-get update
yes |apt-get install zip
yes | apt-get install unzip
luarocks install lua-resty-http