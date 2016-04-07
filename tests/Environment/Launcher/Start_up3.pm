use base "softwarebasetest";
use strict;
use testapi;

sub step1{
	if (check_screen "desktop-default",60){
		mouse_set 500,500;
		mouse_click "right";
		assert_and_click "hot-area-menu";
		assert_screen "hot-area-setting",60;
		mouse_set 50,767;
		assert_and_click "lancher-menu";
		sleep 2;
		mouse_set 500,500;
		sleep 2;
		mouse_click;
		sleep 2;
		mouse_set 2,766;
		assert_screen "launcher-start-up2015",60;
		send_key "esc";
		assert_screen "desktop-default",60;
	}
}

sub run{
	step1;
}

1;

# vim: set sw=4 et: