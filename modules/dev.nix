{
  flake.modules.nixos.dev = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
      lazygit
      gh
      neovim
      clojure
      babashka
      bbin
      temurin-bin-25
      gcc
      gnumake
      tree-sitter
      ripgrep
      fd

    ];
  };
}
