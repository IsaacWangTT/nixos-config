{ inputs, pkgs, ... }:

let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    spotifyPackage = pkgs.spotify;
    spicetifyPackage = pkgs.spicetify-cli;

    enable = true;
    theme = spicePkgs.themes.Comfy;
    colorScheme = "catppuccin-mocha";
    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
      marketplace
    ];
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      autoVolume
      groupSession
    ];
  };
}
