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

our $userpwd = "deepin";

sub click_dcc_datetime_synchronization_button($) {

    my $type = shift;
    if ( 'off' eq $type) {
        assert_and_click 'dcc-datetime-synchronization-button-off';
        mouse_hide;
        sleep 1;
    }

    if ( 'on' eq $type) {
        assert_and_click 'dcc-datetime-synchronization-button-on';
        mouse_hide;
        sleep 1;
    }

}

sub close_dcc_datetime_synchronization {

    click_dcc_datetime_synchronization_button 'on';
    mouse_hide;
    sleep 1;
    # assert_screen 'dcc-datetime-synchronization-off';
    if (check_screen 'dcc-datetime-synchronization-confirm', 10) {
        #assert_and_click 'dcc-datetime-synchronization-confirm';
        if (get_var("USERPWD")){
            $userpwd = get_var("USERPWD");
        }
        type_string $userpwd;
        sleep 2;
        send_key "ret";
        assert_screen 'dcc-datetime-synchronization-off';
    } else {
        assert_screen 'dcc-datetime-synchronization-off';
    }

}

sub open_dcc_datetime_synchronization {

    click_dcc_datetime_synchronization_button 'off';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-datetime-snapshot';

}

sub test_dcc_datetime_synchronization {

    close_dcc_datetime_synchronization;
    open_dcc_datetime_synchronization;

}

sub click_dcc_datetime_24_hour_button($) {

    my $type = shift;
    if ( 'off' eq $type) {
        # assert_and_click 'dcc-datetime-24-hour-button-off';
        mouse_set 988, 261;
        mouse_click;
        mouse_hide;
        sleep 1;
    }

    if ( 'on' eq $type) {
        # assert_and_click 'dcc-datetime-24-hour-button-on';
        mouse_set 988, 261;
        mouse_click;
        mouse_hide;
        sleep 1;
    }

}

sub close_dcc_datetime_24_hour {

    click_dcc_datetime_24_hour_button 'on';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-datetime-24-hour-off';

}

sub open_dcc_datetime_24_hour {

    click_dcc_datetime_24_hour_button 'off';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-datetime-snapshot';

}

sub test_dcc_datetime_24_hour {

    close_dcc_datetime_24_hour;
    open_dcc_datetime_24_hour;

}

sub click_dcc_datetime_timezone_add_button {

    assert_and_click 'dcc-datetime-timezone-add-button';
    mouse_hide;
    sleep 1;

}

sub click_dcc_datetime_timezone_del_button {

    assert_and_click 'dcc-datetime-timezone-del-button';
    mouse_hide;
    sleep 1;

}

sub add_dcc_datetime_timezone {

    click_dcc_datetime_timezone_add_button;
    assert_screen 'dcc-datetime-timezone-detail';
    assert_and_click 'dcc-datetime-timezone-niue';
    assert_screen 'dcc-datetime-timezone-add-confirm';
    assert_and_click 'dcc-datetime-timezone-add-confirm';
    mouse_hide;
    sleep 1;
    assert_screen 'dcc-datetime-timezone-niue-added';

}

sub del_dcc_datetime_timezone {

    click_dcc_datetime_timezone_del_button;
    assert_screen    'dcc-datetime-timezone-del-confirm';
    assert_and_click 'dcc-datetime-timezone-niue-del-button';
    assert_and_click 'dcc-datetime-timezone-del-confirm';
    mouse_hide;
    sleep 1;

}

sub test_dcc_datetime_timezone {

    add_dcc_datetime_timezone;
    del_dcc_datetime_timezone;

}

sub run {

    open_dcc 'datetime';
    assert_screen 'dcc-datetime-snapshot';
    test_dcc_datetime_synchronization;
    test_dcc_datetime_24_hour;
    test_dcc_datetime_timezone;
    assert_screen 'dcc-datetime-snapshot';
    close_dcc;

}

1;

# vim: set sw=4 et:
