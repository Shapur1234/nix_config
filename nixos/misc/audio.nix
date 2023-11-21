{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ pamixer ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
