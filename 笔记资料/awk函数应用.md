# Linux三剑客之awk的基本使用

AWK 是一种处理文本文件的语言，是一个强大的文本分析工具。之所以叫 AWK 是因为其取了三位创始人 Alfred Aho，Peter Weinberger, 和 Brian Kernighan 的 Family Name 的首字符。

awk是一个强大的linux命令，有强大的文本格式化的能力，好比将一些文本数据格式化成专业的excel表的样式

## 语法

```shell
awk [option] 'pattern[action]'  file ...
# awk 参数   '条件动作'  文件
awk [选项参数] 'script' var=value file(s)
awk [选项参数] -f scriptfile var=value file(s)
```

## awk使用

```shell
#示例文件内容如下sh
cat awk_test
cat awk_test | awk '{print $5}'
$0表示整行 $NF表示当前分割后的最后一列 倒数第二列可以写成$(NF-1)
执行的命令是`awk '{print $5}'`，
没有使用参数和模式，
`$5`表示输出文本的`第五列`信息
awk默认以空格为分隔符，且多个空格也识别为一个空格，作为分隔符
awk是按行处理文件，一行处理完毕，处理下一行，
根据用户指定的分割符去工作，没有指定则默认空格
```

## awk内置变量

| 内置变量                    | 解释                              |
| --------------------------- | --------------------------------- |
| $n                          | 指定分隔符后，当前记录的第n个字段 |
| $0                          | 完整的输入记录                    |
| FS                          | 字段分隔符，默认是空格            |
| NF(Number of fields)        | 分割后，当前行一共有多少个字段    |
| NR(Number of records)       | 当前记录数，行数                  |
| 更多内置变量可以man手册查看 | man awk                           |

```shell
## 一次性输出多列
$ awk '{print $1,$2}' awk_test

## 自动定义输出内容
awk，必须外层单引号，内层双引号 内置变量`$1、$2`都不得添加双引号，否则会识别为文本，尽量别加引号
$ awk '{print "第一列",$1,"第二列",$2,"第五列",$5}' awk_test 

## 输出整行信息
awk '{print}' awk_testawk '{print $0}' awk_test
```

## awk选项参数说明

| 参数 | 解释                        |
| ---- | --------------------------- |
| -F   | 指定分割字段符              |
| -v   | 定义或修改一个awk内部的变量 |
| -f   | 从脚本文件中读取awk命令     |

```shell
-F fs or --field-separator fs指定分割字段符，fs是一个字符串或者是一个正则表达式，如-F:。
-v var=value or --asign var=value定义或修改一个awk内部的变量
-f scripfile or --file scriptfile从脚本文件中读取awk命令。
-mf nnn and -mr nnn对nnn值设置内在限制，-mf选项限制分配给nnn的最大块数目；
-mr选项限制记录的最大数目。这两个功能是Bell实验室版awk的扩展功能，在标准awk中不适用。
-W compact or --compat, -W traditional or --traditional在兼容模式下运行awk。所以gawk的行为和标准的awk完全一样，所有的awk扩展都被忽略。
-W copyleft or --copyleft, -W copyright or --copyright打印简短的版权信息。
-W help or --help, -W usage or --usage打印全部awk选项和每个选项的简短说明。
-W lint or --lint打印不能向传统unix平台移植的结构的警告。
-W lint-old or --lint-old打印关于不能向传统unix平台移植的结构的警告。
-W posix打开兼容模式。但有以下限制，不识别：/x、函数关键字、func、换码序列以及当fs是一个空格时，将新行作为一个域分隔符；操作符**和**=不能代替^和^=；fflush无效。
-W re-interval or --re-inerval允许间隔正则表达式的使用，参考(grep中的Posix字符类)，如括号表达式[[:alpha:]]。
-W source program-text or --source program-text使用program-text作为源代码，可与-f命令混用。
-W version or --version打印bug报告信息的版本。
```

```shell
#1、显示文件第三行
#NR在awk中表示行号，NR==3表示行号是3的那一行#注意一个等于号，是修改变量值的意思，两个等于号是关系运算符，是"等于"的意思
$ awk 'NR==3' awk_test 
#2、显示文件2-5行
$ awk 'NR==2,NR==5' awk_test 
#3、给每一行的内容添加行号，添加变量，NR等于行号，$0表示一整行的内容{print }是awk的动作
$ awk  '{print NR,$0}' awk_test
#4、显示文件3-5行且输出行号
$ awk 'NR==3,NR==5  {print NR,$0}' awk_test 3 
#5、显示文件的第一列，倒数第二和最后一列
awk -F ' ' '{print $1,$(NF-1),$NF}' pwd.txt
```

## awk分隔符

awk**的分隔符有两种**

```shell
1.输入分隔符，awk默认是空格，空白字符，英文是field separator，变量名是FS2.输出分隔符，output field separator，简称OFS
•FS输入分隔符
awk逐行处理文本的时候，以输入分割符为准，把文本切成多个片段，默认符号是空格 当我们处理特殊文件，没有空格的时候，可以自由指定分隔符特点
#准备示例文件，把之前的空格全部替换为任意符号，这里使用逗号#
$ sed -i 's/ /,/g' awk_test 
$ cat awk_test 
$ awk -F ',' '{print $1}' awk_test
除了使用-F选项，还可以使用变量的形式，指定分隔符，使用-v选项搭配，修改FS变量
$ awk -v FS=',' '{print $1}' awk_test

•OFS输出分割符
awk执行完命令，默认用空格隔开每一列，这个空格就是awk的默认输出符，例如
$ cat awk_test 
$ awk -v FS=',' '{print $1,$3}' awk_test
通过OFS设置输出分割符，修改变量必须搭配选项 -v
$ awk -v FS=',' -v OFS='-~-' '{print $1,$3 }' awk_test

2.输出分隔符与逗号
awk是否存在输出分隔符，特点在于`'{print $1,$3 }`逗号的区别
•添加逗号，默认是空格分隔符
$ awk -v FS=',' '{print $1,$3}' awk_test

•不加逗号
$ awk -v FS=',' '{print $1$3}' awk_test

•修改分割符，改为\t(制表符，四个空格)或者任意字符
awk -v FS=',' -v OFS='\t' '{print $1,$3 }' awk_test
```

## awk变量

对于awk而言，变量分为: **内置变量** **自定义变量**

------

| 内置变量 | 解释                                                         |
| -------- | ------------------------------------------------------------ |
| FS       | 输入字段分隔符， 默认为空白字符                              |
| OFS      | 输出字段分隔符， 默认为空白字符                              |
| RS       | 输入记录分隔符(输入换行符)， 指定输入时的换行符              |
| ORS      | 输出记录分隔符（输出换行符），输出时用指定符号代替换行符     |
| NF       | NF：number of Field，当前行的字段的个数(即当前行被分割成了几列)，字段数量 |
| NR       | NR：行号，当前处理的文本行的行号。                           |
| FNR      | FNR：各文件分别计数的行号                                    |
| FILENAME | FILENAME：当前文件名                                         |
| ARGC     | ARGC：命令行参数的个数                                       |
| ARGV     | ARGV：数组，保存的是命令行所给定的各参数                     |

### 内置变量

```shell
#### NR，NF、FNR

awk的内置变量NR、NF是不用添加$符号的 而$0 $1 $2 $3 ... 是需要添加$符号的 
# sed将逗号替换为空格
$ sed -i 's/,/ /g' awk_test
$ cat awk_test 
$ awk '{print NR,NF}' awk_test    #输出行号和列号
$ awk '{print NR,$1,$5}' awk_test #输出每行行号，以及指定的列

# 处理多个文件显示行号
awk '{print NR,$0}'  a.txt   b.txt  #  普通的NR变量，会将多个文件按照顺序排序
awk '{print FNR,$0}' a.txt  b.txt   #  使用FNR变量，可以分别对文件行数计数

# 内置变量ORS  ---> ORS是输出分隔符的意思，awk默认认为，每一行结束了，就得添加回车换行符 ORS变量可以更改输出符
$ awk -v ORS=';;;' '{print NR,$0}' awk_test  

# 内置变量FILENAME ---># 显示awk正在处理文件的名字
$ awk '{print FILENAME,FNR,$0}' awk_test   

# 变量ARGC、ARGV
ARGV表示的是一个数组，数组中保存的是命令行所给的参数 数组是一种数据类型，如同一个盒子 盒子有它的名字，且内部有N个小格子，标号从0开始 给一个盒子起名字叫做months，月份是1~12，那就如图所示:
```

 

### 自定义变量

```shell
方法一: -v varName=value
$ awk -v lxz9com="我的网址lxz9.com" 'BEGIN{print lxz9com}'
我的网址lxz9.com

方法二：在程序中直接定义
$ awk 'BEGIN{abc="字母abc";def="字母def";print abc,def}'
字母abc 字母def
```

## awk格式化

```shell
printf和print的区别
format的使用
要点：
1、其与print命令的最大不同是，printf需要指定format；
2、format用于指定后面的每个item的输出格式；
3、printf语句不会自动打印换行符；\n
format格式的指示符都以%开头，后跟一个字符；如下：
```

| 指示符 | 含义                                       |
| ------ | ------------------------------------------ |
| %c     | 显示字符的ASCII码；                        |
| %d, %i | 十进制整数；                               |
| %e, %E | 科学计数法显示数值；                       |
| %f     | 显示浮点数；                               |
| %g, %G | 以科学计数法的格式或浮点数的格式显示数值； |
| %s     | 显示字符串；                               |
| %u     | 无符号整数；                               |
| %%     | 显示%自身；                                |

```shell
•printf动作默认不会添加换行符
•print默认添加空格换行符
$ awk '{print $1}' awk_test 
$ awk '{printf $1}' awk_test 

### 给printf添加格式
•格式化字符串 %s 代表字符串的意思
•\n 换行符
$ awk '{printf "%s\n",$1}' awk_test 

### 对多个变量进行格式化
•使用linux命令printf时，是这样的，一个%s格式替换符，可以对多个参数进行重复格式化
$ printf  "%s\n"  a b c dabcd

•awk的格式替换符想要修改多个变量，必须传入多个
$ awk 'BEGIN{printf "%d\n%d\n%d\n%d\n%d\n",1,2,3,4,5}'12345# %D 代表是十进制数字

printf对输出的文本不会换行，必须添加对应的格式替换符和\n
使用printf动作，`'{printf "%s\n",$1}'`，替换的格式和变量之间得有逗号,
使用printf动作，%s %d 等格式化替换符 必须 和被格式化的数据一一对应
```



## awk模式

```
awk [option] 'pattern[action]'  file
```

awk是按行处理文本

•BEGIN模式是处理文本之前需要执行的操作•END模式是处理完所有行之后执行的操作

```shell
$ awk 'BEGIN{print "lxz9.com"}{print $1}' awk_test 
$ awk 'END{print "lxz9.com"}{print $1}' awk_test
$ awk 'END{print "lxz9.com"}{print $1}' awk_test 
```

| 关系运算符 | 解释       | 示例        |
| ---------- | ---------- | ----------- |
| `<`        | 小于       | `x<y`       |
| `<=`       | 小于等于   | `x<=y`      |
| `==`       | 等于       | `x==y`      |
| `!=`       | 不等于     | `x!=y`      |
| `>=`       | 大于等于   | `x>=y`      |
| `>`        | 大于       | `x>y`       |
| `~`        | 匹配正则   | `x~/正则/`  |
| `!~`       | 不匹配正则 | `x!~/正则/` |

## awk总结

```shell
### 空模式
**没有指定任何的模式（条件），因此每一行都执行了对应的动作，空模式会匹配文档的每一行，每一行都满足了（空模式）**
$ awk '{print $1}' awk_test 

### 关系运算符模式
**awk默认执行打印输出动作**
$ awk 'NR==2,NR==5' awk_test

### BEGIN/END模式（条件设置）
$ awk 'BEGIN{print "我在开头位置"}{print $1,$2}END{print "我在结尾处"}' awk_test 

## awk与正则表达式
{% note pink no-icon %} 正则表达式主要与awk的pattern模式（条件）结合使用
不指定模式，awk每一行都会执行对应的动作 指定了模式，只有被模式匹配到的、符合条件的行才会执行动作 {% endnote %}

### 找出a文件中有以export开头的行
$ grep '^export' aexport PATH="/home/lixingze/software/samtools-1.11/bin:$PATH" export 
$ awk '/^export/{print $0}'  aexport 
#省略写法
$ awk '/^export/'  aexport 

### awk使用正则语法
{% note pink no-icon %} grep '正则表达式' a.txt awk '/正则表达式/动作' a.txt (下面内容以/etc/passwd文件为例) {% endnote %}
$ cat -n passwd   
$ awk -F ":"  'BEGIN{printf "%-10s\t%-10s\n","用户名","用户id"} /^d/ {printf "%-10s\t%-10s\n",$1,$3}' passwd 

### 找出passwd文件中禁止登录的用户（/sbin/nologin）
正则表达式中如果出现了 `"/"`则需要进行转义
找出pwd.txt文件中禁止登录的用户`（/sbin/nologin）` 

1.用grep找出
grep '/sbin/nologin$' passwd

1.awk用正则得用双斜杠`/正则表达式/`
awk '/\/sbin\/nologin$/{print $0}' passwd

### 找出文件的区间内容
#### 找出adm用户到mail用户之间的内容
正则模式 `awk '/正则表达式/{动作}' file`
行范围模式 `awk '/正则1/,/正则2/{动作}' file` 
$ awk '/^adm/,/^mail/ {print $0}' passwd 

#### 关系表达式模式
$ awk 'NR>=4 && NR<=9 {print $0}' passwd 
```

## 系列推荐

[Linux三剑客之sed的基本使用](http://mp.weixin.qq.com/s?__biz=Mzg5MzYzNTcwNQ==&mid=2247488123&idx=1&sn=492fb2be4891f2d643f126c82ef6cbf3&chksm=c02a8f6df75d067b08427ed3143776531f11d441470a7aaaa59c777378d80560332b635f860a&scene=21#wechat_redirect)

[Linux三剑客之grep的基本使用](http://mp.weixin.qq.com/s?__biz=Mzg5MzYzNTcwNQ==&mid=2247488088&idx=1&sn=68edbd6780ded839c6f3a4e943817bf7&chksm=c02a8f4ef75d0658b468dd9313ede25719ef276937c2e654e68b67baea78a2eb88dee36e67a8&scene=21#wechat_redirect)

[Linux三剑客系列之正则表达式](http://mp.weixin.qq.com/s?__biz=Mzg5MzYzNTcwNQ==&mid=2247488070&idx=1&sn=4278b82667d0fedab805b971114cd637&chksm=c02a8f50f75d06469557342f6ec018951cd1df813256189981fbf70f64425d3692dea6b490f4&scene=21#wechat_redirect)





## shell行转列(awk)，列转行(tr)

```shell
#行转列(awk)：
awk -F "+" '{for(i=1;i<=NF;i++) a[i,NR]=$i}END{for(i=1;i<=NF;i++) {for(j=1;j<=NR;j++) printf a[i,j] " ";print ""}}' file.txt
awk 'BEGIN{i=1}{gsub(/#/,"\t"i"\n");i++;print}' uids|sed '/^$/d' > uids_seg
#列转行(tr)：
cat file.txt |tr "\n" ","|sed -e 's/,$/\n/'
#netpad++ 
ctrl+h
\r\n
\t
```

## awk函数应用

| 函数            | 说明                                                         |      |      |
| --------------- | ------------------------------------------------------------ | ---- | ---- |
| gsub(r,s)       | 在整个$0中用s代替r《全局替换)                                |      |      |
| gsub(r,s,t)     | 在整个t中用s代替r《全局替换)                                 |      |      |
| index(s,t)      | 返回s中字符串t的第一位置                                     |      |      |
| length(s)       | 返回s长度                                                    |      |      |
| match(s.r)      | 刻i试s是否包含匹配e的字符串                                  |      |      |
| split(s a fs)   | 在s上将s分成序列a                                            |      |      |
| sprint(fmt,exp) | 返回经fmt格式化后的exp                                       |      |      |
| sub (r, s)      | 用$中最左边最长的字串代替:(只替换第一匹西柏字符)             |      |      |
| sub(s, p)       | 返回字符串s中从p开始的后绍部分(只替换第一匹配的字符)         |      |      |
| substr(s, p, n) | 返回字符串s中从p开始长度为n的后绍部分（只替换第一匹配的字符) |      |      |

| sub( Ere,Repl, [ In ])            | 除了正则表达式所有具体值被替代这点,它和sub函数完全—样地执行,。 |      |      |      |
| --------------------------------- | ------------------------------------------------------------ | ---- | ---- | ---- |
| sub( Ere, Repl, [ In ])           | 用Repl参教指定的字符串替换In参数指定的字符串中的由Ere参数指定的扩展正则表达式的第一个具体值。sub函数返回替换的数里。出现在Repl参数指定的亨符串中的&《和符号）由In参教指定的与Ere参教的指定的扩展正则表达式匹酉泊的学符串替换。如果未指定In参数,缺省值是整个记录（$0记录变里)。 |      |      |      |
| index( string1, string2 )         | 在由String1参数指定的字符串（其中有出现string2指定的参数)中,返回位置,从1并始编号。如果String2参数不在 String1参数中出现,则返回0(零)。 |      |      |      |
| length [(string)]                 | 返回String参数指定的字符串的长度（字符形式)。如果未给出String参数,则返回整个记录的长度（$o记录变里)。 |      |      |      |
| blength [(string)]                | 返回String参数指定的字符串的长度〈以字节为单位)。如果未给出string参数,则返回整个记录的长度（$0记录变里)。 |      |      |      |
| substr( string,M,[ N ])           | 返回具有N参数指定的字符数里子串。子串从 String参教指定的字符串取得,其字符以M参教指定的位置开始。M参数指定为将string参数中的第一个字符作为编号1。如果未指定Ⅳ参数,则子串的长度将是M参数指定的位置到string参数的末尾的长度。 |      |      |      |
| match( string, Ere )              | 在String参数指定的字符串( Ere参数指定的扩展正则表达式出现在其中）中返回位置（享符形式）,从1开始编号，或如果Ere参数不出现,则返回o(零)。 RSTART特殊变里设置为返回值。RLENGTH特殊变里设置为匹酉珀的亨符串的长度,或如果未找到任何匹配，则设置为-1(负一)。 |      |      |      |
| split( string,A,[Ere])            | 将String参数指定的参数分割为数组元素A[1],A[2],. : .,A[n],并返回n变里的值。此分隔可以通过Ere参数指定的扩展正则表达式进行,或用当前字段分隔符（FS 特殊变里)来进行（如果没有给出Ere参数》。除非上下文指明特定的元素还应具有一个数字值,否则A数组中的元素用学符串值来创建。 |      |      |      |
| tolower( string )                 | 返回String参数指定的亨符串,字符串中每个大写字符将更改为小写。大写和小写的映射由当前语言环境的Lc_CTYPE范畴定义。 |      |      |      |
| toupper( String )                 | 返String参数指定的字符串,字符串中每个小与字符将更改为大写。大写和小写的映射由当前语言环境的Lc_CTYPE范畴定义。 |      |      |      |
| sprintf(Format,Expr,Expr, . . . ) | 根据Format参数指定的printf子例程格式字符串来格式化Expr参数指定的表达式并返回最后生成的字符串。 |      |      |      |

