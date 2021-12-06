<img src="C:\Users\king\AppData\Roaming\Typora\typora-user-images\image-20210624175853028.png" alt="image-20210624175853028" style="zoom: 80%;" />

1、开机按shift或esc先进行recovery模式

2、选择高级菜单

3、选择root命令行模式

4、依次执行一下命令

```shell
mount -o remount,rw /
chown root:root /usr/bin/sudo
chmod 4755 /usr/bin/sudo
chown root /usr/lib/sudo/sudoers.so
```

5、重启:reboot

