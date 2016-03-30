use base "softwarebasetest";
use strict;
use testapi;

sub check_menu($;$;$){
	my $menu = shift;
    my $appscreen = shift;
    my $appingroup = shift;
    assert_and_click "app-group";
	assert_and_click "calculator-app","right";
	assert_and_click $menu;
	assert_screen $appscreen,5;
	assert_and_click "app-group";
	assert_screen $appingroup,5;
}

sub check_menu2($;$){
	my $menu = shift;
	my $appingroup = shift;
	assert_and_click "app-group";
	assert_and_click "calculator-app","right";
	assert_and_click $menu;
	assert_and_click "desktop-blank","right";
	assert_and_click "paste";
	assert_and_click "app-group";
	assert_screen $appingroup,5;
}

sub check_menu_del($;$){
	my $menu = shift;
	my $appingroup = shift;
	assert_and_click "app-group";
	assert_and_click "calculator-app","right";
	assert_and_click $menu;
	assert_and_click "app-group";
	assert_screen $appingroup,5;
}

sub step1{
	if (check_screen "desktop-default",60){
		send_key "super";
		assert_and_click "simple-scan-icon","right";
		assert_and_click "send-to-desktop-menu";
		assert_and_click "file-roller-icon","right";
		assert_and_click "send-to-desktop-menu";
		assert_and_click "calculator-icon","right";
		assert_and_click "send-to-desktop-menu";
		send_key "esc";
		assert_screen "apps-in-desktop",5;
		mouse_set 60,160;
		sleep 3;
		$bmwqemu::backend->mouse_button( "left", 1 );
		sleep 3;
		mouse_set 60,45;
		assert_screen "app-group",5;
		mouse_set 60,275;
		sleep 3;
		$bmwqemu::backend->mouse_button( "left", 1 );
		sleep 3;
		mouse_set 60,45;
	}
}
	
sub step2{
	check_menu "app-open-menu","calculator-main-default","app-group-has-calculator";
	check_menu "app-attr-menu","calculator-atr-default","app-group-has-calculator";
	check_menu2 "app-copy-menu","calculator-icon-in-desktop";
	check_menu2 "app-cut-menu","app-group-no-calculator";
	check_menu_del "app-del-menu","app-group-no-calculator";
}
	

sub run{
	step1;
	step2;
}

1;

# vim: set sw=4 et: