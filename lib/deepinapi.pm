package deepinapi;

use strict;
use base "Exporter";

use testapi;

our @EXPORT_OK = qw(open_tty run_on_tty start_program collect_logs install_from_local ensure_install download_local_file 
                    open_dcc close_dcc refresh_dcc check_app_open );

sub open_tty(;$){

    my $tty = shift || "f1";

    send_key "ctrl-alt-$tty";
    #assert_screen("text-login", 10);
    save_screenshot;

    my $username = "deepin";
    my $userpwd = "deepin";
    if (get_var("USERNAME")){
        $username = get_var("USERNAME");
    }
    if (get_var("USERPWD")){
        $userpwd = get_var("USERPWD");
    }

    sleep 3;
    type_string $username;
    send_key "ret";

    sleep 2;
    type_string $userpwd;
    send_key "ret";

    sleep 2;

    # set language env
    #if (not check_var("INSTLANG", "en")){
    #    type_string "LANG=C";
    #    send_key "ret";
    #}

    # set language to English
    type_string "LANG=en";
    send_key "ret";

}

sub run_on_tty($;$$$){

    my $script = shift;
    my $sudo = shift || 0;
    my $tty = shift || "f1";
    my $timeout = shift || 600;

    open_tty ($tty);

    my $userpwd = "deepin";
    if (get_var("USERPWD")){
        $userpwd = get_var("USERPWD");
    }

    # add sudo before script
    if ($sudo){

        # add sudo to script
        $script = "sudo ".$script;

    }

    sleep 2;
    type_string $script;
    send_key "ret";

    # type passwd for sudo script
    if ($sudo){

        sleep 2;
        # type passwd for sudo
        type_string $userpwd;
        send_key "ret";

    }

    if (not wait_still_screen (10, $timeout)){

        bmwqemu::diag(" script time out, send CTRL-C for termination");
        send_key "ctrl-c";
        sleep 2;

    }

    wait_idle 10;

    sleep 2;
    save_screenshot;

    type_string "logout";
    send_key "ret";

    send_key "ctrl-alt-f7";

    sleep 2;
}


sub start_program($;$){

    my $name = shift;
    my $needle = shift;

    sleep 10;
    if (check_screen "desktop-default",20){
	    #send_key "win"; right menu key is not available,only left key valid
	    send_key "super";
	    save_screenshot;
	    assert_screen "launcher-start-up2015", 20;
	    
	    #type_string $name;
	    my @array=split "", $name;
	    foreach my $ch(@array)
	    {
		type_string $ch;
		sleep 1;
	    }
	    if ($needle){
		assert_screen $needle, 20;
	    }
	    else{
		sleep 2;
		save_screenshot;
	    }

	    send_key "ret";
    }
}


sub collect_logs {

    open_tty;

    save_screenshot;

    type_string "cat \$HOME/.xsession-errors* > /tmp/XSE\n";
    upload_logs "/tmp/XSE";
    save_screenshot;

    type_string "cat /var/log/X* > /tmp/Xlogs\n";
    upload_logs "/tmp/Xlogs";
    save_screenshot;

    type_string "cat \$HOME/core > /tmp/DeepinCore\n";
    upload_logs "/tmp/DeepinCore";
    save_screenshot;

}

sub install_from_local{

    my (@pkglist) = @_;

    bmwqemu::diag("install pkgs: @pkglist");

    my $urls = "";
    my $pkg_path_list = "";
    #for (my $i = 0; $i < @pkglist; $i++){
    for (@pkglist){
        $urls .= autoinst_url."/data/$_ ";
        $pkg_path_list .= "/tmp/$_ ";
    }

    my $cmd = "wget $urls -P /tmp && sudo dpkg -i $pkg_path_list && sudo apt-get -f -y install";

    my $timeout = 10 * @pkglist + 10;
    run_on_tty($cmd, 1, "f2", $timeout);

}

sub ensure_install($){

    my (@pkglist) = @_;

    my $cmd = "sudo apt-get install -y @pkglist";

    my $timeout = 15 * @pkglist + 10;
    run_on_tty($cmd, 1, "f2", $timeout);

}

sub download_local_file($$;$){

    my $file = shift;
    my $store = shift;
    my $timeout = shift || 60;
    my $url = autoinst_url."/data/$file";
    my $cmd = "wget $url -P $store";

    run_on_tty ($cmd, 0, "f2", $timeout);

}

sub open_dcc($){

    my $module = shift;
    my $needle_dcc_main = "dcc-main-area"; 
    my $needle_dcc_module = "dcc-main-".$module;
    my $needle_dcc_slider = "dcc-slider-".$module;
    assert_screen "desktop-default";
    mouse_set 1023, 767;
    assert_screen $needle_dcc_main;
    assert_and_click $needle_dcc_module;
    assert_screen $needle_dcc_slider;

}

sub close_dcc(){

    assert_and_click "dcc-backtohome-btn";
    assert_screen "dcc-main-area";
    mouse_set 100, 100;
    mouse_click;
    assert_screen "desktop-default";
    
}

sub refresh_dcc($){

    my $module = shift;
    my $needle_dcc_module = "dcc-main-".$module;
    my $needle_dcc_slider = "dcc-slider-".$module;
    assert_and_click "dcc-backtohome-btn";
    assert_screen "dcc-main-area";
    assert_and_click $needle_dcc_module;
    assert_screen $needle_dcc_slider;    

}

sub check_app_open($$){
    my $appname = shift;
    my $appscreen = shift;
    assert_and_click $appname;
    save_screenshot;
    sleep 2;
    assert_screen $appscreen,100;
    sleep 2;
}

1;
