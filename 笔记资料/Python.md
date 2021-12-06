# python笔记

## 一、python2-开发基础          

### 1.语法结构

```python
python 是用缩进表达代码逻辑，推荐缩进4个空格
\  用来续行
ctrl+/  在pychrom中注释/取消注释
```

### 2.vim编写py时可以tab

```python
mkdir -p .vim/bundle
cd .vim/bundle
git clone [https://github.com/rkulla/pydiction.git](https://github.com/rkulla/pythiction.git)
cp -r pydiction/after/ ~/.vim/
vim ~/.vimrc
	filetype plugin on
	let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'
	set ai
	set et
	set ts=4
```

### 3.函数

```python
print()函数：输出内容
	括号中的参数用,隔开
	用sep指定各项之间的分隔符
	print("hello %s"  %  user )-->表示用变量user的值替换%s的占位
input()函数：从键盘获得输入-->读入的数据都是字符串类型
type()函数：查看数据类型
int()函数：将字符串转为整数
str()函数：将数字转为字符串
divmod()函数：取余
round()函数：舍5等6入
len()函数：取长度
list()函数：转列表输出
tuple()函数：转元组输出
range（1,10）函数：生成列表
a1=a.encode()   将字符转成字节
a2=a1.decode()  将字节转成字符
s1.center(48, '#')  # 居中显示，使用#填充
s1.strip()  # 去除字符串两端空白字符
s1.lstrip()  # 去除字符串左端空白字符
s1.rstrip()  # 去除字符串右端空白字符
'1234'.isdigit()  # 判断字符串是不是全为数字
```

### 4.变量	

```
变量的命名规则：只能是以字母和下划线开头
```

### 5.数据类型：0o-->八进制 0x-->十六进制 0b-->二进制

```python
整数
浮点数
布尔数：True为1 Flase为0	
```

### 6.字符串处理

```python
'' "" """
a[5] 取a变量的第5个字符--->负数表示从右到左，切片a[2:5]-->表示取234位
```

### 7.列表、元组、字典

```python
a=[1,2,3]   列表可变
b=(1,2,3)   元组不可变
c={"name":"tom","age":20}  	字典没有顺序
字符串不能直接修改 
```

### 8.判断语句

```python
if    条件1:
	语句块
elif  条件2:
	语句块
else ：
     语句块
#使用模块时要先用import导入，然后用[模块.功能]使用
getpass.getpass(‘password:’)  #输入密码时屏蔽回显
random.randint(1,100)         #随机取出1-100的数字，包括1和100
random.choice('abcd')         #随机选一个字母，可以是列表
```

### 9.循环

```python
次数已知用for 次数未知用while（非0为真）
while 条件：
for i in ：
range(0,10)-->生成列表，不包含10
例：["192.168.1.%s" % i for i in range(1,10)]  --->%s是占位符
```

### 10.文件的处理

```python
#打开open() 关闭close() 读取read()、readline()、readlines()
	print(a2,end="")
#如果通过with语句打开文件，with语句结束，文件自动关闭
	with open('/tmp/mima') as f:
#在不关闭文件的情况下，使用seek函数移动文件指针
seek接受两个参数，第2个参数是位置（0表示开头，1表示当前置，2表示结尾），第1个参数是相对第2个参数的偏移量
tell函数返回文件指针相对开头的偏移量
f = open('/tmp/mima', 'wb')      #表示以字节的方式打开
f.write('hello world!\n')        # 表示写入了13个字节
f.flush()  # 立即同步到磁盘
f.writelines(['2nd line.\n', '3rd line.\n'])    #写入列表
f.tell()    #打开指针
eog   #可以打开图片文件
```

### 11.自定义函数

```
语法：def  函数名(参数):
通过return语句返回结果，如果没有return，默认返回None，None是关键字，表示空
```

### 12.位置参数	

```python
import  sys  #导入模块
copy(argv[1],argv[2])   #表示为copy函数赋予两个位置参数--->例：python3 cp.py a.txt b.txt
```

### 13.模块

```python
#文件是物理上组织代码的方式
#模块是逻辑上组织代码的方式
#以.py结尾的文件就是一个模块
#如果是自定义，则不能和系统的模块重名--->用模块.变量  模块.函数调用
#使用模块时要先用import导入，然后用[模块.功能]使用
import getpass    #单行导入一个模块
form random import choice,randint   #仅导入模块某些功能
import getpass as gp  #导入模块时定义别名
__name__属性：执行模块中指定代码
	是一个变量
		如果模块文件直接运行，它的值是：__main__
		如果模块文件被导入使用，它的值就是文件名
		if __name__=='__main___' 
getpass.getpass(‘password:’)  #输入密码时屏蔽回显
random.randint(1,100) #随机取出1-100的数字，包括1和100
random.choice('abcd') #随机选一个字母，可以是列表
#系统管理模块
#a.shutil模块     #用于移动复制和移动目录和文件
	copy  文件   
    copyfile 目录   
    move  移动不分文件还是目录  
    rmtree 删除目录
	shutil.chown('a.txt',user='abc',group='abc')  修改属主属组
#b.subprocess.run('ls  ~',shell=Ture)
    result=subprocess.run('ls  ~',shell=Ture,stdout=subprocess.PIPE,stderr=subprcess.PIPE)
    result.args       #返回输的命令--->ls ~
	result.returncode  #返回执行情况，及$?
	result.stdout    #返回成功的值Bytes
	result.stdout.decode   #Bytes转str
	result.stderr.decode  #返回错误的值
#c.关键字 keyword模块
模块布局
	#！/usr/bin/python3   解释器
	"""模块帮助信息""" 	
	import time #导入模块
	全局变量的定义
	类的定义
	函数的定义
	程序逻辑
```

### 14.序列对象

```python
sorted      #用于排序       
reversed    #用于翻转
enumerate   #同时得到下标和值
	for i,j in enumerate(s1):
  			print(i,j)  #可以将元组中的两项类容分别复制给两个变量
```

### 15.字符串格式化

```python
#基本格式："" % ()   --->引号中的占位符被()中的相应数据替换：
%s   字符格式--->%10s 指定字段宽度为10，右对齐，-10则表示左对齐
%d   整数
%f   浮点数  %2.2f  --->表示整数位两位，小数位两位
'{0}{1}'  .format('tom',20)   --->可以用数字表示后面输出结果对应后面的值
```

### 16.原始字符串，真实字符串 

### 17.列表

```python
#属于容器类型、序列对象、可变的
#列表方法
l1.append(10)    #列表尾部添加10
l1.insert(0,10)  #在0位置添加10
l1.count(10)     #统计列表中10出现的次数
l1.index(10,1)   #返回下标1之后出现的第一个10的下标
l1.pop()   		 #默认弹出最后一项 l1.pop(2)则弹出下标为2的项目
l1.remove(10)	 #删除第一个10
```

### 18.元组

​	单元素元组：如果元组中只有一项，则必须要有逗号，否则不是元组

### 19.字典：容器、可变、映射类型 

```python
#的key不可重复，并且字典的key是不可变的、复制时有则改变，无则添加
d2={}.fromkeys(['tom','jerry','jack'],20)  #创建相同值的字典	
d2.get('name')  #name的值
d2.keys()      #有key
d2.update({})  #批量更新
d2.pop('name')   #通过key弹出
d2.popitem()     #弹出某一项
d2.values()  #显示字典的所有key的值
```

### 20.集合：

```python
#集合没有顺序	
#有可变的set和不可变的frozenset
s2=set('abc')  --->{'c', 'b', 'a'}  
s3=set('cbd') --->{'d', 'b', 'c'}
s2|s3   #取并集
s2&s3   #取交集
s2-s3   #取差补 及s2中有s3中没有的
	list(set(nums))  #可以对列表nums去重
```



## 二、python2-开发进阶

###   1.时间方法

#### 	A.time模块

```python
时间戳datestmp：表示从1970年1月1日00:00:00开始按秒计算的偏移量
UTC时间：世界协调时
struct_time：9元组表示的时间(年、月、日、时、分、秒、一周中的第几天、一年中的第几天‘是否使用夏季节约时间)  #周一为0
	time.time       #返回当前时间的时间戳
	time.ctime      #返回当前时间的UTC时间
	time.localtime  #返回当前时间的9元组时间
	time.sleep(3)   #睡眠3秒
	time.strftime('%Y-%m-%d %a %H:%M:%S')   #把time对象转字符串输出
	time.strptime('2020-12-10 12:00:00 %H:%M:%S')  #把字符串装time对象
```

#### 	B.datetime模块

```python
from datetime import datetime,timedelta
	t1=datetime.now()    #取出现在的时间
		time.strftime('%Y-%m-%d %a %H:%M:%S')   #把datetime对象转字符串输出
		time.strptime('2020-12-10 12:00:00 %H:%M:%S')  #把字符串装datetime对象
	days=datetime.timedelta(days=100,hours=1)  #时间差额
	t1-days   #100天零1小时后的时间
	t1+days  #100天零1小时之前的时间
```

### 2.异常处理

```python
try:
	有可能发生异常的语句
except：
	发生异常的1执行的语句
except：
	发生异常的2执行的语句
else：
	不发生异常才执行的语句
finally：
	不管是否发生异常都要执行的语句
自定义异常：
	if not 0 < age < 120:
		raise ValueError('年龄超出范围：（1~119）')     #raise方式
	print('%s is %s year old' % (name,age))

	assert 0 < age < 120,'年龄超出范围：（1~119）'   #assert方式
	print('%s is %s year old' % (name,age))
```

### 3.文件系统相关模块

#### 	A.os模块

```python
os.cwd() #pwd
os.mkdir('/tmp/a.txt')    #mkdir     os.makedirs() # mkdir -p
os.listdir()  #ls
os.chdir()  #cd  
os.mknod()  #touch
os.chmod('hosts',0o755) #chmod 755 hosts
os.rename('hosts','server')  #mv hosts server
os.remove('server')   #删除文件server
os.rmdir()   #只能删空目录  shutil.rmtree('a')  #空和非空都能删除
os.path.isabs('/a/b/c')  #判断是否为绝对路径
os.path.isdir('/etc')   os.path.isfile('/etc/passwd') os.path.islink('/etc/passwd') os.path.ismount('/etc/passwd') -->存在并且是否为挂载点
os.path.exists('/etc/passwd')  #判断存在么
os.path.basename('/etc/abc/a.txt')    #输出最右边/右边的内容
	--->'a.txt'
os.path.dirname('/etc/abc/a.txt')      #输出最右边/左边的内容
	--->'/etc/abc'
os.path.split('/etc/abc/a.txt')           #返回元组
	--->('/etc/abc', 'a.txt')
os.path.join('/etc/abc/a.txt')           #路径拼接
	--->'/etc/abc/a.txt'
os.walk('/tmp/mydemo')   #ls -R /tmp/mydemo    tree /tmp/mydemo
例：	
l1=list(os.walk('/tmp/mydemo'))    #用python输出成ls -R /tmp/mydemo 的模式
for path,folders,files in l1:
	print(path)
	for folder in folders:
			print('\033[34m%s\033[0m ' % folder,end="\t")
	for file in files:
			print(file,end="\t")
	print()
```

#### 	B.pickle模块:将各种对象存入文件，并可以无损取出

```python
 with open('/tmp/a.data','wb') as fobj:      
		pickle.dump(l1,fobj)				     #l1列表存入/tmp/a.data中
 with open('/tmp/a.data','rb') as fobj:
		l1=pickle.load(fobj)					 #将/tmp/a.data中存的列表复制给l1
```

​		
​			
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	
​	

​	
​	
