{ config, pkgs, inputs, ... }:
{
  home.file.".local/share/fcitx5/themes".source = "${inputs.catppuccin-fcitx5}/src";

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons fcitx5-table-extra fcitx5-gtk ] ++
    (with config.nur.repos; [
      ruixi-rebirth.fcitx5-pinyin-moegirl
      ruixi-rebirth.fcitx5-pinyin-zhwiki
    ]);
  };
}
