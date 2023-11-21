{
  networking = {
    hostName = "jirka-nixos";
    networkmanager.enable = true;

    # enableIPv6 = false;
  };

  programs.nm-applet.enable = true;
}
