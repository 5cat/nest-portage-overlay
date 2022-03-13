# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DUNE_PKG_NAME="lame"
EGIT_REPO_URI="https://github.com/savonet/${PN}.git"

inherit dune git-r3

DESCRIPTION="OCaml bindings to lame"
HOMEPAGE="https://github.com/savonet/ocaml-lame"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS=""
IUSE="+ocamlopt"

RDEPEND="media-sound/lame"
DEPEND="${RDEPEND}"
BDEPEND="dev-ml/dune-configurator:0="

DOCS=( CHANGES README.me )
