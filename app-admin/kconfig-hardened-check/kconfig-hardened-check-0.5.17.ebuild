# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A script to check the hardening options in the Linux kernel config"
HOMEPAGE="https://github.com/a13xp0p0v/kconfig-hardened-check"
SRC_URI="https://github.com/a13xp0p0v/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
