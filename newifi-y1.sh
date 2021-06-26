# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings


#使用源码自带ShadowSocksR Plus+出国软件
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall

# 修改菜单名称（试验）
sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
