{ pkgs, ... }:
{
  home.packages = with pkgs; [ qt6.qtdeclarative ];
}
