#
#!/bin/bash
# © 2021 GitHub, Inc.
#================================================================================================

# Copyright (c) 2019-2021 iplcdn <https://NOMCAI.ML>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/MuaCat/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#================================================================================================

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Modify hostname
#sed -i 's/OpenWrt/OpenWrt/g' package/base-files/files/bin/config_generate 

# Delete default password:password
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings
#-------------------------------------------------------------------------------------------------------------------------------
# Modify the version number版本号里显示一个自己的名字（AutoBuild $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i 's/OpenWrt /AutoBuild $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g' package/lean/default-settings/files/zzz-default-settings

# 修改主机名字，把Xiaomi-AX6修改你喜欢的就行（不能纯数字或者使用中文）
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='Xiaomi-R4A'' package/lean/default-settings/files/zzz-default-settings

#更改主机型号，支持中文。 
#sed -i 's/model = "Redmi AX6"/model = "红米AX6路由"/g' target/linux/ipq807x/files/arch/arm64/boot/dts/qcom/ipq8071-ax6.dts

# 修改连接数
#sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
#修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# 修改默认wifi名称ssid为100
#sed -i 's/ssid=OpenWrt/ssid=100/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#开启MU-MIMO
#sed -i 's/mu_beamformer=0/mu_beamformer=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#wifi加密方式，没有是none
sed -i 's/encryption=none/encryption=sae-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#使用sed 在第四行后添加新字(密码key为gds.2021)
sed -i '/set wireless.default_radio${devidx}.encryption=sae-mixed/a\set wireless.default_radio${devidx}.key=gds.2021' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#wifi密码key为gds.2021
#sed -i 's/key=password/key=gds.2021/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#-------------------------------------------------------------------------------------------------------------------------------
# 修复核心及添加温度显示
#sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
#sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# Add kernel build user
#[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
#    echo 'CONFIG_KERNEL_BUILD_USER="OpenWrt"' >>.config ||
#    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"OpenWrt"@' .config

# Add kernel build domain
#[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
#    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
#    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
#-------------------------------------------------------------------------------------------------------------------------------
# 状态系统增加个性信息
#sed -i "s/exit 0//" package/lean/default-settings/files/zzz-default-settings

#echo "sed -i '/CPU usage/a\<tr><td width=\"33%\">关于</td><td><a class=\"author-website\" href=\"https://NOMCAI.ML\">菜菜的壁纸库</a>&nbsp;&nbsp;&nbsp;<a class=\"author-blog\" href=\"https://github.com/Joecaicai/Actions-OpenWrt-AX6.git\">固件编译源地址</a>&nbsp;&nbsp;&nbsp;<a class=\"author-blog\" href=\"https://space.bilibili.com/15669979\">菜菜的哔哩哔哩</a></td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#简化版关于作者
#echo "sed -i '/CPU usage/a\<tr><td width=\"33%\">关于</td><td><a class=\"author-website\" href=\"https://NOMCAI.ML\">菜菜的壁纸库</a></td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings

#echo "sed -i '/关于/a\<tr><td width=\"33%\">天气</td><td><iframe width=\"640\" scrolling=\"no\" height=\"75\" frameborder=\"0\" allowtransparency=\"true\" src=\"https://i.tianqi.com?c=code&id=39&color=%23FF7600&icon=3&num=2&site=12\"></iframe></td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "sed -i '/天气/a\<tr><td width=\"33%\"> </td><td class=\"container\" style=\"height:200px;\"><canvas class=\"illo\" width=\"640\" height=\"640\" style=\"max-width: 200px; max-height: 200px; touch-action: none; width: 640px; height: 640px;\"></canvas></td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings

#动漫旋转双人组
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/twopeople1.js\"></script>' >> /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/zdog.dist.js\"></script>' >> /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script id=\"rendered-js\" src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/pen.js\"></script>' >> /usr/lib/lua/luci/view/admin_status/index.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/XXKDB/img_cdn/js/ginkgo-leaf.js\"></script>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings

# 嵌入看板娘
#echo "echo '<script src=\"https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js\"></script>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css\"/>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings
#echo "echo '<script src=\"https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget/autoload.js\"></script>' >> /usr/lib/lua/luci/view/footer.htm" >> package/lean/default-settings/files/zzz-default-settings

#echo "" >> package/lean/default-settings/files/zzz-default-settings
#echo "" >> package/lean/default-settings/files/zzz-default-settings
#echo "exit 0" >> package/lean/default-settings/files/zzz-default-settings
#-------------------------------------------------------------------------------------------------------------------------------
#删除原默认主题
rm -rf package/lean/luci-theme-argon
rm -rf package/lean/luci-theme-bootstrap
rm -rf package/lean/luci-theme-material
rm -rf package/lean/luci-theme-netgear
rm -rf feeds/kenzo/luci-theme-argon

#移除不用软件包    
#rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-wrtbwmon

#添加额外软件包
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
#git clone https://github.com/kiddin9/openwrt-packages.git package/kiddin9-packages
#git clone https://github.com/Boos4721/OpenWrt-Packages.git package/Boos4721-packages

git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot

# themes
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus
git clone https://github.com/XXKDB/luci-theme-argon_armygreen.git package/lean/luci-theme-argon_armygreen
#git clone https://github.com/YL2209/luci-theme-ifit.git package/lean/luci-theme-ifit

#添加argon-config 使用最新argon
#git clone https://github.com/jerrykuku/luci-app-argon-config package/lean/luci-app-argon-config
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/lean/luci-theme-argon

#取消原主题luci-theme-bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
# themes添加（svn co 命令意思：指定版本如https://github）

# 修改luci-theme-argon_armygreen主题渐变色，16进制RGB
#登录页面背景颜色+半透明
sed -i 's/#f7fafc/rgba(134,176,197, .5)/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#-------------------------------------------------------------------------------------------------------------------------------
#渐变色开始
sed -i 's/#f9ffff/#4C4C4C/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#渐变色结束b8 57
sed -i 's/#7fffffb8/#5C859B/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
sed -i 's/#9effff57/#9FC4D5/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#主机名  ，导航栏-状态-文字的颜色
sed -i 's/#4fc352/#B7E0F3/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#-------------------------------------------------------------------------------------------------------------------------------
应用+保存
sed -i 's/#46b8da/#407994/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#未选中
sed -i 's/#a2a287/#6F7E92/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#主机名  ，导航栏-状态-文字的颜色
sed -i 's/#4fc352/#B7E0F3/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#导航栏-系统-文字的颜色
sed -i 's/#fb6340/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#导航栏-服务-文字的颜色
sed -i 's/#11cdef/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#导航栏-网络存储-文字的颜色
sed -i 's/#f3a4b5/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#导航栏-控制-文字的颜色
sed -i 's/#f3a4b5/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#导航栏-VPN-文字的颜色
sed -i 's/#172b4d/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#导航栏-网络-文字的颜色
sed -i 's/#8965e0/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#导航栏-带宽监视器-文字的颜色
sed -i 's/#5e72e4/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#导航栏-注销-文字的颜色
sed -i 's/#32325d/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css

#导航栏-选中前的颜色
sed -i 's/#f6f9fc/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#导航栏-选中后的颜色
sed -i 's/#4fc352/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css

#面板标题，如：导航栏-总览-系统 的颜色
sed -i 's/#32325d/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#面板标题，如：导航栏-总览-系统 触摸后按钮样式的颜色
sed -i 's/#F0F0F0/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#复位 背景 - 边框 按钮样式的颜色
sed -i 's/#f0ad4e/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
sed -i 's/#eea236/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#删除 背景 - 边框 按钮样式的颜色
sed -i 's/#fb6340/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css

#登陆页面右下角技术支持  跳转网站“https://github.com/openwrt/luci”   名称“可爱动漫主题”
#sed -i 's/可爱动漫主题/可爱动漫主题/g' package/lean/luci-theme-argon_armygreen/luasrc/view/themes/argon_armygreen/footer.htm
#主机名右上角符号❤
sed -i 's/❤/☯/g' package/lean/luci-theme-argon_armygreen/luasrc/view/themes/argon_armygreen/header.htm

#已选中
sed -i 's/#4F2EDC/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
sed -i 's/#00FF00/#9900CC/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#-------------------------------------------------------------------------------------------------------------------------------
#加载背景
sed -i 's/#5e72e4/#407994/g' package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/css/style.css
#-------------------------------------------------------------------------------------------------------------------------------
#replace mirrors
#rm -rf ./include
#rm -rf ./ scripts
#svn co https://github.com/immortalwrt/immortalwrt/trunk/include
#svn co https://github.com/immortalwrt/immortalwrt/trunk/scripts

#git clone https://github.com/vernesong/OpenClash.git package/OpenClash
#cp -r package/OpenClash/luci-app-openclash package/
#rm -rf package/OpenClash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/trojan-plus
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-socat package/luci-app-socat
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/hysteria
svn co https://github.com/fw876/helloworld/trunk/xray-core package/xray-core
svn co https://github.com/fw876/helloworld/trunk/xray-plugin package/xray-plugin
svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/shadowsocks-rust
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/shadowsocksr-libev
svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/v2ray-plugin
svn co https://github.com/fw876/helloworld/trunk/simple-obfs package/simple-obfs
svn co https://github.com/fw876/helloworld/trunk/trojan package/trojan
svn co https://github.com/fw876/helloworld/trunk/v2ray-core package/v2ray-core
svn co https://github.com/fw876/helloworld/trunk/v2ray-geodata package/v2ray-geodata
svn co https://github.com/brvphoenix/wrtbwmon/trunk/wrtbwmon package/wrtbwmon
git clone https://github.com/brvphoenix/luci-app-wrtbwmon
cd luci-app-wrtbwmon
git reset --hard ff7773abbf71120fc39a276393b29ba47353a7e2
cp -r luci-app-wrtbwmon ../package/
cd ..

svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/naiveproxy

sed -i 's/luci-lib-ipkg/luci-base/g' package/feeds/kenzo/luci-app-store/Makefile
svn co https://github.com/linkease/ddnsto-openwrt/trunk/ddnsto package/ddnsto
svn co https://github.com/linkease/ddnsto-openwrt/trunk/luci-app-ddnsto package/luci-app-ddnsto

#修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}
#svn co https://github.com/immortalwrt/immortalwrt/trunk/include/download.mk include/download.mk
#svn co https://github.com/immortalwrt/immortalwrt/trunk/include/package-immortalwrt.mk include/package-immortalwrt.mk

#replace coremark.sh with the new one
cp -f $GITHUB_WORKSPACE/general/coremark.sh feeds/packages/utils/coremark/

find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-alt/shadowsocksr-libev-ssr-redir/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-server/shadowsocksr-libev-ssr-server/g' {}

svn co https://github.com/kiddin9/openwrt-bypass/trunk/luci-app-bypass package/luci-app-bypass
#find package/luci-app-bypass/* -maxdepth 8 -path "*" | xargs -i sed -i 's/smartdns-le/smartdns/g' {}
#-------------------------------------------------------------------------------------------------------------------------------
./scripts/feeds update -a
./scripts/feeds install -a
#===============================================================================================================================
