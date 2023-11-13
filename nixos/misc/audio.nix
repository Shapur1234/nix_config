{
  nixpkgs.config.pulseaudio = true;

  hardware.pulseaudio = {
    enable = true;
    extraConfig = "load-module module-combine-sink";
  };
}
