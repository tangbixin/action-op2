#!/bin/bash
#============================================================
# Copyright (c) 2019-2021 nomcai <https://nomcai.ml>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/Joecaicai/Actions-OpenWrt
# File name: diy-part3.sh
# Description: OpenWrt DIY script part 3 (Before Update feeds)
#============================================================
#bg1为1920*1080
#bg2为2000*1247
#bg3为2000*1168
#logo为512*512
#main_bg为200081168
#main_bg_5k为2500*2109
#favicon为128*128
#------------------------------------------------------------------------------------------------------------------------
cp diy/bg/favicon.ico openwrt/package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/favicon.ico
cp diy/bg/logo.png openwrt/package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/logo.png
cp diy/bg/bg1.jpg openwrt/package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/img/bg1.jpg
cp diy/bg/bg2.jpg openwrt/package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/img/bg2.jpg
cp diy/bg/bg3.jpg openwrt/package/lean/luci-theme-argon_armygreen/htdocs/luci-static/argon_armygreen/img/bg3.jpg
#------------------------------------------------------------------------------------------------------------------------
cp diy/bg/bg1.jpg openwrt/package/lean/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
cp diy/bg/bg1.jpg openwrt/package/feeds/kenzo/luci-theme-argonne/htdocs/luci-static/argonne/img/bg1.jpg
#------------------------------------------------------------------------------------------------------------------------
cp diy/favicon.ico openwrt/package/feeds/kenzo/luci-theme-ifit/files/htdocs/favicon.ico
cp diy/logo.png openwrt/package/feeds/kenzo/luci-theme-ifit/files/htdocs/logo.png      
cp diy/bg/main_bg.jpg openwrt/package/feeds/kenzo/luci-theme-ifit/files/htdocs/images/main_bg.jpg
cp diy/bg/main_bg_5k.jpg openwrt/package/feeds/kenzo/luci-theme-ifit/files/htdocs/images/main_bg_5k.jpg
cp diy/banner openwrt/package/base-files/files/etc/banner
#------------------------------------------------------------------------------------------------------------------------
#
