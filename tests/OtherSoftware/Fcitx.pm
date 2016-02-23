use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "fcitx configuration", "launcher-search-fcitx";
    save_screenshot;
}
sub mainUI{
    sleep 10;
    assert_screen "fcitx-main-default", 60;
    sleep 3;
}
sub exitFcitx{
    send_key "alt-f4";
    sleep 3;
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitFcitx;

}


1;

# vim: set sw=4 et:

