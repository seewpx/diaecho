EAPI=7

inherit cmake-utils qmake-utils git-r3

DESCRIPTION="Change your KDE Plasma's color based on your wallpaper."
HOMEPAGE="https://github.com/IsoaSFlus/kcm-colorful"
EGIT_REPO_URI="https://github.com/IsoaSFlus/kcm-colorful"
#SRC_URI="https://github.com/IsoaSFlus/kcm-colorful/archive/${PV}.tar.gz -> ${P}.tar.gz"
EGIT_CLONE_TYPE="shallow"
EGIT_COMMIT="${PV}"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 "

RDEPEND="
    kde-frameworks/extra-cmake-modules

    sys-devel/gettext
	>=dev-qt/qtcore-5.9.1:5
	>=dev-qt/qtgui-5.9.1:5
	>=dev-qt/qtwidgets-5.9.1:5
    >=dev-qt/qtx11extras-5.9.1:5
    >=dev-qt/qtquickcontrols-5.9.1:5
    >=dev-qt/qtquickcontrols-5.9.1:5
    sys-apps/dbus
    kde-frameworks/kcoreaddons
    kde-frameworks/kwidgetsaddons
    kde-frameworks/kconfigwidgets
    kde-frameworks/kio
    kde-frameworks/kcmutils
    kde-frameworks/ki18n
    kde-frameworks/kdeclarative
"

DEPEND="${RDEPEND}"

