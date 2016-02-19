use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "deepin-feedback", "launcher-search-deepin-feedback";
    save_screenshot;
}
sub mainUI{
    assert_screen "deepin-feedback-main-default", 20;
    sleep 3;
}
sub exitDeepinFeedback{
=pod
    assert_and_click "deepin-feedback-main-default-btn";
    sleep 3;
    assert_screen "desktop-default",10;
=cut
    send_key "alt-f4";
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitDeepinFeedback;

}


1;

# vim: set sw=4 et:

