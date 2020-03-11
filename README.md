# gis-server-1
mapserver + mapproxy docker

# 실행 script
docker create -it -p 0.0.0.0:12000:8080 -v /data/jiserver:/data/jiserver --name gis-server-1 jiinwoojin/gis-server-1 mapproxy-util serve-develop /data/jiserver/data_dir/proxy/gis-server-1.yaml -b 0.0.0.0:8080

# save script
docker save jiinwoojin/gis-server-1 > gis-server-1.tar

# load script
docker load < gis-server-1.tar