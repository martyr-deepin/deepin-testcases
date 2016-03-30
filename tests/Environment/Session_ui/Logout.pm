use base "softwarebasetest";
use strict;
use testapi;

sub login{
	assert_screen "login2015";
	my $userpwd = "deepin";

	if (get_var("USERPWD")){
		$userpwd = get_var("USERPWD");
	}
	sleep 3;
	type_string "$userpwd";
	sleep 2;
	save_screenshot;
	sleep 1;
	send_key "ret";
	assert_screen "dock-fashion-mode-default",100;
}

sub step1{
	if (check_screen "dock-fashion-mode-default",6){
		mouse_set 1022,766;
		if (check_screen "shutdown-icon",60){
			assert_and_click "shutdown-icon";
			assert_screen "deepin-session",60;
		}
		for (1 .. 4){
			send_key "right";
			sleep 1;
		}
		assert_screen "logout-checked",10;
		send_key "ret";
		login;
	}
}

sub step2{
	send_key "ctrl-alt-delete";
	assert_screen "deepin-session",60;
	for (1 .. 4){
		send_key "right";
		sleep 1;
	}
	assert_screen "logout-checked",5;
	send_key "ret";
}

sub step3{
	assert_and_click "power-icon";
	assert_screen "shutdown-restart-suspend";
}

sub teardown{
	send_key "esc";
	assert_screen "login2015";
	type_string "deepin";
	sleep 2;
	save_screenshot;
	send_key "ret";
	assert_screen "dock-fashion-mode-default",60;
}

sub run{
	step1;
	step2;
	step3;
	teardown;
}

1;

# vim: set sw=4 et: