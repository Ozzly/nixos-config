{ config, pkgs, ... }:

{
    services.mpd = {
        enable = true;
        musicDirectory = "/home/syl/moosic/";

      };
  }
