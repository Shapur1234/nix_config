{ config, pkgs, lib, ... }:
{
  boot = lib.mkIf config.services.tlp.enable {
    kernelModules = [ "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      vaapiVdpau
    ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  specialisation = {
    iGPU.configuration = {
      system.nixos.tags = [ "iGPU" ];

      services.xserver.videoDrivers = lib.mkForce [ ];

      hardware.nvidia = {
        modesetting.enable = lib.mkForce false;
        powerManagement.enable = lib.mkForce false;
        nvidiaSettings = lib.mkForce false;
      };
    };
  };
}
