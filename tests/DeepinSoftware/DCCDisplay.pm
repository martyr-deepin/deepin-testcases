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

use base "softwarebasetest";
use strict;
use testapi;
use deepinapi;

sub run {
    #close networktip
    sleep 3;
    if (check_screen "dcc-networktips-check"){
        mouse_set 977, 21;
        mouse_click;
    }

    #show controlcenter
    #mouse_set 1023, 767;
    mouse_set 1024, 768;

    #click displaybtn on the mainpage of controlcenter
    assert_screen "dcc-main-area", 10;
    #mouse_set 50, 50;
    #mouse_hide;
    mouse_set 100, 100;
    assert_and_click "dcc-main-display";
    assert_screen "dcc-display-main-area", 10;
    sleep 2;
    #open rotating setting
    #mouse_set 1000, 429;
    #mouse_click;
    assert_and_click "dcc-display-rotating-open-click";
    assert_screen "dcc-display-rotating-area", 10;
    sleep 2;

    #change brightness setting
    #mouse_set 867, 431;
    #mouse_click;
    #sleep 2;

    #exit dcc--display
    assert_and_click "dcc-backtohome-btn";
    #mouse_set 50, 50;
    mouse_set 100, 100;
    mouse_click;

}

1;

# vim: set sw=4 et:
