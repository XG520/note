## 暂停创建p1任务

```shell
vim /lib/systemed/system/p1p2-worker.service
auto-pledge=false
```

## 修改并发数

```shell
mg sectors devtest set-maxtaskcount PC1 2 id 38   id为38的改为2个并发   不加ID号就是全部执行
```

## 查看证明文件是否下载正常	

```shell
ansible  -i qh/qh-c2_hosts c2-01 -o -m shell -a "du -cs /var/tmp/filecoin-proof-parameters/v28-*|tail -n 1|awk '{print $1}'"|sort -k 1
```

## 查看链消息情况	

```shell
lotus mpool pending --local|grep Message|wc -l
lotus net peers    #看连接数
```

## 预做windowpost	

```shell
#预做
miner sectors devtest postone 5
# 检查是否有坏扇区
mg proving check --only-bad 0
#查看sector在哪一个wind
lotus state sector f0442376 5775
#停止正在做的wind
mg proving stop-window 42
#查找错误扇区
cat ./log/lotus.manage.log |grep ERROR|grep ffiwrapper|grep 'faulty sectors'|awk '{print $7,$1}'|sort|uniq
```

## winningpost	

```shell
#预做
miner sectors devtest winpost sectorID
```

## 查询C2任务数	

```shell
curl -ks https://gpu.bingheyc.com/api/dispatchstatus|jq
```

## 查询miner storage list 的存储情况	

```shell
miner storage list|grep -E "%|http"|awk -F '/|]' '{print $2,$3}'|awk '{printf "%s ",$0;getline;print}'|sed 's/ /\t/3;s/:.*/\t/'|sed -r 's/(.*%)(.*)/\2\1/'
```

## 查询GPU计算时间	

```shell
cat /data/lotus/log/lotus.worker.log |grep "gpu<=="|awk '{print $6,$8}'|tail
```

## 重新生成sector_info	

```shell
/data/lotus/bin/lotus-worker  --worker-repo=/data/lotus/storage5/f0100033/lotus_34_2 storage init-sector-info
/data/lotus/bin/lotus-worker  --worker-repo=/data/lotus/sg094/f0153024/lotus0_50_1 storage init-sector-info
/data/lotus/bin/lotus-worker  --worker-repo=/data/lotus/sg094/f0153024/lotus0_50_2 storage init-sector-info
```

## 定时清理miner  --->  ret-wai

```shell
miner sealing jobs|grep 00000000|awk '{print $1}'|xargs -n 1 /data/lotus/bin/lotus-miner --repo=/data/lotus/.lotus --miner-repo=/data/lotus/.lotusstorage sealing abort
miner sealing jobs|awk '$4!~/0-9]/{print $1}'|xargs -n 1 /data/lotus/bin/lotus-miner --repo=/data/lotus/.lotus --miner-repo=/data/lotus/.lotusstorage sealing abort
```

## 清除C1失败的	

```shell
miner sectors list --fast|grep -e ComputeProofFailed|awk '{print $1}'|while read sid; do errcnt=`miner sectors status --log $sid|grep 'computing seal proof failed'|grep 'no unwind information'|wc -l`; echo "removing $sid";miner sectors remove --really-do-it $sid;miner sectors devtest cancel-tasks C1 $sid;miner sectors devtest cancel-tasks C2 $sid; done
```

## 清除错误扇区- Faulty	

```shell
miner sectors list --fast|grep -e Faulty |awk '{print $1}'|while read sid; do miner sectors status --log $sid|grep FatalError&&miner sectors remove --really-do-it $sid&&echo $sid >> del.sector.log; done
miner sectors list --fast|grep ComputeProofFailed|awk '{print $1}'|xargs -n 1 /data/lotus/bin/lotus-miner --repo=/data/lotus/.lotus --miner-repo=/data/lotus/.lotusstorage sectors remove --really-do-it
```

## winnwind刷新存储目录	

```shell
mg storage attach /data/lotus/storage9/f095970/lotus10_15_1
mg storage attach /data/lotus/storage9/f095970/lotus10_15_2

ps -ef|grep lotus|grep -v grep|awk '{print $10}'|awk -F'=' '{print $2}'|sed 's/^/mg storage attach /g'
```

## 看读取存储时间	

```shell
cat /data/lotus/log/lotus.miner.log |grep 'post\/gen'|grep end
```

## 修改sector状态

```shell
mg sectors update-state --really-do-it 1541075 Committing
```

## 处理sector Faulty<C2上限>

