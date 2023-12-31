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

      #custom-icon,
      #workspaces,
      #cava,
      #mpris,
      #wireplumber,
      #backlight,
      #network,
      #battery,
      #clock,
      #tray {
        background-color: @surface2;
        margin: 7px 0 0 5px;
        padding: 5px 10px;
        border-radius: 1rem;
        border: 2px solid @overlay2;
      }

      #custom-icon {
        color: @text;
        padding-right: 15px;
        margin-left: 7px;
      }

      #workspaces button {
        border-radius: 2rem;
        color: @mauve;
        margin: 5px 0;
        padding: 0 16px 0 12px;
      }

      #workspaces button.active {
        color: @teal;
      }

      #workspaces button:hover {
        color: @rosewater;
      }

      #cava {
        color: @blue;
      }

      #mpris {
        color: @green;
      }

      #mpris.paused {
        color: @red;
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
        margin-right: 7px;
      }

      #tray menu {
        background-color: @surface2;
        border-radius: 1rem;
        border: 2px solid @overlay2;
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
