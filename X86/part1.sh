#!/bin/bash

# vlmcsd 及其 luci 界面
git clone --depth=1 https://github.com/mchome/openwrt-vlmcsd package/vlmcsd
git clone --depth=1 https://github.com/mchome/luci-app-vlmcsd package/luci-app-vlmcsd

# ddns-scripts_dnspod OpenWrt 官方 DDNS 插件的 dnspod_cn 更新脚本
git clone -b v0.0.1 --depth=1 https://github.com/VergilGao/ddns-scripts_dnspod package/ddns-scripts_dnspod

# dnsfilter 基于DNS的广告过滤
git clone -b 1.0-8 --depth=1 https://github.com/garypang13/luci-app-dnsfilter package/luci-app-dnsfilter

# luci-theme-edge 一个清爽的luci主题
git clone -b v2.5-19.07 --depth=1 https://github.com/garypang13/luci-theme-edge package/luci-theme-edge
