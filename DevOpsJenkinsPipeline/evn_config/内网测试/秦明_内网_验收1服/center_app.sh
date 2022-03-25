#!/bin/bash


docker load -i /root/images/game_center_server.image
docker stop -t 600 game_center_server_8888
docker rm -f  game_center_server_8888
rm -rf /root/center_app/*
tar -xmzf /root/center_app.tar.gz -C .
rm -rf /data/game_server/target/8888 /data/game_server/target/Logs/8888  && mkdir -p /data/game_server/target/8888/app
cp -rf /root/center_app/* /data/game_server/target/8888/app/
cat > /data/game_server/target/8888/app/Configs/server_config.json << EOF
{
  "isDebug": true,
  "serverId": 8888,
  "serverName": "中心服",
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
  "centerServer": "192.168.2.211",
  "centerHttpPort": "8889",
  "centerTcpPort": "8888",
  "centerGrpcPort": "8890",
  "rechargeHttpPort": 9898,
  "chooseCenterId": 8888,
  "dataCenter":"qm",
  "sdkType": 1,
  "mongoDB": "qm_game_hz",
  "mongoUrl": "mongodb://192.168.1.200:6666/?authSource=admin",
  "cdkUrl": "http://192.168.2.210:5000/history/logic?command=cdk_get&key={0}&roleId={1}&serverId={2}",
  "language": "chinese",
  "mongoGlobalDB": "qm_game_hz",
  "configCenterUrl": "http://192.168.1.200:8500/",
    "redisConfig":"192.168.1.200:7000,password=123456",
  "restoreFromFile": false,
  "localIp": "192.168.2.211"
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
docker exec -it game_center_server_8888 date
docker exec -it game_center_server_8888 cat version_code.md
docker exec -it game_center_server_8888 cat version_config.md
docker restart game_center_server_8888