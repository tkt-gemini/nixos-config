{ ... }:
{
  imports = [
    ./boot.nix
    ./system.nix
    ./network.nix
    ./user.nix
    ./security.nix
    ./nix.nix
    ./utils.nix
  ];
}
