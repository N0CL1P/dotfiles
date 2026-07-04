{ pkgs, ... }:
{
  home.packages = with pkgs; [ bat-extras.batman ];
}
