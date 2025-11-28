{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-66da0df4-9177-48b0-a647-5030f652128e".device = "/dev/disk/by-uuid/66da0df4-9177-48b0-a647-5030f652128e";
  
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocales = [ "ja_JP.UTF-8/UTF-8" ];
  console.keyMap = "uk";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };

    autoLogin = {
      enable = true;
      user = "syl";
    };
  }; 


  users.users.syl = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "syl";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    vesktop
    kitty
    pass
    grim
    slurp
    swappy
    gnupg
    pinentry-tty
    wl-clipboard
    prismlauncher
    rofi
    yubikey-manager
    signal-desktop
    syncthing
    pavucontrol
    vscode
    nodejs
    tree
    gdk-pixbuf # Thumbnailer
    libnotify # Notifications
    imagemagick # Convert image filetypes
    unzip
    qbittorrent
    brave
    vlc
    gimp
    scrcpy
    kdePackages.kdenlive
    ripgrep
    caligula
    zoxide
    anki
    ffmpeg
    unrar
    p7zip
  ];

  services.printing.enable = true;
  services.mullvad-vpn.enable = true;
  services.gvfs.enable = true;
  programs.localsend.enable = true;
  programs.thunar.enable = true;
  programs.adb.enable = true;
  programs.steam.enable = true;

  # Enabling the thumbnailer
  environment.pathsToLink = [ "share/thumbnailers" ];

  # Zsh
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # Git
  programs.git = {
    enable = true;
    config = {
      user.name = "ozzly";
      user.email = "gpg@ozzly.net";
      init.defaultBranch = "main";
    };
  };
  
  # GPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  # Enable smart card support
  services.pcscd.enable = true;
  # Yubikey personalisation tool
  services.udev.packages = [ pkgs.yubikey-personalization ];


  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
  ];

  # Pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # Enable nvidia driver
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;


  system.stateVersion = "24.11"; 
}
