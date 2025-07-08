{
  config,
  lib,
  ...
}: {
  imports = [
    # Choose your theme here:
    ../../themes/nixy.nix
  ];

  config.var = {
    hostname = "nixos";
    username = "blynd";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.dotfiles"; # The path of the nixos configuration directory

    keyboardLayout = "us";

    location = "Bogota";
    timeZone = "America/Bogota";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "es_CO.UTF-8";

    git = {
      username = "wind";
      email = "127568179+bIynd@users.noreply.github.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
