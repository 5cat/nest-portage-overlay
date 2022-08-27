# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
EGIT_REPO_URI="https://github.com/kennethreitz/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="Text UI colors"
HOMEPAGE="https://github.com/kennethreitz/crayons"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/colorama[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

distutils_enable_tests unittest

python_test() {
	esetup.py test
}
