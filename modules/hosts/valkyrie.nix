{ inputs, config, ... }: {
  flake.modules.nixos.valkyrie = {
    imports = [
      ../../configuration.nix
    ];
  };
  flake.nixosConfigurations.valkyrie = inputs.nixpkgs.lib.nixosSystem {
    modules = [ config.flake.modules.nixos.valkyrie ];
  };

}
