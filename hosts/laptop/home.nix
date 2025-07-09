{
  pkgs,
  config,
  ...
}: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/wezterm
    # ../../home/programs/nvf
    ../../home/programs/shell
    # ../../home/programs/fetch
    ../../home/programs/git
    # ../../home/programs/git/signing.nix
    # ../../home/programs/spicetify
    # ../../home/programs/nextcloud
    # ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/zen
    # ../../home/programs/discord
    # ../../home/programs/tailscale
    # ../../home/programs/anyrun

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    # ../../home/system/hypridle
    # ../../home/system/hyprlock
    # ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    # ../../home/system/wofi
    # ../../home/system/zathura
    # ../../home/system/mime
    ../../home/system/udiskie
    # ../../home/system/clipman
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      bitwarden # Password manager
      vesktop
      #   vlc # Video player
      #   blanket # White-noise app
      #   obsidian # Note taking app
      # planify # Todolists
      #   gnome-calendar # Calendar
      #   textpieces # Manipulate texts
      #   curtail # Compress images
      #   resources
      #   gnome-clocks
      #   gnome-text-editor
      #   mpv # Video player
      #   figma-linux

      # Dev
      #   go
      bun
      nodejs
      #   python3
      #   jq
      #   just
      pnpm
      #   air

      # Utils
      zip
      unzip
      #   optipng
      #   jpegoptim
      btop
      eza
      bat
      fastfetch
      alejandra

      # Backup
      vscode
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
