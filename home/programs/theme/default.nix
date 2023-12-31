{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaBlue;
    name = "Catppuccin-Mocha-Blue-Cursors";
    size = 16;
    gtk.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Latte-Standard-Blue-Light";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        tweaks = [ "rimless" "black" ];
        variant = "latte";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Blue-Cursors";
      package = pkgs.catppuccin-cursors.mochaBlue;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "Maple Mono SC NF";
      size = 12;
    };
    gtk4.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":";
    };
  };
}
