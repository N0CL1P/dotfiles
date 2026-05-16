{ pkgs, ... }:

{
  imports = [
    ./pkgs/niri/niri.nix
    ./pkgs/eza/eza.nix
    ./pkgs/ripgrep/ripgrep.nix
    ./pkgs/fd/fd.nix
    ./pkgs/direnv/direnv.nix
    ./pkgs/nixvim/nixvim.nix
    ./pkgs/obsidian/obsidian.nix
    ./pkgs/spicetify/spicetify.nix
    ./pkgs/zsh/zsh.nix
    ./pkgs/oh-my-posh/oh-my-posh.nix
    ./pkgs/fastfetch/fastfetch.nix
    ./pkgs/git/git.nix
    ./pkgs/dms/dms.nix
    ./pkgs/river/river.nix
    ./pkgs/yazi/yazi.nix
    ./pkgs/ncmpcpp/ncmpcpp.nix
    ./pkgs/kitty/kitty.nix
    ./pkgs/fuzzel/fuzzel.nix
    ./pkgs/zig/zig.nix
    ./pkgs/rust/rustc.nix
    ./pkgs/rust/cargo.nix
    ./pkgs/btop/btop.nix
    ./pkgs/wiremix/wiremix.nix
    ./pkgs/wl-clipboard/wl-clipboard.nix
    ./pkgs/telegram-desktop/telegram-desktop.nix
    ./pkgs/discord/discord.nix
    ./pkgs/libreoffice/libreoffice.nix
    ./pkgs/prismlauncher/prismlauncher.nix
    ./pkgs/keepassxc/keepassxc.nix
    ./pkgs/xwayland-satellite/xwayland-satellite.nix
    ./pkgs/vulkan-tools/vulkan-tools.nix
    ./pkgs/mesa-demos/mesa-demos.nix
    ./pkgs/cursors/cursors.nix
  ];

  home.username = "mollan";
  home.homeDirectory = "/home/mollan";
  home.stateVersion = "26.05";
  # systemd.user.services.niri-flake-polkit.enable = false;

  services = {
    mpd = {
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
    TERMINAL = "kitty";
  };
}
