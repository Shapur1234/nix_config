{ pkgs, ... }:

{
  programs.git-credential-oauth.enable = true;

  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Shapur1234";
    userEmail = "48966182+Shapur1234@users.noreply.github.com";

    extraConfig = {
      credential.helper = [ "cache --timeout=7200" "oauth" ];
    };
  };
}
