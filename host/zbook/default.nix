# ./host/zbook/default.nix

{
  pkgs,
  vars,
  ...
}:
{
  imports = [
    ./hardware.nix
  ];
}
