{ pkgs, ... }:

let
  config = import ./config.nix;
in
{
  home.file.".config/fastfetch/config.jsonc".text = config.fastfetch;
  home.packages = [ pkgs.fastfetch ];
}
