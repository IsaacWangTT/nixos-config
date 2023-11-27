{ config, inputs, ... }:

{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  programs.home-manager.enable = true;
}
