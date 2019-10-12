# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils 

DESCRIPTION="Chez Scheme is an implementation of the Revised 6 Report on Scheme (R6RS) with numerous language and programming environment extensions."
HOMEPAGE="https://cisco.github.io/ChezScheme"

SRC_URI="https://github.com/cisco/ChezScheme/archive/v${PV}.tar.gz -> ${PF}.tar.gz"
FEATURES="-network-sandbox"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="+threads"

DEPEND="
	sys-libs/ncurses
	x11-libs/libX11
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/ChezScheme-${PV}"

src_configure() {
    local para_thread

	if use threads ; then
	   para_thread="--threads"
	fi

	./configure \
	${para_thread} \
	--installprefix=/usr \
	--installbin=/usr/bin \
	--installlib=/usr/lib \
	--installman=/usr/share/man \
	--temproot=${D}
}

src_install() {
	emake install
}