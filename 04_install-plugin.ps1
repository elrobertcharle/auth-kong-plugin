docker exec  --user=root dd0425fec6f991e9a2ae6947c2f16c141afafb7fa62b9701de0d03aa7ed7403e /bin/bash -c "cd /del && luarocks pack asheauth 1.0-3"
docker exec  --user=root dd0425fec6f991e9a2ae6947c2f16c141afafb7fa62b9701de0d03aa7ed7403e /bin/bash -c "cd /del && luarocks install asheauth-1.0-3.all.rock"
docker exec --user root dd0425fec6f991e9a2ae6947c2f16c141afafb7fa62b9701de0d03aa7ed7403e rm /etc/kong/kong.conf.default
docker cp "D:\Documents\Ashe\KongAuthPlugin\kong.conf" dd0425fec6f991e9a2ae6947c2f16c141afafb7fa62b9701de0d03aa7ed7403e:/etc/kong/kong.conf
docker exec --user=root dd0425fec6f991e9a2ae6947c2f16c141afafb7fa62b9701de0d03aa7ed7403e kong restart
docker start dd0425fec6f991e9a2ae6947c2f16c141afafb7fa62b9701de0d03aa7ed7403e