#!/bin/bash

docker load -i /root/images/game_server.image
docker stop -t 600 game_server_20001
docker rm -f game_server_20001
rm -rf /root/app/*
tar -xmzf /root/app.tar.gz -C .
rm -rf /data/game_server/target/20001 /data/game_server/target/Logs/20001  && mkdir -p /data/game_server/target/20001/app
cp -rf /root/app/* /data/game_server/target/20001/app/
cat > /data/game_server/target/20001/app/Configs/server_config.json << EOF
{
  "isDebug": true,
  "serverId": 20001,
  "serverName": "秦明_内网_主干测试服",
  "loginQueueNum": 100,
  "dataFlushTimeMax": 300,
  "dataFlushTimeMin": 240,
  "dataFPS": 3000,
  "httpInnerCode": "chengdu98_inner_secretkey",
  "httpCode": "chengdu98_hgame",
  "httpUrl": "/game98/logic",
  "httpPort": 20000,
  "tcpPort": 10000,
  "grpcPort": 30000,
  "useLibuv": true,
  "centerServer": "172.16.80.137",
  "centerGrpcPort": "8890",
  "centerHttpPort": "8889",
  "centerTcpPort": "8888",
  "rechargeHttpPort": 9898,
  "dataCenter":"ceshi",
  "sdkType": 1,
  "mongoDB": "ceshi_20001",
  "mongoUrl": "mongodb://172.16.80.137:6666/?authSource=admin",
  "cdkUrl": "http://172.16.80.137:5000/history/logic?command=cdk_get&key={0}&roleId={1}&serverId={2}",
  "language": "chinese",
  "mongoGlobalDB": "ceshi",
  "configCenterUrl": "http://172.16.80.137:8500/",
  "restoreFromFile": false,
  "redisConfig":"172.16.80.137:7000,password=123456",
  "localIp": "172.16.80.137" 
}
EOF

docker run \
	--name game_server_20001 \
	--restart=always \
	-d \
	-p 10000:10000 \
	-p 20000:20000 \
	-p 30000:30000 \
	-v /data/game_server/target/Logs/20001:/Logs \
	-v /data/game_server/target/20001/app:/app \
 -v /etc/localtime:/etc/localtime:ro \
 -v /Replay:/data/game_server/target/20001/replay \
game_server:latest
docker exec -it game_server_20001 date
docker exec -it game_server_20001 cat version_code.md
docker exec -it game_server_20001 cat version_config.md
docker restart game_server_20001