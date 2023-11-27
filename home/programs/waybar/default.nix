{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12pt;
        font-weight: bold;
        border-radius: 0px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      @keyframes blink_red {
        to {
          background-color: rgb(242, 143, 173);
          color: rgb(26, 24, 38);
        }
      }
      .warning, .critical, .urgent {
        animation-name: blink_red;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        margin-left: 5px;
        margin-right: 5px;
        margin-top: 5px;
        background-color: #3b4252;
      }
      #workspaces {
        padding-left: 0px;
        padding-right: 4px;
      }
      #workspaces button {
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 6px;
        padding-right: 6px;
        color:#D8DEE9;
      }
      #workspaces button.active {
        background-color: rgb(181, 232, 224);
        color: rgb(26, 24, 38);
      }
      #workspaces button.urgent {
        color: rgb(26, 24, 38);
      }
      #workspaces button:hover {
        background-color: #B38DAC;
        color: rgb(26, 24, 38);
      }
      tooltip {
        background: #3b4253;
      }
      tooltip label {
        color: #E4E8EF;
      }
      #custom-launcher {
        font-size: 20px;
        padding-left: 8px;
        padding-right: 6px;
        color: #7ebae4;
      }
      #clock, #memory, #temperature, #cpu, #temperature, #backlight, #pulseaudio, #network, #battery {
        padding-left: 10px;
        padding-right: 10px;
      }
      #memory {
        color: #8EBBBA;
      }
      #cpu {
        color: #B38DAC;
      }
      #clock {
        color: #E4E8EF;
      }
      #temperature {
        color: #80A0C0;
      }
      #backlight {
        color: #A2BD8B;
      }
      #pulseaudio {
        color: #E9C98A;
      }
      #network {
        color: #99CC99;
      }

      #network.disconnected {
        color: #CCCCCC;
      }
      #battery.charging, #battery.full, #battery.discharging {
        color: #CF876F;
      }
      #battery.critical:not(.charging) {
        color: #D6DCE7;
      }
      #tray {
        padding-right: 8px;
        padding-left: 10px;
      }
      #tray menu {
        background: #3b4252;
        color: #DEE2EA;
      }
    '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        "temperature"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "pulseaudio"
        "backlight"
        "memory"
        "cpu"
        "network"
        "battery"
        "tray"
      ];
      "custom/launcher" = {
        "format" = " ";
        "on-click" = "rofi -show drun";
        "tooltip" = false;
      };
      "hyprland/workspaces" = {
        "format" = "{name}";
        "on-click" = "activate";
        "persistent_workspaces" = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
        };
      };
      "backlight" = {
        "device" = "intel_backlight";
        "on-scroll-up" = "light -A 5";
        "on-scroll-down" = "light -U 5";
        "format" = "{icon} {percent}%";
        "format-icons" = [ "󰃝" "󰃞" "󰃟" "󰃠" ];
      };
      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = {
          "default" = [ "" "" "" ];
        };
        "on-click" = "pamixer -t";
        "tooltip" = false;
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
        "tooltip" = false;
      };
      "clock" = {
        "interval" = 1;
        "format" = " {:%I:%M %p %b %d}";
        "tooltip" = true;
        "tooltip-format" = "<tt>{calendar}</tt>";
      };
      "memory" = {
        "interval" = 1;
        "format" = "󰍛 {percentage}%";
        "states" = {
          "warning" = 85;
        };
      };
      "cpu" = {
        "interval" = 1;
        "format" = "󰻠 {usage}%";
      };
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰀂 {ifname} ({ipaddr})";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        "tooltip" = false;
      };
      "temperature" = {
        "tooltip" = false;
        "format" = " {temperatureC}°C";
      };
      "tray" = {
        "icon-size" = 15;
        "spacing" = 5;
      };
    }];
  };
}
