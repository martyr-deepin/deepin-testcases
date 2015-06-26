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

#BEGIN { push @INC, "$ENV{'PWD'}/common" }

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

sub loadPXEBootloaderTests(){

    loadtest "Boot/PXEBootloader.pm"
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
    loadtest "Login/Login.pm";

}

sub loadDesktopTests(){

    # guid
    loadtest "Desktop/WelcomeGuid.pm";

}

sub loadDockTests{
    loadtest "Dock/DockSwitch.pm";
}

sub loadLauncherTests{
    loadtest "Launcher/LauncherStartUp.pm";
}

sub loadDeepinMusicPlayerTests{

    loadtest "DeepinMusicPlayer/DMusicStartUp.pm";

    loadtest "DeepinMusicPlayer/DMusicMain.pm";

    loadtest "DeepinMusicPlayer/DMusicExit.pm";
}


sub loadDccUserTests{
    loadtest "Controlcenter/DccUser.pm";
}


sub loadDmovieTests{
    loadtest "DeepinMovie/StartCloseDmovie.pm";

}

sub loadDccDisplayTests{
    loadtest "Controlcenter/DccDisplay.pm";

}


sub loadNeedleMaker{

    loadtest "NeedleMaker/Maker.pm"

}



##############
# start test #
##############

# pxe
if (check_var("FLAVOR", "SID-PXE")){
    loadPXEBootloaderTests;
}

# install
loadInstTests;

# login
loadLoginTests;

# close system notifications
#closeSysNotifications;

# entry desktop
loadDesktopTests;

if (get_var("DOCK")){
    loadDockTests;
}

if (get_var("LAUNCHER")){
    loadLauncherTests;
}

if (get_var("DEEPINMUSICPLAYER")){
    loadDeepinMusicPlayerTests;
}

if (get_var("DCCDISPLAY")){
    loadDccDisplayTests;
}

if (get_var("DCCUSER")){
    loadDccUserTests;
}

if (get_var("DMOVIE")){

   loadDmovieTests;
}

if (get_var("NEEDLEMAKER")){
    loadNeedleMaker;
}

sleep 15;

1;

# vim: set sw=4 et:
