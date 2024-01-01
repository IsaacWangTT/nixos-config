{ inputs, ... }:

{
  home.file.".config/lazygit/config.yml".source = "${inputs.catppuccin-lazygit}/themes-mergable/mocha/blue.yml";

  programs.lazygit = {
    enable = true;
  };
}
