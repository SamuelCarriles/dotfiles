{
  flake.modules.nixos.hardware = {
    hardware.bluetooth.enable = true;
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
    services.printing.enable = true;
    # Enable touchpad support (enabled default in most desktopManager).
    # services.libinput.enable = true;
  };
}
