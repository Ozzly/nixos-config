{
  description = "it's puff pastry with how flakey it is in here";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  
  outputs = { self, nixpkgs, catppuccin, stylix, home-manager, ... }:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system}; 
    in {

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ 
	  stylix.nixosModules.stylix
	  ./configuration.nix
	];
      };
    };

    homeConfigurations = {
      syl = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
	  ./home.nix
	  catppuccin.homeModules.catppuccin
	];
      };
    };
  };
}
