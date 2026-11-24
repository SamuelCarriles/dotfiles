{
  flake.modules.nixos.locale = {
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };

    time.timeZone = "America/Havana";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "es_CU";
      LC_IDENTIFICATION = "es_CU";
      LC_MEASUREMENT = "es_CU";
      LC_MONETARY = "es_CU";
      LC_NAME = "es_CU";
      LC_NUMERIC = "es_CU";
      LC_PAPER = "es_CU";
      LC_TELEPHONE = "es_CU";
      LC_TIME = "es_CU";
    };

  };
}
