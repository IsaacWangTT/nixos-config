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
          firefox-color
          gesturefy
          grammarly
          new-tab-override
          tab-session-manager
          tampermonkey
          translate-web-pages
          ublock-origin
        ];
        search = {
          default = "Google";
          engines = {
            "NixOS Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "channel"; value = "unstable"; }
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
                    { name = "channel"; value = "unstable"; }
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
          "browser.startup.homepage" = "https://homepage-lovat-ten.vercel.app/";
          "general.autoScroll" = true;
          "browser.tabs.warnOnClose" = true;
          "toolkit.tabbox.switchByScrolling" = true;
          "browser.tabs.loadBookmarksInTabs" = true;
          "browser.search.openintab" = true;
          "browser.tabs.closeTabByDblclick" = true;
          "browser.tabs.closeWindowWithLastTab" = false;
          "browser.urlbar.openintab" = true;
          "privacy.resistFingerprinting.block_mozAddonManager" = true;
          "extensions.webextensions.restrictedDomains" = "";

          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.uidensity" = 0;
          "svg.context-properties.content.enabled" = true;
          "browser.theme.dark-private-windows" = false;
          "widget.gtk.rounded-bottom-corners.enabled" = true;
          "layers.acceleration.force-enabled" = true;
          "gnomeTheme.symbolicTabIcons" = true;
        };
        userChrome = ''
          @import "firefox-gnome-theme-120/userChrome.css";
        '';
        userContent = ''
          @import "firefox-gnome-theme-120/userContent.css";
        '';
      };
    };
  };
}
