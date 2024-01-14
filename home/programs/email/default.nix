{ vars, ... }:

{
  accounts.email.accounts.${vars.user} = {
    primary = true;
    address = "${vars.email}";
    realName = "${vars.fullName}";
    thunderbird.enable = true;
  };

  imports = [
    ./thunderbird.nix
  ];
}
