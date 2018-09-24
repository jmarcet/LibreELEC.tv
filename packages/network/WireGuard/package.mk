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

PKG_NAME="WireGuard"
PKG_VERSION="0.0.20180910"
PKG_ARCH="any"
PKG_LICENSE="GPL-2.0 Apache-2.0"
PKG_SITE="https://www.wireguard.com"
PKG_URL="https://git.zx2c4.com/$PKG_NAME/snapshot/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain bash libmnl systemd"
PKG_SECTION="network"
PKG_SHORTDESC="WireGuard userspace control program"
PKG_LONGDESC="This package provides the userspace control program for WireGuard"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
    cd $PKG_BUILD/src/tools
    make $PKG_MAKE_OPTS_TARGET
}

makeinstall_target() {
    cd $PKG_BUILD/src/tools
    $MAKEINSTALL $PKG_MAKEINSTALL_OPTS_TARGET
    make install DESTDIR=$INSTALL $PKG_MAKEINSTALL_OPTS_TARGET
    sed -e 's:\/bin\/bash:/usr/local/bin/bash:' wg-quick/linux.bash > $INSTALL/usr/bin/wg-quick
    chmod +x $INSTALL/usr/bin/wg-quick
    mkdir -p $INSTALL/usr/lib/systemd/system
    cp -p systemd/wg-quick@.service $INSTALL/usr/lib/systemd/system/
}
