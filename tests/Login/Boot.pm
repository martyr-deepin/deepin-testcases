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

sub login{
    my $username = "deepin";
    my $userpwd = "deepin";

    if (get_var("USERNAME")){
        my $username = get_var("USERNAME");
    }

    if (get_var("USERPWD")){
        my $userpwd = get_var("USERPWD");
    }

    type_string $username;
    send_key "ret";
    type_string $userpwd;

    # login
    send_key "ret";

}

sub run {
    # boot
    # assert_screen "boot"

    mouse_hide;

    # grub
    assert_screen "grub2", 15;

    # login screen
    assert_screen "login", 50;

    # login
    login;
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
