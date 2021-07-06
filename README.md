# Actions-OpenWrt

Build OpenWrt using GitHub Actions

经测试编译成功。科学插件编译不进去，国内使用没问题。
去掉上传到奶牛等网络空间，直接把编译文件显示在Actions任务下面。（这个可以上传到Releases下）。

具体修改`/.github/workflows/build-openwrt-newifi-y1.yml`

- UPLOAD_BIN_DIR: false   ---- 上传bin文件 true：上传，false：不上传；
- UPLOAD_FIRMWARE: true   ---- 上传固件 true：上传，false：不上传；
- UPLOAD_RELEASE: false   ---- 上传Releas true：上传，false：不上传；

这三个至少有一个等于true。

- newifi-y1.sh  固件的一些默认配置和插件的原地址或依赖地址；
- newifi.config   定制自己需要插件或功能的开启。内容可以从 `simple.config`  这个文件里摘出来，如：需要启动磁盘管理，需要把 `CONFIG_PACKAGE_luci-app-diskman  is not set`  改为`CONFIG_PACKAGE_luci-app-diskman=y`  

下面这三个是根据硬件设备来选择的，自己百度你的设备型号。
- CONFIG_TARGET_ramips=y
- CONFIG_TARGET_ramips_mt7620=y
- CONFIG_TARGET_ramips_mt7620_DEVICE_lenovo_newifi-y1=y
 
# LuCI 功能配置说明
- `Y` 包含此插件
- `M` 编译为ipk包 即：模块
- `N` 不包含此插件

如：`luci-app-diskman` 这个磁盘管理插件，如果需要编译到固件里则为：`CONFIG_PACKAGE_luci-app-diskman=y` ，如果编译成模块另外独立安装则为：`CONFIG_PACKAGE_luci-app-diskman=m`,如果不需要此模块则在此模块行前面加#号或者在配置文件里不出现此行记录即删除即可。
 
## Usage

- Click the [Use this template](https://github.com/P3TERX/Actions-OpenWrt/generate) button to create a new repository.
- Generate `.config` files using [Lean's OpenWrt](https://github.com/coolsnowwolf/lede) source code. ( You can change it through environment variables in the workflow file. )
- Push `.config` file to the GitHub repository.
- Select `Build OpenWrt` on the Actions page.
- Click the `Run workflow` button.
- When the build is complete, click the `Artifacts` button in the upper right corner of the Actions page to download the binaries.

## Tips

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## Acknowledgments

- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)
