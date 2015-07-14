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

use IO::Socket::INET;

my $saveScreen :shared = 0;
my $saveScreenExit :shared = 0;
#$saveScreen = 0;

sub windowThread  {
    Gtk2->init;

    my $window = Gtk2::Window->new('toplevel');
    $window->signal_connect(destroy => sub { $saveScreenExit = 1; Gtk2->main_quit; });

    my $btn = Gtk2::Button->new("save screen");
    $btn->signal_connect(clicked => \&clickedEven);
    $window->add($btn);

    $btn->show;
    $window->show;

    Gtk2->main;
}

sub clickedEven{
    $saveScreen = 1;
    #bmwqemu::diag "clicked, saveScreen: $saveScreen \n"
}

sub maker_old{
    my $thr = threads->create(\&windowThread);
    while(1){

        if ($saveScreenExit){
            last;
        }

        #bmwqemu::diag "loop ... saveScreen: $saveScreen \n";
        if ($saveScreen){
            #mouse_hide;
            save_screenshot;
            $saveScreen = 0;
            bmwqemu::diag " save screen shot \n";
            save_screenshot;
        }

        sleep 1;
    }
}

sub maker{

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

    save_screenshot;

    #sleep 3600*2;

    #assert_screen "desktop-fashion-mode-default", 15;

    maker;

    #assert_shutdown(3600);
    #assert_screen "shutdown", 3600;

}

sub test_flags {
    # without anything - rollback to 'lastgood' snapshot if failed
    # 'fatal' - whole test suite is in danger if this fails
    # 'milestone' - after this test succeeds, update 'lastgood'
    # 'important' - if this fails, set the overall state to 'fail'
    return { important => 1 };
}

1;

# vim: set sw=4 et:
