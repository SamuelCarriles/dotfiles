{
  flake.modules.nixos.dev = { pkgs, ... }: {
    programs.direnv.enable = true; # activar direnv
    environment = {
      localBinInPath = true; # para que los scripts de bbin puedan correr bien
      sessionVariables.NIXOS_OZONE_WL = "1";
      systemPackages = with pkgs; [
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
        unzip
        wget
        curl
        gnutar
        # Cosas de neovim
        lua-language-server
        nil
        stylua
        nixfmt
        clojure-lsp
      ];
    };
  };
}
