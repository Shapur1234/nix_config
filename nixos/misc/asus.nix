{
  services.fwupd.enable = true;

  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
    };
  };

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
      )'';
    profileConfig = ''
      (
          active_profile: Performance,
      )'';
  };
}
