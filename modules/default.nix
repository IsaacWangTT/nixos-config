{ inputs, ... }:

{
  imports = [
    inputs.daeuniverse.nixosModules.daed
    inputs.lanzaboote.nixosModules.lanzaboote
    ./base
  ];
}
