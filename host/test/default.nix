# ./host/test/default.nix

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
