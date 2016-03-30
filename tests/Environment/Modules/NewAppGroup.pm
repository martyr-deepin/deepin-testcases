use base "softwarebasetest";
use strict;
use testapi;

sub step1{
	if (check_screen "dock-fashion-mode-default",60){
		send_key "super";
		assert_and_click "simple-scan-icon","right";
		assert_and_click "send-to-desktop-menu";
		assert_and_click "file-roller-icon","right";
		assert_and_click "send-to-desktop-menu";
		assert_and_click "calculator-icon","right";
		assert_and_click "send-to-desktop-menu";
		send_key "esc";
		assert_screen "apps-in-desktop",60;
	}
	
}

sub step2{
	mouse_set 60,160;
	sleep 5;
	save_screenshot;
	assert_screen "file-roller-checked",10;
	$bmwqemu::backend->mouse_button( "left", 1 );
	sleep 5;
	mouse_set 60,45;
	sleep 5;
	save_screenshot;
	assert_screen "app-group",60;
}

sub step3{
	mouse_set 60,275;
	sleep 3;
	$bmwqemu::backend->mouse_button( "left", 1 );
	sleep 3;
	mouse_set 60,45;
}
	
sub step4{
	send_key "super";
	assert_and_click "simple-scan-icon","right";
	assert_and_click "send-to-desktop-menu";
	send_key "esc";
	mouse_set 60,160;
	sleep 3;
	$bmwqemu::backend->mouse_button( "left", 1 );
	sleep 3;
	mouse_set 60,45;
	assert_screen "app-group",60;
}
	

sub run{
	step1;
	step2;
	step3;
	step4;
}

1;

# vim: set sw=4 et: