{
  programs.waybar = {
    settings = [{
      "layer" = "top";
      "position" = "top";

      modules-left = [
        "custom/icon"
        "hyprland/workspaces"
        "cava"
      ];

      modules-center = [
        "mpris"
      ];

      modules-right = [
        "wireplumber"
        "backlight"
        "network"
        "battery"
        "clock"
        "tray"
      ];

      "custom/icon" = {
        "format" = "";
        "tooltip" = false;
      };

      "hyprland/workspaces" = {
        "format" = "{icon}";
        "format-icons" = {
          "default" = "";
        };
        "persistent-workspaces" = {
          "1" = [ ];
          "2" = [ ];
          "3" = [ ];
          "4" = [ ];
        };
      };

      "cava" = {
        "cava_config" = "/home/isaac/.config/cava/config";
        "framerate" = 60;
        "bars" = 14;
        "lower_cutoff_freq" = 50;
        "higher_cutoff_freq" = 10000;
        "bar_delimiter" = 0;
        "sleep_timer" = 5;
        "method" = "pipewire";
        "monstercat" = true;
        "noise_reduction" = 0.77;
        "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      };


      "mpris" = {
        "format" = "{player_icon} {dynamic}";
        "format-paused" = "{status_icon} {dynamic}";
        "interval" = 1;
        "player-icons" = {
          "default" = "";
        };
        "status-icons" = {
          "paused" = "";
        };
        "tooltip" = false;
        "ignored-players" = [ "firefox" "kdeconnect" ];
      };

      "wireplumber" = {
        "scroll-step" = 1;
        "on-click" = "pamixer -t";
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = {
          "default" = [ "" "" "" ];
        };
        "tooltip" = true;
        "tooltip-format" = "{volume}%";
      };

      "network" = {
        "format-wifi" = "󰖩 {essid}";
        "format-disconnected" = "󰖪 ";
        "format-ethernet" = "󰀂 ";
        "interval" = 1;
        "tooltop" = true;
        "tooltip-format" = ''
          Strength: {signalStrength}%
          Upload: {bandwidthUpBytes}
          Download: {bandwidthDownBytes}'';
      };

      "backlight" = {
        "device" = "intel_backlight";
        "on-scroll-up" = "light -A 1";
        "on-scroll-down" = "light -U 1";
        "format" = " {percent}%";
      };

      "battery" = {
        "interval" = 10;
        "states" = {
          "warning" = 20;
          "critical" = 10;
        };
        "format" = "{icon} {capacity}%";
        "format-icons" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        "format-full" = "{icon} {capacity}%";
        "format-charging" = "󰂄 {capacity}%";
      };

      "clock" = {
        "interval" = 1;
        "format" = " {:%I:%M}";
        "tooltip" = true;
        "tooltip-format" = "{:%Y-%m-%d %I:%H:%S}";
      };

      "tray" = {
        "icon-size" = 18;
        "spacing" = 5;
      };
    }];
  };
}
