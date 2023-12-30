{ pkgs, ... }:
let
  EasyPulse = pkgs.fetchFromGitHub {
    owner = "p-chan5";
    repo = "EasyPulse";
    rev = "1.2.0";
    hash = "sha256-UaEMlsV1+yNvefA6O8R7hgK2ZJ08zoqj29nzUAOFjmY=";
  };
in
{
  home.file.".config/easyeffects/output" = {
    source = "${EasyPulse}/output";
    recursive = true;
  };
  services.easyeffects = {
    enable = true;
    preset = "classical";
  };
}
