{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ asusctl ];

  services.supergfxd.enable = true;
  services.asusd = {
    enable = true;
    enableUserService = true;

    asusdConfig = ''
      (
          bat_charge_limit: 90,
          panel_od: false,
          mini_led_mode: false,
          disable_nvidia_powerd_on_battery: false,
          ac_command: "",
          bat_command: "",
      )
    '';
    profileConfig = ''
      (
          active_profile: Performance,
      )
    '';
  };

  # programs.rog-control-center = {
  #   enable = true;
  #   autoStart = true;
  # };
}
