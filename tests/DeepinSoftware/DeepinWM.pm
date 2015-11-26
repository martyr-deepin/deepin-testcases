use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "deepin-wm", "laucher-search-deepin-wm";
    save_screenshot;
}
sub mainUI{
    assert_screen "deepin-wm-main-default", 20;
    sleep 3;
}
sub exitDeepinWM{
    send_key "esc";
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitDeepinWM;

}


1;

# vim: set sw=4 et:

