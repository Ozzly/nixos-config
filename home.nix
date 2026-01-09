{ config, pkgs, ... }:

{
  imports = [
    #./hyprland.nix
    ./niri/niri.nix
    ./librewolf.nix
    #./nvf.nix
    ./rmpc.nix
    ./mpd.nix
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
  

  services.mako = {
      enable = false;
      settings = {
        border-radius = 8;
        default-timeout = 4000;
        };
    };
  

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
    vencord.settings.plugins = {
        VolumeBooster.enabled = true;
        VolumeBooster.multiplier = 3;
        MessageLogger.enabled = true;
      };
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
    mako.enable = true;
    hyprlock.enable = true;
    # nvim.enable = true;
    zsh-syntax-highlighting.enable = true;
    lazygit.enable = true;
    obs.enable = true;
  };


  programs.swaylock = {
    enable = false;
    settings = {
      color = "1e1e2e00";
      bs-hl-color = "f5e0dc";
      caps-lock-bs-hl-color = "f5e0dc";
      caps-lock-key-hl-color = "a6e3a1";
      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-caps-lock-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";
      key-hl-color = "a6e3a1";
      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = "cdd6f4";
      line-color = "00000000";
      line-clear-color = "00000000";
      line-caps-lock-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      ring-color = "b4befe";
      ring-clear-color = "f5e0dc";
      ring-caps-lock-color = "fab387";
      ring-ver-color = "89b4fa";
      ring-wrong-color = "eba0ac";
      separator-color = "00000000";
      text-color = "cdd6f4";
      text-clear-color = "f5e0dc";
      text-caps-lock-color = "fab387";
      text-ver-color = "89b4fa";
      text-wrong-color = "eba0ac";
    };
  };



  #home.file.".config/hypr/hyprland.conf".text = '' '' or .source = ./hyprland.conf;

  programs.home-manager.enable = true;
}
