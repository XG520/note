#!/bin/bash

rm -rf /root/app/*
rm -rf /data/game_server/target/10010/app/*
rm -rf /data/game_server/target/10011/app/*
rm -rf /data/game_server/target/10000/app/*
rm -rf /data/game_server/target/10001/app/*
tar -zxf /root/app.tar.gz -C .

docker stop -t 600 game_server_10010 game_server_10011 game_server_10000 game_server_10001
docker rm -f game_server_10010 game_server_10011 game_server_10000 game_server_10001

docker load -i /root/images/game_server.image

mkdir -p /data/game_server/target/10010/app/
cp -rf /root/app/* /data/game_server/target/10010/app/
rm -rf /data/game_server/target/10010/app/v_*
rm -rf /data/game_server/target/10010/app/dllVersion.txt
cat > /data/game_server/target/10010/app/Configs/server_config.json << EOF
{
  "isDebug": true,
  "serverId": 10010,
  "serverName": "主干1服",
  "loginQueueNum": 100,
  "dataFlushTimeMax": 300,
  "dataFlushTimeMin": 240,
  "dataFPS": 3000,
  "httpInnerCode": "chengdu98_inner_secretkey",
  "httpCode": "chengdu98_hgame",
  "httpUrl": "/game98/logic",
  "httpPort": 20010,
  "tcpPort": 10010,
  "grpcPort": 30010,
  "useLibuv": true,
  "centerServer": "192.168.1.212",
  "centerGrpcPort": "8890",
  "centerHttpPort": "8889",
  "centerTcpPort": "8888",
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

mkdir -p /data/game_server/target/10011/app/
cp -rf /root/app/* /data/game_server/target/10011/app/
rm -rf /data/game_server/target/10011/app/v_*
rm -rf /data/game_server/target/10011/app/dllVersion.txt
cat > /data/game_server/target/10011/app/Configs/server_config.json << EOF
{
  "isDebug": true,
  "serverId": 10011,
  "serverName": "主干2服",
  "loginQueueNum": 100,
  "dataFlushTimeMax": 300,
  "dataFlushTimeMin": 240,
  "dataFPS": 3000,
  "httpInnerCode": "chengdu98_inner_secretkey",
  "httpCode": "chengdu98_hgame",
  "httpUrl": "/game98/logic",
  "httpPort": 20011,
  "tcpPort": 10011,
  "grpcPort": 30011,
  "useLibuv": true,
  "centerServer": "192.168.1.212",
  "centerGrpcPort": "8890",
  "centerHttpPort": "8889",
  "centerTcpPort": "8888",
  "rechargeHttpPort": 9898,
  "dataCenter":"test",
  "sdkType": 1,
  "mongoDB": "game_hz_10011",
  "mongoUrl": "mongodb://root:%23X*%249jWh@192.168.1.231:27017/?authSource=admin",
  "cdkUrl": "http://192.168.1.255:5000/history/logic?command=get_cdk&key={0}&roleId={1}&serverId={2}",
  "language": "chinese",
  "mongoGlobalDB": "game_hz",
  "configCenterUrl": "http://192.168.1.255:8500/",
  "restoreFromFile": false,
  "localIp": "192.168.1.212"
}
EOF

mkdir -p /data/game_server/target/10000/app/
cp -rf /root/app/* /data/game_server/target/10000/app/
rm -rf /data/game_server/target/10000/app/v_*
rm -rf /data/game_server/target/10000/app/dllVersion.txt
cat > /data/game_server/target/10000/app/Configs/server_config.json << EOF
{
  "isDebug": true,
  "serverId": 10000,
  "serverName": "伟大航路",
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
  "centerServer": "192.168.1.212",
  "centerGrpcPort": "8890",
  "centerHttpPort": "8889",
  "centerTcpPort": "8888",
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

mkdir -p /data/game_server/target/10001/app/
cp -rf /root/app/* /data/game_server/target/10001/app/
rm -rf /data/game_server/target/10001/app/v_*
rm -rf /data/game_server/target/10001/app/dllVersion.txt
cat > /data/game_server/target/10001/app/Configs/server_config.json << EOF
{
  "isDebug": true,
  "serverId": 10001,
  "serverName": "红土大陆",
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
  "centerServer": "192.168.1.212",
  "centerGrpcPort": "8890",
  "centerHttpPort": "8889",
  "centerTcpPort": "8888",
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
	--name game_server_10010 \
	--restart=always \
	-d \
	-p 10010:10010 \
	-p 20010:20010 \
	-p 30010:30010 \
	-v /data/game_server/target/Logs/10010:/Logs \
	-v /data/game_server/target/10010/app:/app \
 -v /etc/localtime:/etc/localtime:ro \
game_server:latest
# docker start game_server_10010

docker run \
	--name game_server_10011 \
	--restart=always \
	-d \
	-p 10011:10011 \
	-p 20011:20011 \
	-p 30011:30011 \
	-v /data/game_server/target/Logs/10011:/Logs \
	-v /data/game_server/target/10011/app:/app \
-v /etc/localtime:/etc/localtime:ro \
game_server:latest
# docker start game_server_10011

docker run \
	--name game_server_10000 \
	--restart=always \
	-d \
	-p 10000:10000 \
	-p 20000:20000 \
	-p 30000:30000 \
	-v /data/game_server/target/Logs/10000:/Logs \
	-v /data/game_server/target/10000/app:/app \
-v /etc/localtime:/etc/localtime:ro \
game_server:latest
# docker start game_server_10000

# docker run \
# 	--name game_server_10001 \
# 	--restart=always \
# 	-d \
# 	-p 10001:10001 \
# 	-p 20001:20001 \
# 	-p 30001:30001 \
# 	-v /data/game_server/target/Logs/10001:/Logs \
# 	-v /data/game_server/target/10001/app:/app \
# -v /etc/localtime:/etc/localtime:ro \
# game_server:latest
# docker start game_server_10001

# docker exec -it game_server_10010 ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# docker exec -it game_server_10010 echo "'Asia/Shanghai'" >/etc/timezone
docker exec -it game_server_10010 date
docker exec -it game_server_10010 cat version_code.md
docker exec -it game_server_10010 cat version_config.md

# docker exec -it game_server_10011 ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# docker exec -it game_server_10011 echo "'Asia/Shanghai'" >/etc/timezone
docker exec -it game_server_10011 date
docker exec -it game_server_10011 cat version_code.md
docker exec -it game_server_10011 cat version_config.md

docker exec -it game_server_10000 ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
docker exec -it game_server_10000 echo "'Asia/Shanghai'" >/etc/timezone
docker exec -it game_server_10000 date
docker exec -it game_server_10000 cat version_code.md
docker exec -it game_server_10000 cat version_config.md

# docker exec -it game_server_10001 ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# docker exec -it game_server_10001 echo "'Asia/Shanghai'" >/etc/timezone
# docker exec -it game_server_10001 date
# docker exec -it game_server_10001 cat version_code.md
# docker exec -it game_server_10001 cat version_config.md

docker restart game_server_10010 game_server_10011
