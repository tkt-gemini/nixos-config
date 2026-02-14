# ./host/test/default.nix

{
  inputs,
  pkgs,
  vars,
  ...
}:
{
  imports = [
    ./hardware.nix
    ../../module/os
  ];
}
