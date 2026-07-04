{ ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultOptions = [
      "--preview-window=right:60%:wrap"
    ];

    fileWidget.options = [
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];

    changeDirWidget.options = [
      "--preview 'eza --tree --color=always --level=2 {}'"
    ];
  };
}
