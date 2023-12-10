{ pkgs, ... }:
let
  mod = "Mod4";
in
{
  home.packages = with pkgs; [
    arandr
    brightnessctl
    feh
    gnome.gnome-screenshot
  ];

  xsession = {
    numlock.enable = true;

    windowManager.i3 = {
      enable = true;

      config = {
        startup = [
          {
            command = "xrandr --output DP-0.1 --mode 1920x1080 --pos 4480x360 --rotate normal --output DP-0.2 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-0 --off --output DP-1 --off --output HDMI-0 --off --output DP-2 --mode 1920x1080 --pos 0x360 --rotate normal --output eDP-1-0 --off --output DisplayPort-1-0 --off --output DisplayPort-1-1 --off --output DisplayPort-1-2 --off --output DisplayPort-1-3 --off --output DisplayPort-1-4 --off --output DisplayPort-1-5 --off --output DisplayPort-1-6 --off --output DisplayPort-1-7 --off";
            always = true;
            notification = false;
          }
          {
            command = "feh --bg-fill --auto-zoom ~/.background-image";
            always = true;
            notification = false;
          }
          {
            command = "systemctl --user restart polybar";
            always = true;
            notification = false;
          }
          {
            command = "wpctl set-default 54";
            notification = false;
          }
          {
            command = "brightnessctl s 100%";
            notification = false;
          }
        ];

        fonts = {
          names = [ "JetbrainsMono Nerd Font" ];
          size = 11.0;
        };
        colors = {
          background = "fbf1c7";

          focused = {
            background = "#282828";
            border = "#282828";
            childBorder = "#458588";
            indicator = "#83a598";
            text = "#83a598";
          };
          focusedInactive = {
            background = "#282828";
            border = "#282828";
            childBorder = "#5f676a";
            indicator = "#d3869b";
            text = "#ebdbb2";
          };
          unfocused = {
            background = "#282828";
            border = "#1d2021";
            childBorder = "#1d2021";
            indicator = "#282828";
            text = "#ebdbb2";
          };
          urgent = {
            background = "#928364";
            border = "#282828";
            childBorder = "#cc241c";
            indicator = "#cc241c";
            text = "#ebdbb2";
          };
          placeholder = {
            background = "#0c0c0c";
            border = "#8ec07c";
            childBorder = "#1d2021";
            indicator = "#ebdbb2";
            text = "#ebdbb2";
          };
        };
        window = {
          border = 1;
          titlebar = false;
        };

        gaps = {
          inner = 2;
          outer = 2;
        };

        bars = [ ];

        floating = {
          criteria = [{ class = "krunner"; }];
          modifier = "${mod}";
        };

        terminal = "alacritty";

        modifier = "${mod}";
        modes = {
          resize = {
            h = "resize shrink width 10 px or 10 ppt";
            k = "resize grow height 10 px or 10 ppt";
            j = "resize shrink height 10 px or 10 ppt";
            l = "resize grow width 10 px or 10 ppt";

            Escape = "mode default";
            "${mod}+r" = "mode default";
          };
        };

        keybindings = {
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          "${mod}+q" = "kill";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+r" = "mode resize";

          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+r" = "restart";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";
          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          "XF86AudioRaiseVolume" = "exec pamixer -i 5";
          "XF86AudioLowerVolume" = "exec pamixer -d 5";
          "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";

          "XF86MonBrightnessDown" = "exec brightnessctl -q set 10%-";
          "XF86MonBrightnessUp" = "exec brightnessctl -q set +10%";

          "${mod}+d" = "exec rofi -show drun";
          "${mod}+Return" = "exec alacritty";
          "${mod}+Shift+E" = "exec alacritty -e fish -c ya";
          "${mod}+Shift+Escape" = "exec alacritty -e btop";
          "${mod}+Shift+f" = "exec thunar";
          "${mod}+Shift+b" = "exec librewolf";
          "${mod}+Shift+d" = "exec librewolf -new-window https://discord.com/app";
          "${mod}+Shift+t" = "exec librewolf -new-window https://teams.microsoft.com";


          "Print" = "exec gnome-screenshot -w";
        };
      };

      extraConfig = ''
        workspace "1" output eDP-1-0
        workspace "2" output eDP-1-0
        workspace "3" output eDP-1-0
        workspace "4" output eDP-1-0
        workspace "5" output eDP-1-0
        workspace "6" output DP-0.2
        workspace "7" output DP-0.2
        workspace "8" output DP-0.2
        workspace "9" output DP-0.2
        workspace "10" output DP-0.2
      '';
    };
  };
}
