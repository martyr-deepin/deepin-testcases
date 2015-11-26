use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "deepin-qq", "laucher-search-deepin-qq";
    save_screenshot;
}
sub mainUI{
    assert_screen "deepin-qq-main-default", 60;
    sleep 3;
}
sub exitDeepinQQ{
    send_key "alt-f4";
    sleep 5;
    assert_screen "desktop-defult",5;
}
sub run{
    startup;
    mainUI;
    exitDeepinQQ;

}


1;

# vim: set sw=4 et:

