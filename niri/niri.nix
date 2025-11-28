{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  niri
  ];
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  }
