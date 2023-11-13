{
  home.sessionVariables = {
    TERM = "alacritty";
  };

  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };


        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };

        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };

        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
        size = 8;
      };


      colors = {
        cursor = {
          text = "#fbf1c7";
          cursor = "#fabd2f";
        };

        selection = {
          text = "#282828";
          background = "#928374";
        };

        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };

        normal = {
          black = "#282828";
          red = "#cc241c";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#ebdbb2";
        };

        bright = {
          black = "#1d2021";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#fbf1c7";
        };
      };
    };
  };
}
