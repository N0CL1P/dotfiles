{ pkgs, ... }:

{
  imports = [
    ./modules
    ./config
  ];

  home.username = "mollan";
  home.homeDirectory = "/home/mollan";
  home.stateVersion = "26.05";

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
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "WhiteSur-cursors";
    package = pkgs.whitesur-cursors;
    size = 24;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "WhiteSur-cursors";
    XCURSOR_SIZE = "24";
    TERMINAL = "footclient";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    QML2_IMPORT_PATH = "${pkgs.qt6.qtbase}/lib/qt-6/qml:${pkgs.qt6.qtdeclarative}/lib/qt-6/qml";
  };
}
