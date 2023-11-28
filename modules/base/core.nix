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

  services = {
    openssh = {
      enable = true;
    };
    dbus.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    killall
    neovim
    tree
    wget
    xdg-utils
  ];

  programs.fish.enable = true;
  users.users.${vars.user} = {
    isNormalUser = true;
    description = "${vars.fullName}";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    shell = pkgs.fish;
  };
}
