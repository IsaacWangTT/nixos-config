{ config, pkgs, ... }:

{
  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
      configurationLimit = 3;
    };
  };

  environment.systemPackages = [ pkgs.sbctl ];
}
