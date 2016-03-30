use base "softwarebasetest";
use strict;
use testapi;

sub login{
	assert_screen "deepin-session",10;
	for (1 .. 3){
		send_key "right";
	}
	assert_screen "lock-checked",10;
	send_key "ret";
	assert_screen "lock-main";
	my $userpwd = "deepin";

    if (get_var("USERPWD")){
        $userpwd = get_var("USERPWD");
    }
    sleep 3;
    type_string "$userpwd";
    save_screenshot;
    sleep 1;
    send_key "ret";
}


sub dcc{
	mouse_set 1022,766;
	sleep 10;
	assert_and_click "shutdown-icon";
	login;
}

sub hotkey1{
	assert_screen "desktop-default",60;
	send_key "ctrl-alt-delete";
	login;
}

sub hotkey2{
	assert_screen "desktop-default",60;
	send_key "super-l";
	assert_screen "lock-main",60;
}

sub step1{
	if (check_screen "dock-fashion-mode-default",60){
		dcc;
		hotkey1;
		hotkey2;
	}
}

sub step2{
	assert_and_click "power-icon";
	assert_screen "shutdown-restart-suspend";
}

sub teardown{
	send_key "esc";
	assert_screen "lock-main",60;
	type_string "deepin";
	sleep 2;
	save_screenshot;
	send_key "ret";
	assert_screen "dock-fashion-mode-default",60;
}

sub run{
	step1;
	step2;
	teardown;
}

1;

# vim: set sw=4 et: