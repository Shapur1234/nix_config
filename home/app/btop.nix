{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_dark";
      vim_keys = true;
      update_ms = 200;

      proc_tree = true;
      proc_gradient = false;
      proc_filter_kernel = true;
    };
  };
}
