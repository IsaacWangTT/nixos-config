{ pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra
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
          "Noto Sans Mono CJK SC"
          "FiraCode Nerd Font Mono"
          "JetBrainsMono Nerd Font Mono"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
	        "Source Han Sans SC"
          "FiraCode Nerd Font"
        ];
        serif = [
          "Noto Serif CJK SC"
	        "Source Han Serif SC"
        ];
      };
    };
  };
}
