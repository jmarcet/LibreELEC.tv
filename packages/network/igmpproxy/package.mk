################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="igmpproxy"
PKG_VERSION="0.2.1"
PKG_ARCH="any"
PKG_LICENSE="GPL-2.0+"
PKG_SITE="http://sourceforge.net/projects/igmpproxy"
PKG_URL="https://github.com/pali/igmpproxy/releases/download/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="network"
PKG_SHORTDESC="Multicast Routing Daemon"
PKG_LONGDESC="IGMPproxy is a simple dynamic Multicast Routing Daemon using only IGMP signalling (Internet Group Management Protocol)"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  export TARGET_CFLAGS="$TARGET_CFLAGS -std=gnu99"
}
