{ pkgs, ... }:

{
  home.packages = [ pkgs.flatpak ];

  services.flatpak = {
    enableModule = true;
    packages = [
      "flathub:app/com.github.tchx84.Flatseal//stable"
      "flathub:app/com.qq.QQ//stable"
      "flathub:app/com.spotify.Client//stable"
      "flathub:app/com.mastermindzh.tidal-hifi//stable"
    ];
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
  };
}
