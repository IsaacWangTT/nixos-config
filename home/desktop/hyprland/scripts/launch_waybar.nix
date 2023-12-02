{ pkgs, ... }:

{
  launch_waybar = pkgs.writeShellScriptBin "launch_waybar" ''
    killall .waybar-wrapped
    waybar
  '';
}
