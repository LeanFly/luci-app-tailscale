### 参考luci-app-zerotier制作，目前能编译安装，首次安装

# Tailscale on OpenWRT


#### command:
    - up          connect to tailscale,logging in if needed
    - down        disconnect from tailscale
    - logout      disconnect from tailscale and expire current node key
    - netcheck    print an analysis of local network conditions
    - ip          show current tailscale ip
    - status      show state of tailscale an its connections
    - ping        ping a host at the tailscale layer , see how it routed
    - version     print tailscale version
    - web         run a web server for controlling tailscale
    - file        send or receive files
    - bugreport   print a shareable identifier to help diagnose issues
    - cert        get tls certs


1. Extract the contents of root to your filesystem root:
```
tar x -zvC / -f openwrt-tailscale-enabler-<tag>.tgz
```

2. Install the prerequisites for wget and tailscale:
```
opkg update
opkg install libustream-openssl ca-bundle kmod-tun
```

3. Run tailscale for the first time:
```
/etc/init.d/tailscale start
tailscale up --accept-dns=false --advertise-routes=10.0.0.0/24
```

Both of these commands download the tailscale package to get the binaries to /tmp.
The /etc/init.d/tailscale will start the tailscale daemon. 
The next command uses the tailscale CLI to configure the login and add some settings to prevent dns changes and advertise routes. Use the URL printed to login to tailscale.

4. Enable tailscale at boot:
```
/etc/init.d/tailscale enable
```

Verify by looking for an entry here:
```
ls /etc/rc.d/S*tailscale*
```

5. Reboot the router and verify that it shows up online on the [Tailscale Admin portal](https://login.tailscale.com/admin/machines).

6. To update the version of tailscale, grab the latest version [here](https://pkgs.tailscale.com/stable/#static) of the form `1.2.10_mips` and replace the same in `/usr/bin/tailscale` and `/usr/bin/tailscaled`: `version="1.2.10_mips"`.

Note: You need to have atleast 11+16 = ~27 MB of free space in `/tmp` (which is usually in RAM) to be able to use this.


##### 清除当前编译机型的软件编译目录，以便快速测试软件更改
    - make clean
##### 清空所有编译目录，以便开始全新编译
    - make dirclean
##### 检查已选择的项目，相关编译文件是否有明显错误
    - make check
##### 刷新补丁文件，排查是否有补丁文件错误，能自动修正细微差异
    - 刷新当前编译机型的内核补丁，并显示详细信息。
        - make target/linux/refresh V=s
##### 编译指定软件包，并显示详细信息
    - make package/samba4/compile V=s
##### 清理指定软件包编译目录，并显示详细信息
    - make package/samba4/clean V=s
