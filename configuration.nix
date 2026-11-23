# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "valkyrie"; # Define your hostname.

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  services.displayManager.ly.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Install Thunar
  programs.thunar = {
    enable = true;
    plugins = [ pkgs.thunar-volman ];
  };
  services.tumbler.enable = true;
  # Install Niri WM
  programs.niri.enable = true;

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

    phinger-cursors
    yazi
    adw-gtk3
    papirus-icon-theme
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
