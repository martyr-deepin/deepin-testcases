use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "chmsee", "launcher-search-chmsee";
    save_screenshot;
}
sub mainUI{
    assert_screen "chmsee-main-default", 20;
    sleep 3;
}
sub exitChmsee{
    send_key "alt-f4";
    sleep 10;
    assert_screen "desktop-default",15;
}
sub run{
    startup;
    mainUI;
    exitChmsee;

}


1;

# vim: set sw=4 et:

