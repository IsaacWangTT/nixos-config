{ config, pkgs, ... }:

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
    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads/Firefox";
    };
    profiles = {
      "default" = {
        extensions = with config.nur.repos.rycee.firefox-addons; [
          bitwarden
          grammarly
          tab-session-manager
          tampermonkey
          translate-web-pages
        ];
        settings = {
          "general.autoScroll" = true;
        };
      };
    };
  };
}
