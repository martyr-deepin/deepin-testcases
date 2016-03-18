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
use deepinapi qw( open_dcc close_dcc refresh_dcc);

our $userpwd = "deepin";

sub doauth() {

    if (check_screen "dcc-user-add-auth", 10){
        assert_and_click "dcc-user-add-auth";
        sleep 2;

        if (get_var("USERPWD")){
            $userpwd = get_var("USERPWD");
        }
        type_string $userpwd;
        send_key "ret";
    }

}

sub adduser($$) {

    my $testuser = shift;
    my $testpasswd = shift;
    assert_and_click "dcc-user-add";
    type_string $testuser;
    send_key "tab";
    type_string $testpasswd;
    send_key "tab";
    type_string $testpasswd;
    assert_and_click "dcc-user-add-confirm";
    doauth;

}

sub deluser() {

    assert_and_click "dcc-user-del";
    assert_and_click "dcc-user-del-select";
    assert_and_click "dcc-user-del-confirm";
    doauth;
    assert_screen "dcc-user-del-ok";

}

sub run {

    open_dcc 'user';
    adduser 'test', 'test';
    refresh_dcc 'user';
    assert_screen 'dcc-user-add-ok';
    deluser;
    close_dcc;

}

1;

# vim: set sw=4 et:
