{ pkgs, ... }:

{
  imports = [
    {
      _module.args = {
        myswaylock = pkgs.writeShellScriptBin "myswaylock" ''
          swaylock \
            --indicator-radius 100 \
            --indicator-thickness 7 \
            --ring-color 9399b2 \
            --ring-ver-color a6e3a1 \
            --ring-wrong-color f38ba8 \
            --ring-clear-color 89dceb \
            --key-hl-color 89d4fa \
            --bs-hl-color eba0ac \
            --line-color 00000000 \
            --line-ver-color 00000000 \
            --line-wrong-color 00000000 \
            --line-clear-color 00000000 \
            --separator-color 00000000 \
            --inside-color 585b70 \
            --inside-ver-color 585b70 \
            --inside-wrong-color 585b70 \
            --text-color cdd6f4 \
            --text-ver-color cdd6f4 \
            --text-wrong-color cdd6f4 \
            --text-clear-color cdd6f4 \
            --text-caps-lock-color cdd6f4 \
            --color 1e1e2e80
        '';
      };
    }
  ];
}
