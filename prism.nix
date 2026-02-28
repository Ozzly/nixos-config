
{ pkgs, ... }:

let
  nativeLibs = pkgs.lib.makeLibraryPath [
    pkgs.libxtst
    pkgs.libx11
    pkgs.libxi
    pkgs.libxext
  ];
in
{
  programs.prismlauncher = {
    enable = true;
    wrapper = {
      enable = true;
      extraEnv.LD_LIBRARY_PATH = nativeLibs;
    };
  };
}
