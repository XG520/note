

```yaml
network:
  bonds:
    bond1:
      addresses:
                - 36.153.95.67/27     #业务IP   A
                - 10.11.12.2/24            #内网IP        C
      #gateway4: 36.153.95.94         #业务网关   B 
      interfaces: [ enp67s0f0,enp67s0f1 ]  #物理网卡接口  
      nameservers:
              addresses: [ 223.5.5.5,114.114.114.114 ]           #运营商DNS
      parameters:
              mode: active-backup
              primary: enp67s0f0                   #物理网卡接口
      routes:
              - to: 0.0.0.0/0
               via: 36.153.95.94            #业务网关    B
               metric: 100                 #安全路由控制100跳以内
              - to: 10.10.12.0/24            #签名服务器网段
               via: 10.11.12.254            #内网网关
               metric: 5                   #安全控制路由跳数5跳以内
  ethernets:
         enp67s0f0: {}              #物理网卡接口
         enp67s0f1: {}              #物理网卡接口
  version: 2
```

