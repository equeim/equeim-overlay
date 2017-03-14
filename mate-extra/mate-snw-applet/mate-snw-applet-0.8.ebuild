# Copyright 2015, 2017 Alexey Rochev <equeim@gmail.com>
# Distributed under the terms of the GNU General Public License v3

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
PYTHON_REQ_USE="threads(+)"

inherit python-any-r1 vala waf-utils

MY_PN="snw-plugin"

DESCRIPTION="Plugin for mate-panel to show StatusNotifierItems (also known as AppIndicators)"
HOMEPAGE="https://github.com/equeim/snw-plugin"
SRC_URI="https://github.com/equeim/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${MY_PN}-${PV}"

RDEPEND="
    dev-libs/libdbusmenu[gtk]
    mate-base/mate-panel[-gtk3]
"

DEPEND="
    ${RDEPEND}
    virtual/pkgconfig
"

src_prepare() {
    vala_src_prepare
    default
}

src_configure() {
    waf-utils_src_configure --mate
}
