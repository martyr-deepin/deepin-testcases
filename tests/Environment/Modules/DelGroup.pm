use base "softwarebasetest";
use strict;
use testapi;
use deepinapi qw(newappgroup);

sub del_app_group{
	assert_and_click "app-group-name","right";
	assert_and_click "delroup-menu";
	assert_screen "desktop-default",5;
}


1;

# vim: set sw=4 et: