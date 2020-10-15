# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6


SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/aravis/0.6/aravis-${PV}.tar.xz"
DESCRIPTION="Library for video acquisition using Genicam cameras"
HOMEPAGE="https://github.com/AravisProject/aravis"
LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 "

# FIXME: As of right now tests are always built, once that changes a USE flag
# should be added. c.f. https://github.com/AravisProject/aravis/issues/286
IUSE="gtk-doc fast-heartbeat gstreamer introspection packet-socket usb viewer"

GST_DEPEND="
        media-libs/gstreamer:1.0
        media-libs/gst-plugins-base:1.0
"
BDEPEND="
        dev-util/glib-utils
        virtual/pkgconfig
        gtk-doc? (
                dev-util/gtk-doc
                app-text/docbook-xml-dtd:4.3
        )
        introspection? ( dev-libs/gobject-introspection:= )
"
DEPEND="
        dev-libs/glib:2[gtk-doc?]
        dev-libs/libxml2:2
        sys-libs/zlib
        gstreamer? ( ${GST_DEPEND} )
        packet-socket? ( sys-process/audit )
        usb? ( virtual/libusb:1 )
        viewer? (
                ${GST_DEPEND}
                x11-libs/gtk+:3
                x11-libs/libnotify
        )
"
RDEPEND="${DEPEND}"

src_prepare() {
    autoreconf -i
    default
}