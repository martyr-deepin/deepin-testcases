use base "softwarebasetest";
use strict;
use testapi;

sub step1{
	mouse_set 500,500;
	if (check_screen "desktop-default",60){
		mouse_click "right";
		assert_and_click "dir-menu";
		mouse_click;
		assert_screen "new-dir-in-desktop",60;
	}
}

sub run{
	step1;
}

1;

# vim: set sw=4 et: