package deepinapi;

use strict;
use testapi;

# 在tty中运行sudo命令，接受命令和tty两个参数，默认在tty1中运行
# 注意：只能运行不耗时命令
sub runSUDOScriptOnTTY($;$){
    my $script = shift;
    my $tty = shift || "f1";
    my $username = "deepin";
    my $userpwd = "deepin";
    if (get_var("USERNAME")){
        $username = get_var("USERNAME");
        $userpwd = get_var("USERPWD");
    }

    # add sudo to script
    $script = "sudo ".$script;

    send_key "ctrl-alt-".$tty;

    sleep 2;
    type_string $username;
    send_key "ret";

    sleep 2;
    type_string $userpwd;
    send_key "ret";

    sleep 2;
    type_string $script;
    send_key "ret";

    sleep 2;
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
    my $script = "mv /usr/share/deepin-notifications/deepin-notifications /usr/share/deepin-notifications/deepin-notification";

    runSUDOScriptOnTTY($script);
}

1;
