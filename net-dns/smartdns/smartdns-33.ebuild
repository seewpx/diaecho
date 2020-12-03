# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PV="v${PV}"
inherit systemd

DESCRIPTION="SmartDNS accepts DNS query requests from local clients, and returns the fastest access results to clients."
HOMEPAGE="https://github.com/pymumu/smartdns"
SRC_URI="
	https://github.com/pymumu/smartdns/releases/download/Release33/smartdns.1.2020.09.08-2235.x86_64-linux-all.tar.gz -> smartdns-${MY_PV}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/smartdns" 
#src_unpack() {
#	if [ "${A}" != "" ]; then
#		unpack ${A}
#	fi
#	#mv * ${PN}-${PV}
#}

src_install() {
	#gobindir=`dirname ${S}/*/`
	#pushd $gobindir

	dosbin usr/sbin/smartdns

	insinto /etc/default
	doins etc/default/smartdns

	insinto /etc/smartdns
	doins etc/smartdns/smartdns.conf

	systemd_dounit systemd/smartdns.service
	#popd
}

