{ pkgs, ... }:

{
  imports = [
    ./pkgs/niri/niri.nix
    ./pkgs/eza/eza.nix
    ./pkgs/ripgrep/ripgrep.nix
    ./pkgs/fd/fd.nix
    ./pkgs/cava/cava.nix
    ./pkgs/direnv/direnv.nix
    ./pkgs/helix/helix.nix
    ./pkgs/obsidian/obsidian.nix
    ./pkgs/spicetify/spicetify.nix
    ./pkgs/mpv/mpv.nix
    ./pkgs/imv/imv.nix
    ./pkgs/reaper/reaper.nix
    ./pkgs/inkscape/inkscape.nix
    ./pkgs/glslviewer/glslviewer.nix
    ./pkgs/zsh/zsh.nix
    ./pkgs/oh-my-posh/oh-my-posh.nix
    ./pkgs/fastfetch/fastfetch.nix
    ./pkgs/git/git.nix
    ./pkgs/ngrok/ngrok.nix
    ./pkgs/dms/dms.nix
    ./pkgs/river/river.nix
    ./pkgs/yazi/yazi.nix
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
    ./pkgs/onlyoffice/onlyoffice.nix
    ./pkgs/prismlauncher/prismlauncher.nix
    ./pkgs/keepassxc/keepassxc.nix
    ./pkgs/xwayland-satellite/xwayland-satellite.nix
    ./pkgs/vulkan-tools/vulkan-tools.nix
    ./pkgs/mesa-demos/mesa-demos.nix
  ];

  home.username = "mollan";
  home.homeDirectory = "/home/mollan";
  home.stateVersion = "26.05";
  # systemd.user.services.niri-flake-polkit.enable = false;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "WhiteSur-cursors";
    package = pkgs.whitesur-cursors;
    size = 24;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "WhiteSur-cursors";
    XCURSOR_SIZE = "24";
    TERMINAL = "kitty";
  };
}
