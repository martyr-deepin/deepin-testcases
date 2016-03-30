use base "softwarebasetest";
use strict;
use testapi;

sub sort_by($$){
	my $sort_by = shift;
	my $sort_result = shift;
	mouse_click "right";
	assert_and_hover "sort-menu";
	assert_and_click $sort_by;
	assert_screen $sort_result,60;
}

sub step1{
	sort_by "by-name-menu","by-name-result";
}

sub step2{
	sort_by "by-time-menu","by-time-result";
}

sub teardown{
	mouse_set 500,700;
	sleep 3;
	$bmwqemu::backend->mouse_button( "left", 1 );
    sleep 3;
    mouse_set 50, 50;
    save_screenshot;
    assert_and_click "excel-checked","right";
    assert_and_click "del-menu";
    assert_screen "desktop-default",10;
}

sub run{
	step1;
	step2;
	teardown;
}

1;

# vim: set sw=4 et: