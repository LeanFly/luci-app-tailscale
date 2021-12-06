#
# Copyright (C) 2018 leanfly <https://github.com/LeanFly/luci-app-tailscale />
#
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for tailscale
LUCI_DESCRIPTION:=LuCI Support for Tailscale.
LUCI_DEPENDS:=+libustream-openssl +ca-bundle +kmod-tun
LUCI_PKGARCH:=all

PKG_NAME:=luci-app-tailscale
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=leanfly <https://github.com/LeanFly/luci-app-tailscale />

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature