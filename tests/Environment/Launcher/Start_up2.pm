use base "softwarebasetest";
use strict;
use testapi;

sub step1{
	mouse_set 100,100;
	mouse_click;
	sleep 20;
	if (check_screen "desktop-default",20){
		send_key "super";
		assert_screen "launcher-start-up2015";
		send_key "esc";
		assert_screen "desktop-default",5;
	}
}

sub run{
	mouse_set 100,100;
	step1;
}

1;

# vim: set sw=4 et: