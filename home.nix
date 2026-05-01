{ pkgs, ... }:

{
  imports = [
    ./pkgs/niri/niri.nix
    ./pkgs/nixvim/nixvim.nix
    ./pkgs/spicetify/spicetify.nix
    ./pkgs/zsh/zsh.nix
    ./pkgs/fastfetch/fastfetch.nix
    ./pkgs/git/git.nix
    ./pkgs/dms/dms.nix
    ./pkgs/river/river.nix
    ./pkgs/yazi/yazi.nix
    ./pkgs/ncmpcpp/ncmpcpp.nix
    ./pkgs/wezterm/wezterm.nix
  ];

  home.username = "mollan";
  home.homeDirectory = "/home/mollan";
  home.stateVersion = "26.05";
  # systemd.user.services.niri-flake-polkit.enable = false;

  services.mpd = {
    enable = true;
    musicDirectory = "/home/mollan/Music";
    network.listenAddress = "127.0.0.1";
    network.port = 6600;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    TERMINAL = "wezterm";
  };
}
