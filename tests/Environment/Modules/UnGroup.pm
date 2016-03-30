use base "softwarebasetest";
use strict;
use testapi;
use deepinapi qw(newappgroup);

sub step1{
	assert_and_click "app-group-name","right";
	assert_and_click "ungroup-menu";
	assert_screen "apps-in-desktop",5;
}

sub del_app_icons{
	send_key "ctrl-a";
	sleep 2;
	send_key "delete";
	assert_screen "desktop-default",5;
}

sub step2{
	del_app_icons;
	newappgroup;
	send_key "super";
	assert_and_click "simple-scan-icon","right";
	assert_and_click "send-to-desktop-menu";
	send_key "esc";
	assert_screen "simple-scan-in-desktop",5;
	step1;
	assert_screen "apps-in-desktop",5;
}


1;

# vim: set sw=4 et: