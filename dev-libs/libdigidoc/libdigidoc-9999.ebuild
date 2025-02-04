# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/open-eid/${PN}.git"

inherit cmake flag-o-matic git-r3

DESCRIPTION="DigiDoc digital signature library"
HOMEPAGE="https://github.com/open-eid/libdigidoc http://id.ee"

LICENSE="LGPL-2.1"
KEYWORDS=""
SLOT="0"
IUSE="doc +utils"

RDEPEND="dev-libs/libxml2:2
	dev-libs/opensc
	dev-libs/openssl:0=
	sys-libs/zlib:0="
DEPEND="${RDEPEND}
	virtual/libiconv"
BDEPEND="virtual/pkgconfig
	doc? ( app-doc/doxygen )"

DOCS=( AUTHORS {README,RELEASE-NOTES}.md )

src_prepare() {
	default

	# fix version definition
	sed  -i -e '/^\tVERSION/s/MAJOR_VER/PROJECT_VERSION_MAJOR/' \
		-e '/^\tVERSION/s/MINOR_VER/PROJECT_VERSION_MINOR/' \
		-e '/^\tVERSION/s/RELEASE_VER/PROJECT_VERSION_PATCH/' \
		libdigidoc/CMakeLists.txt || die "sed failed"

	cmake_src_prepare
}

src_configure() {
	# gentoo zlib macro name
	append-cppflags "-DOF=_Z_OF"

	local mycmakeargs=(
		-DCMAKE_INSTALL_SYSCONFDIR="${EPREFIX}/etc"
		-DDOXYGEN_FOUND="$(usex doc yes no)"
		-DBUILD_TOOLS="$(usex utils)"
	)
	cmake_src_configure
}
