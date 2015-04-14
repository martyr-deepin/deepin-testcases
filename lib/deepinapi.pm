package deepinapi;

use strict;
use testapi;

sub runScriptOnTty($;$){
    my $script = shift;
    my $tty = shift || "f1";
    my $username = "deepin";
    my $userpwd = "deepin";
    if (get_var("USERNAME")){
        $username = get_var("USERNAME");
        $userpwd = get_var("USERPWD");
    }

    send_key "ctrl-alt-".$tty;

    sleep 2;

    type_string $username;
    send_key "ret";
    type_string $userpwd;
    send_key "ret";

    sleep 2;

    type_string $script;
    send_key "ret";

    # type passwd for sudo
    type_string $userpwd;
    send_key "ret";

    sleep 2;
    save_screenshot;

    type_string "logout";
    send_key "ret";

    send_key "ctrl-alt-f7";

    sleep 2;
}

sub disableSysNotifications{
    my $script = "sudo mv /usr/share/deepin-notifications/deepin-notifications /usr/share/deepin-notifications/deepin-notification";

    runScriptOnTty($script);
}

1;
