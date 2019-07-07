# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )
#PYTHON_REQ_USE='threads(+)'

inherit distutils-r1
MY_PN=imgaug
MY_P=${MY_PN}-${PV}
DESCRIPTION="This python library augmenting images for your machine learning projects"
HOMEPAGE="https://github.com/aleju/imgaug"
SRC_URI="https://github.com/aleju/imgaug/archive/0.2.9.tar.gz -> ${P}.tar.gz"
#EGIT_REPO_URI="https://github.com/aleju/imgaug"
#EGIT_CHECKOUT_DIR=${WORKDIR}/${MY_P}
# Use all submodules except for test-* but include test-lib
#EGIT_SUBMODULES=( '*' '-test-*' test-lib )
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#IUSE="mkl cuda +doc +openblas +openmpi +opencv +mkldnn"
#CPU_USE_FLAGS_X86="sse sse2 sse3 sse4_1 sse4_2 avx avx2 fma3 fma4"
#for i in $CPU_USE_FLAGS_X86; do
#	IUSE+=" cpu_flags_x86_$i"
#done

RDEPEND="
	dev-python/pillow
	dev-python/tqdm"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
#export CFLAGS="-U_FORTIFY_SOURCE "
#python_compile_all() {
#	use doc && emake -C docs html
#}
#python_install_all() {
#	use doc && local HTML_DOCS=( docs/_build/html/. )
#	distutils-r1_python_install_all
#}
src_prepare() {
	distutils-r1_python_prepare_all
}