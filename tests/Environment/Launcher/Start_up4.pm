use base "softwarebasetest";
use strict;
use testapi;


sub step1{
	if (check_screen "desktop-default",60){
		send_key "ctrl-alt-t";
		assert_screen "deepin-terminal-main-default",60;
		type_string "dde-launcher";
		sleep 2;
		save_screenshot;
		send_key "ret";
		assert_screen "launcher-start-up2015",60;
		send_key "esc";
		send_key "alt-f4";
		if (check_screen "exit_terminal_btn",60){
			assert_and_click "exit_terminal_btn";
		}
		assert_screen "desktop-default",60;
	}
}

sub run{
	step1;
}

1;

# vim: set sw=4 et: