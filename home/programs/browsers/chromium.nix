{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform-hint=auto"
      "--ozone-platform=wayland"
      "--enable-wayland-ime"
    ];
    extensions = [
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # Tampermonkey
      { id = "iaiomicjabeggjcfkbimgmglanimpnae"; } # Tab Session Manager
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
    ];
  };
}
