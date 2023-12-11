{ pkgs, myswaylock, ... }:

{
  _module.args = rec {
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
