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
use deepinapi qw( open_dcc close_dcc refresh_dcc );

sub click_dcc_mouse_left_button {

    assert_and_click 'dcc-mouse-left-button';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-mouse-left-button-highlight';
    refresh_dcc 'mouse';
    assert_screen 'dcc-mouse-left-button-highlight';

}

sub click_dcc_mouse_right_button {

    assert_and_click 'dcc-mouse-right-button';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-mouse-right-button-highlight';
    refresh_dcc 'mouse';
    assert_screen 'dcc-mouse-right-button-highlight';

}

sub click_dcc_mouse_reset {

    assert_and_click 'dcc-mouse-reset';
    mouse_hide;
    sleep 1;

}

sub run {

    open_dcc 'mouse';
    assert_screen 'dcc-mouse-snapshot';
    click_dcc_mouse_right_button;
    click_dcc_mouse_reset;
    assert_screen 'dcc-mouse-snapshot';
    click_dcc_mouse_right_button;
    click_dcc_mouse_left_button;
    assert_screen 'dcc-mouse-snapshot';
    close_dcc;

}

1;

# vim: set sw=4 et:
