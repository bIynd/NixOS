{pkgs, ...}: {
  programs = {
    carapace.enable = true;
    carapace.enableFishIntegration = true;

    nushell = {
      enable = true;

      plugins = with pkgs.nushellPlugins; [
        # skim
        query
        gstat
        polars
      ];

      extraConfig = let
        conf = builtins.toJSON {
          show_banner = false;
          edit_mode = "vi";

          ls.clickable_links = true;
          #   rm.always_trash = true;

          table = {
            mode = "rounded";
            index_mode = "always";
            header_on_separator = false;
          };

          cursor_shape = {
            vi_insert = "line";
            vi_normal = "block";
          };

          display_errors = {
            exit_code = false;
          };

          menus = [
            {
              name = "completion_menu";
              only_buffer_difference = false;
              marker = "? ";
              type = {
                layout = "columnar"; # list, description
                columns = 4;
                col_padding = 2;
              };
              #   style = {
              # text = "magenta";
              # selected_text = "blue_reverse";
              # description_text = "yellow";
              #   };
            }
          ];
        };
        completions = let
          completion = name: ''
            source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/${name}/${name}-completions.nu
          '';
        in
          names:
            builtins.foldl'
            (prev: str: "${prev}\n${str}") ""
            (map completion names);
      in ''
        $env.config = ${conf};

        ${completions ["git" "nix" "man" "rg"]}

        # use ${pkgs.nu_scripts}/share/nu_scripts/modules/background_task/task.nu
        # source ${pkgs.nu_scripts}/share/nu_scripts/modules/formats/from-env.nu

        # const path = "~/.nushellrc.nu"
        # const null = "/dev/null"
        # source (if ($path | path exists) {
        #     $path
        # } else {
        #     $null
        # })
      '';

      shellAliases = {
        # Salida y limpieza rápida
        q = "exit";
        c = "clear";

        # Nix
        nixremove = "nix-store --gc";
        bloat = "nix path-info -Sh /run/current-system";
        cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
        listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";

        # Build system
        switch-build = "sudo nixos-rebuild switch --flake .dotfiles/.";
        test-build = "sudo nixos-rebuild test --flake .dotfiles/.";

        # Git
        g = "git";

        # Archivos (eza)
        ls = "eza -h --git --icons --color=auto --group-directories-first -s extension";
        ll = "eza -lF --time-style=long-iso --icons";
        tree = "eza --tree --icons";

        # Cat moderno
        cat = "bat --theme=base16 --number --color=always --paging=never --tabs=2 --wrap=never";
      };

      environmentVariables = {
        SHELL = "${pkgs.nushell}/bin/nu";
        EDITOR = "code";
        # VISUAL = "hx";
      };
    };
  };
}
