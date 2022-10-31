docker exec  --user=root 8a03a3693e9cdbb71544c0e9543346d8ea38e3a335f3547f06a454d1041f993c /bin/bash -c "cd /del && luarocks pack asheauth 1.0-3"
docker exec  --user=root 8a03a3693e9cdbb71544c0e9543346d8ea38e3a335f3547f06a454d1041f993c /bin/bash -c "cd /del && luarocks install asheauth-1.0-3.all.rock"
docker exec --user root 8a03a3693e9cdbb71544c0e9543346d8ea38e3a335f3547f06a454d1041f993c rm /etc/kong/kong.conf.default
docker cp "D:\Documents\Ashe\KongAuthPlugin\kong.conf" 8a03a3693e9cdbb71544c0e9543346d8ea38e3a335f3547f06a454d1041f993c:/etc/kong/kong.conf
docker exec --user=root 8a03a3693e9cdbb71544c0e9543346d8ea38e3a335f3547f06a454d1041f993c kong restart
docker start 8a03a3693e9cdbb71544c0e9543346d8ea38e3a335f3547f06a454d1041f993c