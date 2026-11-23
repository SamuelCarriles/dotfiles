{
  flake.modules.nixos.keyring = {
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.ly.enableGnomeKeyring = true;
    programs.seahorse.enable = true;
  };
}
