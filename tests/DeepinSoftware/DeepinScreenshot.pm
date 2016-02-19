use strict;
use base "softwarebasetest";
use testapi;
use deepinapi qw(start_program);

sub startup {
    sleep 5;
    start_program "deepin-screenshot", "launcher-search-deepin-screenshot";
    save_screenshot;
}
sub mainUI{
    assert_screen "deepin-screenshot-main-default", 10;
    sleep 3;
}
sub runTest{
    #begin to screenshot
    mouse_set 50,50;
    sleep 3;
    save_screenshot;
    assert_screen "deepin-screenshot-start", 10;
    $bmwqemu::backend->mouse_button( "left", 1 );
    sleep 3;
    mouse_set 500, 500;
    sleep 3;
    save_screenshot;
    #screenshot finish
    assert_screen "deepin-screenshot-finish",10; 
    mouse_set 300,300;
    sleep 3;
    save_screenshot;
    mouse_dclick;
    sleep 10;
    #open screenshot XXXX.png on desktop
    mouse_set 40,40;
    sleep 3;
    save_screenshot;
    mouse_dclick;
    assert_screen "deepin-screenshot-png",10;	
}
sub del_png{
    sleep 3;
    send_key "alt-f4";
    sleep 3;
    save_screenshot;
    mouse_set 40,40;
    mouse_click "right";
    #mouse_hide;
    sleep 3;
    send_key "down";
    sleep 1;
    send_key "down";
    sleep 1;
    send_key "down";
    sleep 1;
    send_key "down";
    sleep 1;
    send_key "down";
    sleep 1;
    send_key "down";
    sleep 1;
    send_key "down";
    sleep 1;
    send_key "down";
    sleep 1;
    send_key "down";
    save_screenshot;
    send_key "ret";
    assert_screen "desktop-default",5;
}
sub run{
    startup;
    mainUI;
    runTest;
    del_png;

}
1;

# vim: set sw=4 et:
