{ inputs, homeImports, homeFlakePkgs, nixosModules, nixosFlakePkgs, vars, ... }:

{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;
    in
    {
      mikasa = nixosSystem {
        specialArgs = { inherit vars nixosFlakePkgs; };
        modules = [
          ./mikasa
          ../modules/desktop
          ../modules/hardware
          ../modules/proxy
          ../modules/virtualisation
          ../modules/boot/lanzaboote.nix
          {
            home-manager = {
              extraSpecialArgs = { inherit vars homeFlakePkgs; };
              users.${vars.user}.imports = homeImports."${vars.user}@mikasa";
            };
          }
        ] ++ nixosModules;
      };
    };
}
