# ./home/default.nix

{ config, pkgs, pkgs-unstable, inputs, vars, ... }:
  {
    imports = [
      ./gui/hyprland/default.nix
      ./gui/shell/default.nix
      ./terminal/neovim/default.nix
      ./terminal/shell/zsh.nix
      ./workflow/ai-tools.nix
    ];

    home.username = vars.username;
    home.homeDirectory = "/home/${vars.username}";
    home.stateVersion = vars.state-version;
    home.packages = [
      pkgs-unstable.ghostty
      pkgs-unstable.pixi
    ];
  }

