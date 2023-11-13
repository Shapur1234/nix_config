{ pkgs, ... }:
{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  imports =
    [
      ./asus.nix
      ./audio.nix
      ./boot.nix
      ./hardware-configuration.nix
      ./impermanence.nix
      ./locale.nix
      ./network.nix
      ./nvidia.nix
      ./polkit.nix
      ./printer.nix
      ./users.nix
      ./weird_apps.nix
    ];

  security = {
    sudo.enable = false;

    doas = {
      enable = true;
      extraRules = [{
        groups = [ "wheel" ];
        persist = true;
        keepEnv = true;
      }];
    };
  };

  nixpkgs.config.allowUnfree = true;
  environment = {
    defaultPackages = [ ];

    systemPackages = with pkgs; [
      llvmPackages.bintools
      lshw
      rsync
      strace
      wget

      cargo
      clang
      gcc
      python3
      rustc
    ];
  };

  programs = {
    vim.defaultEditor = true;

    git.enable = true;
    fish.enable = true;
    dconf.enable = true;
  };

  services = {
    gvfs.enable = true;

    xserver = {
      enable = true;

      excludePackages = with pkgs; [ xterm ];

      dpi = 90;

      desktopManager = {
        xterm.enable = false;
        wallpaper = {
          combineScreens = false;
          mode = "fill";
        };
      };

      displayManager = {
        defaultSession = "none+i3";
      };

      windowManager.i3.enable = true;
    };
  };

  system.stateVersion = "23.11";
}
