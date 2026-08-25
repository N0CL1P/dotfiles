{ pkgs, ... }:
{
  home.packages = with pkgs; [ graphite ];
}
