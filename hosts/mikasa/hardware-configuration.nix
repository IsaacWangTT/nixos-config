# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/myLinux";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/efi" =
    {
      device = "/dev/disk/by-uuid/1518-92EC";
      fsType = "vfat";
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-label/myLinuxHome";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/media/windows/c" =
    {
      device = "/dev/disk/by-label/myWindows";
      fsType = "ntfs-3g";
    };

  fileSystems."/media/windows/d" =
    {
      device = "/dev/disk/by-label/myWindowsFile";
      fsType = "ntfs-3g";
    };

  fileSystems."/media/windows/e" =
    {
      device = "/dev/disk/by-label/myWindowsGame";
      fsType = "ntfs-3g";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0f1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
