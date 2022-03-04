## 1.zabbix-proxy

```shell
cat zabbix_proxy.conf 
Server=192.168.10.231
Hostname=zabbix_proxy_zw_03
LogFile=/data/zabbix/zabbix_proxy.log
LogFileSize=0
PidFile=/data/zabbix/zabbix_proxy.pid
DBHost=127.0.0.1
DBName=zabbix
DBUser=root
DBPassword=xiaoyu#EDC
SNMPTrapperFile=/data/zabbix/snmptrap.log
ConfigFrequency=60
DataSenderFrequency=60
Timeout=15
ExternalScripts=/data/zabbix/externalscripts
LogSlowQueries=10000

VMwareCacheSize=1024M
CacheSize=4G
HistoryCacheSize=2G
HistoryIndexCacheSize=512M
StartTrappers=50
StartPollers=600
StartPollersUnreachable=600
StartIPMIPollers=10
StartDiscoverers=100
StartPingers=100
#StartPollersUnreachable=1000
#CacheUpdateFrequency=300
```

```shell
cat zabbix-proxy.service
# /usr/lib/systemd/system/zabbix-proxy.service
[Unit]
Description=Zabbix Proxy
After=syslog.target
After=network.target
After=mysql.service
After=mysqld.service
After=mariadb.service
After=postgresql.service
After=pgbouncer.service
After=postgresql-9.4.service
After=postgresql-9.5.service
After=postgresql-9.6.service
After=postgresql-10.service
After=postgresql-11.service
After=postgresql-12.service

[Service]
Environment="CONFFILE=/etc/zabbix/zabbix_proxy.conf"
EnvironmentFile=-/etc/sysconfig/zabbix-proxy
Type=forking
Restart=on-failure
PIDFile=/run/zabbix/zabbix_proxy.pid
KillMode=control-group
ExecStart=/usr/sbin/zabbix_proxy -c $CONFFILE
ExecStop=/bin/kill -SIGTERM $MAINPID
RestartSec=10s
TimeoutSec=0

[Install]
WantedBy=multi-user.target
```

## 2.zabbix-server

```shell
cat /etc/zabbix/zabbix_server.conf 
LogFile=/data/zabbix/zabbix_server.log
PidFile=/data/zabbix/zabbix_server.pid
SocketDir=/data/zabbix
DBHost=192.168.10.252
DBName=zabbix
DBUser=zabbix
DBPassword=Dd4b61%#$65!
DBPort=3306
StartIPMIPollers=5
SNMPTrapperFile=/data/zabbix/snmptrap.log
HousekeepingFrequency=12
MaxHousekeeperDelete=500000
Timeout=30
AlertScriptsPath=/data/zabbix/alertscripts    
ExternalScripts=/data/zabbix/externalscripts
LogSlowQueries=5000
StartProxyPollers=250
StatsAllowedIP=127.0.0.1
LogFileSize=100
StartPollers=500
StartPollersUnreachable=500
StartTrappers=100
StartPingers=50
StartDiscoverers=30
CacheSize=8G
CacheUpdateFrequency=300
StartDBSyncers=100
HistoryCacheSize=2G
HistoryIndexCacheSize=512M
TrendCacheSize=1024M
ValueCacheSize=1G
Timeout=30
UnavailableDelay=90
UnreachableDelay=90
```

```shell
systemctl cat zabbix-server.service 
# /usr/lib/systemd/system/zabbix-server.service
[Unit]
Description=Zabbix Server
After=syslog.target
After=network.target
After=mysql.service
After=mysqld.service
After=mariadb.service
After=postgresql.service
After=pgbouncer.service
After=postgresql-9.4.service
After=postgresql-9.5.service
After=postgresql-9.6.service
After=postgresql-10.service
After=postgresql-11.service
After=postgresql-12.service

[Service]
Environment="CONFFILE=/etc/zabbix/zabbix_server.conf"
EnvironmentFile=-/etc/sysconfig/zabbix-server
Type=forking
Restart=on-failure
PIDFile=/run/zabbix/zabbix_server.pid
KillMode=control-group
ExecStart=/usr/sbin/zabbix_server -c $CONFFILE
ExecStop=/bin/kill -SIGTERM $MAINPID
RestartSec=10s
TimeoutSec=0
LimitNOFILE=100000
LimitNPROC=100000

[Install]
WantedBy=multi-user.target

```

## 3.zabbix-agent

```shell
cat /etc/zabbix/zabbix_agent2.conf 
PidFile=/var/run/zabbix/zabbix_agent2.pid
LogFile=/var/log/zabbix/zabbix_agent2.log
LogFileSize=0
Server=192.168.10.187
ServerActive=192.168.10.187
Hostname=manage-10.1.16.186
Include=/etc/zabbix/zabbix_agent2.d/*.conf
ControlSocket=/tmp/agent.sock
DenyKey=system.run[*]
Timeout=30
```

## 4.钉钉报警

```python
个人-->动作
服务器:{HOST.NAME}发生: {TRIGGER.NAME}故障!
告警主机:{HOST.NAME}
告警地址:{HOST.IP}
监控项目:{ITEM.NAME}
监控取值:{ITEM.LASTVALUE}
告警等级:{TRIGGER.SEVERITY}
当前状态:{TRIGGER.STATUS}
告警信息:{TRIGGER.NAME}
告警时间:{EVENT.DATE} {EVENT.TIME}
事件ID:{EVENT.ID}

管理--->报警媒介类型
cat /data/zabbix/alertscripts/dingding.py 
#!/usr/bin/env python
# -*- coding: utf-8 -*
import requests
import json
import sys
import os
headers = {'Content-Type': 'application/json;charset=utf-8'}
api_url = "https://oapi.dingtalk.com/robot/send?access_token=3a77f9e3c9a349b900cd2f94f935d4cecacc9bf5a7b124c65b94668f4d26dab9"
def msg(text):
    json_text= {
     "msgtype": "text",
        "text": {
         "content": "业务告警:"+text
         }
    }
    print requests.post(api_url,json.dumps(json_text),headers=headers).content
if __name__ == '__main__':
    text = sys.argv[1]
    msg(text)
```

![](C:\Users\king\AppData\Roaming\Typora\typora-user-images\image-20211227110240138.png)
