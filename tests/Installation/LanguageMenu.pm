# Copyright (C) 2014 SUSE Linux GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

use base "basetest";
use strict;
use testapi;
sub getLanguageIndex($){
    my ($choseLang) = @_;

    $choseLang = lc($choseLang);

    if ( $choseLang =~ /^en.*/ ){
        $choseLang = "en";
    }
    # language map
    my @langList = qw(
    en
    zh_CN
    zh_TW
    fr
    de
    ru
    es
    id
    it
    tr
    pt_BR
    pt
    pl
    ro
    nl
    hu
    cs
    el
    da
    hr
    );

    my $i = 0;
    my %langMap = map { lc($_) => $i++ } @langList;

    my $index = 0;
    if (exists $langMap{$choseLang}){
        $index = $langMap{$choseLang};
    }

    return $index;
}



sub run {

    mouse_hide;

    save_screenshot;

    # wait for language menu to appear
    assert_screen "inst-lang-menu", 50;

    my $lang = "en";

    if (get_var("INSTLANG")){
        $lang = get_var("INSTLANG");
    }

    my $index = getLanguageIndex($lang);

    # choose language
    for (my $i = 0; $i < $index + 1; $i++){
        send_key "down";
    }

    # press enter key to choose the right language
    send_key "ret";

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
