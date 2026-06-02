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
    initContent = ''
      _git_branch() {
        local branch dirty
        branch=$(git branch --show-current 2>/dev/null)
        [[ -z $branch ]] && return
        git diff --quiet 2>/dev/null || dirty='*'
        echo " %F{green}$branch%F{yellow}$dirty%f"
      }
      setopt PROMPT_SUBST
      PROMPT='%n%F{red}@%f%m %F{214}%~%f$(_git_branch)
      %(?:%F{green}:%F{red})$%f '
    '';
  };
}
