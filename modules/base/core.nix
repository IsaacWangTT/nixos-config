{ pkgs, vars, ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.UTF-8";

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.enable = false;
    sudo-rs = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  console = {
    earlySetup = true;
    packages = [ pkgs.terminus_font ];
    font = "ter-u16n";
  };

  services = {
    openssh = {
      enable = true;
    };
    dbus.enable = true;
  };

  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    shells = [ pkgs.fish ];
    systemPackages = with pkgs; [
      # GNU Program Environment
      gcc
      clang
      cmake
      zig
      gdb
      glib
      gnumake

      # System Tools
      git
      wget
      tree
      xdg-utils
      neovim
      neofetch
      nix-output-monitor
      psmisc
      sops

      # File Tools
      p7zip
      unzip
      zip
      rar
      trash-cli
    ];
  };

  programs.fish.enable = true;
  users = {
    mutableUsers = false;
    users = {
      root = {
        initialHashedPassword = "$y$j9T$0zAkIokVEpWcBLVuApCjS0$FKU4.mJaDq2rtO333x7bHYTbE5P/uAPi1xr9kgPYlF8";
      };
      ${vars.user} = {
        initialHashedPassword = "$y$j9T$0zAkIokVEpWcBLVuApCjS0$FKU4.mJaDq2rtO333x7bHYTbE5P/uAPi1xr9kgPYlF8";
        isNormalUser = true;
        description = "${vars.fullName}";
        extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
        shell = pkgs.fish;
      };
    };
  };

  system.stateVersion = "24.05";
}
