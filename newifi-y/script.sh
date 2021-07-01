# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

#使用源码自带ShadowSocksR Plus+出国软件
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 修改菜单名称（试验）
sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po

# 修改默认IP为192.168.3.1
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate

# Uncomment a feed source 取消feeds注释，以便更新
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
 
sed -i '$a src-git src-git helloworld https://github.com/fw876/helloworld ' feeds.conf.default

# Add luci-theme-opentomcat
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git theme-temp/luci-theme-opentomcat
rm -rf theme-temp/luci-theme-opentomcat/LICENSE
rm -rf theme-temp/luci-theme-opentomcat/README.md
mv -f theme-temp/luci-theme-opentomcat package/lean/
rm -rf theme-temp
default_theme='opentomcat'
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci

# Edit theme-opentomcat css
sed -i '/a\[data-title="Docker"\]:before/{p;N;N;d}'  package/lean/luci-theme-opentomcat/files/htdocs/css/style.css
sed -i '/a\[data-title="Docker"\]:before/a\ content: "\\e025";\n color: #66CC00!important;' package/lean/luci-theme-opentomcat/files/htdocs/css/style.css
