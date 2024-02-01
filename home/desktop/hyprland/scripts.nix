{ pkgs, ... }:

{
  _module.args = rec {
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
        --color 1e1e2e80 \
        --screenshots \
        --clock \
        --indicator
    '';

    sleep = pkgs.writeShellScriptBin "sleep" ''
      swayidle -w \
        before-sleep "${myswaylock}/bin/myswaylock" \
        timeout 150 'temp=$(light -G); light -S $((''${temp%.*} / 2))' \
        resume 'temp=$(light -G); light -S $((''${temp%.*} * 2))' \
        timeout 300 "${myswaylock}/bin/swaylock & sleep 0.1 && hyprctl dispatch dpms off" \
        resume 'hyprctl dispatch dpms on' \
        timeout 600 'systemctl suspend' \
        resume 'hyprctl dispatch dpms on'
    '';

    caffeine = pkgs.writeShellScriptBin "caffeine" ''
      if pgrep -x sleep > /dev/null; then
        notify-send -i ${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark/symbolic/status/my-caffeine-on-symbolic.svg -u low "Caffeine Enabled"
        killall swayidle
        swayidle -w before-sleep "${myswaylock}/bin/myswaylock" &
      else
        notify-send -i ${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark/symbolic/status/my-caffeine-off-symbolic.svg -u low "Caffeine Disabled"
        killall swayidle
        ${sleep}/bin/sleep &
      fi
    '';

  };
}
