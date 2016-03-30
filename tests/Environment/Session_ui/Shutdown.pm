use base "softwarebasetest";
use strict;
use testapi;

sub login{
	my $userpwd = "deepin";

    if (get_var("USERPWD")){
        $userpwd = get_var("USERPWD");
    }
    sleep 3;
    type_string "$userpwd";
    save_screenshot;
    sleep 1;
    send_key "ret";
    assert_screen "dock-fashion-mode-default",100;
}

sub dcc{
	if (check_screen "dock-fashion-mode-default",100){
		mouse_set 1022,766;
		if (check_screen "shutdown-icon",60){
			assert_and_click "shutdown-icon";
			assert_screen "deepin-session",60;
			send_key "esc";
			mouse_set 100,100;
			assert_screen "dock-fashion-mode-default",100;
		}
	}
}

sub hotkey{
	send_key "ctrl-alt-delete";
	assert_screen "deepin-session",60;
=pod
	send_key "ret";
	sleep 3;
	save_screenshot;
	assert_screen "shutdown-ui",60;
=cut
	send_key "esc";
	assert_screen "dock-fashion-mode-default",60;
}

sub run{
	dcc;
	hotkey;
}

1;

# vim: set sw=4 et: