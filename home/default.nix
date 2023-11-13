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
    libreoffice
    pinta
    popsicle
    speedcrunch
    vlc

    cargo
    cargo-flamegraph
    clippy

    python3

    gdb
    llvmPackages.bintools
    unzip
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
}
