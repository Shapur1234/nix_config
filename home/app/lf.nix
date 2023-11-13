{
  programs.lf = {
    enable = true;

    extraConfig = ''
      set shell sh

      set shellopts '-eu'
      set ifs "\n"

      # leave some space at the top and the bottom of the screen
      set scrolloff 4

      # use enter for shell commands
      map <enter> shell

      # execute current file (must be executable)
      map x $$f
      map X !$f
    '';
  };
}
