{
  description = "System configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/6713828a351efa628b025a1adf7f43cbf8597513";
  };
  outputs = { nixpkgs, ... }: {
    nixosConfigurations.valkyrie = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
    };
  };
}
