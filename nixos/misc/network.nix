{
  networking = {
    hostName = "jirka-nixos";
    networkmanager.enable = true;

    enableIPv6 = false;

    firewall = {
      enable = true;
    };
  };

  programs = {
    nm-applet.enable = true;
  };
}
