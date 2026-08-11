{ pkgs, ... }:
{
  programs.eww = {
    enable = true;
    systemd.enable = true;
  };

  systemd.user.services.eww.Service.ExecStartPost = "${pkgs.eww}/bin/eww open bar";
}
