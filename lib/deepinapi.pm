package deepinapi;

use strict;
use base "Exporter";

use testapi;

our @EXPORT_OK = qw(open_tty run_on_tty start_program collect_logs install_from_local ensure_install download_local_file);

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
    if (not check_var("INSTLANG", "en")){
        type_string "LANG=C";
        send_key "ret";
    }

}

sub run_on_tty($;$$$){

    my $script = shift;
    my $sudo = shift || 0;
    my $tty = shift || "f1";
    my $timeout = shift || 60;

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
	    send_key "win";
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

1;
