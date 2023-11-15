{ pkgs, ... }:
{
  services.xserver = {
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
}
