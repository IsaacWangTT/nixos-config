{ pkgs, homeFlakePkgs, ... }:

{
  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      genericName = "Music Player";
      icon = "spotify-client";
      exec = "spotify %U --enable-wayland-ime";
      mimeType = [ "x-scheme-handler/spotify" ];
      categories = [ "Audio" "Music" "Player" "AudioVideo" ];
    };
  };

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
      groupSession
      keyboardShortcut
      lastfm
    ];
  };
}
