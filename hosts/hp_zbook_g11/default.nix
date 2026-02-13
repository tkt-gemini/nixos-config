# ./hosts/hp_zbook_g11/default.nix

{ config, pkgs, pkgs-unstable, vars, lib, ... }:
  {
    imports = [
      ./hardware.nix

      # core modules
      ../../modules/core/boot.nix
      ../../modules/core/network.nix
      ../../modules/core/user.nix

      # driver modules
      ../../modules/hardware/nvidia.nix
      ../../modules/hardware/sound.nix
      ../../modules/hardware/bluetooth.nix

      # software modules
      ../../modules/programs/docker.nix
      ../../modules/programs/fonts.nix
      ../../modules/programs/steam.nix
    ];

    networking.hostName = vars.hostname;
    time.timeZone = vars.timezone;
    i18n.defaultLocale = vars.locale;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    programs.hyprland.enable = true; 

    environment.systemPackages = with pkgs; [
      vim
      wget
      curl
      git
    ];

    system.stateVersion = vars.state-version;
  }
