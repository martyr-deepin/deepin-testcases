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


sub test_dcc_powermgm_keydown($) {

    my $type = shift;
    assert_and_click 'dcc-powermgm-'.$type;
    mouse_hide;
    sleep 1;
    assert_screen    'dcc-powermgm-'.$type.'-highlight';
    refresh_dcc 'powermgm';
    assert_screen    'dcc-powermgm-'.$type.'-highlight';

}

sub click_dcc_powermgm_wakeup_button($) {

    my $type = shift;
    if ( 'on' eq $type ) {
        assert_and_click 'dcc-powermgm-wakeup-button-'.$type;
        mouse_hide;
        sleep 1;
        assert_screen 'dcc-powermgm-wakeup-button-off';
    }

    if ( 'off' eq $type ) {
        assert_and_click 'dcc-powermgm-wakeup-button-'.$type;
        mouse_hide;
        sleep 1;
        assert_screen 'dcc-powermgm-wakeup-button-on';
    }

}

sub test_dcc_powermgm_wakeup {

    click_dcc_powermgm_wakeup_button 'on';
    click_dcc_powermgm_wakeup_button 'off';

}

sub test_dcc_powermgm_plugged_in($) {

    my $type = shift;
    assert_and_click 'dcc-powermgm-plugged-in-'.$type;
    mouse_hide;
    sleep 1;
    assert_screen    'dcc-powermgm-plugged-in-'.$type.'-highlight';
    refresh_dcc 'powermgm';
    assert_screen    'dcc-powermgm-plugged-in-'.$type.'-highlight';

}

sub run {

    open_dcc 'powermgm';
    assert_screen 'dcc-powermgm-snapshot';
    test_dcc_powermgm_keydown 'shutdown';
    test_dcc_powermgm_keydown 'suspend';
    test_dcc_powermgm_keydown 'ask';
    test_dcc_powermgm_wakeup;
    test_dcc_powermgm_plugged_in 'power-saver'; 
    test_dcc_powermgm_plugged_in 'high-performance';
    test_dcc_powermgm_plugged_in 'custom';
    test_dcc_powermgm_plugged_in 'balanced';
    close_dcc;

}

1;

# vim: set sw=4 et:
