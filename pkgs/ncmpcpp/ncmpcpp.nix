{ ... }:
{
  programs.ncmpcpp = {
    enable = true;
    settings = {
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "Visualizer";
      visualizer_type = "wave";
      media_library_primary_tag = "album_artist";
    };
  };
}
