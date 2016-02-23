use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "wps-office-wps", "launcher-search-wps";
    save_screenshot;
}
sub mainUI{
    if (check_screen "accept-wps",10){
        send_key "ret";
    }
    sleep 10;
    assert_screen "wps-office-wps-main-default", 20;
    sleep 3;
}
sub exitWps{
    if (check_screen "tips-wps",20){
        send_key "alt-tab";
        sleep 3;
        send_key "alt-f4";
        sleep 5;
    }
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitWps;

}


1;

# vim: set sw=4 et:

