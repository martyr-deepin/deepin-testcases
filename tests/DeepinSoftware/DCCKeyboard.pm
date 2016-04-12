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

sub close_dcc_keyboard_caps_lock {

    assert_and_click 'dcc-keyboard-caps-lock-button-on';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-keyboard-caps-lock-button-off';
    refresh_dcc 'keyboard';
    assert_screen 'dcc-keyboard-caps-lock-button-off';

}

sub open_dcc_keyboard_caps_lock {

    assert_and_click 'dcc-keyboard-caps-lock-button-off';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-keyboard-caps-lock-button-on';
    refresh_dcc 'keyboard';
    assert_screen 'dcc-keyboard-caps-lock-button-on';

}

sub test_dcc_keyboard_caps_lock {

    close_dcc_keyboard_caps_lock;
    assert_and_click 'dcc-keyboard-reset';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-keyboard-snapshot';
    close_dcc_keyboard_caps_lock;
    open_dcc_keyboard_caps_lock;
    assert_screen 'dcc-keyboard-snapshot';

}

sub click_dcc_keyboard_layout_button_add {

    assert_and_click 'dcc-keyboard-layout-button-add';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-keyboard-layout-detail';

}

sub click_dcc_keyboard_layout_button_del {

    assert_and_click 'dcc-keyboard-layout-button-del';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-keyboard-layout-button-del-confirm';

}

sub add_dcc_keyboard_layout {

    click_dcc_keyboard_layout_button_add;
    assert_and_click 'dcc-keyboard-layout-afghanistan';
    assert_and_click 'dcc-keyboard-layout-add-confirm';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-keyboard-layout-afghanistan-added';
    refresh_dcc 'keyboard';
    assert_screen 'dcc-keyboard-layout-afghanistan-added';

}

sub del_dcc_keyboard_layout {

    click_dcc_keyboard_layout_button_del;
    assert_and_click 'dcc-keyboard-layout-afghanistan-del';
    mouse_hide;
    sleep 1;
    assert_and_click 'dcc-keyboard-layout-button-del-confirm';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-keyboard-snapshot';
    refresh_dcc 'keyboard';
    assert_screen 'dcc-keyboard-snapshot';

}

sub test_dcc_keyboard_layout {

    add_dcc_keyboard_layout;
    del_dcc_keyboard_layout;

}

sub test_dcc_keyboard_language {

    assert_and_click 'dcc-keyboard-language-button';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-keyboard-language-detail';
    assert_and_click 'dcc-keyboard-language-search';
    mouse_hide;
    sleep 1;
    type_string 'english';
    assert_screen 'dcc-keyboard-language-search-english';
    assert_and_click 'dcc-keyboard-language-button';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-keyboard-snapshot';

}

sub run {

    open_dcc 'keyboard';
    assert_screen 'dcc-keyboard-snapshot';
    test_dcc_keyboard_caps_lock;
    test_dcc_keyboard_layout;
    test_dcc_keyboard_language;
    close_dcc;

}

1;

# vim: set sw=4 et:
