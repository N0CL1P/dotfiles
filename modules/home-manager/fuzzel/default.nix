{ ... }:
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
        prompt = "";
        placeholder = "";
        icons-enabled = true;
        fields = "filename,name,keywords,comment,categories,generic-name,exec";
        dpi-aware = "no";
        anchor = "center";
        fuzzy = true;
      };

      colors = {
        background = "1e1e1eff";
        text = "d4d4d4ff";
        match = "569cd6ff";
        selection = "264f78ff";
        selection-text = "d4d4d4ff";
        selection-match = "4fc1ffff";
        border = "3c3c3cff";
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
