# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
DISABLE_AUTOFORMATTING=true
inherit font unpacker

DESCRIPTION="The wps-office-fonts package contains Founder Chinese fonts"
HOMEPAGE="http://wenq.org/wqy2/index.cgi?ZenHei"
SRC_URI="https://mirror.deepines.com/deepines/pool/main/w/wps-office-fonts/wps-office-fonts_1.0_all.deb"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 "
IUSE=""

S="$WORKDIR"

FONT_SUFFIX="ttf"

# Only installs fonts
RESTRICT="binchecks strip test"

pkg_postinst() {
	unset FONT_CONF # override default message
	font_pkg_postinst
}

src_install(){
	rm -rf ${D}
	mv ${S} ${D}
}

