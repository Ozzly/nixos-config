{
  description = "it's puff pastry with how flakey it is in here";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    nvf.url = "github:notashelf/nvf";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  
  outputs = { self, nixpkgs, catppuccin, home-manager, nvf, ... }:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      configModule = {
        config.vim = { 
	  theme.enable = true; 
	};
      };

      customNeovim = nvf.lib.neovimConfiguration {
        inherit pkgs;
	modules = [configModule];
      };
    in {

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };

    homeConfigurations = {
      syl = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
	  ./home.nix
	  catppuccin.homeModules.catppuccin
	  {home.packages = [customNeovim.neovim];}
	];
      };
    };
  };
}
