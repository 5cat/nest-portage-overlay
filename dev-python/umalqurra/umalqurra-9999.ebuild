# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
EGIT_REPO_URI="https://github.com/tytkal/python-hijiri-ummalqura.git"

inherit distutils-r1 git-r3

DESCRIPTION="Date Api that support Hijri Umalqurra calendar"
HOMEPAGE="https://github.com/tytkal/python-hijiri-ummalqura"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
