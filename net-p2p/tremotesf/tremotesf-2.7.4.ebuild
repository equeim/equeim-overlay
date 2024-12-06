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

readonly _shared_libraries="
    dev-qt/qtbase:6[dbus,gui,network,ssl,widgets]
    kde-frameworks/kwidgetsaddons:6
    kde-frameworks/kwindowsystem:6[X,wayland]
    dev-libs/libfmt
    net-libs/libpsl
"

# Dependencies needed on build machine when cross-compiling (i.e. build tools)
BDEPEND="
    dev-qt/qtbase:6
    dev-qt/qttools:6[linguist]
    sys-devel/gettext
    virtual/pkgconfig
    app-arch/zstd
"

# Other build time dependencies (header-only libraries and test dependencies)
DEPEND="
    ${_shared_libraries}
    >=dev-libs/cxxopts-3.2.1
    test? ( dev-qt/qtbase:6[test] dev-cpp/cpp-httplib[ssl] )
"

# Runtime dependencies
RDEPEND="
    ${_shared_libraries}
    dev-qt/qtsvg:6
    kde-frameworks/breeze-icons:6
"

src_configure() {
    local mycmakeargs=("-DBUILD_TESTING=$(usex test)" "-DTREMOTESF_WITH_HTTPLIB=system")
    cmake_src_configure
}
