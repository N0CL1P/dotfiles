{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
    main = {
      layer = "overlay";
      width = 30;
      lines = 15;
      tabs = 8;
      horizontal-pad = 40;
      vertical-pad = 8;
      inner-pad = 0;
      image-size-ratio = 0.5;
      prompt = "» ";
      placeholder = "";
      icons-enabled = true;
      fields = "filename,name,keywords,comment,categories,generic-name,exec";
      dpi-aware = "no";
      anchor = "center";
      fuzzy = true;
    };

  colors = {
    background      = "1e1f22ff"; # фон редактора
    text            = "dfe1e5ff"; # основной текст
    match           = "4d87d4ff"; # совпадающие символы
    selection       = "214283ff"; # фон выбранного элемента
    selection-text  = "dfe1e5ff"; # текст выбранного
    selection-match = "5491d8ff"; # совпадение в выбранном
    border          = "43454aff"; # рамка
    };
    
    border = {
      width = 2;
      radius = 10;
    };

    dmenu = {
      mode = "text";
    };

    key-bindings = {
      cancel = "Escape Control+c Control+g";
      execute = "Return KP_Enter Control+y";
      execute-or-next = "Tab";
      cursor-left = "Left Control+b";
      cursor-right = "Right Control+f";
      cursor-home = "Home Control+a";
      cursor-end = "End Control+e";
      delete-prev = "BackSpace";
      delete-next = "Delete";
      delete-line = "Control+k";
      prev = "Up Control+p";
      next = "Down Control+n";
      page-up = "Page_Up";
      page-down = "Page_Down";
    };

    font = {
      font = "JetBrainsMono Nerd Font:size=12";
    };
  };
  };
}
