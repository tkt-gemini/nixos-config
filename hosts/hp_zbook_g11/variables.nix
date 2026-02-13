# ./hosts/hp_zbook_g11/variables.nix

{
  username = "gemini";
  fullName = "Khanh-Toan Tran"; 
  hostName = "hp_zbook_g11";
  system = "x86_64-linux";
  stateVersion = "25.11";
  git = {
    name = "tkt-gemini";
    email = "tkt310505@gmail.com";
    editor = "nvim";
    defaultBranch = "main";
  };
  timeZone = "Asia/Bangkok";
  defaultLocale = "en_US.UTF-8";
}
