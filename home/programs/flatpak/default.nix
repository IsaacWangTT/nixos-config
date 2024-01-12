{
  services.flatpak = {
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      # System
      "flathub:app/com.github.tchx84.Flatseal//stable"

      # Music
      "flathub:app/com.mastermindzh.tidal-hifi//stable"

      # Messager
      "flathub:app/com.qq.QQ//stable"

      # Study
      "flathub:app/md.obsidian.Obsidian//stable"
    ];
  };
}
