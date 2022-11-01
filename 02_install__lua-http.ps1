Write-Host @"
Execute these:
apt-get update
apt-get install libssl-dev
yes |apt-get install zip
yes | apt-get install unzip
yes | apt-get install gcc
apt-get install make
yes | apt-get install build-essential
luarocks install luaossl
yes | apt-get install m4
luarocks install cqueues
luarocks install fifo
luarocks install basexx
luarocks install http
"@

$ContainerId = Read-Host -Prompt 'Input ContainerId'
docker exec --user=root ${ContainerId} mkdir -p /del
docker cp "D:\Documents\Ashe\KongAuthPlugin\install_lua-http.sh" ${ContainerId}:/del/install_lua-http.sh
docker exec --user=root -it ${ContainerId} /bin/bash -c "cd /del && sed -i -e 's/\r$//' install_lua-http.sh && ./install_lua-http.sh"