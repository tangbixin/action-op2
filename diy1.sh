#!/bin/bash
#====================================================================
# Copyright (c) 2019-2021 iplcdn <https://NOMCAI.ML>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/MuaCat/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#====================================================================

# 取消插件注释
# fw876/helloworld (Uncomment a feed source)

#sed -i "/helloworld/d" "feeds.conf.default"
#echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git xiaoqingfeng https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng' >>feeds.conf.default

#====================================================================
# 添加插件源码
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# passwall依赖
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#====================================================================
