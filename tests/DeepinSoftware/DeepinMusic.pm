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
use base "softwarebasetest";
use testapi;
use deepinapi qw(download_local_file start_program);

sub startup{

    #assert_screen "desktop-fashion-mode-default", 5;

    # launcher start up
    #send_key "win";
    #sleep 10;

    #assert_and_click "laucher-start-btn-fashion-mode-default";

    # search deepin-music-player
    #type_string "deepin-music-player";
    #assert_screen "laucher-search-deepin-music-player";
    #send_key "ret";

    start_program "deepin-music-player", "launcher-search-deepin-music-player";
    save_screenshot;
}

sub mainUI{
    # start up deepin-music-player
    if (check_screen "deepin-music-player-start-up-3", 30) {
        # click the third btn
        mouse_set 535, 526;
        sleep 3;
        save_screenshot;
        mouse_click;
=pod
        my $ready = check_screen "deepin-music-player-start-up-3", 5;

        # repeat click
        if (!$ready){
            # click the third btn
            mouse_set 535, 526;
            mouse_click;
        }

        assert_screen "deepin-music-player-start-up-3", 3;
=cut
        # entry
        #assert_and_click "deepin-music-player-start-up-btn";
        if (check_screen "deepin-music-player-start-up-btn"){
            sleep 3;
            mouse_set 509,479;
            sleep 3;
            save_screenshot;
            mouse_click;
            sleep 3;
        }
        assert_screen "deepin-music-player-main-default", 10;
    }
    else {
        assert_screen "deepin-music-player-main-default", 10;
    }
    sleep 10;
}

sub exitDMusic{

    assert_and_click "deepin-music-player-close-btn-default";

    if (check_screen "deepin-music-player-close-tips", 5){
        # choose alwalys exit when click close btn
        assert_and_click "deepin-music-player-close-tips-radiobtn-exit";
        sleep 1;

        # confirm exit
        assert_and_click "deepin-music-player-close-tips-confirm-btn";
    }

    sleep 5;

}

sub playTest{

    my $self = shift;

    my $config = "~/.config/deepin-music-player/config";
    my $fileName = '1d5d9dD.wav';
    my $sound = "~/data/$fileName";
    my $expectDTMFCode = '159D';

    download_local_file($fileName, "~/data");
    save_screenshot;
    send_key "ctrl-alt-t";
    assert_screen "deepin-terminal", 15;
    # change loop_mode: from list_mode to order_mode (no loop)
    type_string 'sed \'s/\(loop_mode = \)list_mode/\1order_mode/g\' '."$config > /tmp/config_tmp && mv /tmp/config_tmp $config \n";
    type_string "pacmd set-sink-volume 0 65536\n";  # volume up
    sleep 2;

    $self->start_audiocapture;
    type_string "deepin-music-player $sound\n";
    sleep 20; # tmp
    save_screenshot;
    $self->assert_DTMF($expectDTMFCode);
    #remove 1d5d9dD.wav
    sleep 5;
    mouse_set 537,238;
    sleep 2;
    save_screenshot;
    mouse_click "right";
    sleep 2;
    save_screenshot;
    mouse_set 581,327;
    sleep 2;
    save_screenshot;
    mouse_click;
    sleep 2;
    save_screenshot;
}

sub run {

    my $self = shift;

    startup;

    mainUI;

    exitDMusic;

    playTest $self;

    exitDMusic;

    # upload_logs
    upload_logs ref($self)."-captured.wav";
    #upload_logs "-captured.wav";
    sleep 3;
    #remove old config
    type_string "rm -rf .config/deepin-music-player\n";
    sleep 3;
    save_screenshot;
    # exit termial
    send_key "alt-f4";
    sleep 5;
    assert_screen "desktop-default",10;

}

1;

# vim: set sw=4 et:
