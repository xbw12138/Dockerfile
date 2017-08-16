#!/usr/bin/env bash
#
# Auth:XBW
# Email:xbw@ecfun.cc
# QQ:1076351865
#
#
echo "棒棒 xbw@ecfun.cc 新浪微博 @DMT许博文"
/etc/init.d/shadowsocks restart &&
service crond start ; /usr/sbin/sshd -D $$
/root/natapp -authtoken=65b25a4c618b4167


