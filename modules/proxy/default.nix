{ config, pkgs, ... }:

{
  sops.secrets."config.dae" = {
    mode = "0600";
  };

  services.dae = {
    enable = true;
    package = pkgs.dae;
    configFile = config.sops.secrets."config.dae".path;
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
  };
}
