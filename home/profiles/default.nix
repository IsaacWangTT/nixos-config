{ inputs, module_args, ... }:

let
  vars = {
    user = "isaac";
    fullName = "Isaac Wang";
    email = "isaacwangtt@gmail.com";
    browser = "firefox";
    terminal = "kitty";
    editor = "nvim";
  };

  homeModules = [
    (import ../. { inherit vars; })
    module_args
    inputs.chaotic.homeManagerModules.default
    inputs.flatpaks.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    inputs.nur.hmModules.nur
  ];

  homeImports = {
    "${vars.user}@mikasa" = [ ./mikasa ] ++ homeModules;
  };
in
{
  imports = [
    {
      _module.args = { inherit homeImports vars; };
    }
  ];
}
