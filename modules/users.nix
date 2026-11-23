{
  flake.modules.nixos.users = {
    users.users."sack" = {
      isNormalUser = true;
      description = "Samuel Carriles";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };

  };
}
