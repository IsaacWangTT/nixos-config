{ config, pkgs, ... }:

{
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
          darkreader
          grammarly
          tab-session-manager
          tampermonkey
          translate-web-pages
        ];
        search = {
          default = "Google";
          engines = {
            "NixOS Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }
              ];
              iconUpdateURL = "https://nixos.org/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@np" ];
            };
            "NixOS Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }
              ];
              iconUpdateURL = "https://nixos.org/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@no" ];
            };
            "Home Manager Options" = {
              urls = [
                {
                  template = "https://mipmip.github.io/home-manager-option-search?query={searchTerms}";
                }
              ];
              iconUpdateURL = "https://mipmip.github.io/home-manager-option-search/images/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@hmo" ];
            };
            "MyNixOS" = {
              urls = [
                {
                  template = "https://mynixos.com/search?q={searchTerms}";
                }
              ];
              iconUpdateURL = "https://mynixos.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@mn" ];
            };

            "Amazon.com".metaData.hidden = true;
            "Wikipedia (en)".metaData.hidden = true;
            "Google".metaData.alias = "@g";
          };
          force = true;
          order = [ "Google" "Bing" "DuckDuckGo" "NixOS Packages" "NixOS Options" "Home Manager Options" "MyNixOS" ];
          privateDefault = "DuckDuckGo";
        };
        settings = {
          "general.autoScroll" = true;
        };
      };
    };
  };
}
