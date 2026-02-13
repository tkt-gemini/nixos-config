{ pkgs, vars, ... }:
{
  users.users.${vars.username} = {
    isNormalUser = true;
    description = vars.fullName;
    extraGroups = [
      "networkmanager" # adjust wifi/Network
      "wheel"          # used sudo
      "video"          # adjust brightness, screen
      "audio"          # adjust the sound
    ];
    shell = pkgs.zsh;
    /*
    WARN: Don't set hashedPassword here.
    Use the `passwd` command after installation is complete.
    The initial passwd is "nixos":
    */
    initialPassword = "nixos";
  };

  programs.zsh.enable = true;
}
