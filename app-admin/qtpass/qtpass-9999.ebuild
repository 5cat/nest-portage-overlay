# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit desktop git-r3 qmake-utils

DESCRIPTION="multi-platform GUI for pass, the standard unix password manager"
HOMEPAGE="https://qtpass.org/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/IJHack/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND="app-admin/pass
	dev-qt/qtcore:5
	dev-qt/qtgui:5[xcb]
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	net-misc/x11-ssh-askpass"
DEPEND="${RDEPEND}
	dev-qt/qtsvg:5
	dev-qt/linguist-tools:5
	test? ( dev-qt/qttest:5 )"

DOCS=( CHANGELOG.md CONTRIBUTING.md FAQ.md README.md  )

src_prepare() {
	default

	if ! use test ; then
		sed -i 's/SUBDIRS += src tests main/SUBDIRS += src main/' \
			"${S}"/qtpass.pro || die "sed for SUBDIRS failed"
		sed -i '/main\.depends = tests/d' \
			"${S}"/qtpass.pro || die "sed fot depends failed"
	fi
}

src_configure() {
	eqmake5 PREFIX="${D}"/usr
}

src_compile() {
	# Upstream parallel compilation bug
	emake -j1
}

src_install() {
	default

	doman ${PN}.1

	insinto /usr/share/applications
	doins "${PN}.desktop"

	newicon artwork/icon.png "${PN}-icon.png"

	insinto /usr/share/appdata
	doins qtpass.appdata.xml
}
