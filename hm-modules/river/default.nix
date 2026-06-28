{ ... }:
{
  wayland.windowManager.river = {
    enable = true;
    settings = {
      map.normal = {
        "Super+D" = "spawn rofi -show drun";
        "Super+Q" = "close";
        "Super+T" = "ghostty";
      };
      border-width = 2;
      background-color = "0x002b36";
      # input, border-width, focus и прочее
    };
    extraConfig = ''
      	#!/bin/sh
      	rivercarro -inner-gaps 8 -outer-gaps 8 &
    '';
  };
}
