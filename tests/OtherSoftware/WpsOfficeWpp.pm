use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "wps-office-wpp", "launcher-search-wpp";
    save_screenshot;
}
sub mainUI{
    if (check_screen "accept-wps",20){
        send_key "ret";
    }
    sleep 10;
    assert_screen "wps-office-wpp-main-default", 20;
    sleep 3;
}
sub exitWpp{
    if (check_screen "tips-wps",20){
        send_key "alt-tab";
        sleep 3;
        send_key "alt-f4";
        sleep 3;
    }
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitWpp;

}


1;

# vim: set sw=4 et:

