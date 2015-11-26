use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "nautilus", "launcher-search-nautilus";
    save_screenshot;
}
sub mainUI{
    assert_screen "nautilus-main-default", 20;
    sleep 3;
}
sub exitNautilus{
    send_key "alt-tab";
    sleep 3;
    send_key "alt-f4";
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitNautilus;

}


1;

# vim: set sw=4 et:

