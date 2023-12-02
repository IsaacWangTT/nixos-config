{ inputs, homeImports, nixosModules, vars, ... }:

{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;
    in
    {
      mikasa = nixosSystem {
        specialArgs = { inherit vars; };
        modules = [
          ./mikasa
          ../modules/desktop
          ../modules/hardware
          ../modules/virtualisation
          ../modules/boot/lanzaboote.nix
          {
            home-manager = {
              extraSpecialArgs = { inherit vars; };
              users.${vars.user}.imports = homeImports."${vars.user}@mikasa";
            };
          }
        ] ++ nixosModules;
      };
    };
}
