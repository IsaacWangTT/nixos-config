{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  networking.hostName = "mikasa";

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };
      timeout = 10;
    };
    resumeDevice = "/dev/disk/by-label/myLinux";
  };

  boot = {
    kernelParams = [
      "quiet"
      "splash"
      "resume_offset=7611648"
      "nvidia-drm.modest=1"
      "i8042.reset"
      "i8042.nomux"
      "i8042.nopnp"
      "i8042.noloop"
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

  environment.systemPackages = with pkgs; [
    via
  ];

  virtualisation.docker.storageDriver = "btrfs";
}
