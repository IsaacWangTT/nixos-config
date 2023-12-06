{ pkgs, ... }:

{
  home.packages = [ pkgs.flatpak ];

  services.flatpak = {
    enableModule = true;
    packages = [
      # Settings
      "flathub:app/com.github.tchx84.Flatseal/x86_64/stable"
      "flathub:app/com.usebottles.bottles/x86_64/stable"

      # Messages
      "flathub:app/com.qq.QQ/x86_64/stable"

      # Music
      "flathub:app/com.spotify.Client/x86_64/stable"
      "flathub:app/com.mastermindzh.tidal-hifi/x86_64/stable"

      # Development
      "flathub:app/com.jetbrains.CLion/x86_64/stable"
      "flathub:app/com.jetbrains.DataGrip/x86_64/stable"
      "flathub:app/com.jetbrains.IntelliJ-IDEA-Ultimate/x86_64/stable"
      "flathub:app/com.jetbrains.PyCharm-Professional/x86_64/stable"

      # Others
      "flathub:app/md.obsidian.Obsidian/x86_64/stable"
    ];
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
  };
}
