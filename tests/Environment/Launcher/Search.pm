use base "softwarebasetest";
use strict;
use testapi;

sub launcher_sort_by($;$){
	mouse_set 58,58;
	sleep 5;
	assert_screen "launcher-icon-sort-menu",60;
	my $sort = shift;
	my $sort_launcher = shift;
	assert_and_click $sort;
	mouse_set 30,30;
	assert_screen $sort_launcher,60;
	type_string "deepin";
	assert_screen "search_deepin_launcher",60;
	for (my $i = 0; $i < 6; $i++){
		send_key "backspace";
	}
	assert_screen $sort_launcher,60;
}

sub step1{
	mouse_set 100,100;
	sleep 20;
	save_screenshot;
	assert_and_click "launcher";
	assert_screen "launcher-start-up2015",60;
	
}

sub step2{
	launcher_sort_by "sort-by-icon","sort-by-icon-main";
	launcher_sort_by "sort-by-text","sort-by-text-main";
	launcher_sort_by "sort-by-time","sort-by-time-main";
	launcher_sort_by "sort-by-frequency","sort-by-frequency-main";
}

sub teardown{
	launcher_sort_by "sort-by-name","launcher-start-up2015";
	send_key "esc";
	assert_screen "desktop-default",60;
}
sub run{
	step1;
	step2;
	teardown;
}

1;

# vim: set sw=4 et: