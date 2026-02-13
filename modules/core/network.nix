{ pkgs, vars, ... }:
{
  networking.networkmanager.enable = true;
  networking.hostName = vars.hostName;
}
