use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "crossover", "launcher-search-crossover";
    save_screenshot;
}
sub mainUI{
    assert_screen "crossover-main-default", 20;
    sleep 3;
}
sub exitCrossOver{
    send_key "alt-f4";
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitCrossOver;

}


1;

# vim: set sw=4 et:

