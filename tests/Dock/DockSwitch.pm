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
    assert_screen "desktop-fashion-mode-default", 15;

    my $dockMenuX = 512;
    my $dockMenuY = 753;

    # switch to high performance mode
    mouse_set $dockMenuX, $dockMenuY;
    mouse_click "right";
    assert_and_click "dock-memu-high-performance-mode-btn";
    assert_screen "desktop-high-performance-mode-default", 3;

    # switch to classic mode
    mouse_set $dockMenuX, $dockMenuY;
    mouse_click "right";
    assert_and_click "dock-memu-classic-mode-btn";
    assert_screen "desktop-classic-mode-default", 3;

    # switch back to fashion mode
    mouse_set $dockMenuX, $dockMenuY;
    mouse_click "right";
    assert_and_click "dock-memu-fashion-mode-btn";
    assert_screen "desktop-fashion-mode-default", 3;

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
