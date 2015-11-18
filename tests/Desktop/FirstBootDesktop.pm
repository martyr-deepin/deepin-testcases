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
use bmwqemu;

sub loadFirstBootGuidTests{
    #mouse_hide;
    mouse_set 100, 100;

    # tmp
    #sleep 15;
    #save_screenshot;

    if (get_var("DO_WELCOME_GUID")){

        assert_screen "welcome-guid-default", 60;
        assert_and_click "welcome-guid-skip-btn";
    }
    else
    {
        assert_screen "desktop-default", 60;
    }


    # finish loading desktop
    # make snapshot
    #bmwqemu::make_snapshot("Finish-Loading-Desktop");

    # flush
    sleep 5;

}

sub run {

    # deal with the user guide
    loadFirstBootGuidTests;

    sleep 20;

}


sub test_flags {
    # without anything - rollback to 'lastgood' snapshot if failed
    # 'fatal' - whole test suite is in danger if this fails
    # 'milestone' - after this test succeeds, update 'lastgood'
    # 'important' - if this fails, set the overall state to 'fail'
    return { important => 1 , milestone => 1};
}

sub post_fail_hook {

    deepinapi::collect_logs();

}


1;

# vim: set sw=4 et:
