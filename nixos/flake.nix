{
  description = "System configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/6713828a351efa628b025a1adf7f43cbf8597513";
    import-tree.url = "github:denful/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
