use base "softwarebasetest";
use strict;
use testapi;

sub login{
	my $userpwd = "deepin";

    if (get_var("USERPWD")){
        $userpwd = get_var("USERPWD");
    }
    sleep 3;
    type_string "$userpwd";
    save_screenshot;
    sleep 1;
    send_key "ret";
    assert_screen "dock-fashion-mode-default",100;
}

sub dcc{
	if (check_screen "desktop-default",100){
		mouse_set 1022,765;
		sleep 10;
		if (check_screen "shutdown-icon",60){
			assert_and_click "shutdown-icon";
			assert_screen "deepin-session",60;
			send_key "esc";
		}
		
	}
	
}

sub hotkey{
	send_key "ctrl-alt-delete";
	assert_screen "deepin-session",60;
	sleep 2;
	send_key "right";
	sleep 2;
	assert_screen "restart-checked",60;
	send_key "ret";
	sleep 3;
	save_screenshot;
	assert_screen "bootloader",60;
	assert_screen "login2015",150;
	login;
}

sub run{
	dcc;
	hotkey;
}
1;

# vim: set sw=4 et: