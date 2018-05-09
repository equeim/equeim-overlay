# Copyright 2017 Alexey Rochev <equeim@gmail.com>
# Distributed under the terms of the GNU General Public License v3

EAPI=6

inherit qmake-utils xdg

MY_PN="tremotesf2"

DESCRIPTION="Remote GUI for transmission-daemon"
HOMEPAGE="https://github.com/equeim/tremotesf2"
SRC_URI="https://github.com/equeim/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${MY_PN}-${PV}"

RDEPEND="
    >=dev-qt/qtcore-5.2.0:5
    >=dev-qt/qtnetwork-5.2.0:5
    >=dev-qt/qtgui-5.2.0:5
    >=dev-qt/qtwidgets-5.2.0:5
    >=dev-qt/qtdbus-5.2.0:5
    kde-frameworks/kwidgetsaddons:5
"

DEPEND="
    ${RDEPEND}
    >=dev-qt/qtconcurrent-5.2.0:5
"

src_configure() {
    eqmake5 PREFIX="${EPREFIX}/usr"
}

src_install() {
    emake INSTALL_ROOT="${D}" install
    einstalldocs
}
