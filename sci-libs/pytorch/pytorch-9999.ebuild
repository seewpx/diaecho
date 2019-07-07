# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )
#PYTHON_REQ_USE='threads(+)'

inherit distutils-r1 git-r3
MY_PN=pytorch
MY_P=${MY_PN}-${PV}
DESCRIPTION="Deep learning library"
HOMEPAGE="https://pytorch.org/"
#SRC_URI="https://github.com/pytorch/pytorch/archive/v${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/pytorch/pytorch"
EGIT_CHECKOUT_DIR=${WORKDIR}/${MY_P}
# Use all submodules except for test-* but include test-lib
EGIT_SUBMODULES=( '*' '-test-*' test-lib )
#RESTRICT="network-sandbox"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#IUSE="mkl cuda +doc +openblas  +opencv +mkldnn"
IUSE="cuda +doc "
CPU_USE_FLAGS_X86="sse sse2 sse3 sse4_1 sse4_2 avx avx2 fma3 fma4"
for i in $CPU_USE_FLAGS_X86; do
	IUSE+=" cpu_flags_x86_$i"
done

RDEPEND="
	cuda? (
		>=dev-util/nvidia-cuda-toolkit-8.0[profiler]
		>=dev-libs/cudnn-6.0
	)
	virtual/blas
	dev-cpp/gflags
	dev-python/python-gflags"
#	dev-python/numpy[${PYTHON_USEDEP}]"
#sci-libs/openblas::science
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	)
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-util/cmake
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	virtual/mpi
	>=media-libs/opencv-3.4.1-r5[lapack,opencl,ffmpeg,threads]
"

S="${WORKDIR}/${MY_P}"
PATCHES=(
	"${FILESDIR}"/safe_read.patch
)
#Setup Environment Variables
export BUILD_TEST=0
export USE_OPENCV=1
export USE_FFMPEG=1
export BUILD_CUSTOM_PROTOBUF=0
export BLAS=Eigen
export FULL_CAFFE2=1
export USE_LMDB=1
export USE_MKLDNN=0
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

src_compile() {
	addpredict /dev/nvidiactl
}