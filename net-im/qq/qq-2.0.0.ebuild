# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit rpm
DESCRIPTION="qq linux version "
HOMEPAGE="https://im.qq.com/linuxqq/download.html"
SRC_URI="https://qd.myapp.com/myapp/qqteam/linuxQQ/linux${PN}_${PV}-b1-1024_x86_64.rpm"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
S=${WORKDIR}
src_unpack () {
    rpm_src_unpack ${A}
}