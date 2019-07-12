# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PV="v${PV}"
inherit systemd

DESCRIPTION="A platform for building proxies to bypass network restrictions."
HOMEPAGE="https://www.v2ray.com/"
SRC_URI="
	https://github.com/v2ray/v2ray-core/releases/download/$MY_PV/v2ray-linux-64.zip -> v2ray-${MY_PV}.zip
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 "
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}" 
src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	mv * ${PN}-${PV}
}

src_install() {
	gobindir=`dirname ${S}/*/`
	pushd $gobindir

	dobin v2ray v2ctl

	insinto /etc/v2ray
	doins *.json

	dobin geoip.dat geosite.dat

	dodoc ${S}/doc/readme.md

	#newinitd "${FILESDIR}/v2ray.initd" v2ray
	systemd_dounit systemd/v2ray.service

	popd
}

