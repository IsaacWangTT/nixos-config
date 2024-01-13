{ inputs, homeImports, homeFlakePkgs, nixosModules, nixosFlakePkgs, vars, ... }:

{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;
    in
    {
      mikasa = nixosSystem {
        specialArgs = {
          inherit vars nixosFlakePkgs;
          pkgs-stable = import inputs.nixpkgs-stable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
        modules = [
          ./mikasa
          ../modules/base/impermanence.nix
          ../modules/desktop
          ../modules/desktop/firejail.nix
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
