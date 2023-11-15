{ pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./misc/asus.nix
      ./misc/audio.nix
      ./misc/boot.nix
      ./misc/impermanence.nix
      ./misc/locale.nix
      ./misc/network.nix
      ./misc/nvidia.nix
      ./misc/polkit.nix
      ./misc/printer.nix
      ./misc/thunar.nix
      ./misc/users.nix
      ./misc/x11.nix
    ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";

  environment.systemPackages = with pkgs; [
    unrar
    unzip
    zip
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

  programs = {
    vim.defaultEditor = true;

    git.enable = true;
    fish.enable = true;
    dconf.enable = true;
  };
}
