{
  programs.wlogout.layout = [
    {
      "label" = "lock";
      "action" = "~/.config/hypr/scripts/lock.sh";
      "text" = "Lock";
      "keybind" = "l";
    }
    {
      "label" = "hibernate";
      "action" = "systemctl hibernate";
      "text" = "Hibernate";
      "keybind" = "h";
    }
    {
      "label" = "logout";
      "action" = "pkill -KILL -u $USER";
      "text" = "Logout";
      "keybind" = "e";
    }
    {
      "label" = "shutdown";
      "action" = "systemctl poweroff";
      "text" = "shutdown";
      "keybind" = "s";
    }
    {
      "label" = "suspend";
      "action" = "systemctl suspend";
      "text" = "Suspend";
      "keybind" = "u";
    }
    {
      "label" = "reboot";
      "action" = "systemctl reboot";
      "text" = "Reboot";
      "keybind" = "r";
    }
  ];
}
