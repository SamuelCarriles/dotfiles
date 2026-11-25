{
  flake.modules.nixos.neovim = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      neovim

      # Formatters
      stylua
      nixfmt

      # LSPs
      nil
      lua-language-server
      clojure-lsp

      # Tools
      tree-sitter

    ];
  };
}
