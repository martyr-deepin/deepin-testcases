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

sub adduser {
    # show controlcenter
    mouse_set 100, 100;
    mouse_set 1023, 767;

    # click btn on the mainpage of controlcenter
	assert_screen "dcc-main-area";
    assert_screen "dcc-main-user", 10;
    assert_and_click "dcc-main-user";
    sleep 2;

    assert_screen "dcc-slider-useradd", 10;

    assert_screen "dcc-backtohome-btn", 10;
    assert_and_click "dcc-backtohome-btn", 10;
    mouse_click;
    sleep 5;
    mouse_set 100, 100;
    mouse_click;
    sleep 5;
    save_screenshot;

}


sub test {
    # click useradd btn
    assert_and_click "dcc-useradd-btn", 10;
    sleep 2;

    # input userinfo to dcctext
    my $username = get_var("ADDUNAME");
    my $passwd = get_var("ADDUPWD");
    mouse_set 880, 198;
    mouse_click;
    type_string $username;
    sleep 1;
    send_key "tab";
    type_string $passwd;
    sleep 1;
    send_key "tab";
    type_string $passwd;
    assert_and_click "dcc-useradd-ok";

    # authentication of admin
    sleep 5;
    mouse_set 405, 379;
    mouse_click;
    type_string "deepin";
    sleep 1;
    send_key "tab";
    send_key "tab";
    send_key "tab";
    send_key "ret";
}

sub deluser {
    # wait for useradded page
    mouse_set 1023, 767;
    assert_screen "dcc-useradded-area", 10;
    #mouse_set 50, 50;
    mouse_set 100, 100;

    # click the delbtn
    assert_and_click "dcc-userdel-btn";
    sleep 2;

    # click the delbtn2
    assert_and_click "dcc-userdel-btn2";
    sleep 2;

    # click deluser ok

    assert_and_click "dcc-userdel-ok";
}

sub run {
    adduser;
    #sleep 8;
    #deluser;

    #exit dcc-user
    #sleep 3;
    #assert_and_click "dcc-backtohome-btn";
    #mouse_set 50, 250;
    #mouse_click;
}

1;

# vim: set sw=4 et:
