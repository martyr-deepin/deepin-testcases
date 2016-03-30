use base "softwarebasetest";
use strict;
use testapi;


sub run{
	if (check_screen "desktop-default",20){
		mouse_set 100,100;
		sleep 10;
		assert_and_click "launcher";
		save_screenshot;
		sleep 2;
		assert_screen "launcher-start-up2015",20;
		send_key "esc";
		assert_screen "desktop-default",5;
	}
}

1;

# vim: set sw=4 et: