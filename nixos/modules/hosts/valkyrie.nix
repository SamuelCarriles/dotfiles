{ inputs, config, ... }:
let
  nixos = config.flake.modules.nixos;
in
{
  flake.modules.nixos.valkyrie = {
    networking.hostName = "valkyrie";
    system.stateVersion = "26.05";
    imports = [
      ../../hardware-configuration.nix
      nixos.fonts
      nixos.audio
      nixos.networking
      nixos.nix
      nixos.users
      nixos.locale
      nixos.boot
      nixos.keyring
      nixos.hardware
      nixos.apps
      nixos.media
      nixos.shell
      nixos.dev
      nixos.neovim
      nixos.desktop
    ];
  };
  flake.nixosConfigurations.valkyrie = inputs.nixpkgs.lib.nixosSystem {
    modules = [ nixos.valkyrie ];
  };

}
