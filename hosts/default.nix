{ inputs, nixpkgs, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
  };

  nixosSystem = nixpkgs.lib.nixosSystem;

  vars = {
    user = "isaac";
    fullName = "Isaac Wang";
    email = "isaacwangtt@gmail.com";
    terminal = "kitty";
    editor = "nvim";
  };

  mikasa-modules = {
    nixos = [
      ./mikasa

      ../modules/fonts.nix
      ../modules/desktop.nix
      ../modules/lanzaboote.nix
    ];
    home = [
      ../home/profiles/mikasa.nix

      ../home/desktop/hyprland
      ../home/editors
      ../home/programs
      ../home/shell
    ];
  };
in
{
  mikasa = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs system vars; };
    modules = [
      ../modules
      inputs.home-manager.nixosModules.default
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit inputs system vars; };
        home-manager.users.${vars.user}.imports = [
          ../home
        ] ++
        mikasa-modules.home;
       }
    ] ++
    mikasa-modules.nixos;
  };
}
