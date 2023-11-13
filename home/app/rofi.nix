{ config, ... }:
{
  programs.rofi = {
    enable = true;

    font = "JetBrainsMono Nerd Font 10";
    theme = let inherit (config.lib.formats.rasi) mkLiteral; in
      {
        "*" = {
          background-color = mkLiteral "#282828";
          selected-normal-background = mkLiteral "#fabd2f";
          text-color = mkLiteral "#ebdbb2";
          font = "JetBrainsMono Nerd Font 12";
        };

        "#window" =
          {
            transparency = "real";
            location = mkLiteral "center";
            x-offset = mkLiteral "0%";
            y-offset = mkLiteral "0%";
            height = mkLiteral "620 px";
            orientation = mkLiteral "horizontal";
            padding = mkLiteral "10 px";
            width = mkLiteral "30%";
            border = 1;
            border-color = mkLiteral "#fe8019";
          };
        "#inputbar" =
          {
            border = mkLiteral "1 0 1px 0";
            children = mkLiteral "[prompt,entry]";
          };
        "#prompt" =
          {
            padding = mkLiteral "8 px 16 px 16 px 16 px";
            border = mkLiteral "0 1 px 0 0";
            text-color = mkLiteral "#F7B45E";
            font = "JetBrainsMono Nerd Font 20";
          };
        "#entry" =
          {
            padding = mkLiteral "16 px";
            text-color = mkLiteral "#fabd2f";
            font = "JetBrainsMono Nerd Font  13";
          };
        "#listview" =
          {
            cycle = false;
            margin = mkLiteral "0 0 1 px 0";
            scrollbar = false;
            border-color = mkLiteral "#b8bb26";
          };
        "#element" =
          {
            border = 0;
            padding = mkLiteral "8 px";
          };
        "#element-text" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "#element-icon" =
          {
            background-color = mkLiteral "inherit";
            size = mkLiteral "23 px";
            margin = mkLiteral "0 0 1 px 0";
          };

        "#element selected" =
          {
            background-color = mkLiteral "#fe8019";
            text-color = mkLiteral "#282828";
            border = mkLiteral "0% 0% 0% 0%";
            border-radius = mkLiteral "15 px";
            border-color = mkLiteral "#fe8019";
          };
        "#element.selected.normal" = {
          background-color = mkLiteral "#689d6a";
          text-color = mkLiteral "#282828";
        };
        "#button.selected" = {
          background-color = mkLiteral "#ebdbb2";
          text-color = mkLiteral "#ebdbb2";
        };
      };

    extraConfig = {
      modi = "drun";

      lines = 13;
      show-match = false;
      separator-style = "solid";
      hide-scrollbar = true;
      show-icons = true;
    };
  };
}
