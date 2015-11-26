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

sub run {
    # show controlcenter
    mouse_set 100, 100;
    mouse_set 1023, 767;

    # click btn on the mainpage of controlcenter
    assert_screen "dcc-main-defaultapp", 10;
    assert_and_click "dcc-main-defaultapp";
    sleep 2;

    assert_screen "dcc-slider-defaultapp", 10;

    assert_screen "dcc-backtohome-btn", 10;
    assert_and_click "dcc-backtohome-btn";
    sleep 5;
    mouse_set 100, 100;
    mouse_click;
    sleep 5;
    save_screenshot;

}

1;

# vim: set sw=4 et:
