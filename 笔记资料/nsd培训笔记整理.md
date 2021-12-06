# 第一阶段

------

## 一、ADMIN阶段命令

### 1、查看命令

​	(1) cat 查看文本文件内容<more>
​	(2) Less 分屏查看文本文件内容
​	(3) head -3 显示前三行内容  不写，则默认为10行
​	(4) tail -3 显示后三行内容  不写，则默认为10行​

```shell
grep 参数 文件路径  查找该文件中包含本参数的命令行
	-E    #正则匹配 
	-n    # 显示行号 
	-v    # 取反匹配
	-i    # 忽略大小写
	-r    #查找目标在那个文件
	^     #以什么开头  书写在字符串前面
	$     #以什么结尾  书写在字符串后面
	^$    # 代表空行
```

### 2、目录及文件操作操作 

```shell
cd ..   #表示切换到父目录
cd ~    #表示到家目录
cd -    #切回上一个目录
pwd     #显示所在位置 
mkdir -p   #递归创建目录
touch       #创建文件
rm  -rf 文件路劲   #删除文件及目录  
mv -p(cp是可以保持权限不变) 原路径  目标路径 #（目录不变的移动可以重命名）
cp -p 原路径  目标路径   #(可以用.代替路径直接把文件复制到当前目录)
```

### 3、ls 查看目录

```shell
ls -l    #显示属性
ls -d    #显示参数本身
ls -A    #显示隐藏内容
ls -R    #递归显示
ls -h    #显示单位
ls -lSa  #按文件大小排序
```

### 4、系统数据查询

​	(1) lscpu 查看CPU信息，uptime 查看CPU负载
​	(2) cat  /proc/meminfo 查看内存信息
​	(3) uname - r 查看你内核版本
​	(4) cat /etc/redhat-release 版本信息
​	(5) PowerOff 关闭计算机
​	(6) reboot 重启
​	(7) exit 退出终端
​	(8) hostname 查看主机名
​	(9) ifconfig  查看网卡信息  ---> ip a 
​			a、vibro  表示虚拟网卡
​			b、lo 为回环地址
​			c、ens33  一般表示第一张网卡信息

### 5、目录文件信息

```shell
/dev/      #设备信息
/etc/      #配置文件信息
/proc      #内存数据，不占用硬盘空间
/var/log   #日志文件
/boot/     #存放内核和开机引导进程
```

### 6、vim基本操作

​		i 进去插入模式
​		esc 进去命令行模式（退出插入模式）
​		：进入末行模式（wq保存并退出，q!不保存退出）
命令模式：

| 操作类型     | 按键指令             | 用 途                  |
| ------------ | -------------------- | ---------------------- |
| 移动光标     | 上、下、左、右       | 上、下、左、右         |
| 光标行内跳转 | Home 键 或 ^、数字 0 | 跳转到行首             |
|              | End 键 或“$”键       | 跳转到行尾             |
| 全文翻页     | PgUp 键、PgDn 键     | 向上翻页、向下翻页     |
| 光标行间跳转 | 1G 或 gg             | 跳转到文件的首行       |
|              | G                    | 跳转到文件的末尾行     |
| 操作类型     | 按键指令             | 用 途                  |
| 复制         | yy、#yy              | 复制光标处的一行、#行  |
| 粘贴         | p、P                 | 粘贴到光标处之后、之前 |
| 删除         | x 或 Delete键        | 删除光标处的单个字符   |
|              | dd、#dd              | 删除光标处的一行、#行  |
|              | d^                   | 从光标处之前删除至行首 |
|              | d$                   | 从光标处删除到行尾     |
| 操作类型     | 按键指令             | 用 途                  |
| 文本查找     | /root                | 向后查找字符串“root”   |
|              | n、N                 | 跳至后/前一个结果      |
| 撤销编辑     | u                    | 撤销最近的一次操作     |
|              | U                    | 撤销对当前行的所有修改 |
|              | Ctrl + r             | 取消前一次撤销操作     |
| 保存退出     | ZZ（大写）           | 保存修改并退出         |


      末行模式

| 操作类型   | 设置指令            | 用 途                   |
| ---------- | ------------------- | ----------------------- |
| 存盘及退出 | :w                  | 保存当前文件            |
|            | :q!                 | 放弃已有更改后强制退出  |
|            | :wq 或 :x           | 保存已有修改后退出      |
| 文件操作   | :w /root/newfile    | 另存为其它文件          |
|            | :r /etc/filesystems | 读入其他文件内容        |
| 操作类型   | 设置指令            | 用 途                   |
| 行内替换   | :s/root/xixi        | 替换当前行第一个“root”  |
|            | :s/root/xixi/g      | 替换当前行所有的“root”  |
| 区域内替换 | :1,8 s/root/xixi/g  | 替换第1-8行所有的“root” |
|            | :% s/root/xixi/g    | 替换文件内所有的“root"  |
| 操作类型   | 设置指令            | 用 途                   |
| 编辑器设置 | :set nu或nonu       | 显示/不显示行号         |
|            | :set ai或noai       | 启用/关闭自动缩进       |
|            | :set paste          | 带格式粘贴              |

### 7、定义别名

```shell
alias hn=”hostname”  用hn代表命令hostname
unalias 取消别名
alias 显示当前用户定义的所有别名
vim /etc/profile #可永久定义
```

### 8、压缩命令

​	（1）tar  选项  /路径/压缩包名字  /路径/源数据1   /路径/源数据2
​			-c：创建归档
​			-x：释放归档
​			-f：指定归档文件名称,必须放在所有选项的最后
​			-z、-j、-J：调用 .gz、.bz2、.xz 格式的工具进行处理
​			-t：显示归档中的文件清单
​			-C：指定释放的位置		 

```
例： [root@A ~]# tar -zcf  /opt/nb01.tar.gz  /home/   /etc/passwd
    [root@A ~]# tar  -xf   /root/backup.tar.bz2   -C  /nsddir01
```

​	（2）zip工具：

```shell
zip [-r] 备份文件.zip   被归档的文档     #压缩
unzip 备份文件.zip      [-d 目标文件夹]  #解压缩
```

### 9、管道和重定向

​	 >>     追加重定向 
​	 >      覆盖重定向
​	|     管道：前面命令的输出作为后面命令的参数（可有多个管道）

### 10、find精确查找

​	find  [目录]  [条件1]
​		常用条件表示：
​			-type 类型（文件f、目录d、快捷方式l）
​			-name "文档名称"
​			-size +|-文件大小（k、M、G）
​			-user 用户名
​			-mtime 修改时间
​		    -exec 额外操作的开始   \; 表示额外操作的结束
​			{} 前面find命令每一个查询的结果​    

```shell
例子：
find /boot -size +10M -exec cp -r {} /root/bodir \;
find /etc/ -name \* -print | xargs grep "abc"  在etc下查找含有abc的文件目录
find /usr/bin -type f -atime +100 搜索在过去100天内未被使用过的执行文件

find /usr/bin -type f -mtime -10 搜索在10天内被创建或者修改过的文件
```



### 11、history

```shell
history -c   #清空历史命令
!n          #执行命令历史中的第n条命令
!str        #执行最近一次以str开头的历史命令
export HISTTIMEFORMAT="%F %T `whoami` "  
>> /etc/profile  --> source /etc/profile
```

### 12、统计文件占用空间

​	du，统计文件的占用空间
​	du [选项]... [目录或文件]...
​		-s：只统计每个参数所占用的总空间大小
​		-h：提供易读容量单位（K、M等）

### 13、修改时间

​	date，查看/调整系统日期时间
​	date -s "yyyy-mm-dd HH:MM:SS"   #修改时间

```
	[root@A ~]# date  +%F   #显示  年月日
	[root@A ~]# date  +%Y   #显示年
	[root@A ~]# date  +%m   #显示月
	[root@A ~]# date  +%d   #显示日期
	[root@A ~]# date  +%R   #显示时分
	[root@A ~]# date  +%H   #显示时
	[root@A ~]# date  +%M  #显示分
	[root@A ~]# hwclock       #显示硬件时间
	[root@A ~]# hwclock  -w   #同步时间，以系统时间为准
```

### 14、快捷方式

​	软连接：
​			ln  -s  /路径/源数据  /路径/快捷方式的名字
​		硬链接：
​		ln  /路径/源数据  /路径/快捷方式的名字
​		若原始文件被删除，链接文件仍可用
​		硬连接与原始文件必须在同一分区/文件系统

### 15、挂载设备

​	（1）临时挂载：
​		    mount /dev/cdrom（挂在的设备）  /路径（挂在位置）
​			umount -l 强制卸载
​	（2）开机自动挂载：配置文件 /etc/fstab 的记录格式
​			设备路径  挂载点 类型   参数  备份标记 检测顺序 
​			/dev/cdrom /dvd   iso9660  defaults   0     0
​	（3）触发挂载：软件包autonfs
​			a.mkdir  /nsd2002
​			b.修改主配置文件/etc/auto.master
​			   /nsd2002   /opt/dc.txt
​				监控目录  挂载配置文件路径
​			c.挂载配置文件/etc/auto.misc (可自由设置名称和路径)
​			    vim  /opt/dc.txt
​				    test              -fstype=iso9660   :/dev/cdrom
​			        触发点子目录 挂载参数           :设备路径(IP地址时不用前面加冒号)
​			  注意：不能和自动挂载在同一目录
​			d.重启服务并验证
​			 systemctl  restart  autofs
​			 ls  /nsd2002/test
​			 df -ah
​			（4）查看挂载设备：df -h
​			（5） mount -a     #检测/etc/fstab文件的内容

### 16、软件文件安装

​	（1）RPM安装：
​			查看安装信息：
​				rpm -q[子选项] [软件名称]
​				•常用的子选项
​				-a：列出已安装的所有软件包
​				-i：查看指定软件的详细信息
​				-l：查看指定软件的文件安装清单
​			查询某个目录/文件是哪个RPM包带来的：
​				rpm -qf [文件路径]…
​				即使目标文件被删除，也可以查询
​			安装RPM软件
​				格式：rpm  -i RPM包文件...
​				辅助选项
​					-v：显示细节信息
​					-h：以#号显示安装进度
​					-force：强制安装、覆盖安装
​					-test：测试安装，不做真实安
​					卸载软件：rpm -e 软件名
​	（2）yum安装
​			  仓库搭建

```shell
vim /etc/yum.repo.d/*.repo
	[xixi]                     #仓库标识,可以任意
	name=hehe  lele  CentOS7  #仓库的描述信息，可以任意
	baseurl=file:///dvd   #指定服务端位置，file://代表本地为服务端
	enabled=1             #是否启用本文件
	gpgcheck=0            #是否检测红帽签名信息
```


​				常用命令

```shell
yum  -y install nginx  	#安装Nginx：
rpm -q nginx  			 #查看nginx安装版本
rpm -qa|grep ansible     #查看ansible的安装包
yum  repolist            #列出仓库信息
yum list                 #列出仓库中所有的软件包
yum search vsftp          #查询仓库中是否有vsftp软件包，模糊查询
yum info firefox          #查询仓库中firefox软件功能及用途等信息
yum provides /etc/passwd  #查询仓库中那个软件包产生该数据
```

​		(3) 自定义yum仓库

```shell
createrepo  [软件包所在路径]  #创建仓库数据文件
*修改/etc/yum.repo.d/.repo**
再添加一个yum仓库:
[zijian] 
name= 
baseurl= 
enabled=1 
gpgcheck=0
#(注意：两个仓库的[]内容不能一样)
```



### 17、用户和组

  （1）useradd [选项]... 用户名

```shell
常用命令选项
-u：指定 UID 标记号
-d：指定宿主目录（家目录），缺省为 /home/用户名
-G：指定所属的附加组
-g:指定用户的基本组
-s：指定用户的登录解释器
例：新建用户fil并添加密码
useradd -m -d /home/fil -s /bin/bash fil   
echo fil:mima|sudo chpasswd
echo mima | passwd --sdtin fil
userdel命令
格式：userdel [-r] 用户名
添加 -r 选项，宿主目录/用户邮件也一并删除
```

 （2）usermod [选项]... 用户名
		•常用命令选项
			-l：更改用户帐号的登录名称
			-u：用户id
			-s：登录的解释器
			-G：附加组   //重置附加组
			-d：家目录路径
 （3）查看用户基本信息及配置文件
			id 用户名
			grep 用户名 /etc/passwd  #用户信息
			/etc/shadow #密码信息
 （4）创建组 groupadd 组名
           grep 组 /etc/group  #组信息
 （5）组管理
		格式：gpasswd [选项]... 组名
		•常用命令选项
			-A：定义组管理员列表
			-a：添加组成员，每次只能加一个
			-d： 删除组成员，每次只能删一个
			-M：定义组成员用户列表，可设置多个

```shell
gpasswd -a b a  #把b用户添加到组a
gpasswd -d b a  #把b用户从组a删除
groups fil      #查看fil用户在哪些组
[root@wangxl ~]# grep -w a /etc/group  #查看a组有哪些用户
a:x:1005:b,c,d             #表示a组存在用户b,c,d
chgrp group1 file1 #改变文件的群组
```

（6）设置密码

```shell
交互式：passwd 用户
非交互式：
echo pass | passwd --sdtin user    
echo user:pass|sudo chpasswd
su -  可以切换用户
sudo su 不改变目录切换root
新建用户时，用户的家目录根据 /etc/skel 模板目录复
```

### 18、计划任务cron

​		编辑：crontab  -e  [-u  用户名]
​		查看：crontab  -l   [-u  用户名]
​		清除：crontab  -r  [-u  用户名]
​		文件书写格式：分 时 日 月 周  任务命令行（绝对路径）

```
例：*/2  *  *  *  *  date  >>  /opt/time.txt （表示每2分钟向time.txt写入系统时间）
```



------

## 二、ENGINEER阶段

### 1、权限设置

```
1）格式：（d目录c字符设备s符号连接诶文件b块设备-普通文件）
	chmod [ugoa] +-= 文件...（r读w写，x执行）
    chmod [nnn] 文件...  （数字表示法4读,2写,1执行）
    常用命令选项：
        -R：递归修改权限
	查看：默认情况下：目录的默认权限为755  文件的默认权限为644<–取决于 umask 设置>
    	ls  -ld  /nsd10  查看nsd10文件的本身属性就可以看权限
2）set gid(s权限）：chmod  g+s或g-s 文件（针对目录）占用属组（group）的x 位  
         在一个具有SGID权限的目录下，新建的文档会自动继承此目录的属组身份
3）skity bit（t权限）：chmod o+t 文件  占用其他人（Other）的x位
         在设置了粘滞位（t权限）的文件夹下，即使用户有写入权限，也不能删除或改名其他用户文档
```

```shell
设置suid：   chmod u+s test_folder    #在该文件执行时会使用这个文件所属用户的身份运行，而非执行用户
设置sgid：   chmod g+s test_folder    #在一个具有SGID权限的目录下，新建的文档会自动继承此目录的属组身份
设置sticky： chmod o+t test_folde     #在设置了粘滞位（t权限）的文件夹下，即使用户有写入权限，也不能删除或改名其他用户文档
```

​	（4）ACL权限：对个别用户、个别组设置独立的权限			

```
格式：setfacl [选项] u:用户名:权限 文件...   针对用户
	 setfacl [选项] g:组名:权限  文件...    针对组
		用命令选项
		   -m：定义一条ACL策略
		   -x：清除指定的ACL策略
		   -b：清除所有已设置的ACL策略
		   -R：递归设置ACL策略
注意：-Rm 同时使用时顺序不能颠倒
```

### 2、归属设置

​	格式：
​		chown  属主  文件...    修改所有者
​		chown  属主:属组  文件...  修改所有者和所属组
​		chown  :属组  文件...   修改所属组

### 3、磁盘分区

​	（1）MBR分区(fdisk)  <2.2T
​			lsblk 查看识别的硬盘
​			blkid 查看分区文件系统格式
​			df -h 设备挂载情况
​			fdisk  /dev/sdb  开始分区
​			 n新建  p 查看  w 保存  q 退出
​			mkfs.ext4  /dev/sdb1  格式化分区（常用文件系统格式ext4,xfs）
​			partprobe   #刷新分区表
​	（2）GPT分区(parted)
​			print    查看分区表
​			rm 序号   删除指定的分区
​			quit    退出交互环境
​			unit GB  使用GB作为显示单位
例：[root@A ~]# parted   /dev/sdc     #此命令默认保存					

```
(parted) 连续按两次tab键    #显示可以使用的命令
					........   
					(parted) mktable   gpt   #指定分区表模式为gpt
					(parted) print        #输出分区表信息
					(parted)  mkpart       #创建新的分区
					分区名称？  []? xixi     #指定分区的名字，随意写可以重复
					文件系统类型[ext2]? xfs  #指定分区文件系统类型，随意写不起作用                                
					起始点？ 0                                   
					结束点？ 3G                                
					警告: The resulting partition is not properly aligned for best performance.
					忽略/Ignore/放弃/Cancel?  Ignore    #选择忽略，给出存放分区表信息的空间
					(parted) print
					(parted) unit GB       #使用GB作为显示的单位
```

### 4、交换空间

​	(1) 以分区制作（思维：分区<文件>-格式化-启用<自启动>）		

```shell
free -m       #查看交换空间与内存大小
swapon      #查看交换空间成员信息 （加上分区路径也可以启用交换空间）
swapoff    #停用交换空间
sed -ri 's/.*swap.*/#&/' /etc/fstab #永久关闭
mkswap    #格式化分区为交换空间格式（-f 强制格式化为swap文件系统）
vim /etc/fstab 书写（/dev/sdc1 swap swap defaults 0 0）   #开机自动启用
swapon -a   #检查交换空间即vim /etc/fstab格式数据是否书写正确
```

​	(2)以文件制作
​	     创建一个2G的文件：

```shell
dd if=/dev/zero of=/opt/abc.txt bs=1M count=2048
```

### 5、逻辑卷的制作

​	(1) pv（物理卷） vg（卷组） lv（逻辑卷）
​	(2) 卷组制作：
​		vgcreate  systemvg（名称）  设备路径（分区，硬盘均可->均必须没使用过）
​		例：vgcreate  vg1 /dev/sdb /dev/sdc 
​		vgs 查看卷组信息
​	(3) lv制作：
​		lvcreate -n  逻辑卷名 -L 分配大小  卷组名
​		例：lvcreate -n  lv1 -L  10G  vg1
​		lvs 查看逻辑卷信息
​	(4) 格式化（mkfs.xfs）后就可挂载(vim /etc/fstab)使用了
​	(5) 扩展逻辑卷
​		a、卷组空间足够的情况下：
​			lvextend -L  扩到多大  逻辑卷名  -->直接扩逻辑卷就行
​			resize2fs刷新ext4文件系统
​			xfs_growfs 刷新xfs文件系统
​		b、卷组空间不够情况下：
​			先扩卷组：vgextend systemvg(卷组名) 设备路径1 设备路径2...
​			再扩逻辑卷：lvextend -L 大小  逻辑卷名
​			刷新文件系统后就可使用（resize2fs,xfs_growfs）
​		c、修改PE的大小默认情况下为4M
​			创建卷组时定义：vgcreat -s PE大小 卷组名 设备路径
​			已经创建卷组时：vgchange -s PE大小 卷组名

### 6、进程管理

​	(1) pstree 选项 用户名或PID   查看进程信息
​		-a 显示全部命令行 
​		-p显示进程PID
​	(2) pgrgp    参数   检索包含参数的PID
​	(3) ps aux      显示正在运行的所有进程的详细信息
​	(4) ps -elf       显示正在运行的所有进程的父进程的PID
​	(5) wc -l         统计文件的行数
​	(6) sleep 沉睡终端或程序（加&进程直接进入后台运行 ）
​		① fg       恢复后台程序到前台运行
​		② bg      将后台暂停进程恢复运行
​		③ jobs   查看后台进程运行情况
​		④ ctrl+z 暂停运行进程 ctrl+c 结束运行进程

### 7、Linux网络配置

​	(1) nmcli命令使用

```shell
nmcli connection show    #查看识别的网卡名信息
nmcli device status      #查看系统识别的网卡信息
route -n                 #查看路由表信息
nmcli connection delete  #删除网卡
```

​	(2) 修改网卡命名规则

```shell
#修改配置文件：/etc/default/grub ---> 倒数第二行加上：net.ifnames=0 biosdevname=0  （以Linux=开头的）
grub2-mkconfig -o /boot/grub2/grub.cfg     #重新生成引导配置文件
nmcli connection delete '有线连接 1'      #删除网卡有线连接1
nmcli connection add type ethernet ifname eth0 con-name eth0   #添加网卡eth0
```

​	 (3) 网卡team（网卡组队、链路聚合）
​		  作用：备份网卡设备，提高可靠性				

```shell
#① 建立虚拟网卡设备，参考 man teamd.conf 进行全文查找 /example
nmcli connection add type team ifname team0 con-name team0 autoconnect  yes  config '{"runner": {"name": "activebackup"}}'
#② 添加成员
nmcli connection add type team-slave autoconnect yes ifname eth1 con-name team0-1 master team0
nmcli connection add type team-slave autoconnect yes ifname eth2 con-name team0-2 master team0
#③ 以配置文件名team0，team0-1，team0-2进行激活（successfully表示激活成功）
#④ 为team0配置IP地址并激活配置
nmcli connection modify team0 ipv4.method manual ipv4.addresses 192.168.1.1/24 connection.autoconnect yes
nmcli connection up team0
#⑤ teamdctl team0 state   #专门查看team0状态的命令
```

​	(4) IP、掩码、网关、DNS配置

```shell
① nmcli connection modify 'eth0' ipv4.method manual ipv4.addresses 192.168.4.7/24 ipv4.gateway 192.168.4.254 connection.metered yes
② nmcli connection up eth0 激活配置
③ DNS配置：echo nameserver 1.1.1.1 > /etc/reslov.conf
④ 查询命令的来源
	1) which 命令
	2) rpm -qf 路径（which查询出的结果）
⑤ 临时配置
	1) ip address add 192.168.8.1 dev eth0
	2) ip address show 也可查看网卡信息
```



### 8、远程管理linux

​	(1) ssh 选项  用户名@机器地址  （-X开启远对方的图形程序）
​         例：ssh root@192.168.4.207 以root身份远程进入主机地址为192.168.4.207的机器
​	(2) /root/.ssh/known_hosts  记录远程信息的文件
​	(3) 复制工具：scp 源文件路径 用户名@B机器地址：目标路径（A->B）
​	(4) 产生公钥和私钥（实现无密码的远程登录或者复制）
​		① ssh-keygen 产生公钥和私钥
​		     ssh-keygen -f /root/.ssh/rd_isa -N ""  非交互式创建
​		② ssh-copy-id 用户名@主机地址（目标机器） 传递公钥到B机器

```shell
1、配置私钥
	a、使用命令ssh-keygen -t rsa生成密钥，会生成一个私钥和一个公钥，在提示输入passphrase时如果不输入，直接回车，那么以后你登录服务器就不会验证密码，		否则会要求你输入passphrase，默认会将私钥放在/root/.ssh/id_rsa公钥放在/root/.ssh/id_rsa.pub。
	b、将公钥拷贝到远程服务器上的/root/.ssh/authorized_keys文件(scp /root/.ssh/id_rsa.pub server:/root/.ssh/authorized_keys)，注意，文件		名一定要叫authorized_keys。
	c、客户端上保留私钥，公钥留不留都可以。也就是服务器上要有公钥，客户端上要有私钥。这样就可以实现无密码验证登录了。
2、如果想要获得最大化的安全性，禁止口令登录，可以修改上/etc/ssh/sshd_conf中的PasswordAuthentication yes 改为 PasswordAuthentication no
	也即只能使用密匙认证的openssh，禁止使用口令认证。
```

### 9、源码编译安装：

```shell
#工具包： tools.tar.gz
(1) 先检查是否安装gcc和make，没有则利用yum安装
(2) tar -xf /root/tools.tar.gz -C /   #解压tools.tar.gz到/
(3) tar -xf /tools/inotify-tools-3.13.tar.gz -C /tmp/  
(4) ./configure --prefix=/opt/myrpm    #指定安装位置（./表示运行）
(5) make
(6) make install  #生成可以运行的执行程序
```

### 10、日志管理

​	(1) 常见的日志文件

| 日志文件          | 主要用途                         |
| ----------------- | -------------------------------- |
| /var/log/messages | 记录内核消息、各种服务的公共消息 |
| /var/log/dmesg    | 记录系统启动过程的各种消息       |
| /var/log/cron     | 记录与cronfen计划任务相关的消息  |
| /var/log/maillog  | 记录邮件收发相关的消息           |
| /var/log/secure   | 记录与访问限制相关的安全消息     |

​    (2) users、who、w  查看已登录的用户信息，详细度不同（：0图形，pts命令行）
​	(3) last lastb   查看登录成功的和登陆失败的用户信息
​	(4) tail -f  实时跟踪日志信息
​	(5) 日志优先级有0-7共8种，越小越优先
​	(6) journctlctl 提取日志信息 

```shell
① journalctl | grep 关键词
② journalctl -u 服务名
③ journalctl -n  消息条数	
```

### 11、sel Linux安全机制：

​					    一套增强系统安全的强制访问控制体系

​	（1）getenforce 查看sellinux模式
​			  setenforce 1|0 修改，模式
​			  强制模式permissive 宽松模式disabled 彻底禁用
​			  修改配置文件：/etc/selinux/config
​	（2）重设root密码	

```shell
1）重启在Linux16行末尾添加rd.break console=tty0     
2) Ctrl+X 进入紧急救援模式
	a、mount -o remount,rw /sysroot  设置权限
	b、chroot /sysroot   挂载
	c、echo mima | passwd –-stdin root 设置密码
	d、touch /.autorelabel 
	e、reboot -f  强制重启系统
	3）或者在重启Linux16行中ro 开始的内容修改成rw rd.break<Linux>    ---> rw single init=/bin/bash<ubuntu>
			----接上面2）的bcde步骤
```

### 12、构建服务器

​	(1) web服务器

```shell
① 先用yum安装httpd软件包
② systemctl restart httpd  #启动httpd服务
③ systemctl enable httpd   #设置开机自启动
④ 在/var/www/html/新建#一个index.html文件
⑤ curl 本机地址    #测试搭建结果
```

​	(2) ftp服务器	

```shell
① 先用yum安装vsftp软件包
② systemctl start httpd     #启动vsftpd服务
③ systemctl enable vsftpd   #设置开机自启动
④ 在/var/ftp/新建文件
⑤ 用curl ftp://本机地址       #测试搭建结果
⑥ 12  anonymous_enable=NO    #不允许匿名登录
⑦ 29  non_upload_enable=YES  #允许匿名上传文件
```

### 13、防火墙相关设置

​	(1) 检查firewalld软件包是否安装，没有则用yum安装
​	(2) systemctl status firewalld 查看服务状态
​	(3) firewall-cmd --get-default -zone 查看默认区域
​	(4) firewall-cmd --set-default -zone=public 设置默认区域
​		① public公共区域    默认只有ping,dhcp,ssh服务
​		② trusted 信任区域   允许所有服务
​		③ block拒绝区域    有回执
​		④ drop 丢弃区域    无回执
​	(5) firewall-cmd --zone=public --list-all 查看区域规则
​	(6) firewall-cmd --zone=block --add-source=192.168.4.207单独拒绝主机访问
​	(7) firewall-cmd --zone=public --add-service=http 向public添加http服务协议
​		注意：上述添加为临时添加，加 --permanent则为永久添加
​	(8) firewall-cmd --reload  重新加载防火墙有效配置 

### 14、Linux系统和服务管理器

​	(1) 配置目录：/etc/systemd/system/   服务目录：/lib/systemd/system/

```shell
① systemctl restart 服务名      #重起服务
② systemctl start 服务名       #开启服务 
③ systemctl stop 服务名        #停止服务
④ systemctl status 服务名       #查看服务当前的状态
⑤ systemctl enable 服务名       #设置服务开机自启动
⑥ systemctl disable 服务名      #设置服务禁止开机自启动
⑦ systemctl is-enabled 服务名     #查看服务是否开机自启
```

​	(2) 运行模式（运行级别）

```shell
#字符模式：multi-user.target   图形模式：graphical.targe
1) systemctl isolate multi-user.target      #当前直接切换到字符模式
2) systemctl isolate graphical.targe        #当前直接切换到图形模式
3) systemctl get-default                    #查看每次开机默认进入模式
4) systemctl set-default multi-user.target  #设置永久策略，每次开机自动进入multi-user.target
```

------

## 三、SERVERICES

### 1、Linux虚拟化平台

  （1）virsh命令工具

```shell
① virsh nodeinfo  #查看KVM节点（服务器）信息   
① virsh list [--all]   #列出虚拟机
② virsh dominfo 虚拟机名称   #查看制定虚拟机信息
③ virsh start|reboot|shutdown 虚拟机名称  #运行、重启、关闭虚拟机
④ virsh destroy 虚拟机名称     #强制关闭虚拟机
⑤ virsh autostart [--disable] 虚拟机名称 #指定开机自动运行
```
  （2）xml配置文件（虚拟机描述文件）			

```shell
#默认路径：/etc/libvirt/qemu
	虚拟机名字：<name>nsd01</name>
	虚拟机唯一标识：<uuid>3eaaab1d-0def-4d7d-b767-97f91c64b1e5</uuid>
#虚拟机的磁盘文件：
	<disk type='file' device='disk'>
	<driver name='qemu' type='qcow2'/>
	<source file='/var/lib/libvirt/images/nsd01.qcow2'/>
#虚拟机网卡信息：
	<interface type='network'>
	<mac address='52:54:00:de:b1:07'/>
```

```shell
3）磁盘镜像文件
     默认路径：/var/lib/libvirt/images
```
### 2、虚拟机快速建立

​	(1) 创建新的磁盘镜像文件
​		① 复制方式创建		     

```shell
cp /var/lib/libvirt/images/nsd01.qcow2  /var/lib/libvirt/images/stu01.qcow2
```

​		② 后端盘、前端盘方式创建			 

```shell
cd /var/lib/libvirt/images/
qemu-img create -f qcow2 -b nsd01.qcow2 abc01.qcow2  #根据原始盘nsd01.qcow2创建前端盘abc01.qcow2
qemu-img info abc01.qcow2             #查看前端盘信息
```

​	（3）新建并修改xml配置文件

```shell
① [root@A ~]# cd /etc/libvirt/qemu/
② [root@A qemu]# cp nsd01.xml stu01.xml
③ [root@A qemu]# vim stu01.xml
④ 修改内容（也可用 virsh edit nsd01直接进入进行修改创建）
	a) 虚拟机名字：<name>stu01</name> #修改名字
	1) 虚拟机唯一标识：<uuid>3eaaab1d-0def-4d7d-b767-97f91c64b1e5</uuid> #整行删除
	2) 虚拟机的磁盘文件：
		<disk type='file' device='disk'>
		<driver name='qemu' type='qcow2'/>
		<source file='/var/lib/libvirt/images/stu01.qcow2'/> 
		#修改磁盘镜像文件路径及名称
	3）虚拟机网卡信息：
		<mac address='52:54:00:de:b1:07'/> #整行删除
	4）导入虚拟机信息
		 virsh define /etc/libvirt/qemu/stu01.xml 
```

### 2、web服务器

​		(软件包httpd，nginx,tomcat)
​	(1) 主配置文件： /ect/httpd/conf/httpd.conf
​	(2) 调用配置文件：/etc/httpd/conf.d/.conf
​	(3) 配置文件书写

```shell
Listen 端口号          #可自己设置端口
<VirtualHost ip地址：端口>   #一般用*表示
ServerName   网站名称
DocumentRoot  根目录
</VirtualHost>
```

​	（4）/etc/hosts  可以为本机进行域名解析
​    （5）修改网页存放路径（/etc/httpd/conf.d/.conf）	

```shell
<Director 网页存放目录>
	Require all denied #拒绝所有人访问（granted允许所有，也可直接ip+地址）
</Directory>
```

​		注意：每次修改好配置文件后都需要重启http服务

### 3、nfs共享服务

​	（软件包,rpcbind，nfs-utils）

​	（1）书写共享配置文件（/etc/expports）
​			共享文件目录  允许访问客户端地址（权限）
​			/mynfs              (ro)        #允许所有客户端以只读方式进行访问
​	（2）挂载使用（/etc/fstab）
​			共享目录                 挂载路径      nfs defaults,netdev 0 0
​			192.168.4.7:/mynfs  /mnt/pub   nfs defaults,netdev 0 0

### 4、dns服务

​	软件包：bind-chroot bind  

​	(1) 主配置文件 /etc/named.conf

```shell
option {
	directory  “/var/named”;  # 地址库存放路径
}
zone”tedu.cn”  IN {           # 指定解析的域名
type  master；                 # master表示为主dns服务器
file “tedu.cn.zone” ；         # 指定地址库名称  
}
```

​	（2）地址库文件/var/named/tedu.cn.zone(最好设置的有标识性)

```shell
tedu.cn. NS   a            #声明服务器为a.tedu.cn
a        A  192.168.4.7    #声明a.tedu.cn的地址为192.168.4.7
www      A  192.168.4.11   #web服务地址
```

​	（3）指定dns服务器的位置(包括本机)
​	         echo nameserver 192.168.4.7 > /etc/resolv.conf 
​	（4）测试解析结果：nslookup  域名（软件包：bind-utils）

### 5、主从DNS服务配置

​	1）在主服务器zone里加一行
​	     allow-transfer { 192.168.4.207; }； 允许该机器从服务器传输数据
​	2）在从服务器zone里修改添加
​		file “/var/named/slaves/xx.slave”  地址库配置文件名称及位置
​		masters { 主服务器地址； }； 从哪里取数据
​	3）更新DNS数据后修改版本号serial 可实现DNS数据的同步分心

### 6、DNS服务器的分离解析

（由上而下解析，匹配及停止）

​	1)格式：view  "haha" { #分类的名称

```shell
match-clients { 192.168.4.100; }; #匹配客户端来源地址
zone  "12306.cn"  IN {
file “地址库1”;
 };   
}; 
```

​	2)注意事项：
​		–分类要合理，每一个客户端都要找到自己的分类
​		–所有的zone都必须在view中
​		-每一个view中，zone个数要一致
​		-每一个view中，zone负责的域名要一致

### 7、邮件服务

（1）创建主配置文件，地址库文件		

```shell
sina.com. NS    a
sina.com. MX 10 mail        #声明邮件交换记录，sina.com区域邮件服务器为mail.sina.com，优先级为10
a         A     192.168.4.7
mail      A     192.168.4.7
```

（2）host -t MX sina.com #测试邮件交换记录，sina.com区域邮件服务器是谁
（3）构建邮件服务器：软件包postfix	

```shell
#末行模式开启行号功能 :set nu 
99 myorigin = sina.com       #默认补全域名后缀，例子： 发件人书写lisi 默认补全lisi@sina.com
116 inet_interfaces = all    #监听本机的所有网卡
164 mydestination = sina.com #判断是否为本域邮件依据 ,如果收件人 zhangsan@sina.com
重启服务 systemctl restart postfix
```

（4）邮件收发测试
		发送邮件：mail -s 'hahaxixi' -r yg xln
		非交互式发邮：echo '九阴真经，已练成~' | mail -s 'hehelele' -r yg xln

### 8、PXE装机

​	（1）dhcp服务器搭建（软件包dhcp）
​			1) 配置文件：/etc/dhcp/dhcpd.conf  

```shell
#末行模式下输入：r /usr/share/doc/dhcp/dhcpd.conf.example
subnet 192.168.4.0 netmask 255.255.255.0 {
range 192.168.4.100 192.168.4.200;
option domain-name-servers 192.168.4.7;
option routers 192.168.4.254;
default-lease-time 600;
max-lease-time 7200;
next-server 192.168.4.7;   #指定下一个服务器IP地址
filename "pxelinux.0";     #指定网卡引导文件名称
}
```

​			2）重启服务[root@A~]# systemctl restart dhcpd
​	（2）TFTP服务搭建（软件包tftp-server）
​			1）直接安装tftp-server软件包
​			2）再安装syslinux软件包
​			3）把syslinux产生的pxelinux.0文件复制到/var/lib/tftpboot/下

```shell
rpm -ql syslinux | grep pxelinux.0 #查询软件包的安装清单
cp /usr/share/syslinux/pxelinux.0 /var/lib/tftpboot/
```

​	（3）部署Linux需要的文件（放到/var/lib/tftpboot/下）
​			1）背景图片splash.png,图形模块vesamenu.c32
​			2）启动驱动initrd.img,内核vmlinuz
​	（4）创建并修改菜单文件
​			1）mkdir /var/lib/tftpboot/pxelinux.cfg
​			2）cp /dvd/isolinux/isolinux.cfg /var/lib/tftpboot/pxelinux.cfg/default
​			3） vim /var/lib/tftpboot/pxelinux.cfg/default 				

```shell
#末行模式显示行号 ：set nu
1 default vesamenu.c32                 #默认加载图形模块
2 timeout 600                          #读秒时间 1/10秒
......
10 menu background splash.png          #背景图片
11 menu title NSD2002 PXE Server       #显示的菜单标题
......
61 label linux
62 menu label ^Install CentOS 7        #菜单文件的显示内容
63 menu default        需要单独添加    #读秒结束后默认选择
64 kernel vmlinuz                      #加载vmlinuz内核
65 append initrd=initrd.img  ks=http://192.168.4.7/ks.cfg
```

   （5）部署web服务（软件包httpd） 

```shell
1）mkdir /var/www/htmml/centos
2）mount  /dev/cdrom   /var/www/htmml/centos
3）重启服务后可用firefox 本机地址 进行验证
```
  （6）创建无人值守应答文件ks.cfg,放到和centos同位置的HTML下
		1）安装软件包：system-config-kickstart
		2）最小化则要多装两个包
			ghostscript-chinese-zh_CN    #中文的字体
			xorg*       #图形软件
		3）输入system-config-kickstart  启动kickstart配置程序配置
		4）注意：需要把yum的仓库表示修改为[devloment]否则无法识别yum软件包

### 9、rsync数据同步

 （1）本地同步：
		rsync  [选项...]  源目录  目标目录   
		rsync -av /mydir /todir/ #源目录没有/结尾，同步目录本身
		rsync -av /mydir/ /todir/ #源目录有/结尾，同步目录内容      
 （2）常用选项：
		-n：     测试同步过程，不做实际修改
		--delete：删除目标文件夹内多余的文档
		-a：    归档模式，相当于-rlptgoD
		-v：    显示详细操作信息
		-z：   传输过程中启用压缩/解压
 （3）远程同步：
		rsync  [...]  user@host:远程目录   本地目录   
		rsync  [...]  本地目录  user@host:远程目录    
		1）ssh实现无密码的验证
			ssh-keygen             #一路回车，生成公钥与私钥
			ssh-copy-id root@192.168.4.207       #传递公钥到虚拟机B
		2）安装inotify-tools工具，产生程序inotifywait，实现目录的监控
				inotifywait  [选项]  目标文件夹
				•常用命令选项
					-m，持续监控（捕获一个事件后不退出）
					-r，递归监控、包括子目录及文件
					-q，减少屏幕输出信息
					-e，指定监视的modify、move、create、delete、attrib等事件类别  
	3）书写同步的脚本程序：

```shell
[root@A ~]# vim /etc/rsync.sh
while inotifywait -rqq /mydir           #-r：递归监控 -qq：不要删除信息
do
	rsync -a --delete /mydir/ root@192.168.4.207:/opt/
done
[root@A ~]# chmod a+x /etc/rsync.sh      #为所有人添加执行权限
```

### 10、数据库基础

（软件包mairadb）

​	1）初级命令	

```shell
mysql               #进入mairadb数据库
show databases      #查看有哪些数据库
create database     #创建数据库
drop database       #删除数据库
use                 #切换数据库
show tables         #查看数据表
desc                #查看表结构
flush privileges; #专用于刷新user表记录
```

​	2）为数据库账号修改密码
​		mysqladmin  [-u用户名]  [-p[旧密码]]  password  '新密码		

```shell
例：mysqladmin -u root password '123' #在linux系统命令行为数据库系统管理员root设置密码123
```

​	3）导入/恢复到数据库
​			mysql  [-u用户名]  [-p[密码]]  数据库名  <  备份文件.sql
​	4）查（select）格式：select 表字段 from 数据库名.表名 where 条件；
​	5）删除（delete）：delete from 表名 where  条件;
​	6）数据库的授权，进入数据库系统命令格式： 
​        	grant 权限（select、insert、delete、update、all） on 数据库名.表名 to 用户名@登录方式 identified by '密码'；

------

## 四、网络阶段

------

### 一、交换机：

​	1、网络的基础知识

```
网络的功能：
资源共享、信息传递、提高可靠、增加系统处理能力
交换机工作原理
1，学习，学习数据帧的源mac地址
2，广播，向数据来源之外的接口发送寻找目的主机的广播
3，转发，主机之间1对1的进行数据交互
4，更新，连接交换机的主机超过300秒无通信，或者交换机接口的设备更换、重启
vlan 虚拟局域网
优点：
控制广播
提高安全
提高带宽利用
降低数据传递延迟
```

​	2、osi 7层模型， 理论框架tcp/ip 5层模型 

| OSI        | TCP/IP     |        |        |
| ---------- | ---------- | ------ | ------ |
| 应用层     | 应用层     |        | PC     |
| 表示层     |            |        |        |
| 会话层     |            |        |        |
| 传输层     | 传输层     | 数据段 | 防火墙 |
| 网络层     | 网络层     | 数据包 | 路由器 |
| 数据链路层 | 数据链路层 | 数据帧 | 交换机 |
| 物理层     | 物理层     | 比特流 | 网卡   |

3、交换机的基础命令

（1）system-view 进入系统视图

（2）interface Ethernet0/0/1 接口视图

（3）quit 返回上一视图

（4）return 或者快捷键ctrl+z直接返回用户视图

（5）sysname sw1  修改主机名

（6）display version   查看版本

（7）display current-configuratio  查看大多数配置

（8）reboot 重启设备

（9）save 保存配置

（10）关闭日志等提示信息

```
undo terminal debugging 
undo terminal logging 
undo terminal monitor 
undo terminal trapping 
sys
user-interface console 0
idle-timeout 0 0
```

（11）配置用户认证

```
[sw1]aaa 进入三a视图
[sw1-aaa]local-user test01 password cipher 123     #创建用户test01，配置密文密码 123
[sw1]user-interface console 0 进入用户控制台
[sw1-ui-console0]authentication-mode aaa 开启用户认证
[sw1-ui-console0]quit
[sw1-aaa]
[sw1-aaa]undo local-user test01 删除账户，但不能是登录状态
```

4、vlan的配置：

​	1）中继链路

```
access 接入链路 可以承载1个vlan的数据
trunk 中继链路 可以承载多个vlan的数据
[Huawei]in e0/0/7 进入交换机互联的接口
[Huawei-Ethernet0/0/7]port link-type trunk 配置中继链路
[Huawei-Ethernet0/0/7]port trunk allow-pass vlan all 放行所有vlan
```

  2）VLAN创建

```
[Huawei]vlan 2                建vlan2	
[Huawei]display vlan          查看vlan状态	
[Huawei]vlan batch 6 to 10    批量创建vlan 6~10	
[Huawei]undo vlan 2           删除单一vlan	
[Huawei]undo vlan batch 3 to 10 删除多个vlan
```

3）把接口添加到VLAN

​	a、单个添加：	

```
[Huawei]in e0/0/3 进入3号口
[Huawei]port link-type access 将接口设置为接入链路（即将为某一个vlan服务）
[Huawei]port default vlan 2 将接口加入vlan2（为vlan2服务）
```

​	 b、通过组的方式批量添加

```
[Huawei]port-group 1 创建1号接口组
[Huawei]group-member e0/0/5 e0/0/6 在组中加入5号、6号接口作为成员
[Huawei]port link-type access 将组中所有接口进行配置
[Huawei]port default vlan 3
[Huawei]display this 查看当前视图的配置
[Huawei]group-member e0/0/7 to e0/0/10 在接口组中批量加接口
[Huawei]undo group-member e0/0/7 to e0/0/10 在接口组中批量删接口
```

5、链路聚合

```
链路聚合接口（虚拟接口）
	[Huawei]interface Eth-Trunk 1 创建并进入1号链路聚合接口
	[Huawei-Eth-Trunk1]trunkport e 0/0/7 0/0/8 捆绑7、8接口
注意要恢复接口默认配置！
	[Huawei-Eth-Trunk1]port link-type trunk 
	[Huawei-Eth-Trunk1]port trunk allow-pass vlan all
当遇到恢复配置的报错时：
	[Huawei]clear configuration interface Ethernet0/0/7 清空接口配置
	[Huawei]in e0/0/7
	[Huawei-Ethernet0/0/7]undo shutdown 开启接口
```

6、三层交换机接口配置ip思路（三层交换机同时具备交换和路由得功能）

​	1，创建新vlan

​	2，进入新vlan的虚拟接口配置ip

​	3，将物理接口加入新vlan

### 二、路由器

1、基础命令

```
[Huawei]interface GigabitEthernet 0/0/0 进入0号接口
[Huawei-GigabitEthernet0/0/0]ip address 192.168.1.254 24 配置ip地址
[Huawei-GigabitEthernet0/0/1]undo ip address 删除1接口的ip
<Huawei>display ip routing-table 查看路由表
<Huawei>display ip routing-table | include /24 查看路由表，筛选包含/24的信息
```

2、静态路由

```
ip route-static 192.168.1.0 24 192.168.2.1 添加1.0网段的静态路由，下一跳地址是2.1
```

3、动态路由

```
ospf 
area 0
network 192.168.1.0 0.0.0.255（本机连接网段 反掩码）
```

4、缺省路由（特殊的静态路由）	  

```
ip route-static 0.0.0.0 0 192.168.2.1 所有数据的下一跳地址为2.1
```

5、ACL访问控制列表

```
acl 2000   创建基本acl，列表号2000
rule deny source 192.168.2.1 0 在2000中创建规则，拒绝192.168.2.1通过(deny 拒绝 permit 允许)
in g0/0/1 进入1接口
traffic-filter inbound acl 2000    放置数据进入时规则，使用acl2000
acl 3000  创建高级acl 列表号3000
rule deny tcp source 192.168.2.1 0 destination 192.168.1.1 0  destination-port eq 80     禁止192.168.2.1访问1.1的HTTP服务
traffic-filter inbound acl 3000  在对应端口放置规则3000
注意：同一端口，同一方向，只能有一条ACL列表
dis ip in br  可查看IP配置情况
```

### 三、NAT地址转换

 1、静态转换，一对一，一般用于服务器

```
	nat global 100.0.0.2 inside 192.168.2.1
```

2、easy ip转换，多对一，单项访问

```
acl 2000
rule permit source any  定义一个允许访问外网的范围
int g0/0/0
nat outbound 2000   在外网接口配置NAT转换地址
```

### 四、VRRP虚拟网络冗余协议

​	主要用于网关备份，增加可靠性

```shell
#主（master）备（backup）虚拟（virtual）
int vlan 1  进入接口
vrrp vrid 1 virtual-ip 192.168.1.254   虚拟网关地址
vrrp vrid 1 priority 105   设置优先级（大>小），默认为100
dis vrrp br  可查看VRRP配置情况
```

 tcp关键标志位
 syn 打算与对方建立连接
 ack 确认
 fin 打算与对方断开连接
 三次握手过程： syn---syn,ack---ack
 四次断开过程： fin---ack---fin---ack

# 第二阶段

------

## 五、SHELL编程

### 1、常用命令

​	cat  /etc/shells  查看当前系统有哪些解释器
​	pstree  查看进程树
​	env   查看大部分环境变量
​	set  查看所有变量

### 2、bash解释器的优势

​	可tab补全  历史命令 别名 管道 重定向 快捷键

### 3、shell书写格式

​	#！/bin/bash  声明解释器
​	注释（表明脚本的作用，或者变量的含义）
​	编写可执行命令

### 4、脚本执行的方式(例：test01.sh)

​	1）先用chmod +x 添加执行权限 在用路径指向执行（绝对，相对）
​		--->./test01.sh或/opt/test01.sh
​	2）调用解释器执行脚本 --->bash 路径
​	3）source命令直接使用当前解释器执行--->source  test01.sh或 . test01.sh

### 5、shell变量

​	1）自定义变量：变量名称=变量的值a=10 创建变量

```shell
echo $a 调用变量
echo ${a}RMB $容易混淆的地方用{ }区分（调用时中间无空格）
unset a 取消变量
```

​	2）环境变量：有系统提前定义，可直接使用

```
USER 用户名，UID 用户id号   HOME 用户的家目录 
SHELL 用户使用的解释器     PWD 当前所在路径 
PATH 命令存储路径       HOSTNAME 主机名
PS1 一级提示符         PS2 二级提示符 
```

​	3）预定义变量与位置变量

```shell
echo $1 执行脚本后的第1个位置参数
echo $2 执行脚本后的第2个位置参数
echo $3 执行脚本后的第3个位置参数
echo $0 执行脚本的名称
echo $# 脚本后跟随的参数的个数
echo $ 所有的位置参数
echo $$ 随机的进程号
echo $? 获取上一条任务的结果，0是成功，非0是失败
```

### 6、shell扩展变量

​	1）引号：

```
""  双引号 界定范围
''  单引号 界定范围，可屏蔽特殊符号
`` 或$()  反撇号 调用变量的执行结果
```

​	2）read指令：可以将脚本变为交互式，向用户询问变量内容

```shell
#!/bin/bash
read -p "请输入用户名：" n  
useradd $n       
stty -echo    屏蔽显示
read -p "请输入密码：" p
stty echo    恢复显示
echo "$p" | passwd --stdin $n
```

​	3）export 全局变量

```shell
a=10 创建局部变量
export a 发布全局变量
export b=20 创建并发布全局变量
export -n a 恢复局部效果（在哪敲则在哪显示结果）
```

### 7、shell运算

​		加(+) 减(-) 乘() 除(/) 求模(%)（取余数）
​	1）expr :
​		\ 反斜杠也叫转义符，可以屏蔽之后一个特殊符号
​		格式：expr 1 + 1  加号两边均需要有空格（运算时需要加反斜杠）
​	2）$[ ] 或者 $(( ))
​		格式：echo $[2*2]			

```shell
echo $[a+b]
```

​	3）let 运算结果不显示，通常用于创建变量或者变量计算	

```shell
let c=a+b 通过计算创建变量c
echo $c 查看
let c=c-3 ---> let c-=3
let c=c-1  --->let c--
let c=c+1  ---> let c++
let c=c+3  --->let c+=3
```

​	4）bc 小数运算 用scale定义小数位数	

```shell
例：echo "scale=6;20/6" | bc
```

### 8、条件测试

​	1）字符串
​		==（等于） !=（不等于） -z（为空）

```shell
例：
test abc == abc #判断abc是否等于abc
test abc != abc #判断abc是否不等于abc
test $a == $b   #可以使用变量进行测试
[ -z $c ]       #判断变量是否为空
```

​	2）数字
​		-eq 等于   --->[ 100 -eq 100 ]  判断100是否等于100
​		-ne 不等于  --->[ 100 -ne 101 ]  判断100是否不等于101
​		-gt 大于   --->[ 100 -gt 101 ] 判断100是否大于101
​		-ge 大于等于 ---> [ 100 -ge 101 ] 判断100是否大于等于101
​		-lt 小于    --->[ 100 -lt 101 ] 判断100是否小于101
​		-le 小于等于 --->[ 100 -le 101 ] 判断100是否小于等于101 
​	3）文件
​		-e 测试文件是否存在，不关心文件类型
​		-f 测试文件是否存在，必须是普通文件
​		-d 测试文件是否存在，必须是目录
​		-r 判断当前用户对文件是否有读权限
​		-w 判断当前用户对文件是否有写权限
​		-x 判断当前用户对文件是否有执行权限		

```shell
例：[ -f /opt/abc ] 尽量用绝对路径减少出错
```

​	4）逻辑
​		&& 之前任务成功才执行之后任务--->多个时：两边任务都成功才算成功
​		|| 之前任务失败才执行之后任务--->多个时：两边有一个任务成功就算成功
​		;分号：不管前面如何，执行完了就执行下一个		

```shell
例：     
#!/bin/bash
[ $UID -ne 0 ] && echo "你不是管理员，程序退出" && exit
yum -y install vsftpd &> /dev/null
systemctl restart vsftpd
systemctl enable vsftpd
echo ok
```

### 9、if选择结构

​	1）单分支
​	2）双分支
​	3）多分支		

```shell
	例：	#!/bin/bash
		 read -p "请输入本次考试成绩：" n
		 if [ $n -ge 90 ];then
		       echo "优秀！"
		 elif [ $n -ge 80 ];then
		        echo "良好！"
		 elif [ $n -ge 60 ];then
		        echo "及格！"
		 else
		        echo "该跪搓衣板了！"
		 fi
```

### 10、循环

​	1）for循环：可定义循环次数		

```shell
例：	#!/bin/bash
	 a=0
	 b=0
	 for i in {1..10}可以用（a=10  `seq $a`）
	 do
	 ping -c 3 -i 0.2 -W 1 192.168.2.$i &> /dev/null
	 if [ $? -eq 0 ];then
	 		echo "192.168.2.$i ping通！"
	 		let a++
	      else
	 		echo "192.168.2.$i ping不通！"
	 		let b++
	 fi
	 done
		echo "$a ping通，$b ping不通"
```

​	2）while循环：支持无限循环		

```shell
	例： #!/bin/bash
		x=$[RANDOM%101]   [RANDOM]随机产生一个数字
		y=0
		while :     ：冒号表示用永远正确
		do
			let y++
			read -p "qing gei shuzi (0-100):" n
			if [ $x -eq $n ];then
					echo "猜对了！"
					echo "猜了$y次"
					exit
				elif [ $x -lt $n ];then
					echo "猜大了！"
				else
					echo "猜小了！"
			fi
		done
```

### 11、case分支

​	功能类似if ，不如if强大，语句比if精简

```shell
	#!/bin/bash
	case $1 in
	start)
	    /usr/local/nginx/sbin/nginx;;
	stop)
	    /usr/local/nginx/sbin/nginx -s stop;;
	restart)
	    /usr/local/nginx/sbin/nginx -s stop
	    /usr/local/nignx/sbin/nginx;;
	status)
	    netstat -ntulp |grep -q nginx
	    if [ $? -eq 0 ];then
			echo 服务已启动
	else
			echo 服务未启动
	fi;;
	*)
	    echo Error;;
	esac
```

​	netstat -ntulp | grep :80 查询网络服务状态，比如80端口
​	grep -q 和扔黑洞等同

### 12、函数

​	 将公共的语句块定义为一个函数名称，实现便捷反复调用
​	1）function 函数名{命令序列}
​	2）函数名（）{命令序列}

```shell
echo -e "\033[31mABCD\033[0m"  为ABCD赋予颜色输出
31--->字体颜色为红32--->绿色
41--->底色为红91--->高亮红
例如：
echo -e "\033[44;37;5m ME\033[0m COOL"
解释：
"\033[44;37;5m ME "设置背景为蓝色，前景为白色，闪烁光标，输出字符“ME”；
"\033[0m COOL"重新设置屏幕到缺省设置，输出字符 “COOL”。
"e"是命令echo的一个可选项，它用于激活特殊字符的解析器。
"\033"引导非常规字符序列(即"\033["表示终端转义字符开始，"\033"即退出键<ESC>的ASCII码)。
"m"意味着设置属性然后结束非常规字符序列，
这个例子里真正有效的字符是"44;37;5"和"0"。修改"44;37;5"可以生成不同颜色的组合，数值和编码的前后顺序没有关系。
————————————————
版权声明：本文为CSDN博主「QC」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qualcent/article/details/7106483
```

### 13、wait,exit,break,continue区别

​	wait:执行完所有程序，才结束脚本
​	exit：终止循环，退出脚本
​	break:终止循环，执行循环之后的命令
​	continue：终止本次循环，继续下一次循环		

```shell
	例：#!/bin/bash
		myping() {
		ping -c 3 -i 0.2 -W 1 $1 &> /dev/null
		if [ $? -eq 0 ];then
					echo "$1通了"
			else
					echo "$1不通"
		fi
		}
		for i in {1..254}
		do
			myping 192.168.2.$i &
		done
		wait
```

### 14、字符串的处理

​	1）字符串截取
​		${变量名:起始位置:长度} 第一位字符序号是0，而不是1
​		echo ${a:1:2} 截取变量a的第2个字符，一共截取2位
​	2）字符串替换
​		${变量名/old/new}
​		echo ${a/2/8} 替换第一个数字2为8
​		echo ${a//2/8} 替换所有数字2为8
​	3）字符串删除
​		${变量名#关键词} 从左往右删除  
​		${变量名%关键词} 从右往左删除

### 15、初始值定义：

​	echo {a:-123}--->a值为空的时候调用默认值123使用		

```
	例： #!/bin/bash
		read -p "请输入用户名：" u
		useradd $u
		read -p "请输入密码（默认名字首字母加123）：" p
		echo ${a:0:1}${p:-123} |passwd --stdin $u
```

​	总结：
​		$( )  求指令的执行结果      $[ ] $(( )) 运算
​		${ } ${a}bc对变量的界定       ${变量名:} 截取
​		${变量名/} 替换          ${变量名#} 掐头
​		${变量名%} 去尾          ${变量名:-} 定义初值

### 16、正则表达式

| 基本正则列表 |                                      |
| ------------ | ------------------------------------ |
| 正则符号     | 插述                                 |
| ^            | 匹配行首                             |
| $            | 匹配行尾                             |
| []           | 匹配集合中的任意个字符               |
| [^]          | 对集合取反                           |
| .            | 匹配任意单个字符                     |
| *            | 匹配前一个字符任意次数不允许单独使用 |
| {n,m}        | 匹配前一个字符n到m次                 |
| {n}          | 匹配前一个字符n次                    |
| {n,}         | 匹配前一个字符n次及以上              |
| ()           | 保留                                 |

| 扩展正则列表 |                  |
| ------------ | ---------------- |
| 正则符号     | 描述             |
| +            | 最少匹配一次     |
| ?            | 最多匹記一次     |
| {n,m}        | 匹配n到m次       |
| ()           | 组合为整体，保留 |
| \|           | 或者             |
| \b           | 单词边界         |

​		1）.*--->匹配所有  
​		2）grep -E = egrep --->支持扩展正则
​		3）egrep -c = wc -l --->统计行数 

### 17、sed 流式编辑器

​	非交互式对文本进行增删改查，工作方式：逐行处理
​	格式1:前置指令 | sed 选项 (定址符)指令
​	格式2：sed 选项  (定址符)指令 被处理的文件
​		选项：-n屏蔽默认输出  -r支持扩展正则   -i写入文件
​		指令：p输出  d删除  s替换  =行号
​		注意：1、指令前的正则符号要放在//中间
​	2、用替换指令是可以用其它特殊符号代替/来防止冲突
​	3、d指令和p指令定址符基本一致，都是正对整行操作

```shell
	案例：输出p--->sed -n '2,+1p' user 输出第2行，以及后面的1行
		 删除d--->sed '/root/d' user   删除有root的行
		 替换s--->sed '1~2s/2017/xxxx/' test <=> sed '1s/2017/xxxx/;3s/2017/xxxx/' test 替换第1行和第3行的第1个2017为xxxx
			 --->sed 's/.//2;s/.$//' sc.sh 删除每行的第一个和最后一个字符
		 i指定行上添加
		 a指定行下添加
		 c替换指定行  多行时用-e 不用;号
```

### 18、awk工具

​	精确搜索，逐行处理

​	1）前置指令 | awk 选项 （条件）指令
​	2）awk 选项 （条件）指令 被处理的文档
​		选项 -F 修改分隔符
​		指令 print 输出
​	3）awk内置变量：
​		$1第1列 $2 $3 ..... $0($0输出所有列) 
​		NR 行号 NF 列号
​	4）格式化输出
​		awk工作流程
​		BEGIN{ } 初始任务，只执行一次
​		{ } 逐行任务，执行次数和行有关
​		END{ } 逐行任务之后执行，只执行一次 
​		制表符 \t 具备一定的排版效果
​	5）awk条件
​		a)使用正则设置条件			

```
	例：awk -F: '$1!~/bin/' user 找第1列不包含bin的行，并输出
```

​		b)使用数值/字符串比较设置条件
​			比较符号：==(等于) !=（不等于） >（大于）
​			>=（大于等于） <（小于） <=（小于等于）			

```shell
	例： awk -F: '$1=="bin"{print}' user 输出第1列等于bin的
	    awk -F: 'NR==5' user 输出第5行
	    awk -F: '$3<=10' /etc/passwd 输出第3列小于等于10的行
```

​		c)逻辑测试条件
​			&& 并且 符号前后条件都满足
​			|| 或者 符号前后任意满足一个即可 			

```shell
	例： awk 'NR>=2&&NR<=4' user 输出2~4行
		awk -F: '$3>10||$3<20{print}' /etc/passwd 输出所有行
```

​		d)数学运算
​			    +  -  *  /  % 		++ -- += -= *= /=

```shell
	例： seq 200 | awk '$1%3==0' 找200以内3的倍数
		awk 'BEGIN{x++;print x}' 把x+1，然后输出x的值，没有定义变量的值时，默认为0
```

6）if分支结构（单分支、双分支、多分支）
	a）awk -F: '{if( ){ }}' 单分支，基本框架		

```shell
	例：awk -F: '{if($1=="root"){print $3}}' /etc/passwd
```

​	b）awk -F: '{if( ){ }else{ }}' 双分支，基本框架		

```shell
	例:awk -F: '{if($3>=1000){x++}else{y++}}END{print x,y}' /etc/passwd 
	#如果$3大于等于1000则x+1，否则y+1，逐行任务结束后将x与y的值输出
```

​	c）awk -F: '{if( ){ }else if( ){ }else{ }}' 多分支，基本框架		

```shell
	例：awk -F: '{if(/bash$/){x++}else if(/nologin$/){y++}else{z++}}END{print x,y,z}' /etc/passwd 
	#搜索每行，如果结尾是bash，则x+1，如果结尾是nologin，则y+1, 否则z+1,最后输出结果
```

7）awk数组，数组相当于可以存储多个值的特殊变量
	格式：数组名[下标]=值		

```shell
	例：awk 'BEGIN{a[1]=10;a[2]=20;print a[1]}' 定义数组，名字是a，下标分别是1对应值10，2对应值20，然后输出下标是1的值
```

8）遍历数组
	格式：awk 'BEGIN{数组名[下标]=值;for(变量名 in 数组名){print 变量名 }}' 

```shell
	例：awk 'BEGIN{b[10]=100;b[20]=200;b[30]=300;for(i in b){print b[i],i}}' 
	#定义数组b，下标10的值是100，下标20的值是200，下标30的值是300，然后用for循环显示所有值与对应的下标
	sort -nr shu -k 2 选项n是以数字形式，r是降序，k是定义哪列为排序内容，shu是被排序文本
	ab -c 1 -n 1000 http://192.168.2.120/ 使用压力测试工具，增加访问量
	awk '{ip[$1]++}END{for(i in ip){print ip[i],i}}' /var/log/httpd/access_log | sort -nr
	在shell中显示中文
		[root@B nginx-1.12.2]# LANG=zh_CN.UTF-8
		[root@B nginx-1.12.2]# echo $LANG
		zh_CN.UTF-8
```

------

## 六、Nginx网站工具：支持高并发

### 1、安装软件包：源码编译安装

​	lnmp_soft.tar.gz  Nginx软件源
​	gcc 是编译工具
​	pcre-devel 是让nginx支持正则 
​	openssl-devle是让nginx支持安全的网络访问(加密，https)

### 2、安装Nginx模块

```
	./configure --help  
	--user=nginx \              #指定用户
	--group=nginx \              #指定组
	--with-http_ssl_module #指定安全模块（ssl加密）
	--prefix=/usr/local/nginx # 安装路径
```



### 3、一些常用命令

```
	/etc/rc.local    设置开机自启（先赋予/usr/local/nginx/sbin/nginx X权限）
	conf 配置文件  html 默认网页根路径  logs 日志  sbin 主程序
	/usr/local/nginx/sbin/nginx -V 查看安装信息，比如版本，安装时添加的参数等
	/usr/local/nginx/sbin/nginx 开启服务
	/usr/local/nginx/sbin/nginx -s reload 执行主程序，从新读取配置文件
```

### 4、添加用户认证功能：

```
	auth_basic "input password"; 提示信息，双引号中随意输入
	auth_basic_user_file "/usr/local/nginx/pass"; 认证的用户信息存放文件，配置语句不要忘记分号结尾
	yum -y install httpd-tools 安装生成网站账户名与密码的工具包
	htpasswd -c /usr/local/nginx/pass tom 利用htpasswd工具创建认证文件，以及账户名，连续两次密码
	htpasswd /usr/local/nginx/pass alice 追加账户，不要-c选项
```

### 5、配置虚拟主机：

​	1）修改默认配置的域名，将默认的localhost修改为		

```
	server_name www.a.com; 大概在37行
```

​	2）再添加新虚拟主机，在第34行添加以下内容		

```
	server {
		listen 80;
		server_name [www.b.com](http://www.a.com) ;
		location / {
		root "/usr/local/nginx/www" ;
		index index.html index.htm ;
	}
	}
```

​	3）域名解析		

```
	vim /etc/hosts 
		C:\Windows\System32\drivers\etc\hosts 打开hosts文件追加下面一行
```

### 6、MD5、sha256

主要应用在数据完整性校验。

```
	[root@B nginx]# md5sum a.txt 
	[root@B nginx]# sha256sum a.txt 
```

### 7、部署加密环境网站

（公钥加密，私钥解密）

​	1）vim nginx.conf.default nginx.conf 修改配置文件

```
	修改：# HTTPS server下端口443的内容
	将98~115行的#去掉
	:98,115s/#// ------->直接多行替换#为空
```

​	2）生成公钥及私钥

```
	openssl genrsa > cert.key 生成私钥
	openssl req -new -x509 -key cert.key > cert.pem 根据私钥生成证书
```

### 8、部署LNMP环境

​	1）安装包软件包：
​		Nginx（lnmp_soft.tar.gz）  MySQL（mariadb） mariadb-server
​		mariadb-devel     php   php-fpm    php-mysql
​	2）开启服务：

```
		/usr/local/nginx/sbin/nginx
		systemctl restart mariadb---->端口：3306
		systemctl restart php-fpm---->端口：9000
```

​	3）修改nginx配置文件，开启脚本解析功能（php-fpm）
​			fastcgi 公共网关接口，可以让网站服务与脚本解释器沟通的一个标准			

```shell
	location ~ \.php$ {     ~：表示开启正则匹配
			root html; 网页文件的根目录
			fastcgi_pass 127.0.0.1:9000; 由nginx转交给php-fpm
			fastcgi_index index.php;
			#fastcgi_param SCRIPT_FILENAME /scripts$fastcgi_script_name; 无效配置，需要注释或删除
			include fastcgi.conf;  修改配置文件名为.conf
	}
```

​	4）配置 php-fpm服务（配置文件：/etc/php-fpm.d/www.conf）

```php
		listen = 127.0.0.1:9000 PHP端口号
		pm.max_children = 50 最大进程数量
		pm.start_servers = 5 开启服务时的子进程数量，无论当前是否需要
		pstree -a 使用进程树查看php-fpm开启情况
```

### 9、地址重写

（配置文件:/usr/local/nginx/conf/nginx.conf）

​	1）作用：可以实现访问a.html页面而看到b.html页面的内容
​		或者访问网站www.360buy.com 而看到www.jd.com网站的内容
​	2）语法结构
​		a）书写格式：

```
		rewrite  regex       replacement  flag
		rewrite 旧地址（支持正则） 新地址 [选项]
```

​		b）rewrite选项

```
		last   终止跳转（当前location的跳转）
		break   终止跳转（到此为止）
		redirect 临时重定向 日志状态码是 302
		permanent 永久重定向 日志状态码是 301
```

​		补充：charset utf-8 可以启动网页支持中文		

```
	例：rewrite a.html /b.html redirect; 
	#网页路径也切换到新地址， redirect不加则显示访问地址
```

​	3）不同网址（域名），相同页面的跳转
​		rewrite /(.) http://www.tmooc.cn/$1 ; 访问本机域名下任何页面，都会跳转到www.tmooc.cn下相同页面，（）是正则表达式保留的效果，$1是粘贴效果
​	4）不同浏览器的跳转（不同浏览器对应不同的网页格式排版）

```
		if ($http_user_agent ~ firefox) {      ~ 支持正则 * 不区分大小写
			rewrite ^(.*)$ /firefox/$1;
			rewrite index.html /firefox/index.html;
		}  #只要是Firefox浏览器的访问都跳转到Firefox的专用网页
```

### 10、组建反向代理环境

​	（服务器集成）

​	1）修改nginx的主配置文件，在34行添加集群		

```
	upstream webserver { 定义服务器集群，webserver是名字，可以自定义
		server 192.168.2.100:80 weight=1 max_fails=2 fail_timeout=20;
		server 192.168.2.200:80;
	}       #访问时在多个服务器之间轮询
	location / {
		proxy_pass http://webserver; 在已有的 location中添加代理的集群地址
		root html;
		index index.html index.htm;
	}
```

​	2）weight是权重，默认值为1，性能较强的服务器可以适当增加该值，max_fails=2与fail_timeout=20是2次无法连接到对应的主机，则等20秒再连接

### 11、配置nginx实现四层代理

​	1）修改配置文件（需要添加模块--with-stream --with-http_stub_status_module）		

```
	stream { 配置四层代理功能
		upstream backend {       #创建集群，名称为backend
			server 192.168.2.100:22;     #添加主机以及对应的端口
			server 192.168.2.200:22;
		}
		server {        #调用集群
			listen 12345;     #端口号，为了不与本机冲突，不要使用22号端口
			proxy_pass backend;  #当有人访问代理服务器的12345端口时，去集群中轮询调用主机
	}
	}  #需要单独添加，不能卸载HTTP中
```

### 12、开启服务器状态信息功能

​	(--with-http_stub_status_module）

```
	location /status {
	stub_status on;
	}   #需要单独在空白处添加
	保存重置服务之后，使用浏览器查看192.168.2.5/status
```

### 13、Nginx优化

​	1）修改进程数和进程的连接数量

```
		worker_processes 2; 开启的nginx进程数量，一般可以参考cpu核心数量
		worker_connections 65535; 每个进程的连接数量
```

​	2）修改访问限制<系统并发数>
​		a）临时设置​			

```shell
ulimit -Hn 100000 设置硬限制数值
ulimit -Sn 100000 设置软限制数值
```

​		b）永久设置（配置文件： /etc/security/limits.conf）

```shell
* soft nofile 1024000
* hard nofile 1024000
```

​     3）优化地址栏过长导致414错误的配置（头部信息缓存）

```
	http {
	client_header_buffer_size 100k; 用户请求数据头部（包含网址）大小
	large_client_header_buffers 4 100k; 如果之前的大小不够用，则再开启4个1000k的空间
```

​	4）定义缓存时间

```
	location ~* \.(jpg|jpeg|gif|png|css|js|ico|xml)$ {
	expires    30d;  #缓存30天  
	}
附：session信息和cookies信息记录
	Session：存储在服务器端，保存用户名、登陆状态等信息。
	Cookies：由服务器下发给客户端，保存在客户端的一个文件里。
	proxy上：/var/lib/php/session 服务器端存储session信息的目录
```

### 14、构建memcache服务

​	1）安装软件包：memacahed  telnet
​	2）配置文件：/etc/sysconfig/memcached 		

```
	port 默认端口号 11211
	user 默认用户 memcached
	maxconn 连接用户数量
	cachesize 缓存大小 默认64M
```

​	3）telnet 192.168.2.5 11211 --->登录搭建memacahe服务的11211端口进行配置 

```
	add name 0 180 10 --->添加 名称 不压缩 缓存时间 字符个数 -->有则失败
	set name 0 180 10 --->set 是设置（定义或创建的意思）--->有则覆盖
	replace name 0 180 10 --->替换，必须存在被替换的变量，否则失败
	get name  读取变量
	delete name  删除变量
	flush_all   清空所有
```

​	4）安装软件包：php-pecl-memcache 

```php
	修改配置文件：/etc/php-fpm.d/www.conf
	listen = 127.0.0.1:9000 #12决定开启php-fpm服务之后监听本机的ip与端口
	;listen.allowed_clients = 127.0.0.1 #24可以限制客户端的访问，行前的分号代表注释掉且对客户无限制
	php_value[session.save_handler] = memcache
	php_value[session.save_path] = tcp://192.168.2.5:11211
	systemctl restart php-fpm 重启服务
```

​	5）proxy（代理）服务器中查看memcache缓存信息（session）

```
	telnet 192.168.2.5 11211
	stats items 查看缓存记录信息
	stats cachedump 4 0 查看session记录，4是序号，0是看所有
```

### 15、Tomcat+Java服务搭建

​	（软件包：java-1.8.0-openjdk）
​	1）解压tar包：apache-tomcat-8.0.30.tar.gz（lnmp_soft.tar.gz中）
​	2）mv apache-tomcat-8.0.30 /usr/local/tomcat  #解压包考到/usr/local/tomcat中
​	3）修改配置文件：/usr/local/tomcat/conf/server.xml		

```xml
	<Host name="www.a.com" appBase="a" unpackWARs="true" autoDeploy="true">
		<Context path="test" docBase="/aa" />  
			#aa表示访问a下的aa目录，/aa表示访问根下的aa目录
			#当访问www.a.com:8080/test时，显示的页面是/aa下的，
			#当访问www.a.com:8080时,显示的页面是a/ROOT下的
			#添加日志功能，则加入下面内容：
		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
			prefix="www_a_com" suffix=".log"    定义日志名称与后缀名
			pattern="%h %l %u %t "%r" %s %b" />
	</Host>
```

​	4）启动服务

```
	  /usr/local/tomcat/bin/startuo.sh  ----->开启服务
	  /usr/local/tomcat/bin/shutdown.sh  ----->关闭服务
	  ss -ntulp | grep java  检查端口8080  8005 8009 是否正常
```

​	5）服务启动失败排错（如果8005端口未开启）
​		a）方案一

```
	  ./shutdown.sh    关闭服务
	  mv /dev/random /dev/random.bak   为随机数文件改名
	  ln -s /dev/urandom /dev/random  用高效文件替换
```

​		b）方案二

```
		yum install rng-tools
		systemctl start rngd
```

​	6）Tomcat加密网站配置
​		a）取消8443端口注释，开启加密服务，并在<Connector内部添加以下内容				

```java
		keystoreFile="/usr/local/tomcat/keystore" keystorePass="123456"
```

 		b）另外使用keytool命令创建秘钥对，过程可以使用--help看帮助			

```
		keytool -genkeypair -alias tomcat -keyalg RSA -keystore /usr/local/tomcat/keystore
```

​	7）varnish加速（cdn加速）
​		a）软件包：gcc readline-devel  pcre-devel  python-docutils 
​		b）源码编译安装：varnish-5.2.1.tar.gz
​		c）创建并修改配置文件
​			cp etc/example.vcl  /usr/local/etc/default.vcl  拷贝配置文件
​			backend default {
​			.host = "192.168.2.100";  缓存网站路径
​			.port = "80";      访问端口
​		d）varnishd -f /usr/local/etc/default.vcl 开启服务
​			varnishadm  进入varnishi控制台
​			varnish> ban req.url ~ .* 清除缓存数据 ~后面使用的是正则，表示清空所有缓存

### 16、git工具（软件包：git）

​	1）部署git服务

```
		mkdir /var/git 创建目录
		git init /var/git/project --bare 创建git仓库
```

​	2）git常用命令

```shell
		git clone root@192.168.2.100：/var/git/project   克隆到本地
		git add .    添加到缓存
		git rm  删除数据
		git commit -m “修改日志记录”  提交到本地仓库
		git push 提交到服务器  
		git pull 从服务器同步数据
		git status 查看当前状态
		git reflog  查看本地日志
		git log oneline  查看服务器日志
		git reset --hard e0878  恢复到日志记录的状态（e0878代表HEAD指针节点）
		git branch hotfix  创建hotfix分支
		git checkout hotfix 切换到hotfix分支
		git merge hotfix  合并hotfix到当前分支
		注意：所有命令需要在仓库目录（/project：即工作区）下操作
```

​	3）特殊情况处理
​		a）初次提交到本地仓库报错时	

```
		git config --global user.email ["you@example.com"](http://mailto:\)  确定邮箱
		git config --global user.name "Your Name"      确定有户名
```

​		b）初次提交数据到服务器报错时			

```
		git config --global push.default simple 复制提示信息，修改为新的使用习惯
```

​		c）提交到服务器，发现客服端不是最新版本报错时		

```
		git push提交服务器时报错，再使用git pull 命令
		#git要求添加新的事件日志记录（添加日志时自动进入vim编辑状态，保存退出即可），然后再次提交git push即可
```

​		d）如果多个客户端同事在修改同一个文件时

```
			git push 报错，提示要git pull，输入git pull之后 结果还是失败
			vim 修改的文件 发现文件被系统修改（可以看到所有的修改情况），确定最终商量结果，然后保存退出
			git add .
			git commit -m "ok"
			git push 推送了最新商量结果给服务器 
```

​	4）使用git方式
​		a）ssh方式		

```
		ssh-keygen 制作秘钥
		ssh-copy-id root@192.168.2.100 传递公钥，之后连接就无需密码验证
```

​		b）git协议方式（只读，软件包：git-daemon）

```
		git  init  --bare  /var/git/project 制作仓库，如果已有仓库，可以不制作
		修改配置文件（/usr/lib/systemd/system/git@.service）
		ExecStart=-/usr/libexec/git-core/git-daemon --base-path=/var/git --export .... ----------->修改git路径
		systemctl  start  git.socket开启服务
```

​		c）http协议方式（只读，软件包httpd gitweb）

```
	修改配置文件：/etc/gitweb.conf ---->11行
		our $projectroot = "/var/git";  删除#号，并修改路径
		ss -ntulp | grep :80 检查80端口是否被占用，有则关闭相关服务
		git init --bare /var/git/base_http
		systemctl  start  httpd 开启httpd服务
```

### 17、制作RPM包（以Nginx为例）

​	a）软件包（gcc pcre-devel openssl-devel rpm-build） 

```
		rpmbuild -ba nginx.spec 输入命令，会报错，但必须输入
		cp lnmp_soft/nginx-1.12.2.tar.gz rpmbuild/SOURCES/ 将nginx的源码包放入sources目录
```

​	b）编辑配置文件（vim rpmbuild/SPECS/nginx.spec ）		

```
		Name:nginx   名称，不能随意写
		Version:1.12.2  版本，不能随意写
		Release:1   自定义版本号
		Summary:test test test 简单描述
		#Group: 
		License:GPL 授权协议
		URL:www.a.com  网址
		Source0:nginx-1.12.2.tar.gz  源码包名，不能随意写
		#BuildRequires: 
		#Requires: 
		%description   详细描述
		test test test test   随意写的描述
		%post
		useradd nginx -s /sbin/nologin      #非必需操作：安装后脚本(创建账户)
		%prep
		%setup -q
		%build
		./configure --with-http_ssl_module  稍作修改
		make %{?_smp_mflags}
		%install
		make install DESTDIR=%{buildroot}
		%files
		%doc
		/usr/local/nginx/* 安装好之后的文件路径
		%changelog
```

​	c）生成RPM包

```
		rpmbuild -ba /root/rpmbuild/SPECS/nginx.spec 
		ls rpmbuild/RPMS/x86_64/ 检查目录，可以看到nginx的rpm包
		yum -y install nginx-1.12.2-1.x86_64.rpm 用yum安装测试
```

### 18、VPN搭建

​	1）基于linux内核的gre实现vpn
​		a）服务端

```shell
lsmod | grep ip_gre 查看
modprobe ip_gre 开启gre功能
ip tunnel add tun0 mode gre remote 192.168.2.200 local 192.168.2.100 
	#创建隧道，名称为tun0，使用技术时gre，从本机地址（local）2.100连接到目的设备地址（remote）2.200
ip tunnel del tun0 如果配置错误，需要删除隧道
ip link show 查看
ip link set tun0 up 启用名称为tun0的隧道
ip addr add 10.10.10.10/24 peer 10.10.10.5/24 dev tun0 
	#为隧道配置ip地址，peer后面加的是远程主机使用的ip，可以自定义，如果add改成del是删除
ip addr show 查看结果
```

​			b）客服端

```shell
modprobe ip_gre
ip tunnel add tun0 mode gre remote 192.168.2.100 local 192.168.2.200
ip link set tun0 up
ip addr add 10.10.10.5/24 peer 10.10.10.10/24 dev tun0 
ip addr show
```

​	2）创建pptp的vpn
​		a）yum install pptpd-1.4.0-2.el7.x86_64.rpm 安装pptp工具软件
​		b）vim /etc/pptpd.conf 在第103行下面追加2行内容

```
localip 192.168.2.200 本机ip
remoteip 5.5.5.5-10 将来给远程主机分配的ip
```

​		c）vim /etc/ppp/options.pptpd 第68行写入下面内容			

```
ms-dns 8.8.8.8
```

​		d）vim /etc/ppp/chap-secrets 定义客户端用户名和密码

```
tom * 123456 * 用户名tom，可以访问我任意名称的服务器，密码是123456，客户机的ip是任意均可
systemctl start pptpd 开启pptp服务
```

​	3）创建L2TP+IPSec VPN
​		a）yum -y install libreswan 安装加密工具

```
cd /root/lnmp_soft/vpn 
cp myipsec.conf /etc/ipsec.d/ 拷贝配置文件到相关目录
```

​		b）vim /etc/ipsec.d/myipsec.conf 			

```
left=192.168.2.200 在第16行修改为本机ip
```

​		c）vim /etc/ipsec.secrets 修改配置，添加预共享秘钥

```
		192.168.2.200 %any: PSK "randpass"  在第2行添加本机ip，%any是任何客户可以访问，预共享密钥是randpass
		systemctl start ipsec 开启服务
```

​		d）yum -y install xl2tpd-1.3.8-2.el7.x86_64.rpm

```
		vim /etc/xl2tpd/xl2tpd.conf 进入第32行修改为以下状态
		ip range = 6.6.6.6-6.6.6.16 给客户分配的ip
		local ip = 192.168.2.200 本机的ip（VPN服务地址）
```

​		e）vim /etc/ppp/options.xl2tpd

```
		#crtscts 第10行加注释
		#lock 第16行加注释
		require-mschap-v2 第21行删除注释，开头不能有空格！！！
```

​		f）vim /etc/ppp/chap-secrets 配置用户和密码

```
		tom1 * 123456 * 添加用户名和密码
		systemctl start xl2tpd 启动服务
```

​	4）翻墙设置（非必需操作）

```shell
		echo "1" > /proc/sys/net/ipv4/ip_forward  //开启路由转发
		iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -j SNAT --to-source 201.1.2.5
```

​		 

### 19、编写systemd Unit文件

​	1）systemctl cat httpd.service 查看httpd的service文件，以及路径			

```shell
	cp /usr/lib/systemd/system/{httpd.service,nginx.service}
```

​	2）vim /usr/lib/systemd/system/nginx.service 

```
	[Unit]
	Description=nginx 名称描述
	After=network.target remote-fs.target nss-lookup.target 在哪些服务之后启动
	[Service]
	Type=forking  多进程类型服务是forking
	ExecStart=/usr/local/nginx/sbin/nginx 执行systemctl start nginx之后开启服务
	ExecReload=/usr/local/nginx/sbin/nginx -s reload 执行systemctl reload nginx之后重读配置文件
	ExecStop=/bin/kill -s QUIT ${MAINPID} 执行systemctl stop nginx之后会杀主进程
	[Install]
	WantedBy=multi-user.target 执行了systemctl enable nginx之后，会在多用户模式开机时运行nginx服务
```

	ls /etc/systemd/system/multi-user.target.wants/ 存放了多用户模式开启的服务

------

## 七、AUTOMATION**

### 1、环境布置

​	1）安装ansible

```shell
tar -xf ansible_soft.tar.gz
cd ansible_soft
dnf -y install *
```

​	2）生成ssh密钥，实现无密码连接所有被管理主机

```shell
ssh-keygen -f /root/.ssh/id_rsa -N ''  #非交互式创建秘钥名字可自定义（id_rsa）
for i in node1 node2 node3 node4 node5
do
	ssh-copy-id $i
done
```

​	3）创建配置文件（模板：/etc/ansible/ansible.cfg）

```shell
vim ~/ansible/ansible.cfg --->一般就放家目录下
[defaults]
inventory = ~/ansible/hosts  #被控制端主机清单
#forks = 5   #ssh并发数量
#ask_pass = True  #使用密钥还是密码远程
#host_key_checking = False  #是否校验密钥

#生产环境
[defaults]
forks = 200
gathering = implicit
gather_subset = !hardware
gather_timeout = 10
timeout = 60
host_key_checking = False
deprecation_warnings=False
command_warnings = False
time_out=6000
[inventory]
[privilege_escalation]
[paramiko_connection]
[ssh_connection]
ssh_args = -C -o ControlMaster=auto -o ControlPersist=1800s
pipelining = True
[persistent_connection]
[accelerate]
[selinux]
[colors]
[diff]
```

​	4）创建被管理主机清单（模板：/etc/ansible/hosts）

```shell
vim ~/ansible/hosts
[test]    #定义主机组（组名称任意）
node[3:4] #在这个组里有两台主机node3和node4
[cluster:children] #嵌套组（children为关键字）
webserver
database  #表示cluster组中包含webserver组和database组
#生产
[all:vars]
ansible_ssh_port=22
ansible_ssh_user=fil
ansible_ssh_pass=storage
ansible_ssh_private_key_file=ops_safe_key/files/binghe_ansible_ssh
ansible_sudo_pass=storage
```

### 2、Ansible ad-hoc

​	是一种通过命令行批量管理的方式
​	格式： ansible 主机集合 -m 模块名 -a "参数" （all：表示所有主机）
​		参数：
​			-k 使用密码远程
​			-i 指定主机列表文件
​			-m 后面加模块[module]
​			-a 后面是给模块传递参数[argument]
​			-b -K 用root权限执行
​			注意事项：执行ansible命令一定要先cd到ansible目录

### 3、常用模块

​	1）通过ansible-doc获取帮助。

```
ansible-doc -l #列出所有模块
ansible-doc -l | wc -l
ansible-doc command #查看具体模块的帮助
```

​	2）ping模块		

```
例：ansible node1 -m ping
```

​	3）command模块（可不写，则默认为command）		

```
例：ansible node1 -a "ip a s eth0"
```

​	4）shell模块（区别于command模块是支持bash）
​		shell模块支持判断
​		creates  --->存在则不执行
​		removes  --->不存在则不执行
​		例：ansible test -m shell -a "touch /tmp/b.txt creates=/tmp/b.txt"
​	5）script模块（可以把控制端脚本临时拷到被管理主机执行，执行后删除）		

```
例：ansible test -m script -a "/root/test.sh"
```

​	6）file模块（可以创建文件、目录、链接；修改权限与属性等-->幂等性）
​		幂等性：任意次执行所产生的影响均与一次执行的影响相同
​		参数：

```shell
path=  目标路径
state=   touch（创建文件默认）directory（目录）absent（删除）  
owner=sshd  是修改文件的所有者【sshd是用户名】
group=adm  是修改文件的所属组【adm是组名】
mode=0777  是修改文件的权限
例：ansible test -m file	-a "path=/tmp/file.txt owner=sshd group=adm mode=0777" 
```

​	7）copy模块：复制管理端---->被管理端
​		参数：src=源文件  dest=目标文件（路径）

```shell
例：ansible test -m copy 	-a "src=~/a3.txt dest=/root/a3.txt backup=yes"
#backup=yes 若目标文件已存在则先备份后拷贝
```

​	8）fetch模块：复制被管理端------>管理端		

```shell
例：ansible all -m fetch  -a "src=/etc/hostname dest=/tmp flat=yes"    #flat=yes 表示拷贝到本地是不添加原路径
```

​	9）lineinfile模块：进行行操作
​		参数：
​			path=目标路径
​			line=添加内容
​			insertafter=添加到包含关键字的行下
​			regexp=替换包含的关键字的行，如果有多行，则仅替换最后一行		

```shell
例：ansible test -m lineinfile -a "path=/etc/issue regexp='hello' line='ni hao'"
```

​	10）replace模块：全文替换关键字		

```shell
例：ansible test -m replace -a "path=/etc/issue.net regexp=Kernel replace=Ocean"
```

​	11）user模块：进行用户的相关操作
​		参数：
​			name=用户名
​			password={{‘mima’ | password_hash(‘sha512’)}}
​			#ui=设置用户ID
​			#group=设置用户的基本组
​			#groups=设置用户的附加组
​			#home=指定用户的家目录		

```shell
例：ansible test -m user -a "name=tuser2 uid=1010  group=adm groups=daemon,root home=/home/tuser2  password={{'mima' | password_hash('sha512')}}"
```

​	12）yum_repolistory模块：创建yum仓库
​		参数：
​			name=仓库名和文件名<=>[]
​			description=仓库标识<=>name=
​		

```shell
例：ansible test -m yum_repository -a "name=myyum description=hello baseurl=ftp://192.168.4.254/centos  gpgcheck=no"
```

​	13）yum模块：state:=present(安装)|absent(卸载)|latest(升级)
​			提示：如果name指定的软件名称是以@开始，则代表组包		

```shell
例：ansible test -m yum -a "name=unzip state=latest"
#升级unzip软件包，软件名称可以是*，代表升级所有软件包
```

​	14）service模块：state=started|stopped|restarted		

```shell
enabled:yes设置开机启动
例：ansible test -m service -a "name=httpd state=restarted"
```

​	15）lvg模块：卷组创建

```shell
参数
	state=present(创建)|absent(删除)
	vg=卷组名字
	pvs=由那些设备（分区）组成
例：ansible test -m lvg -a "vg=myvg pvs=/dev/sdb1" #扩容就在pvs里加用，分开
知识点：非交互式创建分区
	parted /dev/sdb mklabel gpt 指定分区类型(mrb或者gpt)
	parted /dev/sdb mkpart primary 1 2G 创建一个2G（1-2）的主分区
```

​	16）lvol模块：创建逻辑卷

```shell
参数：
	state=present(创建)|absent(删除)。
	lv=逻辑卷名
	vg=从哪个卷组总划分
	size=逻辑卷大小
例：ansible test -m lvol -a "lv=mylv vg=myvg state=absent force=yes"
#删除前面创建的逻辑卷mylv  force强制
```

​	17）cron模块

```shell
ansible miner -i zw/g036-host -m cron -a "name='delete C1' hour=*/2 minute=0 \ job='/data/lotus/script/delete_ComputeProofFailed.sh >/dev/null 2>&1'"
name: 指定计划任务名称
state: absent  删除计划任务
hour: */2  表示每两小时
minute: 0  表示0分钟
job:       指定执行的计划任务
```

### 2、sudo提权

​		【root可以提前给普通用户授权，授权普通用户执行特定的管理命令】
​	1）sudo基本流程如下：
​		a）管理员需要先授权（修改/etc/sudoers文件）
​		b）普通用户以sudo的形式执行命令
​		c）可以通过sudo -l查看授权情况
​	2）修改sudoers文件格式（方法：visudo<检查语法>|vim /etc/sudoers<带颜色提示>）		

```shell
书写格式：
	用户|组  主机=（提权用户） NOPASSED:命令列表
	alice   ALL=(ALL)      NOPASSWD:ALL
	#NOPASSWD的意思是执行sudo不需要输入自己的密码
	例：ansible all -m lineinfile -a "path=/etc/sudoers line='alice ALL=(ALL) /usr/bin/systemctl'"   #通过ansible工具修改sudoers
	例：ansible-playbook 10.21.30.9 -i jn/c2_host -t hostname ubuntu-site.yaml -c paramiko  -vvv   #执行sudo超时时使用-c paramiko
```

​	3）修改ansible配置文件（~/ansible/absible.cfg）模板340行左右

```shell
[defaults]
inventory = ~/ansible/hosts
remote_user = alice   #以什么用户远程被管理主机
#host_key_checking = False #是否校验密钥
[privilege_escalation]
become = true #是否需要切换用户
become_method = sudo #如何切换用户
become_user = root #切换成什么用户
become_ask_pass = no #sudo是是否需要输入密码
注意：#为了让ansible以后可以通过alice远程被管理端主机，需要给alice用户远程ssh密钥
```

​	4）修改主机清单文件（ansible/hosts）

```shell
可根据实际情况在相应主机后添加下列内容
ansible_ssh_port=220 #自定义远程SSH端口
ansible_ssh_user=alice #自定义远程连接的账户名
ansible_ssh_pass=密码 #自定义远程连接的密码
ansible_ssh_private_key_file=密钥文件 #自定义远程连接的密钥
```

### 3、playbook剧本

​	1）书写要求
​		a）基本格式

```yaml
---
- hosts:      #定义需要远程管理的主机是谁
  tasks:      #定义需要执行的任务是什么
    - name:   #为第一个任务去个名称
      ping:   #调用的第一个模块
```

b）注意事项：
	文件名必须以yml|yaml结尾
	执行yml时可以使用-f选项自定义并发量。
	全文不能使用tab键
c）修改（vim ~/.vimrc ）VIM配置文件，自动使用空格替换tab键。

```shell
autocmd FileType yaml setlocal ai ts=2 sw=2 et
#使用2个空格自动替换tab键，tabstop=2、expandtab
#开启自动缩进对齐，缩进宽度为2个空格，shiftwidth=2
```

2）setup模块

```yaml
作用：setup模块可以查看收集到的facts信息。
查看方式：ansible test -m setup
常用变量：
	ansible_ssh_user
	ansible_all_ipv4_addresses            #IP地址
	ansible_bios_version                  #主板BIOS版本
	ansible_memtotal_mb                   #总内存
	ansible_hostname                      #主机名
	ansible_devices.sdb.partitions.sdb1.size  #某个磁盘的大小
```

3）debug模块：可以显示facts变量的信息

```yaml
参数：var|msg（需要{{变量}}）
例：msg: "总内存大小:{{ ansible_memtotal_mb }}"
```

4）ansible变量的定义的常用种类
	1.Inventory变量     2.Host Facts变量
	3.Register变量     4.Playbook变量
	5.Playbook提示变量   6.变量文件
	7.命令行变量
a）在lncentory主机清单中定义	

```yaml
例1：node1 myvar1="hello the world" myvar2="content"
例2：[webserver:vars]
	 yourname="jacob"
注意：开始位置就调用变量,就需要在{{}}外面加双引号
```

b）在剧本中直接调用系统自带的ansible_facts变量
	常用自带变量参考setup模块
c）register变量（把上一命令输出定义为变量）	

```yaml
例：
---
- hosts: test
  tasks:
    - name: save shell result to a variable.
      shell: hostname
	  register: myvar
    - name: print the variables value through debug
      debug:
        msg: "{{ myvar }}"
#通过register关键词，把上一条命令的输出结果保存到myvar（自定义）变量
```

d）Playbook变量（vars关键词可以在playbook内定义变量）

```yaml
例：  
vars:                         #vars是关键词，用来定义变量用的
   iname: heal              #具体变量名是iname，值是heal
   ipass: '123456'     #注意密码必须是字符串，需要引号
注意：需要定义在tasks之前
```


e）vars_prompt提示变量

```yaml
- hosts: test
  vars_prompt:             #vars_prompt是关键词,定义提示变量
    - name: iname            #name定义变量的名称为iname
      prompt: "请输入用户名"  #执行剧本时的提示信息[任意字符]
      private: no       #private/隐私/,回显用户名相当于shell脚本的：read -p “提示信息：” 变量名 
```

f）定义变量文件，专门给剧本调用

```yaml
---
iname: cloud
ipass: '123456'
vars_files: variables.yml   通过关键字vars_files调用变量文件
```

g）执行ansible-playbook命令时定义变量（用-e选项）

```shell
ansible-playbook command_var.yml  -e iname="beth" -e ipass="123456"
#通过ansible-playbook命令执行剧本时才定义变量并赋值.
```

4、firewlld模块：为防火墙设置规则

```yaml
例：
- firewalld:      #第三个任务调用firewalld模块设置防火墙规则
    port: 80/tcp   #在防火墙规则中添加一个tcp，80端口的规则
    permanent: yes    #permaenent 是设置永久规则
    immediate: yes    #immediate 是让规则立刻生效
    state: enabled    #state等于enabled是添加防火墙规则
#在默认zone中添加一条放行80端口的规则
```

5、template模块：区别于copy模块是可以拷贝包含变量的文件
6、ansible的高级使用
1）剧本中断：默认情况下，执行时与错误（error）则中断剧本
#在某一个任务后面或者在全局添加ignore_errors：yes都可以跳过错误继续执行。
2）handlers任务

```yaml
达到notify条件（必须是changed），则执行handlers任务或任务组
 例：
 ---
 - hosts: test
   tasks:
     - name: create directory.  #多次执行playbook该任务状态不再是changed
       file:
         path: /tmp/parents/subdir/   #调用file模块创建目录
         state: directory      #state等于directory代表创建目录
       notify: touch file  #notify后面名称必须和handlers中的任务名称一致
   handlers:        #通过handlers再定义一组任务
     - name: touch file    #给任务写描述信息（任务的名字）
       file:      #调用file模块创建文件
         path: /tmp/parents/subdir/new.txt    #需要创建的文件名
         state: touch    #state等于touch代表创建文件
```

3）when条件判断

```yaml
when可以定义判断条件，条件为真时才执行某个任务。
常见条件操作符有：==、!=、>、>=、<、<=。
多个条件可以使用and或or分割，when表达式中调用变量不要使用{{ }}。
例： 
- name: check memory size.
  service:
    name: NetworkManager
    state: stopped
  when: ansible_memfree_mb < 700 
#匹配主机名和系统弄版本的条件格式
when: ansible_distribution_version == "20.04" or ansible_facts.hostname.find('C2')!=-1
```

4）block任务块：可以将多个任务组成任务组

```yaml
例1：满足when则执行block任务组
- hosts: test
  tasks:
    - name: define a group of tasks.
      block:               #block是关键词，定义任务组
        - name: 任务一
        - name: 任务二      
      when: ansible_distribution == "RedHat" #仅当条件满足再执行任务组
#注意:when和block是对齐的,他们在一个级别
```

```yaml
例2：block--->rescue(失败才执行)--->always（不论前面如何都执行）
- hosts: test
  tasks:
    - block:
        - name: 任务一
      rescue:
        - name: 任务二
     always:
        - name: 任务三
```

5）loop循环：item是关键字不能更改

```yaml
例：
- hosts: test
  tasks:
    - name: create multi user.
      user:
        name: "{{item.iname}}"
        password: "{{item.ipass | password_hash('sha512')}}"
      loop:
        - { iname: 'term', ipass: '123456' }
        - { iname: 'amy' , ipass: '654321' }
```

6)with_items循环

```yaml
例：
- name: copy ssh-key,
  copy: src={{ item.src }} dest={{ item.dest }} owner={{ansible_ssh_user}} group={{ansible_ssh_user}} mode={{ item.mode }}
  with_items:
    - { src: "id_rsa.pub",dest: "~/.ssh/authorized_keys" ,mode: "0755" }
```

7、ansible-vault数据加密	

```shell
encrypt（加密）、decrypt（解密）、view（查看）、rekey（修改密码）
例1：ansible-vault encrypt data.txt    #加密文件
例2：ansible-vault  encrypt --vault-id=pass.txt  data.txt
#使用pass.txt文件中的密码把data.txt文件加密
例3：ansible  test  -m  copy  --vault-id=pass.txt  -a  "src=data.txt dest=/tmp/ mode=0600"
#把自己的/data.txt(已加密)文件拷贝给目标主机,放到/tmp目录下,权限是0600
例4：ansible-playbook  --ask-vault-pass  vault.yml
#--ask-vault-pass代表执行剧本时提示输入密码(因为有文件被提前加密了)
```

8、ansible Role：标准的目录结构规范
  1）目录结构

```
defualts/main.yml：定义变量的缺省值，优先级较低
files：存储静态文件的目录
handlers/main.yml:定义handlers
meta/main.yml:写作者、版本等描述信息
README.md:整个角色(role)的描述信息
tasks/main.yml:定义任务的地方
templates目录：存放动态数据文件的地方（模板文件）
vars/main.yml:定义变量，优先级高	
```

 2）创建role

```yaml
例：
	ansible-galaxy init  ~/ansible/roles/issue 
	tree  ~/ansible/roles/issue/
	#查看目录结构，如果没有tree命令则需要使用yum安装该软件
vim  ~/ansible/issue.yml
---
- hosts: test
  roles:
     - issue
```

3）查找及下载role

```shell
ansible.cfg 中加roles_path = ./roles  #指定存放role的路径(相对或者绝对路径)
公共Roles仓库(https://galaxy.ansible.com)管理。
ansible-galaxy  search 'httpd'   #联网搜索roles
ansible-galaxy info acandid.httpd  #查看roles基本信息
ansible-galaxy install acandid.httpd -p ~/ansible/roles/  #下载roles到特定的目录
ansible-galaxy list  -p  roles/  #列出本地有哪些roles
使用ansible-galaxy install可以在官网直接下载Role，也可以编写requirements.yml文件下载Role。
```

4）下载方式

```yaml
[root@control ansible]# cat ~/ansible/roles/requirements.yml
#格式一：直接从Ansible Galaxy官网下载
- src: acandid.httpd
#格式二：从某个git服务器下载
- src: http://gitlab.com/xxx/xxx.git
  scm: git
  version: 56e00a54
  name: nginx-acme
#格式三：下载tar包，支持http、https、file
- src:  http://example.com/myrole.tar
  name:  myrole
[root@control ansible]# ansible-galaxy install -r roles/requirements.yml -p roles
```

5）-t 执行的yml文件的书写格式

```yaml

- hosts: all
  remote_user: root
  become: yes
  become_method: sudo
  roles:
    - mkdir
  tags: [ "mkdir","never" ]
```

------

## 八、CLUSTER

### 1、LVS集群组建

​	1）LVS集群模式有：NAT|DR|TUN三种模式
​		a）NAT模式
​			(数据从哪进，就从哪里出)数据量大时返回数据到调度器会成为瓶颈
​		b）DR直连路由模式
​			数据从调度器进入，进行负载均衡，web服务器直接返回数据给客户
​		c）Tunnel隧道模式
​	2）LVS调度算法:
​		轮询（Round Robin）      加权轮询（Weighted Round Robin）
​		最少连接（Least Connections） 加权最少连接（ Weighted Least Connections ）
​		源地址哈希（Source Hash）  基于局部性的最少链接
​		带复制的基于局部性最少链接  目标地址散列（Destination Hashing）
​		最短的期望的延迟
​		最少队列调度
​	3）LVS调度器配置（软件包：ipvsadm）

```shell
ipvsadm -A -t 192.168.4.5:80 -s rr #备注:-A(add)创建虚拟服务器,
ipvsadm -a -t 192.168.4.5:80 -r 192.168.2.100 -m -w 1 向集群添加服务器
#VIP[集群服务器的IP]是192.168.4.5,给用户访问的IP
```

​	4）ipvsadm选项

```shell
-t   是TCP协议,-u是UDP协议
-s   (scheduler)调度算法:rr|wrr|lc|wlc|sh|dh|lblc|lblcr|sed|nq
-r   (real)真正后端服务器的IP是192.168.2.100和192.168.2.200
-m   代表LVS工作模式为NAT模式(-g是DR模式,-i是Tun隧道模式)
-w   (weight)设置服务器的权重
-a   (add)添加真实服务器   ----> -A 添加集群（虚拟服务器）
-e   (edit)修改后端服务器配置  ---> -E 修改集群服务器配置
-d    删除集群中的某一台服务器  ---> -D 删除某个集群
-C   (clear)清空所有   ipvsadm -C
ipvsadm -Ln  查看集群配置
```

​	5）开启LVS服务器的路由功能
​		a）临时：echo 1 > /proc/sys/net/ipv4/ip_forward
​		b）永久： 修改配置文件---->  vim /etc/sysctl.conf
​			net.ipv4.ip_forward = 1  手动加入如下内容并保存
​			sysctl  -p  刷新配置
​	6）LVS-NAT模式：
​		a）新建集群：				

```shell
ipvsadm -A -t 192.168.4.5:80 -s rr 
```

​		b）向集群添加真实服务器：				

```shell
ipvsadm -a -t 192.168.4.5:80 -r 192.168.2.100 -m -w 1
```

​		c）开路由功能：				

```shell
echo “net.ipv4.ip_forward = 1” >> vim /etc/sysctl.conf
```

​		d）刷新配置并重启服务：				

```shell
sysctl -p ---->systemctl restart network
```

​		e）可保存规则：

```shell
ipvsadm-save -n > /etc/sysconfig/ipvsadm
```

​	7）LVS-DR模式：
​		a）IP组成：
​			VIP:调度器给用户访问的那个IP(集群IP)
​			DIP:调度器连接后端真实服务器的IP
​			RIP:后端真实服务器的IP
​			CIP:客户端IP
​				【注意】VIP必须配置在网卡的虚拟接口(辅助接口)上
​				【注意】DIP(director IP)必须配置在网卡的主接口上
​		b）VIP配置
​			集群端：配主网卡辅助接口上

```shell
例： cp /etc/sysconfig/network-scripts/icfg_eth0{,:0}
    vim //etc/sysconfig/network-scripts/icfg_eth0:0
		TYPE=Ethernet#类型为以太网
		BOOTPROTO=none#如何配置IP[none手动]或[dhcp]
		NAME=ens34:0#网卡名称(con-name)
		DEVICE=ens34:0#设备名称(ifname)
		ONBOOT=yes#开机是否自动激活
		IPADDR=192.168.4.15#网卡IP地址
		PREFIX=24#子网掩码
    systemctl restart network
```

​			服务器端：必须伪装到lo网卡				

```shell
例： DEVICE=lo:0#设备名称
		IPADDR=192.168.4.15#IP地址
		NETMASK=255.255.255.255#子网掩码
		NETWORK=192.168.4.15#网络地址(网络位)
		BROADCAST=192.168.4.15#广播地址
		ONBOOT=yes#开机是否自动激活
		NAME=lo:0#网卡名称
	修改配置文件：vim /etc/sysctl.conf （添加下列内容防地址冲突）
		net.ipv4.conf.all.arp_ignore = 1
		net.ipv4.conf.lo.arp_ignore = 1
		net.ipv4.conf.lo.arp_announce = 2
		net.ipv4.conf.all.arp_announce = 2
	刷新配置并重启服务
		sysctl -p
		systemctl restart network
```

​		c）给proxy（集群端）配置LVS规则

```shell
ipvsadm -A -t 192.168.4.15:80 -s wrr
ipvsadm -a -t 192.168.4.15:80 -r 192.168.4.100:80 #默认为-g（DR模式）
ipvsadm -a -t 192.168.4.15:80 -r 192.168.4.200:80
[root@proxy ~]# ipvsadm -Ln   #查看集群配置
若要写LVS健康检查脚本参考：cluster 01
```

### 2、iced高可用服务器

​	（软件包：keepalived）
​	1）三个模块功能：vrrp，自动配置LVS规则，健康检查
​	2）vrrp（虚拟路由热备份协议）
​		a）修改配置文件：/etc/keepalived/keepalived.conf			

```shell
router_id web1     #12行设置设备的ID号(任意字符串即可)
vrrp_iptables     #13行手动插入该内容(清除防火墙的drop规则)
state  MASTER    #21行(MASTER|BACKUP)[这里不需要修改]
interface ens33 #22行,给哪个网卡配置VIP
virtual_router_id 51   #23行,VRID[主备必须一致][不需要修改]
priority 100   #24行,优先级100[不需要修改]
virtual_ipaddress { 192.168.4.80  }
```

​		b）启服务：

```shell
systemctl start keepalived
```

​	3）keepalived+LVS（keepalived，ipvsadm）
​		修改配置文件：/etc/keepalived/keepalived.conf				

```shell
virtual_server 192.168.4.15 80 {
delay_loop 6
  lb_algo rr  #调度算法RR轮询
  lb_kind DR  #工作模式DR
  persistence_timeout 50   #【一定删除这一行】保持连接50秒
  protocol TCP   #协议TCP
  real_server 192.168.4.100 80 {  #后端真实服务器
  weight 1   #权重
  TCP_CHECK {  #健康检查
  connect_timeout 3   #健康检查的超时时间3秒
  nb_get_retry 3   #健康检查的重试次数3次
delay_before_retry 3   #健康检查的间隔时间3秒
} 
}
[root@proxy ~]# systemctl start keepalived
注意：需要在服务器端添加伪装在lo接口的VIP
```

### 3、haproxy代理服务器

（软件包：haproxy）
	1）修改配置文件：/etc/haproxy/haproxy.cfg		

```shell
例：listen  servers *:80  #集群名为servers，端口80允许所有机器访问
		balance  roundrobin#算法是轮询
		server web1  192.168.4.100:80 check
		server web2  192.168.4.200:80 check
[root@proxy ~]# systemctl restart haproxy
```

​	2）开启haproxy的状态页面（参考cluster 02）
​		修改配置文件：vim /etc/haproxy/haproxy.cfg	 		

```shell 
listen stats 0.0.0.0:1080    #监听端口(任意端口)
		stats refresh 30s     #统计页面自动刷新时间,任意时间
		stats uri /stats     #统计页面url(任意字符)
		stats realm Haproxy Manager   #进入管理解面查看状态信息
		stats auth admin:admin    #统计页面用户名和密码设置,任意
[root@proxy ~]# systemctl restart haproxy   
#--->访问http://192.168.4.5/stats 进行测试
```

### 4、ceph集群：

​	是分布式文件系统（块、文件系统、对象存储）
​	1）Ceph核心组件:
​		MON监控组件(ceph-mon)监控和绘制地图
​		OSD存储设备(ceph-osd)提供共享容量
​		MDS文件系统(ceph-mds)
​		Radowsgateway对象存储(ceph-radosgw)
​	2）部署ceph块共享存储
​		a）准备光盘镜像ceph10.ISO
​		b）安装chrony软件：实现NTP时间同步（软件包：chrony）			

```shell
服务端：
vim /etc/chrony.conf
allow 192.168.4.0/24   #26行  允许谁同步时间
local startum 10    #29行  可以往下传递10层
客服端：
vim  /etc/chrony.conf
server 192.168.4.7 iburst   #从4.7同步时间
pool ntp.aliyun.com iburst  #从阿里云同步时间（7用server）
[root@node1 ~]# for i in  node1  node2  node3
 do
  	ssh $i  "sed -i '2a server 192.168.4.10 iburst'  /etc/chrony.conf"
 	 ssh $i  "systemctl  restart chronyd"
 done  #用ssh一次性配置多台客户端
[root@node1 ~]# chronyc  sources  -V  #重启服务后从服务器同步时间（^*则成功）
```

​		c）安装所需软件包

```shell
ceph-deploy  #Python脚本，可以自动部署ceph，选一台集群中的主机
ceph-mon  ceph-osd  ceph-mds  ceph-radosgw  #均需安装 
```

​		d）配置ceph-mon服务（通过安装ceph-deploy软件操作）

```shell
mkdir /root/ceph-cluster
cd  /root/ceph-cluster
ceph-deploy new node1 node2 node3 #创建ceph-mon集群并生成配置文件
ceph-deploy mon create-initial  #拷贝配置文件到mon主机并启动服务
ceph -s  #查看ceph-mon集群配置情况
systemctl status ceph-mon@node1  #可查看此主机mon服务情况
```

​		e）配置ceph-osd服务			

```shell
初始化磁盘
	ceph-deploy dis zap node1:sdb node1:sdc ......  #格式化为gpt格式
共享磁盘
	ceph-deploy osd create node1:sdb1 node1:sdc ...#共享磁盘出去
 #共享出去的每一块磁盘都自动分出一个5G的缓存盘和剩余的数据盘
	ceph osd tree  #查看osd情况
	systemctl status ceph-osd@0   #可查看每一块共享的磁盘服务状态
#提醒:这些服务在30分钟只能启动3次,超过就报错.
#在这个文件中有定义/usr/lib/systemd/system/ceph-osd@.service
常见错误:
[ceph_deploy][ERROR ] RuntimeError: bootstrap-osd keyring not found; run 'gatherkeys'
解决方法： ceph-deploy gatherkeys node1 node2 node3
覆盖conf文件不一致
	ceph-deploy --overwrite-conf config push node1 node2 node3
```

​		f）创建共享：客户端访问
​			服务端：创建名称为jacob大小为5G,默认在共享池rdb的共享镜像

```shell
rbd create  jacob --image-feature layering  --size 5G 
rbd create  rbd/xyz --image-feature layering  --size 5G 指定共享池
resize #改变大小
```

​			客户端：安装软件包：ceph-common				

```shell
拷贝用户名密码文件（/etc/ceph/ceph.client.admin.keyring）到客户端
scp node1:/etc/ceph/ceph.client.admin.keyring  /etc/ceph/
```

​			访问共享：rbd map jacob

```shell
[root@client ~]# mkfs.xfs /dev/rbd0    #格式化共享镜像
[root@client ~]# mount /dev/rbd0  /mnt/ #挂载使用
```

​			常用命令：

```shell
ceph list|ls   #查看镜像情况
ceph osd pools  #查看共享池
rbd showmapped  #查看镜像挂载情况
```

​		g）ceph快照：用于回滚数据

```shell
快照创建、还原
	rbd snap ls --image jacob   #查看jacob共享是否有快照
	[root@node1 ~]# rbd snap create --image jacob --snap jacob-snap1  #创建快照jacob-k1，基于rbd
	[root@node1 ~]#rbd snap rollback --image jacob --snap jacob-snap1   #还原快照--->还原时不能在线
基于快照创建镜像
	rbd snap protect --image jacob --snap jacob-snap1   #保护快照
	rbd clone jacob --snap jacob-snap1 kelong --image-feature layering	#克隆镜像  rbd clone源镜像  --snap快照名 新镜像名称   
	[root@node1 ~]# rbd list
	[root@node1 ~]# rbd info kelong#可以查看到快照的信息
	[root@node1 ~]# rbd flatten kelong#把镜像与快照分离
```

​		f）客户端取消挂载	

```shell
[root@client ~]# umount  /dev/rbd0
[root@client ~]# rbd unmap  jacob    #通过共享名称卸载
[root@client ~]# rbd unmap  /dev/rbd1  #通过设备名卸载
```

​	3）部署ceph文件系统共享存储
​		a）使用ceph-deploy工具初始化数据磁盘（仅node1操作）			

```shell
[root@node1 ceph-cluster]# ceph-deploy disk  zap  node1:vdb  node1:vdc   
```

​		b）初始化OSD集群			

```shell
[root@node1 ceph-cluster]# ceph-deploy osd create  node1:vdb  node1:vdc
```

 	   c）服务端创建共享池：名称任意		 

```shell
[root@node1 ~]# ceph osd pool create cephfs_data 64
[root@node1 ~]# ceph osd pool create cephfs_metadata 64
```

​		d）服务端创建文件系统：前为inode，后为block

```shell
[root@node1 ~]# ceph fs new myfs1 cephfs_metadata cephfs_data
[root@node1 ~]# ceph osd lspools  #查看共享池
[root@node1 ~]# ceph fs ls#查看文件系统
#【ceph目前的版本仅支持作一个文件系统】
```

​		e）服务端装包（ecph-mds）、启服务[仅node1(mon服务器)主机操作]			

```shell
[root@node1 ceph-cluster]# ceph-deploy mds create node3
```

​		f）客户端访问：			

```shell
[root@client ~]# mount -t ceph  192.168.4.11:6789:/  /data -o name=admin,secret=AQCuIGZe9KrPGRAANKf9GPF+NjxzMJYRIBnZqw==
#注意:文件系统类型为ceph
#192.168.4.11为MON节点的IP（不是MDS节点）
#admin是用户名,secret是密钥
#密钥可以在/etc/ceph/ceph.client.admin.keyring中找到
```

​	4）创建ceph用户		

```shell
[root@node1 ~]# ceph auth get-or-create client.nb osd  'allow *'  mds  'allow *' mon  'allow *'  > 可保存为文件 
[root@node1 ~]# ceph auth list 查看ceph用户
```

​	5）ceph对象存储（软件包：ceph-radosgw）
​		对象存储：也就是键值存储，通其API接口指令才能读写数据			

```shell
[root@node1 ceph-cluster]# ceph-deploy rgw create node3  #直接启服务就行
[root@node3 ~]# systemctl status ceph-radosgw@rgw.node3 在node3查看服务状态.
```

------

## 九、zabbix监控与服务安全

### 1、常用监控命令

​	1）查看内存与交换分区信息：free 
​	2）查看CPU利用率：uptime 
​	3）查看磁盘信息：df
​	4）查看网卡信息：ifconfig eth0| ip a s
​	5）查看端口信息：ss  -nutlp
​	6）查看网络连接信息：ss  -antup   #-a查看所有连接状态

### 2、部署zabbix监控

​	1）关闭selinux和防火墙
​	2）安装LNMP环境--->软件包：nginx gcc pcre-devel openssl-devel mariadb  mariadb-server mariadb-devel php php-fpm php-mysql
​			模块：--with-http_ssl_module
​	3）修改Nginx配置文件，开启动静分离，添加如下行：

```shell
fastcgi_buffers 8 16k;         #缓存php生成的页面内容，8个16k
fastcgi_buffer_size 32k;         #缓存php生产的头部信息
fastcgi_connect_timeout 300;       #连接PHP的超时时间
fastcgi_send_timeout 300;         #发送请求的超时时间
fastcgi_read_timeout 300;           #读取请求的超时时间
```

​	4）源码安装zabbix_server服务器
​		依赖包：net-snmp-devel curl-devel autoconf libeven-devel
​		安装模块：			

```shell
--enable-server               # 安装部署zabbix服务器端软件
--enable-agent                #安装部署zabbix被监控端软件
--enable-proxy                #安装部署zabbix代理相关软件
--with-mysql                  #配置mysql_config路径
--with-net-snmp               #允许zabbix通过snmp协议监控其他设备
--with-libcurl                #安装相关curl库文件，这样zabbix就可以通过curl连接http等服务，测试被监控主机服务的状态
```

​	5）创建并初始化数据库
​		a）创建可以访问数据库的账户与密码

```shell
[root@zabbixserver ~]# mysql
create database zabbix character set utf8; #创建数据库，支持中文字符集
grant all on zabbix.* to zabbix@'localhost' identified by 'zabbix';
```

​		b）依次导入信息到数据库schema.sql-->image.sql-->data.sql			

```shell
[root@zabbixserver ~]# cd lnmp_soft/zabbix-3.4.4/database/mysql/
[root@zabbixserver mysql]# mysql -uzabbix -pzabbix zabbix < schema.sql
```

​	6）修改zabbix并启动服务：vim /usr/local/etc/zabbix_server.conf

```shell
DBHost=localhost                          #数据库主机，默认该行被注释
DBName=zabbix                             #设置数据库名称
DBUser=zabbix                             #设置数据库账户
DBPassword=zabbix                         #设置数据库密码，默认该行被注释
LogFile=/tmp/zabbix_server.log            #设置日志，仅查看以下即可
useradd -s /sbin/nologin zabbix           #不创建用户无法启动服务

zabbix_server #启服务：
killall zabbix_server #关闭服务
echo  zabbix_server  >>  /etc/rc.local     #开机自启
chmod +x  /etc/rc.local               #赋予执行权限
```

​	7）修改zabbix_agent服务：vim /usr/local/etc/zabbix_agentd.conf

```shell
Server=127.0.0.1,192.168.2.5                      //允许哪些主机监控本机
ServerActive=127.0.0.1,192.168.2.5             //允许哪些主机通过主动模式监控本机
Hostname=zabbix_server                      //设置本机主机名
LogFile=/tmp/zabbix_server.log              //设置日志文件
UnsafeUserParameters=1                   //是否允许自定义key
[root@zabbixserver ~]# zabbix_agentd      //启动监控agent
```

​	8）拷贝zabbix_server的web页面到Nginx服务目录下
​	   a）根据web页面的错误信息安装软件包	   	

```shell
yum -y install php-gd php-xml php-bcmath php-mbstring
```

​		b）修改php配置文件： vim /etc/php.ini	

```php
date.timezone = Asia/Shanghai        //设置时区
max_execution_time = 300          //最大执行时间，秒
post_max_size = 32M            //POST数据最大容量
max_input_time = 300            //服务器接收数据的时间限制
memory_limit = 128M            //内存容量限制
登录web页面是填写对应信息：用户admin密码zabbix
```

​	9）在web页面配置并使用zabbix服务
​		a）添加监控主机
​		b）为被监控主机添加模板
​		c）查看监控数据

### 3、自定义监控项目

​	1）在被监控主机创建自定义key  

```shell
vim /usr/local/etc/zabbix_agentd.conf
	Include=/usr/local/etc/zabbix_agentd.conf.d/      //加载配置文件目录
	cd /usr/local/etc/zabbix_agentd.conf.d/
vim count.line.passwd
	UserParameter=count.line.passwd,sed -n '$=' /etc/passwd
自定义key语法格式: UserParameter=自定义key名称,命令（脚本）
```

​	2）创建监控模板
​		a）添加监控模板
​		b）创建应用
​		c）创建监控项目item--->键值需要和UserParameter的值相同
​		d）创建图形
​		e）将模板链接到被监控主机：配置主机-->模板--->更新
​		f）根据需要选择条件查看监控图形

### 4、zabbix报警 

​	1）创建触发器规则
​	  Configuration--> Templates--->添加模板--->triggers--->add
​	2）设置邮件
​		 修改email报警媒介--->设置邮件账户和邮件服务器信息--->为用户添加报警媒介信息
​	3）创建Action动作
​		a）Action动作
​		b）配置Action动作出发的条件
​		c）配置动作的具体行为（操作）

### 5、zabbix自动发现

​	作用：添加主机，自动添加主机到组；自动连接模板到主机，自动创建监控项目与图形等。
​		1）创建自动发现规则
​		2）创建动作
6、zabbix自动监控
​	1）添加被监控主机，安装zabbix_agent,修改配置文件为主动监控模式

```shell
#Server=127.0.0.1,192.168.2.5          //允许哪些主机监控本机
ServerActive=127.0.0.1,192.168.2.5     //允许哪些主机通过主动模式监控本机
StartAgents=0                        //被动监控时启动几个Agent进程监听10050端口
Hostname=zabbix_server              //设置本机主机名
LogFile=/tmp/zabbix_server.log          //设置日志文件
UnsafeUserParameters=1             //是否允许自定义key
```

​	2）创建自动监控模板
​		a）克隆一个已有模板（全克隆）
​		b）修改模板中的监控项目的监控模式
​		c）禁用部分不能自动监控的监控项目
​		3）添加监控主机（主动监控模式）
​	 		 主机名称必须与被监控端的配置文件Hostname一致，IP地址修改为0.0.0.0

### 7、自定义监控（以nginx服务状态为例）

​	1）安装Nginx，开启status模块：--with-http_stub_status_module	 	 

```
location /status {  
		stub_status on;   
}
```

​	2）自定义监控key	

```shell
UserParameter=nginx.status[],/usr/local/bin/nginx_status.sh $1
vim /usr/local/bin/nginx_status.sh
	#!/bin/bash
	case $1 in
	active)
			curl -s http://192.168.2.100/status |awk '/Active/{print $NF}';;
	waiting)
			curl -s http://192.168.2.100/status |awk '/Waiting/{print $NF}';;
	accepts)
			curl -s http://192.168.2.100/status |awk 'NR==3{print $2}';;
	esac
[root@web1 ~]# chmod +x /usr/local/bin/nginx_status.sh
[root@web1 ~]# zabbix_get -s 127.0.0.1 -k 'nginx.status[accepts]'  #测试效果
```

​	3）在web页面添加监控
​	  Configuration（配置）-->Hosts(主机)，点击主机后面的items（项目），点击Create item（创建项目）
​	  详细信息看第二天内容
服务安全

### 8、Linux基本防护措施

​    1）修改账户属性			

```shell
chage  -l 账户名称  //查看账户信息
chage  -E 时间 账户名称   //修改账户有效期
/etc/login.defs这个配置文件，决定了账户密码的默认有效期。
```

​    2）临时锁定账户

```shell
passwd -l zhangsan      #锁定用户账号
passwd -S zhangsan      #查看状态status
passwd -u zhangsan      #解锁用户账号
passwd -d zhangsan      #清楚用户密码
```

​    3）修改tty登录提示信息
​           vim /etc/issue
​    4）文件特殊属性

```shell
chattr +i 文件名  #锁定文件（无法修改、删除等）
chattr -i 文件名  #解锁文件
chattr +a 文件名  #锁定后文件仅可追加
chattr -a 文件名  #解锁文件
lsattr 文件名     #查看文件特殊属性
```

   5）关闭不需要的服务    	   

```
cups.service       打印服务
postfix.service      邮件服务
NetworkManager.service 网络管理服务(network可以替代）
firewalld       防火墙（iptables可以替代）
atd.service     一次性计划任务（crond可以替代）
bluetooth.service    蓝牙服务
autofs.service     自动挂载
pcscd.service     智能卡设备资源管理器
```

### 9、sudo提权

```shell
（配置文件/etc/sudoers|visudo）
su - -c "systemctl restart sshd"         #以管理员重启服务
su - zhangsan -c "touch /tmp/test.txt"   #管理员切换普通用户
useradm ALL=(ALL) /usr/bin/passwd,!/usr/bin/passwd root,/usr/sbin/user,!/usr/sbin/user* * root
Defaults logfile="/var/log/sudo"  #为sudo开启日志追踪
```

### 10、SSH服务安全

   1）基本安全策略：（配置文件：/etc/ssh/sshd_config）

```shell
PermitRootLogin no   #禁止root用户登录
PermitEmptyPasswords no  #禁止密码为空的用户登录
UseDNS no     #不解析客户机地址
LoginGraceTime 1m   #登录限时
MaxAuthTries 3    #每连接最多认证次数
```

   2）开启黑白名单：针对SSH访问采用仅允许的策略，未明确列出的用户一概拒绝登录

```shell
AllowUsers zhangsan tom useradm@192.168.4.0/24 #定义账户白名单
#DenyUsers USER1 USER2         #定义账户黑名单
#DenyGroups GROUP1 GROUP2      #定义组黑名单
#AllowGroups GROUP1 GROUP2     #定义组白名单
```

   3）ssh免密登录

```shell
ssh-copy-id  传递公钥  -i (可指定传递公钥文件名)
PasswordAuthentication no   #将此行yes改成no--->禁用口令验证
```

### 11、selinux安全防护

```shell
chcon -R 上下文  目录  -t 修改
chcon -t public_content_t /var/ftp/d2.tar.g
ls -z  查看标签
```

### 12、加密与解密的应用

   1）常见的加密算法				

| 为确保数据机密性算法：        | 为确保数据完整性算法：                 |
| :---------------------------- | -------------------------------------- |
| a) 对称加密算法(AES,DES)      | a) 信息摘要（MD5，SHA256，SHA512）     |
| b) 非对称加密算法（RSA，DSA） | 例：md5sum file?.txt 可看文件md5校验值 |

​    2）gpg加密（软件包：gunpg2）

```shell
 gpg  -version  查看gpg版本
 gpg  -c     对称加密文件
 gpg  -d file2.txt.gpg > file2.txt     解密后保存
 gpg  --list-keys     查看秘钥
 gpg  -gen-key     生成密钥对
 gpg -a --export UserA > UserA.pub  导出公钥到user.pub
 gpg -import  /tmp/userA.pub      从文本导入公钥 
 gpg -e -r UserA love.txt       非对称加密（用公钥userA加密love.txt）
 gpg -d love.txt.gpg > love.txt    解密加密文件并重定向到文件
```

   3）gpg签名：检查数据来源的正确性

```shell
gpg -b log.tar  为log.tar创建签名
gpg -verify log.tar.sig log.tar  验证签名
```

### 13、AIDE入侵检测（软件包：aide）

​	1）修改配置文件：/etc/aide.conf明确需要对哪些数据进行校验
​	2）aide -init 入侵前对数据进行校验，生成初始化数据库，保存u盘或其他安全地方
​	3）导入校验数据库，进行数据校验	  

```shell
cd /var/lib/aide/
mv aide.db.new.gz aide.db.gz  //校验前需要修改其校验数据库文件名
aide --check   //检查哪些数据发生了变化
ctrl+v-->选中-->shift+i-->#-->esc  可以批量注释文件行
```

### 14、扫描与抓包（软件包：nmap）

​	1）基本用法：
​		nmap [扫描类型] [选项] <扫描目标 ...>
​		常用的扫描类型
​			-sS，TCP SYN扫描（半开）    -sT，TCP 连接扫描（全开）
​			-sU，UDP扫描         -sP，ICMP扫描
​			-A，目标系统全面分析				

```shell
例1：nmap -n -sP 192.168.4.0/24检查4.0网段那些可以ping通-n:不执行DNS解析
例2：nmap -p 21-22 192.168.4.0/24 检查4.0网段那些主机开启了ssh,ftp服务
例3：nmap -A 192.168.4.100,5 全面分析192.168.4.100和192.168.4.5的操作系统信息
```

​	 2）tcpdump抓包（软件包tcpdump）
​	   监控选项如下：
​			  -i           指定监控的网络接口（默认监听第一个网卡）
​			  -A          转换为 ACSII 码，以方便阅读
​			  -w          将数据包信息保存到指定文件
​			  -r           从指定文件读取数据包信息
​		  tcpdump的过滤条件：
​			类型：host、net、port、portrange
​			方向：src、dst
​			协议：tcp、udp、ip、wlan、arp、……
​			多个条件组合：and、or、not			   

```shell
例：tcpdump -A -w ftp.cap -host 192.168.4.5 and tcp port 21     #抓包并保存为ftp.cap
例：tcpdump -A -r ftp.cap | egrep '(USER|PASS)'    #分析数据包（-r读取之前抓的文件）
```

​	 3）查看base64编码内容		

```shell
[root@proxy ~]# echo "dG9tOjEyMzQ1Ng==" | base64 -d
[root@proxy ~]# echo "tom:123456" | base64 
```

### 15、audit监控

（软件包：audit）---> 审计系统（配置文件：/etc/audit/audit.conf）
	1）在配置文件确定日志文件路径：log_file=/varc/log/audit/audit.log
	2）配置审计规则

```shell
auditctl -s  查询状态
auditctl -l  查看规则
auditctl -D  删除所有规则 
语法格式：auditctl -w path(文件或目录) -p permission(r,w,x,a) -k key_name(审计名字，可选，自定义) 
```

​    3）永久规则需要写入：/etc/audit/rules.d/audit.rules
​	4）可以查看日志文件来了解对监控目录的产生的所有操作		

```shell
ausearch  -k ssh_config -i  | tailf /var/log/audit/audit.log
```

### 16、优化nginx服务

​	1）删除不需要的模块--->--with开启需要模块  --without  禁用不需要模块
​	2）修改版本信息，隐藏版本号

```shell
server_tokens off；    #在http下手动添加
[root@proxy ~]# curl -I http://192.168.4.5 #查看服务器响应的头部信息
```

​	3）限制并发量（ngx_http_limit_req_module）-->修改nginx配置文件

```shell
limit_req_zone $binary_remote_addr zone=one:10m rate=1r/s;
 server {
     listen 80;
     server_name localhost;
     limit_req zone=one burst=5;
 }  
#上面案例中是将客户端IP信息存储名称为one的共享内存，内存空间为10M
#1M可以存储8千个IP信息，10M可以存储8万个主机连接的状态，容量可以根据需要任意调整
#每秒中仅接受1个请求，多余的放入漏斗
#漏斗超过5个则报错
```

​	4）拒绝非法请求（一般有GET和POST就行）-->修改nginx配置文件

```shell
server {
	listen 80;
	if ($request_method !~ ^(GET|POST)$ ) {
	return 444;  
	#这里，!符号表示对正则取反，~符号是正则匹配符号
	#如果用户使用非GET或POST方法访问网站，则retrun返回错误信息
```

​	5）防止buffer溢出

```shell
http{
client_body_buffer_size  1K;
client_header_buffer_size 1k;
client_max_body_size 1k;
large_client_header_buffers 2 1k;
 … …
}
```

### 17、数据库安全

​	1）初始化安全脚本：mysql_secure_installation--->可定义数据库用户名和密码
​	2）密码安全	   

```shell
[root@proxy ~]# mysqladmin -uroot -predhat password 'mysql'   		#修改密码，旧密码为redhat，新密码为mysql
[root@proxy ~]# mysql -uroot -pmysql
MariaDB [(none)]>set password for root@'localhost'=password('redhat');       #使用账户登录数据库，修改密码
#注意：在.bash_history和.mysql_history会记录历史命令信息  清空数据和使用交互式登录数据库以尽量保证密码安全
```

​	3）数据的备份与还原	

```shell
备份：	      
	mysqldump -uroot -predhat mydb table > table.sql     #备份数据库中的某个数据表
	mysqldump -uroot -predhat mydb > mydb.sql            #备份某个数据库
	mysqldump -uroot -predhat --all-databases > all.sql  #备份所有数据库
还原：
    mysql -uroot -predhat mydb < table.sql      #还原数据表
	mysql -uroot -predhat mydb < mydb.sql       #还原数据库
	mysql -uroot -predhat < all.sql             #还原所有数据库
```

​	4）数据安全
​	 	 使用SSH远程连接服务器后，再从本地登陆数据库（避免在网络中传输数据，因为网络环境中不知道有没有抓包者）

### 18、Tomcat安全性

​	1）隐藏版本信息	  

```shell
cd /usr/local/tomcat/lib/
jar -xf catalina.jar
vim org/apache/catalina/util/ServerInfo.properties
vim /usr/local/tomcat/conf/server.xml
<Connector port="8080" protocol="HTTP/1.1"
connectionTimeout="20000" redirectPort="8443" server="jacob" />
```

​	2）删除默认的测试页面		

```shell
[root@web1 ~]# rm -rf  /usr/local/tomcat/webapps/*
```

### 19、使用diff和patch补丁工具

  1）diff命令常用选项：
		-u 输出统一内容的头部信息（打补丁使用），计算机知道是哪个文件需要修改
		-r 递归对比目录中的所有资源（可以对比目录）
		-a 所有文件视为文本（包括二进制程序）
		-N 无文件视为空文件（空文件怎么变成第二个文件）
	2）使用diff生成补丁文件

```shell
diff -u test1.sh test2.sh  > test.patch
diff -Nuar source1/ source2/ > source.patch
```

​	3）使用patch命令为文件或目录打补丁	  

```shell
patch -p0 < test.patch       #打补丁
patch -RE < test.patch       #还原旧版本，反向修复
注意：patch 选项根据不同目录级别由p0-X不等
```

### 20、防火墙iptables（软件包iptables：）

1、iptables的组成
	1）iptables的表
		 nat表（地址转换表）filter表（数据过滤表）raw表（状态跟踪表）mangle表（包标记表）
	2）iptables的链
		INPUT链（入站规则）
		OUTPUT链（出站规则）
		FORWARD链（转发规则）
		PREROUTING链（路由前规则）
		POSTROUTING链（路由后规则）

![image-20210628090530543](C:\Users\king\AppData\Roaming\Typora\typora-user-images\image-20210628090530543.png)

<img src="C:\Users\king\AppData\Roaming\Typora\typora-user-images\image-20210628090543445.png" alt="image-20210628090543445"  />

2、iptables命令语法格式
  iptables [-t 表名] 选项 [链名] [条件] [-j 目标操作]	 

	例：iptables -t filter -A INPUT -p tcp -j ACCEPT
		查看防火墙规则：iptables -nL
		清空所有规则：iptables -F
		删除规则：iptables -D INPUT 3  #制定行号删除（可以-t指定表删除）
3、Iptables防火墙规则的条件	

```shell
例1：iptables -I INPUT -p tcp --dport 80 -j REJECT
例2：iptables  -A  INPUT  -s 192.168.4.100  -j  DROP
例3：iptables  -A INPUT -p icmp --icmp-type echo-request  -j  DROP        	#仅禁止入站的ping请求，不拒绝入站的ping回应包
```

4、防火墙扩展规则
	1）根据mac地址过滤主机		

```shell
 iptables -A INPUT -p tcp --dport 22 -m mac --mac-source  52:54:00:00:00:0b -j  DROP     	
 #拒绝52:54:00:00:00:0b这台主机远程本机
```

​	2）过滤多端口	  

```shell
iptables -A INPUT -p tcp -m multiport --dports 20:22,25,80,110,143,16501:16800 -j ACCEPT   	
#一次性开启20,21,22,25,80,110,143,16501到16800所有的端口
```

​	3）设置防火墙规则，实现IP地址的伪装
​		a）开启路由转发功能		 	

```shell
echo 1 > /proc/sys/net/ipv4/ipforward
```

​		b）设置防火墙规则，实现SNAT地址转换			 

```shell
#192.168.4.0网段访问本机的80端口都伪装成192.168.2.5进行访问
sudo iptables -t nat -A POSTROUTING  -s 192.168.4.0/24 -p tcp --dport 80 -j SNAT --to-source 192.168.2.5
#访问本机的222端口的都转到192.168.2.20的22号端口
sudo iptables -t nat -A PREROUTING -p tcp --dport 222 -j DNAT --to-destination 192.168.2.20:22
sudo iptables -t nat -A POSTROUTING -p tcp -d 192.168.2.20 --dport 22 -j SNAT --to-source 172.16.8.8
```

​		c）登陆web主机查看日志			

```shell
[root@proxy ~]# tail  /var/log/httpd/access_log
```

​		d）动态伪装IP（用于IP地址不固定的情况）			

```shell
[root@proxy ~]# iptables  -t  nat  -A POSTROUTING -s  192.168.4.0/24 -p tcp --dport 80 -j MASQUERADE
```

​		e）永久保存规则	

```shell
	  service iptables save
```

# 第三阶段

------

## 十、MySQL-基础

### 1、部署mysql服务器

​		（软件包：mysql-5.7.17.tar--->yum -y install mysql*.rpm)
​	 1）密码修改
​		a）查看初始密码：

```shell
grep -i  “password”/var/log/mysqld.log
```

 		b）根据初始密码修改密码：注意密码复杂性需要满足密码策略			  

```mysql
mysql -uroot -p’初始密码’ [数据库名]      #连接mysql
alter user root@localhost identified by “新密码”  #修改密码
```

​	2）修改密码策略
​		a）查看密码策略		     

```mysql
show variables like "%password%";
```

​		b）临时修改		       

```mysql
set global validate_password_policy=0; #确定密码策略（low0|medium1|strong2）
set global validate_password_length=6；#密码长度
```

​	c）永久修改：/etc/my.cnf	   

```shell
validate_password_policy=0;
validate_password_length=6；
netstat -utnlp | grep 3306         #查看端口
ps -C mysqld                #查看进程
/var/lib/mysql              #数据库文件所在位置
```

### 2、数据库基本管理

​	1）mysql常用命令（\c可以终止命令）	  

```mysql
show databases;                 #查看都有哪些数据库
show tables;                        #查看当前数据库有哪些表
select user();                  #查看当前登录数据库的用户
select database();                #查看当前位于那个数据库
use db1                       #切换数据库到db1
create database db1           #新建数据库db1
drop  database|table           #删除数据库|表
```

​	 2）表的操作（增insert|删delete|改update|查select）

```mysql
create table db1.mytable(name char(3),sex enum(“man”，”woman”,”no”))default
charset=utf8;              #新建表mytable，并支持中文
desc mytable;                #查看表结构
insert into db1.mytable values(“wxl”,”man”,)              #插入记录wxl man到表mytable
update mytable set name=abc              #修改表的name字段的值全部为abc
show create table mytable               #查看表mytable的字符集
select * from mytable；             #查看表记录
delete from  mytable；            #删除表记录
```

### 3、字符类型

​	1）定长：char（字符个数）  最多255
​	2）变长：varchar（字符个数）最多65532
​	3）大文本类型：text|blob  大于65535时使用

### 4、数值类型

​	1）整数型
​    	 ![image-20210628113630897](C:\Users\king\AppData\Roaming\Typora\typora-user-images\image-20210628113630897.png)
​	2）浮点型：
​	  float：单精度
​	  double：双精度
​	  格式：字段名 类型（总宽度，小数位数）
​	  例： (money  float(5,2))
​	3）枚举类型：
​	  enum（"n”,”y”......）  单选
​	  set（“a”,”b”,”c”,”d”,”e"......）  多选
​	4)时间日期型

```
年      year  YYYY  2020  1990 
时间     time  HHMMSS   091428   211428
日期     date  YYYYMMDD  20200515
日期时间  datetime|timestamp  YYYYMMDDHHMMSS  20200515190000
时间函数：now( ) year( ) month( ) day( ) date( ) time( )  curtime( ) curdate( )
```

### 5、约束条件

   null  允许为空（默认值）  not null  不允许为空
    key  键值类型  default 设置默认值   extra 额外设置

### 6、修改表结构	 

格式：alter table 库名.表明  操作动作
	add  添加新字段 		

```mysql
例：alter table tea6 ADD address varchar(48) after name;
#add的附加项：first 添加到字段最前面  after name 表示添加到name的后面
```

​	modify  修改字段类型 		

```mysql
例： alter table  db1.t2 modify name varchar(2) not null  after email ;
```

​	change 修改字段名		

```mysql
例：alter table tea6 change email mail varchar(10) not null after name;
```

​	rename  修改表名		

```mysql
例：alter table  t2  rename teacher;
```

​	drop  删除字段		

```mysql
例： alter table  db1.t2 drop school , drop class ;
```

### 7、mysql键值

```shell
类型：Btree（双叉型，默认值） B+tree hash
种类：index普通索引unigue唯一索引fulltext全文索引primary key主键foreign key 外键												
```

1）index普通索引：一个表可以有多个，允许重复，也可为空，字段标志：MUL

```mysql
mysql> create table db1.t24(name char(10) ,age int , class char(7) , sex enum("g","b"),index(name),index(class) );    
#在建表时以字段name和class创建索引
create index 索引名 on 表明（字段名）  #在已有表穿件索引 
mysql> create index  xh on t3(money);    
mysql> drop index class on db1.t24;     #删除索引（字段名）
mysql> drop  index  xh on  t3;      #删除索引（索引名）
mysql> desc  库.表；  #查表结构
mysql> show index from 库.表； #查看索引的详细信息
```

​	2）primary key 主键：字段标志PRI ---> 一个表只能有一个，字段值不能重复，复合键需要一起创建	 

```mysql
mysql> create table db1.t25 ( name char(10) primary key , class char(7) , age int );
mysql> create table db1.t26(name char(10),class char(7),age int , primary key(name))；
mysql> alter table  teacher add primary key(address);  #在已有表创建主键
mysql> alter table  teacher drop  primary key ;   #删除主键
#关键字auto_increment 可以让字段通过自加1的方式赋值
#可以建表的时候添加，也可以通过and添加
alter table db1.t2 add id int primary key auto_increment
```

​	3）foreign key 外键

```mysql
create table t3(id int,name char(10),foreign key(id) references db1.t2 on update cascade on delete cascade )engine=innodb;
engine=innodb   #指定存储引擎  
on update cascade   #同步更新
on delete cascade  #同步删除
show create table t3 \G  #查看外键名
alter table t3 drop foreign key 外键名  #删除外键
```

### 8、数据的导入和导出

​	1）修改配置文件:确定检索目录

```mysql
a）show variables like “%file%”      #查找出确定检索目录的关键词secure_file_priv
b）配置文件/etc/my.cnf  
	---> 添加secure_file_priv=/myload
c）重启服务：system restart mysqld 
```

​	2）导入数据	  

```mysql
load data infile “导入的目录/文件” into table “库.表名” fields terminated by “分隔符” lines terminated by “\n”;
```

​	3）导出数据	  

```mysql
select * from 库.表名 into outfile “导出目录/文件名” ；
#注意事项：导入和导出的目录就是检索目录，必须相同
```

### 9、管理表记录

​	1）增加表记录	 		 

```mysql
insert into 表名(可自定义字段) values(字段值1，字段值2,...),(字段值1，字段值2,...);
```

​	2）修改表记录	 		

```mysql
 update 表名 set 字段=字段值 where 条件
```

​	3）删除表记录	 		 

```mysql
delete from 表名 where 条件
```

​	4）查询表记录	 		 

```mysql
select * from 表名 where 条件
```

​	5）条件书写
​		a）匹配空和非空：is null-->空  is not null--->非空
​		b）逻辑条件：and和or  
​		c）数值条件：>,>=,<,<=,!=  
​		d）范围匹配：
​			in(值1,值2,....)    匹配值得任意一个
​			not in(值1,值2,,...)   不匹配值中的任意一个
​			between 数字 and 数字  取其范围之间的值
​	6）模糊查询
​		  where 字段名 like “通配符”
​		  _--->表示一个字符
​		  %--->表示0~n个字符		  

```mysql
例：where name like “”;  匹配name字段值为四个字符的
```

​	7）正则表达式：regexp	  	

```mysql
例：where name regexp  “^a|y$”; 匹配name字段值以a开头和以y结尾的
```

​	8）四则运算：+，-，*，/，%，()提高优先级
​	9）聚集函数：

```mysql
sum（字段名）求和
avg（字段名）求平均值
min（字段名）最小值
max（字段名）最大值
count（字段名）统计个数
```



### 10、查询结果处理

​		1）排序：order by 字段名 asc|desc  #升序|降序		 		 

```mysql
例：select name,uid  from db1.user order by uid asc
```

​		2）分组:group by 字段名		 		 

```mysql
例：select shell from db1.user group by shell 
#distinct  字段名  #可以去重显示
```

​		3）查询结果再过滤：查询having 条件表达式 		 		 

```mysql
select name from db1.user having name="bob";
```

​		4）限制查询结果的显示行数
​			a）sql查询 limit 数字；  #显示查询结果的前几行记录
​			b）sql查询 limit 数字1  数字2；#显示查询结果范围内的记录

### 11、sql图形图形管理工具：phpmyadmin

  	 操作流程：部署LAMP--->启动服务httpd--->解压phpmyadmin包---->配置config.inc.php(config.sample.inc.php)--->浏览器访问---->根据需要进行操作

### 12、用户授权

​	1）格式：			

```mysql
grant all on . to yaya@”%” identified by “abc123”; #为sql用户yaya赋予权限
```

​		a）权限列表：all；usage；select，update，insert，delete；select（字段1，字段，......）  
​		b）库名：.,库名.，库名.表明
​		c）客服端地址：%，192.168.4.%，192.168.4.1，localhost
​		d）授权权限：with grant option （可选）
​	2）登录用户的相关使用命令		

```mysql
select user();                               #显示登录用户的用户名及客服端地址
show grants;                                 #登录用拥有的权限
show grants for 用户名@”客服端地址”;                   #管理员查看已有授权用户的权限
set password=password(“mima ”);                        #授权用户脸登录后修改mima
set password for 用户名@”客户端地址”=password(“密码”);               #为授权用户重置密码
drop user 用户名@”客户端地址”;                                   #管理员删除授权用户
```

​	3）授权库：MySQL库，记录授权信息--->可修改记录来修改权限
​		user表：记录已有的授权用户及权限
​		db表：记录授权用户对数据库的访问权限
​		tables_priv表：记录授权用户对表的访问权限
​		columns_priv表：记录授权用户对字段的访问权限
​		修改mysql库后需要刷新才能生效：flush privieges
​	4）撤销权限
​		格式：revoke 权限列表 on 库.表 from 用户名@”客服端地址”			

```mysql
例：mysql> REVOKE all ON webdb. FROM webuser@'%';
```

### 13、mysql--root密码

​	1）修改密码

```mysql
mysqladmin -uroot -p”旧密码” password“新密码”     #命令行界面
alter user root@localhost identity by “新密码”   #sql界面 identified
```

​	2）恢复密码
​		a）停服务
​		b）修改配置文件：/etc/mycnf  --->添加：skip-grant-tables #跳过配置文件启服务
​		c）启动服务：密码策略不能有修改
​		d）修改mysql.user表的authentication-string的密码字段			

```mysql
update mysql.user set authentication-string=password(“新密码”) where user=”root”;   
#修改user表后需要刷新：flush privileges ; 
```

### 14、数据的备份与恢复

​	1）物理备份：tar，cp （需要注意文件权限）-->跨平台性差，时间长，占空间
​	2）完全备份：命令行界面--->效率低，锁表<备份时不允许修改>

```mysql
mysqldump -uroot -p”mima” 库名.表 >  /xxx.sql   #备份
#可加选项： -A:全部  -B：接多个数据库 
mysql -uroot -p “mima” [库名]  <  /xxx.sql     #恢复
```

​	3）增量备份
​		a）启用binlog日志		  

```mysql
show master status;  #查看binlog日志是否启动
cat /etc/my.cnf 
    log_bin=/mylog/db50               #指定binlog日志文件路径及日志文件开始的名字
    server_id=50                 #ID号，一般用ip地址末位
    max_binlog_size=1G               #默认1G
重启服务和flush logs 都可以直接增加日志文件
 mysqlbinlog  目录          #可以查看binlog日志内容
```

​		b）清除日志

```mysql
purge master logs to “日志编号”;   #清楚编号之前的所有日志，不含本身
reset master;       #清楚所有日志并生成第一个日子文件呢
```

​	4）恢复数据	

```mysql
a）mysqlbinlog 日志文件 | mysql -uroot -p密码  #恢复备份日志中所有内容
b）mysqlbinlog  [选项] 日志文件 | mysql -uroot -p密码  #指定范围|偏移量恢复
	指定时间范围： --start-datetime=”xxxx/xx/xx hh:mm:ss”--stop-datatime=” ”
	指定偏移量： 	 --start-position=”编号”  --stop-position=”编号”
```

​	5）日志记录格式：statement报表模式|row行模式|mixed混合模式
​	   通过配置文件修改：/etc/my.cnf --->binlog_format=mexed|row|stateemnt

### 15、percona软件：在线热备份工具

​	1）安装软件包：
​		percona-xtrabackup-24-2.4.7-1.el7.x86_64.rpm       	libev-4.15-1.el6.rf.x86_64.rpm
​	2）完全备份与恢复
​		a）备份：

```mysql
innobackpex --user root --password 密码 /allbak --no-timestamp
#/allbak--->指定存储备份文件路径  
#--no-timestamp--->不适用时间戳做目录
```

​		b）恢复：		   

```mysql
innobackpex --apply-log  /allbak   #准备恢复
innobackpex --copy-back  /allbak  #执行恢复  
```

​	3）恢复单张表		

```mysql
a）alter table db5.b discard tablespace;              #删除表空间
b）innobackpex --apply-log --export /allbak           #导出表信息
c）cp /allbak/db5/b.{cfg,ibd,exp} /var/lib/mysql/db5  #拷贝表信息到数据库目录
d）chown -R mysql:mysql /var/lib/mysql/db5            #修改对应的所有者所属组
e）alter table db5.b import tablespace;               #导入表空间
f）rm -rf /var/lib/mysql/db5/b.{cfg,exp}              #删除数据库下的表信息文件 
```

​	4）增量备份：
​		a）备份：			

```mysql
innobackex --user root --password 密码 /allbak --no-timestamp  #全备份
innobackex --user root --password 密码 --incremental /new1bak incremental-basedir=/allbak  --no-timestamp
#/new1bak  增量备份文件目录
#/allbak  上一次备份文件目录
```

​		b）恢复：		  

```mysql
innobackpex --apply-log --redu-only /root/allbak   #完全恢复
innobackpex --apply-log --redu-only /root/allbak --incremental-dir=/root/new1bak #合并日志
innobackpex --apply-log --redu-only /root/allbak --incremental-dir=/root/new2bak
innobackupex --copy-back /root/allback   #拷贝备份文件到数据库目录
```

------

## 十一、MySQL-进阶

### 1、mysql主从同步的部署

​	1）主服务器配置
​		a）启动binlog日志：

```mysql
cat /etc/my.cnf
log_bin=master51  
server_id=51
```

​		b）赋予从服务器到本机同步数据的权限			 

```mysql
grant replication slave on *.* to repluser@”%” identified by “123qqq...A”;
```

​	2）从服务器配置
​		a）指定server_id=52
​		b）同步主服务器的数据

```mysql
mysqldump -uroot -pmima master-data -A > /root/all.sql #主服务器完全备份 
mysql -uroot -pmima < /root/all.sql                    #拷贝到从服务器并恢复数据
```

​		c）指定主服务器信息

```mysql
change master to master_host=”192.168.4.51”,\            #指定主服务器
master_user=”repluser”, \                       #指定连接主服务器用户
master_password=”mima”; \                       #指定连接主服务器密码
master-log_file=”master51.000001”, \            #从哪个binlog同步数据
master_log_pos=441;                             #从偏移量441开始同步数据
```

​		d）启动从服务器：

```mysql
start slave;
--->show slave status;  #可查看从服务器详细情况
```

​		e）还原从服务器为独立服务器			  			  

```mysql
清除数据库目录下的从服务器配置文件---->重启mysql即可
rm -f master.info mysql52-relay-bin-*  relay-log.info
```

​	3）常见的主从结构
​		  一主多从，互为主从
​		  互为主从时需要打开级联复制：log_slave_updates

### 2、复制模式：

​				异步复制和半同步复制(至少一一台同步数据)	
​	1）安装模块(主master|从slave)

```mysql
a）命令行：install pligin rpl_semi_sync_master SONAME semisync_master.so
b）配置文件：plugin-load=rpl_semi_sync_master=semisync_master.so
```

​	2）启用模块

```mysql
a）命令行：set global rpl_semi_master_enabled=1
b）配置文件：rpl_semi_master_enabled=1
```

​	3）查看模块启用安装情况

```mysql
a）安装：
	select plugin_name，plugin_status from infomation_schema.plugins where plugin_name like “%semi%”;
b）启用：
	show variables like “%enabled%”;
```

### 3、maxscale：数据的读写分离

​	1）安装软件包：maxscale(rpm包)
​	2）配置一组主从结构
​	3）修改maxscale代理服务器配置文件：vim /etc/maxscale.cnf		

```mysql
[maxscale]      
threads=auto                  #运行的线程的数量
       
[server1]                     #定义数据库服务器
address=192.168.4.51          #主服务器ip
  ......      
[server2]      
address=192.168.4.52          #从服务器IP
  ......      
[MySQL Monitor]               #定义监控的数据库服务器
servers=server1, server2      #监控的数据库列表，不能写ip
user=abc                      #监控用户
passwd=123qqq...A             #密码
  ......
[Read-Write Service]          #定义读写分离服务
servers=server1, server2
user=abd                      #路由用户
passwd=123qqq…A               #密码
  ...... 
[MaxAdmin Service]            #定义管理服务
......
[Read-Write Listener]         #定义读写服务使用的端口号
port=4006
  ......
[MaxAdmin Listener]           #管理服务使用的端口号
port=4016                     #手动添加，不指定时使用的是默认端口在启动服务以后可以知道默认端口是多少
```

​	4）添加授权用户(主服务器上添加--->自动同步到从服务器)

```mysql
mysql>grant replication slave,replication client on *.* to wxl1@"%" identified by "123qqq...A";  #授权监控用户
mysql> grant select on mysql.* to wxl2@"%" identified by "123qqq...A";             # 授权路由用户
```

​	5）查看授权用户并启动maxscale服务

```mysql
mysql> select user,host from mysql.user 
maxscale -f /etc/maxscale.cnf  #启服务
```

​	6）查看读写分离状态信息			 

```mysql
maxadmin -uadmin -pmariadb -P4006 
list servers
```

​	7）客户端访问	    

```mysql
mysql -h192.168.4.57 -P4006 -uyaya -p123qqq...A
```

### 4、mysql多实例：

​							---> 一台服务器运行多个mysql数据库
​	1）安装软件包：mysql-5.7.20（源码包）
​	2）创建并配置/etc/my.cnf	  	

```mysql
[mysqld_multi]                              #启用多实例
mysqld=/usr/local/mysql/bin/mysqld_safe              #指定进程文件路径
mysqladmin=/usr/local/mysql/bin/mysqldadmin             #指定管理命令路径
user=root                                   #指定进程用户

[mysqld1]
datadir=/dir1                #数据库目录
port=3307                    #使用端口号
log-error=/dir1/mysqld1.error               #日志信息
pid-file=/dir1/mysqld1.pid                   #pid号
socket=/dir1/mysqld1.sock                    #socket文件
[mysqld2]              ------>书写格式同mysqld1
```

​	3）启动、停止、查看、登录服务		  

```mysql
启动：mysqld_multi start 1
停止：mysql_multi --user root --password mima stop 1
查看：ss -nutlp | grep mysqld 
登录：mysql -uroot -pmima -S /dir/mysqld1.sock
```

### 5、mycat服务：数据分片、读写分离

​	            ---> 分布式存储数据，适合大量写入的存储需求，提供数据分片服务
​	1）安装软件包：源码包mycat  依赖包：java-1.8.0-openjdk
​	2）修改配置文件：
​		a）/usr/local/mycat/conf/server.xml  可以保持不变，使用默认配置
​		b）/usr/local/mycat/conf/schema.xml（标注的可以修改添加）	     

```xml
 ......    #建的表和存几个库
<dataNode name="dn1" dataHost="mysql53" database="db1" />
......    #库对应的数据库名字和主机名字
<dataHost name="mysql53" maxCon="1000" minCon="10" balance="0"
 writeType="0" dbType="mysql" dbDriver="native" switchType="1"  slaveThreshold="100">
  <heartbeat>select user()</heartbeat>
  <writeHost host="hostM1" url="192.168.4.53:3306"
  user="pljadmin" password="123qqq...A"  </writeHost>
</dataHost>    
......     #指定数据库服务器ip名字,授权用户信息等
```

​	3）创建存储数据的库（db1,db2,db3）			

```mysql
[root@mysql53 ~]# mysql -uroot -p123qqq...A -e 'create database db1'
```

​	4）创建授权用户（存储数据库）			

```my
grant all on *.* to pljadmin@"%" identified by "123qqq...A"数据分片规则的使用
```

​	5）数据分片规则的使用
​		a）枚举法（横向分）			 

```xml
 sharding-by-intfile 字段"值" (必须在 规则文件  定义的值里  选择)
查看使用枚举法存储数据的表名 --->schema.xml
查看表的分片字段名--->建表时必要要有--->rule.xml
<tableRule name="sharding-by-intfile"> 
<function ......>partition-hash-int.txt</function>
#分片规则配置文件位置--->vim conf /partition-hash-int.txt 根据需要修改配置
#注意：1修改完成需要重启服务 2录入数据时需写字段名
```

​		b）求模法（横向分）			  

```xml
查看使用求模法存储数据的表名--->schema.xml
查看表的分片字段名--->建表时必要要有--->rule.xml
<tableRule name="mod-long"> 
	 --->根据存储数据库修改数字
注意：1修改完成需要重启服务 2分片字段名与ID重名时需要修改
```

​		c）添加新库.新表			  

```xml
修改server.xml文件
	<property name="schemas">TESTDB,BBSDB</property>  ---->添加新库名
修改schema.xml文件
	 <schema name="BBSDB" checkSQLschema="false" sqlMaxLimit="100">
 	  <table name="user" dataNode="dn1,dn2,dn3" rule="mod-long" />
  	  <table name="pay" dataNode="dn1,dn2,dn3" type="global"  />

    	 ---->添加新表
测试配置    
```

### 6、MHA服务：高可用集群

​	  1）配置ssh无密登录
​	  2）安装依赖包

```shell
 cd /myfile/mha
 yum -y install perl-*
```

​	   3）配置数据库的一主多从结构
​	   4）装包：先装node 
​				---->manager（perl Makefile.PL）
​				perl-DBD-MySQL perl-DBI perl-ExtUtils-CBuilder perl-ExtUtils-MakeMaker cpan
​	   5）编写配置文件：cp samples/conf/app1.cnf /etc/mha/---> vim /etc/mha/app1.cnf 			

```shell
[server default]
manager_workdir=/etc/mha   #配置文件目录
manager_workdir=/etc/mha     #服务目录
manager_log=/etc/mha/manager.log   #日志目录
master_ip_failover_script=/etc/mha/master_ip_failover  #故障切换脚本

ssh_user=root     #免密登录
ssh_port=22
repl_user=repluser   #主从同步授权用户
repl_password=123qqq...A
user=root    #监控用户

password=123qqq...A
[server1]      #第一台数据库服务器
hostname=192.168.4.51  #主机地址
candidate_master=1    #参与竞选主服务器
port=3306       #服务端口
		...............
```

​	6）创建故障切换脚本：模板samples/scripts/master_ip_failover	 	

```shell
vim /etc/mha/master_ip_failover（35-38）
my $vip = '192.168.4.100/24';  # Virtual IP                    #定义VIP地址
my $key = "1";                                                 #定义变量$key
my $ssh_start_vip = "/sbin/ifconfig ens33:$key $vip";          #部署vip地址命令
my $ssh_stop_vip = "/sbin/ifconfig ens33:$key down";           #释放vip地址命令
chmod +x /etc/mha/master_ip_failover                           #给脚本加执行权限
```

​	7）在主从的主服务器部署VIP：ifconfig ens33:1 192.168.4.100/24
​	8）在主从服务器上启用半同步复制，添加监控用户授权	 

```shell
vim /etc/my.cnf
plugin-load=”rpl_semi_sync_master=semisync_master.so;
rpl_semi_sync_slave=semisync_slave.so;”
rpl_semi_sync_master_enabled=1
rpl_semi_sync_slave_enabled=1
grant all on *.* to root@”%” identified by “123qqq...A”          #添加监控用户root
```

​	9）检测配置并启动服务
​		a）检测：mha之间也需要免密ssh		  	

```shell
masterha_check_ssh|repl|status  --conf=/etc/mha/app1.cnf
#检测ssh免密|数据同步|服务状态
```

​		b）启服务：	

```shell
masterha_manager --conf=/etc/mha/app1.cnf 
--remove_dead_master_conf        #删除宕机主库的配置 
--ignore_last_failover             #关闭8小时故障不切换
```

​	10）恢复故障数据库
​		a）同步最新数据---->innobackupex|mysqldump
​		b）配置故障是服务器为当前主服务器的从服务器
​		c）在mha服务配置文件中重新加人本机配置
​		d）重启服务

### 7、PXC高可用集群

   1）安装软件包

```mysql
cd /myfile/pxc
yum -y install *
```

   2）修改配置文件：/etc/percona-xtradb-cluster.conf.d
    a）数据库运行参数配置文件：mysqld.cnf--->修改server_id
    b）percona server 配置文件：mysqld_safe.cnf--->使用默认配置
    c）集群配置文件：wsrep.cnf				

```shell
wsrep_cluster_address=gcomm://192.168.4.71,192.168.4.72,192.168.4.73    #成员列表 
wsrep_node_address=192.168.4.71       #本机ip  
wsrep_cluster_name=pxc-cluster        #集群名
wsrep_node_name=pxcnode71             #本机主机名
wsrep_sst_auth="sstuser:123qqq...A"   #SST数据同步授权用户及密码
```

   3）初始化集群服务：

```shell
systemctl start mysql@bootstarap.service
```

   4）用初始密码登录并修改密码
   5）添加授权用户

```mysql
grant reload,lock table,replication client,process on *.* sstuser@”localhost” identified by “123qqq...A”
show status like “%wsrep%”;   #可查看当前集群信息
#注意事项：PXC建表时需要有主键，否则在录入数据时会报错
```

### 8、MySQL存储引擎

​	1）查看及修改存储引擎	       

```mysql
show enfines;                  #查看服务的存储引擎有哪些
show create table db1.a;       #查看当前表使用的存储引擎
create table db1.a( id int)engine=memory;  //建表时设置
alter table db1.a engine=innodb;  //修改已有表
```

 	2）innodb引擎和myisam引擎的区别
 		  innodb：支持行级锁（进队访问行锁），事务，事务回滚，外键
 		  myisam：支持表级锁（所整张表），不支持事务，事务回滚，外键
 		  读锁（共享）：支持并发（select）
 		  写锁（独占）：update、insert、delete
 	3）事务的特点：
 	   原子性、一致性、隔离性、持久性

```mysql
show variables like “autocommit”;    #查看当前提交状态
set autocommit=off|on;              #修改提交状态
rellback;                    #回滚数据到之前操作
commit;                #提交数据
```

------

## 十二、NOSQL：非关系型数据库

### 1、常见的nosql：

​			memcached redis mogodb couchdb neo4i flcokdb

### 2、redis

​			远程字典服务器(www.redis.cn),分布式内存数据库
 1）安装软件包：gcc redis源码包（不用编译）
 2）运行源码包中uitls/install.server.sh进行初始化服务
 3）/etc/init.d/redis_6379 status|start|stop 查看|启动|关闭服务
 4）Redis常用命令

```shell
   ping --->pong 说明可用
   keys |?|a?  #查看变量（可用通配符）
   set|mset  get|mget  #（单个|多个）存储和读取变量
   exists       #测试是否存在
   expire      #设置有效时间  ttl  剩余有效时间
   type       #查看类型
   move       #移动到指定库
   select     #切换到指定库（0-15）
   save       #保存到硬盘
   del|flushdb|flushall  #删除单个|库|所有 
   shutdown  #命令行下停止服务
```

 5）修改端口和设置登录密码
   a）修改配置文件：/etc/redis/6379.conf 	    

```shell
bind 192.168.4.50
port 6350
requirepass 123456
```

   b）停止服务	   

```shell
redis-cli -h 192.168.4.50 -p 6350 -a 123456 shutdown  #命令行下
$CLIEXEC -h 192.168.4.50 -p 6350 -a 123456 shutdown  #修改脚本
```

​	c）登录数据库 		  

```shell
redis-cli  -h 192.168.4.50 -p 6350 -a 123456
redis-cli  -h 192.168.4.50 -p 6350 --->auth 123456
```

### 3、部署LNMP+Redis服务

​	1）部署lnmp环境
​	2）配置PHP支持Redis
​		a）软件包：php-devel  automake  autoconf
​		b）安装源码包：php-redis

```shell
cd  php-redis
phpize   #生成configure
./configure  --with-php-config=/usr/bin/php-config
make && make install
```

​	3）修改PHP配置文件：/etc/php.ini

```php
extension_dir = "/usr/lib64/php/modules/"  #728行--->指定模块安装路径
extension = "redis.so"    #730行--->模块名
```

​	4）修改配置文件/etc/php-fpm.d/www.conf --->实现Session共享	 

```php
php_value[session.save_handler] = redis  #指定存储服务器为redis
php_value[session.save_path] = "tcp://192.168.1.31:6379"  #指定redis地址
```

​	5）启动服务进行测试

### 4、Redis集群：6服务器+1管理主机

​	1）安装Redis服务并修改配置文件：/etc/redis/6379.conf		  

```shell
bind 192.168.4.51    #连接主机地址
port 6351           #端口号
cluster-enabled yes  #启用集群功能
cluster-config-file nodes-6379.conf  #存储集群信息的配置文件
cluster-node-timeout 5000   #集群节点通信超时时间
```

​	2）配置管理主机
​		a）准备运行环境

```shell
yum -y install ruby rubygems
gem install redis-3.2.1.gem(源码包)
```

​		b）创建ruby脚本

```shell
mkdir /root/bin
cp src/redis-trib.rb /root/bin/  #拷贝源码包中的脚本
chmod +x /root/bin/redis-trib.rb  #赋予执行权限
```

​	3）创建集群		 

```shell
redis-trib.rb create --replicas 1 192.168.4.51:6351 .......
redis-trib.rb info|check 192.168.4.51:6351             #查看集群信息
redis-cli -c -h 192.168.4.51 -p 6351               #客户端访问集群及存储数据
cluster info                  #查看集群信息
cluster nodes                 #查看集群成员列表
/var/lib/redis/6379/             #集群配置信息存放位置
```

​	4）集群主机操作
​		a）添加master主机			  

```shell
redis-trib.rb add-node 192.168.4.58:6358 192.168.4.51:6351
```

 		b）添加slave主机		 

```shell
 redis-trib.rb add-node --slave ip:port [--master-id id值]-->指定主
```

​		c）重新分片		  

```shell
redis-trib.rb reshard 192.168.4.51:6351
How many slots do you want to move (from 1 to 16384)? 4096   #移除槽个数
What is the receiving node ID? 4361720c3978aa02347076218580a103c60a6d7f  #接收槽主机id 
Please enter all the source node IDs.
Type 'all' to use all the nodes as source nodes for the hash slots.
Type 'done' once you entered all the source nodes IDs.
Source node #1:e081313ec843655d9bc5a17f3bed3de1dccb1d2b  #移除槽主机的id 
Source node #2:done  #结束主机id 的填写
Do you want to proceed with the proposed reshard plan (yes/no)? yes  #同意以上配置
```

​		d）移除主机（master主机移除前需要释放hash值）			 

```shell
redis-trib.rb del-node 192.168.4.54:6354 删除主机ID值
```

​		e）重新添加移除主机需要清除配置：				

```shell
rm -rf /var/lib/redis/6379/
```

### 5、主从复制

​	1）添加从服务器			 

```shell
slaveof 192.168.4.51 6351  #添加当前主机为51的从
slave no one  #恢复为独立服务器
```

  2）密码验证：
	    a）配置文件

```shell
requirepass 123456  #501行
masterauth 123456  #289行
```

​	    b）命令行	       

```shell
config set requirepass 123456
config set masterauth 123456
config rewrite  #可写入配置文件  
info replication  #查看主从复制信息
```

### 6、哨兵服务

​	1）搭建主从从结构
​	2）配置哨兵服务:安装Redis--->创建/etc/sentinel.conf配置文件		  

```shell
bind 192.168.4.56|0.0.0.0  #哨兵服务地址（表示本机所有网络接口）
port 26379  #可自定义
sentinel monitor redisserver 192.168.4.51 6351 1 #监视主服务器
sentinel auth-pass redisserver 123456  #主服务器密码
```

​	3）启服务：redis-sentinel /etc/sentinel.conf  

### 7、reids数据类型

​           ---> 字符、列表、hash表、集合、有序集合

​	1）字符list			

```shell
set|setrange|append               #为变量赋值|改写已有变量值|在已有变量值后追加 
get|getrange|mget               #查看变量值 
strlen                       #统计变量值个数
decr|decrby                  #自减1|自定义
incr|incrby|incrbyfloat      #自加1|自定义|小数
setbit|bitcount              # 位存储|统计变量值里1的个数（值只能是0或1）
```

​	2）push列表类型		 

```shell
lpush|lrange  #为变量存储多个值|查看多个值得变量--->遵循先进后出原则
lset    #修改变量的第n个值
rpush   #插入队尾
lpop|rpop  #删除对头|删除队尾
index   #返回变量的第n个值
```

​	3）hash表	 

```shell
hset|hmset|  #为变量的多个列赋值
hget|hmget|hgetall|hvals   #返回变量的多个列的值
```

### 8、数据持久化

​	1）RDB：默认持久化方式
​		a）rdb文件的备份与恢复
​		 		 停服务(清除原有dump.rdb)--->cp dump.rdb--->启服务
​		b）优化配置：
​				 save 60 10--->一分钟且有10个key改变即存盘
​		       手动存盘：save|bgsave --->阻塞|不足塞存盘
​		c）RDB的优缺点
​			  优：高性能的持久化实现，临时--->dum.rdb,主进程不参与存盘操作
​			  缺：意外宕机是，丢失最后一次持久化的所有数据
​	2）AOF：以追加的方式记录写操作的文件，默认不启用
​		a）启用AOF			  

```shell
config set appendonly yes
config rewrite
```

​		b）可通过appendonly.aof进行备份与恢复
​		c）AOF的三种读写操作方式			 

```shell
appendfsync always  #时时记录并完成磁盘同步
appendfsync everysec  #每秒并完成磁盘同步(默认)
appendfsync no  #写入aof，不执行磁盘同步
```

​		d）触发日志重写配置

```shell
auto-aof-rewrite-min-size  64mb   #首次重写触发值
auto-aof-rewrite-percentage 100   #再次重写增长百分比
```

​		e）修复aof文件			 

```shell
redis-check-aof --fix  /var/lib/redis/6379/appendonly.aof
```

​		f）AOF的优缺点
​			  优：可以灵活设置持久化方式，出现宕机，尽可能丢失1s的数据
​			  缺：持久化文件通常比RDB大，执行fsync时可能比RDB慢

------

# 第四阶段

## 十三、CLOUD

------

### 1、kvm环境搭建

​	1）软件包安装：
​			qemu-kvm  libvirt-client  libvirt-daemon  libvirt-daemon-driver-qemu
​	2）启服务：
​		   Systemctl start libvirtd
​		   虚拟配置文件：/etc/libvirt/qemu
​		   存储文件：/var/lib/libvirt/images
​	3）磁盘管理命令：

```shell
qemu-img  create   创建虚拟机磁盘
qemu-img  info     查看虚拟机磁盘信息
qemu-img  convert  转换虚拟机磁盘信息
```

​	4）虚拟网络管理命令：		  

```shell
vrish  net-list --all     #列出虚拟网络
vrish  net-start          #启动虚拟交换机
vrish  net-destory        #强制停止虚拟网络
vrish  net-define|undefine    #创建|删除虚拟网络
vrish  net-edit           #修改虚拟交换机配置
vrish  net-autostart      #开机自启动
```

​	5）虚拟机管理命令：
​		   

```shell
vrish  list --all             #列出虚拟机
vrish  define|undefine        #创建|删除虚拟机
vrish  start|shutdown|reboot  #启动|停止|重启虚拟机
vrish  ttyconsole             #显示终端设备
vrish  virsh console          #连接一个已经运行的虚拟机console
```

### 2、使用模板创建虚拟机

​	1）创建硬盘文件：/var/lib/libvirt/images	   	 

```shell
 qemu-img create -b cirros.img -f qcow2 vmhost.img
```

​	2）创建虚拟交换机:/etc/libvirt/qemu/networks		   

```xml
vim /etc/libvirt/qemu/networks/vbr.xml
  <network>
    <name>vbr</name>
    <forward mode='nat'/>
    <bridge name='vbr' stp='on' delay='0'/>
    <ip address='192.168.100.254' netmask='255.255.255.0'>
      <dhcp>
         <range start='192.168.100.100' end='192.168.100.200'/>
      </dhcp>
    </ip>
  </network>
virsh net-define vbr.xml
```

​	3）修改配置文件：cp  node_base.xml--->vmhost.xml位置随意		

```xml
<name>vmhost</name>     #虚拟机的名字
   <source file='/var/lib/libvirt/images/vmhost.img'/>  #虚拟机硬盘文件
   <vcpu placement='static'>2</vcpu>    #虚拟机cpu个数
   <memory unit='KB'>2200000</memory>      #虚拟机的内存 2G
   <currentMemory unit='KB'>2200000</currentMemory>
<source bridge='vbr'/>        #虚拟交换机是...
```

​	4）创建虚拟机：vmhost.xml文件位置需要指定和第三步相同	 	  

```shell
virsh define vmhost.xml
```

### 3、私有云OpenStack服务搭建

​				---> openstack1台+nova2台和1台功能服务器
​	1）配置静态ip地址--->网卡名一般设为eth0
​	2）禁用selinux、防火墙、NetworkManger（卸载）network设置开机自启
​	3）功能服务器配置
​	a）搭建时间服务器		

```shell
server ntp.aliyun.com iburst
bindacqaddress 0.0.0.0
allow 0/0
local stratum 10
```

​	b）配置网络yum仓库	    

```shell
mkdir  /var/ftp/{extras,openstack}
mount -t iso9660 -o ro,loop /var/iso/RHEL7-extras.iso /var/ftp/extras
mount -t iso9660 -o ro,loop /var/iso/RHEL7OSP-10.iso /var/ftp/openstack
```

​	4）修改/etc/hosts和域名查询服务/etc/resolv.conf	    

```shell
192.168.1.10openstack
192.168.1.11nova01
192.168.1.12nova02
192.168.1.250 repo
/etc/resolv.conf--->search 开头的行必须删除
```

​	5）在openstack主机上安装软件包	   

```shell
  openstack-packstack python-setuptools libvirt-client<产生virsh命令>
```

​	6）在nova主机上安装软件包	   

```shell
qemu-kvm libvirt-daemon libvirt-daemon-driver-qemu libvirt-client python-setuptools
systemctl enable libvirtd
```

​	7）生成配置文件并修改	   

```shell
packstack --gen-answer-file=answer.ini
42 45 49 53=n  <存储对象和计费模块>
75  时间服务器
98  管理节点--->openstack
102 计算节点--->openstack和nova
333 管理员密码
840 支持协议
910 网桥设备
921 出口网卡
1179  =n 演示模块
```

​	8）执行安装	  		

```shell
packstack --answer-file=answer.ini
```

​	9）初始化环境变量		   

```shell
source keystonerc_admin
openstack project create myproject  创建用户myproject
```

### 4、私有云管理

​	1）项目创建：身份管理--->项目--->创建项目		   

```shell
openstack project create|delete tedu  创建|删除项目tedu
openstack project list   查看项目
```

​	2）用户创建：身份管理--->用户--->创建用户		  

```shell
openstack user create --password xxx uu   用户uu密码xxx
openstack user list     查看用户
openstack user delete uu  删除用户
openstack userset --password aaa uu 修改密码为aaa
```

3）云主机创建：管理员--->创建云主机类型 	  

```shell
openstack flavor create --public myos --id auto --ram 512 disk 10 vcpus 1
```

4）镜像创建：  	 

```shell
openstack image create --disk-format qcow2 --file /root/small.img RedHat-6
```

5）外部网络wan创建：不DHCP分配
	   管理员--->网络--->创建网络（网络类型flat）
	   子网--->创建子网
6）内部网络lan创建：需要DHCP分配
   		需要配置dns和主机dns相同
7）添加路由--->路由接口
8）创建云主机
9）浮动ip与安全组
  		 浮动ip用于从外界访问虚拟机实例

### 5、华为云

​	1）购买虚拟私有云
​	2）购买弹性云服务器
​	3）购买弹性公网IP
​	4）华为yum源下载：curl -o /etc/yum.repos.d/CentOS-Base.repo    http://mirrors.myhuaweicloud.com/repo/CentOS-Base-7.repo

### 6、Docker安装

​	1）在跳板机布置yum仓库

```shell
cp /file/kubernetes/docker/* /var/ftp/localrepo
createrepo --update /var/ftp/localrepo
```

​	2）在所有节点配置路由转发		   

```shell
vim /etc/sysctl.conf
	net.ipv4.ip_forward=1
sysctl -p  刷新配置
```

​	3）安装软件包		   

```shell
yum remove firewalld*
yum makecache
yum -y install docker-ce
```

​	4）修改默认规则

```shell
vim /usr/lib/systemd/system/docker.service
		  ExecStartPost=/sbin/iptables -P FORWARD ACCEPT
systemctl daemon-reload --->start--->enable
```

​	5）验证：docker version
​	6）Docker镜像管理命令（使用镜像名称：标签）		   

```shell
docker images  #查看本机镜像
docker search  #查找镜像（官方仓库）
docker pull    #下载镜像
docker push    #上传镜像
docker rmi     #删除镜像（先删除容器）
docker save centos:latest -o centos.gz #备份镜像
docker load -i centos.gz  #恢复镜像
docker history            #镜像制作历史
docker inspect            #镜像详细信息
docker tag 名称:标签  新名称:新标签 
```

​	7）容器管理命令（使用容器ID）		   

```shell
docker run -it --name myos centos:latest   #启动命令(it:交互式itd:非交互式)  
docker ps  #正在运行的容器(-a显示所有 -q只显示ID)
docker rm  #删除容器(-f 强制删除)
docker inspect #查看详细信息
docker start|stop|restart   #启动|停止|重启容器
docker top #查看容器内运行的进程
docker attch   #进入容器(只能交互式且退出时会关闭容器)
docker exec -it ID /bin/bash  #进入容器的只要维护命令
docker cp 本机地址 容器ID:路径    #上传(反之则下载)
docker stop $(docker ps -q)   #停止所有容器
docker rm $(docker ps -aq)   #删除所有容器
```

​	8）自定义镜像
​		a）创建容器：

```shell
docker run -it centos:latest
```

​		b）配置容器：添加需要的东西
​		c）创建自定义镜像：

```shell
docker commit 容器ID 新镜像名称:标签
```

​	9）Dockerfile编写格式		  

```dockerfile
docker build -t 新镜像名字:标签 Dockerfile文件目录  ---->自定义镜像
vim Dockerfile---> FROM   基础镜像
   RUN    在容器内运行的命令
   COPY|ADD   把当前文件拷贝到容器|自动解压 
   CMD    默认启动命令  
   ENV     设置容器启动后的环境变量
   WORKDIR  切换目录（相当于cd）
   EXPOSE   声明开放的端口 
```

