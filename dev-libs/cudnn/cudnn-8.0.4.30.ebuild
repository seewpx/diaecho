# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="NVIDIA Accelerated Deep Learning on GPU library"
HOMEPAGE="https://developer.nvidia.com/cuDNN"

SRC_URI="cuda11-0? ( cudnn-11.0-linux-x64-v${PV}.tgz )"

SLOT="0/7"
KEYWORDS="~amd64 ~amd64-linux"
RESTRICT="fetch"
LICENSE="NVIDIA-cuDNN"
QA_PREBUILT="*"

IUSE="+cuda11-0"
REQUIRED_USE="^^ ( cuda11-0 )"

S="${WORKDIR}"

DEPEND="cuda11-0? ( =dev-util/nvidia-cuda-toolkit-11.0* )"
RDEPEND="${DEPEND}"

src_install() {
        insinto /opt/cuda
        doins cuda/NVIDIA_SLA_cuDNN_Support.txt

        insinto /opt/cuda/targets/x86_64-linux/include
        doins -r cuda/include/*

        insinto /opt/cuda/targets/x86_64-linux/lib
        doins -r cuda/lib*/*
}