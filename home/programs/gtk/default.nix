{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = "Catppuccin-Mocha-Blue-Cursors";
    size = 16;
    gtk.enable = true;
  };
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":";
    };
  };
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Catppuccin-Mocha-Blue-Cursors";
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
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
}
