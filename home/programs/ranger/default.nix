{ pkgs, ... }:

let
  rc = import ./rc.nix;
in
{
  home.file.".config/ranger/rc.conf".text = rc.rc;

  home.packages = with pkgs; [
    ranger

    atool
    highlight
  ];
}
