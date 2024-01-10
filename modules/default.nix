{ inputs, ... }:

let
  module_args._module.args = {
    inherit inputs;
  };
  system = "x86_64-linux";
in
{
  imports = [
    {
      _module.args = {
        inherit module_args;

        nixosFlakePkgs = {
          nixpkgs-wayland = inputs.nixpkgs-wayland.packages.${system};
        };

        nixosModules = [
          inputs.home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }
          inputs.impermanence.nixosModules.impermanence
          inputs.lanzaboote.nixosModules.lanzaboote
          inputs.sops-nix.nixosModules.sops

          module_args
          ./base
        ];
      };
    }
  ];
}
