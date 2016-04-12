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

our @itemlist = qw( theme window icon cursor wallpaper fonts );

sub run {

    open_dcc 'personalization';
    assert_screen 'dcc-personalization-snapshot';

    assert_and_click 'dcc-personalization-theme';
    mouse_set 1023, 0;

    foreach my $item (@itemlist) {

        assert_and_click 'dcc-personalization-'.$item;
        assert_screen    'dcc-personalization-'.$item.'-detail';
        mouse_click;
        sleep 4;

    }

    close_dcc;

}

1;

# vim: set sw=4 et:
