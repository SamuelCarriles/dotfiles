{
  flake.modules.nixos.apps = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      chromium
      obsidian
      telegram-desktop
      proton-vpn
      localsend
      onlyoffice-desktopeditors
      ardour
    ];
  };
}
