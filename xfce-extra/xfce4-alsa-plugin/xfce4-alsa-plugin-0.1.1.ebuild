# Copyright 2015, 2017 Alexey Rochev <equeim@gmail.com>
# Distributed under the terms of the GNU General Public License v3

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
PYTHON_REQ_USE="threads(+)"

inherit python-any-r1 vala waf-utils

DESCRIPTION="Simple ALSA volume control for xfce4-panel"
HOMEPAGE="https://github.com/equeim/xfce4-alsa-plugin"
SRC_URI="https://github.com/equeim/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
    media-libs/alsa-lib
    xfce-base/xfce4-panel
"

DEPEND="
    ${RDEPEND}
    virtual/pkgconfig
"

src_prepare() {
    vala_src_prepare
    default
}
