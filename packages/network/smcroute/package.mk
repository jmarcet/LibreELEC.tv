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

PKG_NAME="smcroute"
PKG_VERSION="2.4.2"
PKG_ARCH="any"
PKG_LICENSE="GPL-2.0+"
PKG_SITE="URL:=http://troglobit.com/smcroute.html"
PKG_URL="https://github.com/troglobit/smcroute/releases/download/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libcap"
PKG_SECTION="network"
PKG_SHORTDESC="Static Multicast Routing Daemon"
PKG_LONGDESC="SMCRoute is a command line tool to manipulate the multicast routes of the Linux kernel."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_setpgrp_void=yes"

post_makeinstall_target() {
  mkdir -p $INSTALL/etc
  cp -a $PKG_DIR/smcroute.conf $INSTALL/etc/
}