​	10）对外发布容器服务	   		 

```shell
docker run -itd --name httpd -p 80:80 myos:httpd
```

​	11）容器卷共享：映射主机文件或目录到容器中（有则覆盖）			

```shell
docker run -itd --name httpd -p 80:80 -v /tmp/http.conf:/etc/httpd/conf/httpd.conf  -v /tmp/abc:/var/www/html/  myos:httpd ---> -v可以有多个
```

​	12）私有仓库搭建
​		a）安装软件包：docker-distribution
​				数据存储路径：/var/lib/registry/
​				配置文件： /etc/docker-distribution/registry/config.yml 
​				查看：curl http://192.168.1.100:5000/v2/_catalog
​		b）Docker客服端配置文件书写：				 

```dockerfile
vim /etc/docker/daemon.json 
	{
	    "exec-opts":["native.cgroupdriver=systemd"],
	    "registry-mirrors":["http://hub-mirror.c.163.com"],   
	    "insecure-registries":["192.168.1.100:5000","registry:5000"]
	}
重启服务后用：docker info 查看修改情况
```

​		c）为镜像创建标签后上传：latest标签缓存无效

```shell
docker tag myos:latest 192.168.1.100:5000/myos:v1804   
docker push 192.168.1.100:5000/myos:v1804
```

​		d）查看仓库镜像			  

```shell
curl http://192.168.1.100:5000/v2/_catalog  查看镜像
curl http://192.168.1.100:5000/v2/myos/tags/list 查看镜像标签
```

​		e）下载或直接使用仓库镜像

```shell
docker pull 192.168.1.100:5000/myos:httpd
docker run -it 192.168.1.100:5000/myos:v1804
```

​		f）需要在所有节点开启路由功能

### 7、kubernetes<k8s>搭建

​	1）安装master节点：apiserver,scheduler,controller manger,ectd服务
​		a）软件包：kubeadm kubectl kubelet docker-ce<1.17版本>
​		b）书写json文件：vim /etc/docker/daemon.json
​		c）修改内核参数：vim /etc/sysctl.d/k8s.conf				    

```shell
net.bridge.bridge-nf-call-ip6tables=1
net.bridge.bridge-nf-call-iptables=1
net.ipv4.ip_forward=1
      添加模块并应用：
modprobe br_netfilter
sysctl --system
```

​		d）配置私有镜像仓库：恢复-->打标签--->上传仓库			   

```shell
docker push 192.168.1.100:5000/kube-proxy:v1.17.6
docker push 192.168.1.100:5000/kube-controller-manager:v1.17.6
docker push 192.168.1.100:5000/kube-apiserver:v1.17.6 
docker push 192.168.1.100:5000/kube-scheduler:v1.17.6 
docker push 192.168.1.100:5000/coredns:1.6.5 
docker push 192.168.1.100:5000/etcd:3.4.3-0 
docker push 192.168.1.100:5000/pause:3.1 
```

​		e）设置Tab键自动补全:退出终端再进生效			  

```shell
cd /etc/bash_completion.d/
kubectl completion bash > kubectl
kubeadm completion bash > kubeadm
```

​		f）安装ipvsadm和ipset软件包
​		g）使用配置文件初始化:kubeadm init --dry-run--->根据报错信息解决错误
​			   修改/etc/hosts 文件
​			   systemctl enables --now docker kubelet
​		h）生成并修改配置文件：			   

```dockerfile
kubeadm config print init-defaults > kubeadm-init.yaml
   06  ttl: 24h0m0s    token生命周期
   12  advertiseAddress: 192.168.1.21    apiserver地址
   32  imageRepository: 192.168.1.100:5000   镜像仓库地址
   34  kubernetesVersion: v1.17.6   当前版本信息
   36  dnsDomain: cluster.local  默认域名地址（工作环境以实际域名为准）
   37  podSubnet: 10.244.0.0.16  新插入的行，容器地址cidr
   37  serviceSubnet: 10.254.0.0/12   服务地址cidr--->service
        ---                     文件末尾添加
        apiVersion: kubeproxy.config.k8s.io/v1alpha1
        kind: KubeProxyConfiguration
        mode: ipvs  
    kubeadm config print init-defaults  --component-configs=KubeProxyConfiguration    #可查看默认语法配置
```

​		i）安装master		  		  

```shell
kubeadm init --config=kubeadm-init.yaml | tee master-init.log
```

​		j）启动并验证				  

```shell
kubectl get componentstatuses
kubectl version
```

​	2）配置node节点：docker,kubelet,kube-proxy 服务
​		a）安装软件包：yum -y install kubeadm kubelet docker-ce
​		d）书写json文件:/etc/docker/daemon.json
​		c）修改内核参数并启用模块：vim /etc/sysctl.d/k8s.conf
​		b）卸载firewalld*
​		e）关闭swap和selinux
​		f）安装ipvsadm和ipset软件包
​		g）书写/etc/hosts
​		h）添加节点：
​			   在master端			   	 	

```shell
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outfrom der | openssl dgst -sha256 -hex			kubeadm token create --ttl=0 --print-join-command
```

​			   在node端--->kubeadm reset ---> 可以重复录入来排错			        

```shell
kubeadm join 192.168.1.21:6443 --token abcdef.0123456789abcdef  --discovery-token-ca-cert-hash
```

 		i）安装flannel网络插件--->在master端 ---->不同主机内的容器实现互通			  

```yml
下载并上传flannel文件到仓库
修改文件：kube-flannel.yml
	128   "Network": "10.244.0.0/16",       #pod网络
	172   image: 192.168.1.100:5000/flannel:v0.12.0-amd64  #镜像仓库地址
	186   image: 192.168.1.100:5000/flannel:v0.12.0-amd64
	227-结尾：删除
kubectl apply -f kube-flannel.yml
kubectl get nodes    查看节点是否为Ready状态
```

​	3）k8s常用命令			   

```shell
kubectl  控制kubernetes集群的命令工具--->只能在master上运行
kubectl -n kube-system get pod -o wide     #查询所有容器程序安装情况，主机信息
kubectl -n kube-system get pod -o yaml     #显示资源yaml格式
kubectl -n kube-system describe 容器名字     #查看对应容器资源情况	 
```

​    	a）kubectl get 类型 名称 ----->查询资源		   		

```shell
类型：deployments.apps|replicasets.apps|pod
```

​		b）kubectl run ---->创建容器				

```shell
kubectl run haha -i -t --image=192.168.1.100:5000/myos:v1804  
kubectl exec -it pod名称  --/bin/bash ---->进入容器
kubectl attach haha-7f5c65f7c7-77rgd -c haha -i -t  进入容器
```

​	    c）kubectl describe 类型 名称  ---->查询资源详细信息
​	    d）kubectl logs   ---->查看日志信息
​	    e）kubectl delete 资源类型 资源名称 ---->删除资源
 	    f）kubectl get namespace 查看命名空间
​	4）资源文件：json和yaml格式	   

```yaml
---
- apiVersion: apps/v1               #当前各式版本 
  kind: Deployment                  #当前创建的-源型
  metadata:                         #当前资源的元-数     
      name: deployment-example      #当前源名称-
  spec:                             #当前资-源细定义
     selector:                      #资源匹-配择器，主要确定资的方式
        matchLabels:                #配卷标-
           app: myapp               #-具匹配，需要和lables定的相同
     replicas: 1                    #本数量-
     template:                      #资-源  
        apiVersion: v1              #不是单独-写o不需要
        metadata:                   #当前资源-元据
            name: pod-example       #当前-资名称（od）
            labels:                 #当前资的卷标-
             app: myapp             #卷标，可-引 
        spec:                       #当前资源的-细义
           containers:              #器定义-
           - name: myos             #器-名
             image: 192.168.1.100:5-00/myos:v1804     #启动容器的像地址
             stdin: true            #交互式-
             tty: true              #终端
             restartPolicy: Always  #源重启策略[Always|OnFailure|Never]
```

​	如何使用资源文件：	    

```shell
kubectl apply|create|delete  -f  资源文件 --->创建|更新|删除
```

5）集群副本扩容|缩减	   

```shell
kubectl edit deploments.apps myos2
kubectl scale deployment myos2 --replicas=3
```

6）滚动更新	

```dockerfile
replicas: 3        #在副本下添加如下数据--->进行更新
	revisionHistoryLimit: 10      #保留10个历史版本
	strategy:                  #更新策略
	  rollingUpdate:           #滚动更新
	    maxSurge: 25%        #最多超过25%的副本数量
	    maxUnavailable: 25%   #最多有25%的副本不可用
	  type: RollingUpdate      #更新方式
kubectl rollout history deployment myos2  查看有那些历史版本
kubectl rollout undo deployment myos2 --to-revision=1  回滚到对应版本
```

7）污点与容忍
     污点标签：	    

```shell
	NoSchedule  不会被调度
	PreferNoSchedule  尽量不调度
	NoExecute   驱逐节点
kubectl describe nodes master|grep -i taints   查看污点标签
kubectl taint node node-0001 key=v:NoSchedule  设置污点
kubectl taint node node-0001 key-   删除污点
```

   容忍污点：--->在pod（spec下）中添加	

```dockerfile
    tolerations:          #声明容忍策略
    - key: "node-role.kubernetes.io/master"   #键key
     operator: "Equal"                   #Equal完全匹配，Exists键存在即可
     value: ""                          #值value  
     effect: "NoSchedule"                #容忍策略
nodeSelector标签选择器
kubectl get node --show-labels  查看标签
kubectl label nodes node-0003 disktype=ssd  设置标签
kubectl label nodes node-0002 disktype-  删除标签
可以再pod中直接指定nodeName: node-0002
```

8）亲和与反亲和

```dockerfile
affinity:
      nodeAffinity:
        preferredDuringSchedulingIgnoredDuringExecution:   #软策略
        - weight: 1
          preference:
            matchExpressions:
            - key: cpu
              operator: In
              values:
              - high
        requiredDuringSchedulingIgnoredDuringExecution:  #硬策略
          nodeSelectorTerms:
          - matchExpressions:
            - key: mem
              operator: In
              values:
              - high
              - mid
kubectl label nodes node-0001 cpu=high mem=high   高
kubectl label nodes node-0001 cpu=high mem=high   中
kubectl label nodes node-0001 cpu=high mem=high   低
```



```yaml
9）sevice服务
	 ---
	apiVersion: v1
	kind: Service           #定义资源类型
	metadata:
	    name: nginx-service    #服务的名字
	spec:                  #服务详细定义
	    ports:              #定义端口
	    - port: 80           #开放在前端的访问端口
	      protocol: TCP      #协议
	      targetPort: 80     #目标主机端口
	    selector:          #指定后端服务
	       app: myapp    #需要和后端pod服务一致
	    type: ClusterIP     #服务类型<NodePort>
	    kubectl get service     #查看serveice服务情况
10）ingress控制器--->对外发布服务
	a）镜像导入私有仓库
	b）修改资源文件mandatory.yaml:221行的镜像仓库路径
	c）安装配置
		   kubectl apply -f mandatory.yaml    # 安装
		   kubectl -n ingress-nginx get pod -o wide  #查看安装情况
	d）修改配置文件:ingress-example.yaml--->10和11行
		   serviceName: apache-servers   #需要和service文件的name相同
		   servicePort: 80         #service的前端端口号  
	e）发布服务：kubectl apply -f ingress-example.yaml
	             kubectl get ingresses    查看对外IP
	f）修改ingress-service.yaml 文件
		   kubectl apply -f ingress-service.yaml    
		   kubectl -n ingress-nginx get service  查看service服务运行情况
	g）华为云需要在子网离单独添加虚拟IP才可以访问
11）configMap--->以nginx+php为例
	a）拷贝Nginx.conf并修改
			kubectl cp nginx-8bb8899cf-8bg9v:/usr/local/nginx/conf/nginx.conf nginx.conf
	b）映射文件或目录
		   kubectl create configmap nginx-conf --from-file=nginx.conf
		   kubectl get configmaps      查看映射情况
	c）修改配置文件nginx.yml
12）k8s的nfs存储卷配置
	a）部署 NFS 服务器（在 192.168.1.100 主机操作）
	b）创建 PV 资源（在 master 主机操作）
		   [root@master ~]# cat pv-example.yaml #查看学习 PV 资源文件 
				--- 
				apiVersion: v1 
				kind: PersistentVolume         # 声明持久卷 
				metadata: 
				name: pv-nfs 
				labels: 
				app: web-nfs 
				spec: 
				volumeMode: Filesystem        # 支持 Filesystem 和 Block 
				capacity: 
				storage: 10Gi                  # 卷提供的空间 
				accessModes:                 # 读写模式 RWO,ROX,RWX 
				- ReadWriteMany              # RWX 模式 
				persistentVolumeReclaimPolicy: Retain  # 卷资源回收方式 Retain,Delete 
				nfs: 
				path: /var/webroot 
				server: 192.168.1.100       
	c）创建PVC 资源（在 master 主机操作）
		    --- 
			apiVersion: v1 
			kind: PersistentVolumeClaim      # PVC 声明 
			metadata: 
			name: pvc-nfs 
			spec: 
			volumeMode: Filesystem         # 支持 Filesystem 和 Block 
			accessModes:                  # 读写模式 RWO,ROX,RWX 
			- ReadWriteMany               # RWX 模式 
			resources: 
			requests: 
			storage: 10Gi                  # 希望能提供的空间 
			selector: 
			matchLabels: 
			app: web-nfs
	d）创建容器资源，调用 PVC
		   [root@master ~]# cat volume-example.yaml    #查看学习资源文件 
				... ... 
				spec: 
				containers: 
				- name: nginx-app 
				image: myos:nginx 
				ports: 
				- containerPort: 80 
				volumeMounts: 
				- mountPath: /var/webroot      # mount 的路径 
				name: site-data 
				volumes: 
				- name: site-data 
				persistentVolumeClaim: 
				claimName: pvc-nfs           # mount 的资源 
		#使用 myos:nginx 镜像启动一个名称为 nginx-app 的容器 
		#并给该容器把固定一个名称为 pvc-nfs 的 PVC 存储 
		#将该 PVC 存储映射到 nginx 容器的/var/webroot 目录
13）prometheus监控搭建
	a）导入官方镜像到仓库
	b）修改资源文件部署各种容器服务（在 master 主机操作操作）
		安装1 operator
		     vim setup/prometheus-operator-deployment.yaml
		     kubectl apply -f setup/
		安装2 prom-adapter
		     vim prom-adapter/prometheus-adapter-deployment.yaml
		   kubectl apply -f prom-adapter/
		安装3 metrics-state
		     vim metrics-state/kube-state-metrics-deployment.yaml 
		     kubectl apply -f metrics-state/
		安装4 node-exporter 
		     vim node-exporter/node-exporter-daemonset.yaml 
		     kubectl apply -f node-exporter/
		安装5 Prometheus server
		     vim prom-server/prometheus-prometheus.yaml 
		 kubectl apply -f prom-server/
	c）对外发布 Prometheus 容器服务
		   vim prom-server/prometheus-service.yaml
			    spec: 
				type: NodePort 
				ports: 
				- name: web 
				port: 9090 
				nodePort: 30001 
				targetPort: web 
		    kubectl apply -f prom-server/prometheus-service.yaml
	d）安装alertmanager和grafana（在 master 主机操作）
		   vim alertmanager/alertmanager-alertmanager.yaml 
		  		  kubectl apply -f alertmanager/
		   vim grafana/grafana-deployment.yaml
		 		  kubectl apply -f grafana/
		   vim grafana/grafana-service.yaml
		 		  kubectl apply -f grafana/grafana-service.yaml
	e）访问30002端口设置数据源
		   name prometheus
		   url   http://prometheus-k8s:9090
		   默认用315仪表板
```

------

## 十四、ELK：日志分析平台

Elasticserach：日志存储与检索  数据库
logstash：日志的分析与处理
kibana：可视化平台工具
1、Elasticsearch集群环境部署--->搜索服务器：负责日志的检索与存储
	1）软件包：java-1.8.0-openjdk-devel  elasticsearch  端口9200
	2）配置hosts文件
	3）修改配置文件并启动服务
		  vim /etc/elasticsearch/elasticsearch.yml
			   17  cluster.name: NSD2002   #集群名字
			  23  node.name: es-0001    #节点主机名字
			  54  network.host: 0.0.0.0    #监听地址
			  68  discovery.zen.ping.unicast.hosts: ["es-0001",es-0002",.......]  #声明集群主机
		 systemctl start|enable elasticsearch
		 curl http://192.168.1.41:9200/  #查看节点配置
		 curl http://192.168.1.41:9200/_cluster/health?pretty #查看集群配置
	4）安装插件（集群中的任意一台主机）--->
			- head    常用
			- bigdesk   图形解控页面
			- kopf    API接口工具（开发用）
				  ./plugin install|remove|list   #安装|删除|查看
				  cd /usr/share/elasticsearch/bin/
				  ./plugin install [ftp://192.168.1.252/elk/bigdesk-master.zip](http://ftp://192.168.1.252/elk/bigdesk-master.zip)  通过发ftp安装插件
			http://192.168.1.45:9200/_plugin/kopf  #访问插件页面
	5）Elasticserach操作方法--->用http协议
		 操作方法：增PUT|删DELETE|改POST|GET查
		 关键字：
				_cat 查询信息--->?v|?help--->详细信息|帮助信息
				curl -XGET [http://es-0001:9200/_cat](http://es-0001:9200/_cat?v|help)/master?v  #查询集群中的master是谁
			a）新建index索引
					curl -XPUT 'http://es-0001:9200/tedu' -d \
					'{
					  "settings":{
					    "index":{
					      "number_of_shards": 5, 
					      "number_of_replicas": 1
					    }
					  }
					}'   #创建index索引tedu  
			b）增加数据（插入）      索引 类型  id
					curl -XPUT 'http://es-0001:9200/tedu/teacher/1' -d  \
					'{
					  "职业": "诗人",
					  "名字": "李白",
					  "称号": "诗仙",
					  "年代": "唐"
					}' 
			  d）查询数据      索引  类型  id
						curl -X GET http://es-0001:9200/tedu/teacher/1?pretty
			  e） 修改数据
						curl -XPOST http://es-0001:9200/tedu/teacher/1/_update -d \
						'{ 
						  "doc": {
						    "年代": "公元701"
						  }
						}'
			  f）删除数据
			      curl -XDELETE http://es-0001:9200/tedu/teacher/1# 删除一条
						curl -XDELETE http://es-0001:9200/tedu# 删除索引
						curl -XDELETE http://es-0001:9200/*# 删除所有

2、kibana部署--->数据化可视平台工具
	1）安装软件包：kibana  端口5601
	2）修改配置文件：vim /opt/kibana/config/kibana.yml
		 2   server.port: 5601
		 5   server.host: "0.0.0.0"
		 15  elasticsearch.url: "http://es-0001:9200"
		 23  kibana.index: ".kibana"
		 26  kibana.defaultAppId: "discover"
	 
	3）配置/etc/hosts启动服务并访问验证
		  systemctl restart kibana.service 
		  systemctl enable --now  kibana.service 
		  http://116.63.159.20:5601/status
	4）导入数据
		  gzip -d ogs.jsonl.gz  #解压数据包
		  curl -XPOST http://es-0001:9200/_bulk --data-binary @logs.jsonl #导入数据 
	5）创建图表
3、Logstash环境部署--->日志分析与处理
	  工作结构：input{从服务器读取数据}--->filter{处理数据}--->output{写入Elasticserach}
	1）软件包：java-1.8.0-openjdk-devel logstash
	2）修改/etc/hosts
	3）创建并修改配置文件：touch /etc/logstash/logstasg.conf
			  input {
			   stdin { codec => "json"}   #codec定义编码格式
			}
			filter{
			output{
			   stdout { codec => "rubydebug"}
			}
			}
		/opt/logstash/bin/logstash -f /etc/logstash/logstasg.conf  #测试配置
		/opt/logstash/bin/logstash-plugin list  #查看插件
	4）file插件
			input{
			file{
			 参数 => “参数值”
			}
            }
		参数：
			 path => "/tmp/a.log"                   #监控的文件路径
			 start_position=>"beginning"            #第一次读取文件位置  [beginning|end]
			 sincedb_path=>"/var/lib/logstash/sincedb"  #记录读取文件位置
			 type => "aaa"                #打标记 书签
	5）gork插件--->调用格式：%{宏名称:名字}
			  filter{ 
			   grok {
			    match => { "message" => "%{COMBINEDAPACHELOG}" }
			   } }
			  宏文件路径
		  /opt/logstash/vendor/bundle/jruby/1.9/gems/logstash-patterns-core-2.0.5/patterns/grok-patterns
	6）beats插件，接受filebaets发送过来的数据--->监听 5044 端口 
			input { 
			 file {
				  path => ["/tmp/c.log"]
				  type => "test"
				  start_position => "beginning"
				  sincedb_path => "/var/lib/logstash/sincedb"
			 }
			 beats {
			  	port => 5044
			 }
			  }
			filter{ 
				 grok {
				  	 match => { "message" => "%{COMBINEDAPACHELOG}" }
				 }
			}
			output{ 
				 stdout{ codec => "rubydebug" }
				 elasticsearch {
					  hosts => ["es-0001:9200", "es-0002:9200", "es-0003:9200"]
					  index => "weblog"
			 }
			}
	 
4、在服务器部署filebaet监控服务器日志
	1）安装软件包：yum install -y filebeat
	2）修改配置文件 /etc/filebeat/filebeat.yml
		15:    - /var/log/httpd/access_log
		72:   document_type: apache_log
		183:  注释掉该行
		188:  注释掉该行
		278： logstash:
		280： hosts: ["192.168.1.47:5044"]
	3）启动服务：systemctl  enable --now  filebeat
**三、大数据5V特性：数量，速度，种类，价值，真实性**
  Hadoop：分析和处理海量数据的软件平台
  特性：高可靠，高扩展，高效，高容错，低成本
   组件：HDFS MApReduce Yarn zookeeper kafka Hive Hbase 
	部署hadoop集群：3ndodde+hadoop1
1、安装软件包
	  yum -y install java-1.8.0-openjdk-devel
	  tar -xf hadoop-2.7.7.tar.gz 
	  mv hadoop-2.7.7 /usr/local/hadoop
	  ./bin/hadoop //报错，JAVA_HOME没有找到
2、解决报错：hadoop**-**env**.**sh
	  rpm -ql java-1.8.0-openjdk
	     25 export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-2.b14.el7.x86_64 /jre"
		   33 export HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"
3、编辑/etc/hosts,ssh
4、配置hadoop
	1）slaves：节点名称
		node-0001
		node-0002
		node-0003
	2）hadoop的核心配置文件core-site
		  <configuration>
				<property>
						<name>fs.defaultFS</name>
						<value>hdfs://hadoop1:9000</value>
				</property>
				<property>
						<name>hadoop.tmp.dir</name>
						<value>/var/hadoop</value>
				</property>
		   </configuration>
	3）配置hdfs-site文件
	  <configuration>
			<property>
					<name>dfs.namenode.http-address</name>
					<value>hadoop1:50070</value>
			</property>
			<property>
					<name>dfs.namenode.secondary.http-address</name>
					<value>hadoop1:50090</value>
			</property>
			<property>
					<name>dfs.replication</name>
					<value>2</value>
			</property>
	  </configuration>

5、同步hadoop配置到所有节点
	  yum -y install java-1.8.0-openjdk-devel  所有节点均需安装
	  for i in 52 53 54 ; do rsync -aSH --delete /usr/local/hadoop/192.168.1.$i:/usr/local/hadoop/ -e 'ssh' & done 所有节点配置一样
6、初始化集群：namenode-->hadoop1做
	  ./bin/hdfs namenode -format     //格式化 namenode
	  ./sbin/start-dfs.sh    //启动
	  jps    //验证角色
	  ./bin/hdfs dfsadmin -report    //查看集群是否组建成功
	   Live datanodes (3):    //有三个角色成功
	web 页面验证
	firefox http://hadoop1:50070 (namenode)
	firefox http://hadoop1:50090 (secondarynamenode)
	firefox http://node-0001:50075 (datanode)
7、mapreduce分布式计算框架：hadoop1上面操作
	  mv mapred-site.xml.template mapred-site.xml
		vim mapred-site.xml
		<configuration>
			<property>
				<name>mapreduce.framework.name</name>
				<value>yarn</value>
			</property>
		</configuration>
8、部署Yarn：处理客户端请求，资源分配与调度
	  hadoop1 部署 resourcemanager
			node(1,2,3) 部署 nodemanager
		1）配置yarn-site（hadoop1上面操作）
			vim yarn-site.xml
				<configuration>
					<!-- Site specific YARN configuration properties -->
						<property>
					    <name>yarn.resourcemanager.hostname</name>
					    <value>hadoop1</value>
					  </property>
					  <property>
					    <name>yarn.nodemanager.aux-services</name>
					    <value>mapreduce_shuffle</value>
					  </property>
				</configuration>
		   2）同步至所有节点
9、节点扩容：所有节点配置一样
		yum -y install java-1.8.0-openjdk-devel
		vim /etc/hosts
		vim ./etc/hadoop/slaves
		./sbin/hadoop-daemon.sh start datanode //启动
10、节点删除
	    vim /usr/local/hadoop/etc/hadoop/slaves  //去掉之前添加的newnode
	    vim /usr/local/hadoop/etc/hadoop/hdfs-site.xml   //在此配置文件里面加入下面四行
		     <property> 
					<name>dfs.hosts.exclude</name>
					<value>/usr/local/hadoop/etc/hadoop/exclude</value>
				</property>
	  ./sbin/hadoop-daemon.sh stop datanode  //停止datanode
	  ./sbin/yarn-daemon.sh start nodemanager   //yarn 增加 nodemanager
	  ./sbin/yarn-daemon.sh stop nodemanager //停止nodemanager
	  ./bin/yarn node -list  //yarn 查看节点状态，还是有newnode节点，要过一段时间才会消失