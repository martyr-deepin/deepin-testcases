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

    assert_screen "desktop-fashion-mode-default", 2;

    # mouse
    # assert_and_click "launcher-btn-fashion-mode";
    # assert_screen "launcher-fashion-mode", 3;

    # keyboard
    send_key "win";
    assert_screen "launcher-fashion-mode", 15;

    # show deepin software
    type_string "deepin";
    assert_screen "launcher-search-deepin", 3;
    # exit search
    send_key "esc";

    # exit launcher
    send_key "esc", 2;

    sleep 2;
}

sub test_flags {
    # without anything - rollback to 'lastgood' snapshot if failed
    # 'fatal' - whole test suite is in danger if this fails
    # 'milestone' - after this test succeeds, update 'lastgood'
    # 'important' - if this fails, set the overall state to 'fail'
    return { milestone => 1 };
}

1;

# vim: set sw=4 et:
