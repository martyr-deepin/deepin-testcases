use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    start_program "gedit", "launcher-search-gedit";
    save_screenshot;
}
sub mainUI{
    assert_screen "gedit-main-default", 20;
    sleep 3;
}
sub exitGedit{
    send_key "alt-f4";
    mouse_set 100, 100;
    sleep 10;
    assert_screen "desktop-default",15;
}
sub run{
    startup;
    mainUI;
    exitGedit;

}

1;

# vim: set sw=4 et:
