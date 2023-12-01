{ inputs, ... }:

{
  imports = [
    inputs.chaotic.homeManagerModules.default
    inputs.flatpaks.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    inputs.nur.hmModules.nur
  ];

  programs.home-manager.enable = true;
}
