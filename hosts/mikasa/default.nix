{ config, pkgs, vars, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
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
    kernelParams = [
      "quiet"
      "splash"
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
    resumeDevice = "/dev/zram0";
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
  };

  boot.plymouth = {
    enable = true;
    themePackages = [ (pkgs.catppuccin-plymouth.override { variant = "mocha"; }) ];
    theme = "catppuccin-mocha";
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
      modesetting.enable = true;
      powerManagement.enable = true;
      prime = {
        offload.enable = true;
        intelBusId = "PCI:0:0:2";
        nvidiaBusId = "PCI:0:1:0";
      };
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    tuxedo-rs = {
      enable = true;
      tailor-gui.enable = true;
    };
    pulseaudio.support32Bit = true;
  };


  environment.systemPackages = with pkgs; [
    nvidia-offload
  ];

  services.daed.enable = true;

  virtualisation.docker = {
    storageDriver = "btrfs";
    enableNvidia = true;
  };

  system.stateVersion = "23.11";
}
