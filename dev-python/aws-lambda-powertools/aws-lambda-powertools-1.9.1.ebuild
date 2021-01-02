# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=pyproject.toml
PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1 optfeature

MY_PN="${PN}-python"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A suite of Python utilities for AWS Lambda functions"
HOMEPAGE="https://github.com/awslabs/aws-lambda-powertools-python"
SRC_URI="https://github.com/awslabs/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/aws-xray-sdk-python[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/fastjsonschema[${PYTHON_USEDEP}]
	dev-python/jmespath[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="test? ( dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/python-email-validator[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/typing-extensions[${PYTHON_USEDEP}]' python3_7) )"

S="${WORKDIR}/${MY_P}"

distutils_enable_tests pytest

python_prepare_all() {
	# Disable pytest options
	sed -i '/addopts/d' pytest.ini || die "sed failed for pytest.ini"

	distutils-r1_python_prepare_all
}

pkg_postinst() {
	optfeature "support of deep validation" dev-python/pydantic \
		dev-python/python-email-validator dev-python/typing-extensions
}
