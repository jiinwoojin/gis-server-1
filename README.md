# jiin-server-1
mapserver + httpd

# 실행 script
docker create -it -p 11130:80 -v /data/jiapp:/data/jiapp --name jiin-server-1 jiinwoojin/jiin-server-1

# save script
docker save jiinwoojin/jiin-server-1 > jiin-server-1.tar

# load script
docker load < jiin-server-1.tar 

# TEST
http://localhost:13000/mapserver/cgi-bin/mapserv?map=/data/jiserver/data_dir/mapserver/world_k2/world_k2.map&SERVICE=WMS&REQUEST=GetCapabilities&VERSION=1.3.0