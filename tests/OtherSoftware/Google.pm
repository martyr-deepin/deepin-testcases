use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "google", "launcher-search-google";
    save_screenshot;
}
sub mainUI{
    assert_screen "google-main-default", 20;
    sleep 3;
}
sub exitGoogle{
    send_key "alt-f4";
    sleep 3;
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitGoogle;

}


1;

# vim: set sw=4 et:

