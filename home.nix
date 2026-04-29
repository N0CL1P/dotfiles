{ pkgs, ... }:

{
  imports = [
    ./niri.nix
    ./nixvim.nix
    ./kitty.nix
    ./spicetify.nix
    ./zsh.nix
    ./fastfetch/fastfetch.nix
    ./git.nix
    ./dms.nix
    ./river.nix
  ];

  home.username = "mollan";
  home.homeDirectory = "/home/mollan";
  home.stateVersion = "25.05";
  # systemd.user.services.niri-flake-polkit.enable = false;
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
    TERMINAL = "kitty";
  };
}
