{ inputs, config, ... }:
let
  nixos = config.flake.modules.nixos;
in
{
  flake.modules.nixos.valkyrie = {
    imports = [
      ../../configuration.nix
      nixos.fonts
      nixos.audio
      nixos.networking
      nixos.nix
      nixos.users
      nixos.locale
      nixos.boot
      nixos.keyring
      nixos.hardware
    ];
  };
  flake.nixosConfigurations.valkyrie = inputs.nixpkgs.lib.nixosSystem {
    modules = [ nixos.valkyrie ];
  };

}
