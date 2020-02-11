# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit udev

DESCRIPTION=" A program to read and control device brightness"
HOMEPAGE="https://github.com/Hummer12007/brightnessctl"
LICENSE="MIT"
SRC_URI="https://github.com/Hummer12007/brightnessctl/archive/${PV}.tar.gz -> brightnessctl-${PV}.tar.gz"

KEYWORDS="~amd64 ~x86"

SLOT="0"

DEPEND="virtual/udev"

src_prepare() {
	eapply_user
	sed -i /-g/d Makefile || die
	sed -i s,VERSION,\"0.5.1\", brightnessctl.c || die
}

src_compile() {
	emake LDLIBS=-lm
}

src_install() {
	dobin brightnessctl
	udev_dorules 90-brightnessctl.rules
}

pkg_postinst() {
	udev_reload
}