```shell
mg sectors list --fast|grep Faulty > a.txt
awk '{print $1}' a.txt |while read sector;do echo -n $sector && mg sectors status --log $sector|grep "is over fail limit";done

awk '{print$1}'  a.txt |xargs|sed 's/ /,/g'|xargs -I {} curl --header "Content-Type: application/json" --request POST --data \
'{"minerid": 117542,"sectors": [{}]}' https://gpu.bingheyc.com/api/unmarktaskdone
awk '{print$1}'  a.txt |while read sec;do mg sectors update-state --really-do-it $sec Committing && echo -ne "$sec\t" && mg sectors status $sec|grep Status;done
```

## 强制提交SubmitCommitAggregate状态的扇区:

```shell
#批量手工提交
mg sectors  batching precommit --publish-now
mg sectors  batching commit --publish-now
```

## 扇区修复

```shell
curl -s https://script-1302987096.cos.ap-nanjing.myqcloud.com/check.pre.sector.sh|bash
cat b.txt |while read sec;do zcat /data/lotus/log/lotus.manage.log*.gz|grep "assign work:sid $sec" |grep "seal/v0/precommit/2";done
```

## P1P2相关

```shell
#查看算力机的启动环境参数
ps -ef|grep lotus-worker|grep -v grep |awk '{print $2}'|xargs -I {} cat /proc/{}/environ |grep -aw P1_COUNT=
#修改p1p2的GPU并发数
for workerid in $(mg sealing workers|grep 'Worker'|awk '{print $2}'|awk -F',' '{print $1}');do mg worker modify-config --workerId=$workerid --params='maxp1num=28&p2-gpu-num=8&p2-cpu-num=0&maxc2num=0&auto-pledge=true';done

```

链服务起链接数异常

```shell
lotus net connect /dns4/bootstrap-0.mainnet.filops.net/tcp/1347/p2p/12D3KooWCVe8MmsEMes2FzgTpt9fXtmCY7wrq91GRiaC8PHSCCBj
lotus net connect /dns4/bootstrap-1.mainnet.filops.net/tcp/1347/p2p/12D3KooWCwevHg1yLCvktf2nvLu7L9894mcrJR4MsBCcm4syShVc
lotus net connect /dns4/bootstrap-2.mainnet.filops.net/tcp/1347/p2p/12D3KooWEWVwHGn2yR36gKLozmb4YjDJGerotAPGxmdWZx2nxMC4
lotus net connect /dns4/bootstrap-3.mainnet.filops.net/tcp/1347/p2p/12D3KooWKhgq8c7NQ9iGjbyK7v7phXvG6492HQfiDaGHLHLQjk7R
lotus net connect /dns4/bootstrap-4.mainnet.filops.net/tcp/1347/p2p/12D3KooWL6PsFNPhYftrJzGgF5U18hFoaVhfGk7xwzD8yVrHJ3Uc
lotus net connect /dns4/bootstrap-5.mainnet.filops.net/tcp/1347/p2p/12D3KooWLFynvDQiUpXoHroV1YxKHhPJgysQGH2k3ZGwtWzR4dFH
lotus net connect /dns4/bootstrap-6.mainnet.filops.net/tcp/1347/p2p/12D3KooWP5MwCiqdMETF9ub1P3MbCvQCcfconnYHbWg6sUJcDRQQ
lotus net connect /dns4/bootstrap-7.mainnet.filops.net/tcp/1347/p2p/12D3KooWRs3aY1p3juFjPy8gPN95PEQChm2QKGUCAdcDCC4EBMKf
lotus net connect /dns4/bootstrap-8.mainnet.filops.net/tcp/1347/p2p/12D3KooWScFR7385LTyR4zU1bYdzSiiAb5rnNABfVahPvVSzyTkR
lotus net connect /dns4/lotus-bootstrap.ipfsforce.com/tcp/41778/p2p/12D3KooWGhufNmZHF3sv48aQeS13ng5XVJZ9E6qy2Ms4VzqeUsHk
lotus net connect /dns4/bootstrap-0.starpool.in/tcp/12757/p2p/12D3KooWGHpBMeZbestVEWkfdnC9u7p6uFHXL1n7m1ZBqsEmiUzz
lotus net connect /dns4/bootstrap-1.starpool.in/tcp/12757/p2p/12D3KooWQZrGH1PxSNZPum99M1zNvjNFM33d1AAu5DcvdHptuU7u
lotus net connect /dns4/node.glif.io/tcp/1235/p2p/12D3KooWBF8cpp65hp2u9LK5mh19x67ftAam84z9LsfaquTDSBpt
lotus net connect /dns4/bootstrap-0.ipfsmain.cn/tcp/34721/p2p/12D3KooWQnwEGNqcM2nAcPtRR9rAX8Hrg4k9kJLCHoTR5chJfz6d
lotus net connect /dns4/bootstrap-1.ipfsmain.cn/tcp/34723/p2p/12D3KooWMKxMkD5DMpSWsW7dBddKxKT7L2GgbNuckz9otxvkvByP
```

