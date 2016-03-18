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

our @itemlist = qw( explore mail texttool music video picture terminal 
                    auto-cd auto-dvd auto-player auto-photo auto-soft auto);

sub run {

    open_dcc 'defaultapp';
    assert_screen 'dcc-defaultapp-snapshot';
    
    foreach my $item (@itemlist) {

        assert_and_click 'dcc-defaultapp-'.$item;
        assert_screen    'dcc-defaultapp-'.$item.'-detail';
        mouse_click;
        sleep 4;

    }

    assert_screen    "dcc-defaultapp-auto-all";
    mouse_click;
    assert_screen    "dcc-defaultapp-auto-detail";
    assert_and_click "dcc-defaultapp-reset";
    assert_screen    "dcc-defaultapp-auto-all";

    close_dcc;

}

1;

# vim: set sw=4 et:
