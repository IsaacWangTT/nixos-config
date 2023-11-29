{ inputs, nixpkgs, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    overlays = [ inputs.nixgl.overlay ];
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

      ../modules/desktop
      ../modules/virtualisation
      ../modules/boot/lanzaboote.nix
    ];
    home = [
      ../home/profiles/mikasa.nix

      ../home/desktop/hyprland
      ../home/terminals
      ../home/editors
      ../home/programs
      ../home/shell
    ];
  };
  myServer-modules = {
    nixos = [
      ./myServer
    ];
    home = [
      ../home/profiles/myServer.nix
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
  myServer = nixosSystem {
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
        myServer-modules.home;
      }
    ] ++
    myServer-modules.nixos;
  };
}
