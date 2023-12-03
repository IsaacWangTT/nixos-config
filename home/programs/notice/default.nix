{
  services.mako = {
    enable = true;
    font = "Iosevka Nerd Font 12";
    width = 256;
    height = 500;
    margin = "10";
    padding = "5";
    borderSize = 2;
    borderRadius = 10;
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
    borderColor = "#89b4fa";
    progressColor = "over #313244";
    defaultTimeout = 5000;
    extraConfig = ''
      text-alignment=center
      [urgency=high]
      border-color=#f38ba8
    '';
  };
}
