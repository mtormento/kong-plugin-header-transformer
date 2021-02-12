#!/bin/sh

sudo luarocks make kong-plugin-header-transformer-0.2.0-1.rockspec
luarocks pack kong-plugin-header-transformer
#docker cp kong-plugin-header-transformer-0.2.0-1.all.rock cdn-support_kong_1:/
#docker cp kong-plugin-header-transformer-0.2.0-1.all.rock cdn-support_kong_1:/
#docker exec -it cdn-support_kong_1 luarocks install kong-plugin-header-transformer-0.2.0-1.all.rock
