{ pkgs, ... }:

{
  home.packages = [ pkgs.flatpak ];

  services.flatpak = {
    enableModule = true;
    packages = [
      "flathub:app/com.github.tchx84.Flatseal/x86_64/stable"
      "flathub:app/com.qq.QQ/x86_64/stable"
      "flathub:app/com.spotify.Client/x86_64/stable"
      "flathub:app/com.mastermindzh.tidal-hifi/x86_64/stable"
    ];
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
  };
}
