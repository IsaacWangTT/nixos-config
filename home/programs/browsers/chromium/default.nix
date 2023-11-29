{ pkgs }:

{
  programs.chromium = {
    enable = true;
    packages = pkgs.ungoogled-chromium;
  };
}
