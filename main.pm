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

use strict;
use testapi;
use autotest;

use Gtk2;
use threads;
use threads::shared;

sub loadtest($) {
    my ($test) = @_;
    autotest::loadtest(get_var("CASEDIR") . "/tests/$test");
}



sub loadInstTests(){
    #loadBootTests();

    # choose language
    loadtest "Installation/LanguageMenu.pm";

    # user setting
    loadtest "Installation/UserSetting.pm";

    # partition setting
    loadtest "Installation/Partitioning.pm";

    # installing
    loadtest "Installation/StartInstallation.pm";

    # waiting for the installation to the end, and restart
    loadtest "Installation/Finish.pm";
}

sub loadLoginTests{

    # login
    loadtest "Login/Boot.pm";

}

sub loadDesktopTests(){

    # guid
    loadtest "Desktop/WelcomeGuid.pm";

}

sub loadDockTests{
    loadtest "Dock/DockSwitch.pm";
}

sub loadLauncherTests{
    loadtest "Launcher/StartUp.pm";
}

sub loadDeepinMusicPlayerTests{

    loadtest "DeepinMusicPlayer/DMusicStartUp.pm";

    loadtest "DeepinMusicPlayer/Main.pm";
}


sub loadDccUserTests(){
    loadtest "Controlcenter/DccUser.pm";
}

sub loadNeedleMaker{

    loadtest "NeedleMaker/Maker.pm"

}



##############
# start test #
##############

# install
loadInstTests;

# login
loadLoginTests;

# entry desktop
loadDesktopTests;

if (get_var("DOCK") == "1"){
    loadDockTests;
}

if (get_var("LAUNCHER") == "1"){
    loadLauncherTests;
}

if (get_var("DEEPINMUSICPLAYER") == "1"){
    loadDeepinMusicPlayerTests;
}

if (get_var("DCC") == "1"){
    #entry dccuser;
    loadDccUserTests;
}

if (get_var("NEEDLEMAKER") == "1"){
    loadNeedleMaker;
}

sleep 15;

1;

# vim: set sw=4 et:
