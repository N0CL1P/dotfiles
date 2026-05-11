{ pkgs, ... }:
{
  programs.emacs = {
  enable = true;
  package = pkgs.emacs-pgtk;
  extraPackages = epkgs: with epkgs; [
    doom-themes
    doom-modeline
    treesit-auto
    nix-mode
    zig-mode
    rust-mode
    corfu
    kind-icon
    cape
    vertico
    orderless
    marginalia
    consult
    magit
    sudo-edit
    ];
  };
}
