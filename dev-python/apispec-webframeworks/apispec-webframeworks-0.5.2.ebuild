# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Web framework plugins for apispec"
HOMEPAGE="https://github.com/marshmallow-code/apispec-webframeworks"
SRC_URI="https://github.com/marshmallow-code/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/apispec[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="test? ( dev-python/bottle[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		www-servers/tornado[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -type d -name "tests" -exec rm -rv {} + || die "tests removing failed"
}
