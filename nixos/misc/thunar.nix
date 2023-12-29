{ pkgs, ... }:
{
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };

  programs.thunar = {
    enable = true;

    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      exo
    ];
  };
}
