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
use deepinapi qw{ open_tty };

sub send_password {

    my $userpwd = "deepin";

    if (get_var("USERPWD")){
        $userpwd = get_var("USERPWD");
    }

    # login
    sleep 3;
    type_string "$userpwd";
    sleep 1;
    send_key "ret";

}

sub run {

    open_tty "f2";
    type_string "cat /etc/apt/sources.list\n";
    sleep 2;
    save_screenshot;
    sleep 3;
    send_key "ctrl-l";
    assert_screen "tty-ctrl-l", 5;
    type_string "grep '^deb \\[by-hash=force\\] http://packages.deepin.com/deepin unstable main contrib non-free' /etc/apt/sources.list\n";
    assert_screen "source-list-content", 10;

    send_key "ctrl-l";
    assert_screen "tty-ctrl-l", 5;
    type_string "grep -v '^deb \\[by-hash=force\\] http://packages.deepin.com/deepin unstable main contrib non-free' /etc/apt/sources.list\n";
    assert_screen "source-list-comment", 10;


    send_key "ctrl-l";
    assert_screen "tty-ctrl-l", 5;
    type_string "sudo apt-get update\n";
    
    if (check_screen("source-list-password", 5)) {

        send_password;

    }

    assert_screen "source-list-update", 300;

    type_string "logout\n";
    send_key "ctrl-alt-f7";
    assert_screen "desktop-default", 30;
    sleep 2;

}

1;

# vim: set sw=4 et:
