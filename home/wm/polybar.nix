{ pkgs, ... }:
{
  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      pulseSupport = true;
      i3Support = true;
    };

    script = "polybar main &";

    config =
      let
        colors = {
          bg = "#3c3836";
          fg = "#edbdd2";
          white = "#fbf1c7";
          black = "#1d2021";
          blue = "#83a598";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          cyan = "#8ec07c";
          magenta = "#d3869b";
        };
        font = "JetbrainsMono Nerd Font:style=Medium:size=11;2";
      in
      {
        "bar/main" = {
          width = "100%";
          height = 35;
          radius = 0;
          fixed-center = true;
          monitor = "\${env:MONITOR}";

          background = colors.bg;
          foreground = colors.fg;

          border-size = 1;
          border-color = colors.black;

          padding = 2;
          module-margin = 1;

          font-0 = font;

          modules-left = "nix i3 title";
          modules-center = "time";
          modules-right = "pulseaudio battery xkeyboard";

          wm-restack = "i3";

          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
          tray-position = "right";

          enable-ipc = true;
        };

        "settings" = {
          screenchange-reload = true;
        };
        "global/wm" = {
          margin-top = 2;
          margin-bottom = 2;
        };

        "module/nix" = {
          type = "custom/text";
          content = "";
        };
        "module/i3" = {
          type = "internal/i3";

          ws-num = 10;
          show-all = true;

          ws-icon-0 = "1;1";
          ws-icon-1 = "2;2";
          ws-icon-2 = "3;3";
          ws-icon-3 = "4;4";
          ws-icon-4 = "5;5";
          ws-icon-5 = "6;6";
          ws-icon-6 = "7;7";
          ws-icon-7 = "8;8";
          ws-icon-8 = "9;9";
          ws-icon-9 = "10;10";
          ws-icon-default = "!";

          format = "<label-state>";
          format-background = colors.bg;

          label-focused = "%icon%";
          label-focused-padding = 1;
          label-focused-foreground = colors.yellow;

          label-unfocused = "%icon%";
          label-unfocused-padding = 1;
          label-unfocused-foreground = colors.fg;

          label-visible = "%icon%";
          label-visible-padding = 1;
          label-visible-foreground = colors.yellow;

          label-urgent = "%icon%";
          label-urgent-padding = 1;
          label-urgent-foreground = colors.yellow;
        };
        "module/title" = {
          "type" = "internal/xwindow";
        };
        "module/time" = {
          type = "internal/date";
          interval = "5";

          time = "%H:%M";
          label-foreground = colors.white;
          label = "%time%";
        };
        "module/pulseaudio" = {
          type = "internal/pulseaudio";

          format-volume-prefix = "󰕾 ";
          format-volume-prefix-foreground = colors.fg;
          format-volume = "<label-volume>";

          label-volume = "%percentage%%";

          label-muted = "󰖁";
          label-muted-foreground = colors.red;
        };
        "module/battery" = {
          type = "internal/battery";

          full-at = 98;
          battery = "BAT1";
          adapter = "ACAD";

          label-charging = "󰚥 %percentage%%";
          label-discharging = "󰚦 %percentage%%";
          label-full = "";
          label-low = "";
        };
        "module/xkeyboard" = {
          type = "internal/xkeyboard";

          blacklist-0 = "num lock";
          blacklist-1 = "scroll lock";
          format-prefix = "";
          format-prefix-padding = 1;
          label-layout = "%layout%";
          label-layout-padding = 1;

          label-indicator-foreground = colors.red;
          label-indicator-padding = 1;
        };

      };
  };
}
