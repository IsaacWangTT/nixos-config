{ pkgs, ... }:
{
  xdg.desktopEntries = {
    tidal-hifi = {
      name = "TIDAL Hi-Fi";
      exec = "tidal-hifi %U --enable-wayland-ime";
      terminal = false;
      type = "Application";
      icon = "tidal-hifi";
      genericName = "TIDAL Hi-Fi";
      comment = "Tidal on Electron with widevine(hifi) support";
      startupNotify = true;
      categories = [ "AudioVideo" ];
      mimeType = [ "x-scheme-handler/tidal" ];
    };
  };

  home.packages = [ pkgs.tidal-hifi ];
}
