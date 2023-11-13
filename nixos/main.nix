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
      ./weird_apps.nix
    ];

  environment.etc."machine-id".source = "/nix/persist/etc/machine-id";

  users.mutableUsers = false;
  users.users.jirka = {
    initialHashedPassword = "$6$9S9qnOWcrUwILNTR$ZVWu7N7vDkAlmz2IddjE1QnTTNk5H65sLfoOX5qlSlNlwJ228Xvc3uNKg051RxbwWUs/IDVnKDIe8YaWuQ4u9/";

    isNormalUser = true;
    description = "Jirka";
    extraGroups = [ "networkmanager" "wheel" ];

    shell = pkgs.fish;
  };
  users.users.root.initialHashedPassword = "$6$LxCWxAlrWNMoSutT$NzuJRDwQpvNHuEmL.Sy7UK58uztTzLpXXZxGgOo3uDD9QrjrLMb7Q5hj8i51T2aE6tJj4unxBkwLnzGwSaTZ/0";

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
      vim

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
