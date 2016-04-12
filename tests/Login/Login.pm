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

use deepinapi qw(install_from_local run_on_tty);

sub login{

    # login screen
    assert_screen "login2015", 150;

    my $userpwd = "deepin";

    if (get_var("USERPWD")){
        $userpwd = get_var("USERPWD");
    }

    # login
    sleep 3;
    type_string "$userpwd";
    save_screenshot;
    sleep 1;
    send_key "ret";
}

sub disableSysNotified{

    my $script = "mv /usr/share/deepin-notifications/deepin-notifications /usr/share/deepin-notifications/deepin-notification";
    run_on_tty($script, 1);

}

sub ready_env{

    # install tool packages
    my @pkglist = ("curl.deb");
    install_from_local(@pkglist);

    # disable notification
    # disableSysNotified;

}


sub run {

    # grub
    assert_screen "grub2015", 15;

    save_screenshot;

    # login
    login;

    #ready_env;
}

sub test_flags {
    return { fatal => 1 };
}

1;

# vim: set sw=4 et:
