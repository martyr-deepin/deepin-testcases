# Copyright (C) 2014 SUSE Linux GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

use base "basetest";
use strict;
use testapi;

sub run {

    assert_screen "desktop-fashion-mode-default", 5;

    # launcher start up
    # send_key "win";
    # sleep 1;

    assert_and_click "laucher-start-btn-fashion-mode-default";

    # search deepin-music-player
    type_string "deepin-music-player";
    assert_screen "laucher-search-deepin-music-player";
    send_key "ret";

    # start up deepin-music-player
    assert_screen "deepin-music-player-start-up-1", 20;

    # click the third btn
    mouse_set 535, 526;
    mouse_click;

    assert_screen "deepin-music-player-start-up-3", 5;

    # entry
    assert_and_click "deepin-music-player-start-up-btn";

}

sub test_flags {
    # without anything - rollback to 'lastgood' snapshot if failed
    # 'fatal' - whole test suite is in danger if this fails
    # 'milestone' - after this test succeeds, update 'lastgood'
    # 'important' - if this fails, set the overall state to 'fail'
    return { important => 1 };
}

1;

# vim: set sw=4 et:
