{ pkgs, vars, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      virt-manager
    ];
  };

  virtualisation = {
    libvirtd.enable = true;
  };

  networking.firewall.trustedInterfaces = [ "virbr0" ];
  users.groups.libvirtd.members = [ "${vars.user}" ];
}
