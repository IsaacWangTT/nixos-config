{ pkgs, ... }:
let
  myswaylock = pkgs.writeShellScriptBin "myswaylock" ''
    ${pkgs.swaylock-effects}/bin/swaylock  \
      --hide-keyboard-layout \
      --indicator-radius 100 \
      --indicator-thickness 7 \
      --ring-color cba6f7 \
      --ring-ver-color 89b4fa \
      --ring-wrong-color f38ba8 \
      --ring-clear-color a6e3a1 \
      --key-hl-color 1e1e2e \
      --bs-hl-color eba0ac \
      --text-color 11111b \
      --text-caps-lock-color 11111b \
      --line-color 00000000 \
      --line-ver-color 00000000 \
      --line-wrong-color 00000000 \
      --line-clear-color 00000000 \
      --separator-color 00000000 \
      --inside-color cba6f7 \
      --inside-ver-color 89b4fa\
      --inside-wrong-color f38ba8 \
      --inside-clear-color a6e3a1 \
      --color 1e1e2e80 \
      --clock \
      --indicator
  '';
in
{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      source=~/.config/hypr/themes/mocha.conf

      exec-once = waybar & hyprpaper & mako
      exec-once = swayidle -w timeout 900 'systemctl suspend' before-sleep '${myswaylock}/bin/myswaylock'

      monitor = eDP-1, 1920x1080@144, auto, auto

      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 3
        col.active_border = $blue
        col.inactive_border = $surface0
        cursor_inactive_timeout = 60
      }

      decoration {
        rounding = 10
      }

      animations {
        enabled = true
        bezier = easeInSine, 0.12, 0, 0.39, 0
        bezier = easeOutSine, 0.61, 1, 0.88, 1
        bezier = easeInOutSine, 0.37, 0, 0.63, 1

        animation = windowsIn, 1, 2, easeInSine, slide
        animation = windowsOut, 1, 2, easeOutSine, slide
        animation = windowsMove, 1, 3, easeInSine, popin 80%
        animation = border, 1, 2, easeInSine
        animation = workspaces, 1, 2, easeInOutSine, slidevert
      }

      input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =
        numlock_by_default = true
        sensitivity = 0
        follow_mouse = 1

        touchpad {
          disable_while_typing = true
          natural_scroll = true
        }
      }
      
      gestures {
        workspace_swipe = true
      }

      misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
        mouse_move_enables_dpms = true
        key_press_enables_dpms = true
      }

      $mainMod = SUPER

      bind = $mainMod, B, exec, firefox
      bind = $mainMod, T, exec, kitty
      bind = $mainMod, Q, killactive 
      bind = $mainMod, E, exec, thunar
      bind = $mainMod SHIFT,X, exec, ${myswaylock}/bin/myswaylock
      bind = $mainMod, L, exec, pkill -KILL -u isaac
      bind = $mainMod, V, togglefloating
      bind = $mainMod, A, exec, rofi -show drun
      bind = $mainMod, P, pseudo
      bind = $mainMod, J, togglesplit

      bind = ,Print, exec, grim -g "$(slurp)" $HOME/Pictures/Screenshots/$(date +'%s.png')
      bind = SHIFT, Print, exec, grim $HOME/Pictures/Screenshots/$(date +'%s.png')

      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      bind=,XF86AudioRaiseVolume,exec, pamixer -i 2
      bind=,XF86AudioLowerVolume,exec, pamixer -d 2
      bind=,XF86AudioMute,exec, pamixer -t
      bind=,XF86AudioMicMute,exec, pamixer --default-source -t
      bind=,XF86MonBrightnessUp,exec, light -A 2
      bind=,XF86MonBrightnessDown, exec, light -U 2

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}
