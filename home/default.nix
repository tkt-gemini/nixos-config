# ./home/default.nix

{ self, config, pkgs, unstable, inputs, vars, ... }:
  {
    imports = [
      ${self}/home/gui
      ${self}/home/terminal
      ${self}/home/workflow
    ];

    home.username = vars.username;
    home.homeDirectory = "/home/${vars.username}";
    home.stateVersion = vars.stateVersion;
    home.packages = [
      pkgs-unstable.ghostty
      pkgs-unstable.pixi
    ];
  }

