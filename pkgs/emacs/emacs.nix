{ pkgs, ... }:
{
  programs.emacs = {
  enable = true;
  package = pkgs.emacs-pgtk;
  extraPackages = epkgs: [
    epkgs.doom-themes
    epkgs.treesit-auto
    epkgs.nix-mode
    epkgs.zig-mode
    epkgs.rust-mode
    epkgs.corfu
    epkgs.kind-icon
    epkgs.which-key
    epkgs.sudo-edit
    ];
  };
}
