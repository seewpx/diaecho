# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils xdg-utils gnome2-utils qmake-utils git-r3
EGIT_REPO_URI="https://github.com/texmacs/texmacs.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"
#MY_P=texmacs-master

DESCRIPTION="Wysiwyg text processor with high-quality maths"
HOMEPAGE="http://www.texmacs.org/"
#inherit git-r3
#SRC_URI="https://github.com/texmacs/texmacs/archive/master.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE="debug jpeg netpbm sqlite svg spell"
KEYWORDS="~amd64 "
# RESTRICT="fetch"
RDEPEND="
	app-text/ghostscript-gpl
	<dev-scheme/guile-1.9[deprecated]
	media-libs/freetype
	x11-apps/xmodmap
	x11-libs/libXext
	virtual/latex-base
	>=dev-qt/qtcore-5.9.1:5
	>=dev-qt/qtgui-5.9.1:5
	>=dev-qt/qtwidgets-5.9.1:5
	>=dev-qt/qtprintsupport-5.9.1:5
	sqlite? ( dev-db/sqlite )
	jpeg? ( || ( media-gfx/imagemagick media-gfx/jpeg2ps ) )
	netpbm? ( media-libs/netpbm )
	spell? ( app-text/aspell )
	svg? ( || ( media-gfx/inkscape gnome-base/librsvg:2 ) )
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto"

#S="${WORKDIR}/${MY_P}"
S="${WORKDIR}/${P}"
PATCHES=(
#	"${FILESDIR}"/${PN}-1.99.2-desktop.patch

	# remove new/delete declarations, bug 590002
	#"${FILESDIR}"/${PN}-1.99-remove-new-declaration.patch

	"${FILESDIR}"/${PN}-1.99.6-math_util.patch

	# fix build failure on 32-bit systems, bug #652054
	#	"${FILESDIR}"/${PN}-1.99.6-guile-size_t.patch
	#"${FILESDIR}"/${PN}-1.99.9-guile-remove-deprecated.patch
)

src_configure() {
	local CMAKE_BUILD_TYPE
	CMAKE_BUILD_TYPE=Release
	local mycmakeargs=(
		-DUSE_SQLITE3=$(usex sqlite 1 0)
		-DDEBUG_ASSERT=$(usex debug 1 0)
	)
	cmake-utils_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}
