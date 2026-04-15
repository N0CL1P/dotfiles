{
  ...
}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "./fastfetch/NixOS.png";
        padding = {
          right = 1;
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "de"
        "wm"
        "wmtheme"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "localip"
        "battery"
        "poweradapter"
        "break"
        "colors"
      ];
    };
  };
}
