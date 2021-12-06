# [Discuz!]

## 1、安装Nginx

```shell
sudo apt-get install nginx mysql php php-mysql 
```

## 2、配置Nginx

```shell
location ~ \.php$ {
	include snippets/fastcgi-php.conf;

	# With php-fpm (or other unix sockets):
	fastcgi_pass unix:/run/php/php7.4-fpm.sock;
	# With php-cgi (or other tcp sockets):
	#fastcgi_pass 127.0.0.1:9000;
}
sudo systemctl restart nginx
```

## 3、配置php

```shell
sudo vim vim /etc/php/7.4/fpm/pool.d/www.conf
listen = /run/php/php7.4-fpm.sock
sudo systemctl restart php7.4-fpm
```

## 4、配置MySQL

```shell
sudo mysql 
create database discuz;
create user wxl@'%' ;
alter user wxl@"%" identified by "mima123.";
grant all on discuz.* to wxl@"*";
flush privileges ；
```

## 5、导入Discuz数据文件到网站目录下

https://www.discuz.net/forum-10-1.html

[Discuz_X3.4_SC_UTF8_20210520.zip](..\安装包\Discuz_X3.4_SC_UTF8_20210520.zip) 

## 6、浏览器配置

![在这里插入图片描述](https://img-blog.csdnimg.cn/20201209085858392.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Nzc2ODgyMg==,size_16,color_FFFFFF,t_70)

![在这里插入图片描述](https://img-blog.csdnimg.cn/20201209085911595.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Nzc2ODgyMg==,size_16,color_FFFFFF,t_70)![在这里插入图片描述](https://img-blog.csdnimg.cn/20201209085923155.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Nzc2ODgyMg==,size_16,color_FFFFFF,t_70)![在这里插入图片描述](https://img-blog.csdnimg.cn/20201209085936174.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Nzc2ODgyMg==,size_16,color_FFFFFF,t_70)![在这里插入图片描述](https://img-blog.csdnimg.cn/20201209085945597.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Nzc2ODgyMg==,size_16,color_FFFFFF,t_70)![在这里插入图片描述](https://img-blog.csdnimg.cn/20201209085950719.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80Nzc2ODgyMg==,size_16,color_FFFFFF,t_70)