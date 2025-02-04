# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )
EGIT_REPO_URI="https://github.com/Azure/azure-sdk-for-python.git"

inherit distutils-r1 git-r3

DESCRIPTION="Microsoft Azure Client Common Library for Python"
HOMEPAGE="https://github.com/Azure/azure-python-devtools"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

S="${WORKDIR}/sdk/core/${PN}"

DOCS=( {CHANGELOG,README}.md )

distutils_enable_tests pytest
