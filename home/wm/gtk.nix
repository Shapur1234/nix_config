{ pkgs, ... }:
{
  home.packages = with pkgs; [ nerdfonts ];


  fonts.fontconfig.enable = true;
  gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };
    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "oomox-gruvbox-dark";
    };
    cursorTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
      size = 25;
    };
  };

  home.pointerCursor = {
    x11.enable = true;
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 25;
  };
}
