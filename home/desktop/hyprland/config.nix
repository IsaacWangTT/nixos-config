{ pkgs, ... }:

let
  scripts = import ./scripts/launch_waybar.nix { inherit pkgs; };
in
{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      source=~/.config/hypr/themes/mocha.conf

      monitor = eDP-1, 1920x1080@144, auto, auto

      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 3
        col.active_border = $blue
        col.inactive_border = $surface0
        cursor_inactive_timeout = 60
        layout = dwindle
      }
      
      dwindle {
        pseudotile = true
        preserve_split = true
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

      #----------#
      # software #
      #----------#
      bind = $mainMod, B, exec, firefox
      bind = $mainMod, T, exec, kitty
      bind = $mainMod, E, exec, thunar
      bind = $mainMod, A, exec, rofi -show drun
      bind = $mainMod, L, exec, wlogout --protocol layer-shell

      #--------#
      # motion #
      #--------#
      bind = $mainMod, Q, killactive 
      bind = $mainMod, F, fullscreen
      bind = $mainMod, V, togglefloating
      bind = $mainMod, J, togglesplit
      bind = $mainMod, P, pseudo

      bind = ,Print, exec, grim -g "$(slurp)" $HOME/Pictures/Screenshots/$(date +'%s.png')
      bind = SHIFT, Print, exec, grim $HOME/Pictures/Screenshots/$(date +'%s.png')

      #------------#
      # move focus #
      #------------#
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      #----------------------------#
      # control volume, brightness #
      #----------------------------#
      bindi = , XF86AudioRaiseVolume, exec, pamixer -i 2
      bindi = , XF86AudioLowerVolume, exec, pamixer -d 2
      bind = , XF86AudioMute, exec, pamixer -t
      bindi = , XF86MonBrightnessUp, exec, light -A 2
      bindi = , XF86MonBrightnessDown, exec, light -U 2

      #-------------------#
      # switch workspaces #
      #-------------------#
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
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      #-----------------------------------#
      # move active window to a workspace #
      #-----------------------------------#
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

      #------------#
      # auto start #
      #------------#
      exec-once = hyprpaper & mako
      exec = ${scripts.launch_waybar}/bin/launch_waybar

      #---------------#
      # resize window #
      #---------------#
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}
