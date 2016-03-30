use base "softwarebasetest";
use strict;
use testapi;
use deepinapi qw(newappgroup);

sub step1{
	assert_and_click "app-group","right";
	assert_and_click "rename-menu";
	assert_screen "app-group-renaming",5;
	type_string "rename-app";
	send_key "ret";
	assert_screen "app-group-renamed",5;
}

sub step2{
	send_key "super";
	assert_and_click "system-config-print-icon","right";
	assert_and_click "send-to-desktop-menu";
	send_key "esc";
	assert_screen "system-config-print-in-desktop",5;
	mouse_set 60,160;
	sleep 3;
	$bmwqemu::backend->mouse_button( "left", 1 );
	sleep 3;
	mouse_set 60,45;
	assert_screen "app-group-renamed",5;
}

sub run{
	step1;
	step2;
}

1;

# vim: set sw=4 et: