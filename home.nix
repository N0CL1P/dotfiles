{
  ...
}:

{
  imports = [
    ./niri.nix
    ./rofi.nix
    ./nixvim.nix
    ./kitty.nix
    ./spicetify.nix
    ./zsh.nix
    ./fastfetch.nix
    ./git.nix
  ];

  home.username = "mollan";
  home.homeDirectory = "/home/mollan";
  home.stateVersion = "25.05";

}
