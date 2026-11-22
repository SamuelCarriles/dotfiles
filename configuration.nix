# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "valkyrie"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Havana";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CU";
    LC_IDENTIFICATION = "es_CU";
    LC_MEASUREMENT = "es_CU";
    LC_MONETARY = "es_CU";
    LC_NAME = "es_CU";
    LC_NUMERIC = "es_CU";
    LC_PAPER = "es_CU";
    LC_TELEPHONE = "es_CU";
    LC_TIME = "es_CU";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  # Llavero
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.ly.enableGnomeKeyring = true;
  programs.seahorse.enable = true;

  services.displayManager.ly.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."sack" = {
    isNormalUser = true;
    description = "Samuel Carriles";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Install Thunar
  programs.thunar = {
    enable = true;
    plugins = [ pkgs.thunar-volman ];
  };
  services.tumbler.enable = true;
  # Install Niri WM
  programs.niri.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fonts

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    glib
    unzip
    # Dev kit
    git
    lazygit
    gh
    neovim
    clojure
    babashka
    bbin
    temurin-bin-25
    wget
    curl
    gcc
    gnutar
    gnumake
    tree-sitter
    ripgrep
    fd

    alacritty
    carapace
    bat
    xwayland-satellite
    waybar
    noctalia

    chromium
    phinger-cursors
    yazi
    adw-gtk3
    papirus-icon-theme
    proton-vpn
    localsend
    obsidian
    telegram-desktop
    # DAW
    ardour
    # Reproductor de video
    mpv
    # Visualizador de imgs
    imv
    # Reproductor de audio
    strawberry
    # Editor de documentos
    onlyoffice-desktopeditors
    # Cosas de neovim
    lua-language-server
    nil
    stylua
    nixfmt
    clojure-lsp
  ];

  programs.bash = {
    interactiveShellInit = ''
      bind 'set show-all-if-ambiguous on'
      bind 'TAB:menu-complete'
      source <(carapace _carapace bash)
    '';
  };
  environment.localBinInPath = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.variables = {
    EDITOR = "nvim";
    CARAPACE_BRIDGES = "bash";
    CARAPACE_MATCH = "1";
  };

  # Mime defaults
  xdg.mime.enable = true;
  xdg.mime.defaultApplications =
    let
      stb = "org.strawberrymusicplayer.strawberry.desktop";
      imvd = "imv-dir.desktop";
      mpv = "mpv.desktop";
    in
    {
      "image/png" = imvd;
      "image/jpeg" = imvd;
      "image/webp" = imvd;
      "image/gif" = imvd;

      "video/mp4" = mpv;
      "video/x-matroska" = mpv;
      "video/webm" = mpv;

      "audio/mpeg" = stb;
      "audio/flac" = stb;
      "audio/ogg" = stb;
      "audio/mp4" = stb;
      "audio/x-wav" = stb;
    };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
