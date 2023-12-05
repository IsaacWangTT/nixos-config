{ pkgs, ... }:

let
  config = import ./config.nix;
in
{
  # home.file = {
  #   ".config/neofetch/config.conf".text = config.neofetch;
  # };
  home.packages = [ pkgs.fastfetch ];
}
