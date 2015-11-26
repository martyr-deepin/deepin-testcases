use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "simple-scan", "launcher-search-simple-scan";
    save_screenshot;
}
sub mainUI{
    assert_screen "simple-scan-main-default", 20;
    sleep 3;
}
sub exitSimpleScan{
    send_key "alt-tab";
    sleep 3;
    send_key "alt-f4";
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitSimpleScan;

}


1;

# vim: set sw=4 et:

