# Copyright (C) 2015 SUSE Linux GmbH
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
    #mouse_set 1023, 767;
    mouse_set 100, 100;
    mouse_set 1023, 767;

    #click btn on the mainpage of controlcenter
    assert_screen "dcc-main-display", 10;
    assert_and_click "dcc-main-display";
    sleep 2;

    assert_screen "dcc-slider-display", 10;

    assert_screen "dcc-backtohome-btn", 10;
    assert_and_dclick "dcc-backtohome-btn";
    mouse_click;
    sleep 5;
    mouse_set 100, 100;
    mouse_click;
    sleep 5;
    save_screenshot;
}

sub test {
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
