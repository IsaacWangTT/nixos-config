{ pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      maple-mono-SC-NF
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra
      sarasa-gothic
      source-han-sans
      source-han-mono
      source-han-serif
      wqy_zenhei
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "Hack"
          "Iosevka"
          "JetBrainsMono"
        ];
      })
    ];
    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Maple Mono SC NF"
          "Sarasa Mono SC"
          "JetBrainsMono Nerd Font Mono"
          "Noto Sans Mono CJK SC"
          "Source Han Mono SC"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Source Han Sans SC"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Source Han Serif SC"
        ];
      };
    };
  };
}
