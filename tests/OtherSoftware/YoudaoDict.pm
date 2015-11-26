use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "youdao-dict", "launcher-search-youdao-dict";
    save_screenshot;
}
sub mainUI{
    assert_screen "youdao-dict-main-default", 20;
    sleep 3;
}
sub exitYoudao{
    send_key "alt-f4";
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitYoudao;

}


1;

# vim: set sw=4 et:

