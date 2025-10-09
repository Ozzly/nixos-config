{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./librewolf.nix
    ./hyprpaper.nix
    #./nvf.nix
  ];

  home.username = "syl";
  home.homeDirectory = "/home/syl";
  home.stateVersion = "25.05";
  news.display = "silent";
 
  home.packages = [
    

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    #(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      "vim" = "nvim";
      "vi" = "nvim";
    };

    initContent = "bindkey '^f' autosuggest-accept"; 
    syntaxHighlighting.enable = true;
  };


  # Anki
  programs.anki = {
    enable = false;
    #addons = [
    #  pkgs.ankiAddons.anki-connect
    #  pkgs.ankiAddons.recolor
    #];
  };

  programs.rofi = {
    enable = true;
    theme = "/home/syl/.dotfiles/rofi.rasi";
  };
  
  services.dunst.enable = true; 
  services.mako.enable = true;


  programs.hyprlock.enable = true;

  programs.freetube = {
    enable = false;
    settings = {
      defaultQuality = "1440";
      baseTheme = "catppuccinMocha";
      playnextVideo = "false";
      hideRecommendedVideos = "true";
      region = "GB";
      mainColor = "CatppuccinMochaLavender";
      secColor = "CatppuccinMochaMauve";
      defaultAutoplayInterruptionIntervalHours = "8";
      rememberSearchHistory = "false";
    };
  };


  programs.alacritty = {
    enable = true;
  };

  programs.vesktop = {
    enable = true;
  };

  

  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    clock24 = true;
    baseIndex = 1;
    terminal = "screen-256color";
    shortcut = "a";
    extraConfig = "set-option -ga terminal-overrides \",xterm-256color:Tc\"
                   set-option -a terminal-features \",alacritty:RGB\"";
  };


  programs.obs-studio.enable = true;
  programs.lazygit.enable = true;
  programs.neovim.enable = true;

  catppuccin = {
    tmux.enable = true;
    alacritty.enable = true;
    vesktop.enable = true;
    dunst.enable = true;
    hyprlock.enable = true;
    # nvim.enable = true;
    zsh-syntax-highlighting.enable = true;
    lazygit.enable = true;
    obs.enable = true;
  };



  #home.file.".config/hypr/hyprland.conf".text = '' '' or .source = ./hyprland.conf;

  programs.home-manager.enable = true;
}
