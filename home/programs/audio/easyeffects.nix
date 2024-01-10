{ pkgs, ... }:
let
  Microphone = pkgs.fetchurl {
    url = "https://github.com/jtrv/.cfg/raw/morpheus/.config/easyeffects/input/fifine_male_voice_noise_reduction.json";
    hash = "sha256-sXW+fXvG4eCj3AOSejFob4dFB92IYlCJ1U2QMM9N3KA=";
  };
  EasyPulse = pkgs.fetchFromGitHub {
    owner = "p-chan5";
    repo = "EasyPulse";
    rev = "1.2.0";
    hash = "sha256-UaEMlsV1+yNvefA6O8R7hgK2ZJ08zoqj29nzUAOFjmY=";
  };
in
{
  home.file = {
    ".config/easyeffects/input/fifine_male_voice_noise_reduction.json".source = Microphone;
    ".config/easyeffects/output" = {
      source = "${EasyPulse}/output";
      recursive = true;
    };
  };
  services.easyeffects = {
    enable = true;
    preset = "classical";
  };
}
