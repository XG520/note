#!/bin/bash

docker load -i /root/images/game_server.image
docker stop -t 600 game_server_10000
docker rm -f game_server_10000
rm -rf /root/app/*
tar -xmzf /root/app.tar.gz -C .
rm -rf /data/game_server/target/10000 /data/game_server/target/Logs/10000  && mkdir -p /data/game_server/target/10000/app
cp -rf /root/app/* /data/game_server/target/10000/app/
cat > /data/game_server/target/10000/app/Configs/server_config.json << EOF
{
  "isDebug": true,
  "serverId": 10000,
  "serverName": "魔亚_韩国_内网_分支1服",
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
  "centerServer": "192.168.1.218",
  "centerGrpcPort": "8890",
  "centerHttpPort": "8889",
  "centerTcpPort": "8888",
  "rechargeHttpPort": 9898,
  "dataCenter":"moya_kr",
  "sdkType": 1,
  "mongoDB": "moya_kr_game_hz_10000",
  "mongoUrl": "mongodb://192.168.1.200:6666/?authSource=admin",
  "cdkUrl": "http://192.168.1.218:5000/history/logic?command=get_cdk&key={0}&roleId={1}&serverId={2}",
  "language": "chinese",
  "mongoGlobalDB": "moya_kr_game_hz",
  "configCenterUrl": "http://192.168.1.200:8500/",
  "restoreFromFile": false,
  "localIp": "192.168.1.218"
}
EOF
 

docker run \
	--name game_server_10000 \
	--restart=always \
	-d \
	-p 10000:10000 \
	-p 20010:20010 \
	-p 30010:30010 \
	-v /data/game_server/target/Logs/10000:/Logs \
	-v /data/game_server/target/10000/app:/app \
 -v /etc/localtime:/etc/localtime:ro \
game_server:latest
docker exec -it game_server_10000 date
docker exec -it game_server_10000 cat version_code.md
docker exec -it game_server_10000 cat version_config.md