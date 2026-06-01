{ ... }:
{
  services.navidrome = {
    enable = true;
    settings.MusicFolder = "/mnt/data/media/Music/Library";
    settings.PlaylistsPath = "/mnt/data/media/Music/Playlists";
    settings.EnableSharing = true;
    settings.BaseUrl = "/navi";
  };
}
