#use base "basetest";
use strict;
use base "softwarebasetest";
use testapi;

sub displaygedit {

    #launcher have gedit only.

    send_key "win";
    sleep 10;
    type_string "gedit";
    assert_screen "launcher-search-gedit",10;
}



sub run {

    sleep 20;
    #click the button of gedit
    displaygedit;
    send_key "ret";
    sleep 15;
    assert_screen "gedit-click-open",10;
    send_key "alt-f4";
    sleep 10;

    #right key and click open button.
    displaygedit;
    mouse_set 232,175;
    mouse_click "right";
    mouse_hide;
    sleep 10;
    send_key "down";
    send_key "ret";
    sleep 15;
    assert_screen "gedit-click-open",10;
    send_key "alt-f4";
    sleep 10;

    #right key and click "send to desktop"  button.
    displaygedit;
    mouse_set 232,175;
    mouse_click "right";
    mouse_hide;
    sleep 10;
    send_key "down";
    send_key "down";
    send_key "down";
    send_key "ret";
    #right key and click "add to dock"  button.
    mouse_set 232,175;
    mouse_click "right";
    mouse_hide;
    sleep 10;
    send_key "down";
    send_key "down";
    send_key "down";
    send_key "down";
    send_key "ret";
    send_key "esc";
    send_key "esc";
    sleep 20;

    #check desktop-gedit,and double-click to open
    assert_screen "desktop-gedit-performance",10;
    sleep 10;
    mouse_dclick "desktop-gedit-performance";
    sleep 15;
    send_key "alt-f4";
    sleep 10;

    #check dock-gedit,and click to open
    #assert_and_click "dock-gedit-performance",10;
    #sleep 15;
    #send_key "alt-f4";
    #sleep 10;




    #right key and click "remove from desktop"  button.
    displaygedit;
    mouse_set 232,175;
    mouse_click "right";
    mouse_hide;
    send_key "down";
    send_key "down";
    send_key "down";
    send_key "ret";
    sleep 10;
    #right key and click "remove from dock"  button.
    mouse_set 232,175;
    mouse_click "right";
    mouse_hide;
    send_key "down";
    send_key "down";
    send_key "down";
    send_key "down";
    send_key "ret";
    sleep 10;
    send_key "esc";
    send_key "esc";
    sleep 10;
}



sub test_flags {

    # without anything - rollback to 'lastgood' snapshot if failed

    # 'fatal' - whole test suite is in danger if this fails

    # 'milestone' - after this test succeeds, update 'lastgood'

    # 'important' - if this fails, set the overall state to 'fail'

    return { important => 1 };

}

1;

# vim: set sw=4 et:
