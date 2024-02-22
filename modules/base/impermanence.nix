{
  systemd.services.nix-daemon = {
    environment.TMPDIR = "/nix/cache";
  };

  systemd.tmpfiles.rules = [
    "d /nix/cache 0755 root root 1d"
  ];

  environment.variables.NIX_REMOTE = "daemon";
  environment = {
    persistence."/nix/persistent" = {
      directories = [
        "/etc/NetworkManager/system-connections"
        "/var/log"
        "/var/lib"
        "/etc/secureboot"
      ];
      files = [
        "/etc/machine-id"
        "/etc/rclone.conf"
      ];
    };
  };
}
