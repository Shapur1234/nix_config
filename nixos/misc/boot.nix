{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  boot.supportedFilesystems = [ "ntfs" ];

  time.hardwareClockInLocalTime = true;
}
