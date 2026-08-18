{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -lh --icons --git";
      la = "eza -lha --icons --git";
      lt = "eza -lh --icons --git -T";
      man = "batman";
      vim = "nvim";
      v = "nvim";
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
