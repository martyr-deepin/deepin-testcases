use base "softwarebasetest";
use strict;
use testapi;
use deepinapi qw(check_app_open);

sub step1 {
	mouse_set 100,100;
	if (check_screen "dock-fashion-mode-default",60){
		assert_and_click "fashion-dock-blank","right";
		assert_and_click "classic-menu";
		assert_screen "dock-classic-mode-default";
		assert_and_click "classic-dock-blank","right";
		assert_and_click "intelligent-hide-menu";
		sleep 2;
		assert_screen "dock-classic-mode-default", 3;
	}	
}

sub step2 {
	check_app_open "google-classic","google-main-default";
	assert_and_click "google-maximize-btn";
	assert_screen "dock-always-hide",60;
}

sub step3{
	assert_and_click "google-minimize-btn";
	assert_screen "dock-classic-mode-google-icon",60;
}

sub teardown{
	send_key "alt-f4";
	assert_screen "dock-fashion-mode-default", 10;
}

sub run {
	step1;
	step2;
	step3;
	teardown;
}

1;

# vim: set sw=4 et: