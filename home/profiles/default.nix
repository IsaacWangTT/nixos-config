{ inputs, module_args, ... }:

let
  vars = {
    user = "isaac";
    fullName = "Isaac Wang";
    email = "isaacwangtt@gmail.com";
    browser = "firefox";
    terminal = "kitty";
    editor = "nvim";
  };

  system = "x86_64-linux";

  homeFlakePkgs = {
    nixpkgs-wayland = inputs.nixpkgs-wayland.packages.${system};
    spicetify-nix = inputs.spicetify-nix.packages.${system}.default;
  };

  homeModules = [
    (import ../. { inherit vars; })
    module_args

    inputs.chaotic.homeManagerModules.default
    inputs.flatpaks.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    inputs.nix-index-database.hmModules.nix-index
    inputs.nur.hmModules.nur
    inputs.sops-nix.homeManagerModules.sops
    inputs.spicetify-nix.homeManagerModules.default
  ];

  homeImports = {
    "${vars.user}@mikasa" = [ ./mikasa ] ++ homeModules;
  };
in
{
  imports = [
    {
      _module.args = { inherit homeImports vars homeFlakePkgs; };
    }
  ];
}
