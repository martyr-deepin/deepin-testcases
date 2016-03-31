use base "softwarebasetest";
use strict;
use testapi;

sub new_file($;$){
	my $file_type = shift;
	my $new_file = shift;
	mouse_set 500,500;
	if (check_screen "desktop-default",60){
		mouse_click "right";
		assert_and_hover "new-txt";
		sleep 5;
		save_screenshot;
		assert_and_click $file_type;
		mouse_click;
		assert_screen $new_file,60;
	}
}

sub step1{
	new_file "file-menu","new-file-in-desktop";
}

sub step2{
	new_file "doc-menu","new-doc-in-desktop";
}

sub step3{
	new_file "ppt-menu","new-ppt-in-desktop";
}

sub step4{
	new_file "excel-menu","new-excel-in-desktop";
}

sub run{
	step1;
	step2;
	step3;
	step4;
}

1;

# vim: set sw=4 et: