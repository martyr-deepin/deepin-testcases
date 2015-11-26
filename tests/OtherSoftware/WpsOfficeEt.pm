use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "wps-office-et", "launcher-search-et";
    save_screenshot;
}
sub mainUI{
    if (check_screen "accept-wps",10){
        send_key "ret";
    }
    sleep 10;
    assert_screen "wps-office-et-main-default", 20;
    sleep 3;
}
sub exitEt{
    if (check_screen "tips-wps",20){
        send_key "alt-tab";
        sleep 3;
        send_key "alt-f4";
        sleep 3;
    }
    assert_screen "desktop-default", 15;
}
sub run{
    startup;
    mainUI;
    exitEt;

}


1;

# vim: set sw=4 et:

