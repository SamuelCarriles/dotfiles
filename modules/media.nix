{
  flake.modules.nixos.media = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      # video
      mpv
      # images
      imv
      # Audio
      strawberry
    ];
    # Mime defaults
    xdg.mime.enable = true;
    xdg.mime.defaultApplications =
      let
        stb = "org.strawberrymusicplayer.strawberry.desktop";
        imvd = "imv-dir.desktop";
        mpv = "mpv.desktop";
      in
      {
        "image/png" = imvd;
        "image/jpeg" = imvd;
        "image/webp" = imvd;
        "image/gif" = imvd;

        "video/mp4" = mpv;
        "video/x-matroska" = mpv;
        "video/webm" = mpv;
        "video/ts" = mpv;

        "audio/mpeg" = stb;
        "audio/flac" = stb;
        "audio/ogg" = stb;
        "audio/mp4" = stb;
        "audio/x-wav" = stb;
      };

  };
}
