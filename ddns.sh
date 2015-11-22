#!/bin/bash

#1.检测当前的ip
#2.根据当前ip和暂存的ip对比
#3.暂存ip和当前ip不同，把当前ip存入文件，发送ip到DDNS服务器
#4.暂存ip和当前ip相同，等待下次查询

function checkIp() {
    result=`ping -c 1 -R www.sohu.com | grep RR | awk -F":" '{print $2}'`
    echo $result 
}

function currentDomainIp() {
    currentDomain=$1
    result=`ping -c 1 $currentDomain | grep PING | awk -F"(" '{print $2}' | awk -F")" '{print $1}'`
    echo $result
}

function sendCurrentIpToDDNS() {
    user=$1
    password=$2
    domain=$3
    ip=$4
    url="http://${user}:${password}@dynupdate.no-ip.com/nic/update?hostname=${domain}&myip=${ip}"
    wget "$url" -O result.txt
    cat result.txt
}

function main() {
    user=$1
    password=$2
    domain=$3
    ip=$4
    currentIp=`checkIp`
    domainIp=`currentDomainIp $domain`

    echo $currentIp
    echo $domainIp

    if [ $currentIp == $domainIp ]; then
        echo "the both ip is same."
    else
        sendCurrentIpToDDNS $user $password $domain $currentIp
    fi
}


if [ $# == 3 ]; then
    main $1 $2 $3
else 
    echo "$0 user password domain"
    echo "$0 li   mypassword lijunjie.ddns.net"
fi

