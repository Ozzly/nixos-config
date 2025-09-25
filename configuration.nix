{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-66da0df4-9177-48b0-a647-5030f652128e".device = "/dev/disk/by-uuid/66da0df4-9177-48b0-a647-5030f652128e";
  
  networking.hostName = "nixos";
  # Enable networking
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocales = [ "ja_JP.UTF-8/UTF-8" ];
  #i18n.extraLocaleSettings = {
  #  LC_ADDRESS = "en_GB.UTF-8";
  #  LC_IDENTIFICATION = "en_GB.UTF-8";
  #  LC_MEASUREMENT = "en_GB.UTF-8";
  #  LC_MONETARY = "en_GB.UTF-8";
  #  LC_NAME = "en_GB.UTF-8";
  #  LC_NUMERIC = "en_GB.UTF-8";
  #  LC_PAPER = "en_GB.UTF-8";
  #  LC_TELEPHONE = "en_GB.UTF-8";
  #  LC_TIME = "en_GB.UTF-8";
  #};


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
  #services.displayManager.sddm.wayland.enable = true;
  #services.displayManager.sddm.enable = true;
  # Enable automatic login for the user.
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "syl";

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;



  

  
  # Setup user syl 
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
    tutanota-desktop
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

    phinger-cursors

    gimp

    scrcpy
  ];

  services.gvfs.enable = true;
  programs.localsend.enable = true;


  # Enabling the thumbnailer
  environment.pathsToLink = [
    "share/thumbnailers"
  ];


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




  services.mullvad-vpn.enable = true;





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


  programs.thunar.enable = true;
  programs.adb.enable = true;


  programs.steam = {
    enable = true;
  };


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
