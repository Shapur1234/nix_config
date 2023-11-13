{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xclip

    black
    ltex-ls
    marksman
    nil
    nixpkgs-fmt
    nodePackages.bash-language-server
    nodePackages_latest.pyright
    nodePackages.prettier
    nodePackages.yaml-language-server
    rust-analyzer
    rustfmt
    shfmt
    taplo
  ];

  programs.helix = {
    enable = true;

    defaultEditor = true;

    settings =
      {
        theme = "gruvbox";

        editor = {
          line-number = "relative";
        };
      };

    languages = {
      language = [
        {
          name = "bash";
          auto-format = true;
          formatter = { command = "${pkgs.shfmt}/bin/shfmt"; };
        }
        {
          name = "css";
          auto-format = true;
          formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "css" ]; };
        }
        {
          name = "html";
          auto-format = true;
          formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "html" ]; };
        }
        {
          name = "javascript";
          auto-format = true;
          formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "typescript" ]; };
        }
        {
          name = "json";
          auto-format = true;
          formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "json" ]; };
        }
        {
          name = "markdown";
          auto-format = true;
          formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "markdown" ]; };
        }
        {
          name = "nix";
          auto-format = true;
          formatter = { command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt"; };
        }
        {
          name = "python";
          auto-format = true;
          formatter = { command = "${pkgs.black}/bin/black"; args = [ "--quiet" "-" ]; };
          #   language-server = { command = "pyright-langserver"; args = [ "--stdio" ]; };
        }
        {
          name = "typescript";
          auto-format = true;
          formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "typescript" ]; };
        }
        {
          name = "yaml";
          auto-format = true;
          formatter = { command = "${pkgs.nodePackages.prettier}/bin/prettier"; args = [ "--parser" "yaml" ]; };
        }
      ];
    };

  };
}
