{ pkgs, ... }:

{
  programs.starship =
    let
      flavour = "mocha"; # One of `latte`, `frappe`, `macchiato`, or `mocha`
    in
    {
      enable = true;
      enableTransience = true;
      settings = {
        # Other config here
        format = "$all"; # Remove this line to disable the default prompt format
        palette = "catppuccin_${flavour}";

        character = {
          success_symbol = "[[](lavender) ❯](green)";
          error_symbol = "[❯](red)";
          vimcmd_symbol = "[❮](green)";
        };
        directory = {
          truncation_length = 3;
          style = "bold blue";
        };
      } // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f"; # Replace with the latest commit hash
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          } + /palettes/${flavour}.toml));
    };
}
