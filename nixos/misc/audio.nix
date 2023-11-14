{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ pulseaudio ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
