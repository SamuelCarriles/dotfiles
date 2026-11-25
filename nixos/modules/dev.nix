{
  flake.modules.nixos.dev = { pkgs, ... }: {
    programs.direnv.enable = true; # activar direnv
    environment = {
      localBinInPath = true; # para que los scripts de bbin puedan correr bien
      systemPackages = with pkgs; [
        # Git
        git
        lazygit
        gh

        # Clojure
        clojure
        babashka
        bbin
        temurin-bin-25

        # Compilación
        gcc
        gnumake

        # Búsqueda
        ripgrep
        fd

        # Descargas y archivos
        unzip
        wget
        curl
        gnutar
      ];
    };
  };
}
