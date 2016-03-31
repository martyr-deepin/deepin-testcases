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

sub loadDeepinSoftwareTests{

    #deepin-screenshot
    loadtest "DeepinSoftware/DeepinScreenshot.pm";

    #deepin-boot-maker
    loadtest "DeepinSoftware/DeepinBootMaker.pm";

    #deepin-terminal
    loadtest "DeepinSoftware/DeepinTerminal.pm";
    
    #deepin-movie
    loadtest "DeepinSoftware/DeepinMovie.pm";

    #deepin-appstore
    loadtest "DeepinSoftware/DeepinAppStore.pm";

    #deepin-feedback
    loadtest "DeepinSoftware/DeepinFeedback.pm";

    #deepin-qq
    loadtest "DeepinSoftware/DeepinQQ.pm";
    
    #deepin-wm-mutitaskingview
    loadtest "DeepinSoftware/DeepinWM.pm";

    #dde-control-center
    loadtest "DeepinSoftware/DeepinDdeControlCenter.pm";
     
    #deepin-music-player
    loadtest "DeepinSoftware/DeepinMusic.pm";
}

sub loadOtherSoftwareTests{

    #chmsee
    loadtest "OtherSoftware/Chmsee.pm";

    #crossover
    loadtest "OtherSoftware/CrossOver.pm";

    #fctix
    loadtest "OtherSoftware/Fcitx.pm";

    #gdebi
    loadtest "OtherSoftware/GDebi.pm";
    
    #gedit
    loadtest "OtherSoftware/Gedit.pm";

    #gparted
    loadtest "OtherSoftware/GParted.pm";

    #google
    loadtest "OtherSoftware/Google.pm";

    #wps-office-wps
    loadtest "OtherSoftware/WpsOfficeWps.pm";

    #wps-office-wpp
    loadtest "OtherSoftware/WpsOfficeWpp.pm";

    #wps-office-et
    loadtest "OtherSoftware/WpsOfficeEt.pm";

    #Calculator
    loadtest "OtherSoftware/Calculator.pm";

    #Eog
    loadtest "OtherSoftware/Eog.pm";

    #Evince
    loadtest "OtherSoftware/Evince.pm";

    #FileRoller
    loadtest "OtherSoftware/FileRoller.pm";

    #FontViewer
    loadtest "OtherSoftware/FontViewer.pm";

    #Nautilus
    loadtest "OtherSoftware/Nautilus.pm";

    #SimpleScan
    loadtest "OtherSoftware/SimpleScan.pm";

    #SystemConfigPrint
    loadtest "OtherSoftware/SystemConfigPrint.pm";

    #SystemMonitor
    loadtest "OtherSoftware/SystemMonitor.pm";

    #Thunderbird
    loadtest "OtherSoftware/Thunderbird.pm";

    #YoudaoDict
    loadtest "OtherSoftware/YoudaoDict.pm";
}

sub loadEnvironmentTests{
    #launcher
    loadtest "Environment/Launcher/Start_up1.pm";
    loadtest "Environment/Launcher/Start_up2.pm";
    loadtest "Environment/Launcher/Start_up3.pm";
    loadtest "Environment/Launcher/Start_up4.pm";
    loadtest "Environment/Launcher/Search.pm";
    loadtest "Environment/Launcher/Operation.pm";
    #dock
    loadtest "Environment/Dock/SwitchMode.pm";
    loadtest "Environment/Dock/FashionAlwaysHide.pm";
    loadtest "Environment/Dock/FashionIntelligent.pm";
    loadtest "Environment/Dock/HighEffectAlwaysHide.pm";
    loadtest "Environment/Dock/HighEffectIntelligent.pm";
    loadtest "Environment/Dock/ClassicAlwaysHide.pm";
    loadtest "Environment/Dock/ClassicIntelligent.pm";
    #session-ui
    loadtest "Environment/Session_ui/Restart.pm";
    loadtest "Environment/Session_ui/Shutdown.pm";
    loadtest "Environment/Session_ui/Logout.pm";
    loadtest "Environment/Session_ui/Lock.pm";
    #modules
    loadtest "Environment/Modules/NewDir.pm";
    loadtest "Environment/Modules/NewFile.pm";
    loadtest "Environment/Modules/Sort.pm";
}

sub loadDockTests{

    loadtest "DeepinSoftware/DeepinDock.pm";

}

sub loadLauncherTests{

    loadtest "DeepinSoftware/DeepinLauncher.pm";

}

sub loadLauncherGeditTests{

    loadtest "OtherSoftware/Gedit.pm";

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


sub loadReleaseInforTests{

    loadtest "SystemConfig/ReleaseInfor.pm";

}


sub loadShellDefaultTests{

    loadtest "SystemConfig/ShellDefault.pm";

}


sub loadPythonTests{

    loadtest "SystemConfig/Python.pm";

}


sub loadShadowTests{

    loadtest "SystemConfig/Shadow.pm";

}


sub loadPerlTests{

    loadtest "SystemConfig/Perl.pm";

}


sub loadSourceListTests{

    loadtest "SystemConfig/SourceList.pm";

}


sub loadSysCfgAllTests{

    loadReleaseInforTests;
    loadShellDefaultTests;
    loadPythonTests;
    loadShadowTests;
    loadPerlTests;
    loadSourceListTests;

}


sub loadNeedleMaker{

    loadtest "NeedleMaker/NeedleMaker.pm"

}



##############
# start test #
##############

if (get_var("NEEDLEMAKER")){

    loadNeedleMaker;

    if (get_var("CANCLESUBMAKER")){
        loadShellDefaultTests;
    }

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

    if (get_var("DEEPINSOFTWARE")){

        loadDeepinSoftwareTests;

    }

    if (get_var("OTHERSOFTWARE")){

        loadOtherSoftwareTests;

    }

    if (get_var("ENVIRONMENT")){

        loadEnvironmentTests;

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

    if (get_var("DCCALL")){


        loadDccAllTests;

    }

    if (get_var("SYSCFGALL")){

        loadSysCfgAllTests;

    }

}

sleep 10;

1;

# vim: set sw=4 et:
