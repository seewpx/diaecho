# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )
#PYTHON_REQ_USE='threads(+)'
inherit distutils-r1
MY_PN=vision
MY_P=${MY_PN}-${PV}
DESCRIPTION="The package consists of popular datasets, model architectures, and common image transformations."
HOMEPAGE="https://pytorch.org/"
SRC_URI="https://github.com/pytorch/vision/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#EGIT_REPO_URI="https://github.com/pytorch/vision"
#EGIT_CHECKOUT_DIR=${WORKDIR}/${MY_P}
# Use all submodules except for test-* but include test-lib
#EGIT_SUBMODULES=( '*' '-test-*' test-lib )
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#IUSE="mkl cuda +doc +openblas +openmpi +opencv +mkldnn"
#CPU_USE_FLAGS_X86="sse sse2 sse3 sse4_1 sse4_2 avx avx2 fma3 fma4"
#for i in $CPU_USE_FLAGS_X86; do
#       IUSE+=" cpu_flags_x86_$i"
#done

RDEPEND="
   dev-python/pillow
"
DEPEND="${RDEPEND}
   >=sci-libs/pytorch-1.2.0"
S="${WORKDIR}/${MY_P}"
#export CFLAGS="-U_FORTIFY_SOURCE "
#python_compile_all() {
#       use doc && emake -C docs html
#}
#python_install_all() {
#       use doc && local HTML_DOCS=( docs/_build/html/. )
#       distutils-r1_python_install_all
#}
src_prepare() {
   distutils-r1_python_prepare_all
}

src_compile() {
	addpredict /dev/nvidiactl
}