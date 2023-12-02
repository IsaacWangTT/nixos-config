{
  programs.waybar = {
    style = ''
      @import "./themes/mocha.css";

      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 15px;
        font-weight: bold;
      }

      .warning,
      .critical,
      .urgent {
        background-color: @red;
      }

      window#waybar {
        background-color: transparent;
      }

      #workspaces {
        border: 2px solid @overlay2;
        border-radius: 2rem;
        background-color: @surface2;
        margin: 7px 3px 0 7px;
      }

      #workspaces button {
        border-radius: 2rem;
        color: @mauve;
        margin: 5px 2px;
        padding: 0 12px;
        padding-right: 18px;
      }

      #workspaces button.active {
        color: @teal;
      }

      #workspaces button:hover {
        color: @rosewater;
      }

      #custom-icon,
      #window,
      #wireplumber,
      #backlight,
      #network,
      #battery,
      #clock,
      #tray {
        background-color: @surface2;
        margin: 7px 3px 0px 7px;
        padding: 10px 10px;
        border-radius: 1rem;
        border: 2px solid @overlay2;
      }

      #custom-icon {
        color: @text;
        padding-right: 15px;
      }

      #window {
        color: @peach;
      }

      #wireplumber {
        color: @blue;
      }

      #wireplumber.muted {
        color: @red;
      }

      #backlight {
        color: @lavender;
      }

      #network {
        color: @sapphire;
      }

      #network.disconnected {
        color: @red;
      }

      #battery {
        color: @green;
      }

      #clock {
        color: @sky;
      }

      #tray {
        padding: 0 7px;
      }

      #tray menu {
        background-color: @surface2;
      }

      #tray menu > * {
        color: @text;
      }

      tooltip {
        background-color: @surface2;
        border: 2px solid @overlay2;
      }

      tooltip label {
        color: @text;
      }
    '';
  };
}
