{ vars, ... }:

{
  programs.git = {
    enable = true;
    userName = "${vars.fullName}";
    userEmail = "${vars.email}";
    extraConfig = {
      init.defaultBranch = "main";
      url = {
        "ssh://git@github.com/IsaacWangTT" = {
          insteadOf = "https://github.com/IsaacWangTT";
        };
      };
    };
  };
}
