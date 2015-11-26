use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "caculator", "launcher-search-caculator";
    save_screenshot;
}
sub mainUI{
    assert_screen "caculator-main-default", 20;
    sleep 3;
}
sub exitCaculator{
    send_key "alt-tab";
    sleep 3;
    send_key "alt-f4";
    sleep 3;
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitCaculator;

}


1;

# vim: set sw=4 et:

