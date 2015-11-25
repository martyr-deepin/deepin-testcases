use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "deepin-appstore", "laucher-search-deepin-appstore";
    save_screenshot;
}
sub mainUI{
    assert_screen "deepin-appstore-main-default", 20;
    sleep 3;
}
sub exitDeepinAppStore{
=pod
    assert_and_click "deepin-appstore-main-default-btn";
    sleep 3;
    assert_screen "desktop-default",10;
=cut
    send_key "alt-f4";
    assert_screen "desktop-defult",5;
}
sub run{
    startup;
    mainUI;
    exitDeepinAppStore;

}


1;

# vim: set sw=4 et:

