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
use base 'softwarebasetest';
use testapi;
use deepinapi qw(install_from_local download_local_file);


use IO::Socket::INET;

our $global_self;

sub init{

    # user name & pwd
    my $userName = get_var("USERNAME");
    my $pwd = get_var("USERPWD");

    # set the global name and pwd for testapi
    $username = $userName;
    $password = $pwd;

}

sub maker{

    my $self = shift;

    my $port = get_var("NEEDLEMAKERPORT");
    $port ||= 7000;

    my $server = IO::Socket::INET->new(LocalPort => $port, Listen=> 1) or die "Can not listen - $@";

    my $client = $server->accept() or die "accept error: $!";

    while(1) {
        my $buf = undef;
        $client->recv($buf, 1024);
        my $bs = length($buf);
        bmwqemu::diag "Maker: Received $bs bytes, content $buf\n";
        if ($buf eq ":save"){
            bmwqemu::diag "Maker: Save screen shot";
            save_screenshot;
        }
        elsif ($buf eq ":end"){
            bmwqemu::diag "Maker: The end of maker, exit.";
            last;
        }
        else{
            eval($buf)
        }
    }

    $autotest::current_test->take_screenshot('end');
}

sub assert_shutdown(;$) {

    my ($timeout) = @_;
    $timeout //= 60;
    bmwqemu::log_call('assert_shutdown', timeout => $timeout);
    while ($timeout >= 0) {
        my $status = $bmwqemu::backend->status() // '';
        if ($status eq 'shutdown') {
            $autotest::current_test->take_screenshot('ok');
            return;
        }
        --$timeout;
        sleep 1 if $timeout >= 0;
    }
    $autotest::current_test->take_screenshot('fail');
    die "Machine didn't shut down!";

}


sub run {

    my $self = shift;
    $global_self = $self;

    init;

    #sleep 30;
    assert_screen "login", 40;

    # login
    type_string "deepin\n";

    sleep 15;

    save_screenshot;

    maker;

}

sub test_flags {

    return {fatal => 1};

}

1;

# vim: set sw=4 et:
