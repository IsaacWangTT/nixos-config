{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  networking.hostName = "mikasa";

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; }
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; }
    ];
  };

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };
      timeout = 10;
    };
    resumeDevice = "/swap/swapfile";
  };

  boot = {
    kernelParams = [
      "quiet"
      "splash"
      "resume_offset=7611648"
      "nvidia-drm.modest=1"
    ];
    supportedFilesystems = [
      "ext4"
      "btrfs"
      "ntfs"
      "fat"
      "vfat"
      "exfat"
    ];
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
  };

  boot.plymouth = {
    enable = true;
    themePackages = [ (pkgs.catppuccin-plymouth.override { variant = "mocha"; }) ];
    theme = "catppuccin-mocha";
  };

  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  };

  virtualisation.docker.storageDriver = "btrfs";
}
