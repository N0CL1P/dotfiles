{ ... }:
{
  imports = [
    # gui
    ./telegram-desktop
    ./blender
    ./reaper
    ./inkscape

    # cli/tui
    ./glslviewer
    ./btop
    ./ngrok
    ./wiremix
    ./ouch

    # sys
    ./mesa-demos
    ./vulkan-tools
    ./wl-clipboard
    ./xwayland-satellite

    # lang
    ./rust
    ./zig
  ];
}
