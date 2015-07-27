package softwarebasetest;

use base 'basetest';
use deepinapi qw(collect_logs);
use testapi;

sub test_flags {
    # without anything - rollback to 'lastgood' snapshot if failed
    # 'fatal' - whole test suite is in danger if this fails
    # 'milestone' - after this test succeeds, update 'lastgood'
    # 'important' - if this fails, set the overall state to 'fail'

    if (get_var("STRICTMODE")){
        bmwqemu::diag ("set test_flags to fatal");
        return {fatal => 1};
    }
    else
    {
        return {};
    }
}

sub pre_run_hook {
    my ($self) = @_;

    # ensure showing deepin desktop

}


sub post_run_hook {

    my ($self) = @_;

    # ensure showing deepin desktop

}

sub post_fail_hook{

    my ($self) = @_;

    collect_logs();
}

1;

