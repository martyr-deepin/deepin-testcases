use base "softwarebasetest";
use strict;
use testapi;
use deepinapi qw(check_app_open);

sub open_apps {
	#Open deepin-appstore deepin-movie google
	check_app_open "deepin-appstore-fashion","deepin-appstore-main-default";
	check_app_open "deepin-movie-fashion","deepin-movie-main-default";
	check_app_open "google-fashion","google-main-default";
	save_screenshot;
}

sub step1 {
	mouse_set 100,100;
	if(check_screen "dock-fashion-mode-default",60){
		assert_and_click "fashion-dock-blank","right";
		assert_and_click "effect-menu";
		assert_screen "effect-mode-default",60;
		sleep 1;
		assert_and_click "effect-dock-blank","right";
		assert_and_click "classic-menu";
		assert_screen "classic-mode-default",100;
		sleep 1;
		assert_and_click "classic-dock-blank","right";
		assert_and_click "fashion-menu";
		assert_screen "dock-fashion-mode-default",60;
	}
	
}

sub step2{
	open_apps;
	assert_screen "dock-fashion-mode-icons";
	assert_and_click "fashion-dock-blank","right";
	assert_and_click "effect-menu";
	assert_screen "dock-effect-mode-icons";
	sleep 2;
	assert_screen "dock-effect-mode-icons", 60;
	assert_and_click "effect-dock-blank","right";
	assert_and_click "classic-menu";
	sleep 2;
	assert_screen "dock-classic-mode-icons",60;
}

sub teardown{
	assert_and_click "classic-dock-blank","right";
	assert_and_click "fashion-menu";
	assert_screen "dock-fashion-mode-icons",60;
	for(1 .. 3){
		sleep 2;
		send_key "alt-f4";
	}
	assert_screen "desktop-default",60;
}

sub run {
	step1;
	step2;
	teardown;
}

1;

# vim: set sw=4 et: