#!/bin/bash
mkdir -p  /test/data/bin
cd /test/data/
echo -e "p\nyes\n" | svn checkout https://192.168.0.143:8443/svn/TEST/trunk --username=xg --password=666666
if [ $? -eq 0 ];then
	cd /test/data/trunk/AntBlazorDemo
	dotnet publish ./AntBlazorDemo.csproj  -o ../../bin
	echo -e "FROM mcr.microsoft.com/dotnet/aspnet:6.0\nCOPY ./bin /app \nWORKDIR /app \nEXPOSE 5000 \nENTRYPOINT [\"dotnet\",\"AntBlazorDemo.dll\", \"--urls=http://*:5000\"]" >> /test/data/Dockerfile
	cd /test/data
	docker build -t mcr.microsoft.com/dotnet/aspnet6.0:test .
else 
	echo "错误"
fi
