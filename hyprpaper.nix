{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        #"~/.dotfiles/wallpapers/birch.jpg"
	"~/.dotfiles/wallpapers/mangrove.jpg"
	#"~/.dotfiles/wallpapers/swamp.jpg"
	#"~/.dotfiles/wallpapers/three_biomes.jpg"
	#"~/.dotfiles/wallpapers/tower.png"
      ];
      wallpaper = ",~/.dotfiles/wallpapers/mangrove.jpg";
    };
  };
}
