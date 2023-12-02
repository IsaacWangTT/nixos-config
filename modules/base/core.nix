{ config, pkgs, vars, ... }:

{
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.UTF-8";

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  console = {
    earlySetup = true;
    packages = [ pkgs.terminus_font ];
    font = "ter-u16n";
  };

  services = {
    openssh = {
      enable = true;
    };
    dbus.enable = true;
  };

  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    shells = [ pkgs.fish ];
    systemPackages = with pkgs; [
      # GNU Program Environment
      gcc
      clang
      cmake
      zig
      gdb
      glib

      # System Tools
      git
      wget
      tree
      xdg-utils
      neovim
      neofetch
      psmisc
      timeshift

      # Unzip Tools
      p7zip
      atool
      unzip
      zip
      rar
    ];
  };

  programs.fish.enable = true;
  users.users.${vars.user} = {
    isNormalUser = true;
    description = "${vars.fullName}";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    shell = pkgs.fish;
  };

  system.stateVersion = "24.05";
}
