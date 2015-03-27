use base "basetest";
use strict;
use testapi;

sub run {
    my $self   = shift;
    my $iso    = get_var("ISO");
    my $size   = -s $iso;
    my $result = 'ok';
    my $max    = get_var("ISO_MAXSIZE");
    if ( $size > $max ) {
        $result = 'fail';
    }
    bmwqemu::diag("check if actual iso size $size fits $max: $result");
}

sub test_flags {
    # without anything - rollback to 'lastgood' snapshot if failed
    # 'fatal' - whole test suite is in danger if this fails
    # 'milestone' - after this test succeeds, update 'lastgood'
    # 'important' - if this fails, set the overall state to 'fail'
    return { important => 1 };
}

1;

# vim: set sw=4 et:
