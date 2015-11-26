use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "gparted", "launcher-search-gparted";
    save_screenshot;
    assert_screen "gparted-passwd",5;
    type_string "deepin\n";
}
sub mainUI{
    assert_screen "gparted-main-default", 20;
    sleep 3;
}
sub exitGparted{
    send_key "alt-f4";
    sleep 3;
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitGparted;

}


1;

# vim: set sw=4 et:

