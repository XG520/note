Linux安全加固



1、用户口令设置

```shell
grep -E "PASS_MAX_DAYS|PASS_MIN_LEN|PASS_MIN_DAYS|PASS_WARN_AGE" /etc/login.defs
sudo awk -F: '($2 == "") { print $1 }' /etc/shadow
sed -ri 's/(^.?PASS_MIN_LEN)(.*)/PASS_MIN_LEN\t6/g' /etc/login.defs
```

2、root远程登陆限制

```
grep PermitRootLogin /etc/ssh/sshd_config
awk -F: '($3 == 0) { print $1 }' /etc/passwd    
```

3、roo用户环境变量的安全性*

```

```

