# Mysql基础应用

## 1、用户管理

```mysql
create user wangxl;               #默认所有主机均可访问<和%等同>
create user wangxl@'localhost';
alter user wang identified by "mima123.";   #赋予密码
alter user wang@'localhost' identified by "mima123.";
drop user wangxl;
```

## 2、权限管理

```mysql
show grants;      #查看当前用户的权限
show grants for wangxl;   #查看用户wangxl的权限
select * from mysql.user where user="root"\G;  #可以查看用户的权限有哪些
grant select,update,insert on *.* to wang;  #权限列表：all；usage；select，update，insert，delete；select（字段1，字段，......）
revoke update on *.* wang;  #移除权限 
```

## 3、库管理

```mysql
show databases;     #查看库
crate database test; #新建库test
use test;       #切换到库test
select database();  #查看当前在哪个库
drop database test;   #删除库test
```

## 4、表管理

```mysql
show tables;        #查看表有哪些
create table test.message(name char(4),sex enum("girl","boy"),tel char(11));     #创建表test
desc table ;        #查看表结构
drop table test;    #删除表test
```

## 5、表结构

```mysql
desc test.message;  #查看表结构
#add 添加字段
alter table test.message add native char(20) ;  #添加字段native；默认添加到最后
alter table test.message add number int first ;   #first 添加到最前面；after name 添加到name后面
#modify 修改字段 	
alter table test.message modify name varchar(10) not null after number;  #
#change 修改字段名		
alter table test.message change tel myphone char(11);   #不能修改类型
#rename  修改表名		
alter table test.message rename mess;
#drop  删除字段		
alter table  db1.t2 drop school , drop class ;
```

## 6、表记录

```mysql
#insert into 添加表记录
insert into test.message(name,) values("qiqi");
insert into message values(3,"wangwu","boy","33333333333","guizhou"),(4,"huahua","girl","44444444444","sichaun")；
#update 更新表记录
update test.message set number=2,native="hangzhou"  where name="李四";
update test.message set number=6,sex="boy",myphone="66666666666",native="qinghai" where name="qiqi";
#delete 删除表记录
delete from message where name="qiqi";
#select 查询表记录
select * from message;
select * from message where name="张三";
select count(*) as 共计 from message ;  
```

## 7、where条件书写

```mysql
a）匹配空和非空：is null-->空  is not null--->非空
b）逻辑条件：and和or  
c）数值条件：>,>=,<,<=,!=  
d）范围匹配：
	in(值1,值2,....)    匹配值得任意一个
	not in(值1,值2,,...)   不匹配值中的任意一个
	between 数字 and 数字  取其范围之间的值
e）模糊查询
  where 字段名 like “通配符”
  _--->表示一个字符
  %--->表示0~n个字符		  
7）正则表达式：regexp	
8）四则运算：+，-，*，/，%，()提高优先级
例：
select * from message where name="张三";
select * from message where name in("wangwu");        #查找出name包含wangwu的记录
select * from message where name not in("wangwu");    #查找出name不包含wangwu的记录
select * from message where number between 2 and 3;   #查找出number在2-3之间的记录
select * from message where sex regexp "^g";     	  #查找出sex中以g开头的所有记录
```

## 8、函数应用

```
mysql> select * from test.grade;
+--------+-----------+--------------+--------+--------+-----------+-----------+--------+
| 序号   | 姓名      | 基础会计     | 审计   | 财务   | 经济法    | 计算机    | 税法   |
+--------+-----------+--------------+--------+--------+-----------+-----------+--------+
|      1 | 陈之和    |           92 |    100 |     89 |        92 |       100 |     96 |
|      2 | 董利秉    |           92 |     86 |     85 |        90 |        88 |     93 |
|      3 | 江侬鲁    |           87 |     78 |     90 |        84 |        98 |     88 |
|      4 | 姜利黎    |           87 |     81 |     77 |        86 |        80 |     95 |
|      5 | 李朝霞    |           86 |     79 |     75 |        80 |        76 |     87 |
|      6 | 李书易    |           81 |     72 |     91 |        79 |        81 |     65 |
|      7 | 齐一贺    |           77 |     80 |     82 |        65 |        79 |     88 |
|      8 | 隋洋州    |           73 |     70 |     83 |        81 |        70 |     88 |
|      9 | 孙见品    |           74 |     76 |     78 |        81 |        86 |     90 |
|     10 | 王鸣嗣    |           61 |     63 |     68 |        72 |        71 |     80 |
|     11 | 信席樊    |           65 |     60 |     65 |        65 |        73 |     80 |
|     12 | 张嘉庆    |           65 |     70 |     51 |        70 |        78 |     70 |
|     13 | 赵锷伐    |           74 |     59 |     72 |        65 |        73 |     65 |
|     14 | 赵叔迪    |           40 |     40 |     62 |        65 |        70 |     76 |
+--------+-----------+--------------+--------+--------+-----------+-----------+--------+
14 rows in set (0.00 sec)
```

```mysql
#sum（字段名）求和
select 序号,姓名,sum(基础会计+审计+财务+经济法+计算机+税法) as 总成绩 from test.grade group by 序号; 	  #查看每个学生的总成绩
select 序号,姓名,sum(基础会计+审计+财务+经济法+计算机+税法)/6 as 平均成绩 from test.grade group by 序号;   #查看每个学生的平均成绩
select 序号,姓名,sum(基础会计+审计+财务+经济法+计算机+税法) as 总成绩 from test.grade group by 序号 order by 总成绩 desc; #按总成绩排名:高-低
#avg（字段名）求平均值
select sum(基础会计) as 平均成绩 from test.grade ; #查看本班的各科平均成绩
#min（字段名）最小值
select 序号,姓名,计算机 from grade where 计算机 in (select min(计算机) from grade);  #查找计算机成绩最低的学生信息
#max（字段名）最大值
select 序号,姓名,计算机 from grade where 计算机 in (select max(计算机) from grade);  #查找计算机成绩最高的学生信息
#count（字段名）统计个数
select count(计算机) as 成绩在80及以上的人数 from grade where 计算机 >=80 ;
```

## 9、数据表的导入和导出

```mysql
#导入 实现整备号的数据
show variables like "%file%";   #查看导入导出目录
create table test.grade(序号 int,姓名 char(10),基础会计 int,审计 int,财务 int,经济法 int,计算机 int,税法 int)default charset=utf8; #建表
load data infile "/var/lib/mysql-files/a.txt" into table test.grade fields terminated by ";" lines terminated by "\n";  #导入数据
alter table test.grade add 序号 int primary key auto_increment first;   #添加主键并让其自加1
#导出
select * from message into outfile "/var/lib/mysql-files/message.txt";
```

## 10、查询结果在处理

```mysql
#group by 字段   分组
#order by 字段   排序  desc --->高到低  asc--->低到高（默认）
#having 对过滤结果在过滤
```

## 11、备份和恢复

```mysql

```

