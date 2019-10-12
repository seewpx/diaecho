# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils 

DESCRIPTION="Chez Scheme is an implementation of the Revised 6 Report on Scheme (R6RS) with numerous language and programming environment extensions."
HOMEPAGE="https://cisco.github.io/ChezScheme"

SRC_URI="https://github.com/cisco/ChezScheme/archive/v${PV}.tar.gz -> ${PF}.tar.gz"
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

src_prepare() {
    if [ -d '.git' ] && command -v git >/dev/null 2>&1 ; then
        git submodule init && git submodule update || exit 1
    else
        if [ ! -f 'nanopass/nanopass.ss' ] ; then
            rmdir nanopass > /dev/null 2>&1
            (curl  -L -o v1.9.tar.gz https://github.com/nanopass/nanopass-framework-scheme/archive/v1.9.tar.gz && tar -zxf v1.9.tar.gz && mv nanopass-framework-scheme-1.9 nanopass && rm v1.9.tar.gz) || exit 1
        fi

        if [ "${zlibDep}" != "" ] ; then
            if [ ! -f 'zlib/configure' ] ; then
                rmdir zlib > /dev/null 2>&1
                (curl -L -o v1.2.11.tar.gz https://github.com/madler/zlib/archive/v1.2.11.tar.gz && tar -xzf v1.2.11.tar.gz && mv zlib-1.2.11 zlib && rm v1.2.11.tar.gz) || exit 1
            fi
        fi
    
        if [ "${LZ4Dep}" != "" ] ; then
            if [ ! -f 'lz4/lib/Makefile' ] ; then
                rmdir lz4 > /dev/null 2>&1
                (curl -L -o v1.8.3.tar.gz https://github.com/lz4/lz4/archive/v1.8.3.tar.gz && tar -xzf v1.8.3.tar.gz && mv lz4-1.8.3 lz4 && rm v1.8.3.tar.gz) || exit 1
            fi
        fi

        if [ ! -f 'stex/Mf-stex' ] ; then
            rmdir stex > /dev/null 2>&1
            (curl -L -o v1.2.1.tar.gz https://github.com/dybvig/stex/archive/v1.2.1.tar.gz && tar -zxf v1.2.1.tar.gz && mv stex-1.2.1 stex && rm v1.2.1.tar.gz) || exit 1
        fi
    fi
}

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