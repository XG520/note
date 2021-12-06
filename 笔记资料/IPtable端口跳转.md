# IPtable实现外网跳内网端口

说明：

机器1：公网ip：172.16.8.8   内网ip：192.168.2.10

机器2：内网ip：192.16.2.20

## 1、开启10086端口

```shell
sudo iptables -A INPUT -p tcp -m tcp --dport 10086 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m tcp --dport 10086 -j ACCEPT
```

## 2、所有连接本机172.16.8.8<外网>10086端口的都转接到192.168.2.20的22号端口上

```shell
sudo iptables -t nat  -A PREROUTING -d 172.16.8.8/24 -p tcp -m tcp --dport 10086 -j DNAT --to-destination 192.168.2.20:22
sudo iptables -t nat  -A POSTROUTING -d 192.168.2.20/24 -p tcp -m tcp --dport 22 -j SNAT --to-source 192.168.2.10
sudo iptables -t nat  -A PREROUTING -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -t nat  -A POSTROUTING -m state --state RELATED,ESTABLISHED -j ACCEPT
```

# 3、保存规则并刷新

```shell
sudo sh -c "iptables-save > /etc/network/iptables.up.rules"
sudo iptables-apply
```

## 4、机器2可以通过机器1上网

```shell
sudo iptables -t nat -A POSTROUTING  -s 192.168.2.0/24 -j SNAT --to 172.16.8.8
```

