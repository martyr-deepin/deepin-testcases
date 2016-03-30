use base "softwarebasetest";
use strict;
use testapi;
use deepinapi qw(run_on_tty);

sub open_launcher_and_search{
	assert_and_click "launcher";
	assert_screen "launcher-start-up2015",60;
	sleep 2;
	type_string "deepin-qq";
	sleep 5;
	assert_screen "launcher-search-deepin-qq",60;
	assert_and_click "qq-icon-in-launcher-searched","right";
	
}

sub open_launcher{
	mouse_set 100,100;
	sleep 2;
	send_key "super";
	type_string "deepin-qq";	
}

sub step1{
	mouse_set 100,100;
	sleep 20;
	assert_screen "dock-fashion-mode-default",6;
	open_launcher_and_search;
	assert_and_click "open-menu";
	assert_screen "deepin-qq-main-default",60;
	send_key "alt-tab";
    sleep 2;
    send_key "alt-f4";

}

sub step2{
	open_launcher_and_search;
	assert_and_click "send-to-desktop-menu";
	send_key "esc";
	sleep 1;
	send_key "esc";
	mouse_set 500,500;
	assert_screen "deepin-qq-in-desktop",60;

}

sub step3{
	open_launcher_and_search;
	assert_and_click "remove-from-desktop-menu";
	send_key "esc";
	sleep 2;
	send_key "esc";
	assert_screen "desktop-default",60;
}

sub step4{
	open_launcher_and_search;
	assert_and_click "send-to-dock-menu";
	assert_screen "dock-has-deepin-qq",60;

}

sub step5{
	assert_and_click "qq-icon-in-launcher-searched","right";
	assert_and_click "remove-from-dock-menu";
	assert_screen "dock-fashion-mode-default",60;
}

sub step6{
	assert_and_click "qq-icon-in-launcher-searched","right";
	assert_and_click "add-to-boot-menu";
	assert_screen "boot-icon-deepin-qq",60;
}

sub step7{
	assert_and_click "boot-icon-deepin-qq","right";
	assert_and_click "remove-from-boot-menu";
	assert_screen "launcher-search-deepin-qq",60;

}

sub step8{
	assert_and_click "qq-icon-in-launcher-searched","right";
	assert_and_click "uninstall";
	sleep 10;
	assert_and_click "uninstall-btn";
	sleep 15;
}

sub step9{
	open_launcher;
	assert_screen "launcher-no-deepin-qq",60;
}

sub teardown{
	send_key "super";
	assert_screen "dock-fashion-mode-default",60;
	my $script = "sudo apt-get install -y deepinwine-qq";
	run_on_tty($script, 1);
	assert_and_click "launcher";
	assert_screen "launcher-start-up2015",60;
	send_key "esc";
	assert_screen "desktop-default",60;
}

sub run{
	step1;
	step2;
	step3;
	step4;
	step5;
	step6;
	step7;
	step8;
	step9;
	teardown;
}

1;

# vim: set sw=4 et: