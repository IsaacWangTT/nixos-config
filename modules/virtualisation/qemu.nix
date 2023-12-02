{ pkgs, vars, ... }:

{
  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
  };

  networking.firewall.trustedInterfaces = [ "virbr0" ];
  users.groups = {
    libvirtd.members = [ "root" "${vars.user}" ];
    kvm.members = [ "root" "${vars.user}" ];
  };
}
