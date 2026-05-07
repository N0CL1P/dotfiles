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
      ll = "ls -l";
      shx = "sudo hx -c ~/.config/helix/config.toml";
      svim = "sudo hx -c ~/.config/helix/config.toml";
      vim = "hx";
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
    initContent = ''
            autoload -Uz colors && colors

            _prompt_first=1
            precmd() {
              if (( _prompt_first )); then
                _prompt_first=0
              else
                print ""
              fi
            }

            _c_reset="%f%b"
            _c_user="%F{cyan}%B"
            _c_at="%F{240}"
            _c_host="%F{cyan}"
            _c_sep="%F{240}"
            _c_dir="%F{blue}%B"
            _c_ok="%F{green}"
            _c_err="%F{red}"

            setopt PROMPT_SUBST
            PROMPT="''${_c_user}%n''${_c_reset}''${_c_at}@''${_c_reset}''${_c_host}%m''${_c_reset} ''${_c_sep}in''${_c_reset} ''${_c_dir}%~''${_c_reset}
      %(?.''${_c_ok}❯''${_c_reset}.''${_c_err}❯''${_c_reset}) "
            RPROMPT='%F{240}%D{%H:%M:%S}%f'
    '';
  };
}
