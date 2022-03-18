#!/bin/bash
#docker pull redis
port=6379
docker network  rm redis-cluster-pu0
docker network  create redis-cluster-pu0
for((i=1;i<7;i++))
do
mkdir -p /data/redis-data/node$i
chown -R 1000:1000 /data

docker create --restart always --name redis-node$i --net  redis-cluster-pu0      -v /data/redis-data/node$i:/data \
-p $port:$port redis  --cluster-enabled yes --cluster-config-file nodes-node-$i.conf --port $port 
echo $port

if [ $i -lt 6 ];then
let port++
fi 
done

port=6379
nu=1
a=$NULL
docker start redis-node{1,2,3,4,5,6}
for i in `docker inspect redis-node{1,2,3,4,5,6} | grep IPAddress | awk -F\" '/[1-9]{1,3}/{print $4}'`
do
a="$a $i:$port"
echo $a
if [ $nu -lt 6 ];then
let nu++
let port++
fi
done
docker exec -it redis-node1 redis-cli   --cluster create $a --cluster-yes --cluster-replicas 1  
#$a
#docker exec -it  redis-node1  redis-cli 
