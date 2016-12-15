# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{3_4,3_5} )

inherit git-r3 python-single-r1

DESCRIPTION="Actions gestures on your touchpad using libinput"
HOMEPAGE="https://github.com/bulletmark/${PN}"
EGIT_REPO_URI="https://github.com/bulletmark/${PN}.git"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="kde gtk"

RDEPEND="${PYTHON_DEPS}
	dev-libs/libinput
	x11-misc/xdotool
	x11-misc/wmctrl"
DEPEND="gtk? ( x11-libs/gtk+:3 )
	kde? ( kde-plasma/kde-cli-tools:5 )
	dev-libs/libinput
	dev-util/desktop-file-utils"

src_prepare() {
	default

	# Fix kioclient binary name
	sed -i 's/kioclient/kioclient5/' libinput-gestures-setup \
		|| die "sed for kioclient"
}

pkg_postinst() {
	elog "You must be in the input group to read the touchpad device."
}
