use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "deepin-terminal", "launcher-search-deepin-terminal";
    save_screenshot;
}
sub mainUI{
    assert_screen "deepin-terminal-main-default", 10;
    sleep 3;
}
sub exitDeepinTerminal{
    assert_and_click "deepin-terminal-main-default-btn";
    sleep 3;
    assert_screen "desktop-default",10;
}
sub run{
    startup;
    mainUI;
    exitDeepinTerminal;

}


1;

# vim: set sw=4 et:

