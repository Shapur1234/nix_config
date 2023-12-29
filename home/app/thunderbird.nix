{ pkgs, ... }:
{
  # TODO: Config through nix

  home.packages = with pkgs; [
    thunderbird
  ];
}
