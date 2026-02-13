# ./hosts/hp_zbook_g11/default.nix

{ self, config, pkgs, pkgs-unstable, vars, lib, ... }:
  {
    imports = [
      ./hardware.nix
      ${self}/modules
    ];

    networking.hostName = vars.hostName;
    system.stateVersion = vars.stateVersion;
  }
