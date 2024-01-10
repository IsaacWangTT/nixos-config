{ config, pkgs, ... }:

let
  firefox-gnome-theme = pkgs.fetchFromGitHub {
    owner = "rafaelmardojai";
    repo = "firefox-gnome-theme";
    rev = "v121";
    hash = "sha256-M+Cw6vh7xCDmIhyVuEPNmaNVUwpmdFQq8zlsXZTKees=";
  };
in
{
  home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme" = {
    source = "${firefox-gnome-theme}";
    recursive = true;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads/Firefox";
      ShowHomeButton = true;
    };
    profiles = {
      "default" = {
        extensions = with config.nur.repos.rycee.firefox-addons; [
          bitwarden
          darkreader
          duckduckgo-privacy-essentials
          firefox-color
          gesturefy
          grammarly
          new-tab-override
          tab-session-manager
          tampermonkey
          translate-web-pages
          tree-style-tab
          tst-wheel-and-double
          ublock-origin
          vimium
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
          "browser.search.region" = "US";
          "doh-rollout.home-region" = "US";
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
          "signon.rememberSignons" = false;

          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.uidensity" = 0;
          "svg.context-properties.content.enabled" = true;
          "browser.theme.dark-private-windows" = false;
          "widget.gtk.rounded-bottom-corners.enabled" = true;
          "layers.acceleration.force-enabled" = true;
          "gnomeTheme.symbolicTabIcons" = true;
        };
        userChrome = ''
          @import "firefox-gnome-theme/userChrome.css";

          #tabbrowser-tabs tab,
          #tabbrowser-tabs tab ~ toolbarbutton,
          #tabbrowser-tabs tab ~ #tabbrowser-arrowscrollbox-periphery {
            visibility: collapse;
          }
        '';
        userContent = ''
          @import "firefox-gnome-theme/userContent.css" ;
        '';
      };
    };
  };
}
