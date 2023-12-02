{ inputs, ... }:

let
  module_args._module.args = {
    inherit inputs;
  };
in
{
  imports = [
    {
      _module.args = {
        inherit module_args;

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
