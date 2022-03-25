#!/bin/bash

rm -rf /root/app/*
rm -rf /data/game_server/target/50001/app/*
tar -zxf /root/app.tar.gz -C .

docker stop -t 600 game_server_50001
docker rm -f game_server_50001

docker load -i /root/images/game_server.image

mkdir -p /data/game_server/target/50001/app/
cp -rf /root/app/* /data/game_server/target/50001/app/
rm -rf /data/game_server/target/50001/app/v_*
rm -rf /data/game_server/target/50001/app/dllVersion.txt
cat > /data/game_server/target/50001/app/Configs/server_config.json << EOF
{
  "isDebug": true,
  "serverId": 50001,
  "serverName": "越南提审",
  "loginQueueNum": 100,
  "dataFlushTimeMax": 300,
  "dataFlushTimeMin": 240,
  "dataFPS": 3000,
  "httpInnerCode": "chengdu98_inner_secretkey",
  "httpCode": "chengdu98_hgame",
  "httpUrl": "/game98/logic",
  "httpPort": 20001,
  "tcpPort": 10001,
  "grpcPort": 30001,
  "useLibuv": true,
  "centerServer": "10.11.74.246",
  "centerGrpcPort": "8890",
  "centerHttpPort": "8889",
  "centerTcpPort": "8888",
  "rechargeHttpPort": 9898,
  "dataCenter":"moya",
  "sdkType": 3,
  "mongoDB": "game_hz_50001",
  "mongoUrl": "mongodb://10.11.74.246:6666/?authSource=admin",
  "cdkUrl": "http://10.11.74.246:5000/history/logic?command=get_cdk&key={0}&roleId={1}&serverId={2}",
  "language": "english",
  "mongoGlobalDB": "game_hz",
  "configCenterUrl": "http://10.11.74.246:8500/",
  "restoreFromFile": false,
  "localIp": "10.11.74.246"
}
EOF

docker run \
	--name game_server_50001 \
	--restart=always \
	-d \
	-p 10001:10001 \
	-p 20001:20001 \
	-p 30001:30001 \
	-v /data/game_server/target/Logs/50001:/Logs \
	-v /data/game_server/target/50001/app:/app \
 -v /etc/localtime:/etc/localtime:ro \
harbor.98.com/library/game_server:latest

docker exec -it game_server_50001 ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
docker exec -it game_server_50001 echo "'Asia/Ho_Chi_Minh'" >/etc/timezone
docker exec -it game_server_50001 date
docker exec -it game_server_50001 cat version_code.md
docker exec -it game_server_50001 cat version_config.md

docker restart game_server_50001
