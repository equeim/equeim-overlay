# Copyright 2015 Alexey Rochev <equeim@gmail.com>
# Distributed under the terms of the GNU General Public License v3

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )
PYTHON_REQ_USE="threads(+)"

inherit python-any-r1 vala waf-utils

DESCRIPTION="Simple ALSA volume control for xfce4-panel"
HOMEPAGE="https://github.com/equeim/xfce4-alsa-plugin"
SRC_URI="https://github.com/equeim/xfce4-alsa-plugin/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/alsa-lib
        xfce-base/xfce4-panel"
