use base "softwarebasetest";
use strict;
use testapi;
use deepinapi qw(check_app_open);

sub step1 {
	mouse_set 100,100;
	if (check_screen "dock-fashion-mode-default",60){
		assert_and_click "fashion-dock-blank","right";
		assert_and_click "high-effect-menu";
		assert_screen "dock-high-effect-mode-default",60;
		assert_and_click "high-effect-blank","right";
		assert_and_click "intelligent-hide-menu";
		sleep 2;
		assert_screen "dock-high-effect-mode-default",60;
	}	
}

sub step2 {
	check_app_open "google-high-effect","google-main-default";
	assert_and_click "google-maximize-btn";
	assert_screen "google-maximize",100;
}

sub step3{
	assert_and_click "google-minimize-btn";
	assert_screen "dock-high-effect-mode-google-icon",60;
}

sub teardown{
	send_key "alt-f4";
	assert_screen "dock-high-effect-mode-default", 60;
	assert_and_click "high-effect-blank","right";
	assert_and_click "always-show-menu";
	assert_screen "dock-fashion-mode-default",60;
}

sub run {
	step1;
	step2;
	step3;
	teardown;
}

1;

# vim: set sw=4 et: