{
  home.sessionVariables.BROWSER = "librewolf";

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };
  programs.librewolf = {
    enable = true;

    settings = {
      "webgl.disabled" = false;
      "identity.fxaccounts.enabled" = true;
      "browser.toolbars.bookmarks.visibility" = "always";
    };
  };
}
