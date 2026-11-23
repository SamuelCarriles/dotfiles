{
  flake.modules.nixos.shell = { pkgs, ... }: {
    environment = {
      systemPackages = with pkgs; [
        bat
      ];
      variables.EDITOR = "nvim";
    };
    programs.yazi.enable = true;

  };
}
