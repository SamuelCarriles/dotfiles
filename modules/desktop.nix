{
  flake.modules.nixos.desktop = { pkgs, ... }: {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = false;

    services.displayManager.ly.enable = true;
    services.udisks2.enable = true;
    services.gvfs.enable = true;

    programs.thunar = {
      enable = true;
      plugins = [ pkgs.thunar-volman ];
    };
    services.tumbler.enable = true;

    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      alacritty
      xwayland-satellite
      waybar
      noctalia
      phinger-cursors
      adw-gtk3
      papirus-icon-theme
      glib
    ];

  };
}
