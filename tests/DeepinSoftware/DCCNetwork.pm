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

sub click_wire_network_button {

    if (check_screen 'dcc-network-wirenetwork-button-on', 5) {
        assert_and_click 'dcc-network-wirenetwork-button-on';
        mouse_hide;
    } else {
        assert_and_click 'dcc-network-wirenetwork-button-off';
        mouse_hide;
    }

}

sub close_wire_network {

    click_wire_network_button;
    assert_screen 'dcc-network-wirenetwork-off';

}

sub open_wire_network {

    click_wire_network_button;
    assert_screen 'dcc-network-wirenetwork-on';

}

sub open_wire_network_arrow {

    assert_and_click 'dcc-network-wirenetwork-arrow';
    mouse_hide;
    my @itemlist = qw( ethernet secure ipv6 );
    foreach my $item (@itemlist) {
        assert_and_click 'dcc-network-wirenetwork-detail-'.$item;
        assert_screen    'dcc-network-wirenetwork-detail-'.$item.'-detail';
        mouse_click;
        sleep 4;
    }
    assert_screen 'dcc-network-wirenetwork-detail';

}

sub cancel_wire_network_detail {

    assert_and_click 'dcc-network-wirenetwork-detail-cancel';
    assert_screen 'dcc-network-snapshot';

}

sub save_wire_network_detail {

    assert_and_click 'dcc-network-wirenetwork-detail-save';
    assert_screen 'dcc-network-snapshot';

}

sub test_wire_network_arrow {

    open_wire_network_arrow;
    cancel_wire_network_detail;
    open_wire_network_arrow;
    save_wire_network_detail;

}

sub test_wire_network {

    close_wire_network;
    open_wire_network;

}

sub click_system_proxy {

    assert_and_click 'dcc-network-system-proxy';
    mouse_hide;

}

sub test_system_proxy {

    click_system_proxy;
    assert_screen 'dcc-network-system-proxy-detail';
    click_system_proxy;

}

sub open_network_infor {

    assert_and_click 'dcc-network-infor';
    mouse_hide;
    assert_screen 'dcc-network-infor-detail';

}

sub cancel_network_infor {

    assert_and_click 'dcc-network-infor-cancel';
    mouse_hide;
    assert_screen 'dcc-network-snapshot';

}

sub test_network_infor {

    open_network_infor;
    assert_and_click 'dcc-network-infor-wire-connection';
    mouse_hide;
    assert_screen 'dcc-network-infor-wire-connection-detail';
    assert_and_click 'dcc-network-infor-wire-connection';
    cancel_network_infor;

}

sub open_network_add {

    assert_and_click 'dcc-network-add';
    mouse_hide;
    assert_screen 'dcc-network-add-detail';

}

sub cancel_network_add {

    assert_and_click 'dcc-network-detail-cancel';
    mouse_hide;
    assert_screen 'dcc-network-snapshot';

}

sub next_network_add {

    assert_and_click 'dcc-network-detail-next';
    mouse_hide;
    assert_screen 'dcc-network-detail-next-detail';

}

sub test_network_add {

    open_network_add;
    cancel_network_add;
    open_network_add;

}

sub run {

    open_dcc 'network';
    assert_screen 'dcc-network-snapshot';
    test_wire_network;
    test_network_add;
    test_wire_network_arrow;
    test_system_proxy;
    test_network_add;
    test_network_infor;
    close_dcc;

}

1;

# vim: set sw=4 et:
