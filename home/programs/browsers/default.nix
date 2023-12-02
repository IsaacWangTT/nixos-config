{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--gtk-version=4"
      "--enable-wayland-ime"
    ];
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
  };
}
