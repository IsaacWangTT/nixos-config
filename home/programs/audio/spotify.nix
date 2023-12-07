{ pkgs, homeFlakePkgs, ... }:

{
  programs.spicetify = {
    spotifyPackage = pkgs.spotify;
    spicetifyPackage = pkgs.spicetify-cli;

    enable = true;
    theme = homeFlakePkgs.spicetify-nix.themes.Comfy;
    colorScheme = "catppuccin-mocha";
    enabledCustomApps = with homeFlakePkgs.spicetify-nix.apps; [
      lyrics-plus
      marketplace
    ];
    enabledExtensions = with homeFlakePkgs.spicetify-nix.extensions; [
      fullAppDisplay
      autoVolume
      groupSession
    ];
  };
}
