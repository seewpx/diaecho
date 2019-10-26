# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1 eutils virtualx

MYPN="${PN/scikits_/scikit-}"
MYP="${MYPN}-${PV}"

DESCRIPTION="Image processing routines for SciPy"
HOMEPAGE="https://scikit-image.org/"
SRC_URI="https://github.com/scikit-image/scikit-image/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc freeimage pyamg test"

RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}] 
	dev-python/networkx[${PYTHON_USEDEP}] 
	dev-python/numpy[${PYTHON_USEDEP}] 
	dev-python/pillow[${PYTHON_USEDEP}] 
	dev-python/pywavelets 
	dev-python/six[${PYTHON_USEDEP}] 
	sci-libs/scipy[sparse,${PYTHON_USEDEP}]
	freeimage? ( media-libs/freeimage )
	pyamg? ( dev-python/pyamg  )"
DEPEND="${RDEPEND}
	>=dev-python/cython-0.23 
	dev-python/setuptools[${PYTHON_USEDEP}] 
	test? (	dev-python/nose[${PYTHON_USEDEP}]  )"

S="${WORKDIR}/${MYP}"

DOCS=( CONTRIBUTORS.txt RELEASE.txt )

python_test() {
	distutils_install_for_testing
	cd "${TEST_DIR}" || die "no ${TEST_DIR} available"
	echo "backend : Agg" > matplotlibrc || die
	#echo "backend.qt4 : PyQt4" >> matplotlibrc || die
	#echo "backend.qt4 : PySide" >> matplotlibrc || die
	MPLCONFIGDIR=. virtx nosetests --exe -v skimage || die
}

pkg_postinst() {
	optfeature "FITS io capability" dev-python/astropy
	optfeature "GTK" dev-python/pygtk
	optfeature "Parallel computation" dev-python/dask
	# not in portage yet
	#optfeature "io plugin providing a wide variety of formats, including specialized formats using in medical imaging." dev-python/simpleitk
	#optfeature "io plugin providing most standard formats" dev-python/imread
}