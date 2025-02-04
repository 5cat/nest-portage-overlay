# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_SUM=(
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/fatih/color v1.13.0"
	"github.com/fatih/color v1.13.0/go.mod"
	"github.com/google/go-cmp v0.5.6"
	"github.com/google/go-cmp v0.5.6/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.3.0"
	"github.com/kr/pretty v0.3.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/mattn/go-colorable v0.1.9/go.mod"
	"github.com/mattn/go-colorable v0.1.12"
	"github.com/mattn/go-colorable v0.1.12/go.mod"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mattn/go-isatty v0.0.14"
	"github.com/mattn/go-isatty v0.0.14/go.mod"
	"github.com/mattn/go-runewidth v0.0.13"
	"github.com/mattn/go-runewidth v0.0.13/go.mod"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e/go.mod"
	"github.com/rivo/uniseg v0.2.0"
	"github.com/rivo/uniseg v0.2.0/go.mod"
	"github.com/robfig/cron v1.2.0"
	"github.com/robfig/cron v1.2.0/go.mod"
	"github.com/rogpeppe/go-internal v1.6.1/go.mod"
	"github.com/rogpeppe/go-internal v1.8.1"
	"github.com/rogpeppe/go-internal v1.8.1/go.mod"
	"github.com/yuin/goldmark v1.4.12"
	"github.com/yuin/goldmark v1.4.12/go.mod"
	"golang.org/x/sync v0.0.0-20220513210516-0976fa681c29"
	"golang.org/x/sync v0.0.0-20220513210516-0976fa681c29/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/sys v0.0.0-20210927094055-39ccf1dd6fa6/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0"
	"gopkg.in/yaml.v3 v3.0.0/go.mod"
	)
go-module_set_globals

DESCRIPTION="Static checker for GitHub Actions workflow files"
HOMEPAGE="https://github.com/rhysd/actionlint"
SRC_URI="https://github.com/rhysd/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"
RESTRICT="test"
PROPERTIES="test_network"

BDEPEND="doc? ( app-text/ronn )"

DOCS=( {CHANGELOG,README}.md docs/{checks,config,usage}.md )

src_compile() {
	LDFLAGS="-s -w -X github.com/rhysd/actionlint.version=${PV}"

	go build -ldflags "${LDFLAGS}" ./cmd/actionlint || die "build failed"

	use doc && emake man
}

src_install() {
	einstalldocs
	dobin actionlint
	use doc && doman man/actionlint.1
}
