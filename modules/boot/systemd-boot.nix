{ config, ... }:

{
  boot = {
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 3;
    };
  };

  environment.systemPackages = [ pkgs.sbctl ];
}
