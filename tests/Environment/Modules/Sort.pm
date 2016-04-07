use base "softwarebasetest";
use strict;
use testapi;

sub sort_by($$){
	my $sort = shift;
	my $sort_result = shift;
	mouse_set 500,500;
	mouse_click "right";
	assert_and_hover "sort-menu";
	sleep 5;
	assert_and_click $sort;
	assert_screen $sort_result,60;
}

sub step1{
	sort_by "by-name-menu","by-name-result";
}

sub step2{
	assert_and_hover "new-file-in-desktop";
	mouse_dclick;
	assert_screen "txt-main";
	type_string "test";
	send_key "ctrl-s";
	sleep 2;
	send_key "alt-f4";
	sort_by "by-time-menu","by-time-result";
}

sub del_file($){
	my $file = shift;
	sleep 2;
	assert_and_click $file,"right";
	assert_and_click "del-menu";
}

sub teardown{
	mouse_click;
	sleep 5;
	send_key "ctrl-a";
	sleep 5;
	assert_screen "all-checked",60;
	assert_and_click "new-dir-in-desktop","right";
	assert_and_click "del-menu";
    assert_screen "desktop-default",60;
}

sub run{
	step1;
	step2;
	teardown;
}

1;

# vim: set sw=4 et: