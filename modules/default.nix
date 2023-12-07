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
          inputs.daeuniverse.nixosModules.daed
          inputs.lanzaboote.nixosModules.lanzaboote

          module_args
          ./base
        ];
      };
    }
  ];
}
