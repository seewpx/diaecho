# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3
EGIT_REPO_URI="https://github.com/rockchip-linux/rkdeveloptool.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"
DESCRIPTION="rkdeveloptool gives you a simple way to read/write rockusb device."
HOMEPAGE="https://github.com/rockchip-linux/rkdeveloptool"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 "

RDEPEND="virtual/libusb"
DEPEND="${RDEPEND}"

src_prepare() {
    autoreconf -i
    default
}