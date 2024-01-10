{
  systemd.services.nix-daemon = {
    environment = {
      TMPDIR = "/var/cache/nix";
    };
    serviceConfig = {
      CacheDirectory = "nix";
    };
  };
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
