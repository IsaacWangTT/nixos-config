{ pkgs, launch_waybar, sleep, caffeine, ... }:

let
  backlightOnOff = pkgs.writeShellScriptBin "backlightOnOff" ''
    if [ $(light -s sysfs/leds/rgb:kbd_backlight -G) == 0.00 ]; then
      sleep 0.1 &
      light -s sysfs/leds/rgb:kbd_backlight -S 100.00 &
    else
      sleep 0.1 &
      light -s sysfs/leds/rgb:kbd_backlight -S 0.00 &
    fi
  '';
  touchpadOnOff = pkgs.writeShellScriptBin "touchpadOnOff" ''
    HYPRLAND_DEVICE="syn1221:00-06cb:cd65-touchpad"
    HYPRLAND_VARIABLE="device:$HYPRLAND_DEVICE:enabled"

    if [ -z "$XDG_RUNTIME_DIR" ]; then
      export XDG_RUNTIME_DIR=/run/user/$(id -u)
    fi

    # Check if device is currently enabled (1 = enabled, 0 = disabled)
    DEVICE="$(hyprctl getoption $HYPRLAND_VARIABLE | grep 'int: 1')"

    if [ -z "$DEVICE" ]; then
      hyprctl keyword $HYPRLAND_VARIABLE true
    else
      hyprctl keyword $HYPRLAND_VARIABLE false
    fi
  '';
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
      bind = $mainMod, B, exec, nvidia-offload firefox
      bind = $mainMod, T, exec, kitty
      bind = $mainMod, E, exec, nautilus
      bind = $mainMod SHIFT, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy
      bind = $mainMod, A, exec, rofi -show drun
      bind = $mainMod, L, exec, wlogout --protocol layer-shell
      bind = $mainMod, C, exec, ${caffeine}/bin/caffeine
      bind = $mainMod CTRL, W, exec, ${launch_waybar}/bin/launch_waybar

      #--------#
      # motion #
      #--------#
      bind = $mainMod, Q, killactive 
      bind = $mainMod, F, fullscreen
      bind = $mainMod, V, togglefloating
      bind = $mainMod, J, togglesplit
      bind = $mainMod, P, pseudo

      bind = $mainMod SHIFT, C, exec, hyprpicker -a
      bind = CTRL, F1, exec, grimblast --notify copy area
      bind = CTRL SHIFT, F1, exec, grimblast --notify copysave area $HOME/Pictures/Screenshots/$(date "+%Y-%m-%d"T"%H:%M:%S").png

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
      bind = , XF86TouchpadToggle, exec, ${touchpadOnOff}/bin/touchpadOnOff
      bind = , XF86KbdLightOnOff, exec, ${backlightOnOff}/bin/backlightOnOff
      bindi = , XF86KbdBrightnessUp, exec, light -s sysfs/leds/rgb:kbd_backlight -A 20
      bindi = , XF86KbdBrightnessDown, exec, light -s sysfs/leds/rgb:kbd_backlight -U 20

      #-----------#
      # wallpaper #
      #-----------#
      # $w1 = hyprctl hyprpaper wallpaper "eDP-1, ~/Pictures/Wallpapers/1.jpg"
      # $w2 = hyprctl hyprpaper wallpaper "eDP-1, ~/Pictures/Wallpapers/2.jpg"
      # $w3 = hyprctl hyprpaper wallpaper "eDP-1, ~/Pictures/Wallpapers/3.jpg"
      # $w4 = hyprctl hyprpaper wallpaper "eDP-1, ~/Pictures/Wallpapers/4.jpg"

      #----------------------------------#
      # move window in current workspace #
      #----------------------------------#
      bind = $mainMod SHIFT, left, movewindow, l
      bind = $mainMod SHIFT, right, movewindow, r
      bind = $mainMod SHIFT, up, movewindow, u
      bind = $mainMod SHIFT, down, movewindow, d

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
      exec-once = wl-paste --watch cliphist store
      exec-once = valent --gapplication-service
      exec-once = wlsunset -l 22.5 -L 114.0
      exec-once = ${sleep}/bin/sleep
      exec-once = light -s sysfs/leds/rgb:kbd_backlight -S 0.00
      exec-once = ${launch_waybar}/bin/launch_waybar

      #---------------#
      # resize window #
      #---------------#
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}
