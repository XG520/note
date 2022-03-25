#!/bin/bash

rm -rf /root/center_app/*
rm -rf /data/game_server/target/8888/app/*
tar -zxf /root/center_app.tar.gz -C .

docker stop -t 600 game_center_server_8888
docker rm -f game_center_server_8888

docker load -i /root/images/game_center_server.image

mkdir -p /data/game_server/target/8888/app/
cp -rf /root/center_app/* /data/game_server/target/8888/app/
rm -rf /data/game_server/target/8888/app/v_*
rm -rf /data/game_server/target/8888/app/dllVersion.txt
cat > /data/game_server/target/8888/app/Configs/server_config.json << EOF
{
  "isDebug": true,
  "serverId": 8888,
  "serverName": "Server2.0 中心服",
  "loginQueueNum": 100,
  "dataFlushTimeMax": 300,
  "dataFlushTimeMin": 240,
  "dataFPS": 3000,
  "httpInnerCode": "chengdu98_inner_secretkey",
  "httpCode": "chengdu98_hgame",
  "httpUrl": "/game98/logic",
  "httpPort": 8889,
  "tcpPort": 8888,
  "grpcPort": 8890,
  "useLibuv": true,
  "centerServer": "192.168.1.212",
  "centerHttpPort": "8889",
  "centerTcpPort": "8888",
  "centerGrpcPort": "8890",
  "rechargeHttpPort": 9898,
  "dataCenter":"test",
  "sdkType": 1,
  "mongoDB": "game_hz",
  "mongoUrl": "mongodb://root:%23X*%249jWh@192.168.1.231:27017/?authSource=admin",
  "cdkUrl": "http://192.168.1.255:5000/history/logic?command=get_cdk&key={0}&roleId={1}&serverId={2}",
  "language": "chinese",
  "mongoGlobalDB": "game_hz",
  "configCenterUrl": "http://192.168.1.255:8500/",
  "restoreFromFile": false,
  "localIp": "192.168.1.212"
}
EOF
docker run \
	--name game_center_server_8888 \
	--restart=always \
	-d \
	-p 8888:8888 \
	-p 8889:8889 \
	-p 8890:8890 \
	-v /data/game_server/target/Logs/8888:/Logs \
	-v /data/game_server/target/8888/app:/app \
  -v /etc/localtime:/etc/localtime:ro \
game_center_server:latest

docker exec -it game_center_server_8888 ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
docker exec -it game_center_server_8888 echo "'Asia/Shanghai'" >/etc/timezone
docker exec -it game_center_server_8888 date
docker exec -it game_center_server_8888 cat version_code.md
docker exec -it game_center_server_8888 cat version_config.md

docker restart game_center_server_8888