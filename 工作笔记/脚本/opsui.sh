export DOTNET_ROOT=/usr/local/dotnet
export PATH=/usr/local/dotnet:/usr/local/dotnet:/usr/local/dotnet:/usr/local/dotnet:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
# rm -rf /root/source
cd /root
docker rm -f $(docker ps -a | awk '{print $NF}' | grep 'opsui') 
docker rmi $(docker images -a  | grep 'opsui' | awk '{print $3}') 
yes | docker image prune
svn info --username wangsiwei --password wangsiwei123 --no-auth-cache  "http://192.168.0.69:8080/svn/common/ops_v3.0/20220217/Ops@HEAD"
svn co --username wangsiwei --password wangsiwei123 --no-auth-cache -q "http://192.168.0.69:8080/svn/common/ops_v3.0/20220217/Ops@HEAD" /root/source/ops
cat> /root/source/ops/OpsHost/appsettings.json << Config
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "ConnectionString": {
    "Grpc": "192.168.0.107:8232"
  },
  "AllowedHosts": "*"
}
Config
# dotnet publish /root/source/ops/OpsHost/OpsHost.csproj -c Release -o /root/source/ui/app
dotnet publish /root/source/ops/Ops.sln -c Release -o /root/source/ui/app
strip --strip-debug runtimes/l/root/source/ui/app/inux-x64/native/libgrpc_csharp_ext.x64.so
rm -rf /root/source/ui/app/runtimes/osx-x64
rm -rf /root/source/ui/app/runtimes/win
rm -rf /root/source/ui/app/runtimes/win-x64
rm -rf /root/source/ui/app/runtimes/win-x86 
cat> /root/source/ui/Dockerfile << EOF
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
# EXPOSE 80
COPY ./app .
# ENTRYPOINT ["dotnet", "OpsHost.dll"]
EOF
cd /root/source/ui
docker build -t opsui -f ./Dockerfile .
docker run -it --name opsui -p 5000:80  --restart always -d opsui:latest sh -c "ls && dotnet OpsHost.dll"
