# Copyright 2017-2020 Alexey Rochev <equeim@gmail.com>
# Distributed under the terms of the GNU General Public License v3

EAPI=7

inherit cmake xdg

MY_PN="tremotesf2"

DESCRIPTION="Remote GUI for transmission-daemon"
HOMEPAGE="https://github.com/equeim/tremotesf2"
SRC_URI="https://github.com/equeim/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${MY_PN}-${PV}"

RDEPEND="
    >=dev-qt/qtcore-5.6.0:5
    >=dev-qt/qtnetwork-5.6.0:5
    >=dev-qt/qtgui-5.6.0:5
    >=dev-qt/qtwidgets-5.6.0:5
    >=dev-qt/qtdbus-5.6.0:5
    >=dev-qt/qtx11extras-5.6.0:5
    kde-frameworks/kwidgetsaddons:5
    kde-frameworks/kwindowsystem:5
"

DEPEND="
    ${RDEPEND}
    >=dev-qt/qtconcurrent-5.6.0:5
    >=sys-devel/gettext-0.19.7
"

src_prepare() {
    cmake_src_prepare
    xdg_src_prepare
}
