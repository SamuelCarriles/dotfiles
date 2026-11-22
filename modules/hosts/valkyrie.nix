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
    ];
  };
  flake.nixosConfigurations.valkyrie = inputs.nixpkgs.lib.nixosSystem {
    modules = [ nixos.valkyrie ];
  };

}
