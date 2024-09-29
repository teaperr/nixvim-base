{
  description = "Arch Linux flake with Home Manager managing Neovim via Nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05"; # Use the corresponding branch for your NixOS version
    home-manager.url = "github:nix-community/home-manager";
    nixvim.url = "github:nix-community/nixvim/nixos-24.05"; # Match the version with nixpkgs
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, nixvim, catppuccin, ... }: {
    homeConfigurations = {
      lotus = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux"; # Adjust if necessary
        };

        # Home Manager modules
        modules = [
	  catppuccin.homeManagerModules.catppuccin
          nixvim.homeManagerModules.nixvim
          {
            home.username = "lotus";
            home.homeDirectory = "/home/lotus";
            home.stateVersion = "24.05";

            # Enable Nixvim
            programs.nixvim.enable = true;
          }
          ./home-manager/default.nix
        ];
      };
    };
  };
}

