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
use base 'installbasetest';
use testapi;

sub run {

    assert_screen "pxe-boot-menu-1", 30;

    for (my $i = 0; $i < 5; $i ++){
        send_key "down";
    }

    send_key "ret";

    assert_screen "pxe-boot-menu-2", 10;

    if (get_var("ARCH") == "x86_64"){
        send_key "down";
        send_key "down";
        send_key "down";
    }
    elsif (get_var("ARCH") == "i386"){
        send_key "down";
        send_key "down";
        send_key "down";
        send_key "down";
    }

    send_key "ret";

}

1;

# vim: set sw=4 et:
