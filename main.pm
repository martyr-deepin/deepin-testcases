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

sub loadtest($) {

    my ($test) = @_;
    autotest::loadtest(get_var("CASEDIR") . "/tests/$test");

}

sub loadISOMaxSizeTests(){

    loadtest "Boot/ISOSize.pm";
}

sub loadPXEBootloaderTests(){

    loadtest "Boot/PXEBootloader.pm";
}

sub loadInstTests(){

    # choose language
    loadtest "Installation/InstLangMenu.pm";

    # user setting
    loadtest "Installation/InstUserSetting.pm";

    # partition setting
    loadtest "Installation/InstPartition.pm";

    # installing
    loadtest "Installation/StartInstallation.pm";

    # waiting for the installation to the end, and restart
    loadtest "Installation/InstFinish.pm";

}

sub loadLoginTests{

    # login
    loadtest "Login/Login.pm";

}

sub loadDesktopTests(){

    if (not check_var("BOOTFROM", "c")){

        # guid
        loadtest "Desktop/FirstBootDesktop.pm";

    }

}

sub loadDockTests{

    loadtest "DeepinSoftware/DeepinDock.pm";

}

sub loadLauncherTests{

    loadtest "DeepinSoftware/DeepinLauncher.pm";

}

sub loadLauncherGeditTests{

    loadtest "OtherSoftware/Gedit.pm"

}


sub loadDeepinMusicPlayerTests{

    loadtest "DeepinSoftware/DeepinMusic.pm";

}


sub loadDccUserTests{

    loadtest "DeepinSoftware/DCCUser.pm";
}


sub loadDmovieTests{

    loadtest "DeepinSoftware/DeepinMovie.pm";

}

sub loadDccDisplayTests{

    loadtest "DeepinSoftware/DCCDisplay.pm";

}


sub loadDccDefaultappTests{

    loadtest "DeepinSoftware/DCCDefaultapp.pm";

}


sub loadDccPersonalizationTests{

    loadtest "DeepinSoftware/DCCPersonalization.pm";

}


sub loadDccNetworkTests{

    loadtest "DeepinSoftware/DCCNetwork.pm";

}


sub loadDccSoundTests{

    loadtest "DeepinSoftware/DCCSound.pm";

}


sub loadDccDatetimeTests{

    loadtest "DeepinSoftware/DCCDatetime.pm";

}


sub loadDccPowermgmTests{

    loadtest "DeepinSoftware/DCCPowermgm.pm";

}


sub loadDccMouseTests{

    loadtest "DeepinSoftware/DCCMouse.pm";

}


sub loadDccKeyboardTests{

    loadtest "DeepinSoftware/DCCKeyboard.pm";

}


sub loadDccShortcutTests{

    loadtest "DeepinSoftware/DCCShortcut.pm";

}


sub loadDccBootmenuTests{

    loadtest "DeepinSoftware/DCCBootmenu.pm";

}


sub loadDccRemoteTests{

    loadtest "DeepinSoftware/DCCRemote.pm";

}


sub loadDccSysteminforTests{

    loadtest "DeepinSoftware/DCCSysteminfor.pm";

}


sub loadDccPowerTests{

    loadtest "DeepinSoftware/DCCPower.pm";

}


sub loadDccAllTests{

    loadDccUserTests;
    loadDccDisplayTests;
    loadDccDefaultappTests;
    loadDccPersonalizationTests;
    loadDccNetworkTests;
    loadDccSoundTests;
    loadDccDatetimeTests;
    loadDccPowermgmTests;
    loadDccMouseTests;
    loadDccKeyboardTests;
    loadDccShortcutTests;
    loadDccBootmenuTests;
    loadDccRemoteTests;
    loadDccSysteminforTests;
    loadDccPowerTests;

}


sub loadNeedleMaker{

    loadtest "NeedleMaker/NeedleMaker.pm"

}



##############
# start test #
##############

if (get_var("NEEDLEMAKER")){

    loadNeedleMaker;

}
else{

    # pxe
    if (check_var("FLAVOR", "SID-PXE")){

        loadPXEBootloaderTests;

    }

    if (get_var("ISO_MAXSIZE") && check_var("FLAVOR", "SID-DVD")){

        loadISOMaxSizeTests;

    }

    if (not check_var("BOOTFROM", "c")){

        # install
        loadInstTests;

    }

    # login
    loadLoginTests;

    if (not check_var("BOOTFROM", "c")){
        # entry desktop
        loadDesktopTests;
    }

    if (get_var("DOCK")){

        loadDockTests;

    }

    if (get_var("LAUNCHER")){

        loadLauncherTests;

    }

    if (get_var("GEDIT")){
        loadLauncherGeditTests;
    }

    if (get_var("DEEPINMUSICPLAYER")){

        loadDeepinMusicPlayerTests;

    }

    if (get_var("DCCALL")){

        loadDccAllTests;

    }

    if (get_var("DMOVIE")){

        loadDmovieTests;

    }

}

sleep 10;

1;

# vim: set sw=4 et:
