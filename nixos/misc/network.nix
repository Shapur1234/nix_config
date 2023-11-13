{ ... }:

{
  networking.hostName = "jirka-nixos";

  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
}
