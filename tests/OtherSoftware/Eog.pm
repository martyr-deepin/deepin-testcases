use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "eog", "launcher-search-eog";
    save_screenshot;
}
sub mainUI{
    assert_screen "eog-main-default", 20;
    sleep 3;
}
sub exitEog{
    send_key "alt-tab";
    sleep 3;
    send_key "alt-f4";
    sleep 3;
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitEog;

}


1;

# vim: set sw=4 et:

