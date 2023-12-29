{ pkgs, ... }:
{
  imports = [
    ./app/alacritty.nix
    ./app/btop.nix
    ./app/fish.nix
    ./app/git.nix
    ./app/gitui.nix
    ./app/helix.nix
    ./app/librewolf.nix
    ./app/rofi.nix
    ./app/thunderbird.nix
    ./app/yazi.nix
    ./misc/thunar.nix
    ./wm/gtk.nix
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
    cargo
    rustc
    python3

    neofetch

    libreoffice
    pinta
    speedcrunch
    vlc
    xarchiver
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
}
