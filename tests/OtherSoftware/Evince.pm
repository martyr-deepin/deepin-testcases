use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "evince", "launcher-search-evince";
    save_screenshot;
}
sub mainUI{
    assert_screen "evince-main-default", 20;
    sleep 3;
}
sub exitEvince{
    send_key "alt-f4";
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitEvince;

}


1;

# vim: set sw=4 et:

