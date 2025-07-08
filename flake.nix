{
  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    hyprland.url = "github:hyprwm/Hyprland";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
