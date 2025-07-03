{config, ...}: {
  imports = [
    # Mostly system related configuration
    # ../../modules/intel.nix
    ../../modules/audio.nix
    ../../modules/bluetooth.nix
    ../../modules/fonts.nix
    ../../modules/home-manager.nix
    ../../modules/nix.nix
    ../../modules/systemd-boot.nix
    # ../../modules/sddm.nix
    ../../modules/users.nix
    ../../modules/utils.nix
    # ../../modules/tailscale.nix
    ../../modules/hyprland.nix

    # ../../nixos/omen.nix # For my laptop only

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch this
  system.stateVersion = "25.05";
}
