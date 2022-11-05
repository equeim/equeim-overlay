# Copyright 2017-2022 Alexey Rochev <equeim@gmail.com>
# Distributed under the terms of the GNU General Public License v3

EAPI=8

inherit cmake xdg

DESCRIPTION="Remote GUI for transmission-daemon"
HOMEPAGE="https://github.com/equeim/tremotesf2"
SRC_URI="https://github.com/equeim/tremotesf2/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
    dev-qt/qtcore:5
    dev-qt/qtdbus:5
    sys-devel/gettext
"

readonly _linked_libraries="
    dev-qt/qtcore:5
    dev-qt/qtnetwork:5
    dev-qt/qtgui:5
    dev-qt/qtwidgets:5
    dev-qt/qtdbus:5
    kde-frameworks/kwidgetsaddons:5
    kde-frameworks/kwindowsystem:5
    dev-libs/libfmt
"

DEPEND="
    ${_linked_libraries}
    dev-qt/qtconcurrent:5
    dev-qt/qttest:5
"

RDEPEND="${_linked_libraries}"

src_prepare() {
    cmake_src_prepare
    xdg_src_prepare
}
