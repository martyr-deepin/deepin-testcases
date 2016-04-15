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

sub test_dcc_shortcut_search {

    assert_and_click 'dcc-shortcut-search';
    mouse_hide;
    sleep 1;
    type_string 'tu';
    assert_screen 'dcc-shortcut-search-tu';
    assert_and_click 'dcc-shortcut-search-tu-close';
    mouse_hide;
    mouse_click;
    sleep 1;
    assert_screen 'dcc-shortcut-snapshot';

}

our @itemlist = qw( system window workspace );

sub test_dcc_shortcut_module($) {

    my $module = shift;
    assert_and_click 'dcc-shortcut-'.$module;
    mouse_hide;
    sleep 1;
    assert_screen    'dcc-shortcut-'.$module.'-detail';
    assert_and_click 'dcc-shortcut-'.$module;

}

sub add_dcc_shortcut_custom {

    assert_and_click 'dcc-shortcut-custom-add';
    mouse_hide;
    sleep 1;
    assert_and_click 'dcc-shortcut-custom-add-name';
    type_string 'test';
    assert_and_click 'dcc-shortcut-custom-add-command';
    type_string 'test';
    assert_and_click 'dcc-shortcut-custom-add-comfirm';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-shortcut-custom-add-ok';
    assert_and_click 'dcc-shortcut-custom-add-test-key';
    send_key 'alt-q';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-shortcut-custom-add-test-key-ok';

}

sub del_dcc_shortcut_custom {

    assert_and_click 'dcc-shortcut-custom-del';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-shortcut-custom-del-detail';
    assert_and_click 'dcc-shortcut-custom-del-test';
    mouse_hide;
    sleep 1;
    assert_and_click 'dcc-shortcut-custom-del-test-done';
    mouse_hide;
    sleep 1;

}

sub test_dcc_shortcut_custom {

    add_dcc_shortcut_custom;
    del_dcc_shortcut_custom;

}

sub test_dcc_shortcut_launcher {

    assert_and_click 'dcc-shortcut-system';
    mouse_hide;
    assert_screen 'dcc-shortcut-system-detail';
    assert_and_click 'dcc-shortcut-system-launcher-key';
    mouse_hide;
    sleep 1;
    send_key 'alt-q';
    assert_screen 'dcc-shortcut-system-launcher-key-ok';
    refresh_dcc 'shortcut';
    assert_and_click 'dcc-shortcut-system';
    mouse_hide;
    assert_screen 'dcc-shortcut-system-launcher-key-ok';
    assert_and_click 'dcc-shortcut-reset';
    mouse_hide;
    assert_screen 'dcc-shortcut-system-detail';
    refresh_dcc 'shortcut';
    assert_and_click 'dcc-shortcut-system';
    mouse_hide;
    assert_screen 'dcc-shortcut-system-detail';

}

sub run {

    open_dcc 'shortcut';
    sleep 2;
    assert_screen 'dcc-shortcut-snapshot';
    test_dcc_shortcut_search;

    foreach my $item (@itemlist) {
        test_dcc_shortcut_module($item);
    }

    assert_screen 'dcc-shortcut-snapshot';
    test_dcc_shortcut_custom;
    assert_screen 'dcc-shortcut-snapshot';
    test_dcc_shortcut_launcher;
    close_dcc;

}

1;

# vim: set sw=4 et:
