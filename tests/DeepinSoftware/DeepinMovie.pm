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

use strict;
use base "softwarebasetest";
use testapi;
use deepinapi;

sub open_close_dmovie {

    #close networktip
    sleep 3;
    if (check_screen "dcc-networktips-check"){
        mouse_set 977, 21;
        mouse_click;
    }

    #open deepin-movie in launcher
    send_key "win";
    assert_screen "launcher-search-area", 15;
    type_string "deepin-movie";
    assert_screen "launcher-search-deepinmovie", 10;
    mouse_set 250, 126;
    mouse_click;
    assert_screen "deepinmovie-main-area", 10;

    #send_key "ctrl-o";

    #close deepin-movie
    mouse_set 915, 122;
    mouse_click;

    save_screenshot;

}

sub run {

    open_close_dmovie;

    # press enter to boot right away
    #send_key "ret";

    # wait for the desktop to appear
    #assert_and_click "desktop";

}

1;

# vim: set sw=4 et:
