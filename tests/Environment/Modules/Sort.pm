use base "softwarebasetest";
use strict;
use testapi;

sub sort_by($$){
	my $sort = shift;
	my $sort_result = shift;
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
	sort_by "by-time-menu","by-time-result";
}

sub del_file($){
	my $file = shift;
	sleep 2;
	assert_and_click $file,"right";
	assert_and_click "del-menu";
}

sub teardown{
	del_file "new-dir-in-desktop";
	del_file "new-file-in-desktop";
	del_file "new-doc-in-desktop";
	del_file "new-ppt-in-desktop";
	del_file "new-excel-in-desktop";
    assert_screen "desktop-default",10;
}

sub run{
	step1;
	step2;
	teardown;
}

1;

# vim: set sw=4 et: