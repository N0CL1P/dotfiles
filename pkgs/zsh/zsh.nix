{ ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
        "sudo"
      ];
    };
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -lh --icons --git";
      lt = "eza -lh --icons --git -T";
      vim = "hx";
      x = "hx";
      sx = "doas hx -c ~/.config/helix/config.toml";
      update = "git -C ~/dotfiles add -A && nh os switch";
      nfu = "nix flake update";
      dotfiles-push = "git -C ~/dotfiles add -A && git -C ~/dotfiles commit -m 'update' && git -C ~/dotfiles push";
    };
    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [
        "rm *"
        "pkill *"
        "cp *"
      ];
    };
  };
}
