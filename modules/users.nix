{
  config,
  pkgs,
  ...
}: let
  username = config.var.username;
in {
  # programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.nushell;
    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}
