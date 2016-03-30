use base "softwarebasetest";
use strict;
use testapi;

sub step1{
	send_key "super";
	assert_screen "launcher-start-up2015",5;
	mouse_set 58,58;
	assert_screen "launcher-sort-menu",5;
	assert_and_click "launcher-sort-by-icon-menu",5;
	assert_screen "launcher-sort-by-icon",;
}

sub step2{
	mouse_set 58,58;
	assert_screen "launcher-sort-menu",5;
	assert_and_click "launcher-sort-by-words-menu",5;
	assert_screen "launcher-sort-by-words",;
}

sub run{
	step1;
	step2;
}
1;

# vim: set sw=4 et: