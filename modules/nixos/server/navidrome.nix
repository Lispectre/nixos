{ pkgs, ... }:
{
  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/mnt/data/media/Music/Library";
      PlaylistsPath = "/mnt/data/media/Music/Playlists";
      EnableSharing = true;
      BaseUrl = "/navi";
    };
  };
  environment.systemPackages = [ pkgs.ffmpeg ];
}
