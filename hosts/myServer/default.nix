{ config, pkgs, vars, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  networking.hostName = "myServer";

  boot = {
    loader.efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };
    kernelParams = [
      "quiet"
      "splash"
    ];
    kernelPackages = pkgs.linuxKernel.packages.linux_hardened_latest;
  };

  system.stateVersion = "24.05";
}
