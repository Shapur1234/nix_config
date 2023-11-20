{ pkgs, ... }:
{
  # TODO: Configure

  home.packages = with pkgs; [
    ueberzugpp
  ];

  programs.yazi = {
    enable = true;
  };
}
