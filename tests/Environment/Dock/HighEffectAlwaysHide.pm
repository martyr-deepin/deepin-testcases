use base "softwarebasetest";
use strict;
use testapi;

sub step1 {
	mouse_set 100,100;
	if (check_screen "dock-fashion-mode-default",60){
		assert_and_click "fashion-dock-blank","right";
		assert_and_click "high-effect-menu";
		assert_screen "dock-high-effect-mode-default";
		assert_and_click "high-effect-blank","right";
		assert_and_click "always-hide-menu";
		sleep 2;
		assert_screen "dock-always-hide", 60;
	}
}

sub step2 {
	mouse_set 500,767;
	sleep 2;
	assert_screen "dock-high-effect-mode-default",60;
	mouse_set 100,100;
	assert_screen "dock-always-hide",60;
	send_key "super";
	assert_screen "dock-high-effect-mode-default",60;
	send_key "super";
	assert_screen "dock-always-hide",100;
}

sub step3{
	send_key "super-h";
	assert_screen "dock-high-effect-mode-default",60;
	sleep 3;
	assert_screen "dock-always-hide",60;
}

sub teardown{
	mouse_set 500,767;
	if (check_screen "high-effect-blank"){
		assert_and_click "high-effect-blank","right";
		assert_and_click "always-show-menu";
		assert_and_click "high-effect-blank","right";
		assert_and_click "fashion-menu";
		assert_screen "dock-fashion-mode-default",60;
	}
}

sub run {
	step1;
	step2;
	step3;
	teardown;
}

1;

# vim: set sw=4 et: