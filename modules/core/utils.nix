{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    neovim
    unzip
    zip
    gnumake
    htop
    btop
    fastfetch
    ripgrep
    fd
    jq
    fzf
    dig
  ];
}
