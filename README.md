#目的
检测当前路由器的ip，检测动态域名的ip，如果动态域名ip跟路由器ip不同，那么路由器ip可能发生变换，发送请求进行变更

#必备条件
- 在www.noip.com上注册一个账户
- 家里的宽带可以24小时开机

#脚本使用
执行./ddns.sh 用户名 密码 你的域名
以上参数都可以在www.noip.com上获得


#参考
如果想使用树莓派在自己的家里搭建一个可以从外网访问的服务，可以使用本脚本来同步ip地址的变化，具体的路由器设置可以参考[]文章](https://www.gitbook.com/book/lijunjieone/mynote/details)
