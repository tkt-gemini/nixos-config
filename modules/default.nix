# ./modules/default.nix

{ self, ... }:
  {
    imports = [
      ./core
      ./hardware
      ./programs
    ];
  }

