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

use strict;
use base "installbasetest";
use testapi;

sub run {

    mouse_hide;

    # waiting for installation to the end
    assert_screen "inst-finish", 40 * 60;

    mouse_hide;

    # click to reboot
    #assert_and_click "inst-finish-restart-btn", 1;

    send_key "tab";
    send_key "tab";
    send_key "ret";

}

sub test_flags {
    return { important => 1 , milestone => 1};
}

1;

# vim: set sw=4 et:
