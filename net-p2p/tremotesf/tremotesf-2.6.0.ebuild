# Copyright 2017-2022 Alexey Rochev <equeim@gmail.com>
# Distributed under the terms of the GNU General Public License v3

EAPI=8

inherit unpacker cmake xdg

DESCRIPTION="Remote GUI for transmission-daemon"
HOMEPAGE="https://github.com/equeim/tremotesf2"
SRC_URI="https://github.com/equeim/tremotesf2/releases/download/${PV}/${P}.tar.zst"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

# Dpendencies needed on build machine when cross-compiling
BDEPEND="
    dev-qt/qtcore:5
    dev-qt/qtdbus:5
    sys-devel/gettext
    virtual/pkgconfig
    app-arch/zstd
"

readonly _shared_libraries="
    dev-qt/qtcore:5
    dev-qt/qtnetwork:5[ssl]
    dev-qt/qtgui:5
    dev-qt/qtwidgets:5
    dev-qt/qtdbus:5
    kde-frameworks/kwidgetsaddons:5
    kde-frameworks/kwindowsystem:5
    dev-libs/libfmt
    net-libs/libpsl
"

readonly _header_only_or_test_libraries="
    dev-qt/qtconcurrent:5
    dev-libs/cxxopts
    test? ( dev-qt/qttest:5 dev-cpp/cpp-httplib[ssl] )
"

DEPEND="
    ${_shared_libraries}
    ${_header_only_or_test_libraries}
"

RDEPEND="${_shared_libraries}"

src_configure() {
    local mycmakeargs=("-DBUILD_TESTING=$(usex test)")
    cmake_src_configure
}
