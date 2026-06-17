{ ... }:
{
  imports = [
    # gui
    ./ayugram-desktop
    ./blender
    ./reaper
    ./inkscape

    # cli/tui
    ./btop
    ./ngrok
    ./wiremix
    ./bluetui
    ./ouch
    ./glslviewer

    # sys
    ./xwayland-satellite
    ./wl-clipboard
    ./mesa-demos
    ./vulkan-tools

    # lang
    ./rust
    ./zig
    ./qtdeclarative
  ];
}
