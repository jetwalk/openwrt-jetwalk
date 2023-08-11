#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt by jet '/g" ./package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='OpenWrt-jet'/g" ./package/base-files/files/bin/config_generate
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
# Modify default IP
sed -i 's/192.168.1.1/192.168.50.69/g' package/base-files/files/bin/config_generate
rm -rf ./feeds/luci/applications/luci-app-unblockmusic
svn co https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic
rm -rf ./feeds/luci/applications/luci-app-mosdns
rm -rf ./feeds/packages/net/mosdns
rm -rf ./package/lean/luci-theme-argon
# rm -rf ./package/lean/luci-app-serverchan
rm -rf ./package/diy-ziyong/adguardhome
rm -rf ./feeds/packages/net/adguardhome
# rm -rf ./feeds/packages/net/smartdns
rm -rf ./target/linux/generic/pending-5.10/701-net-ethernet-mtk_eth_soc-add-ipv6-flow-offloading-support.patch
# rm -rf ./feeds/packages/net/https-dns-proxy
# svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy
