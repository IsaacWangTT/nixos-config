{ config, inputs, ... }:

{
  imports = [
    inputs.daeuniverse.nixosModules.daed
    inputs.lanzaboote.nixosModules.lanzaboote
    ./core.nix
    ./nix.nix
  ];
}
