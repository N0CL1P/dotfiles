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
      ll = "eza -lh --icons --git";
      lt = "eza -lh --icons --git -T";
      svim = "sudo nvim -u ~/.config/nvim/init.lua";
      vim = "nvim";
      update = "nh os switch";
      dotfiles-push = "cp -r /etc/nixos/* ~/dotfiles/ && git -C ~/dotfiles add -A && git -C ~/dotfiles commit -m 'update' && git -C ~/dotfiles push";
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
