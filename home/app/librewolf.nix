{ pkgs, ... }:
{
  home.sessionVariables.DEFAULT_BROWSER = "${pkgs.librewolf}/bin/librewolf";

  programs.librewolf = {
    enable = true;

    settings = {
      "webgl.disabled" = false;
      "identity.fxaccounts.enabled" = true;
      "browser.toolbars.bookmarks.visibility" = "always";
    };
  };
}
