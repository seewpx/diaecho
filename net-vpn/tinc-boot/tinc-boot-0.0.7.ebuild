# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PV="v${PV}"
inherit systemd

DESCRIPTION="A platfoqrm for building proxies to bypass network restrictions."
HOMEPAGE="https://github.com/reddec/tinc-boot"
SRC_URI="
	https://github.com/reddec/tinc-boot/releases/download/v${PV}/tinc-boot_linux_amd64.tar.gz -> tinc-boot-${MY_PV}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}" 
src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	#mv * ${PN}-${PV}
}

src_install() {
	gobindir=`dirname ${S}/*/`
	pushd $gobindir

	dobin tinc-boot
}

