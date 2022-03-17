export DOTNET_ROOT=/usr/local/dotnet
export PATH=$DOTNET_ROOT:$PATH
# rm -rf /root/source
cd /root
docker rm -f $(docker ps -a | awk '{print $NF}' | grep 'ops-server') 
docker rmi $(docker images -a  | grep 'ops-server' | awk '{print $3}') 
yes | docker image prune
svn info --username wangsiwei --password wangsiwei123 --no-auth-cache  "http://192.168.0.69:8080/svn/common/ops_v3.0/20220217/OpsServer@HEAD"
svn co --username wangsiwei --password wangsiwei123 --no-auth-cache -q "http://192.168.0.69:8080/svn/common/ops_v3.0/20220217/OpsServer@HEAD" /root/source/OpsServer
dotnet publish /root/source/OpsServer/OpsServer.sln -c Release -o /root/source/service/app
strip --strip-debug /root/source/service/app/runtimes/linux-x64/native/libgrpc_csharp_ext.x64.so
rm -rf /root/source/service/app/runtimes/osx-x64
rm -rf /root/source/service/app/runtimes/win
rm -rf /root/source/service/app/runtimes/win-x64
rm -rf /root/source/service/app/runtimes/win-x86 
sed -i "/mongoDB/d" /root/source/service/app/Configs/server_config.json && sed -i "1a \"mongoDB\": \"back_server_ops_test\"," /root/source/service/app/Configs/server_config.json
sed -i "/isDebug/d" /root/source/service/app/Configs/server_config.json && sed -i "1a \"isDebug\": true," /root/source/service/app/Configs/server_config.json
cat> /root/source/service/Dockerfile << EOF
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 8232
# ENTRYPOINT ["dotnet", "OpsServer.dll"]
EOF
cd /root/source/service
\cp -rf /root/source/service/app /data/game/
docker build -t ops-server -f ./Dockerfile .
docker run -it --name ops-server -p 8232:8232 -v /data/game/app:/app -v /data/game/Logs:/Logs --restart always -d ops-server:latest  sh -c "ls && dotnet OpsServer.dll"
