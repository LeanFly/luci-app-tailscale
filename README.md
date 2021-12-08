### 参考luci-app-zerotier制作，能编译安装，没有luci界面，第一次运行需要进入控制台：tailscale up 启动，根据返回的注册链接绑定设备

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
