{ pkgs, ... }:
{
  imports = [
    ./app/alacritty.nix
    ./app/btop.nix
    ./app/fish.nix
    ./app/git.nix
    ./app/helix.nix
    ./app/lazygit.nix
    ./app/lf.nix
    ./app/librewolf.nix
    ./app/rofi.nix
    ./misc/thunar.nix
    ./wm/i3.nix
    ./wm/polybar.nix
  ];

  home = {
    username = "jirka";
    homeDirectory = "/home/jirka";
    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;

  services.network-manager-applet.enable = true;

  home.packages = with pkgs; [
    arandr
    brightnessctl
    cargo-flamegraph
    clippy
    feh
    gdb
    gnome.gnome-screenshot
    libreoffice
    neofetch
    nerdfonts
    pinta
    popsicle
    ripgrep
    speedcrunch
    unzip
    vlc
    xclip
    zip
  ];

  home = {
    file = {
      ".background-image" = {
        source = ../misc/wallpaper.png;
      };

      ".config/SpeedCrunch/SpeedCrunch.ini" = {
        source = ../misc/SpeedCrunch.ini;
      };

      ".config/rog/rog-control-center.cfg" = {
        source = ../misc/rog-control-center.cfg;
      };
    };
  };

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
