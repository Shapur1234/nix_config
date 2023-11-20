{
  # TODO: Config

  programs.fish = {
    enable = true;

    interactiveShellInit = "set fish_greeting";

    functions = {
      ya = {
        body = ''
          	set tmp (mktemp -t "yazi-cwd.XXXXX")
          	yazi --cwd-file="$tmp"
          	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          		cd -- "$cwd"
          	end
          	rm -f -- "$tmp"
        '';
      };
    };
  };
}
