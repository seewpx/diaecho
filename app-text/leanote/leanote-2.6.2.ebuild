# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

EXEC_NAME=leanote
DESCRIPTION="Leanote Desktop App, based on Electron(atom-shell)"
HOMEPAGE="http://leanote.org"
BASE_URI="https://github.com/leanote/desktop-app"
SRC_URI="https://cfhcable.dl.sourceforge.net/project/leanote-desktop-app/2.6.2/leanote-desktop-linux-x64-v2.6.2.zip -> ${P}-amd64.zip"
RESTRICT="mirror strip bindist"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
>=media-libs/libpng-1.2.46:0
gnome-base/gconf"

RDEPEND="${DEPEND}"

QA_PRESTRIPPED="opt/${PN}"
QA_PREBUILT="opt/${PN}"

pkg_setup() {
	S="${WORKDIR}/"
}

src_install() {
	dodir "/opt"
	#mkdir -p "${D}/opt/${PN}"
	# Using doins -r would strip executable bits from all binaries
	cp -r "${S}" "${D}/opt/${PN}" || die "Failed to copy files"
	#fperms -R a+rx "${EPREFIX}/opt/${PN}"
	dosym "${EPREFIX}/opt/${PN}/Leanote" "/usr/bin/${EXEC_NAME}"
	dosym "${EPREFIX}/opt/${PN}/Leanote" "/usr/bin/leanote"
	make_desktop_entry "${EXEC_NAME}" "Leanote Desktop" "${PN}" "Office;"
	newicon "${S}/leanote.png" "${PN}.png"
	insinto "/usr/share/licenses/${PN}"
	newins "LICENSE" "LICENSE"
}

pkg_postinst(){
	fperms  a+rx "/opt/leanote"
	#elog "You may install some additional utils, so check them."
}
