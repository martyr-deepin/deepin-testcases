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

sub click_dcc_speaker_button($) {

    my $type = shift;
    if ( 'off' eq $type) {
        assert_and_click 'dcc-speaker-button-off';
        mouse_hide;
        sleep 1;
    }

    if ( 'on' eq $type) {
        assert_and_click 'dcc-speaker-button-on';
        mouse_hide;
        sleep 1;
    }

}

sub close_dcc_speaker {

    click_dcc_speaker_button 'on';
    assert_screen 'dcc-speaker-off';

}

sub open_dcc_speaker {

    click_dcc_speaker_button 'off';
    assert_screen 'dcc-sound-snapshot';

}

sub test_dcc_sound_speaker {

    close_dcc_speaker;
    open_dcc_speaker;

}

sub click_dcc_microphone_button($) {

    my $type = shift;
    if ( 'off' eq $type ) {
        assert_and_click 'dcc-microphone-button-off';
        mouse_hide;
        sleep 1;
    }

    if ( 'on' eq $type ) {
        assert_and_click 'dcc-microphone-button-on';
        mouse_hide;
        sleep 1;
    }

}

sub close_dcc_microphone {

    click_dcc_microphone_button 'on';
    assert_screen 'dcc-microphone-off';

}

sub open_dcc_microphone {

    click_dcc_microphone_button 'off';
    assert_screen 'dcc-sound-snapshot';

}

sub test_dcc_sound_microphone {

    close_dcc_microphone;
    open_dcc_microphone;

}

sub display_dcc_sound_super_setting {

    assert_and_click 'dcc-sound-super-setting-display';
    mouse_hide;
    sleep 1;
    assert_screen    'dcc-sound-super-setting-display-detail';

}

sub hide_dcc_sound_super_setting {

    assert_and_click 'dcc-sound-super-setting-hide';
    mouse_hide;
    sleep 1;
    assert_screen    'dcc-sound-snapshot';

}

sub test_dcc_sound_super_setting {

    display_dcc_sound_super_setting;
    hide_dcc_sound_super_setting;

}

sub open_dcc_sound_effects {

    assert_and_click 'dcc-sound-effects';
    mouse_hide;
    sleep 1;
    assert_screen    'dcc-sound-effects-detail';

}

sub close_dcc_sound_effects {

    assert_and_click 'dcc-sound-effects';
    mouse_hide;
    sleep 1;
    assert_screen    'dcc-sound-snapshot';

}

sub test_dcc_sound_effects {

    open_dcc_sound_effects;
    close_dcc_sound_effects;

}

sub run {

    open_dcc 'sound';
    assert_screen 'dcc-sound-snapshot';
    test_dcc_sound_speaker;
    test_dcc_sound_microphone;
    test_dcc_sound_super_setting;
    test_dcc_sound_effects;
    close_dcc;

}

1;

# vim: set sw=4 et:
