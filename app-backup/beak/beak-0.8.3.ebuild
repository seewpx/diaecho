# Copyright 1999-2019 Xu Weiping
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3 bash-completion-r1
EGIT_REPO_URI="https://github.com/seewpx/beak.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${P}"

DESCRIPTION="a backup-mirror-share-rotation-pruning tool with the cloud/remote storage (rclone, rsync)."
HOMEPAGE="https://github.com/weetmuts/beak"

LICENSE="GPL-3"
SLOT="0"
IUSE="debug"
KEYWORDS="~amd64 "

RDEPEND="
    net-misc/rclone
    "
DEPEND="${RDEPEND}"

#src_install() {
#    emake install || die "emake install failed" 
#}