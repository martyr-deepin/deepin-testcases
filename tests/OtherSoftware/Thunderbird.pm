use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "thunderbird", "launcher-search-thunderbird";
    save_screenshot;
}
sub mainUI{
    assert_screen "thunderbird-email", 20;
    sleep 3;
    send_key "alt-tab";
    sleep 3;
    send_key "alt-f4";
    sleep 3;
    assert_screen "thunderbird-main-default", 20;
    sleep 3;
}
sub exitThunderbird{
    send_key "alt-f4";
    sleep 3;
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    exitThunderbird;

}


1;

# vim: set sw=4 et:

