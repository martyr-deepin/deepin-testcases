use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "dde-control-center", "laucher-search-dde-control-center";
    save_screenshot;
}
sub mainUI{
    assert_screen "dde-control-center-main-default", 20;
    sleep 3;
}
sub exitDeepinDdeControlCenter{
    mouse_set 500,500;
    mouse_click;
    assert_screen "desktop-defult",5;
}
sub run{
    startup;
    mainUI;
    exitDeepinDdeControlCenter;

}


1;

# vim: set sw=4 et:

